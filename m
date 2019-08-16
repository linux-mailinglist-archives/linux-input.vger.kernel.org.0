Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4F28FDF6
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfHPIgz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:36:55 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36109 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIgy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:36:54 -0400
IronPort-SDR: 6VsZJXUqHokVyiQq4W7Q7eLKnLRPBgcypVJI8xhRV6jGtCuGjWLdOoEFnHLP1Xu66lU5/Aw7rV
 0kppY2oftw6R+6l4IaDw39rnXnSjRnEEZb439fkWwRSWWGRXwbKDCfKYxQ6af8Uczveye/7fOl
 MkXcGj87ZIrIhzavMv0i8NB99k4Xm+JjfgZ83VoHTP84gwE4GVCcFzilnG3UAZcxmpAQpg4HJV
 2o83EvSa6M2w857Jw0ypr/IzJc8LRodRbaEvGR514MGeZNX5gbfNbfboOnADPY9LCYmFtGNlZZ
 neY=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40518974"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:29:48 -0800
IronPort-SDR: Edjc9Dl65x+RKxYdf67lZlGNWRY0wsEQb2aKeIdas9LuorjfXSiiDQBXnqsnsNvP5130YylO9O
 16zUYzBWwemOdo3obRgpXjg8G3avCn9DRxxd1oyq/vYyfDYS/dnhJ2IS+750QD2GCoTYKtMn+X
 iJIf316M/rhROpPPOI2Z/Ygg2a1lI8NBTFoAg9jSndAKWuN3CUsD65TxnzgkOdB1Y7oJW9Hhh2
 PImJ4N5EnzGUanW+Zs0sM0NP8zpSRyJgjJOVH45gS7xRj0mCIMM3ycOAQzZ1dJqNuisaf60vw/
 Tfc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 01/63] Input: introduce input_mt_report_slot_inactive
Date:   Fri, 16 Aug 2019 17:28:50 +0900
Message-ID: <20190816082952.17985-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816082952.17985-1-jiada_wang@mentor.com>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

input_mt_report_slot_state() ignores the tool when the slot is closed.
which has caused a bit of confusion.
This patch introduces input_mt_report_slot_inactive() to report slot
inactive state.
replaces all input_mt_report_slot_state() with input_mt_report_slot_inactive()
in case of close of slot, also some other related changes.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/hid/hid-alps.c                      |  3 +--
 drivers/hid/hid-asus.c                      |  3 +--
 drivers/hid/hid-elan.c                      |  3 +--
 drivers/hid/hid-logitech-hidpp.c            |  5 ++---
 drivers/hid/hid-magicmouse.c                |  3 +--
 drivers/hid/hid-multitouch.c                |  9 +++------
 drivers/hid/hid-sony.c                      |  8 ++++----
 drivers/hid/wacom_wac.c                     | 15 +++++----------
 drivers/input/input-mt.c                    | 15 ++++++++++++++-
 drivers/input/misc/xen-kbdfront.c           |  2 +-
 drivers/input/mouse/elan_i2c_core.c         |  2 +-
 drivers/input/mouse/elantech.c              |  5 ++---
 drivers/input/mouse/focaltech.c             |  3 +--
 drivers/input/mouse/sentelic.c              |  3 +--
 drivers/input/mouse/synaptics.c             |  3 +--
 drivers/input/rmi4/rmi_2d_sensor.c          |  6 ++----
 drivers/input/touchscreen/atmel_mxt_ts.c    |  7 +++----
 drivers/input/touchscreen/chipone_icn8505.c |  4 ++--
 drivers/input/touchscreen/cyttsp4_core.c    |  5 ++---
 drivers/input/touchscreen/cyttsp_core.c     |  2 +-
 drivers/input/touchscreen/egalax_ts.c       |  3 +--
 drivers/input/touchscreen/hideep.c          |  7 +++----
 drivers/input/touchscreen/ili210x.c         |  3 +--
 drivers/input/touchscreen/melfas_mip4.c     |  4 ++--
 drivers/input/touchscreen/mms114.c          |  6 +++---
 drivers/input/touchscreen/penmount.c        |  5 ++---
 drivers/input/touchscreen/raspberrypi-ts.c  |  2 +-
 drivers/input/touchscreen/raydium_i2c_ts.c  |  4 ++--
 drivers/input/touchscreen/sis_i2c.c         |  5 ++---
 drivers/input/touchscreen/stmfts.c          |  2 +-
 drivers/input/touchscreen/surface3_spi.c    |  4 ++--
 drivers/input/touchscreen/wacom_w8001.c     |  3 +--
 drivers/input/touchscreen/zforce_ts.c       |  6 ++----
 include/linux/input/mt.h                    |  1 +
 34 files changed, 73 insertions(+), 88 deletions(-)

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
 
diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 8063b1d567b1..55f1004f0e58 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -240,9 +240,8 @@ static int asus_report_input(struct asus_drvdata *drvdat, u8 *data, int size)
 						MT_TOOL_PALM : MT_TOOL_FINGER;
 
 		input_mt_slot(drvdat->input, i);
-		input_mt_report_slot_state(drvdat->input, toolType, down);
 
-		if (down) {
+		if (input_mt_report_slot_state(drvdat->input, toolType, down)) {
 			asus_report_contact_down(drvdat, toolType, contactData);
 			contactData += drvdat->tp->contact_size;
 		}
diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 45c4f888b7c4..84a317c6feb6 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -216,8 +216,7 @@ static void elan_report_mt_slot(struct elan_drvdata *drvdata, u8 *data,
 	bool active = !!data;
 
 	input_mt_slot(input, slot_num);
-	input_mt_report_slot_state(input, MT_TOOL_FINGER, active);
-	if (active) {
+	if (input_mt_report_slot_state(input, MT_TOOL_FINGER, active)) {
 		x = ((data[0] & 0xF0) << 4) | data[1];
 		y = drvdata->max_y -
 		    (((data[0] & 0x07) << 8) | data[2]);
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 21268c9fa71a..a7b552a797f1 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2295,9 +2295,8 @@ static void wtp_touch_event(struct hidpp_device *hidpp,
 	slot = input_mt_get_slot_by_key(hidpp->input, touch_report->finger_id);
 
 	input_mt_slot(hidpp->input, slot);
-	input_mt_report_slot_state(hidpp->input, MT_TOOL_FINGER,
-					touch_report->contact_status);
-	if (touch_report->contact_status) {
+	if (input_mt_report_slot_state(hidpp->input, MT_TOOL_FINGER,
+		touch_report->contact_status)) {
 		input_event(hidpp->input, EV_ABS, ABS_MT_POSITION_X,
 				touch_report->x);
 		input_event(hidpp->input, EV_ABS, ABS_MT_POSITION_Y,
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 34138667f8af..5f9f6426d7b8 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -282,10 +282,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 		msc->ntouches++;
 
 	input_mt_slot(input, id);
-	input_mt_report_slot_state(input, MT_TOOL_FINGER, down);
 
 	/* Generate the input events for this touch. */
-	if (down) {
+	if (input_mt_report_slot_state(input, MT_TOOL_FINGER, down)) {
 		input_report_abs(input, ABS_MT_TOUCH_MAJOR, touch_major << 2);
 		input_report_abs(input, ABS_MT_TOUCH_MINOR, touch_minor << 2);
 		input_report_abs(input, ABS_MT_ORIENTATION, -orientation);
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index b603c14d043b..b2221f2030c1 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -880,7 +880,7 @@ static void mt_release_pending_palms(struct mt_device *td,
 		clear_bit(slotnum, app->pending_palm_slots);
 
 		input_mt_slot(input, slotnum);
-		input_mt_report_slot_state(input, MT_TOOL_PALM, false);
+		input_mt_report_slot_inactive(input);
 
 		need_sync = true;
 	}
@@ -1020,8 +1020,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
 	}
 
 	input_mt_slot(input, slotnum);
-	input_mt_report_slot_state(input, tool, active);
-	if (active) {
+	if (input_mt_report_slot_state(input, tool, active)) {
 		/* this finger is in proximity of the sensor */
 		int wide = (*slot->w > *slot->h);
 		int major = max(*slot->w, *slot->h);
@@ -1621,9 +1620,7 @@ static void mt_release_contacts(struct hid_device *hid)
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
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 49dd2d905c7f..8ba21584a84a 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -1092,9 +1092,9 @@ static void dualshock4_parse_report(struct sony_sc *sc, u8 *rd, int size)
 
 			active = !(rd[offset] >> 7);
 			input_mt_slot(sc->touchpad, n);
-			input_mt_report_slot_state(sc->touchpad, MT_TOOL_FINGER, active);
 
-			if (active) {
+			if (input_mt_report_slot_state(sc->touchpad,
+				MT_TOOL_FINGER, active)) {
 				input_report_abs(sc->touchpad, ABS_MT_POSITION_X, x);
 				input_report_abs(sc->touchpad, ABS_MT_POSITION_Y, y);
 			}
@@ -1146,9 +1146,9 @@ static void nsg_mrxu_parse_report(struct sony_sc *sc, u8 *rd, int size)
 		y = ((rd[offset+1] & 0xF0) >> 4) | (rd[offset+2] << 4);
 
 		input_mt_slot(sc->touchpad, n);
-		input_mt_report_slot_state(sc->touchpad, MT_TOOL_FINGER, active & 0x03);
 
-		if (active & 0x03) {
+		if (input_mt_report_slot_state(sc->touchpad,
+			MT_TOOL_FINGER, active & 0x03)) {
 			contactx = rd[offset+3] & 0x0F;
 			contacty = rd[offset+3] >> 4;
 			input_report_abs(sc->touchpad, ABS_MT_TOUCH_MAJOR,
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 7a8ddc999a8e..c49b261753f0 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1504,9 +1504,8 @@ static int wacom_24hdt_irq(struct wacom_wac *wacom)
 		if (slot < 0)
 			continue;
 		input_mt_slot(input, slot);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, touch);
 
-		if (touch) {
+		if (input_mt_report_slot_state(input, MT_TOOL_FINGER, touch)) {
 			int t_x = get_unaligned_le16(&data[offset + 2]);
 			int t_y = get_unaligned_le16(&data[offset + 4 + y_offset]);
 
@@ -1570,8 +1569,7 @@ static int wacom_mt_touch(struct wacom_wac *wacom)
 			continue;
 
 		input_mt_slot(input, slot);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, touch);
-		if (touch) {
+		if (input_mt_report_slot_state(input, MT_TOOL_FINGER, touch)) {
 			int x = get_unaligned_le16(&data[offset + x_offset + 7]);
 			int y = get_unaligned_le16(&data[offset + x_offset + 9]);
 			input_report_abs(input, ABS_MT_POSITION_X, x);
@@ -1599,8 +1597,7 @@ static int wacom_tpc_mt_touch(struct wacom_wac *wacom)
 		bool touch = p && report_touch_events(wacom);
 
 		input_mt_slot(input, i);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, touch);
-		if (touch) {
+		if (input_mt_report_slot_state(input, MT_TOOL_FINGER, touch)) {
 			int x = le16_to_cpup((__le16 *)&data[i * 2 + 2]) & 0x7fff;
 			int y = le16_to_cpup((__le16 *)&data[i * 2 + 6]) & 0x7fff;
 
@@ -2842,8 +2839,7 @@ static int wacom_bpt_touch(struct wacom_wac *wacom)
 			   && (data[offset + 3] & 0x80);
 
 		input_mt_slot(input, i);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, touch);
-		if (touch) {
+		if (input_mt_report_slot_state(input, MT_TOOL_FINGER, touch)) {
 			int x = get_unaligned_be16(&data[offset + 3]) & 0x7ff;
 			int y = get_unaligned_be16(&data[offset + 5]) & 0x7ff;
 			if (features->quirks & WACOM_QUIRK_BBTOUCH_LOWRES) {
@@ -2879,9 +2875,8 @@ static void wacom_bpt3_touch_msg(struct wacom_wac *wacom, unsigned char *data)
 	touch = touch && report_touch_events(wacom);
 
 	input_mt_slot(input, slot);
-	input_mt_report_slot_state(input, MT_TOOL_FINGER, touch);
 
-	if (touch) {
+	if (input_mt_report_slot_state(input, MT_TOOL_FINGER, touch)) {
 		int x = (data[2] << 4) | (data[4] >> 4);
 		int y = (data[3] << 4) | (data[4] & 0x0f);
 		int width, height;
diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index a81e14148407..acfe05af1269 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -117,6 +117,19 @@ void input_mt_destroy_slots(struct input_dev *dev)
 }
 EXPORT_SYMBOL(input_mt_destroy_slots);
 
+/**
+ * input_mt_report_slot_inactive() - report contact inactive state
+ * @dev: input device with allocated MT slots
+ *
+ * Reports the contact inactive state via ABS_MT_TRACKING_ID
+ *
+ */
+void input_mt_report_slot_inactive(struct input_dev *dev)
+{
+	input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
+}
+EXPORT_SYMBOL(input_mt_report_slot_inactive);
+
 /**
  * input_mt_report_slot_state() - report contact state
  * @dev: input device with allocated MT slots
@@ -145,7 +158,7 @@ bool input_mt_report_slot_state(struct input_dev *dev,
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
 
diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d8434b7b623..da06490bb914 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -343,8 +343,7 @@ static void elantech_set_slot(struct input_dev *dev, int slot, bool active,
 			      unsigned int x, unsigned int y)
 {
 	input_mt_slot(dev, slot);
-	input_mt_report_slot_state(dev, MT_TOOL_FINGER, active);
-	if (active) {
+	if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, active)) {
 		input_report_abs(dev, ABS_MT_POSITION_X, x);
 		input_report_abs(dev, ABS_MT_POSITION_Y, y);
 	}
@@ -608,7 +607,7 @@ static void process_packet_status_v4(struct psmouse *psmouse)
 	for (i = 0; i < ETP_MAX_FINGERS; i++) {
 		if ((fingers & (1 << i)) == 0) {
 			input_mt_slot(dev, i);
-			input_mt_report_slot_state(dev, MT_TOOL_FINGER, false);
+			input_mt_report_slot_inactive(dev);
 		}
 	}
 
diff --git a/drivers/input/mouse/focaltech.c b/drivers/input/mouse/focaltech.c
index 6fd5fff0cbff..fd627fab16c0 100644
--- a/drivers/input/mouse/focaltech.c
+++ b/drivers/input/mouse/focaltech.c
@@ -124,8 +124,7 @@ static void focaltech_report_state(struct psmouse *psmouse)
 		bool active = finger->active && finger->valid;
 
 		input_mt_slot(dev, i);
-		input_mt_report_slot_state(dev, MT_TOOL_FINGER, active);
-		if (active) {
+		if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, active)) {
 			unsigned int clamped_x, clamped_y;
 			/*
 			 * The touchpad might report invalid data, so we clamp
diff --git a/drivers/input/mouse/sentelic.c b/drivers/input/mouse/sentelic.c
index e99d9bf1a267..1a8a2e19c514 100644
--- a/drivers/input/mouse/sentelic.c
+++ b/drivers/input/mouse/sentelic.c
@@ -683,8 +683,7 @@ static void fsp_set_slot(struct input_dev *dev, int slot, bool active,
 			 unsigned int x, unsigned int y)
 {
 	input_mt_slot(dev, slot);
-	input_mt_report_slot_state(dev, MT_TOOL_FINGER, active);
-	if (active) {
+	if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, active)) {
 		input_report_abs(dev, ABS_MT_POSITION_X, x);
 		input_report_abs(dev, ABS_MT_POSITION_Y, y);
 	}
diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index b1956ed4c0dd..6969b37ba731 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -882,8 +882,7 @@ static void synaptics_report_semi_mt_slot(struct input_dev *dev, int slot,
 					  bool active, int x, int y)
 {
 	input_mt_slot(dev, slot);
-	input_mt_report_slot_state(dev, MT_TOOL_FINGER, active);
-	if (active) {
+	if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, active)) {
 		input_report_abs(dev, ABS_MT_POSITION_X, x);
 		input_report_abs(dev, ABS_MT_POSITION_Y, synaptics_invert_y(y));
 	}
diff --git a/drivers/input/rmi4/rmi_2d_sensor.c b/drivers/input/rmi4/rmi_2d_sensor.c
index ea549efe4bc4..c0f7be7c3737 100644
--- a/drivers/input/rmi4/rmi_2d_sensor.c
+++ b/drivers/input/rmi4/rmi_2d_sensor.c
@@ -76,10 +76,8 @@ void rmi_2d_sensor_abs_report(struct rmi_2d_sensor *sensor,
 	else
 		input_mt_slot(input, slot);
 
-	input_mt_report_slot_state(input, obj->mt_tool,
-				   obj->type != RMI_2D_OBJECT_NONE);
-
-	if (obj->type != RMI_2D_OBJECT_NONE) {
+	if (input_mt_report_slot_state(input, obj->mt_tool,
+		obj->type != RMI_2D_OBJECT_NONE)) {
 		obj->x = sensor->tracking_pos[slot].x;
 		obj->y = sensor->tracking_pos[slot].y;
 
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
diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
index c768186ce856..9880101cd14b 100644
--- a/drivers/input/touchscreen/chipone_icn8505.c
+++ b/drivers/input/touchscreen/chipone_icn8505.c
@@ -344,8 +344,8 @@ static irqreturn_t icn8505_irq(int irq, void *dev_id)
 		bool act = icn8505_touch_active(touch->event);
 
 		input_mt_slot(icn8505->input, touch->slot);
-		input_mt_report_slot_state(icn8505->input, MT_TOOL_FINGER, act);
-		if (!act)
+		if (!input_mt_report_slot_state(icn8505->input,
+			MT_TOOL_FINGER, act))
 			continue;
 
 		touchscreen_report_pos(icn8505->input, &icn8505->prop,
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
diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 83ac8c128192..c0774c29e496 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -99,12 +99,11 @@ static irqreturn_t egalax_ts_interrupt(int irq, void *dev_id)
 	}
 
 	input_mt_slot(input_dev, id);
-	input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, down);
 
 	dev_dbg(&client->dev, "%s id:%d x:%d y:%d z:%d",
 		down ? "down" : "up", id, x, y, z);
 
-	if (down) {
+	if (input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, down)) {
 		input_report_abs(input_dev, ABS_MT_POSITION_X, x);
 		input_report_abs(input_dev, ABS_MT_POSITION_Y, y);
 		input_report_abs(input_dev, ABS_MT_PRESSURE, z);
diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index 84fbbf415c43..6f4c96f45a02 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -693,10 +693,9 @@ static void hideep_report_slot(struct input_dev *input,
 			       const struct hideep_event *event)
 {
 	input_mt_slot(input, event->index & 0x0f);
-	input_mt_report_slot_state(input,
-				   __GET_MT_TOOL_TYPE(event->type),
-				   !(event->flag & HIDEEP_MT_RELEASED));
-	if (!(event->flag & HIDEEP_MT_RELEASED)) {
+	if (input_mt_report_slot_state(input,
+		__GET_MT_TOOL_TYPE(event->type),
+		!(event->flag & HIDEEP_MT_RELEASED))) {
 		input_report_abs(input, ABS_MT_POSITION_X,
 				 le16_to_cpup(&event->x));
 		input_report_abs(input, ABS_MT_POSITION_Y,
diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index e9006407c9bc..2a5698e129d8 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -154,8 +154,7 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
 		}
 
 		input_mt_slot(input, i);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, touch);
-		if (!touch)
+		if (!input_mt_report_slot_state(input, MT_TOOL_FINGER, touch))
 			continue;
 		touchscreen_report_pos(input, &priv->prop, x, y,
 				       true);
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
index a5ab774da4cc..d4e088364bed 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -178,9 +178,9 @@ static void mms114_process_mt(struct mms114_data *data, struct mms114_touch *tou
 		x, y, touch->width, touch->strength);
 
 	input_mt_slot(input_dev, id);
-	input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, touch->pressed);
 
-	if (touch->pressed) {
+	if (input_mt_report_slot_state(input_dev,
+		MT_TOOL_FINGER, touch->pressed)) {
 		touchscreen_report_pos(input_dev, &data->props, x, y, true);
 		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, touch->width);
 		input_report_abs(input_dev, ABS_MT_PRESSURE, touch->strength);
@@ -550,7 +550,7 @@ static int __maybe_unused mms114_suspend(struct device *dev)
 	/* Release all touch */
 	for (id = 0; id < MMS114_MAX_TOUCH; id++) {
 		input_mt_slot(input_dev, id);
-		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, false);
+		input_mt_report_slot_inactive(input_dev);
 	}
 
 	input_mt_report_pointer_emulation(input_dev, true);
diff --git a/drivers/input/touchscreen/penmount.c b/drivers/input/touchscreen/penmount.c
index 12abb3b36128..2721a608d7fc 100644
--- a/drivers/input/touchscreen/penmount.c
+++ b/drivers/input/touchscreen/penmount.c
@@ -69,9 +69,8 @@ static void pm_mtevent(struct pm *pm, struct input_dev *input)
 
 	for (i = 0; i < pm->maxcontacts; ++i) {
 		input_mt_slot(input, i);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER,
-				pm->slots[i].active);
-		if (pm->slots[i].active) {
+		if (input_mt_report_slot_state(input, MT_TOOL_FINGER,
+			pm->slots[i].active)) {
 			input_event(input, EV_ABS, ABS_MT_POSITION_X, pm->slots[i].x);
 			input_event(input, EV_ABS, ABS_MT_POSITION_Y, pm->slots[i].y);
 		}
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
diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 6ed9f22e6401..d9f253a82eba 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -801,9 +801,9 @@ static void raydium_mt_event(struct raydium_data *ts)
 		u8 wx, wy;
 
 		input_mt_slot(ts->input, i);
-		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, state);
 
-		if (!state)
+		if (!input_mt_report_slot_state(ts->input,
+			MT_TOOL_FINGER, state))
 			continue;
 
 		input_report_abs(ts->input, ABS_MT_POSITION_X,
diff --git a/drivers/input/touchscreen/sis_i2c.c b/drivers/input/touchscreen/sis_i2c.c
index 6274555f1673..55857328bbc7 100644
--- a/drivers/input/touchscreen/sis_i2c.c
+++ b/drivers/input/touchscreen/sis_i2c.c
@@ -189,10 +189,9 @@ static int sis_ts_report_contact(struct sis_ts_data *ts, const u8 *data, u8 id)
 		return -ENOENT;
 
 	input_mt_slot(input, slot);
-	input_mt_report_slot_state(input, MT_TOOL_FINGER,
-				   status == SIS_STATUS_DOWN);
 
-	if (status == SIS_STATUS_DOWN) {
+	if (input_mt_report_slot_state(input, MT_TOOL_FINGER,
+		status == SIS_STATUS_DOWN)) {
 		pressure = height = width = 1;
 		if (id != SIS_ALL_IN_ONE_PACKAGE) {
 			if (SIS_PKT_HAS_AREA(id)) {
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
diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
index ce4828b1415a..6981790dd541 100644
--- a/drivers/input/touchscreen/surface3_spi.c
+++ b/drivers/input/touchscreen/surface3_spi.c
@@ -75,8 +75,8 @@ static void surface3_spi_report_touch(struct surface3_ts_data *ts_data,
 		return;
 
 	input_mt_slot(ts_data->input_dev, slot);
-	input_mt_report_slot_state(ts_data->input_dev, MT_TOOL_FINGER, st);
-	if (st) {
+	if (input_mt_report_slot_state(ts_data->input_dev,
+		MT_TOOL_FINGER, st)) {
 		input_report_abs(ts_data->input_dev,
 				 ABS_MT_POSITION_X,
 				 get_unaligned_le16(&finger->x));
diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touchscreen/wacom_w8001.c
index 3715d1eace92..cf2f233cdbfb 100644
--- a/drivers/input/touchscreen/wacom_w8001.c
+++ b/drivers/input/touchscreen/wacom_w8001.c
@@ -155,8 +155,7 @@ static void parse_multi_touch(struct w8001 *w8001)
 		bool touch = data[0] & (1 << i);
 
 		input_mt_slot(dev, i);
-		input_mt_report_slot_state(dev, MT_TOOL_FINGER, touch);
-		if (touch) {
+		if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, touch)) {
 			x = (data[6 * i + 1] << 7) | data[6 * i + 2];
 			y = (data[6 * i + 3] << 7) | data[6 * i + 4];
 			/* data[5,6] and [11,12] is finger capacity */
diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 5230519b0f74..37ae4599c0db 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -386,10 +386,8 @@ static int zforce_touch_event(struct zforce_ts *ts, u8 *payload)
 		/* the zforce id starts with "1", so needs to be decreased */
 		input_mt_slot(ts->input, point.id - 1);
 
-		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER,
-						point.state != STATE_UP);
-
-		if (point.state != STATE_UP) {
+		if (input_mt_report_slot_state(ts->input, MT_TOOL_FINGER,
+			point.state != STATE_UP)) {
 			input_report_abs(ts->input, ABS_MT_POSITION_X,
 					 point.coord_x);
 			input_report_abs(ts->input, ABS_MT_POSITION_Y,
diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
index 9e409bb13642..a127348a2bf3 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -97,6 +97,7 @@ static inline bool input_is_mt_axis(int axis)
 	return axis == ABS_MT_SLOT || input_is_mt_value(axis);
 }
 
+void input_mt_report_slot_inactive(struct input_dev *dev);
 bool input_mt_report_slot_state(struct input_dev *dev,
 				unsigned int tool_type, bool active);
 
-- 
2.19.2

