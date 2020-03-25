Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51AF7192A00
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgCYNf7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:35:59 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53226 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbgCYNf6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:35:58 -0400
IronPort-SDR: 70VLNJ5YxgDUzSQOgdqBDWGJ9o68R0RCsvMCwf/ji2HMPxJOTizgj84RnZ8Beq5TGiMz22N8dZ
 g1mcEfGcfj97tnBaV4S0BJpYtIrKgnOyl3AaXy0qNr5lm3JhgWU5DirwBkfwWbMga0hg8EaAoi
 fYI0hDFWIWs7ZohUTS9SZtNxmg0vlBAyP7sAOrzz1V759EmRLrrWSD52k7fOrEjDb3UY3vJui1
 t4lZY1lS4ZEy5RdwebipqINY6QSqpYCQegL0ETmCMlePUg/JiP1wws7M0bHAUTrv23pXzU0NnU
 xx4=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099735"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:35:40 -0800
IronPort-SDR: JsR3m79H+zAzcJPXg7wvtMkGox5EWdBEIxS1Zpw2VxAjkK91V5plZLPkU7rYBIgNXJsvDr2BXT
 rO1N5ST/ChQZCekNONOZcVf0399lLlWMVWbz9gSWm4wP9t3EghtcyWIrVOtf6Dxj6uq2ohOAsi
 N/LtU/k0dbMd49mgVfTA9vxmeg6Cqtf5w0lG7sFRm6wQ4yPJgYtiJdn5HLDG3GPpIOn7kKS8rd
 hnZWJeUVvqRmwb5FPKeQtdm9SR+UFIupCWVAKrHxYFuKpj+tDY0LFSAnSNz47dzdYCnY2ttnSp
 hAY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 30/55] Input: atmel_mxt_ts - make bootloader interrupt driven
Date:   Wed, 25 Mar 2020 06:33:09 -0700
Message-ID: <20200325133334.19346-31-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Make bootloader interrupt driven

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 67a3eea0cfc724c3c2a7410ac064f74227c7c6ef)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Replace two use msecs_to_jiffies() instead of HZ,
	remove check of &data->flash->work
	don't poll to call mxt_check_bootloader() in mxt_check_bootloader()]
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 127 ++++++++++-------------
 1 file changed, 57 insertions(+), 70 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ed142b24d12d..62f11afb26ae 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -27,6 +27,7 @@
 #include <linux/gpio/consumer.h>
 #include <asm/unaligned.h>
 #include <linux/regulator/consumer.h>
+#include <linux/workqueue.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
@@ -218,6 +219,7 @@ enum t100_type {
 #define MXT_REGULATOR_DELAY	150	/* msec */
 #define MXT_CHG_DELAY		100	/* msec */
 #define MXT_POWERON_DELAY	150	/* msec */
+#define MXT_BOOTLOADER_WAIT	36E5	/* 1 minute */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -299,6 +301,7 @@ struct mxt_fw_frame {
 
 /* Firmware update context */
 struct mxt_flash {
+	struct mxt_data *data;
 	const struct firmware *fw;
 	struct mxt_fw_frame *frame;
 	loff_t pos;
@@ -306,8 +309,8 @@ struct mxt_flash {
 	unsigned int count;
 	unsigned int retry;
 	u8 previous;
-	bool complete;
-	bool wait;
+	struct completion flash_completion;
+	struct delayed_work work;
 };
 
 /* Each client has this additional data */
@@ -356,6 +359,7 @@ struct mxt_data {
 	char *cfg_name;
 	const char *pcfg_name;
 	const char *input_name;
+	struct mxt_flash *flash;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -600,35 +604,19 @@ static int mxt_write_firmware_frame(struct mxt_data *data, struct mxt_flash *f)
 				   f->frame_size);
 }
 
-static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
+static int mxt_check_bootloader(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
+	struct mxt_flash *f = data->flash;
 	u8 state;
 	int ret;
 
-	if (f->wait) {
-		/*
-		 * In application update mode, the interrupt
-		 * line signals state transitions. We must wait for the
-		 * CHG assertion before reading the status byte.
-		 * Once the status byte has been read, the line is deasserted.
-		 */
-		ret = mxt_wait_for_completion(data, &data->chg_completion,
-					      MXT_FW_CHG_TIMEOUT);
-		if (ret) {
-			/*
-			 * TODO: handle -ERESTARTSYS better by terminating
-			 * fw update process before returning to userspace
-			 * by writing length 0x000 to device (iff we are in
-			 * WAITING_FRAME_DATA state).
-			 */
-			dev_warn(dev, "Update wait error %d\n", ret);
-			return ret;
-		}
+	/* Handle interrupt after download/flash process */
+	if (f->pos >= f->fw->size) {
+		complete(&f->flash_completion);
+		return 0;
 	}
 
-	f->wait = false;
-
 	ret = mxt_bootloader_read(data, &state, 1);
 	if (ret)
 		return ret;
@@ -643,7 +631,6 @@ static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 		ret = mxt_send_bootloader_cmd(data, true);
 		if (ret)
 			return ret;
-		f->wait = true;
 
 		break;
 
@@ -657,14 +644,11 @@ static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 		if (ret)
 			return ret;
 
-		f->wait = true;
-
 		break;
 
 	case MXT_FRAME_CRC_CHECK:
 		if (f->previous != MXT_WAITING_FRAME_DATA)
 			goto unexpected;
-		f->wait = true;
 		break;
 
 	case MXT_FRAME_CRC_PASS:
@@ -675,16 +659,13 @@ static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 		f->retry = 0;
 		f->pos += f->frame_size;
 		f->count++;
-		f->wait = true;
 
-		if (f->pos >= f->fw->size) {
-			f->complete = true;
+		if (f->pos >= f->fw->size)
 			dev_info(dev, "Sent %u frames, %zu bytes\n",
 				f->count, f->fw->size);
-		} else if (f->count % 50 == 0) {
+		else if (f->count % 50 == 0)
 			dev_dbg(dev, "Sent %u frames, %lld/%zu bytes\n",
 				f->count, f->pos, f->fw->size);
-		}
 
 		break;
 
@@ -697,7 +678,6 @@ static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 		/* Back off by 20ms per retry */
 		dev_dbg(dev, "Bootloader frame CRC failure\n");
 		f->retry++;
-		f->wait = true;
 		msleep(f->retry * 20);
 		break;
 
@@ -1415,7 +1395,11 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 
 	if (data->in_bootloader) {
 		complete(&data->chg_completion);
-		return IRQ_HANDLED;
+
+		if (data->flash)
+			cancel_delayed_work_sync(&data->flash->work);
+
+		return IRQ_RETVAL(mxt_check_bootloader(data));
 	}
 
 	if (!data->object_table)
@@ -3316,16 +3300,13 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 		if (data->suspend_mode == MXT_SUSPEND_REGULATOR)
 			mxt_regulator_enable(data);
 
-		if (data->suspend_mode == MXT_SUSPEND_DEEP_SLEEP)
-			enable_irq(data->irq);
-
 		data->suspended = false;
 	}
 
 	if (!data->in_bootloader) {
-		/* Change to the bootloader mode */
-		data->in_bootloader = true;
+		disable_irq(data->irq);
 
+		/* Change to the bootloader mode */
 		ret = mxt_t6_command(data, MXT_COMMAND_RESET,
 				     MXT_BOOT_VALUE, false);
 		if (ret)
@@ -3338,67 +3319,73 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 		if (ret)
 			return ret;
 
+		data->in_bootloader = true;
 		mxt_sysfs_remove(data);
 		mxt_free_input_device(data);
 		mxt_free_object_table(data);
-	} else {
-		enable_irq(data->irq);
 	}
 
-	reinit_completion(&data->chg_completion);
+	dev_dbg(&data->client->dev, "Entered bootloader\n");
 
 	return 0;
 }
 
+static void mxt_fw_work(struct work_struct *work)
+{
+	struct mxt_flash *f =
+		container_of(work, struct mxt_flash, work.work);
+
+	mxt_check_bootloader(f->data);
+}
+
 static int mxt_load_fw(struct device *dev)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
-	struct mxt_flash f = { 0, };
 	int ret;
 
-	ret = request_firmware(&f.fw, data->fw_name, dev);
+	data->flash = devm_kzalloc(dev, sizeof(struct mxt_flash), GFP_KERNEL);
+	if (!data->flash)
+		return -ENOMEM;
+
+	data->flash->data = data;
+
+	ret = request_firmware(&data->flash->fw, data->fw_name, dev);
 	if (ret) {
 		dev_err(dev, "Unable to open firmware %s\n", data->fw_name);
-		return ret;
+		goto free;
 	}
 
 	/* Check for incorrect enc file */
-	ret = mxt_check_firmware_format(dev, f.fw);
+	ret = mxt_check_firmware_format(dev, data->flash->fw);
 	if (ret)
 		goto release_firmware;
 
-	ret = mxt_enter_bootloader(data);
-	if (ret)
-		goto release_firmware;
+	init_completion(&data->flash->flash_completion);
+	INIT_DELAYED_WORK(&data->flash->work, mxt_fw_work);
+	reinit_completion(&data->flash->flash_completion);
 
-	while (true) {
-		ret = mxt_check_bootloader(data, &f);
+	if (!data->in_bootloader) {
+		ret = mxt_enter_bootloader(data);
 		if (ret)
-			return ret;
-
-		if (f.complete)
-			break;
+			goto release_firmware;
 	}
 
-	/* Wait for flash. */
-	ret = mxt_wait_for_completion(data, &data->chg_completion,
-				      MXT_FW_RESET_TIME);
-	if (ret)
-		goto disable_irq;
+	enable_irq(data->irq);
 
+	/* Poll after 0.1s if no interrupt received */
+	schedule_delayed_work(&data->flash->work, msecs_to_jiffies(100));
 
-	/*
-	 * Wait for device to reset. Some bootloader versions do not assert
-	 * the CHG line after bootloading has finished, so ignore potential
-	 * errors.
-	 */
-	mxt_wait_for_completion(data, &data->chg_completion, MXT_FW_RESET_TIME);
+	/* Wait for flash. */
+	ret = mxt_wait_for_completion(data, &data->flash->flash_completion,
+				      MXT_BOOTLOADER_WAIT);
 
-	data->in_bootloader = false;
-disable_irq:
 	disable_irq(data->irq);
+	cancel_delayed_work_sync(&data->flash->work);
+	data->in_bootloader = false;
 release_firmware:
-	release_firmware(f.fw);
+	release_firmware(data->flash->fw);
+free:
+	devm_kfree(dev, data->flash);
 	return ret;
 }
 
-- 
2.17.1

