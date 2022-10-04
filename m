Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCFDB5F3DB9
	for <lists+linux-input@lfdr.de>; Tue,  4 Oct 2022 10:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiJDIIn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Oct 2022 04:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiJDIIc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Oct 2022 04:08:32 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4272FC2C
        for <linux-input@vger.kernel.org>; Tue,  4 Oct 2022 01:08:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a3so7807577wrt.0
        for <linux-input@vger.kernel.org>; Tue, 04 Oct 2022 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=SDeP7eqQdNzc3Gc3v7xkWYwjB0Tw3W04qBb8bNWEu9M=;
        b=FsUyMwAiibb6YkuXA9FWYJB132KAYY34BaUkTram90h6YqgEZHElJUJ5l8TL9PdjAL
         O7ioqrZd1p8cBGAlqo7dDML6+0K5Yto2NUbPACXisqeFdcW/tzsM28YsijefA1HBzJ4t
         Rl9g/drFO+hla8LH0iCzdJQJOFvpxTtaJigZVMkK3NStooyw1ZDRS61mhS4jJcBDOMmB
         vOMXQ1Bkb0PpnPoRwmUXYcSEW8HD6Z/U/sbgRR9s/tzqwjc+0zvWtsVRPy5S8RJsMtCE
         O5FNgwJarzvTuxmDG72i3ZIfpYCyoqm8KVBx9CEPPGsJvUS6gCO0MYvsEMqblGBwi7cy
         pp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SDeP7eqQdNzc3Gc3v7xkWYwjB0Tw3W04qBb8bNWEu9M=;
        b=vv56zrUuNiuCp8Ns2viZGKWB9fxMpW7UeG/5x/PfsdPvc8U1z1jxRcoHnoHSN0HFP7
         yt3Rfy2KP49NpGsCAL61frPlUnWaSj7hAO7L//w9JL1mcdfZiGeRekhFvch9M+mHx9G8
         /6uZTLAt09uJRWIHrG0DYZt2RFHViES3J0KUkw44kF/j4rWVXm71kMZN7ZPzm7IxIC3d
         mNOEScZSljqnVer0UjX512eTEC4E5/o4KUA/9nCtwTSeZGagWzzVk0bNm98EyrFwZM3V
         vt8GlesHDBbXRkLvQ7tpGuCfpp28Rd08R1gukPpoI/0ZKHdTR6OeBFzenVATiZ0L67c/
         ZqVA==
X-Gm-Message-State: ACrzQf3/u3P8rPouAkwz2UcEJ1cGKDk6Rzlx89FVXLgbkDI/mfNFZJTh
        JLaxvbqBeY2nVhC9yfVZYaId9OifzEhZ7Szp
X-Google-Smtp-Source: AMsMyM66GLvCAxvCSCYkja17vzGP/C7XGU+HwN5Sj3ivIRxZE4ZpyaWz23jyzXJeRF6uXtir6qkceg==
X-Received: by 2002:adf:9dcd:0:b0:22e:37cc:421d with SMTP id q13-20020adf9dcd000000b0022e37cc421dmr6558023wre.710.1664870908126;
        Tue, 04 Oct 2022 01:08:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id l2-20020a1c7902000000b003b33943ce5esm20228866wme.32.2022.10.04.01.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 01:08:27 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 04 Oct 2022 08:08:20 +0000
Subject: [PATCH v2 04/11] arm: dts: qcom: mdm9615: remove invalid spi-max-frequency
 gsbi3_spi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v2-4-87fbeb4ae053@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org
X-Mailer: b4 0.10.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The spi-max-frequency property has nothing to do in the controller's node,
remove it and fix the 'spi-max-frequency' was unexpected dtbs check error.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index eaa3236f62db..366241dee522 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -170,7 +170,6 @@ gsbi3_spi: spi@16280000 {
 				#size-cells = <0>;
 				reg = <0x16280000 0x1000>;
 				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
-				spi-max-frequency = <24000000>;
 
 				clocks = <&gcc GSBI3_QUP_CLK>, <&gcc GSBI3_H_CLK>;
 				clock-names = "core", "iface";

-- 
b4 0.10.0
