Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED9236DC06C
	for <lists+linux-input@lfdr.de>; Sun,  9 Apr 2023 16:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjDIOoM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Apr 2023 10:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDIOoM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Apr 2023 10:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4C33581
        for <linux-input@vger.kernel.org>; Sun,  9 Apr 2023 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681051372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z75uK5oTG5VLvA3FDgeiE09Vw47NJELrgK12v0JrMmk=;
        b=DNJ2lcoUTyJAoFtzs+jGW3UWD8CBu6kc2PkFiCQpGNjaUksnETlf/mu5YaZld8pJ9uT56u
        Xt6t6vIY/FcGH/3ujlr10Vx5FEIML/7LAlGrDHH/dt7Nw0THjGjDp4r8xn1D3pNKugU585
        BLy4X8OKbg5XsZ8TUnvFeiM8NMWZNz4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-gaihaSxjPMy1Ot-_me45Yw-1; Sun, 09 Apr 2023 10:42:50 -0400
X-MC-Unique: gaihaSxjPMy1Ot-_me45Yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B8F3185A78F;
        Sun,  9 Apr 2023 14:42:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7F9C2202701E;
        Sun,  9 Apr 2023 14:42:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 5/6] HID: i2c-hid-of: Consolidate Elan support into generic i2c-hid-of driver
Date:   Sun,  9 Apr 2023 16:42:42 +0200
Message-Id: <20230409144243.25360-6-hdegoede@redhat.com>
In-Reply-To: <20230409144243.25360-1-hdegoede@redhat.com>
References: <20230409144243.25360-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The generic i2c-hid-of driver nowsupports a reset GPIO and allows
setting the supply-names, hid_descriptor_address and delays through
match_data / chip_data.

This means that i2c-hid-of can be easily made to support
the elan,ekth6915 compatible directly and the i2c-hid-of-elan driver
can be dropped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/Kconfig           |  15 ---
 drivers/hid/i2c-hid/Makefile          |   1 -
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 129 --------------------------
 drivers/hid/i2c-hid/i2c-hid-of.c      |  14 +++
 4 files changed, 14 insertions(+), 145 deletions(-)
 delete mode 100644 drivers/hid/i2c-hid/i2c-hid-of-elan.c

diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
index 3be17109301a..6aa7cf18fd2d 100644
--- a/drivers/hid/i2c-hid/Kconfig
+++ b/drivers/hid/i2c-hid/Kconfig
@@ -38,21 +38,6 @@ config I2C_HID_OF
 	  will be called i2c-hid-of.  It will also build/depend on the
 	  module i2c-hid.
 
-config I2C_HID_OF_ELAN
-	tristate "Driver for Elan hid-i2c based devices on OF systems"
-	depends on OF
-	select I2C_HID_CORE
-	help
-	  Say Y here if you want support for Elan i2c devices that use
-	  the i2c-hid protocol on Open Firmware (Device Tree)-based
-	  systems.
-
-	  If unsure, say N.
-
-	  This support is also available as a module.  If so, the module
-	  will be called i2c-hid-of-elan.  It will also build/depend on
-	  the module i2c-hid.
-
 config I2C_HID_OF_GOODIX
 	tristate "Driver for Goodix hid-i2c based devices on OF systems"
 	depends on OF
diff --git a/drivers/hid/i2c-hid/Makefile b/drivers/hid/i2c-hid/Makefile
index 55bd5e0f35af..302545a771f3 100644
--- a/drivers/hid/i2c-hid/Makefile
+++ b/drivers/hid/i2c-hid/Makefile
@@ -10,5 +10,4 @@ i2c-hid-$(CONFIG_DMI)				+= i2c-hid-dmi-quirks.o
 
 obj-$(CONFIG_I2C_HID_ACPI)			+= i2c-hid-acpi.o
 obj-$(CONFIG_I2C_HID_OF)			+= i2c-hid-of.o
-obj-$(CONFIG_I2C_HID_OF_ELAN)			+= i2c-hid-of-elan.o
 obj-$(CONFIG_I2C_HID_OF_GOODIX)			+= i2c-hid-of-goodix.o
diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
deleted file mode 100644
index 76ddc8be1cbb..000000000000
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ /dev/null
@@ -1,129 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Driver for Elan touchscreens that use the i2c-hid protocol.
- *
- * Copyright 2020 Google LLC
- */
-
-#include <linux/delay.h>
-#include <linux/device.h>
-#include <linux/gpio/consumer.h>
-#include <linux/i2c.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/pm.h>
-#include <linux/regulator/consumer.h>
-
-#include "i2c-hid.h"
-
-struct elan_i2c_hid_chip_data {
-	unsigned int post_gpio_reset_delay_ms;
-	unsigned int post_power_delay_ms;
-	u16 hid_descriptor_address;
-};
-
-struct i2c_hid_of_elan {
-	struct i2chid_ops ops;
-
-	struct regulator *vcc33;
-	struct regulator *vccio;
-	struct gpio_desc *reset_gpio;
-	const struct elan_i2c_hid_chip_data *chip_data;
-};
-
-static int elan_i2c_hid_power_up(struct i2chid_ops *ops)
-{
-	struct i2c_hid_of_elan *ihid_elan =
-		container_of(ops, struct i2c_hid_of_elan, ops);
-	int ret;
-
-	ret = regulator_enable(ihid_elan->vcc33);
-	if (ret)
-		return ret;
-
-	ret = regulator_enable(ihid_elan->vccio);
-	if (ret) {
-		regulator_disable(ihid_elan->vcc33);
-		return ret;
-	}
-
-	if (ihid_elan->chip_data->post_power_delay_ms)
-		msleep(ihid_elan->chip_data->post_power_delay_ms);
-
-	gpiod_set_value_cansleep(ihid_elan->reset_gpio, 0);
-	if (ihid_elan->chip_data->post_gpio_reset_delay_ms)
-		msleep(ihid_elan->chip_data->post_gpio_reset_delay_ms);
-
-	return 0;
-}
-
-static void elan_i2c_hid_power_down(struct i2chid_ops *ops)
-{
-	struct i2c_hid_of_elan *ihid_elan =
-		container_of(ops, struct i2c_hid_of_elan, ops);
-
-	gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
-	regulator_disable(ihid_elan->vccio);
-	regulator_disable(ihid_elan->vcc33);
-}
-
-static int i2c_hid_of_elan_probe(struct i2c_client *client)
-{
-	struct i2c_hid_of_elan *ihid_elan;
-
-	ihid_elan = devm_kzalloc(&client->dev, sizeof(*ihid_elan), GFP_KERNEL);
-	if (!ihid_elan)
-		return -ENOMEM;
-
-	ihid_elan->ops.power_up = elan_i2c_hid_power_up;
-	ihid_elan->ops.power_down = elan_i2c_hid_power_down;
-
-	/* Start out with reset asserted */
-	ihid_elan->reset_gpio =
-		devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ihid_elan->reset_gpio))
-		return PTR_ERR(ihid_elan->reset_gpio);
-
-	ihid_elan->vccio = devm_regulator_get(&client->dev, "vccio");
-	if (IS_ERR(ihid_elan->vccio))
-		return PTR_ERR(ihid_elan->vccio);
-
-	ihid_elan->vcc33 = devm_regulator_get(&client->dev, "vcc33");
-	if (IS_ERR(ihid_elan->vcc33))
-		return PTR_ERR(ihid_elan->vcc33);
-
-	ihid_elan->chip_data = device_get_match_data(&client->dev);
-
-	return i2c_hid_core_probe(client, &ihid_elan->ops,
-				  ihid_elan->chip_data->hid_descriptor_address, 0);
-}
-
-static const struct elan_i2c_hid_chip_data elan_ekth6915_chip_data = {
-	.post_power_delay_ms = 1,
-	.post_gpio_reset_delay_ms = 300,
-	.hid_descriptor_address = 0x0001,
-};
-
-static const struct of_device_id elan_i2c_hid_of_match[] = {
-	{ .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, elan_i2c_hid_of_match);
-
-static struct i2c_driver elan_i2c_hid_ts_driver = {
-	.driver = {
-		.name	= "i2c_hid_of_elan",
-		.pm	= &i2c_hid_core_pm,
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.of_match_table = of_match_ptr(elan_i2c_hid_of_match),
-	},
-	.probe_new	= i2c_hid_of_elan_probe,
-	.remove		= i2c_hid_core_remove,
-	.shutdown	= i2c_hid_core_shutdown,
-};
-module_i2c_driver(elan_i2c_hid_ts_driver);
-
-MODULE_AUTHOR("Douglas Anderson <dianders@chromium.org>");
-MODULE_DESCRIPTION("Elan i2c-hid touchscreen driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 4fafef1e36b9..313eb198d840 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -167,8 +167,22 @@ static int i2c_hid_of_probe(struct i2c_client *client)
 }
 
 #ifdef CONFIG_OF
+static const char * const elan_ekth6915_supply_names[] = {
+	"vcc33",
+	"vccio",
+};
+
+static const struct i2c_hid_of_chip_data elan_ekth6915_chip_data = {
+	.supply_names = elan_ekth6915_supply_names,
+	.num_supplies = ARRAY_SIZE(elan_ekth6915_supply_names),
+	.post_power_delay_ms = 1,
+	.post_reset_delay_ms = 300,
+	.hid_descriptor_address = 0x0001,
+};
+
 static const struct of_device_id i2c_hid_of_match[] = {
 	{ .compatible = "hid-over-i2c" },
+	{ .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i2c_hid_of_match);
-- 
2.39.1

