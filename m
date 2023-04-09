Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DBE6DC06D
	for <lists+linux-input@lfdr.de>; Sun,  9 Apr 2023 16:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjDIOoO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Apr 2023 10:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDIOoN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Apr 2023 10:44:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77DD3AA8
        for <linux-input@vger.kernel.org>; Sun,  9 Apr 2023 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681051374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bffvzhb5EeXETtOZcWA1ovMDmuOkMFT3gveiE/JJTro=;
        b=diytOM8Eq6MULekmtNpegmeOOO+3QONW/JgwzkVj/grvG6RY7j1VmcdfIcZGShKy/yAig8
        2gOT7xSp47d3qAOXlMSywnKAYMGrijnYmiv127w0wYQXj3DraBpTiEdHZuRKgVQtSEVyld
        /w9BxKtUFaFHlH/yZuaeWHOH0kQep1Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-w5oVrwcdMzWHuAB8BsajpA-1; Sun, 09 Apr 2023 10:42:51 -0400
X-MC-Unique: w5oVrwcdMzWHuAB8BsajpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AD933801F6A;
        Sun,  9 Apr 2023 14:42:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7E793202701E;
        Sun,  9 Apr 2023 14:42:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 6/6] HID: i2c-hid-of: Consolidate Goodix support into generic i2c-hid-of driver
Date:   Sun,  9 Apr 2023 16:42:43 +0200
Message-Id: <20230409144243.25360-7-hdegoede@redhat.com>
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
the goodix,gt7375p compatible directly and the i2c-hid-of-goodix
driver can be dropped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/Kconfig             |  15 ---
 drivers/hid/i2c-hid/Makefile            |   1 -
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 125 ------------------------
 drivers/hid/i2c-hid/i2c-hid-of.c        |  14 +++
 4 files changed, 14 insertions(+), 141 deletions(-)
 delete mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c

diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
index 6aa7cf18fd2d..10e4b368b818 100644
--- a/drivers/hid/i2c-hid/Kconfig
+++ b/drivers/hid/i2c-hid/Kconfig
@@ -38,21 +38,6 @@ config I2C_HID_OF
 	  will be called i2c-hid-of.  It will also build/depend on the
 	  module i2c-hid.
 
-config I2C_HID_OF_GOODIX
-	tristate "Driver for Goodix hid-i2c based devices on OF systems"
-	depends on OF
-	select I2C_HID_CORE
-	help
-	  Say Y here if you want support for Goodix i2c devices that use
-	  the i2c-hid protocol on Open Firmware (Device Tree)-based
-	  systems.
-
-	  If unsure, say N.
-
-	  This support is also available as a module.  If so, the module
-	  will be called i2c-hid-of-goodix.  It will also build/depend on
-	  the module i2c-hid.
-
 config I2C_HID_CORE
 	tristate
 endif
diff --git a/drivers/hid/i2c-hid/Makefile b/drivers/hid/i2c-hid/Makefile
index 302545a771f3..9b4a73446841 100644
--- a/drivers/hid/i2c-hid/Makefile
+++ b/drivers/hid/i2c-hid/Makefile
@@ -10,4 +10,3 @@ i2c-hid-$(CONFIG_DMI)				+= i2c-hid-dmi-quirks.o
 
 obj-$(CONFIG_I2C_HID_ACPI)			+= i2c-hid-acpi.o
 obj-$(CONFIG_I2C_HID_OF)			+= i2c-hid-of.o
-obj-$(CONFIG_I2C_HID_OF_GOODIX)			+= i2c-hid-of-goodix.o
diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
deleted file mode 100644
index 0060e3dcd775..000000000000
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ /dev/null
@@ -1,125 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Driver for Goodix touchscreens that use the i2c-hid protocol.
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
-struct goodix_i2c_hid_timing_data {
-	unsigned int post_gpio_reset_delay_ms;
-	unsigned int post_power_delay_ms;
-};
-
-struct i2c_hid_of_goodix {
-	struct i2chid_ops ops;
-
-	struct regulator *vdd;
-	struct regulator *vddio;
-	struct gpio_desc *reset_gpio;
-	const struct goodix_i2c_hid_timing_data *timings;
-};
-
-static int goodix_i2c_hid_power_up(struct i2chid_ops *ops)
-{
-	struct i2c_hid_of_goodix *ihid_goodix =
-		container_of(ops, struct i2c_hid_of_goodix, ops);
-	int ret;
-
-	ret = regulator_enable(ihid_goodix->vdd);
-	if (ret)
-		return ret;
-
-	ret = regulator_enable(ihid_goodix->vddio);
-	if (ret)
-		return ret;
-
-	if (ihid_goodix->timings->post_power_delay_ms)
-		msleep(ihid_goodix->timings->post_power_delay_ms);
-
-	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 0);
-	if (ihid_goodix->timings->post_gpio_reset_delay_ms)
-		msleep(ihid_goodix->timings->post_gpio_reset_delay_ms);
-
-	return 0;
-}
-
-static void goodix_i2c_hid_power_down(struct i2chid_ops *ops)
-{
-	struct i2c_hid_of_goodix *ihid_goodix =
-		container_of(ops, struct i2c_hid_of_goodix, ops);
-
-	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
-	regulator_disable(ihid_goodix->vddio);
-	regulator_disable(ihid_goodix->vdd);
-}
-
-static int i2c_hid_of_goodix_probe(struct i2c_client *client)
-{
-	struct i2c_hid_of_goodix *ihid_goodix;
-
-	ihid_goodix = devm_kzalloc(&client->dev, sizeof(*ihid_goodix),
-				   GFP_KERNEL);
-	if (!ihid_goodix)
-		return -ENOMEM;
-
-	ihid_goodix->ops.power_up = goodix_i2c_hid_power_up;
-	ihid_goodix->ops.power_down = goodix_i2c_hid_power_down;
-
-	/* Start out with reset asserted */
-	ihid_goodix->reset_gpio =
-		devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ihid_goodix->reset_gpio))
-		return PTR_ERR(ihid_goodix->reset_gpio);
-
-	ihid_goodix->vdd = devm_regulator_get(&client->dev, "vdd");
-	if (IS_ERR(ihid_goodix->vdd))
-		return PTR_ERR(ihid_goodix->vdd);
-
-	ihid_goodix->vddio = devm_regulator_get(&client->dev, "mainboard-vddio");
-	if (IS_ERR(ihid_goodix->vddio))
-		return PTR_ERR(ihid_goodix->vddio);
-
-	ihid_goodix->timings = device_get_match_data(&client->dev);
-
-	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001, 0);
-}
-
-static const struct goodix_i2c_hid_timing_data goodix_gt7375p_timing_data = {
-	.post_power_delay_ms = 10,
-	.post_gpio_reset_delay_ms = 180,
-};
-
-static const struct of_device_id goodix_i2c_hid_of_match[] = {
-	{ .compatible = "goodix,gt7375p", .data = &goodix_gt7375p_timing_data },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, goodix_i2c_hid_of_match);
-
-static struct i2c_driver goodix_i2c_hid_ts_driver = {
-	.driver = {
-		.name	= "i2c_hid_of_goodix",
-		.pm	= &i2c_hid_core_pm,
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.of_match_table = of_match_ptr(goodix_i2c_hid_of_match),
-	},
-	.probe_new	= i2c_hid_of_goodix_probe,
-	.remove		= i2c_hid_core_remove,
-	.shutdown	= i2c_hid_core_shutdown,
-};
-module_i2c_driver(goodix_i2c_hid_ts_driver);
-
-MODULE_AUTHOR("Douglas Anderson <dianders@chromium.org>");
-MODULE_DESCRIPTION("Goodix i2c-hid touchscreen driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 313eb198d840..7f298210447a 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -180,9 +180,23 @@ static const struct i2c_hid_of_chip_data elan_ekth6915_chip_data = {
 	.hid_descriptor_address = 0x0001,
 };
 
+static const char * const goodix_gt7375p_supply_names[] = {
+	"vdd",
+	"mainboard-vddio",
+};
+
+static const struct i2c_hid_of_chip_data goodix_gt7375p_chip_data = {
+	.supply_names = goodix_gt7375p_supply_names,
+	.num_supplies = ARRAY_SIZE(goodix_gt7375p_supply_names),
+	.post_power_delay_ms = 10,
+	.post_reset_delay_ms = 180,
+	.hid_descriptor_address = 0x0001,
+};
+
 static const struct of_device_id i2c_hid_of_match[] = {
 	{ .compatible = "hid-over-i2c" },
 	{ .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
+	{ .compatible = "goodix,gt7375p", .data = &goodix_gt7375p_chip_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i2c_hid_of_match);
-- 
2.39.1

