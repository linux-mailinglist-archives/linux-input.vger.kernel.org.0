Return-Path: <linux-input+bounces-15282-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA72BC121F
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 13:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0562B34E43F
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 11:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCAD2D9EDD;
	Tue,  7 Oct 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adjbSx6C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB82D9EF3
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835864; cv=none; b=EeUzklmZynyj2eXxb0bTQVb4oeQUwGL/+4TvavkvsyfdY6FO/ENUA0O6RWwosLjnbDOHTU0cYTWmna8+i/RolHp2HiObg0r5NkawEQ0d8WOXVaTKkFESB+CRXEctlVseLOn8sNiBK7ox+c1jWgHrZvz48wUXIKRKheLT/WlDJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835864; c=relaxed/simple;
	bh=STfTCmac9Yu0j7eiVhtHMDKv6NipIWLHTlXOi1zHZmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYJXr76QxQXNAoJ9yOkRJ5l2BsTEaVJEv852d7KkCJHZrXJkTVJbGjtg5GkFjaejs97CO89DvKYsX7pdtyS2WsTA9i0uCGBjPvVTK3XuyjR+i5hgutypALXKdhfUeTbibp3axwoVDsWLfCiMV3CqbPItfRQUv89EQtIPWb0gZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adjbSx6C; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b5515eaefceso5742846a12.2
        for <linux-input@vger.kernel.org>; Tue, 07 Oct 2025 04:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835862; x=1760440662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpjDHQIYIRylJPTB3diZWWrLmxC+Ub3kw5EOc9yYTqo=;
        b=adjbSx6CDGKKeF0WW1uzJELON+0u6F1zBfvlFxuIBBp8iv7poZnuN6nsk7EY92UotW
         OUAjgLnZ4LQv8CV7accfLya8riiij0H6G/doktCyLxG6d5FP3PxKuRMg6FaWZqHTqtTF
         5Y0S+UmXlh/YyQHXHsErYijJ3YOrd3vrEhyRQYZHaiNKZvDv1psV4Xj6WG224LUM0HtD
         j1jsLBPO5gcs1P1RkeydGRDt+Go35/TqzPRHZ+lCcgkNNOQLv6yhlTBjXDzCLrkiu9mS
         YUnSfSBjJGowBA43RLs8elZHg0/fmSjmBxWLe3rX6h5XMQ1nlybopViYA0yhLt9zLzCY
         aUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835862; x=1760440662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpjDHQIYIRylJPTB3diZWWrLmxC+Ub3kw5EOc9yYTqo=;
        b=rSoZoRZ01LjpAKQZYXoYGVste/sKXDmvi1r1kXl+AIpoz3u3BXkniuY585fW2SFcvB
         83Vp/6B6/X/QtzMu8iTah+mkbNALgCWHq7LAUV1PLmadPkU5iCkCeGtKeDSklAjZ3PTP
         JXvSBedkocqVYxAtScFuaBnaZUlyZbGHqwCVPhS21U5j4tGkJa6spJUCA1KFubPngwQi
         MJWjveYLhIXIPvGH+c0Dhslx/rHTHpEvHfU09E+EUHNh7pHkWtuO/MkDd/vU1qp1fr1r
         tkk9tZzOoHIDUlPXkp1OnGZcCXAFsdnpoYvYfoRT4arKrv13JkjgK5X1/Awy8GZ7A+NG
         hOlA==
X-Forwarded-Encrypted: i=1; AJvYcCWm/pHs0LVnVD53J/55MNkyOo8KGplMJEA2jdtYI96kP0uidlIQUPTIvhjUlZRRM5aGab8Y04M/oKfhRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2q2ggqEQFXAyZAUP2hQkASEyny3TApCkNMmaFaFGEU8+Vzjx
	7rwTj9ug6k9HQC6uQZfonY8V/z+jCCMJ9F2758AvP7iPOyGqEUuq2a/d
X-Gm-Gg: ASbGncu5VM96gVWnnilJOBWYZrkos3WVjfiRKaeN8jUCPqA7Efl5ONzLzXAsPLO8R/+
	1Dh509ovLvWDk3JAhU4qf+pHpOFfqBAs62vlNFqt88GOs1RXKunsjinSfHT6qrfbMkF5JPrx/7c
	3CmaBVS58/cQUts1jMbcUf99jy1Kwfq9p+K9TeFIaNlzE9Vf7MxCIFq06Ft7gfTICkyUFi52J6S
	6udkFoEtXO6PGXt+GtOwN7AUKlkjE0FF0gHJqiSidGHmbwaUVWoeDAgsYLazLWdm6SNaseuBdUm
	yQXCeEcU/CcoI0k5x76lLVRxr9TlkHdnIJWD/n1S9BSAI7hScRrKtltpOyR0OsowPzSh68C6sSk
	azN0bRAwe2b57NpqBsWjDvDA1+7uxu+Fg4p/Lptwz7i6glWrMawbXngW+JdJCxNNgSYUv4KWI9W
	r5OnNhyT7MblgLXbQfHBABXkPOMyG5SyDfdU2mJ+qM8Q==
X-Google-Smtp-Source: AGHT+IH2MGclpEKmpnzhNPVlqAkunsjPIqO+5MZS7JiVfsyBDGAzpzxIXF50V8FUhMFMK3Q92eBLHg==
X-Received: by 2002:a17:902:ccca:b0:25d:1640:1d59 with SMTP id d9443c01a7336-28e9a564e8bmr172191395ad.8.1759835861807;
        Tue, 07 Oct 2025 04:17:41 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:44 +1000
Subject: [PATCH v3 03/13] rtc: Add new rtc-macsmc driver for Apple Silicon
 Macs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-3-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6897;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=obg0EdYz2H0oIXhGRk+CbCHk2jpdlqeTG6wlPWzOz4k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm01OR+Q+nPX/JDXK1leXleUvuurp+EgcGjxddUKp
 +yjfFO5OkpZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZjIwb+MDLPdFUS/ijz3e9VY
 4uIt+lFRxsru1oOb1cfm8iTf/ql7p4aR4V2kxxXp+5aZnP+llm/awCj3ROfbhDl3Jp3j+x7h+DT
 wJjMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
On T600x machines, the RTC counter must be accessed via the SMC to
get full functionality, and it seems likely that future machines
will move towards making SMC handle all RTC functionality.

The SMC RTC counter access is implemented on all current machines
as of the time of this writing, on firmware 12.x. However, the RTC
offset (needed to set the time) is still only accessible via direct
PMU access. To handle this, we expose the RTC offset as an NVMEM
cell from the SPMI PMU device node, and this driver consumes that
cell and uses it to compute/set the current time.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS              |   1 +
 drivers/rtc/Kconfig      |  11 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-macsmc.c | 141 +++++++++++++++++++++++++
 4 files changed, 154 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10f4c0034b5e..3c6322872dd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2460,6 +2460,7 @@ F:	drivers/nvmem/apple-spmi-nvmem.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/power/reset/macsmc-reboot.c
 F:	drivers/pwm/pwm-apple.c
+F:	drivers/rtc/rtc-macsmc.c
 F:	drivers/soc/apple/*
 F:	drivers/spi/spi-apple.c
 F:	drivers/spmi/spmi-apple-controller.c
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 4a8dc8d0a4b7..e165301d4abb 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2078,6 +2078,17 @@ config RTC_DRV_WILCO_EC
 	  This can also be built as a module. If so, the module will
 	  be named "rtc_wilco_ec".
 
+config RTC_DRV_MACSMC
+	tristate "Apple Mac System Management Controller RTC"
+	depends on MFD_MACSMC
+	help
+	  If you say yes here you get support for RTC functions
+	  inside Apple SPMI PMUs accessed through the SoC's
+	  System Management Controller
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rtc-macsmc.
+
 config RTC_DRV_MSC313
 	tristate "MStar MSC313 RTC"
         depends on ARCH_MSTARV7 || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 610a9ee5fd33..32083bd5bb81 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_RTC_DRV_M48T35)	+= rtc-m48t35.o
 obj-$(CONFIG_RTC_DRV_M48T59)	+= rtc-m48t59.o
 obj-$(CONFIG_RTC_DRV_M48T86)	+= rtc-m48t86.o
 obj-$(CONFIG_RTC_DRV_MA35D1)	+= rtc-ma35d1.o
+obj-$(CONFIG_RTC_DRV_MACSMC)	+= rtc-macsmc.o
 obj-$(CONFIG_RTC_DRV_MAX31335)	+= rtc-max31335.o
 obj-$(CONFIG_RTC_DRV_MAX6900)	+= rtc-max6900.o
 obj-$(CONFIG_RTC_DRV_MAX6902)	+= rtc-max6902.o
diff --git a/drivers/rtc/rtc-macsmc.c b/drivers/rtc/rtc-macsmc.c
new file mode 100644
index 000000000000..05e360277f63
--- /dev/null
+++ b/drivers/rtc/rtc-macsmc.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC RTC driver
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/bitops.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+
+/* 48-bit RTC */
+#define RTC_BYTES 6
+#define RTC_BITS (8 * RTC_BYTES)
+
+/* 32768 Hz clock */
+#define RTC_SEC_SHIFT 15
+
+struct macsmc_rtc {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct rtc_device *rtc_dev;
+	struct nvmem_cell *rtc_offset;
+};
+
+static int macsmc_rtc_get_time(struct device *dev, struct rtc_time *tm)
+{
+	struct macsmc_rtc *rtc = dev_get_drvdata(dev);
+	u64 ctr = 0, off = 0;
+	time64_t now;
+	void *p_off;
+	size_t len;
+	int ret;
+
+	ret = apple_smc_read(rtc->smc, SMC_KEY(CLKM), &ctr, RTC_BYTES);
+	if (ret < 0)
+		return ret;
+	if (ret != RTC_BYTES)
+		return -EIO;
+
+	p_off = nvmem_cell_read(rtc->rtc_offset, &len);
+	if (IS_ERR(p_off))
+		return PTR_ERR(p_off);
+	if (len < RTC_BYTES) {
+		kfree(p_off);
+		return -EIO;
+	}
+
+	memcpy(&off, p_off, RTC_BYTES);
+	kfree(p_off);
+
+	/* Sign extend from 48 to 64 bits, then arithmetic shift right 15 bits to get seconds */
+	now = sign_extend64(ctr + off, RTC_BITS - 1) >> RTC_SEC_SHIFT;
+	rtc_time64_to_tm(now, tm);
+
+	return ret;
+}
+
+static int macsmc_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct macsmc_rtc *rtc = dev_get_drvdata(dev);
+	u64 ctr = 0, off = 0;
+	int ret;
+
+	ret = apple_smc_read(rtc->smc, SMC_KEY(CLKM), &ctr, RTC_BYTES);
+	if (ret < 0)
+		return ret;
+	if (ret != RTC_BYTES)
+		return -EIO;
+
+	/* This sets the offset such that the set second begins now */
+	off = (rtc_tm_to_time64(tm) << RTC_SEC_SHIFT) - ctr;
+	return nvmem_cell_write(rtc->rtc_offset, &off, RTC_BYTES);
+}
+
+static const struct rtc_class_ops macsmc_rtc_ops = {
+	.read_time = macsmc_rtc_get_time,
+	.set_time = macsmc_rtc_set_time,
+};
+
+static int macsmc_rtc_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_rtc *rtc;
+
+	/*
+	 * MFD will probe this device even without a node in the device tree,
+	 * thus bail out early if the SMC on the current machines does not
+	 * support RTC and has no node in the device tree.
+	 */
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->dev = &pdev->dev;
+	rtc->smc = smc;
+
+	rtc->rtc_offset = devm_nvmem_cell_get(&pdev->dev, "rtc_offset");
+	if (IS_ERR(rtc->rtc_offset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_offset),
+				     "Failed to get rtc_offset NVMEM cell\n");
+
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	rtc->rtc_dev->ops = &macsmc_rtc_ops;
+	rtc->rtc_dev->range_min = S64_MIN >> (RTC_SEC_SHIFT + (64 - RTC_BITS));
+	rtc->rtc_dev->range_max = S64_MAX >> (RTC_SEC_SHIFT + (64 - RTC_BITS));
+
+	platform_set_drvdata(pdev, rtc);
+
+	return devm_rtc_register_device(rtc->rtc_dev);
+}
+
+static const struct of_device_id macsmc_rtc_of_table[] = {
+	{ .compatible = "apple,smc-rtc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, macsmc_rtc_of_table);
+
+static struct platform_driver macsmc_rtc_driver = {
+	.driver = {
+		.name = "macsmc-rtc",
+		.of_match_table = macsmc_rtc_of_table,
+	},
+	.probe = macsmc_rtc_probe,
+};
+module_platform_driver(macsmc_rtc_driver);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC RTC driver");
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");

-- 
2.51.0


