Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D218FE28
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfHPIij (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:39 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:53868 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727366AbfHPIii (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:38 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:38:29 EDT
IronPort-SDR: vVbHbcEqNx/H59+/xb4C5fvihZqfEHBifIt8Ak1ZVwpRSv4+ZDAWw7NCH3Nb6VyqqC/Ec1dOL4
 byhbEsPd7F+ToQdxP4cn/nUN3Ci7UvUbGxAvd9GqC/4SzK7BDel/0HRfubD5dxLpDJGr3Xty/Y
 BkCdFkMHF7P3N18PfSDLg5nNHXjkf6hDF0CaDXs8bWZ4tQYXbkGK/fazFAb7FoHqWuDKq1AZoA
 thbNeSyhWl6Eui+DomLdXz8+wxNPX6LxstbFIpL/KjkcAdLV/uhR+li+pPk29eywhiQQhNSKRN
 KYA=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="42311172"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:31:32 -0800
IronPort-SDR: rt9n45pi2Hsv0zQZjiBdd5aOyKwXYQwKLyCDFfzt/FBSafEQVPQg4te+bvbF1RjZKSx2rlvzAH
 PLF+PsJxqdB2u+5pKfVZVgBqEQpG64rFlFsw4oa/Ub345V4tz7VJw46TCtmSiSCf88gzcqzTly
 7ELLXbap3oW/NE69nyv/I40mvGPTFP4+LeMAfeUhHfAjpiiq37yti0VqXQFXeqh/PBxq1eJrG0
 Sy4ds5oEzK6+cdWNdrESVz+/L7z+8kMdRPcCk0SbezKL+d1p6kJyD8iI3z4bYYOXr9ErYkKp7v
 vEQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 08/63] Input: atmel_mxt_ts - implement T15 Key Array support
Date:   Fri, 16 Aug 2019 17:30:35 +0900
Message-ID: <20190816083130.18250-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083130.18250-1-jiada_wang@mentor.com>
References: <20190816083130.18250-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index c619ac9f3108..99b87042dfe5 100644
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
@@ -986,6 +991,38 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
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
@@ -1044,6 +1081,9 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	} else if (report_id == data->T19_reportid) {
 		mxt_input_button(data, message);
 		data->update_input = true;
+	} else if (report_id >= data->T15_reportid_min
+		   && report_id <= data->T15_reportid_max) {
+		mxt_proc_t15_messages(data, message);
 	} else {
 		mxt_dump_message(data, message);
 	}
@@ -1703,6 +1743,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T71_address = 0;
 	data->T9_reportid_min = 0;
 	data->T9_reportid_max = 0;
+	data->T15_reportid_min = 0;
+	data->T15_reportid_max = 0;
 	data->T18_address = 0;
 	data->T19_reportid = 0;
 	data->T42_reportid_min = 0;
@@ -1781,6 +1823,10 @@ static int mxt_parse_object_table(struct mxt_data *data,
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
@@ -2074,6 +2120,7 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 	int error;
 	unsigned int num_mt_slots;
 	unsigned int mt_flags = 0;
+	int i;
 
 	switch (data->multitouch) {
 	case MXT_TOUCH_MULTI_T9:
@@ -2187,6 +2234,15 @@ static int mxt_initialize_input_device(struct mxt_data *data)
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
-- 
2.19.2

