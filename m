Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC7673D25E
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbjFYQaJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjFYQ3j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:39 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400E0E4A
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:18 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51d7e8dd118so2257653a12.1
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710534; x=1690302534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcWzH/RHmwMa3/x+/zg00uCVAY2MK7RPL3Qa0SH0q0U=;
        b=UlmhGix7s5v0WhZkyYVMXvB33R9ZUZPAYDNOZkYKTMgXi6rkhMM4Vc0XmOIFCG+VPJ
         Y/9NC31kGfA1YYnz7oOzt67TUwsNwLFNPK7n3Ve8KiHvQeNypruvpwoggl9xf8MZhH6Q
         wcrlngx+qd6mUA8fSlQ8K5JNLSGkFGxbMb5gOEriEV/xhbtkqHUoYBAZDZe5F5CTvzxo
         41xpTQR0TgfNUnVVjDuWmy8TrC1cy4MiZGz0AwLBy4XnnJ5IA9Nv56PJCGMlrsnDJuy2
         He6+gwMUR++usJd/7S0EdGCYRXktAjjB4PVcNQ+iH+1IdIjUaidrAOpYNdVoJQ0JpL6d
         fnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710534; x=1690302534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcWzH/RHmwMa3/x+/zg00uCVAY2MK7RPL3Qa0SH0q0U=;
        b=EDed4+inIi0GNV1Apf/qYWt2+AMu93j4cSIghX5y9e/5dQQjB5NHjR30u0UYMd3cYf
         BF/n/Gs9ilecrSYiZGvg2q3WeTmYPfi3vfsSvJ/XQaBe14G6+el8qyvC2etYPH7e1AMP
         HHW6othNT0gQc9YhivxcYtP6wFbwEs0jYc1D07YT80gyJonTdtaX9k/Ys1dyKUpKQKQu
         Ci0uOTIT4ZZAx2zSeneJxfd5FU408X6l/onaEnlPolV0lMy6uzorSFTfc4roTQ4Pgnm4
         WOPrFX8zwPjcu+G/+m48e265TLyISMt/D9i7vCAhZlpLgp963gmdETXtqD2JhwLomN3A
         faOg==
X-Gm-Message-State: AC+VfDwCKyPyfwT7ojMIMRv6+53V/49Uz5MJuSkVDaK+onIE0fnHIoqH
        112LVBz4glE7VVc8vSgMDqjmmg==
X-Google-Smtp-Source: ACHHUZ5luKl0u5pODvkSWW7OV5oi9JK3VKz1V/ffHGil8YhRFO4e+LGCOFQmaOEzMNU6Wu8kjAHvMQ==
X-Received: by 2002:a17:907:3d94:b0:98c:d733:bf03 with SMTP id he20-20020a1709073d9400b0098cd733bf03mr12217721ejc.43.1687710534201;
        Sun, 25 Jun 2023 09:28:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:53 -0700 (PDT)
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
Subject: [PATCH v4 17/24] Input: resistive-adc-touch - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:10 +0200
Message-Id: <20230625162817.100397-18-krzysztof.kozlowski@linaro.org>
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
 drivers/input/touchscreen/resistive-adc-touch.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index 6f754a8d30b1..7e761ec73273 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -210,12 +210,8 @@ static int grts_probe(struct platform_device *pdev)
 
 	/* get the channels from IIO device */
 	st->iio_chans = devm_iio_channel_get_all(dev);
-	if (IS_ERR(st->iio_chans)) {
-		error = PTR_ERR(st->iio_chans);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "can't get iio channels.\n");
-		return error;
-	}
+	if (IS_ERR(st->iio_chans))
+		return dev_err_probe(dev, PTR_ERR(st->iio_chans), "can't get iio channels\n");
 
 	if (!device_property_present(dev, "io-channel-names"))
 		return -ENODEV;
-- 
2.34.1

