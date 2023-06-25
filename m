Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA45F73D230
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjFYQ2n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjFYQ2j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:28:39 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9050E47
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:33 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98e39784a85so112976066b.1
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710512; x=1690302512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPKeL7lVmp8Soof/ln2U31l7XizNuOwP3sGcJXVZD0k=;
        b=B4fRDAuiQqILSWHSlozP4YL2+XYH3g5ulDM5J47jCaz0Ivv60eFwmhqjMOwaZGbd96
         hxd8LFPjBvQMkmBgkDV0H/EjhoECy8yOEUD21Ai3k/8sJf7qMQSCWeJjQM9+0VDJh0uR
         xPRZh8ehs+Y/n4aAwmqvUdkMCLvCIQKVdxhhb8UIBmRL42m0bnBEQJumd8AqR2fw8WD7
         G9NpD3WoX8o9cV2YgJs6NYk2ISOBthE+Cz+lJtzb5H6vgfqFizakQsDQHTigtHCk8IIn
         x4CK0zCnqmFkDsre7g2VwcX7NN/0e3o3OqXjjJQ7YZi63l8J4CM0lgVvuxZegvhtcLTJ
         L19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710512; x=1690302512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPKeL7lVmp8Soof/ln2U31l7XizNuOwP3sGcJXVZD0k=;
        b=SSWOTwoupTPvXbH9/8W76UbNELNndu6kn6/8XXooN+LxGohxFkbI8V1ZNXvdd0iK+5
         3Rl7VfO5k0hMTjqouZHlFCKAcJUk4r+cVhGiFD4GtpbT4YQvMSauyKQM8lAI6K08dpdj
         f3VrR0HZ7iJasaPI6iJkLZsL7whmja60IuOmnMnFqtDkyYZJKdcdAakWY1sI95/2j95+
         yfsX2zTUHcpZn8KWXl1TlWQoKeNS868vYNm9C9c9r0OfqwxkVTu1sdI3xJneRIVM2dLv
         fTnt6btYs/ZQKj0QYvSxu3InfqQ35anS31bgC4BQqw4ZRBLOE64R/W6J9th4rM7TtRtn
         W0uQ==
X-Gm-Message-State: AC+VfDyfi/tknHeGIsE6CS9Nio0nSTu2bSkgSxWh9GpTpuGvhuLJnoe8
        HcwKMG/ZR2MbKyaSSVMa3dkUdw==
X-Google-Smtp-Source: ACHHUZ7K4jyIb6akS68Y3sFCEpXpEbbLe8JM06gLYAQ+/RnuFIRM6GcWPHBgFKAj9ksmeT9G42aSRw==
X-Received: by 2002:a17:907:7ba5:b0:982:4b35:c0b6 with SMTP id ne37-20020a1709077ba500b009824b35c0b6mr25993200ejc.1.1687710511965;
        Sun, 25 Jun 2023 09:28:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:31 -0700 (PDT)
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
Subject: [PATCH v4 05/24] Input: elan_i2c - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:27:58 +0200
Message-Id: <20230625162817.100397-6-krzysztof.kozlowski@linaro.org>
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
 drivers/input/mouse/elan_i2c_core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 0cff742302a9..148a601396f9 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1221,13 +1221,8 @@ static int elan_probe(struct i2c_client *client)
 	mutex_init(&data->sysfs_mutex);
 
 	data->vcc = devm_regulator_get(dev, "vcc");
-	if (IS_ERR(data->vcc)) {
-		error = PTR_ERR(data->vcc);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'vcc' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(data->vcc))
+		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
 	error = regulator_enable(data->vcc);
 	if (error) {
-- 
2.34.1

