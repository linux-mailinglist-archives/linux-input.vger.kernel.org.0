Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7ABE8228
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730457AbfJ2HVf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:21:35 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:41262 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbfJ2HVf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:21:35 -0400
IronPort-SDR: P+65zG7D8EiUiVt1/T6ZTpdo8bo6Xf5yWTbynYXhcht4UPmgscJItibP6Iglh1Hw0OsVVjaO2H
 rCZ7Njs9GVCOHypdTvY3lJ0b7gR8QCKOwXFPwBPN617uQuxR18LqyycA4BAUzwAIHJ5budqDcY
 05BxyykRqvXihpJ8InETpA38MNpYXtYWTpTY84n7pBnOrumqrfHLJwifSa2lu+OXzROXMUI98y
 RHJeKkpne2aDVD2FgfBPFkjLvtXjL34RKYnl5rsOclP15BFUbP2+WnObLVqFKqHJUBqvC0K+Ff
 dNg=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="42663263"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:21:34 -0800
IronPort-SDR: 10UoD7JcYDCErLExtyWMREi5p9lqcdhwTFGTcBqUioFRxzbbIuTya+nyUuxXFFav8miVggr5md
 NL1+cxBVMAL1pddyJIYZYwNu2yIJWUduXWmgBq8obaTv0b60psDi3KyqpA6ulzhnSGxOr3/MRv
 D+KTawHaVEOk9N/aG99CZP1NSqzgBCCMXGveVof9JyXD3mfBnUi6bNzFUaTPA+wB79yZ1e0alH
 uupFkT8BHvptjNxQD2N3DQAlW9hnc9d5vbKbrshOZ9x9x46SziC2fMxFAa4uhQC1ad+xZnFClm
 qhE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 22/48] Input: atmel_mxt_ts - improve bootloader state machine handling
Date:   Tue, 29 Oct 2019 16:19:44 +0900
Message-ID: <20191029072010.8492-23-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
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
---
Notes:
- Squash fix from George G. Davis:
  + input: atmel_mxt_ts - Fix 'mxt_send_bootloader_cmd' was not declared warning

    The following sparse warning was introduced by ndyer/linux/for-upstream
    commit 463e15ee95ee ("Input: atmel_mxt_ts - improve bootloader state
    machine handling"):

    drivers/input/touchscreen/atmel_mxt_ts.c:888:5: warning: symbol 'mxt_send_bootloader_cmd' was not declared. Should it be static?

    Fix the above sparse warning by restoring the 'mxt_send_bootloader_cmd'
    static declaration which was errantly removed by
    ndyer/linux/for-upstream commit 463e15ee95ee ("Input: atmel_mxt_ts -
    improve bootloader state machine handling").

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 183 ++++++++++++-----------
 1 file changed, 98 insertions(+), 85 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 4c9f75e2f953..d1bc31feafb8 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -305,6 +305,8 @@ struct mxt_flash {
 	size_t frame_size;
 	unsigned int count;
 	unsigned int retry;
+	u8 previous;
+	bool complete;
 };
 
 /* Each client has this additional data */
@@ -583,64 +585,121 @@ static int mxt_probe_bootloader(struct mxt_data *data, bool alt_address)
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
+	/*
+	 * In application update mode, the interrupt
+	 * line signals state transitions. We must wait for the
+	 * CHG assertion before reading the status byte.
+	 * Once the status byte has been read, the line is deasserted.
+	 */
+	ret = mxt_wait_for_completion(data, &data->bl_completion,
+				      MXT_FW_CHG_TIMEOUT);
+	if (ret) {
 		/*
-		 * In application update mode, the interrupt
-		 * line signals state transitions. We must wait for the
-		 * CHG assertion before reading the status byte.
-		 * Once the status byte has been read, the line is deasserted.
+		 * TODO: handle -ERESTARTSYS better by terminating
+		 * fw update process before returning to userspace
+		 * by writing length 0x000 to device (iff we are in
+		 * WAITING_FRAME_DATA state).
 		 */
-		ret = mxt_wait_for_completion(data, &data->bl_completion,
-					      MXT_FW_CHG_TIMEOUT);
-		if (ret) {
-			/*
-			 * TODO: handle -ERESTARTSYS better by terminating
-			 * fw update process before returning to userspace
-			 * by writing length 0x000 to device (iff we are in
-			 * WAITING_FRAME_DATA state).
-			 */
-			dev_err(dev, "Update wait error %d\n", ret);
-			return ret;
-		}
+		dev_warn(dev, "Update wait error %d\n", ret);
 	}
 
-	ret = mxt_bootloader_read(data, &val, 1);
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
+		break;
+
+	case MXT_FRAME_CRC_CHECK:
+		if (f->previous != MXT_WAITING_FRAME_DATA)
+			goto unexpected;
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
+
+		if (f->pos >= f->fw->size) {
+			f->complete = true;
+			dev_info(dev, "Sent %u frames, %zu bytes\n",
+				f->count, f->fw->size);
+		} else if (f->count % 50 == 0) {
+			dev_dbg(dev, "Sent %u frames, %lld/%zu bytes\n",
+				f->count, f->pos, f->fw->size);
 		}
+
+		break;
+
+	case MXT_FRAME_CRC_FAIL:
+		if (f->retry > 20) {
+			dev_err(dev, "Retry count exceeded\n");
+			return -EIO;
+		}
+
+		/* Back off by 20ms per retry */
+		dev_dbg(dev, "Bootloader frame CRC failure\n");
+		f->retry++;
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
@@ -3301,57 +3360,13 @@ static int mxt_load_fw(struct device *dev)
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
@@ -3360,7 +3375,6 @@ static int mxt_load_fw(struct device *dev)
 	if (ret)
 		goto disable_irq;
 
-	dev_dbg(dev, "Sent %u frames, %lld bytes\n", f.count, f.pos);
 
 	/*
 	 * Wait for device to reset. Some bootloader versions do not assert
@@ -3370,7 +3384,6 @@ static int mxt_load_fw(struct device *dev)
 	mxt_wait_for_completion(data, &data->bl_completion, MXT_FW_RESET_TIME);
 
 	data->in_bootloader = false;
-
 disable_irq:
 	disable_irq(data->irq);
 release_firmware:
-- 
2.17.1

