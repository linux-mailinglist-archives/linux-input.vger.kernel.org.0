Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7046F216
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2019 09:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfGUHFa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Jul 2019 03:05:30 -0400
Received: from chill.innovation.ch ([216.218.245.220]:35928 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfGUHFa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Jul 2019 03:05:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by chill.innovation.ch (Postfix) with ESMTP id 983EF640132;
        Sun, 21 Jul 2019 00:05:29 -0700 (PDT)
X-Virus-Scanned: amavisd-new at 
Received: from chill.innovation.ch ([127.0.0.1])
        by localhost (chill.innovation.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id ddd7W7VEkNcP; Sun, 21 Jul 2019 00:05:27 -0700 (PDT)
From:   =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch 40BE46400F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1563692727;
        bh=d6idk/JjJstaHfFhGVbLpByhYJGT/ImpgZswxKGb8yQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Zs3mVH5DmFyogUKDQCAoLmIkGX+EgSVLoPQxDpkiePXEQH7C0NXiQdjyHF+CuxzMS
         rUCIYKPILLZjt0xaEUt47QYC86vsVxAFZ1+tNlbIjoJK6pQgwaCQbQBykSfNahFsW4
         BqR9OrzNufu3VSHL/yCBiBIOv70qvyQdyOwJyexl/TJ2W8ySiwe68zCWE+Hzd+zEDX
         PCnSXEcXcEYIvzz1L+zcsZaOgFX8uvtkdz6RNjt8r//UibglX/S1UAs2iTgT8ELyQd
         +lnr+RzTBE5z38O3/BkXOwnY2oCQzUvv7mSP/fo04fSQtowzDdQwdnzdaITUoFDtLm
         JgxZWIfh+YndQ==
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mao Wenan <maowenan@huawei.com>,
        Federico Lorenzi <federico@travelground.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: applespi - register touchpad device synchronously in probe
Date:   Sun, 21 Jul 2019 00:05:23 -0700
Message-Id: <20190721070523.24695-1-ronald@innovation.ch>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This allows errors during registration to properly fail the probe
function.

Doing this requires waiting for a response from the device inside the
probe function. While this generally takes about 15ms, in case of errors
it could be arbitrarily long, and hence a 3 second timeout is used.

This also adds 3 second timeouts to the drain functions to avoid the
potential for suspend or remove hanging forever.

Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
---
Changes in v2:
  merged the two wait-queue's into one

 drivers/input/keyboard/applespi.c | 132 +++++++++++++++++++++++-------
 1 file changed, 103 insertions(+), 29 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index 548737e7aeda..d5defdefbc34 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -48,12 +48,12 @@
 #include <linux/efi.h>
 #include <linux/input.h>
 #include <linux/input/mt.h>
+#include <linux/jiffies.h>
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/spi/spi.h>
 #include <linux/wait.h>
-#include <linux/workqueue.h>
 
 #include <asm/barrier.h>
 #include <asm/unaligned.h>
@@ -405,13 +405,19 @@ struct applespi_data {
 
 	struct led_classdev		backlight_info;
 
+	wait_queue_head_t		wait_queue;
+
 	bool				suspended;
 	bool				drain;
-	wait_queue_head_t		drain_complete;
 	bool				read_active;
 	bool				write_active;
 
-	struct work_struct		work;
+	struct applespi_complete_info {
+		void				(*complete)(void *context);
+		struct applespi_data		*applespi;
+	}				spi_complete[2];
+	bool				cancel_spi;
+
 	struct touchpad_info_protocol	rcvd_tp_info;
 
 	struct dentry			*debugfs_root;
@@ -593,13 +599,61 @@ static void applespi_setup_write_txfrs(struct applespi_data *applespi)
 	spi_message_add_tail(st_t, msg);
 }
 
+static bool applespi_async_outstanding(struct applespi_data *applespi)
+{
+	return applespi->spi_complete[0].complete ||
+	       applespi->spi_complete[1].complete;
+}
+
+static void applespi_async_complete(void *context)
+{
+	struct applespi_complete_info *info = context;
+	struct applespi_data *applespi = info->applespi;
+	unsigned long flags;
+
+	info->complete(applespi);
+
+	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+
+	info->complete = NULL;
+
+	if (applespi->cancel_spi && !applespi_async_outstanding(applespi))
+		wake_up_all(&applespi->wait_queue);
+
+	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
+}
+
 static int applespi_async(struct applespi_data *applespi,
 			  struct spi_message *message, void (*complete)(void *))
 {
-	message->complete = complete;
-	message->context = applespi;
+	struct applespi_complete_info *info;
+	int sts;
+
+	if (applespi->cancel_spi) {
+		if (!applespi_async_outstanding(applespi))
+			wake_up_all(&applespi->wait_queue);
+		return -ESHUTDOWN;
+	}
+
+	/*
+	 * There can only be at most 2 spi requests in flight, one for "reads"
+	 * and one for "writes".
+	 */
+	if (!applespi->spi_complete[0].complete)
+		info = &applespi->spi_complete[0];
+	else
+		info = &applespi->spi_complete[1];
+	info->complete = complete;
+	info->applespi = applespi;
+
+	message->complete = applespi_async_complete;
+	message->context = info;
+
+	sts = spi_async(applespi->spi, message);
+	if (sts)
+		info->complete = NULL;
 
-	return spi_async(applespi->spi, message);
+	return sts;
 }
 
 static inline bool applespi_check_write_status(struct applespi_data *applespi,
@@ -663,7 +717,7 @@ static int applespi_setup_spi(struct applespi_data *applespi)
 		return sts;
 
 	spin_lock_init(&applespi->cmd_msg_lock);
-	init_waitqueue_head(&applespi->drain_complete);
+	init_waitqueue_head(&applespi->wait_queue);
 
 	return 0;
 }
@@ -713,7 +767,7 @@ static void applespi_msg_complete(struct applespi_data *applespi,
 		applespi->write_active = false;
 
 	if (applespi->drain && !applespi->write_active)
-		wake_up_all(&applespi->drain_complete);
+		wake_up_all(&applespi->wait_queue);
 
 	if (is_write_msg) {
 		applespi->cmd_msg_queued = false;
@@ -1011,7 +1065,7 @@ static void report_tp_state(struct applespi_data *applespi,
 	const struct applespi_tp_info *tp_info = &applespi->tp_info;
 	int i, n;
 
-	/* touchpad_input_dev is set async in worker */
+	/* touchpad_input_dev is set async in probe */
 	input = smp_load_acquire(&applespi->touchpad_input_dev);
 	if (!input)
 		return;	/* touchpad isn't initialized yet */
@@ -1315,26 +1369,14 @@ applespi_register_touchpad_device(struct applespi_data *applespi,
 	return 0;
 }
 
-static void applespi_worker(struct work_struct *work)
-{
-	struct applespi_data *applespi =
-		container_of(work, struct applespi_data, work);
-
-	applespi_register_touchpad_device(applespi, &applespi->rcvd_tp_info);
-}
-
 static void applespi_handle_cmd_response(struct applespi_data *applespi,
 					 struct spi_packet *packet,
 					 struct message *message)
 {
 	if (packet->device == PACKET_DEV_INFO &&
 	    le16_to_cpu(message->type) == 0x1020) {
-		/*
-		 * We're not allowed to sleep here, but registering an input
-		 * device can sleep.
-		 */
 		applespi->rcvd_tp_info = message->tp_info;
-		schedule_work(&applespi->work);
+		wake_up_all(&applespi->wait_queue);
 		return;
 	}
 
@@ -1408,7 +1450,7 @@ static void applespi_got_data(struct applespi_data *applespi)
 			applespi->read_active = false;
 			applespi->write_active = false;
 
-			wake_up_all(&applespi->drain_complete);
+			wake_up_all(&applespi->wait_queue);
 		}
 
 		spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
@@ -1623,6 +1665,7 @@ static int applespi_probe(struct spi_device *spi)
 	struct applespi_data *applespi;
 	acpi_handle spi_handle = ACPI_HANDLE(&spi->dev);
 	acpi_status acpi_sts;
+	unsigned long flags;
 	int sts, i;
 	unsigned long long gpe, usb_status;
 
@@ -1641,8 +1684,6 @@ static int applespi_probe(struct spi_device *spi)
 
 	applespi->spi = spi;
 
-	INIT_WORK(&applespi->work, applespi_worker);
-
 	/* store the driver data */
 	spi_set_drvdata(spi, applespi);
 
@@ -1770,6 +1811,22 @@ static int applespi_probe(struct spi_device *spi)
 	/* trigger touchpad setup */
 	applespi_init(applespi, false);
 
+	/* set up the touchpad as a separate input device */
+	sts = wait_event_timeout(applespi->wait_queue,
+				 applespi->rcvd_tp_info.model_no,
+				 msecs_to_jiffies(3000));
+	if (!sts) {
+		dev_err(&applespi->spi->dev,
+			"Timed out waiting for device info\n");
+		sts = -ETIMEDOUT;
+		goto cancel_spi;
+	}
+
+	sts = applespi_register_touchpad_device(applespi,
+						&applespi->rcvd_tp_info);
+	if (sts)
+		goto cancel_spi;
+
 	/*
 	 * By default this device is not enabled for wakeup; but USB keyboards
 	 * generally are, so the expectation is that by default the keyboard
@@ -1820,6 +1877,19 @@ static int applespi_probe(struct spi_device *spi)
 	}
 
 	return 0;
+
+cancel_spi:
+	acpi_disable_gpe(NULL, applespi->gpe);
+	acpi_remove_gpe_handler(NULL, applespi->gpe, applespi_notify);
+
+	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+	applespi->cancel_spi = true;
+	wait_event_lock_irq(applespi->wait_queue,
+			    !applespi_async_outstanding(applespi),
+			    applespi->cmd_msg_lock);
+	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
+
+	return sts;
 }
 
 static void applespi_drain_writes(struct applespi_data *applespi)
@@ -1829,8 +1899,10 @@ static void applespi_drain_writes(struct applespi_data *applespi)
 	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
 
 	applespi->drain = true;
-	wait_event_lock_irq(applespi->drain_complete, !applespi->write_active,
-			    applespi->cmd_msg_lock);
+	wait_event_lock_irq_timeout(applespi->wait_queue,
+				    !applespi->write_active,
+				    applespi->cmd_msg_lock,
+				    msecs_to_jiffies(3000));
 
 	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
 }
@@ -1841,8 +1913,10 @@ static void applespi_drain_reads(struct applespi_data *applespi)
 
 	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
 
-	wait_event_lock_irq(applespi->drain_complete, !applespi->read_active,
-			    applespi->cmd_msg_lock);
+	wait_event_lock_irq_timeout(applespi->wait_queue,
+				    !applespi->read_active,
+				    applespi->cmd_msg_lock,
+				    msecs_to_jiffies(3000));
 
 	applespi->suspended = true;
 
-- 
2.21.0

