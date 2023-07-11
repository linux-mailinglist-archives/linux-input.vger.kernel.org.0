Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6967774E7D3
	for <lists+linux-input@lfdr.de>; Tue, 11 Jul 2023 09:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbjGKHXD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jul 2023 03:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbjGKHXA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jul 2023 03:23:00 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81219EA
        for <linux-input@vger.kernel.org>; Tue, 11 Jul 2023 00:22:59 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992b2249d82so689253466b.1
        for <linux-input@vger.kernel.org>; Tue, 11 Jul 2023 00:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689060178; x=1691652178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldbk7xLpFOB3wCnK+tsupp7O8c/p1x/Bm1IetfW9AlI=;
        b=hSpwGle+ZQfU776LqBuG5WKZL1ooIzVolRu95jd9gzB9yWUPn5A/Yx5xzlNDZ/bRyd
         iiNZuHUGzzuy2d5QXEKYrNPaiHuRwIafz3XD3grKJkAnVkknDeIOUoaVTJKv2TxzPKlI
         ufaUarNX3hv1wjn483bDlima3EpBJtIfKkZQBnsLNytko8B/KRExl0Dw+2Oo2OwBNqXS
         cC27LtUhqtvOCsx0FiD84u4jx/C14wbAvQCmU9lz/f1Z7PEBq9Hae0FWsUi0mmEZ5plq
         2lNsKVLY1MLo/lFDoTNlj/uTIkAKGB6JvmeSAfPFlEFCKJTLddXX2I8rU+r2+7tp6UIP
         Xd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689060178; x=1691652178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ldbk7xLpFOB3wCnK+tsupp7O8c/p1x/Bm1IetfW9AlI=;
        b=gt+JmUBwLlsJzIHosxh7EdyOTbIXQv8xNywoiDtizakwr9+SpdHzML3gvDYmqADEuX
         SY0RinpsfzbxID2nxtlhW9yLtZuVqsQNcZN/U2wqRDwl0PUrr9WU2RknJJWODytJ0fB8
         K5SbkHxBbNrinHD9WGj6gEXv07MIHqYfZykCTDcsDBFdB3UYipACm2+K4PMzyz/cjlc9
         VwUrmp2L6VA4aV29y3U7O/xXTloxnvHI/YPjNObikOEQC/XBseFM2MOCLoNORHREFfl8
         yTf5CXspyAFdwLMKLbzTFMG17ND2qYKiXL7l/pfXdMjMIGTO23QYIOJYTwCktlO0pJAx
         zjgg==
X-Gm-Message-State: ABy/qLYqQGE0Nsk4BTBa6soNW3csPZe+YtW6jSlmRLtK40h5J0S/eBCW
        AFQNfgfZRhC0dc3Bw8JJLRF1Tg==
X-Google-Smtp-Source: APBJJlHHrtoIBf9lB7FASLEu/tEFi/mpCsdZT/vHgd9gteJyCcV0zEsRg5sakkjWN0uH61N/AGw6YQ==
X-Received: by 2002:a17:906:d965:b0:992:6064:f32b with SMTP id rp5-20020a170906d96500b009926064f32bmr14606261ejb.46.1689060177838;
        Tue, 11 Jul 2023 00:22:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t23-20020a1709066bd700b00992025654c1sm752588ejs.179.2023.07.11.00.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 00:22:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] fix Input: bcm-keypad - Correct dev_err_probe() error
Date:   Tue, 11 Jul 2023 09:22:54 +0200
Message-Id: <20230711072254.43273-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Pass proper PTR_ERR as dev_err_probe() argument.

Fixes: a2c795b696b2 ("Input: bcm-keypad - simplify with dev_err_probe()")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202306261505.wTjCXRIO-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/keyboard/bcm-keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
index 05b09066df84..bcc480ff7c3b 100644
--- a/drivers/input/keyboard/bcm-keypad.c
+++ b/drivers/input/keyboard/bcm-keypad.c
@@ -367,7 +367,7 @@ static int bcm_kp_probe(struct platform_device *pdev)
 	/* Enable clock */
 	kp->clk = devm_clk_get_optional(&pdev->dev, "peri_clk");
 	if (IS_ERR(kp->clk)) {
-		return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
+		return dev_err_probe(&pdev->dev, PTR_ERR(kp->clk), "Failed to get clock\n");
 	} else if (!kp->clk) {
 		dev_dbg(&pdev->dev, "No clock specified. Assuming it's enabled\n");
 	} else {
-- 
2.34.1

