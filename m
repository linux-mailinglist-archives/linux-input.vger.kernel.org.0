Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0EF2A67AB
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 16:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgKDPak (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 10:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730001AbgKDPaj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 10:30:39 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2141BC0613D3
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 07:30:39 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id l2so27721767lfk.0
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 07:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YNFDsq3jdFeZpaeOwpSCxm4JgaISSNLS4vXfstt0P40=;
        b=bXlLO0NXI0YW5FyhJt/6D0zer1CIrqMjMu1qSTvBRQ/uDJ+2lMUgQsA4BFHEhkOO2W
         RRCIovq5cXE3g5BqvsSrpI9CUNFCUvHYNohtZkxO25RV9OkbY9Nw6NKo6bR6lWUDD5c/
         VLiolvagyMsZtO2/EjBgGw0yXGONzErKjmS7F4mHPDUDdEBmK12oNWiVaCc5mTu+OCx1
         Q7tc2DEsX8GKOQbdrr7sCCwcWs4ES0I+OMBkxxG3krZD8RIFrCMW7RUI57yS8gk4dAPw
         tMPwnjg2sphdarBSo29xSHENM8tBeldgnIpre+heXEnOpf32lGe+ILByA+yoHtnRPDA5
         nVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YNFDsq3jdFeZpaeOwpSCxm4JgaISSNLS4vXfstt0P40=;
        b=HtVGlvaH5LKEOMTKs9M7EsOe+2zmzdrYHc5tQSH4w2mFM7N1lLvwyk5i84JUTjIXsc
         Bkr1LPXWsSePGy9slj9eb33i1MX4Tgtgsd0oJ8EZjJYhXGrIkCHJENi9Zc4lsbeB6Kb/
         LKwqGL2j3fXC/R5qji2Ko0KsIqotvPs4fHKFlkWoL5u9ocEIBbDD7dJ9ENVmPp9M6nbg
         Kq9YPsCEzZRAvzXCs9eNNbdEUc3S/7Y/d7wmnns5IlPfo+kxRKUXOVc9MhX9a0xykOGe
         CGB4L7WhrPFWhLTrjPoZzNso+xlYQ9V1KLzKPG1C3dpD+g6k9MVfUb29AxRNNe61wiUW
         maqA==
X-Gm-Message-State: AOAM532lWHvwxGDBuegacA8/SSqPXMH1178R2XdNo+UqbUPOzvyt3d/C
        zqzeMtVyrITOOgnFUoM3mDvdUA==
X-Google-Smtp-Source: ABdhPJxXz5qmnMaPo34MezQWw7phiLpCq1thIFEfq4Xw4KAApl5oyPHGgPVnj4QleHnf3fI/M9Ry/A==
X-Received: by 2002:a05:6512:47b:: with SMTP id x27mr10120260lfd.157.1604503837512;
        Wed, 04 Nov 2020 07:30:37 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c131sm440453lfg.110.2020.11.04.07.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:30:36 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/3 v2] Input: atmel_mxt_ts - Fix up inverted RESET handler
Date:   Wed,  4 Nov 2020 16:30:30 +0100
Message-Id: <20201104153032.1387747-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver uses GPIO descriptors to drive the touchscreen
RESET line. In the existing device trees this has in
conflict with intution been flagged as GPIO_ACTIVE_HIGH
and the driver then applies the reverse action by
driving the line low (setting to 0) to enter
reset state and driving the line high (setting to 1) to
get out of reset state.

The correct way to handle active low GPIO lines is to
provide the GPIO_ACTIVE_LOW in the device tree (thus
properly describing the hardware) and letting the GPIO
framework invert the assertion (driving high) to a low
level and vice versa.

This is considered a bug since the device trees are
incorrectly mis-specifying the line as active high.

Fix the driver and all device trees specifying a reset
line.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- New patch fixing this confusion before adding the
  new YAML bindings.
- CC some misc maintainers and mailing lists that should
  be aware that we do this change.
---
 arch/arm/boot/dts/imx53-ppd.dts                 | 2 +-
 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts    | 2 +-
 arch/arm/boot/dts/imx6q-apalis-eval.dts         | 2 +-
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts   | 2 +-
 arch/arm/boot/dts/imx6q-apalis-ixora.dts        | 2 +-
 arch/arm/boot/dts/imx7-colibri-aster.dtsi       | 2 +-
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi     | 2 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 2 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi            | 2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c        | 6 ++++--
 11 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-ppd.dts
index f7dcdf96e5c0..8f4a63ea912e 100644
--- a/arch/arm/boot/dts/imx53-ppd.dts
+++ b/arch/arm/boot/dts/imx53-ppd.dts
@@ -589,7 +589,7 @@ &i2c2 {
 
 	touchscreen@4b {
 		compatible = "atmel,maxtouch";
-		reset-gpio = <&gpio5 19 GPIO_ACTIVE_HIGH>;
+		reset-gpio = <&gpio5 19 GPIO_ACTIVE_LOW>;
 		reg = <0x4b>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
index 65359aece950..7da74e6f46d9 100644
--- a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
@@ -143,7 +143,7 @@ touchscreen@4a {
 		reg = <0x4a>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;		/* SODIMM 28 */
-		reset-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;	/* SODIMM 30 */
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;	/* SODIMM 30 */
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/imx6q-apalis-eval.dts b/arch/arm/boot/dts/imx6q-apalis-eval.dts
index fab83abb6466..a0683b4aeca1 100644
--- a/arch/arm/boot/dts/imx6q-apalis-eval.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-eval.dts
@@ -140,7 +140,7 @@ touchscreen@4a {
 		reg = <0x4a>;
 		interrupt-parent = <&gpio6>;
 		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* SODIMM 13 */
+		reset-gpios = <&gpio6 9 GPIO_ACTIVE_LOW>; /* SODIMM 13 */
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
index 1614b1ae501d..86e84781cf5d 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
@@ -145,7 +145,7 @@ touchscreen@4a {
 		reg = <0x4a>;
 		interrupt-parent = <&gpio6>;
 		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* SODIMM 13 */
+		reset-gpios = <&gpio6 9 GPIO_ACTIVE_LOW>; /* SODIMM 13 */
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
index fa9f98dd15ac..62e72773e53b 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
@@ -144,7 +144,7 @@ touchscreen@4a {
 		reg = <0x4a>;
 		interrupt-parent = <&gpio6>;
 		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* SODIMM 13 */
+		reset-gpios = <&gpio6 9 GPIO_ACTIVE_LOW>; /* SODIMM 13 */
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/imx7-colibri-aster.dtsi b/arch/arm/boot/dts/imx7-colibri-aster.dtsi
index 9fa701bec2ec..139188eb9f40 100644
--- a/arch/arm/boot/dts/imx7-colibri-aster.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri-aster.dtsi
@@ -99,7 +99,7 @@ touchscreen@4a {
 		reg = <0x4a>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;	/* SODIMM 107 */
-		reset-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;	/* SODIMM 106 */
+		reset-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;	/* SODIMM 106 */
 	};
 
 	/* M41T0M6 real time clock on carrier board */
diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
index 97601375f264..3caf450735d7 100644
--- a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
@@ -124,7 +124,7 @@ touchscreen@4a {
 		reg = <0x4a>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;		/* SODIMM 28 */
-		reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;	/* SODIMM 30 */
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;	/* SODIMM 30 */
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index d5ded4f794df..5f8f77cfbe59 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -430,7 +430,7 @@ touchscreen@4a {
 		pinctrl-names = "default";
 		pinctrl-0 = <&touchscreen_pins>;
 
-		reset-gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>; /* gpio173 */
+		reset-gpios = <&gpio6 13 GPIO_ACTIVE_LOW>; /* gpio173 */
 
 		/* gpio_183 with sys_nirq2 pad as wakeup */
 		interrupts-extended = <&gpio6 23 IRQ_TYPE_LEVEL_LOW>,
diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5pv210-aries.dtsi
index bd4450dbdcb6..4da33d0f2748 100644
--- a/arch/arm/boot/dts/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
@@ -632,7 +632,7 @@ touchscreen@4a {
 		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&ts_irq>;
-		reset-gpios = <&gpj1 3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpj1 3 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index a0b829738e8f..10794a870776 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -446,7 +446,7 @@ touchscreen@4c {
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(V, 6) IRQ_TYPE_LEVEL_LOW>;
 
-			reset-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
 
 			avdd-supply = <&vdd_3v3_sys>;
 			vdd-supply  = <&vdd_3v3_sys>;
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 98f17fa3a892..ef7915400c9f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3134,8 +3134,9 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (error)
 		return error;
 
+	/* Request the RESET line as asserted so we go into reset */
 	data->reset_gpio = devm_gpiod_get_optional(&client->dev,
-						   "reset", GPIOD_OUT_LOW);
+						   "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(data->reset_gpio)) {
 		error = PTR_ERR(data->reset_gpio);
 		dev_err(&client->dev, "Failed to get reset gpio: %d\n", error);
@@ -3153,8 +3154,9 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	disable_irq(client->irq);
 
 	if (data->reset_gpio) {
+		/* Wait a while and then de-assert the RESET GPIO line */
 		msleep(MXT_RESET_GPIO_TIME);
-		gpiod_set_value(data->reset_gpio, 1);
+		gpiod_set_value(data->reset_gpio, 0);
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
-- 
2.26.2

