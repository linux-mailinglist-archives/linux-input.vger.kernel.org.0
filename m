Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8269A41E8
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2019 05:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbfHaDKk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 23:10:40 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40981 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728334AbfHaDKj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 23:10:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id x15so4439917pgg.8
        for <linux-input@vger.kernel.org>; Fri, 30 Aug 2019 20:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=typeblog-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SXbglKvD0SQmCRxcZtB9WBlJczTPMt6e3pZqM3DgZ18=;
        b=KlKjRfvad7u6uFblyFqzf8FnNcX/HdKZa8Ou7elxmC+GPWRiGv+M/RH//EOe2nn4WN
         kTz+vJODFike6WQUKh1X9zklhP/gQSg7k7yme0uYvo3xoTNXSWWdukoFtziz0ugRRCJk
         t48o7jdirGq7ZMKPb/rUguEBC2sL/3AOcRGxLv3vrocVmgly3k6DzImNxELKh3fZpHA8
         ShSM0+CW3qBBi8sQZ4RUv7/ZQVA0Tra/QbupG06R2cMpu3WfNpJjwG489pxusCqsYlZp
         HPW9iZpwXScQT0SuB1dKoi7Rqi2Kk9KpVOfTEkhsSU0RX2Rwhj+cUdkFV9fH7Xi1PWmn
         ZTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SXbglKvD0SQmCRxcZtB9WBlJczTPMt6e3pZqM3DgZ18=;
        b=YniW9NPjthk784HpQGj3+O6dvyLomh6oKJeOR+Fj2TI5bwHLdgI3GkjkH7/8j/h8Xc
         0P+N66NMnSfJ2GxPRxDVzEdj3LDIxN3KL4rQsGLfl5r8qMGoEGP9OnlyCqu29zJ1NY9o
         CpcXqlZDwlyBTgfY0ErFc7oC9hZi98gKmQV7bxey5bVq14zZLo3gY2EM9VJGwSGWEjVW
         5OgWmpTqPuKj/0R/pvKDwADkPXpasNGyTYJs9L81PywRoREtDtutKsdcS4YofVuUHSGs
         KY4uvEMB48iXYm9YU1EQUoIj/7AJogh6VFWhq5i7j5J4Ne/aVsFkDrK9I+BKoPfxBEWs
         LMaw==
X-Gm-Message-State: APjAAAUlMvKDIgnZTRX8YFvWK21B2rMA3DQtPe6F0KmLz4u9ccvh5wP+
        UcvUMNoRCm6bXP5dn/xSRyLARQ==
X-Google-Smtp-Source: APXvYqy3AvEy6GfXGMsBVelFOUgqliOk3kGp0ODR2dCYzbwoReny6L9IgY3VfEzMVZ4Htgn0gs/zcw==
X-Received: by 2002:a17:90a:a00b:: with SMTP id q11mr1783420pjp.91.1567221039116;
        Fri, 30 Aug 2019 20:10:39 -0700 (PDT)
Received: from peter-pc.home ([91.207.174.229])
        by smtp.gmail.com with ESMTPSA id 185sm10961454pff.54.2019.08.30.20.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 20:10:38 -0700 (PDT)
From:   Peter Cai <peter@typeblog.net>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Peter Cai <peter@typeblog.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2 2/2] touchscreen: goodix: define GPIO mapping for GPD P2 Max
Date:   Sat, 31 Aug 2019 11:09:15 +0800
Message-Id: <20190831030916.13172-2-peter@typeblog.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190831030916.13172-1-peter@typeblog.net>
References: <20190831030916.13172-1-peter@typeblog.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The firmware of GPD P2 Max could not handle panel resets although code
is present in DSDT. The kernel needs to take on this job instead, but
the DSDT does not provide _DSD, rendering kernel helpless when trying to
find the respective GPIO pins.

Fortunately, this time GPD has proper DMI vendor / product strings that
we could match against. We simply apply an acpi_gpio_mapping table when
GPD P2 Max is matched.

Additionally, the DSDT definition of the irq pin specifies a wrong
polarity. The new quirk introduced in the previous patch
(ACPI_GPIO_QUIRK_OVERRIDE_POLARITY) is applied to correct this.

Signed-off-by: Peter Cai <peter@typeblog.net>
---

v2: removed '#ifdef CONFIG_ACPI' as per suggestion. The #ifdef guards
for CONFIG_DMI is kept for consistency with the other dmi_system_id
definition in the same file.
---
 drivers/input/touchscreen/goodix.c | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 5178ea8b5f30..df476f7dcd95 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -144,6 +144,31 @@ static const struct dmi_system_id rotated_screen[] = {
 	{}
 };
 
+static const struct acpi_gpio_params irq_gpios_default = { 0, 0, false };
+static const struct acpi_gpio_params reset_gpios_default = { 1, 0, false };
+static const struct acpi_gpio_mapping gpio_mapping_force_irq_active_high[] = {
+	{ "irq-gpios", &irq_gpios_default, 1, ACPI_GPIO_QUIRK_OVERRIDE_POLARITY },
+	{ "reset-gpios", &reset_gpios_default, 1 },
+	{}
+};
+
+/*
+ * Devices that need acpi_gpio_mapping to function correctly
+ */
+static const struct dmi_system_id need_gpio_mapping[] = {
+#if defined(CONFIG_DMI) && defined(CONFIG_X86)
+	{
+		.ident = "GPD P2 Max",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "P2 MAX")
+		},
+		.driver_data = &gpio_mapping_force_irq_active_high
+	},
+#endif
+	{}
+};
+
 /**
  * goodix_i2c_read - read data from a register of the i2c slave device.
  *
@@ -795,6 +820,12 @@ static int goodix_ts_probe(struct i2c_client *client,
 {
 	struct goodix_ts_data *ts;
 	int error;
+	struct dmi_system_id *dmi_match;
+
+	dmi_match = dmi_first_match(need_gpio_mapping);
+	if (dmi_match)
+		devm_acpi_dev_add_driver_gpios(&client->dev,
+					       dmi_match->driver_data);
 
 	dev_dbg(&client->dev, "I2C Address: 0x%02x\n", client->addr);
 
-- 
2.23.0

