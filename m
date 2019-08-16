Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 307028FE16
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfHPIhx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:53 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36144 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfHPIhx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:53 -0400
IronPort-SDR: rlR64JPVEtnzyyvHcGaxzA58fyIvCtl+HsJiFJ8y8+6e5ZGAfLOGyADnFOZ3LyTG+cCL5tuvq1
 CDK9c3HBYA9Gvwtq8lUfSZiZu9YQusyQEXXRxCIasLDYiMlPbJZLxi+dCCAwngvFjMeiZ1ANy6
 uimK8hMZgWn9vO9s+Ka6l5xjvc2Lz6v3XgQk1MOiygzeZfhPw4ZNqKRoqH3guHyPMhrioU6ukl
 C4LQvCBa8Mgo3GwBNQxBIgdV8p54aSmKw/JdL4BXU7YtgYr0CyXiF3Pbi0rDjsPSCcAuKx8BA5
 jhU=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40519180"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:37:52 -0800
IronPort-SDR: 1IQn60OvszqRMODRZsbHzlugzU9l4/MQgda60NhR/mZfWyZLr6BLb8EhR7pz3eixNExiWPR+l9
 dheUXwtLgtP+enMsoIcY2IO8aEdrbYVqyvI9biG9mERCJdvWcjwPZ6eRxeAchNcvWRrOKQ+RRD
 ERSeU76c29cndilqX8avCmO0yV4UrivUWiRo487Vf4iO+uyHDSlSNZKWelmyUAKWTH5TLF1bkf
 LLCTDrDU4kitcUyomCP2JTc1dcq+Oc4S2CS/rZcBlAJLp7f87C0LZ39AKYqsPjpYcwy3NcmTVI
 /WU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 51/63] input: Atmel: limit the max bytes transferred while reading T5 messages
Date:   Fri, 16 Aug 2019 17:37:45 +0900
Message-ID: <20190816083757.19449-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083757.19449-1-jiada_wang@mentor.com>
References: <20190816083757.19449-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

"a008387 Input: atmel_mxt_ts: Limit the max bytes transferred in an i2c
transaction" limited the Max bytes transferred in i2c transaction while
reading T5 message in mxt_process_messages_until_invalid().

mxt_process_messages_t44() reads the T44 message which contains the
pending T5 message count. If the number of pending T5 messages returned
by T44 message is too high then there is a risk of i2c transaction
timeout while reading T5 messages in mxt_process_messages_t44().

To avoid i2c transaction timeout, this commit limits the max bytes
transferred in a single transaction while reading T5 messages in
mxt_process_messages_t44() depending on the property 'atmel,mtu'.
This improvement is created based on the commit "a008387 Input:
atmel_mxt_ts: Limit the max bytes transferred in an i2c
transaction"

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 73 ++++++++++++++----------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 2041a82a4551..47c1e72152de 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1472,11 +1472,32 @@ static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
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
@@ -1486,18 +1507,19 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
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
@@ -1507,16 +1529,25 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
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
@@ -1527,29 +1558,13 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 	return IRQ_HANDLED;
 }
 
-static u8 mxt_max_msg_read_count(struct mxt_data *data)
-{
-	u8 count_limit = data->mtu / data->T5_msg_size;
-
-	if (!data->mtu)
-		return data->max_reportid;
-
-	if (data->mtu < data->T5_msg_size) {
-		WARN(1, "mtu set is lesser than the T5 message size\n");
-		/* Return count of 1, as fallback */
-		return 1;
-	}
-
-	return min(count_limit, data->max_reportid);
-}
-
 static int mxt_process_messages_until_invalid(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
 	int count, read;
 	int tries;
 
-	count = mxt_max_msg_read_count(data);
+	count = mxt_max_msg_read_count(data, data->max_reportid);
 	tries = (data->max_reportid / count) + 1;
 
 	/* Read messages until we force an invalid */
-- 
2.19.2

