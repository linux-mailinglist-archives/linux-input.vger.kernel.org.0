Return-Path: <linux-input+bounces-3450-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEDF8BBDDD
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 21:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0031F2823F3
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 19:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080C383CD3;
	Sat,  4 May 2024 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="hyWxG6iO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C71D555;
	Sat,  4 May 2024 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714852057; cv=none; b=rmI9/T2c6HD0A/7uzMGInRWiBB6ZWzBJofkJZtjGuWu/FIoVvU6b47PePXcgoAY3H6ziQCr63pgFdFNWl0OiDjNZEDpF8eSbbRg6yS2myROgDjFpv80rSKzH2j4GYfFx7aDh744qcpuALsyW/q4qQFiZOy8oq2IsvQBkvQMD5Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714852057; c=relaxed/simple;
	bh=9/yzZqQ6E06WOQMl/WRKy6z0zNdG7bOMBsBkR8yVM9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/A9hTrSbNdaNOn134QtEtHJnzxvNg/LQxvKuvgMB0VZmKYlSY+J+mhcMtJISOcraGRn4+EAZbkW088IzukCMrGQxZXKxYVnmlT5YNqSRVMc0DtdH5QpJXBs0YdEC2tdlmaBjWL9+C6NTB4xpDJ9OQ0FF7WcJaZJQ/grDuS+w1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=hyWxG6iO; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1714852037; x=1716152037;
	bh=QIXiLpRC8MYsRANXeXcBvyUfxXqmc3gg3X3z8LtyBH8=; h=From;
	b=hyWxG6iOiw2vFZ9wb8FXwm4M5Wg+xyohTkMM86VguisrdKZktGuEkA7J6pY2EB26I
	 jBhdaZLTZWotWZZLwmAY36QN0JsgrsQBYZqNTC3ytSBPgWX/RWbm8uP2CaS3bHNLH4
	 XjaJriP8hni46/fSgT+K7f7Jrp2pJ+b9IFYBjfQLb5gJNS8wlRweN5jcnsKVUk3UMS
	 nG86AKnN2v/6YHIVBXDj4otFCIVPz82roBgiwOftc3yYWMje1yx60PClxMqPhPDelY
	 uFqtEO+f17bTdew35gyRHc49GoZO6qLfAat5UruEMOYp7eQgIB4xsevr+6HEntt7z2
	 8KGMI6qzLy7+Q==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 444JlFJj074209
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 4 May 2024 21:47:17 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Cc: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        balejk@matfyz.cz
Subject: [PATCH v6 4/5] input: add onkey driver for Marvell 88PM886 PMIC
Date: Sat,  4 May 2024 21:37:07 +0200
Message-ID: <20240504194632.2456-5-balejk@matfyz.cz>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240504194632.2456-1-balejk@matfyz.cz>
References: <20240504194632.2456-1-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Marvell 88PM886 PMIC provides onkey among other things. Add client
driver to handle it. The driver currently only provides a basic support
omitting additional functions found in the vendor version, such as long
onkey and GPIO integration.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Karel Balej <balejk@matfyz.cz>
---

Notes:
    v5:
    - Remove kernel.h include.
    RFC v4:
    - Reflect MFD driver changes:
      - chip->regmaps[...] -> chip->regmap
    - Address Dmitry's feedback:
      - Add ID table.
      - Add Ack.
    RFC v3:
    - Drop wakeup-source.
    RFC v2:
    - Address Dmitry's feedback:
      - Sort includes alphabetically.
      - Drop onkey->irq.
      - ret -> err in irq_handler and no initialization.
      - Break long lines and other formatting.
      - Do not clobber platform_get_irq error.
      - Do not set device parent manually.
      - Use input_set_capability.
      - Use the wakeup-source DT property.
      - Drop of_match_table.
      - Use more temporaries.
      - Use dev_err_probe.
    - Modify Kconfig description.

 drivers/input/misc/88pm886-onkey.c | 98 ++++++++++++++++++++++++++++++
 drivers/input/misc/Kconfig         |  7 +++
 drivers/input/misc/Makefile        |  1 +
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/input/misc/88pm886-onkey.c

diff --git a/drivers/input/misc/88pm886-onkey.c b/drivers/input/misc/88pm886-onkey.c
new file mode 100644
index 000000000000..284ff5190b6e
--- /dev/null
+++ b/drivers/input/misc/88pm886-onkey.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/88pm886.h>
+
+struct pm886_onkey {
+	struct input_dev *idev;
+	struct pm886_chip *chip;
+};
+
+static irqreturn_t pm886_onkey_irq_handler(int irq, void *data)
+{
+	struct pm886_onkey *onkey = data;
+	struct regmap *regmap = onkey->chip->regmap;
+	struct input_dev *idev = onkey->idev;
+	struct device *parent = idev->dev.parent;
+	unsigned int val;
+	int err;
+
+	err = regmap_read(regmap, PM886_REG_STATUS1, &val);
+	if (err) {
+		dev_err(parent, "Failed to read status: %d\n", err);
+		return IRQ_NONE;
+	}
+	val &= PM886_ONKEY_STS1;
+
+	input_report_key(idev, KEY_POWER, val);
+	input_sync(idev);
+
+	return IRQ_HANDLED;
+}
+
+static int pm886_onkey_probe(struct platform_device *pdev)
+{
+	struct pm886_chip *chip = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct pm886_onkey *onkey;
+	struct input_dev *idev;
+	int irq, err;
+
+	onkey = devm_kzalloc(dev, sizeof(*onkey), GFP_KERNEL);
+	if (!onkey)
+		return -ENOMEM;
+
+	onkey->chip = chip;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
+
+	idev = devm_input_allocate_device(dev);
+	if (!idev) {
+		dev_err(dev, "Failed to allocate input device\n");
+		return -ENOMEM;
+	}
+	onkey->idev = idev;
+
+	idev->name = "88pm886-onkey";
+	idev->phys = "88pm886-onkey/input0";
+	idev->id.bustype = BUS_I2C;
+
+	input_set_capability(idev, EV_KEY, KEY_POWER);
+
+	err = devm_request_threaded_irq(dev, irq, NULL, pm886_onkey_irq_handler,
+					IRQF_ONESHOT | IRQF_NO_SUSPEND, "onkey",
+					onkey);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to request IRQ\n");
+
+	err = input_register_device(idev);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to register input device\n");
+
+	return 0;
+}
+
+static const struct platform_device_id pm886_onkey_id_table[] = {
+	{ "88pm886-onkey", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, pm886_onkey_id_table);
+
+static struct platform_driver pm886_onkey_driver = {
+	.driver = {
+		.name = "88pm886-onkey",
+	},
+	.probe = pm886_onkey_probe,
+	.id_table = pm886_onkey_id_table,
+};
+module_platform_driver(pm886_onkey_driver);
+
+MODULE_DESCRIPTION("Marvell 88PM886 onkey driver");
+MODULE_AUTHOR("Karel Balej <balejk@matfyz.cz>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 6ba984d7f0b1..16a079d9f0f2 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -33,6 +33,13 @@ config INPUT_88PM80X_ONKEY
 	  To compile this driver as a module, choose M here: the module
 	  will be called 88pm80x_onkey.
 
+config INPUT_88PM886_ONKEY
+	tristate "Marvell 88PM886 onkey support"
+	depends on MFD_88PM886_PMIC
+	help
+	  Support the onkey of Marvell 88PM886 PMIC as an input device
+	  reporting power button status.
+
 config INPUT_AB8500_PONKEY
 	tristate "AB8500 Pon (PowerOn) Key"
 	depends on AB8500_CORE
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 04296a4abe8e..054a6dc1ac27 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -7,6 +7,7 @@
 
 obj-$(CONFIG_INPUT_88PM860X_ONKEY)	+= 88pm860x_onkey.o
 obj-$(CONFIG_INPUT_88PM80X_ONKEY)	+= 88pm80x_onkey.o
+obj-$(CONFIG_INPUT_88PM886_ONKEY)	+= 88pm886-onkey.o
 obj-$(CONFIG_INPUT_AB8500_PONKEY)	+= ab8500-ponkey.o
 obj-$(CONFIG_INPUT_AD714X)		+= ad714x.o
 obj-$(CONFIG_INPUT_AD714X_I2C)		+= ad714x-i2c.o
-- 
2.45.0


