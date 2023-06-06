Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E80724CAD
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 21:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239492AbjFFTOA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 15:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239502AbjFFTNo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 15:13:44 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5461727
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 12:13:13 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b1fe3a1a73so1877571fa.1
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686078792; x=1688670792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZA9rQfuTuqMm7L4rY7JdHmHFP9ipyFjfGT8l696KaLE=;
        b=vLc1ML2qr3C12ZYpWpoyaYhHj0XIOe8Njbe6tedoFST7tai7/M5t+EDQudAS5OF5fI
         7os6Kmn0Lyc+boAbg8vRBciqi1msjsu72IBo8fyoCX3Ov7MfKtvFAAQ9pgEZQS8JblJ+
         xviNlYe/0EGavOwUWR0njwHprykxc2mjk6qfpv3zoSLZzg7ir9YAurVfpHQrF1xQqdtZ
         yJ3ZaEy9YLUqs59eZAXtlQyOzQfrEpgTfRfzthTKl+AX7APrE8TXh1BDH2jtg4wri7HH
         n2+U2ccLFQKoU6Qtxw7KrK31/upkrfDpOWeWCVNGPZcDO1KMkiO5dIPtCvRkimqSeJN+
         k2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078792; x=1688670792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZA9rQfuTuqMm7L4rY7JdHmHFP9ipyFjfGT8l696KaLE=;
        b=h6zvdiiR3QZ5WoDwOAo/rg1oIWEleLtWirmFnH5NewnlCr/Tyswx+enjoQAiJ97xpZ
         kRklbr23GhJjr/fjpYYI5s6UDpx4rQ4+tMiCql+fn8P7MfO4s5Ux7gIEtvA0NcF91rcu
         ckdmUTv0r0FgEE+wTHrkBXvFfiAfPtrbW3Ch+E/7mLTD++6JTfgI/A0G1IJ9ubYDzuP4
         usH0j1rzW9VAhkrRFQ9dubj59ect5bLyyih6aaqsN6V2Z7KVO9lj1NHEcLNGiWlx+A/M
         bz4aMXrZPOltkAhoDokI7E+8GnCnKkclHhSXBFREuUT6H/iEz0FAokO1RyMIEW0mtDuU
         WruA==
X-Gm-Message-State: AC+VfDzwWVgglvCpPJHv67sZJumET7mR/tTtfsuhQCx6NlFtQb2Tvupv
        vniIgGI8oD8oVJCyz7rqj3cHtA==
X-Google-Smtp-Source: ACHHUZ5hIzfSf9Id8op7bMrggT6dyfvWxlvGZYvBblpZ5phSJdaSXH7BjMIp7vBZT6Idca1Nd8MtHg==
X-Received: by 2002:a2e:b0e1:0:b0:2b0:4c72:98ff with SMTP id h1-20020a2eb0e1000000b002b04c7298ffmr1440823ljl.7.1686078792034;
        Tue, 06 Jun 2023 12:13:12 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id z19-20020a2e8853000000b002af15f2a735sm1972480ljj.111.2023.06.06.12.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:13:11 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, soc@kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-omap@vger.kernel.org, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] Input: ads7846 - Fix usage of match data
Date:   Tue,  6 Jun 2023 21:13:04 +0200
Message-Id: <20230606191304.3804174-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

device_get_match_data() returns the match data directly, fix
this up and fix the probe crash.

Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This patch needs to be applied to the SoC tree where the
offending patch is residing.
---
 drivers/input/touchscreen/ads7846.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 40eb27f1b23f..fe6fe8acd8a6 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1117,20 +1117,13 @@ MODULE_DEVICE_TABLE(of, ads7846_dt_ids);
 static const struct ads7846_platform_data *ads7846_get_props(struct device *dev)
 {
 	struct ads7846_platform_data *pdata;
-	const struct platform_device_id *pdev_id;
 	u32 value;
 
-	pdev_id = device_get_match_data(dev);
-	if (!pdev_id) {
-		dev_err(dev, "Unknown device model\n");
-		return ERR_PTR(-EINVAL);
-	}
-
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	pdata->model = (unsigned long)pdev_id->driver_data;
+	pdata->model = (u32)device_get_match_data(dev);
 
 	device_property_read_u16(dev, "ti,vref-delay-usecs",
 				 &pdata->vref_delay_usecs);
-- 
2.34.1

