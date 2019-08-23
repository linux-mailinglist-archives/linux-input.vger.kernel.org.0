Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0FAB9A843
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 09:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389610AbfHWHK2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 03:10:28 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34087 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbfHWHK2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 03:10:28 -0400
Received: by mail-lf1-f67.google.com with SMTP id b29so6393201lfq.1
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+qU/VHmuE9+FZeGhMZTUDAZVwp0rcf1mKQo/KWfPxLA=;
        b=c5OYD9xRcMwu9/ZQZ/HUsZELbjvvGpC1Ng9p5IygoPsfBd1n3NT/Wdm7PYN6oI6eaV
         xvQUkjXdxhvCXi90mothyJm52nkrvbR/rPepOCfN+ae5qKT+y8qEhlclwgoHpM5Dj7KB
         /72RG5dxARac9ry0l0yS4OpeQNCivZfP8KCjIBzTb0Km6sIXLxaUO6DB2/1j86Ya9/uA
         +x0XdBQ5H7W5vVkUD/IJqbeEqeco2SPaTRd+FWGAG874ArSJycDdcbL+N/LH0l+KrLj1
         OR3vKmQ57hoJjYIic3kscsqxHACmDySO+o+xnsQhQoHNUupAdb0Org8cNOownpPvL7CV
         IT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+qU/VHmuE9+FZeGhMZTUDAZVwp0rcf1mKQo/KWfPxLA=;
        b=ZrRylgmy+IZZZih06YUeNGJg2DuHTfGUju0yxMKSir1asAbCGPsABOePpnsplg+A2w
         4CwsGlmUhcJ6xSqhKc+M0I5TuEVsr2WrfXzx+9aedE6wJ4Sw1xgl+XOL95rHam2JEKS7
         NRZ70k2eWj07dVCfWjAQmP0YLG9nqe4ZfY6eMXp/Zc3yGa3e/tQNy1cxSGMzC4K3dZTi
         yZeIas3yvHHo0o3g7Ef1okkkOaTj64tK+1O0sUAu8eCZ6NQsDCCqzaiBzRZ4ot4OoeO9
         dkwVcWCkI40gK+mXxYTN2Eax582F09c7tiR/z1husyVeq4EfaHvKF10lec+wRQOr4w2F
         hhpA==
X-Gm-Message-State: APjAAAWU5yR/NP1mnmIFh5LAVCiS4u2VYEMUZX+q/QqZ9LldCTS7/6X/
        bE5TVprso+NI0QVRVeCclP4Z3Q==
X-Google-Smtp-Source: APXvYqwT/E8A7FD8cjk4aMI47BzOIhL3bksrk0C7JFlQ+gVhCjb/IUuguuiB6vH2DtMJ3fIKrQ+PnQ==
X-Received: by 2002:ac2:4289:: with SMTP id m9mr1938713lfh.49.1566544225732;
        Fri, 23 Aug 2019 00:10:25 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id f28sm210055lfp.28.2019.08.23.00.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 00:10:24 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Denis Carikli <denis@eukrea.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2] Input: tsc2007 - use GPIO descriptor
Date:   Fri, 23 Aug 2019 09:10:21 +0200
Message-Id: <20190823071021.5598-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This switches the TSC2007 to use a GPIO descriptor to read
the pendown GPIO line.

As this will make the gpiolib start to respect polarity
inversion flags on the GPIO lines, drop the inversion when
reading the line with gpio_get_value(), fix two offenders
in the i.MX device trees, and also emphasize the importance
of marking the polarity right in the device tree bindings.

Cc: Denis Carikli <denis@eukrea.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drop inversion on the GPIO descriptor value, rely on the
  gpiolib to handle polarity inversion.
- Comb through device trees, identify two offenders, fix
  them as part of the patch for a clean cut.
- Also fix the device tree bindings.
---
 .../bindings/input/touchscreen/tsc2007.txt         |  5 +++--
 arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi       |  3 ++-
 arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi       |  3 ++-
 drivers/input/touchscreen/tsc2007.h                |  4 +++-
 drivers/input/touchscreen/tsc2007_core.c           | 14 +++++++-------
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
index ed00f61b8c08..b08b54d49699 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
@@ -7,7 +7,8 @@ Required properties:
 
 Optional properties:
 - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
-  The penirq pin goes to low when the panel is touched.
+  The penirq pin goes to low when the panel is touched, so make sure to tag
+  the GPIO line with GPIO_ACTIVE_LOW.
   (see GPIO binding[1] for more details).
 - interrupts: (gpio) interrupt to which the chip is connected
   (see interrupt binding[0]).
@@ -31,7 +32,7 @@ Example:
 			reg = <0x49>;
 			interrupt-parent = <&gpio4>;
 			interrupts = <0x0 0x8>;
-			gpios = <&gpio4 0 0>;
+			gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
 			ti,x-plate-ohms = <180>;
 		};
 
diff --git a/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi b/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
index 17bd2a97609a..b8ac60622936 100644
--- a/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
+++ b/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
@@ -3,6 +3,7 @@
  * Copyright 2013 Eukréa Electromatique <denis@eukrea.com>
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include "imx35.dtsi"
 
 / {
@@ -33,7 +34,7 @@
 
 	tsc2007: tsc2007@48 {
 		compatible = "ti,tsc2007";
-		gpios = <&gpio3 2 0>;
+		gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <0x2 0x8>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi b/arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi
index c2a929ba8ceb..016d0bc64bdb 100644
--- a/arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi
+++ b/arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi
@@ -3,6 +3,7 @@
  * Copyright 2013 Eukréa Electromatique <denis@eukrea.com>
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include "imx51.dtsi"
 
 / {
@@ -33,7 +34,7 @@
 
 	tsc2007: tsc2007@49 {
 		compatible = "ti,tsc2007";
-		gpios = <&gpio4 0 1>;
+		gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <0x0 0x8>;
 		pinctrl-names = "default";
diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
index 91c60bf6dcaf..0306c38b56c7 100644
--- a/drivers/input/touchscreen/tsc2007.h
+++ b/drivers/input/touchscreen/tsc2007.h
@@ -49,6 +49,8 @@
 #define READ_X		(ADC_ON_12BIT | TSC2007_MEASURE_X)
 #define PWRDOWN		(TSC2007_12BIT | TSC2007_POWER_OFF_IRQ_EN)
 
+struct gpio_desc;
+
 struct ts_event {
 	u16	x;
 	u16	y;
@@ -69,7 +71,7 @@ struct tsc2007 {
 	int			fuzzy;
 	int			fuzzz;
 
-	unsigned int		gpio;
+	struct gpio_desc	*gpiod;
 	int			irq;
 
 	wait_queue_head_t	wait;
diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 3b80abfc1eca..0eadd6d86fa0 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -23,7 +23,7 @@
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_data/tsc2007.h>
 #include "tsc2007.h"
 
@@ -226,7 +226,7 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct tsc2007 *ts = i2c_get_clientdata(client);
 
-	return !gpio_get_value(ts->gpio);
+	return gpiod_get_value(ts->gpiod);
 }
 
 static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
@@ -266,13 +266,13 @@ static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
 		return -EINVAL;
 	}
 
-	ts->gpio = of_get_gpio(np, 0);
-	if (gpio_is_valid(ts->gpio))
+	ts->gpiod = devm_gpiod_get_optional(&client->dev, NULL, GPIOD_IN);
+	if (IS_ERR(ts->gpiod))
+		return PTR_ERR(ts->gpiod);
+	if (ts->gpiod)
 		ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
 	else
-		dev_warn(&client->dev,
-			 "GPIO not specified in DT (of_get_gpio returned %d)\n",
-			 ts->gpio);
+		dev_warn(&client->dev, "GPIO not specified in DT\n");
 
 	return 0;
 }
-- 
2.21.0

