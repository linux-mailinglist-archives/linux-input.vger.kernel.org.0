Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A216C73D24D
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjFYQ3q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjFYQ3j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:39 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC1B1A5
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:16 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9741caaf9d4so194409366b.0
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710532; x=1690302532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxreeCUsKJctxClqKw334DOez932+KTIErInSPtTaVw=;
        b=Pp8yU/zBVYnTMMwOHEiumkUJwl8bUqlFFz1uk6Dfxyx294USOCkvzgAQsJlReLPAc9
         99GkJWzMhJf4GX2WkoSLyeXcFg01SnkQkcc1XU/NZCS0wO6yvUSmDuCvKJiRM2e/1PxH
         1fVn/kVsNZPsEXyle6ijoWdOHPo3AAdUgTiWv/Qdlc/WsGOvNXzdpODp4SUxFjFThmb3
         m5wRSZZ8LVPW5R76tvysT/4nUeracMSQ3/aR4THtDfaO+1olvVMeDOgNGBORXEthJdU5
         7isF7QGeuO3ST1gp9lqFsyapaIS1UIoDIkoTCAja5ASrvQCjeUBamfYtXaLhVMdNEV3U
         gbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710532; x=1690302532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxreeCUsKJctxClqKw334DOez932+KTIErInSPtTaVw=;
        b=IU6f5diOhLUjoDekm/bqMXW0oGl2gPLl+mP+KOHb94+7N0Ia7g/frpSVH09/f61E5q
         bpJ+I74Juq1QJ+IxXUo3SxK729JphAMjB3o+FMnKxWhDNESH9qRkKMa33Wvt2yI+1KBQ
         uKHsKO+SGo6Jw7lIYSwBdfiXJfhebuJeF/GbwtfmI2lNVkd111x+718ACjn6pZ2d61rO
         9IHMdHYS2Q6aFnO0FdaSSi4WJg6kw9oczFdLCGFHTIOOoWQ3m4PICl+Z96Mjktnu6/N1
         SVcwqv2Tt2DV3dCzNdQpu9gtCVCq9AxkhrZm1VlLRMaOgZvAHUfkaAclGM7oBcg5TqHH
         yjiw==
X-Gm-Message-State: AC+VfDy7gnFVo28wFZgD2elp+HjLYDCqTp7VhjORFsjpVCGPWiOZVI/m
        exdzOHKpupZubMI2udeTIF2zRw==
X-Google-Smtp-Source: ACHHUZ54nGtBAMtD5A4/SW79a5y2ixsRKqYjqAOBnJSC2bwhdzniIMKmttm6MbTvAQykre2mPU6owg==
X-Received: by 2002:a17:907:5ca:b0:97b:6c24:8d2b with SMTP id wg10-20020a17090705ca00b0097b6c248d2bmr24694857ejb.55.1687710532198;
        Sun, 25 Jun 2023 09:28:52 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 16/24] Input: raydium_i2c_ts - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:09 +0200
Message-Id: <20230625162817.100397-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
References: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/touchscreen/raydium_i2c_ts.c | 30 +++++++---------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 76e7d62d5870..78dd3059d585 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -1087,32 +1087,20 @@ static int raydium_i2c_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ts);
 
 	ts->avdd = devm_regulator_get(&client->dev, "avdd");
-	if (IS_ERR(ts->avdd)) {
-		error = PTR_ERR(ts->avdd);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to get 'avdd' regulator: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->avdd))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->avdd),
+				     "Failed to get 'avdd' regulator\n");
 
 	ts->vccio = devm_regulator_get(&client->dev, "vccio");
-	if (IS_ERR(ts->vccio)) {
-		error = PTR_ERR(ts->vccio);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to get 'vccio' regulator: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->vccio))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->vccio),
+				     "Failed to get 'vccio' regulator\n");
 
 	ts->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
 						 GPIOD_OUT_LOW);
-	if (IS_ERR(ts->reset_gpio)) {
-		error = PTR_ERR(ts->reset_gpio);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"failed to get reset gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->reset_gpio),
+				     "Failed to get reset gpio\n");
 
 	error = raydium_i2c_power_on(ts);
 	if (error)
-- 
2.34.1

