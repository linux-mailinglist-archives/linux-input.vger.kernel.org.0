Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A9DE8215
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbfJ2HUw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:20:52 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:41247 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbfJ2HUv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:20:51 -0400
IronPort-SDR: 8LaxH50/F6Scqp/YpxQ0GLQskGYqE4UQLv4qQdXoza6+gAkmRge1Kf+jxlgnBTQNot9B6kFinR
 QDIY+/3VCdB0EHSzvEIKxs/8mDBUoz7eWHbrFGEnniBRpntKpCegptYrTFM0HKW7hLgAn7AVen
 NPL+0vCpTHlBsL41eXrdxyN3MmW0O7bRWSSlW1TzhprpxstwOn38uj1ubtOUiwIig9ZeUA7Rug
 m90ruxm4+0TJsr4JfktW8RtJX2c3mNgOgTByeVRhJLDc/morOdx+v1eawoAFfbTPG3BiGEpWi2
 Cxo=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="42663226"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:20:51 -0800
IronPort-SDR: d6HWkMOvRHDfrq9BoVFwqzMF3LczlwdhNbbmo4qM38Rx3xTZqRfm/FxXk6zwogHhZgEhMiJl6s
 WccAhLjX7c2X01KPrSnV8oZzroYF+/PBZbcNDISE9pq1B7g+i3I+4UradFPKhmNdIx5BtZoXVn
 aeYM6AkmbjtvJQg93iIxGzBGn86PyKec1HIX8JXEHMgeUzbGL5eIcsikWpy8Hv0uivphoGceKq
 GRWNk6ItvcgUOPKct5G97SH9S182dKfcN5VHQ82yZTTmy9KIOtoVgFDW3h2WGYXSI/729WKKmT
 qjs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 10/48] Input: atmel_mxt_ts - implement support for T107 active stylus
Date:   Tue, 29 Oct 2019 16:19:32 +0900
Message-ID: <20191029072010.8492-11-jiada_wang@mentor.com>
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

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 20e357dd9acf8c2040068c8b22d6bc1401a1893f)
[gdavis: Forward port and fix conflicts due to applying upstream commit
	 96a938aa214e ("Input: atmel_mxt_ts - remove platform data
	 support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 117 ++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 661bfe4a43b9..0557aea20067 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -72,6 +72,7 @@
 #define MXT_SPT_CTECONFIG_T46		46
 #define MXT_SPT_DYNAMICCONFIGURATIONCONTAINER_T71 71
 #define MXT_TOUCH_MULTITOUCHSCREEN_T100 100
+#define MXT_PROCI_ACTIVESTYLUS_T107	107
 
 /* MXT_GEN_MESSAGE_T5 object */
 #define MXT_RPTID_NOMSG		0xff
@@ -181,6 +182,7 @@ struct t37_debug {
 enum t100_type {
 	MXT_T100_TYPE_FINGER		= 1,
 	MXT_T100_TYPE_PASSIVE_STYLUS	= 2,
+	MXT_T100_TYPE_ACTIVE_STYLUS	= 3,
 	MXT_T100_TYPE_HOVERING_FINGER	= 4,
 	MXT_T100_TYPE_GLOVE		= 5,
 	MXT_T100_TYPE_LARGE_TOUCH	= 6,
@@ -192,6 +194,16 @@ enum t100_type {
 #define MXT_TOUCH_MAJOR_DEFAULT		1
 #define MXT_PRESSURE_DEFAULT		1
 
+/* Gen2 Active Stylus */
+#define MXT_T107_STYLUS_STYAUX		42
+#define MXT_T107_STYLUS_STYAUX_PRESSURE	BIT(0)
+#define MXT_T107_STYLUS_STYAUX_PEAK	BIT(4)
+
+#define MXT_T107_STYLUS_HOVER		BIT(0)
+#define MXT_T107_STYLUS_TIPSWITCH	BIT(1)
+#define MXT_T107_STYLUS_BUTTON0		BIT(2)
+#define MXT_T107_STYLUS_BUTTON1		BIT(3)
+
 /* Delay times */
 #define MXT_BACKUP_TIME		50	/* msec */
 #define MXT_RESET_GPIO_TIME	20	/* msec */
@@ -313,10 +325,12 @@ struct mxt_data {
 	struct t7_config t7_cfg;
 	struct mxt_dbg dbg;
 	struct gpio_desc *reset_gpio;
-	bool use_retrigen_workaround;
 	unsigned long t15_keystatus;
 	int t15_num_keys;
 	const unsigned int *t15_keymap;
+	u8 stylus_aux_pressure;
+	u8 stylus_aux_peak;
+	bool use_retrigen_workaround;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -337,6 +351,7 @@ struct mxt_data {
 	u8 T48_reportid;
 	u8 T100_reportid_min;
 	u8 T100_reportid_max;
+	u16 T107_address;
 
 	/* for fw update in bootloader */
 	struct completion bl_completion;
@@ -908,6 +923,8 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 	u8 major = 0;
 	u8 pressure = 0;
 	u8 orientation = 0;
+	bool active = false;
+	bool hover = false;
 
 	id = message[0] - data->T100_reportid_min - 2;
 
@@ -926,6 +943,8 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 		case MXT_T100_TYPE_HOVERING_FINGER:
 			tool = MT_TOOL_FINGER;
 			distance = MXT_DISTANCE_HOVERING;
+			hover = true;
+			active = true;
 
 			if (data->t100_aux_vect)
 				orientation = message[data->t100_aux_vect];
@@ -936,6 +955,8 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 		case MXT_T100_TYPE_GLOVE:
 			tool = MT_TOOL_FINGER;
 			distance = MXT_DISTANCE_ACTIVE_TOUCH;
+			hover = false;
+			active = true;
 
 			if (data->t100_aux_area)
 				major = message[data->t100_aux_area];
@@ -950,6 +971,9 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 
 		case MXT_T100_TYPE_PASSIVE_STYLUS:
 			tool = MT_TOOL_PEN;
+			distance = MXT_DISTANCE_ACTIVE_TOUCH;
+			hover = false;
+			active = true;
 
 			/*
 			 * Passive stylus is reported with size zero so
@@ -962,6 +986,31 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 
 			break;
 
+		case MXT_T100_TYPE_ACTIVE_STYLUS:
+			/* Report input buttons */
+			input_report_key(input_dev, BTN_STYLUS,
+					 message[6] & MXT_T107_STYLUS_BUTTON0);
+			input_report_key(input_dev, BTN_STYLUS2,
+					 message[6] & MXT_T107_STYLUS_BUTTON1);
+
+			/* stylus in range, but position unavailable */
+			if (!(message[6] & MXT_T107_STYLUS_HOVER))
+				break;
+
+			tool = MT_TOOL_PEN;
+			distance = MXT_DISTANCE_ACTIVE_TOUCH;
+			active = true;
+			major = MXT_TOUCH_MAJOR_DEFAULT;
+
+			if (!(message[6] & MXT_T107_STYLUS_TIPSWITCH)) {
+				hover = true;
+				distance = MXT_DISTANCE_HOVERING;
+			} else if (data->stylus_aux_pressure) {
+				pressure = message[data->stylus_aux_pressure];
+			}
+
+			break;
+
 		case MXT_T100_TYPE_LARGE_TOUCH:
 			/* Ignore suppressed touch */
 			break;
@@ -976,12 +1025,12 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 	 * Values reported should be non-zero if tool is touching the
 	 * device
 	 */
-	if (!pressure && type != MXT_T100_TYPE_HOVERING_FINGER)
+	if (!pressure && !hover)
 		pressure = MXT_PRESSURE_DEFAULT;
 
 	input_mt_slot(input_dev, id);
 
-	if (status & MXT_T100_DETECT) {
+	if (active) {
 		dev_dbg(dev, "[%u] type:%u x:%u y:%u a:%02X p:%02X v:%02X\n",
 			id, type, x, y, major, pressure, orientation);
 
@@ -992,6 +1041,7 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 		input_report_abs(input_dev, ABS_MT_PRESSURE, pressure);
 		input_report_abs(input_dev, ABS_MT_DISTANCE, distance);
 		input_report_abs(input_dev, ABS_MT_ORIENTATION, orientation);
+
 	} else {
 		dev_dbg(dev, "[%u] release\n", id);
 
@@ -1863,6 +1913,9 @@ static int mxt_parse_object_table(struct mxt_data *data,
 			/* first two report IDs reserved */
 			data->num_touchids = object->num_report_ids - 2;
 			break;
+		case MXT_PROCI_ACTIVESTYLUS_T107:
+			data->T107_address = object->start_address;
+			break;
 		}
 
 		end_address = object->start_address
@@ -2023,6 +2076,54 @@ static int mxt_read_t9_resolution(struct mxt_data *data)
 	return 0;
 }
 
+static int mxt_set_up_active_stylus(struct input_dev *input_dev,
+				    struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+	int error;
+	struct mxt_object *object;
+	u8 styaux;
+	int aux;
+	u8 ctrl;
+
+	object = mxt_get_object(data, MXT_PROCI_ACTIVESTYLUS_T107);
+	if (!object)
+		return 0;
+
+	error = __mxt_read_reg(client, object->start_address, 1, &ctrl);
+	if (error)
+		return error;
+
+	/* Check enable bit */
+	if (!(ctrl & 0x01))
+		return 0;
+
+	error = __mxt_read_reg(client,
+			       object->start_address + MXT_T107_STYLUS_STYAUX,
+			       1, &styaux);
+	if (error)
+		return error;
+
+	/* map aux bits */
+	aux = 7;
+
+	if (styaux & MXT_T107_STYLUS_STYAUX_PRESSURE)
+		data->stylus_aux_pressure = aux++;
+
+	if (styaux & MXT_T107_STYLUS_STYAUX_PEAK)
+		data->stylus_aux_peak = aux++;
+
+	input_set_capability(input_dev, EV_KEY, BTN_STYLUS);
+	input_set_capability(input_dev, EV_KEY, BTN_STYLUS2);
+	input_set_abs_params(input_dev, ABS_MT_TOOL_TYPE, 0, MT_TOOL_MAX, 0, 0);
+
+	dev_dbg(&client->dev,
+		"T107 active stylus, aux map pressure:%u peak:%u\n",
+		data->stylus_aux_pressure, data->stylus_aux_peak);
+
+	return 0;
+}
+
 static int mxt_read_t100_config(struct mxt_data *data)
 {
 	struct i2c_client *client = data->client;
@@ -2229,7 +2330,7 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 
 	if (data->multitouch == MXT_TOUCH_MULTI_T9 ||
 	    (data->multitouch == MXT_TOUCH_MULTITOUCHSCREEN_T100 &&
-	     data->t100_aux_ampl)) {
+	     (data->t100_aux_ampl || data->stylus_aux_pressure))) {
 		input_set_abs_params(input_dev, ABS_MT_PRESSURE,
 				     0, 255, 0, 0);
 	}
@@ -2247,6 +2348,14 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 				     0, 255, 0, 0);
 	}
 
+	/* For T107 Active Stylus */
+	if (data->multitouch == MXT_TOUCH_MULTITOUCHSCREEN_T100 &&
+	    data->T107_address) {
+		error = mxt_set_up_active_stylus(input_dev, data);
+		if (error)
+			dev_warn(dev, "Failed to read T107 config\n");
+	}
+
 	/* For T15 Key Array */
 	if (data->T15_reportid_min) {
 		data->t15_keystatus = 0;
-- 
2.17.1

