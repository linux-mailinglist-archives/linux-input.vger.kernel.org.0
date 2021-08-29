Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52C13FAA51
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234901AbhH2JVB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:21:01 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:54021 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234959AbhH2JU5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:20:57 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id AF47D580B0E;
        Sun, 29 Aug 2021 05:20:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 29 Aug 2021 05:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=wDxD148pGxNLo
        fDiRuvl3Q1zS4b7Jw1CAMW3y7CSj/k=; b=hlAKNQvyWLDNHdhlmUFTWqHBYcGCB
        A76Hh6kui8L1Jf4dmTkXosdjYVgLB2JBbkfxUjlHa2fO9wvNYJj04BmoyCVUtP41
        a3c86Fs3ydy7jwVXJBll41uxhls/DSp/DVer8El42yiyux6fZPNNtY1wuNJxo+1N
        LPFun28K0n8RCz9YwOIWDdTT7SN6Vr2+s9/TJ1bgRIArc8960MS5MT5jCISqzK6v
        ZtIRBxooNqc91nPuGHSrwAq4zJvstzXfW0Pt1vXFsQ9j4PneMCtLshzwM+3Immrh
        8HSMS0TeZl4z+q13WT3BV2e+De2088NegCSgZlb6cn0w6N0EtxiWHc53g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=wDxD148pGxNLofDiRuvl3Q1zS4b7Jw1CAMW3y7CSj/k=; b=oNlxszp2
        HbkMqDgKybM+dRY7Ld2OrhL2K8JbBVsvbJXcoeIPkcmBdlZXe5vAojOvISP+wJ2S
        i6fBqty/763SabfhpiK8h68hu4AR9Zjf/dZVStdev3//2drmUPgZeEcd5QlkpPnz
        HgiEs6hamkV14GFlQNFGvHMGdHu59TCOKCOpb9AF5ZUDKxdX/SVIX6FwvOfZwAWy
        PqRI7zY+d49JaS5J21APsWaC/Ae3qoWNrfU9HVnh6Ec20qN8b01FSKeTymKfNtNN
        rYpYm3Pr6DTDeb4hYg+16ipBSSs+h4HC++7/Zp+QPkFwBm0XBR9h4pJe536Z14iw
        pxuAMONXcFMV6w==
X-ME-Sender: <xms:RVErYVqjx2GQvTyJdfcYP7vTRFRPeYGBYBYg5b6onKxi-1b6pzi2BQ>
    <xme:RVErYXqFselEFCrVbnaxZmjwuJe10fC37Pxz3pdcSOQ7UwSolnkCBTDap07_mdjx7
    cemgJJBHYdZqm3CuSs>
X-ME-Received: <xmr:RVErYSPJWc7WPN26Gdy8Hl0b7U05cXuMwNuSiRsRIDYn83IFhQ1Xh90Pc3N_06VoPwyaKFfVm6d8_g7eI_3XG8pqTXEuuywt4swE_Wi7950Wl2lXHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:RVErYQ6CF5IjpaCiJLfaN-CQCfzcr2OGiVG74wkEDldxBq2TDimg9w>
    <xmx:RVErYU64BpgJ5AQUIo0FJE8jVrmYcFL0Uvfdfy79R1PD04I9_qdM7g>
    <xmx:RVErYYgpQdHYbbKUHzsZN34JmJTOzABjjaTn6qorw4A4GdCgxWYy0w>
    <xmx:RVErYUiuFLSv9EYaxd2Z9_mUYcg_J3U8w6WOPQepQbmsG_RAl5qItw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:20:00 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 04/12] Input: wacom_i2c - Add touchscren properties
Date:   Sun, 29 Aug 2021 19:19:17 +1000
Message-Id: <20210829091925.190-6-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Connect touchscreen properties to the wacom_i2c.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 6053595f2b30..28255c77d426 100644
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
@@ -114,6 +118,8 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 
 	wac_i2c->prox = data[3] & 0x20;
 
+	touchscreen_report_pos(input, &wac_i2c->props, features->x_max,
+			       features->y_max, true);
 	input_report_key(input, BTN_TOUCH, tsw || ers);
 	input_report_key(input, wac_i2c->tool, wac_i2c->prox);
 	input_report_key(input, BTN_STYLUS, f1);
@@ -151,7 +157,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct wacom_i2c *wac_i2c;
 	struct input_dev *input;
-	struct wacom_features features = { 0 };
+	struct wacom_features *features;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -159,14 +165,15 @@ static int wacom_i2c_probe(struct i2c_client *client,
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
@@ -178,7 +185,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	input->name = "Wacom I2C Digitizer";
 	input->id.bustype = BUS_I2C;
 	input->id.vendor = 0x56a;
-	input->id.version = features.fw_version;
+	input->id.version = features->fw_version;
 	input->open = wacom_i2c_open;
 	input->close = wacom_i2c_close;
 
@@ -190,10 +197,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
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

