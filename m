Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C30FA5B89FB
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 16:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiINOJT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 10:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiINOIo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 10:08:44 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CCD1834F
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 07:08:20 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t7so25856051wrm.10
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=wxovnf5KPHC5iL/G2DCCvsq9cB2n/hhE49OVBFVzwkI=;
        b=UqiPJZo0zb7b3pl7nCEzK05u/NTFiHU3ZI7CkUrRxxWSsqLwKkS4Jq07/Ub5UZ7fLq
         tz4z9x77jnKvG7Ydxd0x+fM1yn+fi81vrpHi7o3jlKcksFShCfUuUDCT9hcvlLgce5lD
         Wy/l8Qfi8cZwMGPEjXhInoSDezWIdJmX42JWqCCa3HCKYsho0JT7vloD7VLdz2tyU7pR
         I5KpmwU/4j7AQTLw6JAi+eys/NuXEIQNxQ17zZXtkp7Y4B88N5lC9aW91A/tpvbm9tlM
         3wfJvp+uhmFug+Twd+LgmXN4BtdNv7LPZ4g7ULxd59H16VD6ebruFKV0sQ5cS6QKnHdy
         3HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wxovnf5KPHC5iL/G2DCCvsq9cB2n/hhE49OVBFVzwkI=;
        b=y2d7FQdqbsF8rhRy6UVdcs52pAdW/qMV8KsP3EP3ipjMHjQYbN39anzCppBTL2j/GE
         TGNBpT8svB87mK5t22HnoetR0Bpjz/F+cr/5cVIPrvmBIoEIJ1+7ndDryLwNW4TWpPJ6
         eLOrpWoLsr93adKjZAZTgMaQj8MIbI7EoxCcdjEOe9XNo4pa7ekRZ0dixLw/famEdonJ
         tGD8mc6mT6YJVpEd+3BgZiQJGe0BVvzL42qYp5YXUHBMauTNC/qQ+FV+8hhIFsH+JtRf
         aRBusqbfZH0iPdwmd3UDrnzvngeql1MaTVIYfaRAR1GlkU2fSzgihHrsPQjl49VOmnbx
         Duig==
X-Gm-Message-State: ACgBeo2f6JkKbsnxfUqw9DmTSps+6g0ywSbx4vGZVmppeDr1cXJ6H1Pt
        bX8hfSL3jFkYeUwLJpE6yjObtg==
X-Google-Smtp-Source: AA6agR6Absj8GXw3jd9aGn1MlDbl9A+FWp3Yi/6SrE3er+NdSEeNTSLIMKQDRP5aWpYxFLzcv1WO9g==
X-Received: by 2002:a5d:60ca:0:b0:228:d77e:4b25 with SMTP id x10-20020a5d60ca000000b00228d77e4b25mr22059161wrt.139.1663164498366;
        Wed, 14 Sep 2022 07:08:18 -0700 (PDT)
Received: from jerome-BL.theccd.local ([89.101.193.66])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d654c000000b00228e1e90822sm13303767wrv.112.2022.09.14.07.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:08:17 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee.jones@linaro.org, tony@atomide.com,
        vigneshr@ti.com, bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 6/6] arm64: defconfig: Add tps65219 as modules
Date:   Wed, 14 Sep 2022 16:07:58 +0200
Message-Id: <20220914140758.7582-7-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220914140758.7582-1-jneanne@baylibre.com>
References: <20220914140758.7582-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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
2.17.1

