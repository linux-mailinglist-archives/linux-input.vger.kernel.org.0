Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2296B6688
	for <lists+linux-input@lfdr.de>; Sun, 12 Mar 2023 14:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjCLNR0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Mar 2023 09:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjCLNRJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Mar 2023 09:17:09 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F80155530
        for <linux-input@vger.kernel.org>; Sun, 12 Mar 2023 06:16:08 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id cn21so8324262edb.0
        for <linux-input@vger.kernel.org>; Sun, 12 Mar 2023 06:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcxV1wX7rb47JP+vxHLlW7kUDa4wWKVgvS6sgALwgGw=;
        b=ODbPQ7N7rdF7EFlId0JmuPvIklOktriiSsEKOHlymmDjBH/58fkmj87U42BbMmmhzq
         cRpzesIUgktIYROMCwsOISO2LdxA0d+eejbFUIReTiGoA3PfZXdgEwewY/1mxTkhh29t
         I0E7ytga8wv2xo8zowTdmndz9vIpuU4i7T326W2NvJjYWe3k0uY0GG8Dqvgs578pLz/a
         8l2WVOrhD/lFxI/iFdw90crbyThWlvt5SBWG54av//X6VxirivqwVkpUKYEIR1+PP2v0
         VETS+1yD5t+Wf4SlOfCYs2YH1y/KYNnyU8FVUAH+HVhZkSCu+Hh9zN68Q0/91/nUZ1b2
         82GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcxV1wX7rb47JP+vxHLlW7kUDa4wWKVgvS6sgALwgGw=;
        b=spESK7Az3KIAcmNmNBHmdbRSwUDZfH84CaPxgsMdOgt5gYsmGycfSvvu3Demp/76Wa
         bnxhGmKH/XFmOlFeZoUpPjQu8wPiDray1VWrdJ6L72zOggFlqCpq3Taii+xMHraj7RmJ
         8HtlDvNLsxFjI7nE6076QpJQSkC7v7unnuoXferdhJhgrK7GTzmH2PwAm/taTxmqQbTy
         2yBhGuZ6Y7hxoFVoZ0oWQ7I6AlRL7vlWEtn23PpqL298wqLgD9v9ymblcZcNbwSTXf4z
         0Cf5eSjJKDUgop//ZHesSOhupOpJhHQfn0YMXv5JJuTFlEb5kXF48FTyGJhEmRHLuSBe
         FaTA==
X-Gm-Message-State: AO0yUKXG1iAZm3sXOfLvEFaKGPEoU9NrA0+sh9AC9X2OAR2wVdSblV/Q
        7e+Kov5wODYG+947PlCL6xa4sg==
X-Google-Smtp-Source: AK7set/8w9H2snVcfgYgwSmNkJivUplw0WFZlSku0efRNPRGVxUfGIQBHRgRKDu2+ZZjdY1voLlADA==
X-Received: by 2002:a17:906:58c3:b0:878:625c:c8ff with SMTP id e3-20020a17090658c300b00878625cc8ffmr40766458ejs.54.1678626920485;
        Sun, 12 Mar 2023 06:15:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906399a00b00915d58e56f0sm2223493eje.77.2023.03.12.06.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:15:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] Input: bcm_iproc_tsc: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:15:14 +0100
Message-Id: <20230312131514.351603-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
References: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/touchscreen/bcm_iproc_tsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/bcm_iproc_tsc.c b/drivers/input/touchscreen/bcm_iproc_tsc.c
index 35e2fe9911a4..9c84235327bf 100644
--- a/drivers/input/touchscreen/bcm_iproc_tsc.c
+++ b/drivers/input/touchscreen/bcm_iproc_tsc.c
@@ -511,7 +511,7 @@ static struct platform_driver iproc_ts_driver = {
 	.probe = iproc_ts_probe,
 	.driver = {
 		.name	= IPROC_TS_NAME,
-		.of_match_table = of_match_ptr(iproc_ts_of_match),
+		.of_match_table = iproc_ts_of_match,
 	},
 };
 
-- 
2.34.1

