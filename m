Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80FC86BA10
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 12:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfGQKYs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 06:24:48 -0400
Received: from chill.innovation.ch ([216.218.245.220]:53104 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfGQKYr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 06:24:47 -0400
Date:   Wed, 17 Jul 2019 03:24:47 -0700
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch 15B3E6401B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1563359087;
        bh=OIi2y8DJM1QpzkNPf58qu6SO8gCiBNYE4u+h1NdvTrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bI9vVuT2Nefftswj9uxaYncp0AXCxPqRLKvz7KZQMKOfblNqqnkfSRtpzQMfdNfhe
         2cDxtaFLoEIBb6hWvDjbHmrj3S/daw4F58W/CQ0t3osJene6T3a7/VYGgOt1TVyQVp
         fYfKEpTgS2z6KlTKmF0RyHDFUXpVAa44PZtJTwBgiXns4i+Kjj2kZPD8HPa2r7wWEx
         QsG7Cw/Km4L00WR2ch8oAAdxt4vxwxxYaGB1IwVKfccADMOvU9AZaRTYrlgfSDIZKq
         8xyBIVLakdIPKPnw/3MB7OEGfbBD+Ahbzw03viupmtyZcBliJKTlc6DgzochaTa7i6
         Lxsp/Mi3UH09w==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Federico Lorenzi <federico@travelground.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] Input: add Apple SPI keyboard and trackpad driver.
Message-ID: <20190717102447.GA16737@innovation.ch>
References: <20190419081926.13567-1-ronald@innovation.ch>
 <20190419081926.13567-3-ronald@innovation.ch>
 <20190716184744.GC1140@penguin>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190716184744.GC1140@penguin>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


  Hi Dmitry,

thanks for taking a look at this!

On Tue, Jul 16, 2019 at 08:47:44PM +0200, Dmitry Torokhov wrote:
> Hi Ronald,
> 
> On Fri, Apr 19, 2019 at 01:19:26AM -0700, Ronald Tschalär wrote:
> > The keyboard and trackpad on recent MacBook's (since 8,1) and
> > MacBookPro's (13,* and 14,*) are attached to an SPI controller instead
> > of USB, as previously. The higher level protocol is not publicly
> > documented and hence has been reverse engineered. As a consequence there
> > are still a number of unknown fields and commands. However, the known
> > parts have been working well and received extensive testing and use.
> > 
> > In order for this driver to work, the proper SPI drivers need to be
> > loaded too; for MB8,1 these are spi_pxa2xx_platform and spi_pxa2xx_pci;
> > for all others they are spi_pxa2xx_platform and intel_lpss_pci. For this
> > reason enabling this driver in the config implies enabling the above
> > drivers.
> 
> I applied the patch (but changed __u8 to u8 as that's preferred form for
> inside the kernel, and added error handling for input_mt_init_slots) but
> we need to do some more work on the driver.

Looks good.

> My main issue is with registering touchpad device asynchronously,
> independent from the probe() function. This means (as far as I can tell)
> that any error is not really appropriately handled (as by that time it
> is too late to signal errors from probe()) and devm functions are not
> going to be called, leaving remnants of the resources in memory on
> driver unload. It also brings in issues with suspend/resume (what
> happens if you suspend really quickly while device is not registered
> yet?), etc, etc.

Yes, the lack of error propagation also bothered me a bit when I
introduced the dev-info command, but I thought doing synchronous
I/O operations in a probe function wasn't kosher. Happy to rectify
that though.

> Can we switch to calling DEV_INFO command synchronously from probe()? If
> we are concerned about it taking relatively long time we can always
> annotate the driver as having probe_type = PROBE_PREFER_ASYNCHRONOUS so
> that other devices can be probed simultaneously with applespi.

Normally the dev-info retrieval takes about 15ms - I presume that's
fast enough?

Attached is a patch that does this now (on top of your changes above).
The cancelling of outstanding spi requests in the error case is a bit
ugly (I wish there were an exported spi-flush/spi-wait-for-queue-empty
function or similar), but otherwise it's fairly straightforward.


  Cheers,

  Ronald


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="0001-Input-applespi-register-touchpad-device-synchronousl.patch"
Content-Transfer-Encoding: 8bit

From a03a7b42ac6ea0707165c8beba04c722984064be Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>
Date: Wed, 17 Jul 2019 02:46:57 -0700
Subject: [PATCH] Input: applespi - register touchpad device synchronously in
 probe.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows errors during registration to properly fail the probe
function.

Doing this requires waiting for a response from the device inside the
probe function. While this generally takes about 15ms, in case of errors
it could be arbitrarily long, and hence a 3 second timeout is used.

This also adds 3 second timeouts to the drain functions to avoid the
potential for suspend or remove hanging forever.

Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
---
 drivers/input/keyboard/applespi.c | 125 ++++++++++++++++++++++++------
 1 file changed, 100 insertions(+), 25 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index 548737e7aeda..81a733a6ba1a 100644
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
@@ -411,7 +411,13 @@ struct applespi_data {
 	bool				read_active;
 	bool				write_active;
 
-	struct work_struct		work;
+	struct applespi_complete_info {
+		void				(*complete)(void *context);
+		struct applespi_data		*applespi;
+	}				spi_complete[2];
+	bool				cancel_spi;
+
+	wait_queue_head_t		tp_info_complete;
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
+		wake_up_all(&applespi->drain_complete);
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
+			wake_up_all(&applespi->drain_complete);
+		return -ESHUTDOWN;
+	}
+
+	/*
+	 * There can only be at max 2 spi requests in flight, one for "reads"
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
@@ -664,6 +718,7 @@ static int applespi_setup_spi(struct applespi_data *applespi)
 
 	spin_lock_init(&applespi->cmd_msg_lock);
 	init_waitqueue_head(&applespi->drain_complete);
+	init_waitqueue_head(&applespi->tp_info_complete);
 
 	return 0;
 }
@@ -1011,7 +1066,7 @@ static void report_tp_state(struct applespi_data *applespi,
 	const struct applespi_tp_info *tp_info = &applespi->tp_info;
 	int i, n;
 
-	/* touchpad_input_dev is set async in worker */
+	/* touchpad_input_dev is set async in probe */
 	input = smp_load_acquire(&applespi->touchpad_input_dev);
 	if (!input)
 		return;	/* touchpad isn't initialized yet */
@@ -1315,26 +1370,14 @@ applespi_register_touchpad_device(struct applespi_data *applespi,
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
+		wake_up_all(&applespi->tp_info_complete);
 		return;
 	}
 
@@ -1623,6 +1666,7 @@ static int applespi_probe(struct spi_device *spi)
 	struct applespi_data *applespi;
 	acpi_handle spi_handle = ACPI_HANDLE(&spi->dev);
 	acpi_status acpi_sts;
+	unsigned long flags;
 	int sts, i;
 	unsigned long long gpe, usb_status;
 
@@ -1641,8 +1685,6 @@ static int applespi_probe(struct spi_device *spi)
 
 	applespi->spi = spi;
 
-	INIT_WORK(&applespi->work, applespi_worker);
-
 	/* store the driver data */
 	spi_set_drvdata(spi, applespi);
 
@@ -1770,6 +1812,22 @@ static int applespi_probe(struct spi_device *spi)
 	/* trigger touchpad setup */
 	applespi_init(applespi, false);
 
+	/* set up the touchpad as a separate input device */
+	sts = wait_event_timeout(applespi->tp_info_complete,
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
@@ -1820,6 +1878,19 @@ static int applespi_probe(struct spi_device *spi)
 	}
 
 	return 0;
+
+cancel_spi:
+	acpi_disable_gpe(NULL, applespi->gpe);
+	acpi_remove_gpe_handler(NULL, applespi->gpe, applespi_notify);
+
+	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+	applespi->cancel_spi = true;
+	wait_event_lock_irq(applespi->drain_complete,
+			    !applespi_async_outstanding(applespi),
+			    applespi->cmd_msg_lock);
+	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
+
+	return sts;
 }
 
 static void applespi_drain_writes(struct applespi_data *applespi)
@@ -1829,8 +1900,10 @@ static void applespi_drain_writes(struct applespi_data *applespi)
 	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
 
 	applespi->drain = true;
-	wait_event_lock_irq(applespi->drain_complete, !applespi->write_active,
-			    applespi->cmd_msg_lock);
+	wait_event_lock_irq_timeout(applespi->drain_complete,
+				    !applespi->write_active,
+				    applespi->cmd_msg_lock,
+				    msecs_to_jiffies(3000));
 
 	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
 }
@@ -1841,8 +1914,10 @@ static void applespi_drain_reads(struct applespi_data *applespi)
 
 	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
 
-	wait_event_lock_irq(applespi->drain_complete, !applespi->read_active,
-			    applespi->cmd_msg_lock);
+	wait_event_lock_irq_timeout(applespi->drain_complete,
+				    !applespi->read_active,
+				    applespi->cmd_msg_lock,
+				    msecs_to_jiffies(3000));
 
 	applespi->suspended = true;
 
-- 
2.21.0


--qDbXVdCdHGoSgWSk--
