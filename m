Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8AC73D24B
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjFYQ3p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbjFYQ3f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:35 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3092D2
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:11 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98746d7f35dso372793466b.2
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710528; x=1690302528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzpB2JeeP/+5LJQoX+DM+hKB46MUVJk8x7crRJkVgqQ=;
        b=trHNOk0opvYLVYmVhzWT2Po6oKItnmcPPNCDu1Fx2rMr8oCf1DH/9UCFefDEAKU+Ky
         AKS4L4xB1IOig9scwrJH7yctsWIPoE4nIkf6I8UrGBlOx9Iu9SN/Xw7lJBRa6K4GH/OH
         ai8TkQzbEqsHroNbB1V3M9DD9yNwvK3tXiw/uXgT+Ogo5sbVW6g+oCYn2c453Nqd3zVB
         v9ShFIjp2rqleT3Iv8/HCuNFcvPIlU11NtGmdz5Et7PSZcxIfrcLU+ftp0EO3e6T6r+N
         6WSwG4pSp1v6Ve2gQL00M0XoZYf8+XE4FrWVhQJI0OHJqc+qYe8tu769sjRaZVsuSYxe
         Kb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710528; x=1690302528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzpB2JeeP/+5LJQoX+DM+hKB46MUVJk8x7crRJkVgqQ=;
        b=NLO8hscLdFKXeW/RYA+v/6+Hv3yaCMflZmyb8DO9xJp8mKbJw2dL+hfOyQIwyHrLw5
         KmS3rHXnHlDCwH56QWUnVEHu662VX6Cp/32abSyeSqt0mKvZ8IucMlLZh8165YoEBAGP
         nTvAYXAJixFlYjcLtNZvqYtaQVahZnydu5U2DF7xwDE+T57zNTWSFxg4uBeCsK4w7ts4
         PhGDfnSdwof7yYxrQqoPR4lfgUk+mgRqeaRm/32dIbVp+8L8w4qFZ/016A/dg2CoWWO0
         iEzexrZ2sDjrAHHzL4OnR12BdKqVPJH5Q+2B5CtVZ3LmIsXnDzXP+KXaClRmToD/idUm
         sVkw==
X-Gm-Message-State: AC+VfDyIy69rZYPpMR2cuE5Jc7B/fFBcYe9vUY6gpDAtW/o9/wKYLQN8
        zDgqL+qX5ssVRWRrP2Mnwv7Tew==
X-Google-Smtp-Source: ACHHUZ4KBfW7Fea7Y3FrHDdHbT5K0EUE07fzP91vtVhy9/tp4/vXfwQsSojK+LMA4y8QpGfb34uEiA==
X-Received: by 2002:a17:907:7256:b0:988:56d1:10d8 with SMTP id ds22-20020a170907725600b0098856d110d8mr19292632ejc.53.1687710528697;
        Sun, 25 Jun 2023 09:28:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:48 -0700 (PDT)
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
Subject: [PATCH v4 14/24] Input: melfas_mip4 - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:07 +0200
Message-Id: <20230625162817.100397-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
References: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
 drivers/input/touchscreen/melfas_mip4.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 32896e5085bd..2ac4483fbc25 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -1451,13 +1451,8 @@ static int mip4_probe(struct i2c_client *client)
 
 	ts->gpio_ce = devm_gpiod_get_optional(&client->dev,
 					      "ce", GPIOD_OUT_LOW);
-	if (IS_ERR(ts->gpio_ce)) {
-		error = PTR_ERR(ts->gpio_ce);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to get gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->gpio_ce))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->gpio_ce), "Failed to get gpio\n");
 
 	error = mip4_power_on(ts);
 	if (error)
-- 
2.34.1

