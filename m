Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3D9349F21
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 02:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhCZBxN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 21:53:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55473 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230318AbhCZBwq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 21:52:46 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id BBCD65C0163;
        Thu, 25 Mar 2021 21:52:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 25 Mar 2021 21:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=4XvhdigCBD9DO
        w+AeI87MXAYLHJwa9RLbHz6rw7A7CI=; b=bolBxi5JvL/8O4/CwRGIYHEDGdmqx
        kQeP1X+rFLCOxmqGiJrmwtUEaTgwuOsRn42rI27sP7DVdmO3uUnnykjBp/P/AzIf
        SjODz3DGWfE/CKU88mPWr1L7ytfzNUyEOJa/vwO57/hult9rHu6hz4LnV0ZqHNSU
        J/x3LXk4XIQ6/GlMDWkMjnvsuFDGrWv+eMJiBItORBC6AdIITgIwtvCkN0BzNzX5
        MDgGwFjN3bAV94nd+VkKU5fEOKm+f2yZK5vBpzI/R7MFID8IfGGoLvnSdAnvICgj
        sRT4XoMM94GF04lXxhM+t8Faz0Emor/gEv2xrFB7374SJDihY5m/UIxVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=4XvhdigCBD9DOw+AeI87MXAYLHJwa9RLbHz6rw7A7CI=; b=VJouvm5s
        +5ZxMMyjBYdnPcKLv5nAcqxWTASTZrBUmKF93XB1WaVk2oeoCXRPx08lCsSC6cvi
        ryWRaYyMNh9LzoAY7skp0oNhgZmIZiBRBscmTswydxOnnejN8QYhFG0WgLCP0fag
        YCnLZt3DboHiwo1qU1OG3vtDkS/8GoAnbCDZs8j/oP8qa6wRUJcsM10tDuvs/laG
        40cuJdRIExnKCKEI8SlR/a4EmMkjMPhQdiY4Z7bD5CRFyOzEFfm7qB+fqKOW9dNT
        enUAyfhQBTGtyBilEitAXu7tuo9C6k6/jH1WYK5egeRnVlkvmGGIprj9FbImAsWL
        lc5klfC2NgTeiQ==
X-ME-Sender: <xms:bT5dYNkZEdEUlqCLyAxAa5VkP_y2h92Kkb59giolrCQCgqulSazqGQ>
    <xme:bT5dYI0Tg6sqJsYiVGgxARPYb8Uk9y8tA6rQWm2WGo-scXTUcSLQaA07J_Tzb65rB
    TtEB0NCaaIHBhCNWlY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:bT5dYDpZvA2Wc2ihr3OY8ccQoBN0YGoX3bskDU4Q-w-iayIBnIc3Hw>
    <xmx:bT5dYNmFt-N5OqoPdgSDVeEZZEipFZLoZfuqe9S9b1iEKmHBsbYHaw>
    <xmx:bT5dYL23tKUr2fNIPhYB842TNTuhDJ7y4yWiIugEAjdZe-vbPUvCxw>
    <xmx:bT5dYMzZNWlp3IKxK3eQ6ayUoWo3BgnaHwhNlrLyjg1662UmplDOOQ>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id CDA2D108005C;
        Thu, 25 Mar 2021 21:52:44 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 05/10] Input: wacom_i2c - Add support for distance and tilt x/y
Date:   Thu, 25 Mar 2021 21:52:25 -0400
Message-Id: <20210326015229.141-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326015229.141-1-alistair@alistair23.me>
References: <20210326015229.141-1-alistair@alistair23.me>
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
index ee1829dd35f4..3b4bc514dc3f 100644
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
@@ -197,7 +214,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
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
2.31.0

