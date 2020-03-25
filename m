Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4C31929BF
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgCYNdq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:33:46 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:13472 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgCYNdp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:33:45 -0400
IronPort-SDR: x5PF3oLWGVRoobViQ+PoKvVGLCdt8Ns/M68YkQLcT4jKFjvOm2jempMM/ZPxcL14sPTsqxOr6V
 UWTK82KNOSSvno4nOONWIfmVsbZ8ObUbmqMnPvex2PLnG8gNzxSX6R5hM80tIZKRMg5Tq1+8Wg
 ODIKvcc7BbSBLKiAmrrQUmqL4HvQund7W6bXyEvxsjN/W0Pr45JFpvGzeEBXEK1Qg/ZAv+R8/+
 FnB5IfHStoi1i5lIqgQcnCnw1FMyogPPUz9GV+j/yPvUZgLputzigSgBsmlcmXcHCSMOdC7Zvv
 StY=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47010516"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:33:44 -0800
IronPort-SDR: GL40tRyGdYPvkoxkS9xU8eEIrwAumO4NlZ+9Y3PUyR/fhkYWi6C/EIzhbjZ/yVVjmiB9tGHi41
 A6qxiLAOkaddEuR0BHpqcCtGto98DdI2hYf/h/mwZg8WGqjDBlA5yH1vstyw1st6IWr5x/iN5w
 HCeLRY9M6bN8nSK9OKacQmW1QO/Uc00Nw7ey67FMYzSfjCN7JSgCfzMhYeszykl48l+N42cx6a
 inWYf+95DIkcjccBdjTzWYr7MBjDOFDcLUKICo/FR5v9HNz+YoHtAk9C/H38Ku+0xNeDdO6d1+
 Q2E=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 01/55] Input: introduce input_mt_report_slot_inactive
Date:   Wed, 25 Mar 2020 06:32:40 -0700
Message-ID: <20200325133334.19346-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

input_mt_report_slot_state() ignores the tool when the slot is closed.
which has caused a bit of confusion.
This patch introduces input_mt_report_slot_inactive() to report slot
inactive state.
replaces all input_mt_report_slot_state() with
input_mt_report_slot_inactive() in case of close of slot.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/hid/hid-alps.c                     | 3 +--
 drivers/hid/hid-multitouch.c               | 6 ++----
 drivers/input/misc/xen-kbdfront.c          | 2 +-
 drivers/input/mouse/elan_i2c_core.c        | 2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c   | 7 +++----
 drivers/input/touchscreen/cyttsp4_core.c   | 5 ++---
 drivers/input/touchscreen/cyttsp_core.c    | 2 +-
 drivers/input/touchscreen/melfas_mip4.c    | 4 ++--
 drivers/input/touchscreen/mms114.c         | 2 +-
 drivers/input/touchscreen/raspberrypi-ts.c | 2 +-
 drivers/input/touchscreen/stmfts.c         | 2 +-
 include/linux/input/mt.h                   | 5 +++++
 12 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
index ae79a7c66737..36ca1d815d53 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -387,8 +387,7 @@ static int u1_raw_event(struct alps_dev *hdata, u8 *data, int size)
 				input_report_abs(hdata->input,
 					ABS_MT_PRESSURE, z);
 			} else {
-				input_mt_report_slot_state(hdata->input,
-					MT_TOOL_FINGER, 0);
+				input_mt_report_slot_inactive(hdata->input);
 			}
 		}
 
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 362805ddf377..e2ce790ff4a4 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -896,7 +896,7 @@ static void mt_release_pending_palms(struct mt_device *td,
 		clear_bit(slotnum, app->pending_palm_slots);
 
 		input_mt_slot(input, slotnum);
-		input_mt_report_slot_state(input, MT_TOOL_PALM, false);
+		input_mt_report_slot_inactive(input);
 
 		need_sync = true;
 	}
@@ -1640,9 +1640,7 @@ static void mt_release_contacts(struct hid_device *hid)
 		if (mt) {
 			for (i = 0; i < mt->num_slots; i++) {
 				input_mt_slot(input_dev, i);
-				input_mt_report_slot_state(input_dev,
-							   MT_TOOL_FINGER,
-							   false);
+				input_mt_report_slot_inactive(input_dev);
 			}
 			input_mt_sync_frame(input_dev);
 			input_sync(input_dev);
diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
index 24bc5c5d876f..a1bba722b234 100644
--- a/drivers/input/misc/xen-kbdfront.c
+++ b/drivers/input/misc/xen-kbdfront.c
@@ -146,7 +146,7 @@ static void xenkbd_handle_mt_event(struct xenkbd_info *info,
 		break;
 
 	case XENKBD_MT_EV_UP:
-		input_mt_report_slot_state(info->mtouch, MT_TOOL_FINGER, false);
+		input_mt_report_slot_inactive(info->mtouch);
 		break;
 
 	case XENKBD_MT_EV_SYN:
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 8719da540383..3f9354baac4b 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -938,7 +938,7 @@ static void elan_report_contact(struct elan_tp_data *data,
 		input_report_abs(input, ABS_MT_TOUCH_MINOR, minor);
 	} else {
 		input_mt_slot(input, contact_num);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
+		input_mt_report_slot_inactive(input);
 	}
 }
 
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ae60442efda0..a2189739e30f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -822,8 +822,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 		 * have happened.
 		 */
 		if (status & MXT_T9_RELEASE) {
-			input_mt_report_slot_state(input_dev,
-						   MT_TOOL_FINGER, 0);
+			input_mt_report_slot_inactive(input_dev);
 			mxt_input_sync(data);
 		}
 
@@ -839,7 +838,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, area);
 	} else {
 		/* Touch no longer active, close out slot */
-		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, 0);
+		input_mt_report_slot_inactive(input_dev);
 	}
 
 	data->update_input = true;
@@ -947,7 +946,7 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 		dev_dbg(dev, "[%u] release\n", id);
 
 		/* close out slot */
-		input_mt_report_slot_state(input_dev, 0, 0);
+		input_mt_report_slot_inactive(input_dev);
 	}
 
 	data->update_input = true;
diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
index 6bcffc930384..02a73d9a4def 100644
--- a/drivers/input/touchscreen/cyttsp4_core.c
+++ b/drivers/input/touchscreen/cyttsp4_core.c
@@ -744,8 +744,7 @@ static void cyttsp4_report_slot_liftoff(struct cyttsp4_mt_data *md,
 
 	for (t = 0; t < max_slots; t++) {
 		input_mt_slot(md->input, t);
-		input_mt_report_slot_state(md->input,
-			MT_TOOL_FINGER, false);
+		input_mt_report_slot_inactive(md->input);
 	}
 }
 
@@ -845,7 +844,7 @@ static void cyttsp4_final_sync(struct input_dev *input, int max_slots, int *ids)
 		if (ids[t])
 			continue;
 		input_mt_slot(input, t);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
+		input_mt_report_slot_inactive(input);
 	}
 
 	input_sync(input);
diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 3f5d463dbeed..697aa2c158f7 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -340,7 +340,7 @@ static void cyttsp_report_tchdata(struct cyttsp *ts)
 			continue;
 
 		input_mt_slot(input, i);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
+		input_mt_report_slot_inactive(input);
 	}
 
 	input_sync(input);
diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 247c3aaba2d8..f67efdd040b2 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -391,7 +391,7 @@ static void mip4_clear_input(struct mip4_ts *ts)
 	/* Screen */
 	for (i = 0; i < MIP4_MAX_FINGERS; i++) {
 		input_mt_slot(ts->input, i);
-		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, 0);
+		input_mt_report_slot_inactive(ts->input);
 	}
 
 	/* Keys */
@@ -534,7 +534,7 @@ static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
 	} else {
 		/* Release event */
 		input_mt_slot(ts->input, id);
-		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, 0);
+		input_mt_report_slot_inactive(ts->input);
 	}
 
 	input_mt_sync_frame(ts->input);
diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 69c6d559eeb0..776ed9e4629d 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -549,7 +549,7 @@ static int __maybe_unused mms114_suspend(struct device *dev)
 	/* Release all touch */
 	for (id = 0; id < MMS114_MAX_TOUCH; id++) {
 		input_mt_slot(input_dev, id);
-		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, false);
+		input_mt_report_slot_inactive(input_dev);
 	}
 
 	input_mt_report_pointer_emulation(input_dev, true);
diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
index 0e2e08f3f433..ef6aaed217cf 100644
--- a/drivers/input/touchscreen/raspberrypi-ts.c
+++ b/drivers/input/touchscreen/raspberrypi-ts.c
@@ -100,7 +100,7 @@ static void rpi_ts_poll(struct input_dev *input)
 	released_ids = ts->known_ids & ~modified_ids;
 	for_each_set_bit(i, &released_ids, RPI_TS_MAX_SUPPORTED_POINTS) {
 		input_mt_slot(input, i);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, 0);
+		input_mt_report_slot_inactive(input);
 		modified_ids &= ~(BIT(i));
 	}
 	ts->known_ids = modified_ids;
diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index b6f95f20f924..b54cc64e4ea6 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -198,7 +198,7 @@ static void stmfts_report_contact_release(struct stmfts_data *sdata,
 	u8 slot_id = (event[0] & STMFTS_MASK_TOUCH_ID) >> 4;
 
 	input_mt_slot(sdata->input, slot_id);
-	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, false);
+	input_mt_report_slot_inactive(sdata->input);
 
 	input_sync(sdata->input);
 }
diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
index 9e409bb13642..3b8580bd33c1 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -100,6 +100,11 @@ static inline bool input_is_mt_axis(int axis)
 bool input_mt_report_slot_state(struct input_dev *dev,
 				unsigned int tool_type, bool active);
 
+static inline void input_mt_report_slot_inactive(struct input_dev *dev)
+{
+	input_mt_report_slot_state(dev, 0, false);
+}
+
 void input_mt_report_finger_count(struct input_dev *dev, int count);
 void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count);
 void input_mt_drop_unused(struct input_dev *dev);
-- 
2.17.1

