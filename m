Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3B873D22A
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjFYQ2d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjFYQ2b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:28:31 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4261A4
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:30 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98d34f1e54fso226250466b.2
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710508; x=1690302508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RFM7q0XUB/BPBex5dV6DFuQg1MifJuVODWi1OqzZMI=;
        b=nhEOiQn20PfGaXL3/ExuEYiZ5HhwbowCQ8DuAbnO38IEqytDerd0mBUBIhC8vLJ4xD
         4FmI7zaJFbIe3UhWB5oQ1phAfwybavGrzsdx2IqNshnHScdkcF6KvsG5oZQFsjac86jQ
         J84haSDvvLvGrqs2BaKLXt9IUWEaiGP2HtXu5d3BfOFxv1yZ5529Qa+Fnl3CkzfbUGB6
         mA5jK67V7fuNVYTfuE9qzDDHjswvbNqF9+sNs/S0addld1mtd4tKa8FQME5mXxp2VMSa
         9IX+qCtyW07vnz/WmjR0rzvkGJhBoip8op02F/XziRguPwhkJ/Q8K5kTBXOy3MwiY3Wi
         GdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710508; x=1690302508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RFM7q0XUB/BPBex5dV6DFuQg1MifJuVODWi1OqzZMI=;
        b=SC70UXPEnXDzNcYAxxhBHQtIf1R0PEmQcsAOUImYOdX8GJF/Jfk6VxXyQRUt10iDce
         fqPrIJ2REmQDMM4G9JsABALe1NiBLLxHFsRR16dgpMY4aLSf0ffC/70YAJIuZfcPBDCx
         vnu4sagyo+RTixvFm3Xvk1jpYG5ma8i+Bj/lSguItG2RsFOPJax6wGIv8KajjoMsxTA7
         +kFUwg4bTV6qlRWBCSM8pkKfhsSF4n6cY4OOtH1wVGXG+3fd74ckx2Dy12UwpQrbdTJu
         C3qFV+q4QBvyF/dOO/V1FAPBaFEm4C8jgd0RDDyRZlx9v4KJaSOWdmxDl7QI7TkEPm8b
         PlnQ==
X-Gm-Message-State: AC+VfDwn4Wn43b7jjEQnrdkjeGRPCOIHhf58N9M/zBBElZj4pR5VkMgX
        a/44yb3Y8vJCee1lhyHY9jdzHA==
X-Google-Smtp-Source: ACHHUZ4e6cef4EZ52A/Qs8HD/Na/zXaoD/gPZYa9z7iVoKgnBf1LIi/G8cnlxZAPXTJKHusQFJ8BKA==
X-Received: by 2002:a17:906:9b8b:b0:98c:ef87:17ea with SMTP id dd11-20020a1709069b8b00b0098cef8717eamr9115555ejc.13.1687710508473;
        Sun, 25 Jun 2023 09:28:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:27 -0700 (PDT)
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
Subject: [PATCH v4 03/24] Input: pwm-vibra - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:27:56 +0200
Message-Id: <20230625162817.100397-4-krzysztof.kozlowski@linaro.org>
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

Changes since v3:
1. Rebase, adjust to new driver changes.

Changes since v1:
1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
---
 drivers/input/misc/pwm-vibra.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibra.c
index 2ba035299db8..a3cde30ee8d2 100644
--- a/drivers/input/misc/pwm-vibra.c
+++ b/drivers/input/misc/pwm-vibra.c
@@ -140,32 +140,20 @@ static int pwm_vibrator_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
-	err = PTR_ERR_OR_ZERO(vibrator->vcc);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request regulator: %d\n",
-				err);
-		return err;
-	}
+	if (IS_ERR(vibrator->vcc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->vcc),
+				     "Failed to request regulator\n");
 
 	vibrator->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
 							GPIOD_OUT_LOW);
-	err = PTR_ERR_OR_ZERO(vibrator->enable_gpio);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request enable gpio: %d\n",
-				err);
-		return err;
-	}
+	if (IS_ERR(vibrator->enable_gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->enable_gpio),
+				     "Failed to request enable gpio\n");
 
 	vibrator->pwm = devm_pwm_get(&pdev->dev, "enable");
-	err = PTR_ERR_OR_ZERO(vibrator->pwm);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request main pwm: %d\n",
-				err);
-		return err;
-	}
+	if (IS_ERR(vibrator->pwm))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->pwm),
+				     "Failed to request main pwm\n");
 
 	INIT_WORK(&vibrator->play_work, pwm_vibrator_play_work);
 
-- 
2.34.1

