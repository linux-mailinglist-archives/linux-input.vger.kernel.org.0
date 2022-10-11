Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64E85FB42D
	for <lists+linux-input@lfdr.de>; Tue, 11 Oct 2022 16:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbiJKOGk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Oct 2022 10:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiJKOGT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Oct 2022 10:06:19 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4CA95AF6
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 07:06:12 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id j16so21787129wrh.5
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wxovnf5KPHC5iL/G2DCCvsq9cB2n/hhE49OVBFVzwkI=;
        b=DH/SoT0wITUGF88uMh2ROZmuK9cjDJ/nRr7WDfE6px/3tX7Vfr/FoOIiUTYOiF9+jn
         YOgqQ9e6jW0sLB4AaevSHG290ExfzAHTsCX3fZ6MQ9HEhO0L4fN2tVcy7q/N8nHLz5m9
         ReL3op0wFuQfvyR+iVM0q2QSUewHTIArPrNCzOzWBp/QTCF7tdAjoAHIO+BFzLskVJvq
         ljjr9D8gzXA0iJy/MjR/TUkUsOEyeaGz0s1tPS/UC1ND0BhmA8TL1K4ATUIUUJwGDJbI
         X5CZd9FGV0tQY89IxA+cyNYCVa3ej10B7kU7MnpTbWY9De+alEnJIrk9Suj7KL5f50ie
         ESKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxovnf5KPHC5iL/G2DCCvsq9cB2n/hhE49OVBFVzwkI=;
        b=NfzkpOApBA98F3EyO3sqcS0HTShzq1xO8OxN/hM55uy9E1Uw78djDj/u0cgrpHM9PH
         4o+u86Bkgg7l0v7K3Kd6dZcNMuqqvVxt6Fv1bRAFLovVbePqO0Uzkp8+xj98i+VfYxsu
         ofcvbd1DWUfVRGFkVu/n71zjCUvZrFEvyeZKDKZHOoR2YcMdBGsTlPipwYFgVMgrx1IX
         igzUOAdmZHlx82L79GBlrnjkVGD+PzvVl9ZEzmn2y1vuaJ700zuAn7NljecVS2CRwMxl
         LZFPU4LIcTaKvUHsj8KFJzK1vH+0vrsJMP3AFocJGzLJN4IoZ3wEtxeDTzkcDR97MS+G
         seNQ==
X-Gm-Message-State: ACrzQf10o0N80IkbzRPlN+URDUCLMSqUCsMckBsuAofhILIK7Pdh8ZQy
        ZzINW7vbZ2n4+XRI+cmQDu/zqQ==
X-Google-Smtp-Source: AMsMyM7St/4AzKTmYF8VoJKAU/rwjst+scZir1Gz1v9WV1F9VbgDMyy8GRFqA5twBa7xST+afZ5cpw==
X-Received: by 2002:a5d:6745:0:b0:22f:ed4:65d7 with SMTP id l5-20020a5d6745000000b0022f0ed465d7mr12823623wrw.259.1665497171065;
        Tue, 11 Oct 2022 07:06:11 -0700 (PDT)
Received: from localhost.localdomain (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d44c2000000b0022e55f40bc7sm11437453wrr.82.2022.10.11.07.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:06:10 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v6 6/6] arm64: defconfig: Add tps65219 as modules
Date:   Tue, 11 Oct 2022 16:05:49 +0200
Message-Id: <20221011140549.16761-7-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221011140549.16761-1-jneanne@baylibre.com>
References: <20221011140549.16761-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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

