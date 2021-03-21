Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B2A3432E0
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhCUOLP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:15 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55833 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229913AbhCUOLJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:09 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 7077D5C010D;
        Sun, 21 Mar 2021 10:11:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=K095MDsa2rzvq
        +bTQ66D8DiKMgrE+in12AqXZ5ineXk=; b=nkC4TZFtCMuS0Cnbps014mBNRY6B1
        YeEwjobF1HkC85esKZ68D3PttjN+fXb24K8aeNAlh+ilJp2mOlr045DTrcQ+75PA
        X9ZSYujsCnUz4E98QFsRSkeuJ8hfXfNLUFoCqkNr1o2XNWi84tqJwKUDwQ0VO5fi
        NaqiX7E77S8Rrb+qlP42wA3kJo8sCR9b2mKISQs7spdYt+oB2Vg444RZzI4uh0Nt
        7Nn/ewbSaxNZLqSkW7fnLoUz8X2Gi5wRtNs8Oj8tfkZsGA6ZEEQSQYajloxgxSKe
        IThYbsxyslwkinxNVipJRrBvhCjqwJy2lJ7o5nqpWDT8dHmpvzzkdeVPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=K095MDsa2rzvq+bTQ66D8DiKMgrE+in12AqXZ5ineXk=; b=L6q7vKd/
        vr2PpeaH1Ndmb4xPgZNXgXFCNQ/BVvMwLkZe8vRPuesJFP/a28kFVEfb/HzhqmFS
        DeByvGVJxvQNlvoMHG7oxi5oDo0EqNLY4uusI6CIEtdJW+JwaeE5WwGY1htack0L
        EdNWjmYu0nZoh8Qu4drSTZkwJJWzyC8+U1+Dr0zXBw5uCpE2CVWGnm1jJrApGJ+E
        sazH3BBDNXsxyb9khilNmM8NcUUy0dhNziZrZalVIU7xrSjZgKtGg7ejvQNBB5rc
        yrTS8QB/NL66YUwSHs7lDjRnhi0kjfV3JDBpA0XvdlMRD4an5IysWNmBIIbxkdRq
        LirBsVqk2p34xA==
X-ME-Sender: <xms:_VNXYHtHKigiF1cypHnVYWHozGjGFhZ_6ecxYyXyLiv6nuTy8o438g>
    <xme:_VNXYIcNk-0AaKriu8HEzoug-OexI0ZnWPBOdwZ-SVbY9-TCvfV428q-hlD-PsdSM
    te-7sBCeezxMcAwMns>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:_VNXYKxkmMed-ovt2uvmXt3d-yfLkD2ckGzyP9DwYQfeACfT2KlyPQ>
    <xmx:_VNXYGPRyCG6PcuH3Rr8kUGTY9BTlWySyUkty2Yzu1OLzkBg03cxdQ>
    <xmx:_VNXYH_dJ-w-VQvQSYtkWQSomAk8LCPh881_f_-PhYTuGtCayKXpsA>
    <xmx:_VNXYKbSD2hcfjwhtkdTwrQCitYjLefoh6FqWXiqUMKdqGmgXQsBKw>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7EBD2240138;
        Sun, 21 Mar 2021 10:11:08 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 5/9] Input: wacom_i2c - Add support for distance and tilt x/y
Date:   Sun, 21 Mar 2021 10:10:45 -0400
Message-Id: <20210321141049.148-6-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321141049.148-1-alistair@alistair23.me>
References: <20210321141049.148-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is based on the out of tree rM2 driver.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 9b2ed0463d09..929680dce9cf 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -22,12 +22,16 @@
 #define WACOM_CMD_QUERY3	0x02
 #define WACOM_CMD_THROW0	0x05
 #define WACOM_CMD_THROW1	0x00
-#define WACOM_QUERY_SIZE	19
+#define WACOM_QUERY_SIZE	22
 
 struct wacom_features {
 	int x_max;
 	int y_max;
 	int pressure_max;
+	int distance_max;
+	int distance_physical_max;
+	int tilt_x_max;
+	int tilt_y_max;
 	char fw_version;
 };
 
@@ -79,6 +83,10 @@ static int wacom_query_device(struct i2c_client *client,
 	features->y_max = get_unaligned_le16(&data[5]);
 	features->pressure_max = get_unaligned_le16(&data[11]);
 	features->fw_version = get_unaligned_le16(&data[13]);
+	features->distance_max = data[15];
+	features->distance_physical_max = data[16];
+	features->tilt_x_max = get_unaligned_le16(&data[17]);
+	features->tilt_y_max = get_unaligned_le16(&data[19]);
 
 	dev_dbg(&client->dev,
 		"x_max:%d, y_max:%d, pressure:%d, fw:%d\n",
@@ -95,6 +103,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	u8 *data = wac_i2c->data;
 	unsigned int x, y, pressure;
 	unsigned char tsw, f1, f2, ers;
+	short tilt_x, tilt_y, distance;
 	int error;
 
 	error = i2c_master_recv(wac_i2c->client,
@@ -109,6 +118,11 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	x = le16_to_cpup((__le16 *)&data[4]);
 	y = le16_to_cpup((__le16 *)&data[6]);
 	pressure = le16_to_cpup((__le16 *)&data[8]);
+	distance = data[10];
+
+	/* Signed */
+	tilt_x = le16_to_cpup((__le16 *)&data[11]);
+	tilt_y = le16_to_cpup((__le16 *)&data[13]);
 
 	if (!wac_i2c->prox)
 		wac_i2c->tool = (data[3] & 0x0c) ?
@@ -123,6 +137,9 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	input_report_abs(input, ABS_X, x);
 	input_report_abs(input, ABS_Y, y);
 	input_report_abs(input, ABS_PRESSURE, pressure);
+	input_report_abs(input, ABS_DISTANCE, distance);
+	input_report_abs(input, ABS_TILT_X, tilt_x);
+	input_report_abs(input, ABS_TILT_Y, tilt_y);
 	input_sync(input);
 
 out:
@@ -195,7 +212,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_Y, 0, features.y_max, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE,
 			     0, features.pressure_max, 0, 0);
-
+	input_set_abs_params(input, ABS_DISTANCE, 0, features.distance_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_X, -features.tilt_x_max,
+			     features.tilt_x_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_Y, -features.tilt_y_max,
+			     features.tilt_y_max, 0, 0);
 	input_set_drvdata(input, wac_i2c);
 
 	error = request_threaded_irq(client->irq, NULL, wacom_i2c_irq,
-- 
2.30.1

