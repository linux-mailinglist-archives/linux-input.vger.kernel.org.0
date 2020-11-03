Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF732A3788
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 01:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbgKCANL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 19:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbgKCANK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Nov 2020 19:13:10 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BE5C061A47
        for <linux-input@vger.kernel.org>; Mon,  2 Nov 2020 16:13:10 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id b12so7698557plr.4
        for <linux-input@vger.kernel.org>; Mon, 02 Nov 2020 16:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97UEiB822+bqf5cp9dtnLiwnHYdHrQTsb2r4ia6eYtA=;
        b=aDVU2nzb2iKQxsov5JiAryU6VsMoZwDbY3EnI6IjFtjZEIEJjKAkEkssfGbDo3tXNi
         33bfUPC0/YjtRi5EuPAZZUH7ooyT0pXvS2gtymCaZ1b2/HDZEUscDmt2idjXF5rhkRBj
         x1AAezfDTresNl0hzFvsrrwlsxysOyySx+IsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97UEiB822+bqf5cp9dtnLiwnHYdHrQTsb2r4ia6eYtA=;
        b=RRHXZJbI+h6BCMQdtX3zhYJCliPllZm0Mtk1ZyI8Nv4OSMSe0jd+LWksISFG6dWV2/
         wL8ga9Jz2YDj6VgVHQN6MlLTIFE0UAGREVEE/MbHvrh+YgGQeOlb0JbJZlq5ZOAmatKu
         qPdNbURHO1sp8PvpfC9VQ/vPTxPPn0eWAStL1GqjQLQWF0pJb5sfcxuq/lx3VokZT5hm
         iGzrxQayKB+AXeztOgIlw2HmfdV6sffeugPiV1+4udFfBTy2AZOJz8ukqTyGloG+yZok
         1wjQ5VNHm2uhtBONwI+uRyoi/jzrUyRg/aOXKYj59BHHnKUsQJjjUf1IfHy/dnrQgMrs
         zvbg==
X-Gm-Message-State: AOAM530Yw7VmXLBA2EeDZtL1rkvUt/9oxlKLePPrFf3Ncznhf19LOHaH
        +0XS4LAmCOskMztmlbBy+v4z+g==
X-Google-Smtp-Source: ABdhPJyQMaFVKP/JVrDd7qFFIFAJNqE7LOR3R6jgdcD/jZC/RstC2B1bNRiN5YSLqjnkisQ1/NKapA==
X-Received: by 2002:a17:902:c383:b029:d6:991c:671b with SMTP id g3-20020a170902c383b02900d6991c671bmr18366735plg.51.1604362389743;
        Mon, 02 Nov 2020 16:13:09 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id v16sm13244295pgk.26.2020.11.02.16.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:13:09 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, hdegoede@redhat.com,
        swboyd@chromium.org, kai.heng.feng@canonical.com,
        robh+dt@kernel.org, andrea@borgia.bo.it,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] Input: Introduce goodix-i2c-hid as a subclass of i2c-hid
Date:   Mon,  2 Nov 2020 16:12:41 -0800
Message-Id: <20201102161210.v3.3.If41b7d621633b94d56653c6d53f5f89c5274de7b@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201102161210.v3.1.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
References: <20201102161210.v3.1.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Goodix i2c-hid touchscreens are mostly i2c-hid compliant but have some
special power sequencing requirements, including the need to drive a
reset line during the sequencing.

Let's use the new ability of i2c-hid to have subclasses for power
sequencing to support the first Goodix i2c-hid touchscreen: GT7375P

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Rework to use subclassing.

 drivers/input/touchscreen/Kconfig          |  12 +++
 drivers/input/touchscreen/Makefile         |   1 +
 drivers/input/touchscreen/goodix-i2c-hid.c | 115 +++++++++++++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 drivers/input/touchscreen/goodix-i2c-hid.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index f012fe746df0..64d481101917 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -403,6 +403,18 @@ config TOUCHSCREEN_GOODIX
 	  To compile this driver as a module, choose M here: the
 	  module will be called goodix.
 
+config TOUCHSCREEN_GOODIX_I2C_HID
+	tristate "Goodix I2C-HID touchscreen"
+	depends on I2C_HID
+	help
+	  Say Y here if you have a Goodix touchscreen that uses i2c-hid
+	  to communicate.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called goodix-i2c-hid.
+
 config TOUCHSCREEN_HIDEEP
 	tristate "HiDeep Touch IC"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 6233541e9173..32b1a768aa06 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_TOUCHSCREEN_EGALAX_SERIAL)	+= egalax_ts_serial.o
 obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
 obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix.o
+obj-$(CONFIG_TOUCHSCREEN_GOODIX_I2C_HID)	+= goodix-i2c-hid.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
 obj-$(CONFIG_TOUCHSCREEN_IMX6UL_TSC)	+= imx6ul_tsc.o
diff --git a/drivers/input/touchscreen/goodix-i2c-hid.c b/drivers/input/touchscreen/goodix-i2c-hid.c
new file mode 100644
index 000000000000..a2cc4f923d8a
--- /dev/null
+++ b/drivers/input/touchscreen/goodix-i2c-hid.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Goodix touchscreens that use the i2c-hid protocol.
+ *
+ * Copyright 2020 Google LLC
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input/i2c-hid-core.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_data/i2c-hid.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+struct goodix_i2c_hid_timing_data {
+	unsigned int post_gpio_reset_delay_ms;
+	unsigned int post_power_delay_ms;
+};
+
+static const struct goodix_i2c_hid_timing_data goodix_gt7375p_timing_data = {
+	.post_power_delay_ms = 10,
+	.post_gpio_reset_delay_ms = 120,
+};
+
+struct goodix_i2c_hid_plat_data {
+	struct gpio_desc *reset_gpio;
+	const struct goodix_i2c_hid_timing_data *timings;
+
+	struct i2c_hid_platform_data ihid_pdata;
+};
+
+static int goodix_i2c_hid_power_up_device(struct i2c_hid_platform_data *ihid_pdata)
+{
+	struct goodix_i2c_hid_plat_data *pdata = ihid_pdata->power_data;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_pdata->supplies),
+				    ihid_pdata->supplies);
+	if (ret)
+		return ret;
+
+	if (pdata->timings->post_power_delay_ms)
+		msleep(pdata->timings->post_power_delay_ms);
+
+	gpiod_set_value_cansleep(pdata->reset_gpio, 0);
+	if (pdata->timings->post_gpio_reset_delay_ms)
+		msleep(pdata->timings->post_gpio_reset_delay_ms);
+
+	return 0;
+}
+
+static void goodix_i2c_hid_power_down_device(struct i2c_hid_platform_data *ihid_pdata)
+{
+	struct goodix_i2c_hid_plat_data *pdata = ihid_pdata->power_data;
+
+	gpiod_set_value_cansleep(pdata->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ihid_pdata->supplies),
+			       ihid_pdata->supplies);
+}
+
+static int goodix_i2c_hid_ts_probe(struct i2c_client *client,
+				   const struct i2c_device_id *id)
+{
+	struct goodix_i2c_hid_plat_data *pdata;
+
+	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+
+	/* Start out with reset asserted */
+	pdata->reset_gpio =
+		devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(pdata->reset_gpio))
+		return PTR_ERR(pdata->reset_gpio);
+
+	pdata->timings = device_get_match_data(&client->dev);
+
+	pdata->ihid_pdata.hid_descriptor_address = 0x0001;
+	pdata->ihid_pdata.power_data = pdata;
+	pdata->ihid_pdata.power_up_device = goodix_i2c_hid_power_up_device;
+	pdata->ihid_pdata.power_down_device = goodix_i2c_hid_power_down_device;
+
+	client->dev.platform_data = &pdata->ihid_pdata;
+
+	return i2c_hid_probe(client, id);
+}
+
+static const struct of_device_id goodix_i2c_hid_of_match[] = {
+	{ .compatible = "goodix,gt7375p", .data = &goodix_gt7375p_timing_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, goodix_i2c_hid_of_match);
+
+static const struct dev_pm_ops goodix_i2c_hid_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_suspend, i2c_hid_resume)
+};
+
+static struct i2c_driver goodix_i2c_hid_ts_driver = {
+	.driver = {
+		.name	= "goodix-i2c-hid",
+		.pm	= &goodix_i2c_hid_pm,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = of_match_ptr(goodix_i2c_hid_of_match),
+	},
+	.probe		= goodix_i2c_hid_ts_probe,
+	.remove		= i2c_hid_remove,
+	.shutdown	= i2c_hid_shutdown,
+};
+module_i2c_driver(goodix_i2c_hid_ts_driver);
+
+MODULE_AUTHOR("Douglas Anderson <dianders@chromium.org>");
+MODULE_DESCRIPTION("Goodix i2c-hid touchscreen driver");
+MODULE_LICENSE("GPL v2");
-- 
2.29.1.341.ge80a0c044ae-goog

