Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8681A3A7BE9
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhFOKc7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:32:59 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:37845 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231214AbhFOKc6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:32:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 439F3580729;
        Tue, 15 Jun 2021 06:30:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 15 Jun 2021 06:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=42U8DUxuirT24
        UG9G+vL9N8k4v79ZOffL9JMNB77jg0=; b=JwKzX+jTbHTeMy7fHePzTBrmkfk/v
        GeHU8oT+F5Kf96gBXj6Zz0At6FlAVWxIn5bo+HiG8wCVcU3rYFCnO4DRbcdOfYIX
        Wu/HKvfHrS/Z4zcKuVe5YxviaSUGRvQt1g6ycaEb+xgNEhhYNDgrQLHm/6AVnAs6
        T4T+2Sg0Fq44vUJQhqG1WUWdeTJ4KwSIzRvdASzm4W0BLOYJSggpQVsdaQcjOPwy
        gWMAucODGm1Eie7qSJhfiPwITNJDUM6kwwVdWpS6Q2lBbmmwX8ym5Aus6O9IGfCS
        XhVWzoWzj70Vj1Bcu61apK18D+la5iNQLmmzXLqjGE1B7YZ1V55YgoxLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=42U8DUxuirT24UG9G+vL9N8k4v79ZOffL9JMNB77jg0=; b=KBYi5BR+
        RfCNLgHOj5CnEhnI6yLflWWt9Lw6pUPxqQt1tvBc8e0SZWoJaLX+A0W/3STOhEJM
        /3UuYiCWhokEl8QdfZrccm90ru0oHkvXPrY8u6jtZYezzBOtycxDUQFQDh6DQnQ0
        G0wLPZJoJva6NQLVzp04l8atKajoWQQsKLrluZl+YFmEXIo7z2z6Z61kQbjWNVgC
        bfJ+UdPfaWwUKRMkS84QuHOZuVsB5UDko5iVkW1qHRePLAnpUgWM/DWGYgrzVGlf
        cJNy8s2gw3FBKI3aN5xpfZm14nUcsY6EI+2INDfkIPVFE5+aDlC71q0cfTq8rF/U
        n76M+7tR61g74w==
X-ME-Sender: <xms:XoHIYIrJqs0eHq_dRzrwvt2wCsLScoWc08okK89eysWuUg5BcLE_rg>
    <xme:XoHIYOrn98H9TKTaeMaK1uaUTMungnmEtlvrPWCsXaZfHRUpKlYFkoLnhHUyHYQFl
    ta7_Ly7D5RtqUffdpQ>
X-ME-Received: <xmr:XoHIYNNSAgDAhcA6Clxz8d0uOk_SydigKlc2gAors5tRNdGY9NKCTZ3KMv0jSOz7bps_ysveJuSYxBav>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:XoHIYP5BzrAtpmzkQSsFnJb6Z13Dk3fS3973OUJxniWwgr_0wnJLvg>
    <xmx:XoHIYH4RiO32aWYa69BD8PVllGLOUEJGfKOvOTlLtcO1ySGqjkDK3A>
    <xmx:XoHIYPhCtUc5zmjX2a5tNFNr9STEYGq1hgZOkz90oTgy2UKFNbLQag>
    <xmx:XoHIYBuWh-Rb9YBEeFV7E2b67Hx7N1LfKmJBMz0HxDEgUbMGjH5cqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:30:50 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 4/9] Input: wacom_i2c - Add touchscren properties
Date:   Tue, 15 Jun 2021 20:30:09 +1000
Message-Id: <20210615103014.798-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103014.798-1-alistair@alistair23.me>
References: <20210615103014.798-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Connect touchscreen properties to the wacom_i2c.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 28 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 6053595f2b30..b47bc08efdd1 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/irq.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
@@ -33,6 +34,8 @@ struct wacom_features {
 struct wacom_i2c {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct touchscreen_properties props;
+	struct wacom_features features;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -90,6 +93,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 {
 	struct wacom_i2c *wac_i2c = dev_id;
 	struct input_dev *input = wac_i2c->input;
+	struct wacom_features *features = &wac_i2c->features;
 	u8 *data = wac_i2c->data;
 	unsigned int x, y, pressure;
 	unsigned char tsw, f1, f2, ers;
@@ -114,12 +118,12 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 
 	wac_i2c->prox = data[3] & 0x20;
 
+	touchscreen_report_pos(input, &wac_i2c->props, features->x_max,
+			       features->y_max, true);
 	input_report_key(input, BTN_TOUCH, tsw || ers);
 	input_report_key(input, wac_i2c->tool, wac_i2c->prox);
 	input_report_key(input, BTN_STYLUS, f1);
 	input_report_key(input, BTN_STYLUS2, f2);
-	input_report_abs(input, ABS_X, x);
-	input_report_abs(input, ABS_Y, y);
 	input_report_abs(input, ABS_PRESSURE, pressure);
 	input_sync(input);
 
@@ -151,7 +155,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct wacom_i2c *wac_i2c;
 	struct input_dev *input;
-	struct wacom_features features = { 0 };
+	struct wacom_features *features;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -159,14 +163,15 @@ static int wacom_i2c_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	error = wacom_query_device(client, &features);
-	if (error)
-		return error;
-
 	wac_i2c = devm_kzalloc(dev, sizeof(*wac_i2c), GFP_KERNEL);
 	if (!wac_i2c)
 		return -ENOMEM;
 
+	features = &wac_i2c->features;
+	error = wacom_query_device(client, features);
+	if (error)
+		return error;
+
 	wac_i2c->client = client;
 
 	input = devm_input_allocate_device(dev);
@@ -178,7 +183,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	input->name = "Wacom I2C Digitizer";
 	input->id.bustype = BUS_I2C;
 	input->id.vendor = 0x56a;
-	input->id.version = features.fw_version;
+	input->id.version = features->fw_version;
 	input->open = wacom_i2c_open;
 	input->close = wacom_i2c_close;
 
@@ -190,10 +195,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	__set_bit(BTN_STYLUS2, input->keybit);
 	__set_bit(BTN_TOUCH, input->keybit);
 
-	input_set_abs_params(input, ABS_X, 0, features.x_max, 0, 0);
-	input_set_abs_params(input, ABS_Y, 0, features.y_max, 0, 0);
+	touchscreen_parse_properties(input, true, &wac_i2c->props);
+	input_set_abs_params(input, ABS_X, 0, features->x_max, 0, 0);
+	input_set_abs_params(input, ABS_Y, 0, features->y_max, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE,
-			     0, features.pressure_max, 0, 0);
+			     0, features->pressure_max, 0, 0);
 
 	input_set_drvdata(input, wac_i2c);
 
-- 
2.31.1

