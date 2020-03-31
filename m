Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8E719941B
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730778AbgCaKwr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:47 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730760AbgCaKwo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:44 -0400
IronPort-SDR: 3KvejIdFQHpMsDY7FZPAlN8epkASGCIY19e47nHZ1fxOIBmLZ1aRPerAK5228hrS79WfDseQGd
 OSDSgvaykh1ymwLllkKkafWJZjRADVdhnp1pUbZg2nQu2blwrjXm13QlB5/smqJqh0Xegx8jAd
 uY/rSlx40sozhquqpBG9f/fRa5dVtiF/cpfXhK0cmRxnLGi1sLo7vOW4OIF8rhPql5DKat3dPq
 vwcch6IuI8Wjd87imI2WaHo4NiXmE4hfKzMgNEZuz6i4eRlgJ+hMW6CEugSgQBnhyfmLt4t7L8
 lE0=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330792"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:42 -0800
IronPort-SDR: GHMqegbnzZR40zkcteNJcyP3cCiDbs9j3JRgkaTmopQ0Z+Y0gCvQgYQmufgRZRPZV9/7f+ynG0
 H94gheD3I1qDjDP4ThElATg/k8zwCECpP94/cqDYx3wgcAsMXJK1KcNaDY4IETNanqcj75F2Gx
 jaI2d6SKwMj6eLTdm1crBhznn11AmT2VnqRJ7c224waIs7YyFYKCLq788YadkORJnO7bLbwPnR
 1bV2XJCz/OnwrKCPYOCWLEWW9fwU/prxQkvHvPUpZzINTAZ7II0lWn2R+7ShbnsLM0NeTvALVM
 Ebk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 28/55] Input: atmel_mxt_ts - improve bootloader state machine handling
Date:   Tue, 31 Mar 2020 03:50:24 -0700
Message-ID: <20200331105051.58896-29-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

The code is much clearer if we switch on the actual state the bootloader
is in, rather than the state we want it to be in, and allows the removal
of a goto retry tangle.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 463e15ee95ee6e6274017ff645839dbe34d75c99)
[gdavis: Squash fix from George G. Davis:
	 - input: atmel_mxt_ts - Fix 'mxt_send_bootloader_cmd' was not
	   declared warning]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: only wait on some status change,
	cleanup code style]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 165 +++++++++++++----------
 1 file changed, 95 insertions(+), 70 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 71d5781d3539..0f1c0e5c6169 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -305,6 +305,9 @@ struct mxt_flash {
 	size_t frame_size;
 	unsigned int count;
 	unsigned int retry;
+	u8 previous;
+	bool complete;
+	bool wait;
 };
 
 /* Each client has this additional data */
@@ -583,15 +586,27 @@ static int mxt_probe_bootloader(struct mxt_data *data, bool alt_address)
 	return 0;
 }
 
-static int mxt_check_bootloader(struct mxt_data *data, unsigned int state,
-				bool wait)
+static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock);
+
+static int mxt_write_firmware_frame(struct mxt_data *data, struct mxt_flash *f)
+{
+	f->frame = (struct mxt_fw_frame *)(f->fw->data + f->pos);
+
+	/* Take account of CRC bytes */
+	f->frame_size = __be16_to_cpu(f->frame->size) + 2U;
+
+	/* Write one frame to device */
+	return mxt_bootloader_write(data, f->fw->data + f->pos,
+				   f->frame_size);
+}
+
+static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 {
 	struct device *dev = &data->client->dev;
-	u8 val;
+	u8 state;
 	int ret;
 
-recheck:
-	if (wait) {
+	if (f->wait) {
 		/*
 		 * In application update mode, the interrupt
 		 * line signals state transitions. We must wait for the
@@ -607,40 +622,96 @@ static int mxt_check_bootloader(struct mxt_data *data, unsigned int state,
 			 * by writing length 0x000 to device (iff we are in
 			 * WAITING_FRAME_DATA state).
 			 */
-			dev_err(dev, "Update wait error %d\n", ret);
+			dev_warn(dev, "Update wait error %d\n", ret);
 			return ret;
 		}
 	}
 
-	ret = mxt_bootloader_read(data, &val, 1);
+	f->wait = false;
+
+	ret = mxt_bootloader_read(data, &state, 1);
 	if (ret)
 		return ret;
 
+	/* Remove don't care bits */
+	if (state & ~MXT_BOOT_STATUS_MASK)
+		state &= ~MXT_BOOT_STATUS_MASK;
+
 	switch (state) {
 	case MXT_WAITING_BOOTLOAD_CMD:
+		dev_info(dev, "Unlocking bootloader\n");
+		ret = mxt_send_bootloader_cmd(data, true);
+		if (ret)
+			return ret;
+		f->wait = true;
+
+		break;
+
 	case MXT_WAITING_FRAME_DATA:
-	case MXT_APP_CRC_FAIL:
-		val &= ~MXT_BOOT_STATUS_MASK;
+		if (f->previous != MXT_WAITING_BOOTLOAD_CMD &&
+		    f->previous != MXT_FRAME_CRC_PASS &&
+		    f->previous != MXT_FRAME_CRC_FAIL)
+			goto unexpected;
+
+		ret = mxt_write_firmware_frame(data, f);
+		if (ret)
+			return ret;
+
+		f->wait = true;
+
+		break;
+
+	case MXT_FRAME_CRC_CHECK:
+		if (f->previous != MXT_WAITING_FRAME_DATA)
+			goto unexpected;
+		f->wait = true;
 		break;
+
 	case MXT_FRAME_CRC_PASS:
-		if (val == MXT_FRAME_CRC_CHECK) {
-			goto recheck;
-		} else if (val == MXT_FRAME_CRC_FAIL) {
-			dev_err(dev, "Bootloader CRC fail\n");
-			return -EINVAL;
+		if (f->previous != MXT_FRAME_CRC_CHECK)
+			goto unexpected;
+
+		/* Next frame */
+		f->retry = 0;
+		f->pos += f->frame_size;
+		f->count++;
+		f->wait = true;
+
+		if (f->pos >= f->fw->size) {
+			f->complete = true;
+			dev_info(dev, "Sent %u frames, %zu bytes\n",
+				f->count, f->fw->size);
+		} else if (f->count % 50 == 0) {
+			dev_dbg(dev, "Sent %u frames, %lld/%zu bytes\n",
+				f->count, f->pos, f->fw->size);
+		}
+
+		break;
+
+	case MXT_FRAME_CRC_FAIL:
+		if (f->retry > 20) {
+			dev_err(dev, "Retry count exceeded\n");
+			return -EIO;
 		}
+
+		/* Back off by 20ms per retry */
+		dev_dbg(dev, "Bootloader frame CRC failure\n");
+		f->retry++;
+		f->wait = true;
+		msleep(f->retry * 20);
 		break;
+
 	default:
 		return -EINVAL;
 	}
 
-	if (val != state) {
-		dev_err(dev, "Invalid bootloader state %02X != %02X\n",
-			val, state);
-		return -EINVAL;
-	}
+	f->previous = state;
 
 	return 0;
+
+unexpected:
+	dev_err(dev, "Unexpected state transition\n");
+	return -EINVAL;
 }
 
 static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock)
@@ -3301,57 +3372,13 @@ static int mxt_load_fw(struct device *dev)
 	if (ret)
 		goto release_firmware;
 
-	ret = mxt_check_bootloader(data, MXT_WAITING_BOOTLOAD_CMD, false);
-	if (ret) {
-		/* Bootloader may still be unlocked from previous attempt */
-		ret = mxt_check_bootloader(data, MXT_WAITING_FRAME_DATA, false);
-		if (ret)
-			goto disable_irq;
-	} else {
-		dev_info(dev, "Unlocking bootloader\n");
-
-		/* Unlock bootloader */
-		ret = mxt_send_bootloader_cmd(data, true);
+	while (true) {
+		ret = mxt_check_bootloader(data, &f);
 		if (ret)
-			goto disable_irq;
-	}
-
-	while (f.pos < f.fw->size) {
-		f.frame = (struct mxt_fw_frame *)(f.fw->data + f.pos);
-
-		ret = mxt_check_bootloader(data, MXT_WAITING_FRAME_DATA, true);
-		if (ret)
-			goto disable_irq;
-
-		/* Take account of CRC bytes */
-		f.frame_size = __be16_to_cpu(f.frame->size) + 2U;
-
-		/* Write one frame to device */
-		ret = mxt_bootloader_write(data, f.fw->data + f.pos,
-					   f.frame_size);
-		if (ret)
-			goto disable_irq;
-
-		ret = mxt_check_bootloader(data, MXT_FRAME_CRC_PASS, true);
-		if (ret) {
-			f.retry++;
-
-			/* Back off by 20ms per retry */
-			msleep(f.retry * 20);
-
-			if (f.retry > 20) {
-				dev_err(dev, "Retry count exceeded\n");
-				goto disable_irq;
-			}
-		} else {
-			f.retry = 0;
-			f.pos += f.frame_size;
-			f.count++;
-		}
+			return ret;
 
-		if (f.count % 50 == 0)
-			dev_dbg(dev, "Sent %u frames, %lld/%zu bytes\n",
-				f.count, f.pos, f.fw->size);
+		if (f.complete)
+			break;
 	}
 
 	/* Wait for flash. */
@@ -3360,7 +3387,6 @@ static int mxt_load_fw(struct device *dev)
 	if (ret)
 		goto disable_irq;
 
-	dev_dbg(dev, "Sent %u frames, %lld bytes\n", f.count, f.pos);
 
 	/*
 	 * Wait for device to reset. Some bootloader versions do not assert
@@ -3370,7 +3396,6 @@ static int mxt_load_fw(struct device *dev)
 	mxt_wait_for_completion(data, &data->bl_completion, MXT_FW_RESET_TIME);
 
 	data->in_bootloader = false;
-
 disable_irq:
 	disable_irq(data->irq);
 release_firmware:
-- 
2.17.1

