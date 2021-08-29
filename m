Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394923FAA56
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbhH2JVN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:21:13 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:49109 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235011AbhH2JVH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:21:07 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 79337580B0E;
        Sun, 29 Aug 2021 05:20:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 29 Aug 2021 05:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=YL0Ib+4egCDn5
        lJr21UYkr+YjUgCaf9QQCpk4lYgxBk=; b=g+iLLn7XL3I2ULYKFjSztrHCnpl5G
        rIM5AuFZMnDSkpYLi/EnSLXieiXgLU/k0pU2fMxsIqx1B15ZeeFGrjHyM6DYgBt1
        w+YvFWC8y9+CMoITy6W/luMxKU5j0DQWja9hE69cyOXnsV+c23KehHSmx0krxx/a
        wuQONbuPO6sAfEMpyERjUMsv5nzkkbveJ1M0i0+UzkW2QooWGPUFT3WN0cg2dHDl
        597cDzaAFe5y0rWuyHVVFtQL9ZSP7sHuIc7T04A1XKON69C7ZRdUetGsu9uYMr4Z
        /cOCLV2hVnIrifpdVSeLCbBA6qMD96gklxNyTyAkH1Pxg6xYWJdz71CEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=YL0Ib+4egCDn5lJr21UYkr+YjUgCaf9QQCpk4lYgxBk=; b=A/qFCAip
        DhSFuvKjMMKzTxk1Nssf1QiKwK4BX11P6xR78b1Jn4mFPVPqf98wwaybJPMNh3wV
        AS14x5KY9Nzivqs2+aVtoqKL+1B4E46fqefKfJavr27q5btm8+o8YORO14SqA5T6
        NFe2MysXYgAaiujNe1dkafZMlQnnLoaRL2IFKW5uDF51fB7AflD1z71cU4ZJmSo9
        xbJvB0LRudYMK613jBLTAhuNJQeurTr3pf/IPpiCPNND2xIbW9KKa9Ac6AuYbNKM
        198Z8xqvkcGeNYHeN4k/kIJleHUOzM7pZvTaBsD9ty39LHw4d18n3vo5XDITcxII
        jUTb8idJqYmqUQ==
X-ME-Sender: <xms:TlErYVdm70RSFMcTTrL5a9mqc3FvaaaFHWFOCqq61pT0zw9BRRvaGw>
    <xme:TlErYTPZCoK2abiGgSN24kuIl0W00wRr3mcL6uIs5twbAD9b97nHqW6bCtgMXuDzF
    zAn0-mIxctdqdQsp5w>
X-ME-Received: <xmr:TlErYeikJop_8aVPeTms8V-du4zyj04O6KyFKXywrBlK9Mo9gDjBvx6-p91WFr8S9HYNcfECIgiDd6FbnvWosoMgd6vXoWlL4Ivc9hrbjG_FpRt_RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:TlErYe8SYAVFTTZhKDeWEOzA8wAmDM44FA0n3fpc8HGSYCOfGhxrxA>
    <xmx:TlErYRuOgo2WxKLdaVxKLDfZHXJG9P8BvIhnHkOLRqCwxhyFh5whJA>
    <xmx:TlErYdFfDXjHziOMcZf_i41KFC8LkAV7_pBDq3mm7bJSrVjEuuWcAQ>
    <xmx:T1ErYdEIb5-3l9I9cKuycEh_b48Xq2zT-ObhxjHeiVAuqhS3gFck9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:20:10 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 06/12] Input: wacom_i2c - Add support for distance and tilt x/y
Date:   Sun, 29 Aug 2021 19:19:19 +1000
Message-Id: <20210829091925.190-8-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the distance and tilt x/y.

This is based on the out of tree rM2 driver.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 30 +++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 72ba4a36459b..d6036406a9f3 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -23,7 +23,7 @@
 #define WACOM_CMD_QUERY3	0x02
 #define WACOM_CMD_THROW0	0x05
 #define WACOM_CMD_THROW1	0x00
-#define WACOM_QUERY_SIZE	19
+#define WACOM_QUERY_SIZE	22
 
 #define WACOM_MAX_DATA_SIZE_BG9     10
 #define WACOM_MAX_DATA_SIZE_G12     15
@@ -63,6 +63,9 @@ struct wacom_features {
 	int x_max;
 	int y_max;
 	int pressure_max;
+	int distance_max;
+	int tilt_x_max;
+	int tilt_y_max;
 	char fw_version;
 	unsigned char generation;
 };
@@ -144,6 +147,15 @@ static int wacom_query_device(struct i2c_client *client,
 	features->y_max = get_unaligned_le16(&data[5]);
 	features->pressure_max = get_unaligned_le16(&data[11]);
 	features->fw_version = get_unaligned_le16(&data[13]);
+	if (features->generation) {
+		features->distance_max = data[16];
+		features->tilt_x_max = get_unaligned_le16(&data[17]);
+		features->tilt_y_max = get_unaligned_le16(&data[19]);
+	} else {
+		features->distance_max = -1;
+		features->tilt_x_max = -1;
+		features->tilt_y_max = -1;
+	}
 
 	dev_dbg(&client->dev,
 		"x_max:%d, y_max:%d, pressure:%d, fw:%d\n",
@@ -161,6 +173,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	u8 *data = wac_i2c->data;
 	unsigned int x, y, pressure;
 	unsigned char tsw, f1, f2, ers;
+	short tilt_x, tilt_y, distance;
 	int error;
 
 	error = i2c_master_recv(wac_i2c->client,
@@ -176,6 +189,12 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	y = le16_to_cpup((__le16 *)&data[6]);
 	pressure = le16_to_cpup((__le16 *)&data[8]);
 
+	/* Signed */
+	tilt_x = get_unaligned_le16(&data[11]);
+	tilt_y = get_unaligned_le16(&data[13]);
+
+	distance = get_unaligned_le16(&data[15]);
+
 	if (!wac_i2c->prox)
 		wac_i2c->tool = (data[3] & 0x0c) ?
 			BTN_TOOL_RUBBER : BTN_TOOL_PEN;
@@ -191,6 +210,9 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	input_report_abs(input, ABS_X, x);
 	input_report_abs(input, ABS_Y, y);
 	input_report_abs(input, ABS_PRESSURE, pressure);
+	input_report_abs(input, ABS_DISTANCE, distance);
+	input_report_abs(input, ABS_TILT_X, tilt_x);
+	input_report_abs(input, ABS_TILT_Y, tilt_y);
 	input_sync(input);
 
 out:
@@ -266,7 +288,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
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

