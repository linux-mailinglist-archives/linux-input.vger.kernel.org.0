Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65FF2363DB9
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 10:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237793AbhDSIkC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 04:40:02 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48305 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237811AbhDSIkB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 04:40:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 4809D5C007E;
        Mon, 19 Apr 2021 04:39:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 19 Apr 2021 04:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=gDbtivz0l1uVV
        R7wCzlx1DreiUMjx2Rs1EJyoCuVhIg=; b=horNVfgEiPHQu7EYOMPRnNnY0mt6z
        QJ1v45y1XdprZl18x1UQsy/XoybHHnm8lbsrCrmyDCnm1i+iWsHrtcukR31cB+dm
        7RwFVrX3G8hLYJvInQn6I3YcKM8x178GRzOghql3Ecl8fvd1k5FfDWmQ71AYEwC1
        OhBlMVq0nwXicrZ6g9YrgxqTCLE229dXonyYYlsjYGUoOjpAUDEOsXdtU2ojRfaV
        xRy8aewrobtFRhQu55wR/qs6TG36A9IjZrlzrGBevnsPSPC+kAAeGnJ6ln9ueVX3
        Ehue3IiQsSO5KstAMbt82XcYr4YC5VCwg7qfG7qyb4D0/6ieSrKpTSrPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=gDbtivz0l1uVVR7wCzlx1DreiUMjx2Rs1EJyoCuVhIg=; b=UUxLi4hb
        rK+RgAf/rZX0DB2mUcjv2GJfHQi0tbNHg3ljW+LxnUOtHqSvAnIVcX/814+6mtVs
        T9xEDG2q8vqTjX2yvKsVD1VHMMZ2pwpvz1XTrJdvoTu5zrJL0/HMuLu3n3ZNesnn
        fjD2jZN/gdZAghhPouWghmq1Li8Lhf0YObE5BMi1GmtLfaKpCMsjOehIrsIWXoQH
        iRjsb3/IFNZbywgPxXiq5VF76nrriG2VDBT2IMqZAXgE8wBIPoFHC1dgm7e5iHQr
        NjuR2DlgNhWNkQwOpSXrBcDn67UsrATlNtdRWVYwmlkGsPWQRtqWm/7v3oIAkTnH
        qDM+WlAYJevq6g==
X-ME-Sender: <xms:w0F9YD4d8poL9cVv4iJPgQQcFiRfq8pBNjOcJi221bAOvKHzxmcaLw>
    <xme:w0F9YI2o-aAUW4hhWsBSqJHb0qjAAmA0Rx-MvWqlj-qFAPZDwremy_azV2Ao3T7wQ
    bIrrArk0N3E2LZdiVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepkeelrdeg
    gedruddtrdduvdefnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:w0F9YHVn3CBJ7g8z1gUeNOh2pmYl567ikweDsG5x1_eKqAY59UMppA>
    <xmx:w0F9YL4XUpq20Tb3qcdWan9XPQyyeztBeg6jhIKqaSD7obzWkBUsSg>
    <xmx:w0F9YGLZbyw0NsKWGCfqFGHx4npQ-sBK6QoE4jlLgfG1hMQpyzsPMQ>
    <xmx:w0F9YDGHpOoGd2X7_MceKMwammk1RfmMPewgqqxRo2PslzKhTVajTw>
Received: from ThinkpadX1Yoga3.localdomain (unknown [89.44.10.123])
        by mail.messagingengine.com (Postfix) with ESMTPA id 964A51080057;
        Mon, 19 Apr 2021 04:39:28 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v5 5/9] Input: wacom_i2c - Add support for distance and tilt x/y
Date:   Mon, 19 Apr 2021 07:01:00 +1000
Message-Id: <20210418210104.2876-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210418210104.2876-1-alistair@alistair23.me>
References: <20210418210104.2876-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is based on the out of tree rM2 driver.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
v5:
 - Check the firmware version

 drivers/input/touchscreen/wacom_i2c.c | 34 +++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 28290724b3da..e0a69e63204d 100644
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
 
@@ -79,6 +85,17 @@ static int wacom_query_device(struct i2c_client *client,
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
@@ -95,6 +112,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	u8 *data = wac_i2c->data;
 	unsigned int x, y, pressure;
 	unsigned char tsw, f1, f2, ers;
+	short tilt_x, tilt_y, distance;
 	int error;
 
 	error = i2c_master_recv(wac_i2c->client,
@@ -109,6 +127,11 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
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
@@ -123,6 +146,9 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	input_report_key(input, BTN_STYLUS, f1);
 	input_report_key(input, BTN_STYLUS2, f2);
 	input_report_abs(input, ABS_PRESSURE, pressure);
+	input_report_abs(input, ABS_DISTANCE, distance);
+	input_report_abs(input, ABS_TILT_X, tilt_x);
+	input_report_abs(input, ABS_TILT_Y, tilt_y);
 	input_sync(input);
 
 out:
@@ -195,7 +221,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
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
2.31.1

