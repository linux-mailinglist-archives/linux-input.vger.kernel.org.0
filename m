Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979213A7BEB
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbhFOKdG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:33:06 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46151 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231616AbhFOKdD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:33:03 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 600DD580729;
        Tue, 15 Jun 2021 06:30:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 15 Jun 2021 06:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=jLYfQBxc5Fss5
        wHk6K78mpbcM1U0H/2OtEIpp1nXFxo=; b=Kj8RYwPVR3UYiD8swIqWSr832jMpr
        tRb56hVG5ccBEr/5v+UF1wMkoSNMmpiBEVLJhYtAV1huyk4c0/SwWecxXG4mDB9I
        wO9oOC2LR6/D3qfe2mxrZoDn0UtAePDuNybIchE2YOv4xcQHKISWJaSyg2Jv0nrQ
        siN/adeDzoBBtQCZkEPVnsNM9irW/rRkJN5rnqxy2p2V+ozLU1AbUmSimfjfS4oH
        prxH3obXnhbsM5vXucJAhXQ9xROufVLy9I89LK8pCRKSiZa6aUycC04A10gFUlE4
        DTG3wPGuW43Lh0RgiY3cMhXcg2xL7IYICKH/ZypHzSyB4lsIhftNKUWIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=jLYfQBxc5Fss5wHk6K78mpbcM1U0H/2OtEIpp1nXFxo=; b=tI0pJLi3
        s2iFPaKgdNoHg9JWto8F1Llssnjx7w4Fc6omg7bYMiNxqNOAfSkHIZ6zkLKIpHWc
        0l0xQtNLLQbEjflD5QHNxlc8S7xBA93XYgJvfFWgwqWznqMe5c7ZnR4YT3PsHzLR
        ycbOvjIjdeygm/Dy/AYgWrzxWkgwYjcfsJypcYFEXJTFztfP+019110XPQj5XNUf
        9/r9fqcjbRLjtLOmYU9ZvLoEy0rYRk3gwjqCDLv6w75SpvPccuEdg01lbogLqpRq
        n3cq2Sm9mIXzGxeBSLLlWW5SakdscPN2yoFCMF41DfeJprWJCgASCALjG8x9tFkz
        Rm17YAm4IrQ+6Q==
X-ME-Sender: <xms:YoHIYMWa4ycFVqqTvtsU-FygwO9ZfDTa5u5RFH0Tr6QGY42-HfHHMw>
    <xme:YoHIYAkAiEQ82ehC1hAXMPGoAqnn93vnOkOMQlgJwvFJOwTW3RAXqEV6IUrYr2Hup
    2OYG5yaM2bIxS7peEE>
X-ME-Received: <xmr:YoHIYAZynCvrOZWPddScYyQ2lZCK0hrQukXm5X53dnhGu1NUyE8P9TydwjKasL0QL_Urch-La2a6_Cgh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:YoHIYLVcebYFpNf_zjL1imAY0MLawtjtlWzphRbFwDSSgTqujnYNuA>
    <xmx:YoHIYGnbFmT7vqDgGShO_TtMaYMkKCXvV-XLnC0YgmBZawdKRhVqlQ>
    <xmx:YoHIYAdejvq4esWe8WSD7hWWT8NDcYXoAT2P7g2_k6dgv5GPhivL4g>
    <xmx:YoHIYA7oA25wRrUymM8t7XPviLMIHNuhveUxzs0S7my9G7OFKMk2BA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:30:54 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 5/9] Input: wacom_i2c - Add support for distance and tilt x/y
Date:   Tue, 15 Jun 2021 20:30:10 +1000
Message-Id: <20210615103014.798-6-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103014.798-1-alistair@alistair23.me>
References: <20210615103014.798-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is based on the out of tree rM2 driver.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 34 +++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index b47bc08efdd1..e2449a4fa2e3 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -22,12 +22,18 @@
 #define WACOM_CMD_QUERY3	0x02
 #define WACOM_CMD_THROW0	0x05
 #define WACOM_CMD_THROW1	0x00
-#define WACOM_QUERY_SIZE	19
+#define WACOM_QUERY_SIZE	22
+
+#define WACOM_DISTANCE_TILT_VERSION	0x30
 
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
 
@@ -80,6 +86,17 @@ static int wacom_query_device(struct i2c_client *client,
 	features->y_max = get_unaligned_le16(&data[5]);
 	features->pressure_max = get_unaligned_le16(&data[11]);
 	features->fw_version = get_unaligned_le16(&data[13]);
+	if (features->fw_version >= WACOM_DISTANCE_TILT_VERSION) {
+		features->distance_max = data[15];
+		features->distance_physical_max = data[16];
+		features->tilt_x_max = get_unaligned_le16(&data[17]);
+		features->tilt_y_max = get_unaligned_le16(&data[19]);
+	} else {
+		features->distance_max = -1;
+		features->distance_physical_max = -1;
+		features->tilt_x_max = -1;
+		features->tilt_y_max = -1;
+	}
 
 	dev_dbg(&client->dev,
 		"x_max:%d, y_max:%d, pressure:%d, fw:%d\n",
@@ -97,6 +114,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	u8 *data = wac_i2c->data;
 	unsigned int x, y, pressure;
 	unsigned char tsw, f1, f2, ers;
+	short tilt_x, tilt_y, distance;
 	int error;
 
 	error = i2c_master_recv(wac_i2c->client,
@@ -111,6 +129,11 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
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
@@ -125,6 +148,9 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	input_report_key(input, BTN_STYLUS, f1);
 	input_report_key(input, BTN_STYLUS2, f2);
 	input_report_abs(input, ABS_PRESSURE, pressure);
+	input_report_abs(input, ABS_DISTANCE, distance);
+	input_report_abs(input, ABS_TILT_X, tilt_x);
+	input_report_abs(input, ABS_TILT_Y, tilt_y);
 	input_sync(input);
 
 out:
@@ -200,7 +226,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_Y, 0, features->y_max, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE,
 			     0, features->pressure_max, 0, 0);
-
+	input_set_abs_params(input, ABS_DISTANCE, 0, features->distance_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_X, -features->tilt_x_max,
+			     features->tilt_x_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_Y, -features->tilt_y_max,
+			     features->tilt_y_max, 0, 0);
 	input_set_drvdata(input, wac_i2c);
 
 	error = devm_request_threaded_irq(dev, client->irq, NULL, wacom_i2c_irq,
-- 
2.31.1

