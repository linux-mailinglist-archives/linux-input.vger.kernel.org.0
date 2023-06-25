Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC3673D25B
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbjFYQaH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbjFYQ3o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:44 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EFB11725
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:27 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9786fc23505so193135466b.2
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710540; x=1690302540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFNLWz5nb9xBhB40IBJoDah+KxzePJk8q7QGRODucW0=;
        b=ob0lMxAwJrExIVf3oDeXjQ+jA6kXqRF/1aB785MgbNcpsFJMzGAFqFqFU3QJ0Wx437
         lf0QxL+6yym9EKpnkTrjiXQrQVauNv88Ex2a2QmeV3DI9cHL9R6z2laDzsULdZ38iXPk
         bENqFNUI9+CT3IE4JUaecgT+iPnkQ6zSGhSYOQN7KALHcjUy/hTk8Wq9vhfkkkiYlb3X
         fjA5Tyu406KjZ5NozbmI1U710BcMxDQVNB0rrCFGYpRjGlmqry/P4F2XRtX4wxy3OF8i
         HLe+1P+BO9bOe9oMJ3TanB7IJemcN4HveJ7rSuASMevLNsP9iMKp3mFoRTBVK89M4PYQ
         9FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710540; x=1690302540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFNLWz5nb9xBhB40IBJoDah+KxzePJk8q7QGRODucW0=;
        b=ShWMyDagPP8f4ucHdfiyquGtU9DEi5tyWKincgCm0mRx2dZ2+dZWlUytRxEmU9lnJN
         JNj7KbTmp6YIb9FCp/46GWFuN39D5K+HYghfJafQQMNpklFiu1QFyr4DtaBynPRNbRxY
         WZG2r9qThci891ZLd03aKw1PivslE/AfgCzAh5eRd9Y6oarruhHPgp7UFaApHrqNsL7p
         2yeoOeefMJbHhoNKRlw2AzTNbIB/axJWr4d7TCmbWfFN2AYkxiC+TC50JOJMPC1rGHkP
         VesEvdKzb/h500uQZdQEzz/PzbO2fzhNR62WWbpK21Ymh4FLBIXDuvZ8uGaPCu+p84tr
         cIHQ==
X-Gm-Message-State: AC+VfDwJpI3L4Uf6twIYjVasC83YC5JvsYxRGO1o9qcNSnnighGD1i+9
        cCi/8jsaV8OpmeWl/WDRb8uztQ==
X-Google-Smtp-Source: ACHHUZ4IWpx7MtY7/2SvrmNwqXJvzmNUubEvlOsfgGHZlYizAAyyYC36b0mZ7/57mBFvOsRQ+jyjaw==
X-Received: by 2002:a17:907:96a5:b0:988:76ed:e55e with SMTP id hd37-20020a17090796a500b0098876ede55emr21352012ejc.13.1687710539927;
        Sun, 25 Jun 2023 09:28:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:59 -0700 (PDT)
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
Subject: [PATCH v4 20/24] Input: surface3_spi - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:13 +0200
Message-Id: <20230625162817.100397-21-krzysztof.kozlowski@linaro.org>
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
 drivers/input/touchscreen/surface3_spi.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
index 31d140248f2e..7efbcd0fde4f 100644
--- a/drivers/input/touchscreen/surface3_spi.c
+++ b/drivers/input/touchscreen/surface3_spi.c
@@ -221,7 +221,6 @@ static void surface3_spi_power(struct surface3_ts_data *data, bool on)
  */
 static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
 {
-	int error;
 	struct device *dev;
 	struct gpio_desc *gpiod;
 	int i;
@@ -231,15 +230,9 @@ static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
 	/* Get the reset lines GPIO pin number */
 	for (i = 0; i < 2; i++) {
 		gpiod = devm_gpiod_get_index(dev, NULL, i, GPIOD_OUT_LOW);
-		if (IS_ERR(gpiod)) {
-			error = PTR_ERR(gpiod);
-			if (error != -EPROBE_DEFER)
-				dev_err(dev,
-					"Failed to get power GPIO %d: %d\n",
-					i,
-					error);
-			return error;
-		}
+		if (IS_ERR(gpiod))
+			return dev_err_probe(dev, PTR_ERR(gpiod),
+					     "Failed to get power GPIO %d\n", i);
 
 		data->gpiod_rst[i] = gpiod;
 	}
-- 
2.34.1

