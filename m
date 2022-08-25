Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F1D5A151F
	for <lists+linux-input@lfdr.de>; Thu, 25 Aug 2022 17:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238804AbiHYPCt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 11:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242642AbiHYPCq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 11:02:46 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1F5B6D33
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 08:02:38 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gb36so40058142ejc.10
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=J40HRDC6s9A6oLiX10PU1EAnRqN6r80kqAAn+n+qgNE=;
        b=gYsrW9SLLedIZ+IWezg5Ovk5cUHtY7+V1539FZuhbqwZF7T9EOB6U3x/359QuZRT05
         K+uKOvtCEc7q3UEJNBIWlpne5v/kU2twhYjp3q/jzjvFfX5fGbFBiN9OLxTXl+XvzMMa
         +jNkZ+Aw7CTT8TO8hVbeWKe7axHyH81FIz+Mnpgd4gOyRQJCpYK2MFaB8cm4gNi/2ivV
         oUyq8xT5YfwoRfrE/3e5IlgLF37FVt6AKwoS0eCSE3N79uEDoQWJ/MKKMDebImmaQUUG
         d2J5+cE7SYxMMdO4vyHNF7OzuLyqOM49dKdKb7b8xt1qjBzmgxwfj/TpLVuWC6w05Buy
         i8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=J40HRDC6s9A6oLiX10PU1EAnRqN6r80kqAAn+n+qgNE=;
        b=d7yD2f/ClkJA+SuFjRn0Nqh+kp74XMBgbKG+RfIm2xWmUIXDwYNIj2kXPEQIZz+2hX
         K0ZIkZcz36pgADY4kK4wv9M8pOGAIVqzz05SvbADPsDXfzweA6/q7gkCZxDwoWW4xhJb
         DPy1VbUBTRe3UzN8jFvWr3/au5HRFaRLEJjuMfpusry3rJVid+JOOGkEasMKcdB/to6+
         JyB/W9V2B8UG2Bouiv9cUfLNrhJJm+n6bDejdrmJsIf/HMiIzflkVH70dqZUYb70Zo6U
         sXOkKJ06gAxl61MAMqKKO20oE+Jaa9OWDjsrFgNw3StXXKEEDdiJFoGX0AdvUavtXFXt
         gakw==
X-Gm-Message-State: ACgBeo2mtQGGCuylyr/52g0HOs5dbEOhl6FuieuWl9saXIzYqzyS5TNe
        7y1mqQKFBzpXMQuMOe2lpuIyhA==
X-Google-Smtp-Source: AA6agR7XnIqr0ef7oC0eqK9dRcF8Bcl7vMbGqte2rjFdlMpDF0Zabd+o/uu20fwEK9uPXwoFj/nBKw==
X-Received: by 2002:a17:907:2ce7:b0:73d:9028:8038 with SMTP id hz7-20020a1709072ce700b0073d90288038mr2770201ejc.273.1661439757477;
        Thu, 25 Aug 2022 08:02:37 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b00732e3d94f4fsm2548771eje.124.2022.08.25.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 08:02:36 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>,
        nm@ti.com, kristo@kernel.org
Cc:     Jerome Neanne <jneanne@baylibre.com>, khilman@baylibre.com,
        narmstrong@baylibre.com, j-keerthy@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 6/6] arm64: defconfig: Add tps65219 as modules
Date:   Thu, 25 Aug 2022 17:02:24 +0200
Message-Id: <20220825150224.826258-7-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825150224.826258-1-msp@baylibre.com>
References: <20220825150224.826258-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jerome Neanne <jneanne@baylibre.com>

This adds defconfig option to support TPS65219 PMIC, MFD, Regulators
and power-button.

Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d5b2d2dd4904..d64e00355fcd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -406,6 +406,7 @@ CONFIG_TOUCHSCREEN_GOODIX=m
 CONFIG_TOUCHSCREEN_EDT_FT5X06=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_PM8941_PWRKEY=y
+CONFIG_INPUT_TPS65219_PWRBUTTON=m
 CONFIG_INPUT_PM8XXX_VIBRATOR=m
 CONFIG_INPUT_PWM_BEEPER=m
 CONFIG_INPUT_PWM_VIBRA=m
@@ -639,6 +640,7 @@ CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK808=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_SL28CPLD=y
+CONFIG_MFD_TPS65219=m
 CONFIG_MFD_ROHM_BD718XX=y
 CONFIG_MFD_WCD934X=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -666,6 +668,7 @@ CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_TPS65132=m
+CONFIG_REGULATOR_TPS65219=m
 CONFIG_REGULATOR_VCTRL=m
 CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
-- 
2.37.2

