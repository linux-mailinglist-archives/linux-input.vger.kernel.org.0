Return-Path: <linux-input+bounces-12480-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6459AABE1F6
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 19:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 030B44C3711
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 17:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D230928001D;
	Tue, 20 May 2025 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="HetsOMGz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DF027FD74
	for <linux-input@vger.kernel.org>; Tue, 20 May 2025 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763026; cv=none; b=qOE+9ztKw0rp8GuVNF1XBl5SjcEIgc9N+UT4bd5mTbQVZbhHde2OQslz0eMts0ThZATdqgQHAHCchf24Bms0KTyPi+6t/LKTc1Yjd2V5GFY+WmEPtb0kKtus47Q5GEEXYtJC/IbJ/Jlj4fYQKYeCjRzV0sqs3UcXldGQbo2D88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763026; c=relaxed/simple;
	bh=wNhKm4W5M+JmUYNjTT+7alHV0L0pr8QKUE4muBLtvjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hM3964OW/AEPdAlKjD7cg2wzSnxmoAX4nVCo9yWC8L/ZQyW5iV6SOp1sNGjRI4HnPnteb38xiujbt9zgMamBQBm+mDZCgZmDsz2QZrxJ0BsxSqrO+35+dSIsLKwC9mAuWixQD/1MQTPJjQkYjAqS/YOD8vC1H7IcxogdYBzk/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=HetsOMGz; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4947635914aso61695141cf.3
        for <linux-input@vger.kernel.org>; Tue, 20 May 2025 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1747763024; x=1748367824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwZKLa7Cn8pt42MTBPU0jrlClxmn3KKi3w3zHRh0YFI=;
        b=HetsOMGzbiamxWgsNWZDKl+6bonelM2+kDDa90w8cum3o+Q5bG6iyBGzdohSRMupo4
         QDYinpQeHCrOcsk50oDhw7TZ28KibUNysZRWNucn0EL6PdGDaNOZIw/fsEIZbRWP+0o1
         ZQBpNeJ1qnHge4AekYgNBa/DLh761Cg2Itt1OHj1rRLveDtZefxDocr/wWsWXoWd1Fd/
         yC/koVf3s58cuszi63vGtBmQDC8O9gHf5zxJJ2yzRzRgXp1nivGk1bPYFuKI3Srve3fK
         Gcm4JvHsTS6grqhmd/nhqOfUAkhs1lNbR19dbp6VM3CGkyYyUtJE9nwKni2zi42XDG0/
         Ifzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763024; x=1748367824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwZKLa7Cn8pt42MTBPU0jrlClxmn3KKi3w3zHRh0YFI=;
        b=uVNWx0Zjhk5YIYNXZYzmoNGnydk/LUgKM+adIj/+sbGms/QfPS3ymfHTXYRbcg5tIo
         UEtvj1NxPG5pMLjxzOyYTG1Me/YQ9BXmcZ9FZi1DQbDelDFJBp9iaA1pHGfKGgRLZ37X
         mMsTpEtA65vAwNv7BDHCLAA0AG1neQyzxL74zBfq5Cywsr9ugIpGqB0ggeSnIklrC/A8
         Ndg9fL455BUbHTGvZWFkabS+LRRatWSkfx3vWAnta582krcm54PBjo9MbYbtnIbcSeQc
         o2OF4BSrjbvYMn2zglX0KXmT1Tyiqm7skvCTLGYLLGLE6XxbPu1w4JGECXOpiixl5B5c
         iIPg==
X-Forwarded-Encrypted: i=1; AJvYcCUdKQ16iRctWqfL+Uf49cgdMMAixo67N9FZ827LTn0ED9pz+q4VqvZVIbtSd6PUHfqkdyln2TgGeEEy0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzITzPc74p2OMitdON+8Fkx4wp+LWJBKUj3tVENN5Ad1fbsEaYE
	21zO4tMAfD08Ee3iPflGijUsFsv80xFBkfGcd/JA46iu3thP4+pnu6yi2k2XqQ5Icg==
X-Gm-Gg: ASbGncsOPbKXlJfJojBDLQlWM2L7xOHQtjXzjRtgpGahyUEW6/JzCTMNehSDWQtTbQD
	2x4XlIzGa9wXodjzyGSdQ4ZVXEj9bmnw3o9FqlEScZZ2dK5i+dlPx+nPOU/8+u4Q5SLjBtO2zPD
	DyGno8Zd+Rcp/USdBQZDU1P2X526dYQfAe/JDZ7oShr6AvVv+NPb5pOj0cS5cYVwL7UTu2u1z40
	+FDXAujXb0ACJex5jb0U6eWsSWeow8F3a+P2/0cNH9agtF1e55lC8R+v53YVUEbqblPECVYDTdK
	4pTEBTRGj9lYILyB/ZqNZ36N8gvgWc5+Ns/zaXVMKCDBYLlYZvSEe7aenZoLh66FOG5StfPrLWH
	ECLiQCnSfZooQsXUvvdErJ6YPFA==
X-Google-Smtp-Source: AGHT+IE9Jb12x2zN2FRaCf90f9bD48Wr+Dw2Dwu1oSmR+0h4NtZtNnMj09Ms1/YksM7cwDdb0r5iFg==
X-Received: by 2002:a05:622a:428a:b0:477:5c21:2e1f with SMTP id d75a77b69052e-494ae407744mr332517941cf.34.1747763023667;
        Tue, 20 May 2025 10:43:43 -0700 (PDT)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-494ae528553sm72660101cf.68.2025.05.20.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:43:43 -0700 (PDT)
From: Job Sava <jsava@criticallink.com>
Date: Tue, 20 May 2025 13:43:37 -0400
Subject: [PATCH 2/3] mfd: tps6594-pwrbutton: Add powerbutton functionality
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-linux-stable-tps6594-pwrbutton-v1-2-0cc5c6e0415c@criticallink.com>
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
In-Reply-To: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julien Panis <jpanis@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, jcormier@criticallink.com, 
 Job Sava <jsava@criticallink.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763020; l=8292;
 i=jsava@criticallink.com; s=20250404; h=from:subject:message-id;
 bh=wNhKm4W5M+JmUYNjTT+7alHV0L0pr8QKUE4muBLtvjs=;
 b=pUIuW6TA3O0yo+O59wK4nZAkBUgqKG12vbgIC93zonhkYUIefJoYbWh3AtfEcytnhVyq6slmf
 f0vmZpWZ2FWCO0LBv/J1XehALLGg9/W/1PKX896enfl7VfOj9+MYG5z
X-Developer-Key: i=jsava@criticallink.com; a=ed25519;
 pk=DPPriJ+pziqtCZ0EIomf/hKU23s5T1u4WOQaT8BpQSw=

TPS6594 defines two interrupts for the powerbutton one for push and
one for release.

This driver is very simple in that it maps the push interrupt to a key
input and the release interrupt to a key release.

Signed-off-by: Job Sava <jsava@criticallink.com>
---
 drivers/input/misc/Kconfig             |  10 +++
 drivers/input/misc/Makefile            |   1 +
 drivers/input/misc/tps6594-pwrbutton.c | 126 +++++++++++++++++++++++++++++++++
 drivers/mfd/tps6594-core.c             |  25 ++++++-
 4 files changed, 160 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index f5496ca0c0d2..20776651caf3 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -506,6 +506,16 @@ config INPUT_TPS65219_PWRBUTTON
 	  To compile this driver as a module, choose M here. The module will
 	  be called tps65219-pwrbutton.
 
+config INPUT_TPS6594_PWRBUTTON
+	tristate "TPS6594 Power button driver"
+	depends on MFD_TPS6594
+	help
+	  Say Y here if you want to enable power button reporting for
+	  TPS6594 Power Management IC devices.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called tps6594-pwrbutton.
+
 config INPUT_AXP20X_PEK
 	tristate "X-Powers AXP20X power button driver"
 	depends on MFD_AXP20X
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 6d91804d0a6f..a065b8889ccd 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_INPUT_SPARCSPKR)		+= sparcspkr.o
 obj-$(CONFIG_INPUT_STPMIC1_ONKEY)  	+= stpmic1_onkey.o
 obj-$(CONFIG_INPUT_TPS65218_PWRBUTTON)	+= tps65218-pwrbutton.o
 obj-$(CONFIG_INPUT_TPS65219_PWRBUTTON)	+= tps65219-pwrbutton.o
+obj-$(CONFIG_INPUT_TPS6594_PWRBUTTON)	+= tps6594-pwrbutton.o
 obj-$(CONFIG_INPUT_TWL4030_PWRBUTTON)	+= twl4030-pwrbutton.o
 obj-$(CONFIG_INPUT_TWL4030_VIBRA)	+= twl4030-vibra.o
 obj-$(CONFIG_INPUT_TWL6040_VIBRA)	+= twl6040-vibra.o
diff --git a/drivers/input/misc/tps6594-pwrbutton.c b/drivers/input/misc/tps6594-pwrbutton.c
new file mode 100644
index 000000000000..cd039b3866dc
--- /dev/null
+++ b/drivers/input/misc/tps6594-pwrbutton.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * power button driver for TI TPS6594 PMICs
+ *
+ * Copyright (C) 2025 Critical Link LLC - https://www.criticallink.com/
+ */
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tps6594.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+struct tps6594_pwrbutton {
+	struct device *dev;
+	struct input_dev *idev;
+	char phys[32];
+};
+
+static irqreturn_t tps6594_pb_push_irq(int irq, void *_pwr)
+{
+	struct tps6594_pwrbutton *pwr = _pwr;
+
+	input_report_key(pwr->idev, KEY_POWER, 1);
+	pm_wakeup_event(pwr->dev, 0);
+	input_sync(pwr->idev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t tps6594_pb_release_irq(int irq, void *_pwr)
+{
+	struct tps6594_pwrbutton *pwr = _pwr;
+
+	input_report_key(pwr->idev, KEY_POWER, 0);
+	input_sync(pwr->idev);
+
+	return IRQ_HANDLED;
+}
+
+static int tps6594_pb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tps6594_pwrbutton *pwr;
+	struct input_dev *idev;
+	int error;
+	int push_irq;
+	int release_irq;
+
+	pwr = devm_kzalloc(dev, sizeof(*pwr), GFP_KERNEL);
+	if (!pwr)
+		return -ENOMEM;
+
+	idev = devm_input_allocate_device(dev);
+	if (!idev)
+		return -ENOMEM;
+
+	idev->name = pdev->name;
+	snprintf(pwr->phys, sizeof(pwr->phys), "%s/input0",
+		 pdev->name);
+	idev->phys = pwr->phys;
+	idev->id.bustype = BUS_I2C;
+
+	input_set_capability(idev, EV_KEY, KEY_POWER);
+
+	pwr->dev = dev;
+	pwr->idev = idev;
+	device_init_wakeup(dev, true);
+
+	push_irq = platform_get_irq(pdev, 0);
+	if (push_irq < 0)
+		return -EINVAL;
+
+	release_irq = platform_get_irq(pdev, 1);
+	if (release_irq < 0)
+		return -EINVAL;
+
+	error = devm_request_threaded_irq(dev, push_irq, NULL,
+					  tps6594_pb_push_irq,
+					  IRQF_ONESHOT,
+					  pdev->resource[0].name, pwr);
+	if (error) {
+		dev_err(dev, "failed to request push IRQ #%d: %d\n", push_irq,
+			error);
+		return error;
+	}
+
+	error = devm_request_threaded_irq(dev, release_irq, NULL,
+					  tps6594_pb_release_irq,
+					  IRQF_ONESHOT,
+					  pdev->resource[1].name, pwr);
+	if (error) {
+		dev_err(dev, "failed to request release IRQ #%d: %d\n",
+			release_irq, error);
+		return error;
+	}
+
+	error = input_register_device(idev);
+	if (error) {
+		dev_err(dev, "Can't register power button: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id tps6594_pwrbtn_id_table[] = {
+	{ "tps6594-pwrbutton", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, tps6594_pwrbtn_id_table);
+
+static struct platform_driver tps6594_pb_driver = {
+	.probe = tps6594_pb_probe,
+	.driver = {
+		.name = "tps6594_pwrbutton",
+	},
+	.id_table = tps6594_pwrbtn_id_table,
+};
+module_platform_driver(tps6594_pb_driver);
+
+MODULE_DESCRIPTION("TPS6594 Power Button");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/tps6594-core.c b/drivers/mfd/tps6594-core.c
index a7223e873cd1..1b0b3d1bf6c4 100644
--- a/drivers/mfd/tps6594-core.c
+++ b/drivers/mfd/tps6594-core.c
@@ -123,6 +123,13 @@ static const struct resource tps6594_rtc_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_POWER_UP, TPS6594_IRQ_NAME_POWERUP),
 };
 
+
+static const struct resource tps6594_pwrbutton_resources[] = {
+	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_FALL, TPS65224_IRQ_NAME_PB_FALL),
+	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_RISE, TPS65224_IRQ_NAME_PB_RISE),
+	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_SHORT, TPS65224_IRQ_NAME_PB_SHORT),
+};
+
 static const struct mfd_cell tps6594_common_cells[] = {
 	MFD_CELL_RES("tps6594-regulator", tps6594_regulator_resources),
 	MFD_CELL_RES("tps6594-pinctrl", tps6594_pinctrl_resources),
@@ -313,8 +320,6 @@ static const struct resource tps65224_pfsm_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_REG_UNLOCK, TPS65224_IRQ_NAME_REG_UNLOCK),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_TWARN, TPS65224_IRQ_NAME_TWARN),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_LONG, TPS65224_IRQ_NAME_PB_LONG),
-	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_FALL, TPS65224_IRQ_NAME_PB_FALL),
-	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_PB_RISE, TPS65224_IRQ_NAME_PB_RISE),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_TSD_ORD, TPS65224_IRQ_NAME_TSD_ORD),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_BIST_FAIL, TPS65224_IRQ_NAME_BIST_FAIL),
 	DEFINE_RES_IRQ_NAMED(TPS65224_IRQ_REG_CRC_ERR, TPS65224_IRQ_NAME_REG_CRC_ERR),
@@ -342,6 +347,12 @@ static const struct mfd_cell tps65224_common_cells[] = {
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
@@ -611,6 +622,7 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 	struct regmap_irq_chip *irq_chip;
 	const struct mfd_cell *cells;
 	int n_cells;
+	bool pwr_button;
 
 	if (enable_crc) {
 		ret = tps6594_enable_crc(tps);
@@ -651,6 +663,15 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add common child devices\n");
 
+	pwr_button = of_property_read_bool(dev->of_node, "ti,power-button");
+	if (pwr_button) {
+		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+						&tps6594_pwrbutton_cell, 1, NULL, 0,
+						regmap_irq_get_domain(tps->irq_data));
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to add power-button: %d\n", ret);
+	}
+
 	/* No RTC for LP8764 and TPS65224 */
 	if (tps->chip_id != LP8764 && tps->chip_id != TPS65224) {
 		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, tps6594_rtc_cells,

-- 
2.43.0


