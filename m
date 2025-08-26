Return-Path: <linux-input+bounces-14320-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58224B36620
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 15:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A210E8A4EB3
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 13:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A55B34DCE1;
	Tue, 26 Aug 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOfzz6z4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371534DCE0;
	Tue, 26 Aug 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216004; cv=none; b=IVJgknmBG5t+M+ng6omGMeGofiqKiAW5Jb53n9JtWy9BdKYoIyQkJXLyrF/P6r3p60aJ96oJ5LvMaisZgWo/XSZFird3K+EPzgjc4746A6i8DRe9vgdK0jnBE28GnYnye/wNMOg6ee5sjZNdxs0UZn4ySH0xdo/r4kmsTGyBG20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216004; c=relaxed/simple;
	bh=m9GeSia0h/hVXBSTHS2s4MKOCJv9PQTagZv5avUTLh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mt0DdBdHkjAERyKa8/ujA5P7yJOVkQSGnETa1pA76wDFaIcWvTxhW91DhbQIsYYSyNGxytX2z7ST8uhM3GA8EDeJRpEP+TdP0skkPxV4QMbV4sSZJh/8Dw40Qnigc6T4sIDgJzorBPW9gYMsZ0dTXGQdMrB9OQhX7J4eeAMUKR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOfzz6z4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CF4C116D0;
	Tue, 26 Aug 2025 13:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756216004;
	bh=m9GeSia0h/hVXBSTHS2s4MKOCJv9PQTagZv5avUTLh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOfzz6z4H4S4mGd1d4e6/27Ch7z0x17SxSWTwJhMo7jSNl8P6HzKy/h/0xb+2bjFw
	 qoVBf5jN418J6ALU4CWgovU+fp2Q/LIAMous646rMN+1KQNQu9EFi93BKUSI98vFjK
	 yjUD5I96LZOchRTncdX7FBJV7TC+mvYknuqIRg6+5mYwyYpiFCAg/9udY6mp1o+kLk
	 gc7v4P8J30A4b/K1A+6Muxx7cPg2teon1KOrjpWo21R2s078i+lQfY4om3iBOH7VeU
	 VRVrpVjoDcxlQbSHOEVjqJW5U0oACarOHrK2l0f3f7Yxe/uZHMulRrE1hpjYKAWhfa
	 frDwSSHgcsyrw==
From: Michael Walle <mwalle@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: jcormier@criticallink.com,
	Job Sava <jsava@criticallink.com>,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 2/3] mfd: tps6594: add power button functionality
Date: Tue, 26 Aug 2025 15:46:30 +0200
Message-Id: <20250826134631.1499936-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250826134631.1499936-1-mwalle@kernel.org>
References: <20250826134631.1499936-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMIC has a multi-function pin PB/EN/VSENSE. If it is configured as
push-button (PB), add the corresponding device for it.

Co-developed-by: Job Sava <jsava@criticallink.com>
Signed-off-by: Job Sava <jsava@criticallink.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
v2:
 - new patch, these bits were previously part of another patch
 - don't use "ti,power-button" to decide whether to add the power-button
   device, but read the configuration register of the pin, whose default
   value is stored in the OTP memory of the chip
---
 drivers/mfd/tps6594-core.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps6594-core.c b/drivers/mfd/tps6594-core.c
index c16c37e36617..9195c9059489 100644
--- a/drivers/mfd/tps6594-core.c
+++ b/drivers/mfd/tps6594-core.c
@@ -20,6 +20,8 @@
 #include <linux/mfd/tps6594.h>
 
 #define TPS6594_CRC_SYNC_TIMEOUT_MS 150
+#define TPS65224_EN_SEL_PB 1
+#define TPS65224_GPIO3_SEL_PB 3
 
 /* Completion to synchronize CRC feature enabling on all PMICs */
 static DECLARE_COMPLETION(tps6594_crc_comp);
@@ -128,6 +130,12 @@ static const struct resource tps6594_rtc_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_POWER_UP, TPS6594_IRQ_NAME_POWERUP),
 };
 
+static const struct resource tps6594_pwrbutton_resources[] = {
+	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_FALL, TPS65224_IRQ_NAME_PB_FALL),
+	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_RISE, TPS65224_IRQ_NAME_PB_RISE),
+	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_SHORT, TPS65224_IRQ_NAME_PB_SHORT),
+};
+
 static const struct mfd_cell tps6594_common_cells[] = {
 	MFD_CELL_RES("tps6594-regulator", tps6594_regulator_resources),
 	MFD_CELL_RES("tps6594-pinctrl", tps6594_pinctrl_resources),
@@ -318,8 +326,6 @@ static const struct resource tps65224_pfsm_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_REG_UNLOCK, TPS65224_IRQ_NAME_REG_UNLOCK),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_TWARN, TPS65224_IRQ_NAME_TWARN),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_LONG, TPS65224_IRQ_NAME_PB_LONG),
-	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_FALL, TPS65224_IRQ_NAME_PB_FALL),
-	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_RISE, TPS65224_IRQ_NAME_PB_RISE),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_TSD_ORD, TPS65224_IRQ_NAME_TSD_ORD),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_BIST_FAIL, TPS65224_IRQ_NAME_BIST_FAIL),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_REG_CRC_ERR, TPS65224_IRQ_NAME_REG_CRC_ERR),
@@ -347,6 +353,12 @@ static const struct mfd_cell tps65224_common_cells[] = {
 	MFD_CELL_RES("tps6594-regulator", tps65224_regulator_resources),
 };
 
+static const struct mfd_cell tps6594_pwrbutton_cell = {
+	.name = "tps6594-pwrbutton",
+	.resources = tps6594_pwrbutton_resources,
+	.num_resources = ARRAY_SIZE(tps6594_pwrbutton_resources),
+};
+
 static const struct regmap_irq tps65224_irqs[] = {
 	/* INT_BUCK register */
 	REGMAP_IRQ_REG(TPS65224_IRQ_BUCK1_UVOV, 0, TPS65224_BIT_BUCK1_UVOV_INT),
@@ -681,6 +693,7 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 	struct device *dev = tps->dev;
 	int ret;
 	struct regmap_irq_chip *irq_chip;
+	unsigned int pwr_on, gpio3_cfg;
 	const struct mfd_cell *cells;
 	int n_cells;
 
@@ -727,6 +740,27 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add common child devices\n");
 
+	/* If either the PB/EN/VSENSE or GPIO3 is configured as PB, register a driver for it */
+	if (tps->chip_id == TPS65224 || tps->chip_id == TPS652G1) {
+		ret = regmap_read(tps->regmap, TPS6594_REG_NPWRON_CONF, &pwr_on);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to read PB/EN/VSENSE config\n");
+
+		ret = regmap_read(tps->regmap, TPS6594_REG_GPIOX_CONF(2), &gpio3_cfg);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to read GPIO3 config\n");
+
+		if (FIELD_GET(TPS65224_MASK_EN_PB_VSENSE_CONFIG, pwr_on) == TPS65224_EN_SEL_PB ||
+		    FIELD_GET(TPS65224_MASK_GPIO_SEL, gpio3_cfg) == TPS65224_GPIO3_SEL_PB) {
+			ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+						   &tps6594_pwrbutton_cell, 1, NULL, 0,
+						   regmap_irq_get_domain(tps->irq_data));
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Failed to add power button device.\n");
+		}
+	}
+
 	/* No RTC for LP8764, TPS65224 and TPS652G1 */
 	if (tps->chip_id != LP8764 && tps->chip_id != TPS65224 && tps->chip_id != TPS652G1) {
 		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, tps6594_rtc_cells,
-- 
2.39.5


