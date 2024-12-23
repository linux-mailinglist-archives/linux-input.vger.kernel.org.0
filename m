Return-Path: <linux-input+bounces-8752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE909FB490
	for <lists+linux-input@lfdr.de>; Mon, 23 Dec 2024 20:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E2181885026
	for <lists+linux-input@lfdr.de>; Mon, 23 Dec 2024 19:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DE91FB4;
	Mon, 23 Dec 2024 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="STQttS7h"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD98185935
	for <linux-input@vger.kernel.org>; Mon, 23 Dec 2024 19:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734980689; cv=none; b=auNQWfciWdkWhUSqgLKJXiUHIBVeYoz8FAM4mQ6FcwsEdoatXuFI9R6PSF+IgHCKkPDRa6RobnsmlL9TA+STDLfDnzKg7mAins6RC0oc6juk1TdScF2xzJt9rGKM2+yFgb2/rShORYEvRsqns4rWIS9pz07QmxXQxrWkAP/S40U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734980689; c=relaxed/simple;
	bh=fI1PrZ1x8cYMO3vlDtsP8J8Epk4dq3/1D9XF71ckm2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6S8lx49oNpIbJAnCMUR2oyGSD1gPEvwhKdQ+4Ai2o12CTRJDwTaG9SRG/7pZBjtxGG4+dhOdhdwghQ17hw1AOdX6uaFIAlEyTb+02LUInHeQbLyBzXPTzdCc3ekfAbVA8qRqd5bDI0Vc9Ou1UFn/dvoRvqveARNYi6ZnW645uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=STQttS7h; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEBEF101EC10A;
	Mon, 23 Dec 2024 20:04:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734980678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mM0rlLXdlXoDRTgwEyuZ4WcUIKqRD3/f39hxoKd928s=;
	b=STQttS7hb+nxzWNOf5jP1nMM6drx95fxzXraNIk6sOpTFBFwTCTwM7CTstj3CHchSH5zXZ
	8fA9LJs1LyLzGF+8wLzGO5F0lvK+PKQ8Kc5513xcpCSQLM/qmXrYZKhKZY9mLgz/kWH00U
	G3y5z7RaryGVe9V63yBwUx4MtaAe0g19yJfvIp07U29PUugjquv7UkB61hLdKtj6Qvac1G
	m9kvBb2n32edDNDBKtGB8MW7TyCUzVDXj7kQOHB0/PHxg1Af6OuNNrY2n2vzAC1/EYxt+C
	B87b75/z1EzIFG8Amz5v/ojkX2XVJCoawvugoVyYerwRtbmiKVtihL2CvChaYw==
From: Marek Vasut <marex@denx.de>
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michael <mksgong@gmail.com>,
	Nick Dyer <nick@shmanahar.org>
Subject: [PATCH] Input: atmel_mxt_ts - support KoD knob
Date: Mon, 23 Dec 2024 20:03:24 +0100
Message-ID: <20241223190416.52871-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add support for T152 KoD knob events [1]. The KoD touch controller
family supports up to two knobs attached to the glass. Each knob can
be turned in either direction and the touch controller processes the
event and reports the knob position for each knob. Each knob is also
pressure sensitive, the pressure is reported as well. Each knob also
supports center press and additional buttons, which are reported as
BTN_0/BTN_1 for the center press for each knob, and BTN_A/BTN_B for
the additional buttons on the knob.

The knob is similar to Dell Canvas 27 knob already supported by
hid-multitouch, except it is non-removable and there can be up to
two such knobs .

This implementation is extracted and heavily reworked from Atmel
downstream patchset work by Michael <mksgong@gmail.com> from [2]
branch master as of commit 9c77fbf32982 ("Merge pull request #35
from atmel-maxtouch/20240103_HA_protocol_fixes").

[1] https://www.microchip.com/en-us/products/touch-and-gesture/maxtouch-touchscreen-controllers/kod-family
[2] https://github.com/atmel-maxtouch/maXTouch_linux

Signed-off-by: Marek Vasut <marex@denx.de>
---
Note: I am not sure whether reporting the second wheel as GAS/REL_HWHEEL
      is the right thing to do, I don't think it is. Maybe there is some
      better way to handle multiple knobs ?
---
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael <mksgong@gmail.com>
Cc: Nick Dyer <nick@shmanahar.org>
Cc: linux-input@vger.kernel.org
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 111 +++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 6cd1c87eb1877..04b979e1501d2 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -75,6 +75,7 @@
 #define MXT_SPT_CTECONFIG_T46		46
 #define MXT_SPT_DYNAMICCONFIGURATIONCONTAINER_T71 71
 #define MXT_TOUCH_MULTITOUCHSCREEN_T100 100
+#define MXT_SPT_WIDGET_T152		152
 
 /* MXT_GEN_MESSAGE_T5 object */
 #define MXT_RPTID_NOMSG		0xff
@@ -186,6 +187,22 @@ enum t100_type {
 	MXT_T100_TYPE_LARGE_TOUCH	= 6,
 };
 
+/* T152 Message Types */
+#define MXT_BUTTON_KNOB		0x02
+#define MXT_POSITION_KNOB	0x03
+
+/* T152 Widget Object */
+#define MXT_T152_MAXDETENT	0x0a
+
+/* T152 Knob masks */
+#define MXT_KNOB_TYPE_MASK	0x07
+#define MXT_KNOB_EVENT_MASK	0x07
+
+/* T152 Position Events */
+#define MXT_POS_PUSH_MOVE	0x03
+#define MXT_POS_PUSH		0x04
+#define MXT_POS_UNPUSH		0x06
+
 #define MXT_DISTANCE_ACTIVE_TOUCH	0
 #define MXT_DISTANCE_HOVERING		1
 
@@ -336,6 +353,10 @@ struct mxt_data {
 	u8 T97_reportid_max;
 	u8 T100_reportid_min;
 	u8 T100_reportid_max;
+	u16 T152_address;
+	u8 T152_reportid_min;
+	u8 T152_reportid_max;
+	u8 T152_obj_size;
 
 	/* for fw update in bootloader */
 	struct completion bl_completion;
@@ -1026,6 +1047,41 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 	data->update_input = true;
 }
 
+static void mxt_proc_t152_messages(struct mxt_data *data, u8 *message)
+{
+	struct input_dev *input_dev = data->input_dev;
+	int id = message[0] - data->T152_reportid_min;
+	u8 msg_type = message[1] & MXT_KNOB_TYPE_MASK;
+	u16 state;
+
+	if (msg_type == MXT_BUTTON_KNOB) {
+		state = get_unaligned_le16(&message[5]);
+		input_report_key(data->input_dev, BTN_0, !!(state & BIT(0)));
+		input_report_key(data->input_dev, BTN_1, !!(state & BIT(1)));
+		input_sync(data->input_dev);
+	} else if (msg_type == MXT_POSITION_KNOB) {
+		input_mt_report_slot_state(input_dev, MT_TOOL_DIAL, 1);
+
+		input_report_abs(input_dev, id ? ABS_GAS : ABS_WHEEL,
+				 get_unaligned_le16(&message[5]));
+		input_report_abs(input_dev, ABS_PRESSURE, message[8]);
+
+		/* Knob turn CCW is 0xffff or -1 , CW is 1 */
+		input_report_rel(input_dev, id ? REL_HWHEEL : REL_WHEEL,
+				 (s16)get_unaligned_le16(&message[3]));
+
+		state = message[2] & MXT_KNOB_EVENT_MASK;
+		if (state == MXT_POS_PUSH || state == MXT_POS_PUSH_MOVE)
+			input_report_key(input_dev, id ? BTN_B : BTN_A, 1);
+		else if (state == MXT_POS_UNPUSH)
+			input_report_key(input_dev, id ? BTN_B : BTN_A, 0);
+
+		input_mt_report_slot_inactive(input_dev);
+
+		input_sync(input_dev);
+	}
+}
+
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
@@ -1053,6 +1109,9 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	} else if (report_id >= data->T100_reportid_min &&
 		   report_id <= data->T100_reportid_max) {
 		mxt_proc_t100_message(data, message);
+	} else if (report_id >= data->T152_reportid_min &&
+		   report_id <= data->T152_reportid_max) {
+		mxt_proc_t152_messages(data, message);
 	} else if (report_id == data->T19_reportid) {
 		mxt_input_button(data, message);
 		data->update_input = true;
@@ -1747,6 +1806,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T97_reportid_max = 0;
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
+	data->T152_reportid_min = 0;
+	data->T152_reportid_max = 0;
 	data->max_reportid = 0;
 }
 
@@ -1841,6 +1902,12 @@ static int mxt_parse_object_table(struct mxt_data *data,
 			/* first two report IDs reserved */
 			data->num_touchids = object->num_report_ids - 2;
 			break;
+		case MXT_SPT_WIDGET_T152:
+			data->T152_address = object->start_address;
+			data->T152_reportid_min = min_id;
+			data->T152_reportid_max = max_id;
+			data->T152_obj_size = mxt_obj_size(object);
+			break;
 		}
 
 		end_address = object->start_address
@@ -2235,6 +2302,50 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 					     EV_KEY, data->t15_keymap[i]);
 	}
 
+	/* For T152 knobs */
+	if (data->T152_address) {
+		u8 detent_ofs = data->T152_address + MXT_T152_MAXDETENT;
+		u8 bufp, bufs;
+
+		error = __mxt_read_reg(data->client, detent_ofs, 1, &bufp);
+		if (error)
+			goto err_free_mem;
+
+		error = __mxt_read_reg(data->client, detent_ofs + data->T152_obj_size,
+				       1, &bufs);
+		if (error)
+			goto err_free_mem;
+
+		if (bufp || bufs) {
+			input_set_abs_params(input_dev, ABS_MT_TOOL_TYPE,
+					     0, MT_TOOL_MAX, 0, 0);
+
+			/* Pressure reporting on both knobs */
+			input_set_capability(input_dev, EV_ABS, ABS_PRESSURE);
+			input_set_abs_params(input_dev, ABS_PRESSURE, 0, 255, 0, 0);
+		}
+
+		/* First knob */
+		if (bufp) {
+			input_set_capability(input_dev, EV_KEY, BTN_0);	/* Center */
+			input_set_capability(input_dev, EV_KEY, BTN_A);	/* Push */
+			input_set_capability(input_dev, EV_REL, REL_WHEEL);
+			input_set_capability(input_dev, EV_ABS, ABS_WHEEL);
+			input_set_abs_params(input_dev, ABS_WHEEL, 0, bufp - 1, 0, 0);
+			input_dev->relbit[0] |= BIT_MASK(REL_WHEEL);
+		}
+
+		/* Second knob */
+		if (bufs) {
+			input_set_capability(input_dev, EV_KEY, BTN_1);	/* Center */
+			input_set_capability(input_dev, EV_KEY, BTN_B);	/* Push */
+			input_set_capability(input_dev, EV_REL, REL_HWHEEL);
+			input_set_capability(input_dev, EV_ABS, ABS_GAS);
+			input_set_abs_params(input_dev, ABS_GAS, 0, bufs - 1, 0, 0);
+			input_dev->relbit[0] |= BIT_MASK(REL_HWHEEL);
+		}
+	}
+
 	input_set_drvdata(input_dev, data);
 
 	error = input_register_device(input_dev);
-- 
2.45.2


