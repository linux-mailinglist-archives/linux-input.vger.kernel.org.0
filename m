Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A549F619B76
	for <lists+linux-input@lfdr.de>; Fri,  4 Nov 2022 16:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbiKDPYC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Nov 2022 11:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbiKDPXx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Nov 2022 11:23:53 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071332B26A
        for <linux-input@vger.kernel.org>; Fri,  4 Nov 2022 08:23:41 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id a14so7527293wru.5
        for <linux-input@vger.kernel.org>; Fri, 04 Nov 2022 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKLm3c0Ax0RwyQg3Vkst8SF6fjIBP0oMiPrQPMQRGn8=;
        b=EST0Mno6ZcUNn35RK6/5T01htqzKrIy4DsFvjxw4NO45a0Pd7ld77pc1bAkwv2l8sq
         JqCD2+3nWNt/Ujg26yi2xFhxlB/SpwdLF6nYI6Hx05NCoL1TKgRFYkdhCzyUd/bpRGe5
         XzMP/HWHrjxUKBCtWJaw5YpNCozlDxNSmnO25z53F0nr94rMUWnG2Gp+1P56wzhpMbjV
         ANzJbH6tvLP0NMwTaF5Erl0o5rTR5kPlvYCrE4gix9arMK3S8ts2y5HlKwEwWl0CGuYa
         HmZwmWnMUDdEsqZ0GpNqP6WP/ohceRhe1emscNA4097HM4hTiEwON2gGRjFRcDipbjw8
         j8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKLm3c0Ax0RwyQg3Vkst8SF6fjIBP0oMiPrQPMQRGn8=;
        b=XHp/mMh+uUCrpK348McxKoyUSjX/aBiFhERZSum4OX018NQrhbDB9DIEkodYsr0InH
         g33BWLY5aFhhM0gebTlWKAdjIbuNf/rZSnxaezOdt0UuhaWQT7vhZ8Knmm73K25C9Nir
         UKV5J3gcDbZAzUHcXIXNOyJ7sCweCN47f87wd3g7YILdNE+kIE5JNG61XaqnLK6KIH8r
         eHuH95wdWiJ1KZx6IF9Za4gptaujre4mpMS37d6YTKleP47i1YY0fqqotenlU/OQlQL3
         t77rCQ0dNpCNzxmy38XcwQOtJ0H8MvF0B8/VUeZa1YiO3SDK1tygtjDmzndito2HsbvR
         No7w==
X-Gm-Message-State: ACrzQf3J+jbLAX52wyVTWG7y4GE1o2V7BokSSekChvnmBuC6qu83E2wr
        Xx9pVPJPyac5eQdQQVXwTS1ULw==
X-Google-Smtp-Source: AMsMyM5plT1v0BxoKm5y6MF2smf9QgdX0jb8O87uviwA0mbP2P7KKSRz+mtBkq42k0Mc6hxqG+3Odg==
X-Received: by 2002:adf:dbc6:0:b0:236:c090:905d with SMTP id e6-20020adfdbc6000000b00236c090905dmr19908171wrj.132.1667575420565;
        Fri, 04 Nov 2022 08:23:40 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l41-20020a05600c08a900b003b4935f04a4sm3689764wmp.5.2022.11.04.08.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:23:40 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        shawnguo@kernel.org, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, marcel.ziswiler@toradex.com,
        vkoul@kernel.org, biju.das.jz@bp.renesas.com, arnd@arndb.de,
        jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v7 6/6] arm64: defconfig: Add tps65219 as modules
Date:   Fri,  4 Nov 2022 16:23:11 +0100
Message-Id: <20221104152311.1098603-7-jneanne@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104152311.1098603-1-jneanne@baylibre.com>
References: <20221104152311.1098603-1-jneanne@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Development boards from TI: SK-AM64 PROC1004 include the TPS65219 PMIC.
Add support for the TPS65219 PMIC by enabling MFD, regulator and
power-button drivers.  All drivers enabled as modules.

Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0b6af3348e79..61ae9c0326ca 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -415,6 +415,7 @@ CONFIG_TOUCHSCREEN_GOODIX=m
 CONFIG_TOUCHSCREEN_EDT_FT5X06=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_PM8941_PWRKEY=y
+CONFIG_INPUT_TPS65219_PWRBUTTON=m
 CONFIG_INPUT_PM8XXX_VIBRATOR=m
 CONFIG_INPUT_PWM_BEEPER=m
 CONFIG_INPUT_PWM_VIBRA=m
@@ -653,6 +654,7 @@ CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK808=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_SL28CPLD=y
+CONFIG_MFD_TPS65219=m
 CONFIG_MFD_ROHM_BD718XX=y
 CONFIG_MFD_WCD934X=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -680,6 +682,7 @@ CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_TPS65132=m
+CONFIG_REGULATOR_TPS65219=m
 CONFIG_REGULATOR_VCTRL=m
 CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
-- 
2.25.1

