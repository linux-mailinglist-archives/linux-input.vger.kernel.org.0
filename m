Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2003B73D261
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbjFYQaJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbjFYQ3q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:46 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 619151736
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:29 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9896216338cso193272366b.3
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710542; x=1690302542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eG4JxfUU5OHHCechxQb+4pnO54NYHWPt20ucibo4lY=;
        b=vpgYRQDgbfrJZi4G3H9i5osvGe/QUrJCZaBZ6brT2dDynlvhwjMrnarKaXvQSmkDu9
         LEf0QicKYroQPJbEbe8927u7FbOzTMS/wcQkObAqvj/husrdLsBZHJC7X5A1CHZ2WHFy
         YkCMHJ9y9YZGBx+HbYiXVRkKH0WnYvrch4cXyVbRLa8MdEQckIob+hkQ5TznlSu1so4c
         CaZEG4/CvA2BQhDPT0N+C63/IHMVKQsKtS3btGTxZCq+JzALBAoG2SJt+zK65FsY02jF
         MVZdNKSnzqfDmtNZUQqK8But8lp/IA5oAJ6FmtYWQOOnccakW78mF+0hd90Wto2V7pDD
         M1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710542; x=1690302542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eG4JxfUU5OHHCechxQb+4pnO54NYHWPt20ucibo4lY=;
        b=dzs1/tmZvPJi1mbmCjnkIBhFdzUZ9p/Uwi8nmNxv6JgUqcjn/XxDQW+O883Bl4Klji
         br4kk8P3TICPwRBnXunN1sLE2IEqV00hpM1v8u0E/oh2aeBTEUg/0KU+t4n+nqEvNF4+
         X0Mwn5eGQGChb4N+x9fT7oaJZsaWaMWzfKpAx89w8aLUZe6y2H16IwwLFhFzAUhyn84k
         AcYbBwYv7JFUvl5Pwhd6J4yKtT50N8QWKKrt2R8JNS168O8iwR8L4zq5FdH0nldTk0yy
         4gNEkVq8XyRtdVx8b68KyB4eM0aS3XvKGUwSMccP70VR/cw93CrjgUcjC9n9sS5Z0PQb
         Eh3g==
X-Gm-Message-State: AC+VfDw+h6vBp3tXt4jw5+CPNJX5km6Qfq87dD/jgqQDGbKwxJ+6ksXW
        Zqp2wterbCB0XITQKmBzAuOw0g==
X-Google-Smtp-Source: ACHHUZ7Nfjp+egfAHh54srSRxyVh2PA3trwxm/iteOotlhhb/2Fm2fOdwsIIa4LhyHwcJMlWjUNuNg==
X-Received: by 2002:a17:907:7811:b0:98d:9dfe:e9b3 with SMTP id la17-20020a170907781100b0098d9dfee9b3mr4531048ejc.24.1687710541832;
        Sun, 25 Jun 2023 09:29:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:29:01 -0700 (PDT)
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
Subject: [PATCH v4 21/24] Input: sx8643 - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:14 +0200
Message-Id: <20230625162817.100397-22-krzysztof.kozlowski@linaro.org>
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
 drivers/input/touchscreen/sx8654.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
index 0293c493bc79..f5c5881cef6b 100644
--- a/drivers/input/touchscreen/sx8654.c
+++ b/drivers/input/touchscreen/sx8654.c
@@ -323,13 +323,9 @@ static int sx8654_probe(struct i2c_client *client)
 
 	sx8654->gpio_reset = devm_gpiod_get_optional(&client->dev, "reset",
 						     GPIOD_OUT_HIGH);
-	if (IS_ERR(sx8654->gpio_reset)) {
-		error = PTR_ERR(sx8654->gpio_reset);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev, "unable to get reset-gpio: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(sx8654->gpio_reset))
+		return dev_err_probe(&client->dev, PTR_ERR(sx8654->gpio_reset),
+				     "unable to get reset-gpio\n");
 	dev_dbg(&client->dev, "got GPIO reset pin\n");
 
 	sx8654->data = device_get_match_data(&client->dev);
-- 
2.34.1

