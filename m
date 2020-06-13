Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009E41F83C7
	for <lists+linux-input@lfdr.de>; Sat, 13 Jun 2020 16:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgFMO4t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jun 2020 10:56:49 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:48497 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgFMO4s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jun 2020 10:56:48 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49kgfH1pG8z1rqBD;
        Sat, 13 Jun 2020 16:56:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49kgfH0sThz1qql0;
        Sat, 13 Jun 2020 16:56:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id es-2Zid_irGo; Sat, 13 Jun 2020 16:56:37 +0200 (CEST)
X-Auth-Info: IXc09hmjkIW4W3/LqWnxbFTt56KYRRZ14FLW2hF8Bdw=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 13 Jun 2020 16:56:37 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Nick Dyer <nick@shmanahar.org>,
        Evan Green <evgreen@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH] Input: atmel_mxt_ts: Avoid excess read length on limited controllers
Date:   Sat, 13 Jun 2020 16:56:32 +0200
Message-Id: <20200613145632.113573-1-marex@denx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some I2C controllers have a hard limit on the number of data they can
transfer in one transfer (e.g. Xilinx XIIC has 255 bytes). The Atmel
MXT touchscreen driver mxt_process_messages_until_invalid() function
can trigger a read much longer than that (e.g. 690 bytes in my case).
This transfer can however be easily split into multiple shorter ones,
esp. since the single T5 message is 10 bytes or so.

This patch adds a check for the quirk presence and if it is present,
limits the number of messages read out of the controller such that
they are below the quirk limit. This makes it possible for the MXT
driver to work even on such limited controllers.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Nick Dyer <nick@shmanahar.org>
Cc: Evan Green <evgreen@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 30 ++++++++++++++++++------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f5..faa3f3f987d46 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -985,21 +985,37 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 
 static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
 {
+	const struct i2c_adapter_quirks *q = data->client->adapter->quirks;
 	struct device *dev = &data->client->dev;
-	int ret;
-	int i;
+	int i, ret, offset = 0;
+	u16 rem, chunk = count, total = count;
 	u8 num_valid = 0;
 
 	/* Safety check for msg_buf */
 	if (count > data->max_reportid)
 		return -EINVAL;
 
+	/* Handle controller read-length limitations */
+	if (q && q->max_read_len) {
+		chunk = min((u16)(q->max_read_len / data->T5_msg_size),
+			    (u16)count);
+	}
+
 	/* Process remaining messages if necessary */
-	ret = __mxt_read_reg(data->client, data->T5_address,
-				data->T5_msg_size * count, data->msg_buf);
-	if (ret) {
-		dev_err(dev, "Failed to read %u messages (%d)\n", count, ret);
-		return ret;
+	while (total) {
+		rem = min(total, chunk);
+		ret = __mxt_read_reg(data->client, data->T5_address,
+				     data->T5_msg_size * rem,
+				     data->msg_buf +
+					(offset * data->T5_msg_size));
+		if (ret) {
+			dev_err(dev,
+				"Failed to read %u messages (offset %u of total %u) (%d)\n",
+				rem, offset, count, ret);
+			return ret;
+		}
+		total -= rem;
+		offset += rem;
 	}
 
 	for (i = 0;  i < count; i++) {
-- 
2.26.2

