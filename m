Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1180D73D243
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjFYQ3i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjFYQ3Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:25 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5539410C6
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:00 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98df69cacd1so73187866b.1
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710523; x=1690302523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZfZ872GVOCcTPRjs89Uw4yCp3UorSm6QgpAUx4XVGY=;
        b=Uo1zyOlLpZL2UBUHHUOOzVncIJZUYyWyf+KewkL3fWr5uxxQ0uOaPw4Xv2hQwniSfc
         pgH2LSxOxvUXpNiE8EZ34eAw9p6xaJzvDkxghta3xsyyfzw2ezFfsCzELzjJiVXLIMwg
         d7TfoQp25dFYj7lLljcgxRHLH1gHGo4QytWJxa/4yRpHrVr6EoaVN8QYEHiL7yaznWYO
         jrMX6E9H5A7yRNPA0l2KKsaZgxBbATBGQlD2PNw60hFBp52zFrC5mdDGCZ7ECH1uxXd+
         8KSTb4Vlko3rV/Y7yE2emHAjZRLQoxLfyUaBQi2oK3y+zUmWbaIqvKGL8CV8IfL27L2m
         teZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710523; x=1690302523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZfZ872GVOCcTPRjs89Uw4yCp3UorSm6QgpAUx4XVGY=;
        b=EjfFuzCJDUfS1hRFi7DDrusA76wTqlEALc3gux87EQzQlUmCny+w2Xig6GqeikYOOF
         5HlG8wUxr9gWtHtT4T4sn+hovEZQ60xniBY+1fYz8pMQ61NtuLtMHQwCTcDBFIDTKIrH
         qYnuO94FfSG2noft8xTvtMgP6ZrQuVishTbM2jXQY6gy0mGk/IvJgD5M/HjJWmNqkX8y
         8kq+Yrw3m18/r3DTYCYJakhO+C+6PFRKh2nHeH+3O2TCkJp9airCC/+dkReWhqR2QINd
         jzRy8Si9HeUlTjNay8rdq+XKOLIu6qQz/AWbY1hs0pgzUuUdZZD3TLaPND+OmuJwxr+P
         WQEg==
X-Gm-Message-State: AC+VfDwW/QSEnv9BjIKVnhBGeoSgePoJl3oYpPfpwDHphZjd/1RDzusJ
        xwEWb4Why6kjgnMWDX0462tapg==
X-Google-Smtp-Source: ACHHUZ4y90Vk1OH9umTel8HjlFcdquOy+Gq4wyj7Nqui5KfInqv/34x9nmNgY2AhqPNBhNprLPUCsw==
X-Received: by 2002:a17:907:3189:b0:974:2169:5f81 with SMTP id xe9-20020a170907318900b0097421695f81mr23050480ejb.22.1687710523442;
        Sun, 25 Jun 2023 09:28:43 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:43 -0700 (PDT)
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
Subject: [PATCH v4 11/24] Input: ektf2127 - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:04 +0200
Message-Id: <20230625162817.100397-12-krzysztof.kozlowski@linaro.org>
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
 drivers/input/touchscreen/ektf2127.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
index fd8724a3c19f..cc3103b9cbfb 100644
--- a/drivers/input/touchscreen/ektf2127.c
+++ b/drivers/input/touchscreen/ektf2127.c
@@ -264,12 +264,8 @@ static int ektf2127_probe(struct i2c_client *client)
 
 	/* This requests the gpio *and* turns on the touchscreen controller */
 	ts->power_gpios = devm_gpiod_get(dev, "power", GPIOD_OUT_HIGH);
-	if (IS_ERR(ts->power_gpios)) {
-		error = PTR_ERR(ts->power_gpios);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Error getting power gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->power_gpios))
+		return dev_err_probe(dev, PTR_ERR(ts->power_gpios), "Error getting power gpio\n");
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-- 
2.34.1

