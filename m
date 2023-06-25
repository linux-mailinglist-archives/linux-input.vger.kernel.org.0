Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4033173D246
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbjFYQ3n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjFYQ3d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:33 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B162696
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:07 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98e011f45ffso88997666b.3
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710525; x=1690302525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzSyUKtYyWcpo8YKWJv/vNvepz8ollsnHyhkAh7gPHg=;
        b=JcqMy2kSYIyY/DThcab8dQmXLodcWcjWpLJXwvFcL8S0oi8YhTpOUjqeckcAm6DuY+
         FRICGlVWoJU7pDRDW970IopS3J4rj0DF7j/2UkuMOkvfaA+3uKZWHh2YCdYGrzJawOeT
         bH/4si1voF6ZhIWfBinc/eKnnVsaGFmKoAGORLYDQZcY8iuvH+e2fppbYXoDapwEnzM1
         ha5LNW4h5FrYxPj0TiUnzP6qyEZ+6S+9QQXofLwjPe96nFNP/ygjhuh1Fg1w2osskjgG
         V+iPyz1jv1fMSn4DV+Vitp3442MzHxFUeq/HVOX4htuXiVB3z/PN/guvY+g9krSqEqwQ
         B/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710525; x=1690302525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzSyUKtYyWcpo8YKWJv/vNvepz8ollsnHyhkAh7gPHg=;
        b=EySIg9/cl5/0sSXZ4/P2dP1SFdJFMFCHVkSNJUwRpPyThluCpI2q40uDKYrfzhQ7mG
         gftu5jozw4+dQoBFnL4qViB75DBsW+xojJlDhaKDw+ZJQbGRnMY1BvQ1Kn9JIUXhnZiz
         XrO99ZOxuQ9JegMy9KlOyapefWEDAH2pkMcR2gNKoHJ7fYM9aCZKX1TnwQHnkhfV356q
         E0p6h4JfukmDle+sJsLjHZAN8GcUeqDBch+Q3raG2+eB97Lr/HRL/3qB2UYkXneURoFm
         apoUP00sNgGkg9si32ToabB505QmytISZbiEWZyRpEvXY0JJjeSMi8lFGsZ8CUhtWopO
         JNlQ==
X-Gm-Message-State: AC+VfDxK4oYvHL5FNkDr1aOYkW3JwjnGOcNP5ttYSlcZ3ZoQU+GYH42w
        d1FvBHWwsKgzT7+6kyHSQsJ4Cg==
X-Google-Smtp-Source: ACHHUZ5CE6FTpTCO0y8VTNIp69s+iHR/oA7QjayAfq10e6t5BOcdPCFSZglkbF7LVIsV3ld8h/l6rA==
X-Received: by 2002:a17:907:3fa0:b0:98c:d62e:e865 with SMTP id hr32-20020a1709073fa000b0098cd62ee865mr9726783ejc.52.1687710525215;
        Sun, 25 Jun 2023 09:28:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:44 -0700 (PDT)
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
Subject: [PATCH v4 12/24] Input: elants_i2c - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:05 +0200
Message-Id: <20230625162817.100397-13-krzysztof.kozlowski@linaro.org>
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
 drivers/input/touchscreen/elants_i2c.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 2da1db64126d..a1af3de9f310 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1438,24 +1438,14 @@ static int elants_i2c_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ts);
 
 	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
-	if (IS_ERR(ts->vcc33)) {
-		error = PTR_ERR(ts->vcc33);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to get 'vcc33' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(ts->vcc33))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->vcc33),
+				     "Failed to get 'vcc33' regulator\n");
 
 	ts->vccio = devm_regulator_get(&client->dev, "vccio");
-	if (IS_ERR(ts->vccio)) {
-		error = PTR_ERR(ts->vccio);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to get 'vccio' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(ts->vccio))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->vccio),
+				     "Failed to get 'vccio' regulator\n");
 
 	ts->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ts->reset_gpio)) {
-- 
2.34.1

