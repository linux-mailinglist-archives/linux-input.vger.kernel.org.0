Return-Path: <linux-input+bounces-16570-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22178CBD38A
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 10:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDD8B30124E1
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 09:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E0532ABC3;
	Mon, 15 Dec 2025 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9T4nBai"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B388329374
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791532; cv=none; b=Fu4uXeu2XtgCI3Aa5fQjOuwGloFSBIebjbuAxtMQLsvGhDTHfFeh3OKw7+AKeCq7I4sqJhegWVOTJOeAnDWPv9+h7dZUE3yqRzMbkibXcjLdlEPh+M2fUaLqgx7IrpxAljRoFb1ABgyk2yHREJotD33tcIGO95Lie0fLjZ+Ypc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791532; c=relaxed/simple;
	bh=juGdkiAL8Ef7FniFZDXGGIHcDDafInr/yvVMPwDegYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DA7rcuFHkc1u3FuP652JCkKVJsNmrEBXH6W4KTm/mwbGFjpmbuuOyjIXxrruXlZ6ajF63GC5XrZZu8OQm/X8PpGBEGgtleg3ERlDDKjMjgJqt6bLVYFKNxXbd7zELM6Zkqje7G1dnhyQ0iS9G9QPh++H26ouOCn/Ak9Gh3GUESQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9T4nBai; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0834769f0so19447055ad.2
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 01:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791529; x=1766396329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MX4l83PZei/eA8H23B1WzGR4a5PAckpfpztaLgsdyrA=;
        b=P9T4nBaiHE19GitMpjDMC6krcTlbcPuD2CYpd7V4GhUxgXJ5jAiSKutKdvXSYSbwDE
         d9KqvMlcfYDnuwwQHkWo/+dLRSFPfneiAvIPZR/jyYqkpuQNPRdq7uuHTxqEf7TofDoJ
         znXyUUEzMzQzqsUzLjROwVpZ6nr0hrfvQmx4fvC1+GVijkTxOcP5vAH1xYfLBKKUZEkK
         HH9hNlPoO1Al080y7mXdK1IBhxvHowMgcRTPxNeiQOyx40+A9mRLMjV5qTLVNjsDRFjX
         kAF/I7od5uE17zeM9BfqPhZp5B3aMY2DDNhdIyTj/e+rwKJNCuYl/lGmCxSJyE44joY8
         jSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791529; x=1766396329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MX4l83PZei/eA8H23B1WzGR4a5PAckpfpztaLgsdyrA=;
        b=oEfgRjRSvrOOP3K71EgrNQqkRD5zD6lqNSLC47trb5uIOMzaS7RZb/L6TJFEfsclDT
         q+K7bS+ZITRAPQO/wEXXfVm5jUsOsmLdtpClkl02cSrAHCvAax8IDSKWaF6CyvunKj8u
         d468GYZfOSj9DSTrXvkNkqzKH1nZbdURCaChG7mx5nYoBtPwwdXmC2wUvEbLpkguZ1qM
         AZNEO/JkEFXfVpcQ73L5b9UaEf54XYp7pYLuK0OFso8j6ljqiiE62mMhJhhyaOtWXMSd
         FNkqQLD/JmckxrkvRl0zcEm4e7WSraTRCouvOcIfOsJTw99lQoWEhY5k4fnjftGnsqWz
         hPpA==
X-Forwarded-Encrypted: i=1; AJvYcCUP0UKp2YvIcCe/lK8mj46T0xgLQ/Huh5lSuxF6Fwnhy1MmFohK2SV4sPT1Di6JH9r/YR40FHdwsgP/Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmXOheBiyW3I0tz8iVRgPqes7EORtVMbO3tUIRzLsFd5LiAjK
	fst1f9XEaD9nXs5jbIkLsLPGUeTIdTqcAcXGbB8ILpQM9+55aOrAub2V
X-Gm-Gg: AY/fxX7Aauk44vFGMrc3vW5zskDVQQCpkxrNXTSNFtrtlBPRln7fky73rAF2Tu04ZtS
	5RGCGYkyd+56jOYXcGFy24Bk1/8/yD26KRDJ49edgHr/LCn2IkcUBEmVU8PWJuw4E7+RRyGUKtq
	imOSEIc1mLLBJkAxkFmt47JkXFWe3sX1aG35mr1qxp+909aHCtJx6theE2PFNdYi94HoFvivVpW
	JL0myHClQB0HweehvSJ7DZe/2aYBZ/dlfAExi81Az9PtBP7KFpeRvalXXLZxkKfS/W4z0Zj59yx
	/jVv5nq7ImADzh1hhqvA/FiYvWc2d4GVwI0Bp3QcUvd9osd7PvLC5HN6Sr3cy5kpRBKiPfalVEZ
	Lp6FXMnCl5e3llsj57qsXwWap7LiwdH5ihXN19KB/CNjaKcVKxH1f46M27lG6jBXGf3emsrAhMP
	k6edAWqxxwyFNVw3HdRilDD7VfvVPGemvWouShkFYIR0J47mCJdMnKC+6b3VRFZiSTi3oQ0hwej
	m9IIZva+3DdkRejljAVXIF2xaec/6iyxVZBfbvtdFcnxO3pvv6X4XIRCNSHzAxYcw9NmQc1elR2
	jqZDbeYa2Q/9kQoMIgOrTMXnpOgZeuwS6y+lHjzkuvybYHPjvke8WbIxWiceHA==
X-Google-Smtp-Source: AGHT+IEGJ44+51Fi+YdUwyKv9dsSN+8JmzAkupuBnmxY9duLk9j4SAUpGagR8Wr9Xf65hMIh2opKeg==
X-Received: by 2002:a17:902:e784:b0:295:6c26:933b with SMTP id d9443c01a7336-29f23dd1fd2mr76096885ad.1.1765791528782;
        Mon, 15 Dec 2025 01:38:48 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:48 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:48 +1000
Subject: [PATCH v6 4/7] input: macsmc-input: New driver to handle the Apple
 Mac SMC buttons/lid
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-4-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9128;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lS/4q39E8TljfGLFH7Nskm9ro5EkQw4hj2XcyHKJZLk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215mrpy8p3nlB5ZD90yrBuRZBLrWFR2a/lzUWjYmoi
 mnw3N/dMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Qx1jHSMGLk4BmGqjvQx/ZQP2h/89rBe/+7vGt6M9ATL70h0fdSodumMVxZJ/J57nGSPD+fMTtvU
 XTRS/uiFxg83h3Z9kX39pC41S+MVrcz54U68CFwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

This driver implements power button and lid switch support for Apple Mac
devices using SMC controllers driven by the macsmc driver.

In addition to basic input support, this also responds to the final
shutdown warning (when the power button is held down long enough) by
doing an emergency kernel poweroff. This allows the NVMe controller to
be cleanly shut down, which prevents data loss for in-cache data.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/input/misc/Kconfig        |  11 ++
 drivers/input/misc/Makefile       |   1 +
 drivers/input/misc/macsmc-input.c | 207 +++++++++++++++++++++++++
 4 files changed, 220 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f160eb6762e..7f2160a18da2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2492,6 +2492,7 @@ F:	drivers/hwmon/macsmc-hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/misc/macsmc-input.c
 F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 94a753fcb64f..0e805c870e29 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -1003,4 +1003,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_MACSMC
+	tristate "Apple Mac SMC lid/buttons"
+	depends on MFD_MACSMC
+	help
+	  Say Y here if you want to use the input events delivered via the
+	  SMC controller on Apple Mac machines using the macsmc driver.
+	  This includes lid open/close and the power button.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called macsmc-input.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 415fc4e2918b..174031304975 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
+obj-$(CONFIG_INPUT_MACSMC_INPUT)	+= macsmc-input.o
 obj-$(CONFIG_INPUT_MAX7360_ROTARY)	+= max7360-rotary.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
diff --git a/drivers/input/misc/macsmc-input.c b/drivers/input/misc/macsmc-input.c
new file mode 100644
index 000000000000..f4598e65fc80
--- /dev/null
+++ b/drivers/input/misc/macsmc-input.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC input event driver
+ * Copyright The Asahi Linux Contributors
+ *
+ * This driver exposes certain events from the SMC as an input device.
+ * This includes the lid open/close and power button notifications.
+ */
+
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+
+/**
+ * struct macsmc_input
+ * @dev: Underlying struct device for the input sub-device
+ * @smc: Pointer to apple_smc struct of the mfd parent
+ * @input: Allocated input_dev; devres managed
+ * @nb: Notifier block used for incoming events from SMC (e.g. button pressed down)
+ * @wakeup_mode: Set to true when system is suspended and power button events should wake it
+ */
+struct macsmc_input {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct input_dev *input;
+	struct notifier_block nb;
+	bool wakeup_mode;
+};
+
+#define SMC_EV_BTN 0x7201
+#define SMC_EV_LID 0x7203
+
+#define BTN_POWER		0x01 /* power button on e.g. Mac Mini chasis pressed */
+#define BTN_TOUCHID		0x06 /* combined TouchID / power button on MacBooks pressed */
+#define BTN_POWER_HELD_SHORT	0xfe /* power button briefly held down */
+#define BTN_POWER_HELD_LONG	0x00 /* power button held down; sent just before forced poweroff */
+
+static void macsmc_input_event_button(struct macsmc_input *smcin, unsigned long event)
+{
+	u8 button = (event >> 8) & 0xff;
+	u8 state = !!(event & 0xff);
+
+	switch (button) {
+	case BTN_POWER:
+	case BTN_TOUCHID:
+		pm_wakeup_dev_event(smcin->dev, 0, (smcin->wakeup_mode && state));
+
+		/* Suppress KEY_POWER event to prevent immediate shutdown on wake */
+		if (smcin->wakeup_mode)
+			return;
+
+		input_report_key(smcin->input, KEY_POWER, state);
+		input_sync(smcin->input);
+		break;
+	case BTN_POWER_HELD_SHORT: /* power button held down; ignore */
+		break;
+	case BTN_POWER_HELD_LONG:
+		/*
+		 * If we get here the power button has been held down for a while and
+		 * we have about 4 seconds before forced power-off is triggered by SMC.
+		 * Try to do an emergency shutdown to make sure the NVMe cache is
+		 * flushed. macOS actually does this by panicing (!)...
+		 */
+		if (state) {
+			dev_crit(smcin->dev, "Triggering forced shutdown!\n");
+			if (kernel_can_power_off())
+				kernel_power_off();
+			else /* Missing macsmc-reboot driver? */
+				kernel_restart("SMC power button triggered restart");
+		}
+		break;
+	default:
+		dev_warn(smcin->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
+	}
+}
+
+static void macsmc_input_event_lid(struct macsmc_input *smcin, unsigned long event)
+{
+	u8 lid_state = !!((event >> 8) & 0xff);
+
+	pm_wakeup_dev_event(smcin->dev, 0, (smcin->wakeup_mode && !lid_state));
+	input_report_switch(smcin->input, SW_LID, lid_state);
+	input_sync(smcin->input);
+}
+
+static int macsmc_input_event(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct macsmc_input *smcin = container_of(nb, struct macsmc_input, nb);
+	u16 type = event >> 16;
+
+	switch (type) {
+	case SMC_EV_BTN:
+		macsmc_input_event_button(smcin, event);
+		return NOTIFY_OK;
+	case SMC_EV_LID:
+		macsmc_input_event_lid(smcin, event);
+		return NOTIFY_OK;
+	default:
+		/* SMC event meant for another driver */
+		return NOTIFY_DONE;
+	}
+}
+
+static int macsmc_input_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_input *smcin;
+	bool have_lid, have_power;
+	int error;
+
+	/* Bail early if this SMC neither supports power button nor lid events */
+	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
+	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
+	if (!have_lid && !have_power)
+		return -ENODEV;
+
+	smcin = devm_kzalloc(&pdev->dev, sizeof(*smcin), GFP_KERNEL);
+	if (!smcin)
+		return -ENOMEM;
+
+	smcin->dev = &pdev->dev;
+	smcin->smc = smc;
+	platform_set_drvdata(pdev, smcin);
+
+	smcin->input = devm_input_allocate_device(&pdev->dev);
+	if (!smcin->input)
+		return -ENOMEM;
+
+	smcin->input->phys = "macsmc-input (0)";
+	smcin->input->name = "Apple SMC power/lid events";
+
+	if (have_lid)
+		input_set_capability(smcin->input, EV_SW, SW_LID);
+	if (have_power)
+		input_set_capability(smcin->input, EV_KEY, KEY_POWER);
+
+	if (have_lid) {
+		u8 val;
+
+		error = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
+		if (error < 0)
+			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
+		else
+			input_report_switch(smcin->input, SW_LID, val);
+	}
+
+	if (have_power) {
+		u32 val;
+
+		error = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
+		if (error < 0)
+			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
+		else
+			input_report_key(smcin->input, KEY_POWER, val & 1);
+	}
+
+	error = input_register_device(smcin->input);
+	if (error) {
+		dev_err(&pdev->dev, "Failed to register input device: %d\n", error);
+		return error;
+	}
+
+	input_sync(smcin->input);
+
+	smcin->nb.notifier_call = macsmc_input_event;
+	blocking_notifier_chain_register(&smc->event_handlers, &smcin->nb);
+
+	device_init_wakeup(&pdev->dev, true);
+
+	return 0;
+}
+
+static int macsmc_input_pm_prepare(struct device *dev)
+{
+	struct macsmc_input *smcin = dev_get_drvdata(dev);
+
+	smcin->wakeup_mode = true;
+	return 0;
+}
+
+static void macsmc_input_pm_complete(struct device *dev)
+{
+	struct macsmc_input *smcin = dev_get_drvdata(dev);
+
+	smcin->wakeup_mode = false;
+}
+
+static const struct dev_pm_ops macsmc_input_pm_ops = {
+	.prepare = macsmc_input_pm_prepare,
+	.complete = macsmc_input_pm_complete,
+};
+
+static struct platform_driver macsmc_input_driver = {
+	.driver = {
+		.name = "macsmc-input",
+		.pm = &macsmc_input_pm_ops,
+	},
+	.probe = macsmc_input_probe,
+};
+module_platform_driver(macsmc_input_driver);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC input driver");
+MODULE_ALIAS("platform:macsmc-input");

-- 
2.52.0


