Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02555FB423
	for <lists+linux-input@lfdr.de>; Tue, 11 Oct 2022 16:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiJKOGN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Oct 2022 10:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiJKOGD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Oct 2022 10:06:03 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466009083E
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 07:06:01 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l32so1055659wms.2
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=oeN7AuVArThx+oZbvGk/gwNM3VxNzLwYQcu5kLf064t/UKrU9mbakoBpL7DwitEohl
         298iSTW/oD/QWhw+DL3PJFt2RS/wiEDwDr64PKR4K1kWm8r2hddA9byQtIxmNWWbNAX7
         08u+rmWzu9tuG6+R43pxq0hAR+e/Hy6V0OdQaaGW034Vfr1SboxWFqPSY+ECO7JD7n9Z
         7Ezt5oWPC2AMNww6mw2uld4wz6MgH81ZpUJzwHmHsV8bc5y1C7vwcA+hBkNPDShZ5dwM
         uvvFUksJ7QVCa+QpFS2s1lML+Jf8hbAjHwLKzJgWvG1m3diXkJjzuQJyf7jV5vxwGq9h
         bcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=ct5KnFVxbxMaJQ18GYu1qTAOQsYXEJ3Jye+ab5sXcXpDaHeQVLLduVhUPOabcfbakC
         1ql39LmzSHfYwWkrIwU1V4dQYsyCZQcNdJB+lJ4sk57AF0BSsj1SrAxopufVKKbDgObE
         XGG5sZYMdYHvYhqBR4k6PMtpLa4ZNcVr+vKslV1uxQ1Xnp8WJ4bg1bQTXyj5MBlG77Jy
         rO5rqPcu/l5SHG2arKFvb5LCEMlmFIkzt+djdxrTnKtQy1Ssa0HMqHghM069yCIFTUsg
         0DAsE9gjFReA5Afgs33vz+5hUjeVu2+Wwlm71Ao224twPJlocas7GjO6ReCUvtrjWkZF
         1afg==
X-Gm-Message-State: ACrzQf0Wvn2bSGnI4hkQJVkfbCeZ330Cmo6NLx4ixe/ns0WISkIR7zFI
        4O62Kawtq5ZwmxmHYzsQOZGLjA==
X-Google-Smtp-Source: AMsMyM42TrPH2It7WZFATsERY+wRF8t/tkUrjtTIWgMVcBb1POnDMnwfNKW/tIIcbw0P2a1KnAL/Nw==
X-Received: by 2002:a05:600c:2b88:b0:3b4:8680:165b with SMTP id j8-20020a05600c2b8800b003b48680165bmr24926606wmc.113.1665497160582;
        Tue, 11 Oct 2022 07:06:00 -0700 (PDT)
Received: from localhost.localdomain (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d44c2000000b0022e55f40bc7sm11437453wrr.82.2022.10.11.07.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:06:00 -0700 (PDT)
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
Subject: [PATCH v6 2/6] DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219 external interrupts
Date:   Tue, 11 Oct 2022 16:05:45 +0200
Message-Id: <20221011140549.16761-3-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221011140549.16761-1-jneanne@baylibre.com>
References: <20221011140549.16761-1-jneanne@baylibre.com>
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

