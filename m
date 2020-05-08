Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724FA1CA356
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgEHF7t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:49 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:25985 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbgEHF7s (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:48 -0400
IronPort-SDR: 3kC+npUIcCFn2o0Gv74DBilveB910z9153q7l84Urd9LFClXNyRsCswrJ7DGecQVVJVV3UHNki
 QRjBapsbUavufrdWcekUbYISq7ZUn5+Mxow1D+by2bl8xBKPPckrcGk1PUAY0g+EKW3cbWwd/A
 Rku38pXNbXjqqpMF0t4ZtGvWusJ4G6fVw1JkuArtGNWyx0+PRstvrlAQo75A7v932fkBLO9DXr
 OX4fmwmdAYxyPVrIoNl8L65q+pRXkMhNYuemJNwByIgnlX4ExKzu9OZ3LpwAYRZ0ICsA8tZbKn
 Xdc=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589141"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:48 -0800
IronPort-SDR: BL+rksDyMqLbv0rrYYXZ0itjcWNA8Igy/csAxlJ5JGwHKmK11Eg5wRSXc9U9UDV9SudL6HyCiv
 1Tc2BWtsBURRvLM9SV7MJJL+fHl8vHXMz/AxFRBY8jgZmRoPCRwasB1vzj5LtiutnGgJA+wbKi
 7MevQKQygFLjZEsIBarOEpdkB8zb9z6Xo5WdW1gs0jinfG6KomdCVc88sNdx47oxnnTPO/Kkrp
 fr9NtWUhPUvX8dZEHPLLMIarVZSHNBZzc8bPddeJaXKcOu0iQQVaAj1yAWam8OmGVvORH141AG
 ax8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 44/56] Input: atmel_mxt_ts: Limit the max bytes transferred in an i2c transaction
Date:   Thu, 7 May 2020 22:56:44 -0700
Message-ID: <20200508055656.96389-45-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>

Some I2C controllers constrain maximum transferred data in an I2C
transaction by set max_[read|write]_len of i2c_adapter_quirk.
Large i2c read transaction beyond this limitation may fail to complete,
cause I2C controller driver aborts the transaction and returns failure.

Therefore this patch was created to split the large i2c transaction into
smaller chunks which can complete
within the max_read_len defined by I2C controller driver.

Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
CC: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 62 ++++++++++++++++++------
 1 file changed, 48 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index c9ff450fa193..ed850a0bae69 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1463,11 +1463,34 @@ static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
 	return num_valid;
 }
 
+static u8 mxt_max_msg_read_count(struct mxt_data *data, u8 max_T5_msg_count)
+{
+	struct i2c_client *client = data->client;
+	u16 max_read_len = client->adapter->quirks->max_read_len;
+	u8 T5_msg_count_limit = max_read_len / data->T5_msg_size;
+
+	if (!max_read_len)
+		return max_T5_msg_count;
+
+	if (max_read_len < data->T5_msg_size) {
+		WARN(1, "max read length is lesser than the T5 message size\n");
+		/* Return count of 1, as fallback */
+		return 1;
+	}
+	/*
+	 * Return maximum number of T5 messages in single i2c transaction
+	 * based on max read length.
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
@@ -1477,18 +1500,19 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
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
@@ -1498,16 +1522,25 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
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
@@ -1522,9 +1555,10 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
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
-- 
2.17.1

