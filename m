Return-Path: <linux-input+bounces-639-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F44080B2CD
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 08:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B1328108C
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 07:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8650B23BD;
	Sat,  9 Dec 2023 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x8Phv2Y4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCE61712
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 23:33:50 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3333131e08dso3323048f8f.2
        for <linux-input@vger.kernel.org>; Fri, 08 Dec 2023 23:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702107228; x=1702712028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tid5p5CbwnFew1OoFmZZ3rTS9lA993ke+t72lpp1p7Y=;
        b=x8Phv2Y4vFv2Kxv7LZjKV8Oy7CEA+l7Z4BgoduUkeL4wdbRXXFsYB+OWcu6ClIDt3s
         CHmliQxWjAZPkC/Ipgbw72JB0GztT0kPFC52cOgDlq8763SyvlxBPK5DH5hpwTztMOa8
         FRGV2gQRRoKR/LK3R74My0WQhWCw15p9wWPk2pfaiobt7sAANrOxfycecthy9VWwtFos
         +QV59fDNLKgFRWpMiK9I/Lm1FgAq6Qee8ImHpaBDdmzWZMZ12pObgMR7XKkf1bIWIpok
         dqGN9/5/sjImDLmRZ8aQS/l6Rih7ELfh862GpNZ0qgFWWxGqADu2R0MAI5WavdcpVX8t
         EX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702107228; x=1702712028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tid5p5CbwnFew1OoFmZZ3rTS9lA993ke+t72lpp1p7Y=;
        b=GUij62bByBMFy3EuDOjhMCieGeWY3AE4HW1kggo7zLOO88WG6YG4yqrGVL22Y8wigP
         cGs3SkhFG/MYFfcNJ793sJC94630Y8Q4xveZQldpWz3AtAHHdtE0GYriijWJp5/zT8zT
         Lg5Uiym9iWRuH6IT39LGqvMtGCXAn/O9SKWYSmySya8rrQHzZbJ5hPtAoVPGmfoH4n4X
         ecVixGNNR+3yB6KHpvdVqUzXlwhuDTIK3NA3bEDuSeFPQEBRp4rRdUenGm7wldNip/Gi
         32OFQORrhqKFMKNjH8nepbAeM36h2ZMrHu/EWJEiNNVpGrYbz4DUjA8jqIVYvHLRd+kC
         Brpw==
X-Gm-Message-State: AOJu0YxwZeBpmBwW7qJi7Yqvm0GwRPSM0xM9WcjKz3IjTTTqMYXELK3d
	YFqt2EoTZDK46tedGDOOrVDMfQ==
X-Google-Smtp-Source: AGHT+IFue+qASfoBYHun1WRmew8ZrF26zpf+rwVA7t80pjdqN2MqgZddY+oaZokH84ljREBtlIebMg==
X-Received: by 2002:a1c:4b10:0:b0:40c:32d5:18df with SMTP id y16-20020a1c4b10000000b0040c32d518dfmr567495wma.182.1702107228626;
        Fri, 08 Dec 2023 23:33:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id m3-20020a5d56c3000000b003334520e49bsm3577803wrw.53.2023.12.08.23.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 23:33:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Sat, 09 Dec 2023 08:33:41 +0100
Subject: [PATCH v12 3/4] Input: goodix-berlin - add I2C support for Goodix
 Berlin Touchscreen IC
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231209-topic-goodix-berlin-upstream-initial-v12-3-eaffaeb53fb5@linaro.org>
References: <20231209-topic-goodix-berlin-upstream-initial-v12-0-eaffaeb53fb5@linaro.org>
In-Reply-To: <20231209-topic-goodix-berlin-upstream-initial-v12-0-eaffaeb53fb5@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 linux-input@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastien Nocera <hadess@hadess.net>, 
 Hans de Goede <hdegoede@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, 
 Jeff LaBundy <jeff@labundy.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4539;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/29OxaflwzQer1E/gOu8Bz3LG+5phtsz3jcz094am9k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBldBhX0gFWxTQPAuo1ZjJMXSxnT7pKcEKtFCTUMpGP
 WgGGPyyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXQYVwAKCRB33NvayMhJ0fP3D/
 9uThZkuVlN0v9Ygy6xMkWoZQln0Dvh4MnXPieP/D9VdRlTPdGZgZ+ueWuTyeVy484ExYXej+ufoDfU
 q7LBXX+LDSB7Q7rCgK0rMPTo9oWmjaInBsQUhUco9mpXUkjuYmTRcw5V13urSaNB/T5aLjVnY7xRw+
 K5hNI67Bl6EQzXe+L1hCGdkVg/T6j6U81pPaPCzDv2z6mISYxZ/1r3dK6p7WT/gja3dd3uQBuiB4zO
 bxSP+iHXcp7KtTwADjUnUl9LcW/C3iuKVUHP0XNT4Zy+GfKQqqA52v26D5ScJzQSBFzWFQ8t2SGgD/
 xE9os2f7No81pj1VuBopm1mo3/5cBvfE8U5r0TCGmJjKVaumSZ8mUWyLSFde9rPdcsUYIFdAwkySJc
 RrGHAz4l44/hPR0KGLrJMHPxf3SpP807Tkic68sWA+WT7aTuGVY8/1m3if2IbG/FiIVTWQOwmVHpLC
 hXY6mRwjTAIQ/YU80hLkyFmGaEtctFbmvQo8XflDkdQyCL1oj0+SoOifOhCdnwkzN/DGRQcmHDMU0L
 UrRU3+cCNaH5+IUq4MY3pbt2EYOo9DbUdZgK7/S5goTuNiS4hlgTwpLLBDikAVKlWP/FzBsFHZGjMF
 hCcOf2MmI31q8fhooFkGQc3Gvfu3dGJgTRO5BHJ6tjrHSzexKkv1Eabrkg/A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add initial support for the new Goodix "Berlin" touchscreen ICs
over the I2C interface.

This initial driver is derived from the Goodix goodix_ts_berlin
available at [1] and [2] and only supports the GT9916 IC
present on the Qualcomm SM8550 MTP & QRD touch panel.

The current implementation only supports BerlinD, aka GT9916.

[1] https://github.com/goodix/goodix_ts_berlin
[2] https://git.codelinaro.org/clo/la/platform/vendor/opensource/touch-drivers

Reviewed-by: Jeff LaBundy <jeff@labundy.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/input/touchscreen/Kconfig             | 14 +++++
 drivers/input/touchscreen/Makefile            |  1 +
 drivers/input/touchscreen/goodix_berlin_i2c.c | 74 +++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 950da599ae1a..cc7b88118158 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -419,6 +419,20 @@ config TOUCHSCREEN_GOODIX
 config TOUCHSCREEN_GOODIX_BERLIN_CORE
 	tristate
 
+config TOUCHSCREEN_GOODIX_BERLIN_I2C
+	tristate "Goodix Berlin I2C touchscreen"
+	depends on I2C
+	select REGMAP_I2C
+	select TOUCHSCREEN_GOODIX_BERLIN_CORE
+	help
+	  Say Y here if you have a Goodix Berlin IC connected to
+	  your system via I2C.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called goodix_berlin_i2c.
+
 config TOUCHSCREEN_HIDEEP
 	tristate "HiDeep Touch IC"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 2e2f3e70cd2c..7ef677cf7a10 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
 obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
+obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C)	+= goodix_berlin_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
 obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
new file mode 100644
index 000000000000..4d5bcc101569
--- /dev/null
+++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Goodix Berlin Touchscreen Driver
+ *
+ * Copyright (C) 2020 - 2021 Goodix, Inc.
+ * Copyright (C) 2023 Linaro Ltd.
+ *
+ * Based on goodix_ts_berlin driver.
+ */
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include "goodix_berlin.h"
+
+#define I2C_MAX_TRANSFER_SIZE		256
+
+static const struct regmap_config goodix_berlin_i2c_regmap_conf = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.max_raw_read = I2C_MAX_TRANSFER_SIZE,
+	.max_raw_write = I2C_MAX_TRANSFER_SIZE,
+};
+
+/* vendor & product left unassigned here, should probably be updated from fw info */
+static const struct input_id goodix_berlin_i2c_input_id = {
+	.bustype = BUS_I2C,
+};
+
+static int goodix_berlin_i2c_probe(struct i2c_client *client)
+{
+	struct regmap *regmap;
+	int error;
+
+	regmap = devm_regmap_init_i2c(client, &goodix_berlin_i2c_regmap_conf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	error = goodix_berlin_probe(&client->dev, client->irq,
+				    &goodix_berlin_i2c_input_id, regmap);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static const struct i2c_device_id goodix_berlin_i2c_id[] = {
+	{ "gt9916", 0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, goodix_berlin_i2c_id);
+
+static const struct of_device_id goodix_berlin_i2c_of_match[] = {
+	{ .compatible = "goodix,gt9916", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, goodix_berlin_i2c_of_match);
+
+static struct i2c_driver goodix_berlin_i2c_driver = {
+	.driver = {
+		.name = "goodix-berlin-i2c",
+		.of_match_table = goodix_berlin_i2c_of_match,
+		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
+	},
+	.probe = goodix_berlin_i2c_probe,
+	.id_table = goodix_berlin_i2c_id,
+};
+module_i2c_driver(goodix_berlin_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Goodix Berlin I2C Touchscreen driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");

-- 
2.34.1


