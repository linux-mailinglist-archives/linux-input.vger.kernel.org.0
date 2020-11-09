Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852D02AC760
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 22:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730738AbgKIVhi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 16:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730664AbgKIVhd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 16:37:33 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCE6C0613D3
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 13:37:31 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id h6so8276630pgk.4
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 13:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NNRoLoYxkiRimKsamtR/wU4I4Dy9u1TxkiK2Eke0Tfw=;
        b=bfjg3FatzGJrrZHH0ICfFXfngMqbBU+llsM81m0qIG53sJeyiUX9l4y2R/GVVJrEpt
         eFItP2te8xKVVrHYwQg64jVPa2Zzcixv5iYDgg3Md8EKh8H89IxWPUC9OOFkhv9hnoLB
         dsP8N+PN3s+N9Wsw5sPm41hAfj8STukToim6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NNRoLoYxkiRimKsamtR/wU4I4Dy9u1TxkiK2Eke0Tfw=;
        b=sIbhLiQF8jxP8J2zghrtxW8bF9yjGlMCKGJEsVhg+1GyLk/vuEc7EPSBDFaxd3AE19
         pHJ4p60J4wwkKz+zCWtXUn4u6J1xtp5eougfXaJhLnqgn+tokwJMRwrKQsav+OchY3BZ
         ZXmsmvjVegZHRnIDpHmRtzsGEAoMBvw+V1uN3moG34B1f/rkKGAIgg7ZBIVvEli9p1JO
         qNeA1P5ly8AdfoyEmzG3n6DELaXcWC0OlBqR+0TeBXgqLNzcyO4Xk1nHQYGLwy6YYRlF
         +pZEEXM1LKbgOZkRWgcWhbk/KANHZVdp1pl1oRCPZDMGlN6ccr6crHeMmZesxbp/cxjF
         CXHA==
X-Gm-Message-State: AOAM530IZ6wjv0QYEY5m5OooaDjhNk/6a/1RRVWzJHNfP7kBTXuz/wRf
        mx0d7vJlpjs2+HMuHXrHcocoeg==
X-Google-Smtp-Source: ABdhPJznpCe2sDSveeqw0m0xkUaskz2FwjzpSPbc2o5kC/jt6E+Lz+HSJmKAcqy7lblc6/wlJYW6QQ==
X-Received: by 2002:a63:ef4f:: with SMTP id c15mr14441624pgk.345.1604957851388;
        Mon, 09 Nov 2020 13:37:31 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id i10sm11895444pfd.60.2020.11.09.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:37:30 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     kai.heng.feng@canonical.com, hdegoede@redhat.com,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        swboyd@chromium.org, andrea@borgia.bo.it,
        Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] HID: i2c-hid: Introduce goodix-i2c-hid using i2c-hid core
Date:   Mon,  9 Nov 2020 13:36:36 -0800
Message-Id: <20201109133526.v5.4.If41b7d621633b94d56653c6d53f5f89c5274de7b@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
In-Reply-To: <20201109213636.1267536-1-dianders@chromium.org>
References: <20201109213636.1267536-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Goodix i2c-hid touchscreens are mostly i2c-hid compliant but have some
special power sequencing requirements, including the need to drive a
reset line during the sequencing.

Let's use the new rejiggering of i2c-hid to support this with a thin
wrapper driver to support the first Goodix i2c-hid touchscreen:
GT7375P

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- i2chid_subclass_data => i2chid_ops.
- power_up_device => power_up (same with power_down).
- subclass => ops.

Changes in v4:
- Totally redid based on the new subclass system.

Changes in v3:
- Rework to use subclassing.

 drivers/hid/i2c-hid/Kconfig             |  19 +++-
 drivers/hid/i2c-hid/Makefile            |   1 +
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 120 ++++++++++++++++++++++++
 3 files changed, 138 insertions(+), 2 deletions(-)
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c

diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
index 819b7521c182..a16c6a69680b 100644
--- a/drivers/hid/i2c-hid/Kconfig
+++ b/drivers/hid/i2c-hid/Kconfig
@@ -32,10 +32,25 @@ config I2C_HID_OF
 	  will be called i2c-hid-of.  It will also build/depend on the
 	  module i2c-hid.
 
+config I2C_HID_OF_GOODIX
+	tristate "Driver for Goodix hid-i2c based devices on OF systems"
+	default n
+	depends on I2C && INPUT && OF
+	help
+	  Say Y here if you want support for Goodix i2c devices that use
+	  the i2c-hid protocol on Open Firmware (Device Tree)-based
+	  systems.
+
+	  If unsure, say N.
+
+	  This support is also available as a module.  If so, the module
+	  will be called i2c-hid-of-goodix.  It will also build/depend on
+	  the module i2c-hid.
+
 endmenu
 
 config I2C_HID_CORE
 	tristate
-	default y if I2C_HID_ACPI=y || I2C_HID_OF=y
-	default m if I2C_HID_ACPI=m || I2C_HID_OF=m
+	default y if I2C_HID_ACPI=y || I2C_HID_OF=y || I2C_HID_OF_GOODIX=y
+	default m if I2C_HID_ACPI=m || I2C_HID_OF=m || I2C_HID_OF_GOODIX=m
 	select HID
diff --git a/drivers/hid/i2c-hid/Makefile b/drivers/hid/i2c-hid/Makefile
index 9b4a73446841..302545a771f3 100644
--- a/drivers/hid/i2c-hid/Makefile
+++ b/drivers/hid/i2c-hid/Makefile
@@ -10,3 +10,4 @@ i2c-hid-$(CONFIG_DMI)				+= i2c-hid-dmi-quirks.o
 
 obj-$(CONFIG_I2C_HID_ACPI)			+= i2c-hid-acpi.o
 obj-$(CONFIG_I2C_HID_OF)			+= i2c-hid-of.o
+obj-$(CONFIG_I2C_HID_OF_GOODIX)			+= i2c-hid-of-goodix.o
diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
new file mode 100644
index 000000000000..eada0363ef62
--- /dev/null
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Goodix touchscreens that use the i2c-hid protocol.
+ *
+ * Copyright 2020 Google LLC
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
+
+#include "i2c-hid.h"
+
+struct goodix_i2c_hid_timing_data {
+	unsigned int post_gpio_reset_delay_ms;
+	unsigned int post_power_delay_ms;
+};
+
+struct i2c_hid_of_goodix {
+	struct i2chid_ops ops;
+
+	struct regulator *vdd;
+	struct gpio_desc *reset_gpio;
+	const struct goodix_i2c_hid_timing_data *timings;
+};
+
+static int goodix_i2c_hid_power_up(struct i2chid_ops *ops)
+{
+	struct i2c_hid_of_goodix *ihid_goodix =
+		container_of(ops, struct i2c_hid_of_goodix, ops);
+	int ret;
+
+	ret = regulator_enable(ihid_goodix->vdd);
+	if (ret)
+		return ret;
+
+	if (ihid_goodix->timings->post_power_delay_ms)
+		msleep(ihid_goodix->timings->post_power_delay_ms);
+
+	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 0);
+	if (ihid_goodix->timings->post_gpio_reset_delay_ms)
+		msleep(ihid_goodix->timings->post_gpio_reset_delay_ms);
+
+	return 0;
+}
+
+static void goodix_i2c_hid_power_down(struct i2chid_ops *ops)
+{
+	struct i2c_hid_of_goodix *ihid_goodix =
+		container_of(ops, struct i2c_hid_of_goodix, ops);
+
+	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+	regulator_disable(ihid_goodix->vdd);
+}
+
+static int i2c_hid_of_goodix_probe(struct i2c_client *client,
+				   const struct i2c_device_id *id)
+{
+	struct i2c_hid_of_goodix *ihid_goodix;
+
+	ihid_goodix = devm_kzalloc(&client->dev, sizeof(*ihid_goodix),
+				   GFP_KERNEL);
+	if (!ihid_goodix)
+		return -ENOMEM;
+
+	ihid_goodix->ops.power_up = goodix_i2c_hid_power_up;
+	ihid_goodix->ops.power_down = goodix_i2c_hid_power_down;
+
+	/* Start out with reset asserted */
+	ihid_goodix->reset_gpio =
+		devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ihid_goodix->reset_gpio))
+		return PTR_ERR(ihid_goodix->reset_gpio);
+
+	ihid_goodix->vdd = devm_regulator_get(&client->dev, "vdd");
+	if (IS_ERR(ihid_goodix->vdd))
+		return PTR_ERR(ihid_goodix->vdd);
+
+	ihid_goodix->timings = device_get_match_data(&client->dev);
+
+	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001);
+}
+
+static const struct goodix_i2c_hid_timing_data goodix_gt7375p_timing_data = {
+	.post_power_delay_ms = 10,
+	.post_gpio_reset_delay_ms = 120,
+};
+
+static const struct of_device_id goodix_i2c_hid_of_match[] = {
+	{ .compatible = "goodix,gt7375p", .data = &goodix_gt7375p_timing_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, goodix_i2c_hid_of_match);
+
+static const struct dev_pm_ops goodix_i2c_hid_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
+};
+
+static struct i2c_driver goodix_i2c_hid_ts_driver = {
+	.driver = {
+		.name	= "i2c_hid_of_goodix",
+		.pm	= &goodix_i2c_hid_pm,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = of_match_ptr(goodix_i2c_hid_of_match),
+	},
+	.probe		= i2c_hid_of_goodix_probe,
+	.remove		= i2c_hid_core_remove,
+	.shutdown	= i2c_hid_core_shutdown,
+};
+module_i2c_driver(goodix_i2c_hid_ts_driver);
+
+MODULE_AUTHOR("Douglas Anderson <dianders@chromium.org>");
+MODULE_DESCRIPTION("Goodix i2c-hid touchscreen driver");
+MODULE_LICENSE("GPL v2");
-- 
2.29.2.222.g5d2a92d10f8-goog

