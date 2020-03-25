Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E18192A14
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgCYNga (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:30 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53281 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgCYNg3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:29 -0400
IronPort-SDR: kG2x4Gg05lcrS35OVR6feQPyda5WjFXtKaIxLzWpltrUkRJa/CzPtFru0OzTl9QAK2noVrta7O
 3uRHyBdb6pb+8j1DLNwdhY57unX+mMByHiR2SfQ8xKNc5fZR+atkAubj0ZPq6CZNgjOGmWCzb2
 WRYw2885NwvR7gSEJu3EgdUS1yxTDBl2HitgrM5XX+aVQq0EndmkOO45vQTv5nuWKUxez3HkWx
 VkX7PRYcCFyr8SC7kff1VnWk+9NdfwSLHaskzG/zTa4vWi0j4nhZuNtmxKTfgvs+WuIYbIaj1g
 4uw=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099796"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:28 -0800
IronPort-SDR: y1rwnUC7HufZodQTdR04M5arpJ70PyNLD3f2JqlTrQ1Ff85ieqd36qzWpgB/EAv80kGJxGwOOa
 kWAvKqbdnxmX0+U9PB/xfkeFL2S+fd9hUUcYDAu4gpWgQzHd0mYDlMNaMieL0CiOhYhO2ciByD
 cFQMiG4Ryi3FZxEiq4gJXuGJB2cYW+BZ0f44iX6BZgjyu++3sHG4MtXDrrFwoXxUxtB27UFpFF
 rb2lvMasgSvWj2mQu0qX1JPE5HJOQ1Fogdo6P5T0AxDR2m8i9PX6+ilo0x1DEIKh7dLBiwKhaG
 NGs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 42/55] Input: atmel_mxt_ts: Limit the max bytes transferred in an i2c transaction
Date:   Wed, 25 Mar 2020 06:33:21 -0700
Message-ID: <20200325133334.19346-43-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 65 +++++++++++++++++++-----
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 54cd6219cbaa..384b53717139 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -417,6 +417,7 @@ struct mxt_data {
 	/* Indicates whether device is updating configuration */
 	bool updating_config;
 
+	unsigned int mtu;
 	bool t25_status;
 };
 
@@ -1462,11 +1463,32 @@ static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
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
@@ -1476,18 +1498,19 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
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
@@ -1497,16 +1520,25 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
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
@@ -1521,9 +1553,10 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
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
@@ -4120,6 +4153,10 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 
 	device_property_read_u32(dev, "atmel,suspend-mode",
 				 &data->suspend_mode);
+	device_property_read_u32(dev, "atmel,mtu", &data->mtu);
+	if (data->mtu)
+		dev_dbg(dev, "mtu is set as %d\n", data->mtu);
+
 	return 0;
 }
 
-- 
2.17.1

