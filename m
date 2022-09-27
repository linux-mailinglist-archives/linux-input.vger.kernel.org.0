Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D45D5EBD72
	for <lists+linux-input@lfdr.de>; Tue, 27 Sep 2022 10:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbiI0IgW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Sep 2022 04:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbiI0Ifs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Sep 2022 04:35:48 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF36D15A30
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 01:35:35 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso8970697wma.1
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=j+3WjVpmzWdHSETe6MTOGRBFzbiixawFO2GaHu8QnVdGm+8wnHfDqoRJ1pYUEkxKu4
         s7FOegPUsUWCrn19OBgNNFfI7TAMkzF7iScw8M0SnhEnAeKpkfTnblNCzKlq/Dt2NxVE
         wH3aFvJPAS8eMsw/2b5CdcMCaDo+ExUimQdLDdS7WWfz/a1fp5bdhxlN3kcwhutYdYYX
         +WyhbFtqFaZEqnEhBf+bqT5pABl0pr5Admm2XXxXCjYX/mnxY60/0uSlAZNk0lHkfSui
         A9wUwpBzWeS4MB+1R/zrIqCyi0tDQJdVdJ60T2PlpQYBZ6EJIXLpem2kpLCqb4almQ1t
         yM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=pozB6zN/WH+eKqGiv6uB1SsYoUd4kpHqq3V8yF1VReCL5acaQTwAbc8tPIXTRNOLcm
         6/vJQFJCY9cqvJ4euvo4NBQ/LYh7+IjBXm+CCrEnD12UBx+1FmuR/LFWs1+cMsDWQVh7
         UDXZXNhY7/s8DCwUOECFrHSRjJWIaFRSX/AjvNjoxR5OUKTnMYIr2ovOvSUtsFPGoXSJ
         TXtVdciD1455SzhstvZmRwkYB909YoYOp3/UZmGKTZuBgfp79mg3tQIjLECX+IqPvdzO
         /VHr5XVTqR1NNp8FCqQqXl8zO97giKJ+k4yyQFK+5fXS5/ko09c17CvOt2hPI+ozK7T2
         hIUQ==
X-Gm-Message-State: ACrzQf32DL5TTjsGo9k5+kTWfhhbDNH1kZiJS/ieYoWwCOY2w1/lBH/8
        M9G4/6zTcRlJoW0y2EU0fUKpnQ==
X-Google-Smtp-Source: AMsMyM5AK/UA8fdaCxkDYvovDUyzYod/AA3J2TiDOJ0V33ExYFn8HhlnXZvoIK2d7Aae1oCt/EOOOQ==
X-Received: by 2002:a05:600c:548b:b0:3b5:95b:57d3 with SMTP id iv11-20020a05600c548b00b003b5095b57d3mr1745563wmb.153.1664267734408;
        Tue, 27 Sep 2022 01:35:34 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b003b492b30822sm1122120wmr.2.2022.09.27.01.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 01:35:34 -0700 (PDT)
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
Subject: [PATCH v5 2/6] DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219 external interrupts
Date:   Tue, 27 Sep 2022 10:35:16 +0200
Message-Id: <20220927083520.15766-3-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220927083520.15766-1-jneanne@baylibre.com>
References: <20220927083520.15766-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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

