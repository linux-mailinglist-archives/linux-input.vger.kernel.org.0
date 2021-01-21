Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9E22FE455
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 08:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbhAUHst (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 02:48:49 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33493 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726533AbhAUG6D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 01:58:03 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id E81975C00DF;
        Thu, 21 Jan 2021 01:56:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 21 Jan 2021 01:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=oJodX6qpXFQV+
        VsYmHwJjMPWcGqsiXCsjC3oiV31AZQ=; b=FUtFZx7Ggjfrm/qJjbj1QIYWcud14
        MuLt/fjrKzLs89va+9GXKXWoILHh900Zf/WBiOUT+y5peSFBHsrJgWxaTRRk7YR2
        9pk4tJBk/2aytHoqgpZS3p4RB0Sbb3HGlb9w7SG1DJbrN0Amk2dxtaUR5UaUiQ4A
        fjoPwoi95wuWIG9wnB0Kilav1Jf6HP1Vf2bTO5GbCuxWkQPcEph5eXGumVgzpYWI
        YsGbwX0W33632KEQUUcfZlHlpc6xwyuH9em1RNPfTYibVm+BbE/7/F6U226qnOce
        7DaYEGaTKMS5WVE14tKS0yzAoQ7zsZQDHT+/t8LEGm49wtlciCAa+iIAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=oJodX6qpXFQV+VsYmHwJjMPWcGqsiXCsjC3oiV31AZQ=; b=TUJMprGm
        7TSy96+Eoz72UAnJRi0L+fnXCxzh1uhiW3z30+CQBvLkt4jMdApo6PPRVdjrLgA6
        lnzPk3ql/QLRALvu2OYoboU1OYIf/KF5jgHYVSB5ojC8Cmu1i0pP3k3SNUNfiZYy
        lo+9sldG1lXrMtUoeznigF8aqObp+rYKKZF6jD6m1x+01h0gZF3qKAsN56001PS4
        EYExiX/mcPU7M/0GiPOH/K87FmqxamXpAK0A3/CHbhbTMzsG0ak1G78gG9WhgvH3
        2oARrfKatbWYpTJwTwTuKlNWgfMZX3mRBfvzyYGpsr27/PgIn+ANNuaZPYCRr8IO
        WFaQTxtCAJfUjg==
X-ME-Sender: <xms:sSUJYC2NpkHkgFzFBnvRnJjplQThTTc8Byu6s6tjrczDIKWdUMoocQ>
    <xme:sSUJYFGmMgoQkcqzieEr7b57t00Fv8leabuTaDv5kN_UMDd0duwsI_PVjw9rLef2R
    SN4ZfmKPjEHsONnv-U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepjeefrdel
    fedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:sSUJYK7uCWGjGLgy1IZ0z4z0PQh9Sq3Mqf8gNfnRiBaMeXG7gVickA>
    <xmx:sSUJYD1g9m6V8nvQWz5LAaTy2YTNaRG-aC3ebXXiWCQsqLyTHLn7XQ>
    <xmx:sSUJYFGM3XMq2syyWEOroJMAmB9LAyDT_JzQXWcs8g2E2Nvw55zF2Q>
    <xmx:sSUJYFAx8CrzlmxgRf5g4nLUDg6_Kk7UxNOvAtwNsuFSGia-tDutuA>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id 013191080057;
        Thu, 21 Jan 2021 01:56:48 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 2/6] input/touchscreen: Add device tree support to wacom_i2c
Date:   Wed, 20 Jan 2021 22:56:39 -0800
Message-Id: <20210121065643.342-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121065643.342-1-alistair@alistair23.me>
References: <20210121065643.342-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the wacom-i2c device to be exposed via device tree.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../input/touchscreen/wacom,wacom-i2c.yaml       |  4 ++++
 drivers/input/touchscreen/wacom_i2c.c            | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
index b36d22cd20a2..06ad5ee561af 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
@@ -22,6 +22,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  vdd-supply:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -40,5 +43,6 @@ examples:
                 reg = <0x9>;
                 interrupt-parent = <&gpio1>;
                 interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+                vdd-supply = <&reg_touch>;
         };
     };
diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 1afc6bde2891..ec6e0aff8deb 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -11,7 +11,9 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/irq.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <asm/unaligned.h>
 
 #define WACOM_CMD_QUERY0	0x04
@@ -32,6 +34,7 @@ struct wacom_features {
 struct wacom_i2c {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct touchscreen_properties props;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -187,6 +190,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	__set_bit(BTN_STYLUS2, input->keybit);
 	__set_bit(BTN_TOUCH, input->keybit);
 
+	touchscreen_parse_properties(input, true, &wac_i2c->props);
 	input_set_abs_params(input, ABS_X, 0, features.x_max, 0, 0);
 	input_set_abs_params(input, ABS_Y, 0, features.y_max, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE,
@@ -214,6 +218,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	}
 
 	i2c_set_clientdata(client, wac_i2c);
+
 	return 0;
 
 err_free_irq:
@@ -262,10 +267,21 @@ static const struct i2c_device_id wacom_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id wacom_i2c_of_match_table[] = {
+	{ .compatible = "wacom,wacom-i2c" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
+#endif
+
 static struct i2c_driver wacom_i2c_driver = {
 	.driver	= {
 		.name	= "wacom_i2c",
 		.pm	= &wacom_i2c_pm,
+#ifdef CONFIG_OF
+		.of_match_table = of_match_ptr(wacom_i2c_of_match_table),
+#endif
 	},
 
 	.probe		= wacom_i2c_probe,
-- 
2.29.2

