Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55DBB4A94
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbfIQJes (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:34:48 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:21876 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbfIQJer (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:34:47 -0400
IronPort-SDR: x0X6iVCiTfMnYhX/tiMJ5Wavw7IeHUonNw4r3Ok4WD5pQETL7jgME5nSdWMvFu8Tz+PML0XDYB
 v7tcLLWKanEpEP/mf3xxT/N1uD6ZlQIevzLLTeqU60as2uUtZ0D5yDzIMFRJVRLnWnpn09CQJn
 C3AJ2p0V+b4PpgeEMP3P/goxsIUzYEmEjPdvfO6YScLiGj9VJtoXwjwZ7zUp/wuzenaO25XALw
 dOgmzpp3hlQF5rx/727B0ANknnRko6vZcfw1sct0FPtfWNH5Jgtf0BJOWZmZ99xhvH9WL5N91C
 U1M=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41422943"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:34:46 -0800
IronPort-SDR: ea0qeJFJ6pWHiW2TkJP7zDez6MYjT9gPKvp0pqx6lumJzcW+K5KRGrmXzoVTNITPXlbyZG3Rlg
 YF5eAL6Ti3SqTotQrpsu5VQvuo+tyKB/nV4/VSSZBE2IIqOTnsgqDKh0PUO6P2D/I6ZjK+Gvd4
 JE7hkFvOt6GOJatweeP1LugdIEpm8dDU0hkMeoKQd9E4SQDeqY/K3AsdNHeEGHzO2O5HY4ZnD/
 JzlFP4Dr4pBNcmdhw1xFchzJCmW0EYk2EnFmGkvtOcR690FFOV9evid2phrspk8lpS0ibsBsjC
 rjg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 01/49] Input: switch to use return value of input_mt_report_slot_state
Date:   Tue, 17 Sep 2019 18:32:32 +0900
Message-ID: <20190917093320.18134-2-jiada_wang@mentor.com>
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

Currently several places are calling input_mt_report_slot_state()
like following:

input_mt_report_slot_state(dev, tool_type, active)
if (active) {
    ...
    < report events for active slot >
}

when 'active' is false, input_mt_report_slot_state() will always
return false, so instead of checking 'active', switch to use
return value of input_mt_report_slot_state()

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/hid/hid-asus.c                      |  3 +--
 drivers/hid/hid-elan.c                      |  3 +--
 drivers/hid/hid-logitech-hidpp.c            |  5 ++---
 drivers/hid/hid-magicmouse.c                |  3 +--
 drivers/hid/hid-multitouch.c                |  3 +--
 drivers/hid/hid-sony.c                      |  8 ++++----
 drivers/hid/wacom_wac.c                     | 15 +++++----------
 drivers/input/mouse/elantech.c              |  5 ++---
 drivers/input/mouse/focaltech.c             |  3 +--
 drivers/input/mouse/sentelic.c              |  3 +--
 drivers/input/mouse/synaptics.c             |  3 +--
 drivers/input/rmi4/rmi_2d_sensor.c          |  6 ++----
 drivers/input/touchscreen/chipone_icn8505.c |  4 ++--
 drivers/input/touchscreen/egalax_ts.c       |  3 +--
 drivers/input/touchscreen/hideep.c          |  7 +++----
 drivers/input/touchscreen/ili210x.c         |  3 +--
 drivers/input/touchscreen/mms114.c          |  4 ++--
 drivers/input/touchscreen/penmount.c        |  5 ++---
 drivers/input/touchscreen/raydium_i2c_ts.c  |  4 ++--
 drivers/input/touchscreen/sis_i2c.c         |  5 ++---
 drivers/input/touchscreen/surface3_spi.c    |  4 ++--
 drivers/input/touchscreen/wacom_w8001.c     |  3 +--
 drivers/input/touchscreen/zforce_ts.c       |  6 ++----
 23 files changed, 42 insertions(+), 66 deletions(-)

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
index b603c14d043b..672396ed413e 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1020,8 +1020,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
 	}
 
 	input_mt_slot(input, slotnum);
-	input_mt_report_slot_state(input, tool, active);
-	if (active) {
+	if (input_mt_report_slot_state(input, tool, active)) {
 		/* this finger is in proximity of the sensor */
 		int wide = (*slot->w > *slot->h);
 		int major = max(*slot->w, *slot->h);
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
diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index a5ab774da4cc..ea46da04e517 100644
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
-- 
2.19.2

