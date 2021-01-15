Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A8E2F81A5
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 18:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730730AbhAORIa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 12:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728917AbhAORI2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 12:08:28 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AECC06179C
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 09:07:13 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id g15so6376783pgu.9
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 09:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fP/r9rL0LAxiAFg8ShML1r0nBp2WbscJ4pPL3DzW824=;
        b=cHrWchv8OtSjjqlD6eLyh0DPAVSO7I0yljkUtZ9IBhaAqssH1gWCiN8Wac5QzfKneu
         qcJzwMnEPXwf3g3BzTA/Gx8mnCbmX5D1CqFk3W8XMluJRTb1XW2gXOYh4bbZLHl7kQF7
         BcIShFXkQGp7T+GUsXxWvDxpn4sJUg3RSvRfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fP/r9rL0LAxiAFg8ShML1r0nBp2WbscJ4pPL3DzW824=;
        b=SNznLrJu859U/ojNvFocuCsw9aV8uEziApwqmgxmywskoymi6S9BzNOb6kllMHJhEo
         +4pBQzKYhl9WS3f4wH+7dzz6yZO55CYtUvmFtjJxbyFJAtMQR6BRr+HtgcwjmBp+LpTm
         cHwYkY7MuAikF0ZlaKKO9AndrzbdnyBOCyXp/3ZhXYnSLI6pPzMKp2+Ox9nn9w9rvzD/
         6jehVStsqClT9CxHygjUNBzlfQKpRNfUJ4VorMjad6/xRBzcWrmlqEl6lQILbHiQP6/L
         kUyT+LhGdoczQNAAFcnZiTl+dVQdhIh7fH8t7MdoWy8z+7NqZK7BVzpxPTWd9oLssUMB
         vZGw==
X-Gm-Message-State: AOAM533t21gX+b/xfGhgVubI8IhdzbQYpD2FC6/7HRt9k71mLPy0aEjY
        WJJjVh53STJ0UfXjGlEtfuasrg==
X-Google-Smtp-Source: ABdhPJwIhu1Zj19H8D7Z237E0sDU/xrNQuZyeXcbW/Ohy9pxPOjEYmLXmySMgO476s304FB0P41rxw==
X-Received: by 2002:a62:8482:0:b029:1ae:6d04:bddb with SMTP id k124-20020a6284820000b02901ae6d04bddbmr13734429pfd.11.1610730432889;
        Fri, 15 Jan 2021 09:07:12 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id t23sm8813329pfc.0.2021.01.15.09.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 09:07:12 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     swboyd@chromium.org, linux-input@vger.kernel.org,
        hdegoede@redhat.com, andrea@borgia.bo.it,
        kai.heng.feng@canonical.com, robh+dt@kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/4] HID: i2c-hid: Introduce goodix-i2c-hid using i2c-hid core
Date:   Fri, 15 Jan 2021 09:06:40 -0800
Message-Id: <20210115090518.v9.4.If41b7d621633b94d56653c6d53f5f89c5274de7b@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115170641.903392-1-dianders@chromium.org>
References: <20210115170641.903392-1-dianders@chromium.org>
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

Changes in v9:
- 120 ms delay => 180 ms delay

Changes in v6:
- Suspend/resume are no longer exported from the core.

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
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 116 ++++++++++++++++++++++++
 3 files changed, 134 insertions(+), 2 deletions(-)
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
index 000000000000..ee0225982a82
--- /dev/null
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -0,0 +1,116 @@
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
+	.post_gpio_reset_delay_ms = 180,
+};
+
+static const struct of_device_id goodix_i2c_hid_of_match[] = {
+	{ .compatible = "goodix,gt7375p", .data = &goodix_gt7375p_timing_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, goodix_i2c_hid_of_match);
+
+static struct i2c_driver goodix_i2c_hid_ts_driver = {
+	.driver = {
+		.name	= "i2c_hid_of_goodix",
+		.pm	= &i2c_hid_core_pm,
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
2.30.0.284.gd98b1dd5eaa7-goog

