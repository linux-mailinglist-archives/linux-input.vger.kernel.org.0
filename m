Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28EFD1067E0
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfKVIZg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:25:36 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:52499 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfKVIZe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:25:34 -0500
IronPort-SDR: abfCg+7asPMTWpBjQ2sGDdcBwRL1iySVtvoKxn4vxRzwwjhBtNHgALoqW0nZUfWGLksn0/R8Zh
 io5KSiINUv9CG0g0roreS+48gcBK8S16dscYJvF6Jg6hVH7FK9aQwPqeluNmvDrlanKYO/bqoj
 7XNnYhzBwMqpcf+ClL3kQSvAZgZxvwl5E2GV7ROWqa4hMQVIjxDxQcqMvqiZFc4rXY+G6JAseL
 bDOVxvAI7f53LoVyyQm74HX+7MXGu7QVo8MF3trepzpPhl/js+oGcSfaudLlBb9GVpyv2YnMRw
 10U=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43358932"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:25:33 -0800
IronPort-SDR: HYt+Mxd6EfaGsari0R9njzNthdq2vR8LL2pepvCb4XGXQ0T373ky4veDxBXze6Un2HLbEyJnNG
 Zt+R4NLf+uHuZgoUzSjopvPwh1YGaVMjK9Ce4r1ww7VelU8RSMmsI0l/UyA2Vop13TrZYGlSk/
 AJVcLUfKrCCwNzJ/YQfytCSFhvWPli9c6v71KRqCv8euodXPoMb7wJnV8zVf5Vi80eiLWM4dx4
 s4CFFZg4V8XvDTtDP4/HA9fjlA8XXyeePRY0/INheJ6vlJ9plrRE4BSdMMnKfOhWbW6don5KPA
 rSE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 24/48] Input: atmel_mxt_ts - make bootloader interrupt driven
Date:   Fri, 22 Nov 2019 17:23:38 +0900
Message-ID: <20191122082402.18173-25-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 67a3eea0cfc724c3c2a7410ac064f74227c7c6ef)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Replace two use msecs_to_jiffies() instead of HZ,
	remove check of &data->flash->work]
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 118 ++++++++++++-----------
 1 file changed, 60 insertions(+), 58 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 520dc9670b38..842d407efc86 100644
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
 #define MXT_CHG_DELAY	        100	/* msec */
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
@@ -306,7 +309,8 @@ struct mxt_flash {
 	unsigned int count;
 	unsigned int retry;
 	u8 previous;
-	bool complete;
+	struct completion flash_completion;
+	struct delayed_work work;
 };
 
 /* Each client has this additional data */
@@ -355,6 +359,7 @@ struct mxt_data {
 	char *cfg_name;
 	const char *pcfg_name;
 	const char *input_name;
+	struct mxt_flash *flash;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -599,28 +604,17 @@ static int mxt_write_firmware_frame(struct mxt_data *data, struct mxt_flash *f)
 				   f->frame_size);
 }
 
-static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
+static int mxt_check_bootloader(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
+	struct mxt_flash *f = data->flash;
 	u8 state;
 	int ret;
 
-	/*
-	 * In application update mode, the interrupt
-	 * line signals state transitions. We must wait for the
-	 * CHG assertion before reading the status byte.
-	 * Once the status byte has been read, the line is deasserted.
-	 */
-	ret = mxt_wait_for_completion(data, &data->chg_completion,
-				      MXT_FW_CHG_TIMEOUT);
-	if (ret) {
-		/*
-		 * TODO: handle -ERESTARTSYS better by terminating
-		 * fw update process before returning to userspace
-		 * by writing length 0x000 to device (iff we are in
-		 * WAITING_FRAME_DATA state).
-		 */
-		dev_warn(dev, "Update wait error %d\n", ret);
+	/* Handle interrupt after download/flash process */
+	if (f->pos >= f->fw->size) {
+		complete(&f->flash_completion);
+		return 0;
 	}
 
 	ret = mxt_bootloader_read(data, &state, 1);
@@ -666,14 +660,12 @@ static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 		f->pos += f->frame_size;
 		f->count++;
 
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
 
@@ -695,6 +687,9 @@ static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 
 	f->previous = state;
 
+	/* Poll after 0.1s if no interrupt received */
+	schedule_delayed_work(&f->work, msecs_to_jiffies(100));
+
 	return 0;
 
 unexpected:
@@ -1403,7 +1398,11 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 
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
@@ -3304,16 +3303,13 @@ static int mxt_enter_bootloader(struct mxt_data *data)
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
@@ -3326,67 +3322,73 @@ static int mxt_enter_bootloader(struct mxt_data *data)
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

