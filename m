Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 233A9B4A96
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbfIQJev (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:34:51 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:21876 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbfIQJeu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:34:50 -0400
IronPort-SDR: hIkGUG33Nunk3KdqYWFnpulbd/9pvemvlHHJF524bQqaBGA5/Mtk5F7tIgLuqvFUOFHCUkvYnq
 CcB83v2dpMdZoLa+XWLl1wDEDdHZuH9HW0aLYAtnPSWR5FX95k1mJmALWc4JNyUaTBw0PAcbFr
 M5+aR/uIsKEjUsDXGFFXwE8HYvDNCyEroeDNn7pHoJKdMuwfDqB4CYVvbKd10REtiIKm/BmmGg
 1pOzHa5jE7b7HRRJ8qFUHKkraEt072FriQnrNd4s92CUtrXOQJf+V+JfXUR7WoUe6NUjhTz8u/
 0xA=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41422944"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:34:49 -0800
IronPort-SDR: zT1A8eo8IUxJ3ZY0zefYQ0cqGOdw3a/7GqAVOzpGvit5JZmvTfGzFlGip/r1bxLXD5NocBMXRO
 f8A6r7hzMSuFXCJvTpQb0cKgZaXY12DKCKHebW1bZCAT5Oro0XGxOZzEd56eQSCbZcWwH1+rv1
 Wwj2+B7OlFLttUMgFvnHVbytw/3d1KFhNNjxBHVvrnMp5vmypzYMTnMcbXPxoKCLixlmfNSx/1
 j2RzOfKNln3WDQS2RbSaCT6a9gSrqEEj+qXOsQBHEfKavCLkdrCNWvK1gDHzeDnGPdTiZaz2HU
 DgA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 02/49] Input: introduce input_mt_report_slot_inactive
Date:   Tue, 17 Sep 2019 18:32:33 +0900
Message-ID: <20190917093320.18134-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917093320.18134-1-jiada_wang@mentor.com>
References: <20190917093320.18134-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/hid/hid-alps.c                     | 3 +--
 drivers/hid/hid-multitouch.c               | 6 ++----
 drivers/input/input-mt.c                   | 2 +-
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
 13 files changed, 22 insertions(+), 22 deletions(-)

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
index 672396ed413e..b2221f2030c1 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -880,7 +880,7 @@ static void mt_release_pending_palms(struct mt_device *td,
 		clear_bit(slotnum, app->pending_palm_slots);
 
 		input_mt_slot(input, slotnum);
-		input_mt_report_slot_state(input, MT_TOOL_PALM, false);
+		input_mt_report_slot_inactive(input);
 
 		need_sync = true;
 	}
@@ -1620,9 +1620,7 @@ static void mt_release_contacts(struct hid_device *hid)
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
diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index a81e14148407..7626fe5bfe44 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -145,7 +145,7 @@ bool input_mt_report_slot_state(struct input_dev *dev,
 	slot->frame = mt->frame;
 
 	if (!active) {
-		input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
+		input_mt_report_slot_inactive(dev);
 		return false;
 	}
 
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
index d9b103a81a79..b72358d4b35c 100644
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
index 4a5f482cf1af..573b94a049b2 100644
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
index 4b22d49a0f49..a3a85e2348a2 100644
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
index ea46da04e517..d4e088364bed 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -550,7 +550,7 @@ static int __maybe_unused mms114_suspend(struct device *dev)
 	/* Release all touch */
 	for (id = 0; id < MMS114_MAX_TOUCH; id++) {
 		input_mt_slot(input_dev, id);
-		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, false);
+		input_mt_report_slot_inactive(input_dev);
 	}
 
 	input_mt_report_pointer_emulation(input_dev, true);
diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
index 69881265d121..147ea4f8f87b 100644
--- a/drivers/input/touchscreen/raspberrypi-ts.c
+++ b/drivers/input/touchscreen/raspberrypi-ts.c
@@ -102,7 +102,7 @@ static void rpi_ts_poll(struct input_polled_dev *dev)
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
index 9e409bb13642..ab9a34c312f9 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -97,6 +97,11 @@ static inline bool input_is_mt_axis(int axis)
 	return axis == ABS_MT_SLOT || input_is_mt_value(axis);
 }
 
+static inline void input_mt_report_slot_inactive(struct input_dev *dev)
+{
+	input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
+
+}
 bool input_mt_report_slot_state(struct input_dev *dev,
 				unsigned int tool_type, bool active);
 
-- 
2.19.2

