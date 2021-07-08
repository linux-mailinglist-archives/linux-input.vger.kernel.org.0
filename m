Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA983BF993
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhGHMCN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:02:13 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:51751 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231758AbhGHMCM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:02:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id E645758057A;
        Thu,  8 Jul 2021 07:59:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Jul 2021 07:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=jLYfQBxc5Fss5
        wHk6K78mpbcM1U0H/2OtEIpp1nXFxo=; b=Bf5hxOi22wloR/3jc5tsUEjXoh0K9
        1xxKpwFFSc3IOJFS5WF/5AZa9HDMWZjZJB5JzuuUO37zuy5Nuh9DPmppbO5mHoNP
        L+faZknWp1DZdC2Sam8bcMCKNH3eQXSl1HqVVED09O3QhdEVEyOuSjDI4UxHRaD0
        /cD1afZi2I2ysZgZJYVvojQ4jSjjsoyk9S2OGe6gxM8vuA5/9HW/tLceVDzX/aiv
        Qp9mlCcg2VlIIqZSDST0MXQlq8FtxS/gfTGjeJ5ex8iQZ7oLMbKqO9aSOgEtnVn9
        /21UwFBPAl+SHycWVNEN/owj4nDO7fyRjtt/1ZXqFT6R16+olfun5BwAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=jLYfQBxc5Fss5wHk6K78mpbcM1U0H/2OtEIpp1nXFxo=; b=u5nnoQVa
        NPJYUjChhc26cd7l4BIw27tfyKlV8HVUz86Kr92n/KYcdnn8BurW9Xs3ZxxxVQsW
        0jNXfI9gIX7FlhF07ECJW9ecXVAOnf8dy2QCjrfFT5lXjVWUy16cpHC6tXhxPHhQ
        +JQHnnIwj0WW0veXTSX2ZwlcgfoTLnl966WiMhc5Hcwp+bMOl4sThytByXRxg7YH
        s/wcGQFSrtST/xJLC38n64dStTUiv/WMkP8x5vlRaHr6MAZnNP9uQnSDGADYfb4m
        OtSe/OW7Hf2o28m16rFvdARtPo4MCxX0sdvh1i3mjB0H4W6Hs/eKUfY69tPzunMR
        Jwsp10V7n5np8g==
X-ME-Sender: <xms:oujmYN3U-kp1Kg0wJVdAqSeMEFcphWSbnYZrCe7IYPteJsK9lcgiLw>
    <xme:oujmYEFMvXGTCAtqcRxwxm4U973mIXMDb-xaqadhR-JUYuINWAYGJmsnE0pkwVvZT
    jIzLuUaOQvMKC0iLOI>
X-ME-Received: <xmr:oujmYN41aCGT7vcr25p33HiIh9DuL92qi0P1XDpYEleXVk879wiQDRX0cVTVp02iu_64_U13_flOTQ4zX48>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:oujmYK3PT0ttzaLVrIkjDAUmg0EisftVMG6Kcb5OBMXemoNHXHm9Tw>
    <xmx:oujmYAGfUHtYpEDLbV_hjoJqMvzKOxrWme7PLk58qRIldoQNFBMGvA>
    <xmx:oujmYL81AeRk2KnzNByRsvTZSXxgbjc2NvRXy3z3BeUzXAFyjdgAig>
    <xmx:oujmYI_zkO3W3qA_g5QNtCRWAfQzb7njGRzT2B_JDsFUuCwQOYIn2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:26 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 5/9] Input: wacom_i2c - Add support for distance and tilt x/y
Date:   Thu,  8 Jul 2021 21:58:49 +1000
Message-Id: <20210708115853.281-6-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708115853.281-1-alistair@alistair23.me>
References: <20210708115853.281-1-alistair@alistair23.me>
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

