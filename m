Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB675F0FBF
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731295AbfKFHEO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:04:14 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:8790 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731150AbfKFHEN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:04:13 -0500
IronPort-SDR: WEERYnpqKFqqWQA8jEwGh6N74+qBO0Rf/+Lu41uardGGyOP5fsIhEKN651zwmFN1s43jOpgiYj
 zau6EINNFDqM7Sjs/xppB6iws+BivOlK96ZOk85spUUTwqypQ+cy1oneWaP45nYNJ/ZOt7D7Ok
 DiHbS+EqHjGaznLUOeodmJ+TbRqIzy5Y5aCuIycXVs8uyTjyK0dEaDbLWrwZpIiJIpcm4llw5N
 rs+PbfmtDLjX9gkYnI3yOFy/tKY9/dO84tByZvlR82EwsQNrKA/onutvjK782ZojOYXTpcY/Nq
 MkE=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42908666"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:04:10 -0800
IronPort-SDR: mM8H5aR0ezoDOAhrJZV8w5hQHIAExeHN/N057DyE2W9vxgqj+o52zoe4oH7DxxE+gMpSMwrRy3
 N3xyiPgkJwBiAmEanAjVfmvs9gautMt9NOsREcIqvrsLxMvFqqpWmf1RuXl7l31riwlLx9qVb1
 UOgMbGAe55ZTn1xYXLDLOjuadfuhxK2hYuZE+VQErxkVDQC94cD+uvg6Jv262arqd91gKIhZua
 uejzGIkc1nWHQTrYHFH2YltYKw/BP8wD8C6j8mikMeuHKU5e3zsNmZpPjl1HBwNXSNoDOw4QIx
 ODw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 36/48] Input: atmel_mxt_ts: Limit the max bytes transferred in an i2c transaction
Date:   Wed, 6 Nov 2019 16:01:34 +0900
Message-ID: <20191106070146.18759-37-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>

In mxt_process_messages_until_invalid() function, driver tries to read
all possible reportid in a single i2c transaction. Number of bytes read
is limited by the max_reportid parameter.
If the max_reportid is a very large value, then a large chunk of bytes
will be requested from the controller in a single i2c transaction.
This transaction can fail due to timeout. This is visible when the
Atmel controller is connected to the SOC via a i2c mux hardware.

mxt_process_messages_t44() reads the T44 message which contains the
pending T5 message count. If the number of pending T5 messages returned
by T44 message is too high then there is a risk of i2c transaction
timeout while reading T5 messages in mxt_process_messages_t44().

New property 'atmel,mtu' is created. This property limits the maximum
number of bytes that can read/transferred in an i2c transcation

Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 .../bindings/input/atmel,maxtouch.txt         |  3 +
 drivers/input/touchscreen/atmel_mxt_ts.c      | 65 +++++++++++++++----
 2 files changed, 54 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index d7db16920083..62c93d94bc5d 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -42,6 +42,8 @@ Optional properties for main touchpad device:
 
 - atmel,input_name: Override name of input device from the default.
 
+- atmel,mtu: Maximum number of bytes that can read/transferred in an i2c transaction
+
 Example:
 
 	touch@4b {
@@ -49,4 +51,5 @@ Example:
 		reg = <0x4b>;
 		interrupt-parent = <&gpio>;
 		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
+		atmel,mtu = <200>
 	};
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 74866015572f..054aacc768b8 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -417,6 +417,7 @@ struct mxt_data {
 	/* Indicates whether device is updating configuration */
 	bool updating_config;
 
+	unsigned int mtu;
 	bool t25_status;
 };
 
@@ -1465,11 +1466,32 @@ static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
 	return num_valid;
 }
 
+static u8 mxt_max_msg_read_count(struct mxt_data *data, u8 max_T5_msg_count)
+{
+	u8 T5_msg_count_limit = data->mtu / data->T5_msg_size;
+
+	if (!data->mtu)
+		return max_T5_msg_count;
+
+	if (data->mtu < data->T5_msg_size) {
+		WARN(1, "mtu set is lesser than the T5 message size\n");
+		/* Return count of 1, as fallback */
+		return 1;
+	}
+	/*
+	 * Return maximum number of T5 messages in single i2c transaction
+	 * based on "atmel,mtu" property.
+	 */
+	return min(T5_msg_count_limit, max_T5_msg_count);
+}
+
 static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
 	int ret;
-	u8 count, num_left;
+	u8 T5_msg_count, total_pending;
+	u8 total_processed = 0;
+	u8 processed_valid = 0;
 
 	/* Read T44 and T5 together */
 	ret = __mxt_read_reg(data->client, data->T44_address,
@@ -1479,18 +1501,19 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 		return IRQ_NONE;
 	}
 
-	count = data->msg_buf[0];
+	T5_msg_count = data->msg_buf[0];
 
 	/*
 	 * This condition may be caused by the CHG line being configured in
 	 * Mode 0. It results in unnecessary I2C operations but it is benign.
 	 */
-	if (count == 0)
+	if (!T5_msg_count)
 		return IRQ_NONE;
 
-	if (count > data->max_reportid) {
-		dev_warn(dev, "T44 count %d exceeded max report id\n", count);
-		count = data->max_reportid;
+	if (T5_msg_count > data->max_reportid) {
+		dev_warn(dev, "T44 count %d exceeded max report id\n",
+			 T5_msg_count);
+		T5_msg_count = data->max_reportid;
 	}
 
 	/* Process first message */
@@ -1500,16 +1523,25 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 		return IRQ_NONE;
 	}
 
-	num_left = count - 1;
+	total_pending = T5_msg_count - 1;
+	if (!total_pending)
+		goto end;
 
 	/* Process remaining messages if necessary */
-	if (num_left) {
-		ret = mxt_read_and_process_messages(data, num_left);
+	T5_msg_count = mxt_max_msg_read_count(data, total_pending);
+
+	do {
+		if ((total_pending - total_processed) < T5_msg_count)
+			T5_msg_count = total_pending - total_processed;
+		ret = mxt_read_and_process_messages(data, T5_msg_count);
 		if (ret < 0)
 			goto end;
-		else if (ret != num_left)
-			dev_warn(dev, "Unexpected invalid message\n");
-	}
+		total_processed += T5_msg_count;
+		processed_valid += ret;
+	} while (total_processed < total_pending);
+
+	if (processed_valid != total_pending)
+		dev_warn(dev, "Unexpected invalid message\n");
 
 end:
 	if (data->update_input) {
@@ -1524,9 +1556,10 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
 	int count, read;
-	u8 tries = 2;
+	int tries;
 
-	count = data->max_reportid;
+	count = mxt_max_msg_read_count(data, data->max_reportid);
+	tries = (data->max_reportid / count) + 1;
 
 	/* Read messages until we force an invalid */
 	do {
@@ -4112,6 +4145,10 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 	}
 
 	device_property_read_u32(dev, "atmel,suspend-mode", &data->suspend_mode);
+	device_property_read_u32(dev, "atmel,mtu", &data->mtu);
+	if (data->mtu)
+		dev_dbg(dev, "mtu is set as %d\n", data->mtu);
+
 	return 0;
 }
 
-- 
2.17.1

