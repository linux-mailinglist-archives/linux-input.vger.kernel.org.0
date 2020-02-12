Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECC815A3D0
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbgBLIsW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:48:22 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:19967 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbgBLIsW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:48:22 -0500
IronPort-SDR: ti98hUUaRPNeMK9Qry4Krz4zmSR2VBtOI660hnBaqp5qs5jk52N6Y8w1OCKXJUmTMicErB3IGa
 PghjbvSviao3jI7SRu3PuJI+BlJJXn4g5hpg3qnoZ4JSRC3tUqjLuzmc6ySmV+31YyCEIjnrau
 IWbwFX/U+sc+yiWjd6XmWW/b9wvfgYaDzO5r1Jt66Q6ZqJ19kkvbJKw5UFhBpR98TatbkrkhLw
 5jHCiZi1mA0C2MMfjdfJTj2ZYU4BLNuD03Ig70AqBbuHVYtyUIzx1m3yXjq/FyJTjVnTFO0Bu7
 +zA=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45799352"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:45:17 -0800
IronPort-SDR: ZIBg0C4zXAg/wbZzeRq10mKZQscpTOKwVqZagWxyNTGeL4SZK134wXpy4eBO4/71bTCWC8HAok
 ZXlaUo3k4jtEp/05O6U5k7TqTfrly3onQc3BkdV5Yr5ZQLw4OgLhnK8JgtclOTDUiSJU+JQMq2
 KKrPuEYdFVtNj0RfXdmGMhM28+r24qLq0lGHToZIgsRtBJTT0KAEpgoE1Cb9/fJNda9dOzc5qb
 JfUUyZbp+uS0hvisq48PqLk8k4ssJwu8qU8jc/PKHmENrbTGoYxJVaAj7qvki6ieGSNSbhEnM4
 Jvk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 22/48] Input: atmel_mxt_ts - improve bootloader state machine handling
Date:   Wed, 12 Feb 2020 00:41:52 -0800
Message-ID: <20200212084218.32344-23-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
[jiada: only wait on some status change]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 165 +++++++++++++----------
 1 file changed, 95 insertions(+), 70 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index bcdb2e05912e..23775f2e0eff 100644
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
+		if ((f->previous != MXT_WAITING_BOOTLOAD_CMD)
+		    && (f->previous != MXT_FRAME_CRC_PASS)
+		    && (f->previous != MXT_FRAME_CRC_FAIL))
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

