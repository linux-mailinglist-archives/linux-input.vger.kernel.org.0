Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33DB0724616
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 16:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237778AbjFFOcr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 10:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237938AbjFFOcX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 10:32:23 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676CE1715
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 07:32:06 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f735bfcbbbso25314605e9.2
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686061924; x=1688653924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaHTT4L54o4lyD54ULBVWcdH3eh4l/G0DgyOj0OxglQ=;
        b=lyHAp2Ki4IUG3ND+Pm3w3ES8t5fIEqnPQbmU2AT1JRFvNixyRsbDrHc3xHVx4e/dPT
         w/kvqEesYRid6RAQSQLZsXfHGFyvdEE45WlcPllnPKVaL/bixO0iwbJBtgPr5KAssTjU
         wXstsgAgtZaEB3f+ks6wRtF1jnQg8vY+1dm2Z5DH7qL8l+8ZsknngOfR1OkCcbyMfAfO
         9aNrWk+fAgjWyIi+AjibXb1jFoj3yBqKrB9DRJCVDR8IKGvOKO/3+Ayr0gcyy+DRqqHE
         tSnFqEiXVfD5jaU21iGSez9cwT7+38Q8GIbWUyGSVqPcw4tUhqwVbDQctjpn1XcaeWoC
         QDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061924; x=1688653924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaHTT4L54o4lyD54ULBVWcdH3eh4l/G0DgyOj0OxglQ=;
        b=O66EnXaag1njws9Y3rgcA0izR57reJeTjJ4vkYYzqM1CeOaUVVXKYno9e42D4QaTXE
         ZGbQ556NaH0HFYEXzNBZRGey2cn4DNrW+icyXYM1vyv1accm2r2nlhwF0HBUMrHxnqnv
         nz2PHj60F1C+46dKQw1jr5yES3Gj9WeDPSymBTxdACDhtJrthy8nioeUyC250CiMZE+q
         fDq1itRLw1HX+EezKiH03w9+YdLYhlBdoXc/Ox6tAMt3LmLh/geWzKW4flW/YPwp88xz
         YO/RtBuKCktjQBJwc3P3tqk6oRgLqOQ+rnr72SaKpENZd2W4aGb66qREDM2kFWwnC4oK
         7k1w==
X-Gm-Message-State: AC+VfDxjtCFFv/k2gPy3wwqNww1AXgDwSnfbWbLf1LRhXEQGcVx5upmn
        fnA3oUILvtkHOidqv9KhCFVH3qqXGj3nwDQH7ibNrtZN
X-Google-Smtp-Source: ACHHUZ5D95xh261RJ6PfI8uKeQkOkcSpJEzvvMZ7Uyr9LwAu4svha0J9D2NO9ir5vb4f7/a1sAIoXg==
X-Received: by 2002:a05:600c:2298:b0:3f5:ffe7:bf11 with SMTP id 24-20020a05600c229800b003f5ffe7bf11mr2344366wmf.36.1686061924727;
        Tue, 06 Jun 2023 07:32:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fc14-20020a05600c524e00b003f61177faffsm3883600wmb.0.2023.06.06.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 07:32:04 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 06 Jun 2023 16:31:58 +0200
Subject: [PATCH RFC 3/4] input: touchscreen: add I2C support for Goodix
 Berlin Touchscreen IC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230606-topic-goodix-berlin-upstream-initial-v1-3-4a0741b8aefd@linaro.org>
References: <20230606-topic-goodix-berlin-upstream-initial-v1-0-4a0741b8aefd@linaro.org>
In-Reply-To: <20230606-topic-goodix-berlin-upstream-initial-v1-0-4a0741b8aefd@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4534;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wsKfTnQC6EFR3cKO2NR7jLv7N5kTOgbQbywPtOlxRB4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkf0Ng7xG7pOZLo/ZtfQTrbNF7T5tjMFmCVZgHPhMn
 43ahMAuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZH9DYAAKCRB33NvayMhJ0dpCEA
 CCBgJYpDCYwDi+/YJ78yTc352J7UcV3cMCcJhEAEXVOsuGFpNb3Teh0iKl1q9YWT1wlCmin1kWRCvF
 2uA4CGAbZNRq98n45A88CBE5+B6XtrCbC3lUfEoJKA53y0kWjrI9JTWKJmfBYJJHOJJaFF7q9p4BYP
 AZYItbUe9pjgVmzQas5PBXwzH0C5V0/f+KUb4ijWwadyqIQjFivOFXKgDqNYz2A+ojyXHvcfbj7mng
 5HpNnc4HzCPXmE6yquSqHBCPPfHuPZ6P8e5BgEuLDVWw3kSBryLHadewkdh4om2pVjmFU2EVZwtTXe
 6MAhWSoY5NPJE2jO5xmYHPHRwSD2FKPEZcjt7RxoAeDlyT3KbVTBg5ylNbvmMVYlcTVMTf13zpd1MF
 CQ0bkaJwwxE8dWuMn/keiQ9KXqsXDa8dosWl807eouIHG+G1jiU/4to+SEtX8kxUOr9KwjUhpWMR1c
 6Le7oSCue8so+zSrcK3bOakjeAd72JcoPUol03MGjMxe54napOr6yZAIbsyen8WBsClCFQJcFbgCQi
 vsMQBL7/Vb9zUJgMgKxuqKFiIR67h8BOrKeMnONqVWrgsDJmof8XCKi6Fa9djKMBg1yiI9sAtk0AFz
 b3AN/rLzBk4/LC7wY+Ma3667EwJMOTsQ7Ex6fhQt0n25AO/2t9eWV0Rbz8RQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add initial support for the new Goodix "Berlin" touchscreen ICs
over the I2C interface.

This initial driver is derived from the Goodix goodix_ts_berlin
available at [1] and [2] and only supports the GT9916 IC
present on the Qualcomm SM8550 MTP & QRD touch panel.

The current implementation only supports BerlinD, aka GT9916.

[1] https://github.com/goodix/goodix_ts_berlin
[2] https://git.codelinaro.org/clo/la/platform/vendor/opensource/touch-drivers

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/input/touchscreen/Kconfig             | 14 +++++
 drivers/input/touchscreen/Makefile            |  1 +
 drivers/input/touchscreen/goodix_berlin_i2c.c | 76 +++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 1a6f6f6da991..da6d5d75c42d 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -421,6 +421,20 @@ config TOUCHSCREEN_GOODIX_BERLIN_CORE
 	depends on REGMAP
 	tristate
 
+config TOUCHSCREEN_GOODIX_BERLIN_I2C
+	tristate "Goodix Berlin I2C touchscreen"
+	depends on I2C
+	depends on REGMAP_I2C
+	select TOUCHSCREEN_GOODIX_BERLIN_CORE
+	help
+	  Say Y here if you have the a touchscreen connected to your
+	  system using the Goodix Berlin IC connection via I2C.
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
index 29cdb042e104..921a2da0c2be 100644
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
index 000000000000..fc32b8077287
--- /dev/null
+++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Goodix Berlin Touchscreen Driver
+ *
+ * Copyright (C) 2020 - 2021 Goodix, Inc.
+ * Copyright (C) 2023 Linaro Ltd.
+ *
+ * Based on goodix_ts_berlin driver.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <asm/unaligned.h>
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
+static const struct input_id goodix_berlin_i2c_input_id = {
+	.bustype = BUS_I2C,
+	.vendor = 0x0416,
+	.product = 0x1001,
+};
+
+static int goodix_berlin_i2c_probe(struct i2c_client *client)
+{
+	struct regmap *map;
+
+	map = devm_regmap_init_i2c(client, &goodix_berlin_i2c_regmap_conf);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	return goodix_berlin_probe(&client->dev, client->irq,
+				   &goodix_berlin_i2c_input_id, map);
+}
+
+static void goodix_berlin_i2c_remove(struct i2c_client *client)
+{
+	goodix_berlin_remove(&client->dev);
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
+	{ },
+};
+
+static struct i2c_driver goodix_berlin_i2c_driver = {
+	.driver = {
+		.name = "goodix-berlin-i2c",
+		.of_match_table = goodix_berlin_i2c_of_match,
+		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
+	},
+	.probe = goodix_berlin_i2c_probe,
+	.remove = goodix_berlin_i2c_remove,
+	.id_table = goodix_berlin_i2c_id,
+};
+module_i2c_driver(goodix_berlin_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Goodix Berlin I2C Touchscreen driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");

-- 
2.34.1

