Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4A61067BF
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfKVIYg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:24:36 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:4441 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfKVIYf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:24:35 -0500
IronPort-SDR: tdpnniA2kz07zUJnoAD6QhKwO8mRKQx2BlJdK884m8PqiptUriJ1N5sOQiObmetbvCwYRiUUHL
 Pny+RNcp5GYyMx1ftNXMQ/nKjfCv3bxb+JKDZrb9xNGDKmObXvePxpZBtYxM7nUqZuj8Ano5dl
 /ULF/nsduCjmQp8SOsRzD9ZdIwCTxPGzBgzh56ZtOa8UqqTIC5O2CxaRo8SuiI/SZd04xZtBPn
 UX9MbW0N+xdX2yuEQLkqUjEONlXB9ZM5AyJ9I4YO0ibdVsCI0zUsKG28/ZwpZwk682IZQjcJHr
 uo8=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43457556"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:24:34 -0800
IronPort-SDR: tDcnMsOUugxqnaL7O+C8fZ0Yxmcp85JaaB0dbbiStgpff87Lwiu/QuOaUlTP08dwbCOWImWh4v
 LBTc2tLuFu5LlBrHntRYXE11LcViFP04YTx64yLCOdD7S2vBSlUpeN8DNb9AcGMfVQ3AG/pptz
 YQ4rcfINWK1Lh1nc4GxZNBJPVxzQJRMJUa6pQghe6ugBshnQwmvpyAPFx5CeWY2of1Hq0G0mRk
 DaOUK/3HvsUih6JSpEeF4w7KpvIbz3iIg36m2/JsgjPqxqOpA1We/Szh1sNGWM4fO7+Z9gnuoZ
 hYA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 08/48] Input: atmel_mxt_ts - implement T15 Key Array support
Date:   Fri, 22 Nov 2019 17:23:22 +0900
Message-ID: <20191122082402.18173-9-jiada_wang@mentor.com>
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

There is a key array object in many maXTouch chips which allows some X/Y
lines to be used as a key array. This patch maps them to a series of keys
which may be configured in a platform data array.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 15bb074b5abf3a101f7b79544213f1c110ea4cab)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Fix compilation warning]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 85 ++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 405bff1c2055..2df3104e94b9 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -314,6 +314,9 @@ struct mxt_data {
 	struct mxt_dbg dbg;
 	struct gpio_desc *reset_gpio;
 	bool use_retrigen_workaround;
+	unsigned long t15_keystatus;
+	int t15_num_keys;
+	const unsigned int *t15_keymap;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -324,6 +327,8 @@ struct mxt_data {
 	u16 T71_address;
 	u8 T9_reportid_min;
 	u8 T9_reportid_max;
+	u8 T15_reportid_min;
+	u8 T15_reportid_max;
 	u16 T18_address;
 	u8 T19_reportid;
 	u8 T42_reportid_min;
@@ -987,6 +992,38 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 	data->update_input = true;
 }
 
+static void mxt_proc_t15_messages(struct mxt_data *data, u8 *msg)
+{
+	struct input_dev *input_dev = data->input_dev;
+	struct device *dev = &data->client->dev;
+	int key;
+	bool curr_state, new_state;
+	bool sync = false;
+	unsigned long keystates = le32_to_cpu((__force __le32)msg[2]);
+
+	for (key = 0; key < data->t15_num_keys; key++) {
+		curr_state = test_bit(key, &data->t15_keystatus);
+		new_state = test_bit(key, &keystates);
+
+		if (!curr_state && new_state) {
+			dev_dbg(dev, "T15 key press: %u\n", key);
+			__set_bit(key, &data->t15_keystatus);
+			input_event(input_dev, EV_KEY,
+				    data->t15_keymap[key], 1);
+			sync = true;
+		} else if (curr_state && !new_state) {
+			dev_dbg(dev, "T15 key release: %u\n", key);
+			__clear_bit(key, &data->t15_keystatus);
+			input_event(input_dev, EV_KEY,
+				    data->t15_keymap[key], 0);
+			sync = true;
+		}
+	}
+
+	if (sync)
+		input_sync(input_dev);
+}
+
 static void mxt_proc_t42_messages(struct mxt_data *data, u8 *msg)
 {
 	struct device *dev = &data->client->dev;
@@ -1045,6 +1082,9 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	} else if (report_id == data->T19_reportid) {
 		mxt_input_button(data, message);
 		data->update_input = true;
+	} else if (report_id >= data->T15_reportid_min
+		   && report_id <= data->T15_reportid_max) {
+		mxt_proc_t15_messages(data, message);
 	} else {
 		mxt_dump_message(data, message);
 	}
@@ -1706,6 +1746,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T71_address = 0;
 	data->T9_reportid_min = 0;
 	data->T9_reportid_max = 0;
+	data->T15_reportid_min = 0;
+	data->T15_reportid_max = 0;
 	data->T18_address = 0;
 	data->T19_reportid = 0;
 	data->T42_reportid_min = 0;
@@ -1784,6 +1826,10 @@ static int mxt_parse_object_table(struct mxt_data *data,
 						object->num_report_ids - 1;
 			data->num_touchids = object->num_report_ids;
 			break;
+		case MXT_TOUCH_KEYARRAY_T15:
+			data->T15_reportid_min = min_id;
+			data->T15_reportid_max = max_id;
+			break;
 		case MXT_SPT_COMMSCONFIG_T18:
 			data->T18_address = object->start_address;
 			break;
@@ -2077,6 +2123,7 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 	int error;
 	unsigned int num_mt_slots;
 	unsigned int mt_flags = 0;
+	int i;
 
 	switch (data->multitouch) {
 	case MXT_TOUCH_MULTI_T9:
@@ -2190,6 +2237,15 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 				     0, 255, 0, 0);
 	}
 
+	/* For T15 Key Array */
+	if (data->T15_reportid_min) {
+		data->t15_keystatus = 0;
+
+		for (i = 0; i < data->t15_num_keys; i++)
+			input_set_capability(input_dev, EV_KEY,
+					data->t15_keymap[i]);
+	}
+
 	input_set_drvdata(input_dev, data);
 
 	error = input_register_device(input_dev);
@@ -3148,8 +3204,10 @@ static void mxt_input_close(struct input_dev *dev)
 static int mxt_parse_device_properties(struct mxt_data *data)
 {
 	static const char keymap_property[] = "linux,gpio-keymap";
+	static const char buttons_property[] = "atmel,key-buttons";
 	struct device *dev = &data->client->dev;
 	u32 *keymap;
+	u32 *buttonmap;
 	int n_keys;
 	int error;
 
@@ -3179,6 +3237,33 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 		data->t19_num_keys = n_keys;
 	}
 
+	if (device_property_present(dev, buttons_property)) {
+		n_keys = device_property_read_u32_array(dev, buttons_property,
+							NULL, 0);
+		if (n_keys <= 0) {
+			error = n_keys < 0 ? n_keys : -EINVAL;
+			dev_err(dev, "invalid/malformed '%s' property: %d\n",
+				buttons_property, error);
+			return error;
+		}
+
+		buttonmap = devm_kmalloc_array(dev, n_keys, sizeof(*buttonmap),
+					       GFP_KERNEL);
+		if (!buttonmap)
+			return -ENOMEM;
+
+		error = device_property_read_u32_array(dev, buttons_property,
+						       buttonmap, n_keys);
+		if (error) {
+			dev_err(dev, "failed to parse '%s' property: %d\n",
+				buttons_property, error);
+			return error;
+		}
+
+		data->t15_keymap = buttonmap;
+		data->t15_num_keys = n_keys;
+	}
+
 	return 0;
 }
 
-- 
2.17.1

