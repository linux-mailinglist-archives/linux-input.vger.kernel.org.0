Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827272FF617
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 21:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbhAUHs5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 02:48:57 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60765 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726531AbhAUG6D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 01:58:03 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id EB9425C00E5;
        Thu, 21 Jan 2021 01:56:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 21 Jan 2021 01:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=hjkcziuEISlgP
        zvUtaoI0dsvabdQteZf1dpUx9Wn+oQ=; b=HzD7jY79SQPY1YF0OVhvzjv4hKNHi
        iOLQsHwCEnDjqpDqtRyMkeIAiGF1SVOSnYngZAGMyygTlJfEt+WqfGgY+e4EQyuI
        8mi00j1LSP5bt61ab19X2aFWATzTk4+gn7vC3dMFzWG+b98kV/TZIMIVQLw/LqGc
        iovfFVCvlrV+gjoE3lCVIbQWwxshNmJavcaBwRF7CYdsT8z/U9NHlN1ISFQeXiTv
        sPf+RhuNHEV24oINKVg8fitaEAgmgL5hy+UEpoiWcSyIXgoPq1kvTQzw7YdDC0n2
        LDBlLNKPUPKezkSrXTruDHL3cDLZ22B5ze6RXGciE0wDPJoYdVnHCJCAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=hjkcziuEISlgPzvUtaoI0dsvabdQteZf1dpUx9Wn+oQ=; b=LhHOSexq
        mhqDdzjUV8xcmbTqVn6hiS66057eQQtF5aQNvL/+VSgqfCwKxhI794ZoCiTU5XVW
        oVWPPwEDJSLdZXbVXG5UmKB6RCWGDsahjiJL9HuZwORUsKyMknLAoabgsXUkfui+
        FDdHSgDYz4crm+lxkxNSiNnPjHXLWPE1IiOVhygTI05wUCmoncFRcjKk1/2wP81t
        zD3dJ/LKX2TcA+4ggwxhTRhNXc3m68wnZyndxItxlpdAC+N+8LFcKhjw33kgbmxL
        vHB/sHEkigASRKzWRemVjtp8o+/tQA6RngRaUedLK7hzh0NJ/tOIujVoW5aZhI/6
        n3oFszewr67H0Q==
X-ME-Sender: <xms:siUJYJsxJ1FjYwFGc9ymD71CeZmLcpumoxhfj0EbOCLTyzndWTwc6g>
    <xme:siUJYCd9GzG5avo2XHY4kxoa6B7MZavJYzrzHIDHZMysR2KKej7UjJVDgFmUzQGVr
    I08je6vP0jn79RRkGk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepjeefrdel
    fedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:siUJYMyrecQ55gw3Z2zgSMvsJer0b9TZ7WoqbQoKf3ZfLJj6eN_THg>
    <xmx:siUJYAPaGoUqQhF9VZhVzSrzlkGJD6jzHnKQaiaON__Ujh82h-E_uQ>
    <xmx:siUJYJ9JVZ0J1a-6hJe4PdZEWYfjfVMtWmKVRKRoPZ3Q50sm75IybA>
    <xmx:siUJYEYw35pzh-ayGFUqFo7DXGYbFJU6KstM-wil3f0WZ1PtSXOEKw>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0339B1080057;
        Thu, 21 Jan 2021 01:56:49 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 3/6] touchscreen/wacom_i2c: Add support for distance and tilt x/y
Date:   Wed, 20 Jan 2021 22:56:40 -0800
Message-Id: <20210121065643.342-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121065643.342-1-alistair@alistair23.me>
References: <20210121065643.342-1-alistair@alistair23.me>
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
index ec6e0aff8deb..5f0b80d52ad5 100644
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
2.29.2

