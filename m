Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 019DAA41E1
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2019 05:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfHaDKd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 23:10:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38754 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfHaDKc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 23:10:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id e11so4444057pga.5
        for <linux-input@vger.kernel.org>; Fri, 30 Aug 2019 20:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=typeblog-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xPp/KNeXkBz5eBYg4mT+UA0qSZaP/9dyi5AxdOhW8oY=;
        b=FxDkvpiLmDCdVySmdKZFxU+2EWG20fKrRnf810YGsm3sKyNqJj1MWnVW0tk2eCnr3i
         GLP+gnBwlz7OLbQitK8znNiv1RsFw6mxfxKzg/HaE4ObLZZ4iQZ8EBIAu2fKDwc6ZNy4
         Fjoa89AzJ9MtWSGUjfmL4LuEyg/dkT/67EkioOiqmp2oWovIKYae/Athutb2V3Sz9GBJ
         8v+Wy05IzpzJG9ctYb3A3G2xy4zUWzrynpWZx4O7enZAlazh7RTyiKqfRd7tOvHpkl3m
         Zyt403oqlfbqEw3cJfLUGC7TjLFzICr1l2cy6Jr/7q4bJWHpJIQCq04Y+nthKCJqfpn8
         jMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xPp/KNeXkBz5eBYg4mT+UA0qSZaP/9dyi5AxdOhW8oY=;
        b=mkSON0FwVvMGQGWNDhuE7W6pyci3DkQk3j6s9eSIi48DH6Xene3nyZqe9NzmomEPXo
         7VnRnSDlnlSjGTEkob/KBKdPRNTdXubHsQZ0sLOP0TOy/gyClDrppISpAsoNN0kgohM2
         9cqozeS4pDvhcmwByRf0XD8Nwu42UDZQTYYagI13aw4tWOJz/gsmYm4l8nIENbExLIUx
         ifq5yOU9tfW2YAlgfXP8Kw5C5UXbM+Pim5E/wINYDEDQO9KOLY71MyfXvZYYvIMhaXKy
         Hsoe5d7zwZDTWjhZOtJbp22o0Za8R9i8XrebCMKptzubslWm36Qm0c4fudENM/OlWgG2
         9LQw==
X-Gm-Message-State: APjAAAUPOdtLOeWV8d6hcZQEqzzMD1j1u42CkT9I4bqWT9r/91rRtgb+
        6Q1vBeZXGsykoIrV1/E3BM7+2f8Gn2pNdA==
X-Google-Smtp-Source: APXvYqyleC9XvInNiTuUuZU4vpeR5UtTD2SFLPqm9Q3cOcEE/uZaNhwkLgxs2UsAggMgWosJ1+NyAQ==
X-Received: by 2002:a65:6406:: with SMTP id a6mr15168119pgv.393.1567221031768;
        Fri, 30 Aug 2019 20:10:31 -0700 (PDT)
Received: from peter-pc.home ([91.207.174.229])
        by smtp.gmail.com with ESMTPSA id 185sm10961454pff.54.2019.08.30.20.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 20:10:30 -0700 (PDT)
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
Subject: [PATCH v2 1/2] gpio: acpi: add quirk to override GpioInt polarity
Date:   Sat, 31 Aug 2019 11:09:14 +0800
Message-Id: <20190831030916.13172-1-peter@typeblog.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On GPD P2 Max, the firmware could not reset the touch panel correctly.
The kernel needs to take on the job instead, but the GpioInt definition
in DSDT specifies ActiveHigh while the GPIO pin should actually be
ActiveLow.

We need to override the polarity defined by DSDT. The GPIO driver
already allows defining polarity in acpi_gpio_params, but the option is
not applied to GpioInt.

This patch adds a new quirk that enables the polarity specified in
acpi_gpio_params to also be applied to GpioInt.

Signed-off-by: Peter Cai <peter@typeblog.net>
---

v2: rebased to gpio/for-next, moved quirk out of the gpioint
conditional.
---
 drivers/gpio/gpiolib-acpi.c   | 9 +++++++++
 include/linux/gpio/consumer.h | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index fdee8afa5339..ab16ea61a8fa 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -603,6 +603,15 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio);
 			lookup->info.polarity = lookup->active_low;
 		}
+
+		/*
+		 * Override the polarity specified by GpioInt if
+		 * ACPI_GPIO_QUIRK_OVERRIDE_POLARITY is set.
+		 */
+		if (lookup->info.quirks & ACPI_GPIO_QUIRK_OVERRIDE_POLARITY) {
+			dev_warn(&lookup->info.adev->dev, FW_BUG "Incorrect polarity specified by GpioInt, overriding.\n");
+			lookup->info.polarity = lookup->active_low;
+		}
 	}
 
 	return 1;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index b70af921c614..7e9f24ebb085 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -622,6 +622,12 @@ struct acpi_gpio_mapping {
  * get GpioIo type explicitly, this quirk may be used.
  */
 #define ACPI_GPIO_QUIRK_ONLY_GPIOIO		BIT(1)
+/*
+ * Use the GPIO polarity (ActiveHigh / ActiveLow) from acpi_gpio_params
+ * for GpioInt as well. The default behavior is to use the one specified
+ * by GpioInt, which can be incorrect on some devices.
+ */
+#define ACPI_GPIO_QUIRK_OVERRIDE_POLARITY	BIT(2)
 
 	unsigned int quirks;
 };
-- 
2.23.0

