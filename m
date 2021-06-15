Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98B93A7BF1
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbhFOKde (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:33:34 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:35023 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231615AbhFOKdb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:33:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id C2FAA5807DE;
        Tue, 15 Jun 2021 06:31:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 15 Jun 2021 06:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=gJSZFhKVP4HKE
        Mu49hVwBOwgPgn/uZOPWaLARXY00kE=; b=c2PxkIuOC1BTaWCbMdXLDr5nIbcxS
        tqwLNLufaadozlkb/JOnuW6dzjpc07A373VIxmtCB4XgL2ShY7M9LO19l/QrGsN9
        WBVqnb1byppiHXzLxKHB+z8928nVA5opWvc3F/dfEd/eSC5CCPGrfGs6FjrVS06P
        OcYTMEzDkj/Z4D/HVGS0MPrgjiGsYBzC4hWk/yguGb9nsagYV6zIAPifCWQO8BnZ
        ZXF8jG+LdqwyeSRZA+Sy6MmEnganNxwskw1rqGA7ZVpv4986jnmJj9wUeyYnKjO2
        4cSPL8o4/2VvKTi6a2jZAH4cdcz0JKC3DcsW67fnn+AdMwlLwtgZ0bw9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=gJSZFhKVP4HKEMu49hVwBOwgPgn/uZOPWaLARXY00kE=; b=r/rAKHHo
        Fw8VjrrZIh/MQXeLYJIJ+Zl2fzvGG1DPMC4UcqdeP7/pVE//LHI++J/VsVdDeFr+
        yD6dP3B1L7yL9Y5YxJnyAVEHzFSpKaGdp0h1keThsoR+0ODwDNIyHXNfzW0JakML
        pI92ZMPURlehiR+BT6DXpu/Arrxa+L90BSaOxrNv3WN2AVICisVj/KNUHPLvtQ6a
        ffUwz/NbOho6/DOJPqKPYagzOJ9UMO0K0ClbtRPs2BxjXkOJpJuw1LMqAOvA6wgx
        sInhoMU0CgNO0OczsIvxwLAv8EYLbrLfz0DlEn2Z8AhbdGUDUuFjsA4YZfLofTz7
        R+bRpnt3gg4PpQ==
X-ME-Sender: <xms:foHIYI0jyVUYC_RSMLj0LGbuH6-A98L3-9PCeg6iYyUp5miMJ440Mg>
    <xme:foHIYDHthpBnbxrUf9xYnCwfm2kDEHXEFb83IWJfkupmaceRDVeLpD4nIPOdATvzy
    w4mInhoTeSowu183Ds>
X-ME-Received: <xmr:foHIYA5cGeGipgMcYfdsj6eTPgMajBen9A9Xf0XFE0-x1ufTkYr-sLyxjf3shQpDozwOciyZt4IjYQMN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:foHIYB0yTOYBV1ftuYFoaYsT65yoxU-18rozbx26bni-e5rpshXx9w>
    <xmx:foHIYLEodxg9hRz7lRUIiOqeEqGQjRoKS4jPiBOiXtLVkGNOx8jHsw>
    <xmx:foHIYK_1Xfsp-0ZOFCB9InvsnYXzQVHCRJvviZ9fYvxOeFIwkbvE8g>
    <xmx:foHIYBZkL4jJVo7z6sv_0kGXq7fGeRaGqvw_hd3VpnTB1ptISPd1mg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:31:03 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 7/9] Input: wacom_i2c - Add support for vdd regulator
Date:   Tue, 15 Jun 2021 20:30:12 +1000
Message-Id: <20210615103014.798-8-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103014.798-1-alistair@alistair23.me>
References: <20210615103014.798-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for a VDD regulator. This allows the kernel to prove the
Wacom-I2C device on the rM2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 49d1c15e623c..df77b17835e4 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -13,6 +13,7 @@
 #include <linux/irq.h>
 #include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
@@ -59,6 +60,7 @@ struct wacom_i2c {
 	struct input_dev *input;
 	struct touchscreen_properties props;
 	struct wacom_features features;
+	struct regulator *vdd;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -222,11 +224,24 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
+	wac_i2c->vdd = regulator_get(&client->dev, "vdd");
+	if (IS_ERR(wac_i2c->vdd))
+		return PTR_ERR(wac_i2c->vdd);
+
+	error = regulator_enable(wac_i2c->vdd);
+	if (error) {
+		regulator_put(wac_i2c->vdd);
+		return error;
+	}
+
 	wac_i2c->client = client;
 
 	input = devm_input_allocate_device(dev);
-	if (!input)
+	if (!input) {
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return -ENOMEM;
+	}
 
 	wac_i2c->input = input;
 
@@ -261,6 +276,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 					  IRQF_ONESHOT, "wacom_i2c", wac_i2c);
 	if (error) {
 		dev_err(dev, "Failed to request IRQ: %d\n", error);
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return error;
 	}
 
@@ -270,6 +287,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	error = input_register_device(wac_i2c->input);
 	if (error) {
 		dev_err(dev, "Failed to register input device: %d\n", error);
+		regulator_disable(wac_i2c->vdd);
+		regulator_put(wac_i2c->vdd);
 		return error;
 	}
 
-- 
2.31.1

