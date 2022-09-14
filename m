Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE4D35B89F1
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 16:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiINOIN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 10:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiINOIM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 10:08:12 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B204D1F5
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 07:08:10 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id r66-20020a1c4445000000b003b494ffc00bso3090722wma.0
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=BkAdeENHKwqWEpHuxRgoziL4TNybjrGvYGNqkfjZCBwMjRIOVUFvio4QsOiidm/7d9
         /TjD+GTV7C9L2GaIv7bhNS1hmzvK901pXgtRcO1MJe0YKuyvXEfr27I7c2v3botVkGV6
         CpH+nfu7E3StdgW/anuyUVuVYr4GQkVl4O8ps1LUeBtFz4759S2kZ1fQKdCs5nEspG+d
         P8RuQtQo31QnDE8QESjedSFVYGLwP2Z0VQ+MhrWgXCExPslxWPSFir6Lct4usiGsPqst
         SFSVWineq+l7ocPNwi6eqHQce/qK60QeKIPGfUnWVpErttM9RPjU6lk582hA5rWfZw66
         0i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=eRfxJvaseBJMyc50eulwEjBCLQDlygyDadEqFTl0vsgIFDu/xqu8qrrFTyrj7pZg3Y
         GciYlbDsx53l4siUy5Co2uby9Yo+vZy+6IaB3jngavUmyFG30H7DZchuvfZ9PDaeJWHL
         fAIxdBuVSd9ExYl4RqvknmX/JFV7y3m/MNffV6E3WrB2Jw8ssYTVITPGRrTJAFTiKwiH
         6BBX5dDY1fJK8yGlOz5WOfeJLyvWNY7sK+ett1S5ncpYmnE5YYs/5VTT2Xc4OI4rwOD3
         twpvHfYnyyH32BohLhiM4E33GQT5L/mbPVopdw51raPoZMvwH3wHALKgWaMCHdJxj+P5
         FQQA==
X-Gm-Message-State: ACgBeo00zumPabIwGogI/pS7YvSejquaS3cGaD3SJmsJuVP0FXoX96dC
        Kr+o1GF5E2l61BcSv07U6xYqSA==
X-Google-Smtp-Source: AA6agR6TUHCMwiJKndbdkVqQDxuo5HYtwVj3rRDxrOU54gZ8pAYbDeOFD4zB08JWHVAQ5Px7gCpCtA==
X-Received: by 2002:a05:600c:4ec9:b0:3a5:a567:137f with SMTP id g9-20020a05600c4ec900b003a5a567137fmr3388739wmq.46.1663164489272;
        Wed, 14 Sep 2022 07:08:09 -0700 (PDT)
Received: from jerome-BL.theccd.local ([89.101.193.66])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d654c000000b00228e1e90822sm13303767wrv.112.2022.09.14.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:08:08 -0700 (PDT)
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
Subject: [PATCH v5 2/6] DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219 external interrupts
Date:   Wed, 14 Sep 2022 16:07:54 +0200
Message-Id: <20220914140758.7582-3-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220914140758.7582-1-jneanne@baylibre.com>
References: <20220914140758.7582-1-jneanne@baylibre.com>
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

