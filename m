Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCC458AABB
	for <lists+linux-input@lfdr.de>; Fri,  5 Aug 2022 14:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240800AbiHEMUC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Aug 2022 08:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240771AbiHEMTr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Aug 2022 08:19:47 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7DD79EF3
        for <linux-input@vger.kernel.org>; Fri,  5 Aug 2022 05:19:28 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id gb36so4674626ejc.10
        for <linux-input@vger.kernel.org>; Fri, 05 Aug 2022 05:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=GNrNSsuONOTD44Y0Q9blvBNHRmEVk0mvY3do2mRmKgc=;
        b=a/uwkzGq+yuyHz2sS/aR9ewxi1sK5Wl/RrWwOe2SHCSDZDeHIUVIigGwsT5fxHtfsM
         c6suea9o/UsFOv0zshyrM0VPNdTEDFMlz20l5jPAn3kfhRH7yK0DHopw80D2qXf7FjXu
         krVOdFjUMKtT7KlqDvdQANEeio6Zik0jH/Tex6/7Nkc4jfrgN9wxUKX2PGckbqNcnddP
         2Pi3Wp5NhmjvlzFlQbbQVLhzHOhePnWd9CLKHxDwacL2VHm2TSY+M67L7gARkNA+zTRb
         ERbzLbUv6Tmn6eawW5f8Z3LV1Sznd/r9n02OKZSDCiTn6ItsbRlnRcILVo1sbSM5Z3aW
         kGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=GNrNSsuONOTD44Y0Q9blvBNHRmEVk0mvY3do2mRmKgc=;
        b=ubbZzd1Rxf+wm1TpSQzYW6vQkfvbjnb8/1bdKaYlwvkM2XUNLHKwH+KBNxwDzoYwr/
         xMupHe9kYSdmFcsRB1YcC1J3xr0ujUzHuKcYuofOOXOGwo+/sIbDkJaBflU8rO6JkKZD
         itbelczvMMd66IHChfd8hk4sf1gXWE9PY9GaWvvMgULG2AEW/zBjsU1egAXQIj1Dgla3
         jlqk5Nca+QqVLXcUTPH7tmaZhO++Ip8DOqCMAWBJFZBqps6qhrkqIozVQB8XHST4Uq09
         auKj9WLe1pcrY0zh4NqBZ22+NcUdwPHMi94+hSrxKppqwxNoZ/PPYgbXwaNvtx9hNWwo
         10wA==
X-Gm-Message-State: ACgBeo0X1JYzuWzEiM2Kd4SlTSHb6JoQ8AxzPusmaoCB2MS9Rehcg6N8
        WerrfDYxIe+o7n+uliwXEiYzTQ==
X-Google-Smtp-Source: AA6agR5FIsO97DLM2JgDp/V+GxyepC/MnM+cAzEQ8k4pSTXMQo1WAiwolVztjtJBjgkOEwXs7rFNKg==
X-Received: by 2002:a17:907:9710:b0:72b:3271:c9f with SMTP id jg16-20020a170907971000b0072b32710c9fmr4906092ejc.91.1659701966427;
        Fri, 05 Aug 2022 05:19:26 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-5241-be09-b892-f882-607f-7a79.rev.sfr.net. [2a02:8440:5241:be09:b892:f882:607f:7a79])
        by smtp.gmail.com with ESMTPSA id kx13-20020a170907774d00b0072b3464c043sm1506111ejc.116.2022.08.05.05.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 05:19:26 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com
Cc:     khilman@baylibre.com, narmstrong@baylibre.com, msp@baylibre.com,
        j-keerthy@ti.com, lee.jones@linaro.org, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: [PATCH v3 07/10] mfd: tps65219: Add power-button support
Date:   Fri,  5 Aug 2022 14:18:49 +0200
Message-Id: <20220805121852.21254-8-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220805121852.21254-1-jneanne@baylibre.com>
References: <20220805121852.21254-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Markus Schneider-Pargmann <msp@baylibre.com>

Using a power-button on the EN/PB/VSENSE pin of TPS65219 is optional, so
this driver adds the mfd cell for tps65219-pwrbutton only if needed. Two
interrupts are passed to the driver.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
---
 drivers/mfd/tps65219.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 7366f251c21d..c2136662627c 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -335,7 +335,10 @@ static int tps65219_probe(struct i2c_client *client,
 	struct tps65219 *tps;
 	int ret;
 	unsigned int chipid;
+	bool pwr_button;
 	bool sys_pwr;
+	struct mfd_cell cells[TPS65219_MAX_CELLS];
+	int nr_cells = 0;
 
 	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
 	if (!tps)
@@ -364,9 +367,16 @@ static int tps65219_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO, tps65219_cells,
-				   ARRAY_SIZE(tps65219_cells), NULL, 0,
-				   NULL);
+	memcpy(&cells[nr_cells++], &tps65219_regulator_cell,
+	       sizeof(tps65219_regulator_cell));
+	pwr_button = of_property_read_bool(tps->dev->of_node, "ti,power-button");
+	if (pwr_button)
+		memcpy(&cells[nr_cells++], &tps65219_pwrbutton_cell,
+		       sizeof(tps65219_pwrbutton_cell));
+
+	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO, cells,
+				   nr_cells, NULL, 0,
+				   regmap_irq_get_domain(tps->irq_data));
 	if (ret) {
 		dev_err(tps->dev, "mfd_add_devices failed: %d\n", ret);
 		return ret;
-- 
2.17.1

