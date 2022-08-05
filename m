Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF0558AAC7
	for <lists+linux-input@lfdr.de>; Fri,  5 Aug 2022 14:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240793AbiHEMUo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Aug 2022 08:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240812AbiHEMUJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Aug 2022 08:20:09 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E977A510
        for <linux-input@vger.kernel.org>; Fri,  5 Aug 2022 05:19:47 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dc19so4658394ejb.12
        for <linux-input@vger.kernel.org>; Fri, 05 Aug 2022 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=Sb8YvNB59ODw1an6ha6Ie3iag8hDt0GZw+CZTxlCMRc=;
        b=MWt382uJO5dILVUI3JyjixhKUvoKabVNq8ZEzM+v+aAiBNJDdOddUayN5fXs4JXN8C
         m7vMNueJ5wj/9mdXiYdCQpzXo8ty1BfkK/8+3ZpS8HuvkeeMqC33iNFeCD7nS37+qJR9
         dXRuDA48OC2aC5WF+bPRqKE+OXD4TCNDbOiDaPVJrX9qlMIqZ3YHFHaYl5VM18cAxUly
         d+DjxRaTzF5H9CXGJdcTtL/Srmz9pmabQWXJBf19r0+8PSHkhyxfZ4niw1espmCLa2TS
         f2S8ZPT+aEFEDXvnPF2lPACNsHDuzAlCmrzuvVpYkJ4XVLGahm9o19VUJZifYJh3N3cs
         gFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=Sb8YvNB59ODw1an6ha6Ie3iag8hDt0GZw+CZTxlCMRc=;
        b=YNG0085gzwLBvPtcFllCRz27I/s3MIRaNWvV4sg2tfXvmYw6Hm5eK2wYiydrluaYcT
         wapytORD2+1MI3HNd1EY2/2EqmTsf3EETyDPM0hwKGj2dt9aDGkYFJQ2BnYV52qamVus
         C3fzSPwAh1iQvnyknm9ElmGcWqUzF+rh91jMSrJL4yFcGQSfBVTcC7AlRCcCioWcZYFB
         kNdcEK4ZksVcoftuMk/qo7H/CaM1U+clgE1efIdqtf1ItNuBjFd1ldl4XDxJtaOCHRX6
         XJ38znHORkNlLPLY32hOvTuHp3+sYXmmepLSRuRyf26f29vJiOeZ3ThMcmof7Ch/zXIf
         ZKJg==
X-Gm-Message-State: ACgBeo2o+gDhpBX5HxV7Ot+/C02mSuupmbHobtPm6e1U/OY2S0eThuda
        H4jJEdtfkMJlurKeX7i+wzFgTA==
X-Google-Smtp-Source: AA6agR4jbzi6qTGaK1l/Q47nB7mzGrUQT8Ocd6+d8ebwjA/2eV+ceRVHwhYbHsLTYRZ6CgV6LafJRw==
X-Received: by 2002:a17:907:a06a:b0:730:d10e:fff3 with SMTP id ia10-20020a170907a06a00b00730d10efff3mr5314861ejc.109.1659701980966;
        Fri, 05 Aug 2022 05:19:40 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-5241-be09-b892-f882-607f-7a79.rev.sfr.net. [2a02:8440:5241:be09:b892:f882:607f:7a79])
        by smtp.gmail.com with ESMTPSA id kx13-20020a170907774d00b0072b3464c043sm1506111ejc.116.2022.08.05.05.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 05:19:40 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com
Cc:     khilman@baylibre.com, narmstrong@baylibre.com, msp@baylibre.com,
        j-keerthy@ti.com, lee.jones@linaro.org, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: [PATCH v3 10/10] arm64: defconfig: Add tps65219 as modules
Date:   Fri,  5 Aug 2022 14:18:52 +0200
Message-Id: <20220805121852.21254-11-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220805121852.21254-1-jneanne@baylibre.com>
References: <20220805121852.21254-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds defconfig option to support TPS65219 PMIC, MFD, Regulators
and power-button.

Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
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

