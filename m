Return-Path: <linux-input+bounces-766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 724EB811A95
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 18:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE8C6B21278
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 17:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F036F3B796;
	Wed, 13 Dec 2023 17:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSr7xydS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F0E610E
	for <linux-input@vger.kernel.org>; Wed, 13 Dec 2023 09:13:25 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c2308faedso73641735e9.1
        for <linux-input@vger.kernel.org>; Wed, 13 Dec 2023 09:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702487604; x=1703092404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tid5p5CbwnFew1OoFmZZ3rTS9lA993ke+t72lpp1p7Y=;
        b=pSr7xydSqfVB+HNRDEbWU5q+MGqUiekIMXejqpEGwrynrMcdxX+k8mdSJpE5EicUId
         eGHukWuypFmzeyWRz4VIvRynnGXQulRDRekw7HEv1SRUpDnG3ZW+4JQT/tIAPok9BSdN
         QHlSOHN7mZPlr1ykbV3EQaVjbgA9u8DdTMEvwTLCpJSPye+HhpuEfMI0wl327qOxejjl
         f8UuALJ/H+PEEZ1XnYZDHiFDnGCvTlyuPCV+/tBknSQFECIqeVIOICOt7wDP1quQSTN5
         h1iNS7wDpJ+eHglJA9qpoNK1ZA933LsUFQpCYvqnXcFDhrTFoBKP8nvSqUNBZ27XUx6J
         Ztig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487604; x=1703092404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tid5p5CbwnFew1OoFmZZ3rTS9lA993ke+t72lpp1p7Y=;
        b=Yh4pvMlSHW6xuk3dtEFlXWQ5Wi4tb2HBGxzv/T1gTAYWGTqCl9a0T3B9x3k5PE8Mh/
         o20/E52eUeLV73lfycsd7+WNZplwnNA9HQgVH+zJHebwaPiZJzNlhs2+G00mfEHKYdOK
         afpq4OZD4TWAh/pPbxTjEyfWS21JwnVNLKbwbToH4sanHuEEmgGrz0VjbeZqruZCI06B
         TFI3xqkWOsvkwJD2QKI9tXS1mNU9FLZG1XKELD7oepnhMxK1aSY6Ug7eTZ7mzPEvXu56
         LJD+U28zr8ZhpFTvmNucG4pjooSSy/zDpoLzYjbmXIBX+n4mQW25Z0JQYA2M32Wsp6fs
         sPUg==
X-Gm-Message-State: AOJu0YwsjvSdMfnr4S9EUNdaVutacK99IdcvO1HoRMIP2bhVF5qM2YYH
	ErgmyGUFB3JXxVTDNP08nyo3DQ==
X-Google-Smtp-Source: AGHT+IGEHMMgGlTIIx4pngBGR7i1+o1o1tDCUpM8BHyWuTNwF1HfHYMSCsZ72RQz9pChhJhwauJruw==
X-Received: by 2002:a05:600c:a3af:b0:40c:2c36:2a23 with SMTP id hn47-20020a05600ca3af00b0040c2c362a23mr4038457wmb.180.1702487603916;
        Wed, 13 Dec 2023 09:13:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fs27-20020a05600c3f9b00b0040b36050f1bsm20711039wmb.44.2023.12.13.09.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:13:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Dec 2023 18:13:17 +0100
Subject: [PATCH v13 3/4] Input: goodix-berlin - add I2C support for Goodix
 Berlin Touchscreen IC
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-topic-goodix-berlin-upstream-initial-v13-3-5d7a26a5eaa2@linaro.org>
References: <20231213-topic-goodix-berlin-upstream-initial-v13-0-5d7a26a5eaa2@linaro.org>
In-Reply-To: <20231213-topic-goodix-berlin-upstream-initial-v13-0-5d7a26a5eaa2@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 linux-input@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastien Nocera <hadess@hadess.net>, 
 Hans de Goede <hdegoede@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, 
 Jeff LaBundy <jeff@labundy.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4539;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/29OxaflwzQer1E/gOu8Bz3LG+5phtsz3jcz094am9k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleeYu47Op4hdNJnatpilIR9IsMvIUgFeoNQrGH4i9
 FZN5BfuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXnmLgAKCRB33NvayMhJ0XlED/
 9jQxCkGe9yo9aVigft/mk6hC094hF3kONRfxFWKmclqOjFtp8eVV0pItHXub98E+2aYIwpu6RphJxP
 ZX3zoPqEEmiCcviE6cLgZ+eWCsnQJoDmXNXUNPpzUgV9rNPfGtJJb2KEnvpCa5PXwn8SwAyXEknqWU
 zIxiCEHbytJ3sMvJN/NFccXzjGzw4cgSohxtrc7scuJVYB6yPlh+4xGAt47HLq/YkuL3+6zbZ3aFEc
 HuMl3rZfOokgAkseOUt+dGhkDw14zSbqaQbWuH/UwSd2L4venNMKkWVpQPx/zcsg81MqkLzrYlE2LH
 7hQWlMTabLUOaWhp7zZViMDOBj2ehX7SWQDpsJ+zv3Kyg0BPyIoiv9YOpKgnucdAs8WfEsXzpRSCuZ
 bd/aLiUXafrxPHOWgtonO5ubTI8i+bX5LnFCfjMpFDX715KVzmOPdMxWFQkaC49CkIgL/RQJB/wQGr
 kcHlDhgj7f/+3XEzvwiucVRpvBOVF+aXR3mN+xdSmCJri6LvzYYUv4YdkFIAHYDsVHkvV081jcY3+A
 OZypCIZykLbssWH37mlb/nt+7qMnz1BrKe1PpoIpqBtktRrkTmC9NuAv742XmTvn+hwu9/VGXrsaLP
 J7zBH6FDV6iIdtS5V9MVRvdnwF0IM24K3vmpHa8yE6iqBtS3Ywe6gKTOGh9A==
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


