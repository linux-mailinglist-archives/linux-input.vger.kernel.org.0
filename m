Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0125B6CF5
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 14:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbiIMMOh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 08:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbiIMMOd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 08:14:33 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEAA85FBC
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 05:14:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id z14-20020a05600c0a0e00b003b486df42a3so4257005wmp.2
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=fmRqIQSsCHZiGIEbB2N/fhkz+gQlMbzxAWCGOQmGCfa0S6PNK6a8tKuvGPtno7YKjP
         N9/HKOBjDFwTOn4slv2AvUG5aKZlDv+rXjxK86P2C0g8KjXd8EzTsc4vNJ9wEShJz7kT
         sgi7QcDf8g2nyAWAvknVMbo/OJiyV8+dofZlceGvQMhMqCyHqhgRX3MeQgwfb7m6icwj
         0lxF5zUjaGty7Uwt/CYFkHRnRHl4nTwZkBLufxYmLbaL9ghqcr6+sNPtAeBkngQt00Sj
         pargyyxxmVjPYnzZPdmjnb7YYZvT0BfrPOdWMdBI98KFP++xvkO3AnsI5ZD8/cxrtMRf
         RjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=m4knSZ+R25wXFFhXVUKOMVq5d0fGx7R6qCMsFgUTJQXgjGSgy+1MF+Rvc0/X6sXJOd
         0NxuAjgCcfZj2z6G8n6hE3vw3hmR3N32g/O7v/EJm7qcfiNfXySQQoIl4uzDk6yJUIbb
         Lt5k1/rPX67GOyiaqBPvWSDitkJN+WqHPLcQSNTkXaEelVnMpfhWmOGt7rl7Y8Ye09Wl
         cHSstiiFhCfCXuSyOyqbOAr/jlddSNdCsnI2pgEiBeTBVvYtOi2I32WklMD+p5YnsIae
         ZzfS9VrpqeWF1lN1hxoGTbaCGHwn76jBLqifrbXVYhxZRD2/CIOfzSrYwDkufAyNR3tH
         XvkA==
X-Gm-Message-State: ACgBeo1l8PgW/u5eE0WQEVavbCB2Niw4Fy6inNbWPF/BmvRklYTYRlvo
        OJvzXCYsbZnRWwrfpil0oEEsyg==
X-Google-Smtp-Source: AA6agR4sVzhJVQGHj5sc/ss58KHQEIEDet4+td1dfYJmeDPZn+Jt3xx/nMavoTn4AOzBcVaOWVJWlw==
X-Received: by 2002:a05:600c:4211:b0:3b4:6334:9940 with SMTP id x17-20020a05600c421100b003b463349940mr2252285wmh.166.1663071271080;
        Tue, 13 Sep 2022 05:14:31 -0700 (PDT)
Received: from localhost.localdomain (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id p10-20020adf9d8a000000b00228634628f1sm10512230wre.110.2022.09.13.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:14:30 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee.jones@linaro.org, tony@atomide.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 2/6] DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219 external interrupts
Date:   Tue, 13 Sep 2022 14:14:15 +0200
Message-Id: <20220913121419.15420-3-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913121419.15420-1-jneanne@baylibre.com>
References: <20220913121419.15420-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Interrupt occurring on PMIC TPS65219 is propagated to SOC
through EXTINTn pin connected to gic500 interrupt controller

Needed for driver testing but official board support pending.
TI commitment is required before board upstream kick-off.

Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am642-sk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 565b50810579..1f7ce60ecb57 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -294,6 +294,12 @@
 			AM64X_IOPAD(0x00b8, PIN_INPUT, 7) /* (Y7) PRG1_PRU0_GPO0.GPIO0_45 */
 		>;
 	};
+
+	pmic_irq_pins_default: pmic-irq-pins-default {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x0278, PIN_INPUT, 0) /* (C19) EXTINTn */
+		>;
+	};
 };
 
 &mcu_uart0 {
@@ -352,6 +358,10 @@
 		compatible = "ti,tps65219";
 		reg = <0x30>;
 		system-power-controller;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
 
 		buck1-supply = <&vcc_3v3_sys>;
 		buck2-supply = <&vcc_3v3_sys>;
-- 
2.17.1

