Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B92A6B6685
	for <lists+linux-input@lfdr.de>; Sun, 12 Mar 2023 14:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjCLNRY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Mar 2023 09:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjCLNRF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Mar 2023 09:17:05 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3659553725
        for <linux-input@vger.kernel.org>; Sun, 12 Mar 2023 06:16:04 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g10so9637922eda.1
        for <linux-input@vger.kernel.org>; Sun, 12 Mar 2023 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxOh2EN/qJCdB/AUoID7+RycsW+5mphdpysdI7Ju3Hg=;
        b=uyIkIno1RN+oNCDBVDI0qsGT2okSndTeXGTJcQFzXyprV1Rpjb734SmAziDONXGxEq
         KxPaUDhQJdZmOJPQ+kCwf1xmi38HS3pahM3FEvMiB/oqg41XBwD+fMzzqxSAPeb0dRJR
         Wh9pheSoCgsp8yknhNxTLubOA7/8HH8Nw1PjeVR22eY//P8Ea9eVHc+oc3a/NTRv69CQ
         iQyZuovlYjLABvFCfrdPYM1mAsKWLjgHkPDvpMjwW8Kb2CdkS8TRffHnpK/w9H/5fRY8
         BA/vZLPWwj2UxlMNQTmhYezIePKPThEC7pO/8SDa7b+Ok+fCXy/c7JqXwQWCMm95bJUt
         /Czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxOh2EN/qJCdB/AUoID7+RycsW+5mphdpysdI7Ju3Hg=;
        b=cSYiU3HrJxd4nR+jsJeOUPq4dSGHxyKYIYKHiZAvKbuZanm15NTSzVsE8EXu+cxMW9
         20A+7xNvS2uAT724P4w7asJZ2mY+qVTQvhfZC7Y3fTjElGmdjIK6BxOkgLfr83D8eoLV
         M3eUr4Q5hhBZXm1aeoHfeAjkiXjFceqsP4mGp5Bn9ZlO80QEItngZMzG/IWiia4OonpY
         d/PDiWTMa5bWL5jAjGAGsrAXY4hXBmunEBk6Daq0/32glY/8LAu6My7ksfDVJbHZXQpc
         Qo3odbW7ai5/vytJB5EEm0IpWTYb47E2UnsXscjViKEKNHSacnvUl5GYTcpK2DX+pGMm
         kyXg==
X-Gm-Message-State: AO0yUKXAjTuj+88K/1mbRuE6WB9H+jS2WPEUth3PQaE4/r80y56I+ZFV
        n3RZBSOd8lxhxecLCUZzRXKKLg==
X-Google-Smtp-Source: AK7set/+C4BR9bpjM2BaqwdAlwYB/vsQin3IgGjNtiYc74Z75FadUJiST2dmAagBATz/RoU3GzaiRQ==
X-Received: by 2002:aa7:cac2:0:b0:4aa:a280:55b5 with SMTP id l2-20020aa7cac2000000b004aaa28055b5mr7124337edt.20.1678626917875;
        Sun, 12 Mar 2023 06:15:17 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906399a00b00915d58e56f0sm2223493eje.77.2023.03.12.06.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:15:17 -0700 (PDT)
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
Subject: [PATCH 2/4] Input: tm2-touchkey: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:15:12 +0100
Message-Id: <20230312131514.351603-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
References: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver will match mostly by DT table (even thought there is regular
ID table) so there is little benefit in of_match_ptr (this also allows
ACPI matching via PRP0001, even though it might not be relevant here).
This also fixes !CONFIG_OF error:

  drivers/input/keyboard/tm2-touchkey.c:335:34: error: ‘tm2_touchkey_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/keyboard/tm2-touchkey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/tm2-touchkey.c b/drivers/input/keyboard/tm2-touchkey.c
index 6627e65f06e5..4e20571cb4c3 100644
--- a/drivers/input/keyboard/tm2-touchkey.c
+++ b/drivers/input/keyboard/tm2-touchkey.c
@@ -354,7 +354,7 @@ static struct i2c_driver tm2_touchkey_driver = {
 	.driver = {
 		.name = TM2_TOUCHKEY_DEV_NAME,
 		.pm = pm_sleep_ptr(&tm2_touchkey_pm_ops),
-		.of_match_table = of_match_ptr(tm2_touchkey_of_match),
+		.of_match_table = tm2_touchkey_of_match,
 	},
 	.probe_new = tm2_touchkey_probe,
 	.id_table = tm2_touchkey_id_table,
-- 
2.34.1

