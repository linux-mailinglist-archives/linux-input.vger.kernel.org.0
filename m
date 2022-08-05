Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EB758AAAA
	for <lists+linux-input@lfdr.de>; Fri,  5 Aug 2022 14:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240704AbiHEMTO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Aug 2022 08:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240719AbiHEMTM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Aug 2022 08:19:12 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE1578210
        for <linux-input@vger.kernel.org>; Fri,  5 Aug 2022 05:19:10 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z2so3205910edc.1
        for <linux-input@vger.kernel.org>; Fri, 05 Aug 2022 05:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=MAf7g1yH66QfElwkollldhEjdf2FGegN5lxrXOLWjy0=;
        b=q53Kv+UgtLvMRTdzxh7yngF2st+EZQIAQtMXeXYFgUN80qdO1a5yYwmUS7OwbjzNh/
         TdghSQa8ufvvm0/kCWPmT01tq8rASXhI2s0DIPASdUfhD4g4xsh5rb6daUv+Rknl4tTM
         0XIo8FTW2bzLaZF5pBjfIJbt/i/mMktQ/fxJ6J33QE/wNROxAV1OhVJRi8x6er8VUyD+
         cz8+s6fTZ0hBw6zGQNcjoKTtO+bM88BYp2zn5+RCZVgTe5Y7NR8NQ4e7SToZQ3pxwGVW
         5AH+2DW1LTcJpsSfvL782ZAj32oP7FXQ714N5fTz8gpgu2V2BGt/LCyIa3jBME5ZLlrL
         4MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=MAf7g1yH66QfElwkollldhEjdf2FGegN5lxrXOLWjy0=;
        b=QjtMiFfp/g0PqVk9iQPlafvF1PD1lVHoyu4sMu1rwPcbb97STEy945yjSp9yPhOgdI
         vPXsWz5wIXkidSnowwLQ3YIrNv90wr6WdoVx5TOJuCtl3I6EohdeEcXr+mmY/VHcEYOt
         OG8qzUn/vhe2SpZ9u6xJdEyTSe9t2R3PS8JgTRNMmTvtYHMjr2uyG5cTEglIZ5ak8Nac
         RYzC5uFzmD4MfiXZj8f0tDfwc473zadZX2IuXVkDB5Y3nc5JcNU+k9fSWqonBzwMhNxa
         yQ0vS5LyVfdwaIZy1F1OXHXvehL3Op8FeX6i6hehW+E5uqb/VaMd+FtmwIsc//1N7Nmi
         qTvw==
X-Gm-Message-State: ACgBeo08tAQmViIIacZ9cyS00F6e8Fr5f8Elveq5iWkcVLeLHFoN9qVt
        cBG4wOZijSvSN5CVO/0gmlC89g==
X-Google-Smtp-Source: AA6agR7RIEEwPz8yN/vPznJuUdG7h5rxeImCRN2lvUK0/EQKUts6mozrxr0q7hOnmN7p3Svvhff7Sw==
X-Received: by 2002:a05:6402:611:b0:43c:cb2d:76c0 with SMTP id n17-20020a056402061100b0043ccb2d76c0mr6436094edv.425.1659701948521;
        Fri, 05 Aug 2022 05:19:08 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-5241-be09-b892-f882-607f-7a79.rev.sfr.net. [2a02:8440:5241:be09:b892:f882:607f:7a79])
        by smtp.gmail.com with ESMTPSA id kx13-20020a170907774d00b0072b3464c043sm1506111ejc.116.2022.08.05.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 05:19:08 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com
Cc:     khilman@baylibre.com, narmstrong@baylibre.com, msp@baylibre.com,
        j-keerthy@ti.com, lee.jones@linaro.org, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: [PATCH v3 02/10] DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219 external interrupts
Date:   Fri,  5 Aug 2022 14:18:44 +0200
Message-Id: <20220805121852.21254-3-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220805121852.21254-1-jneanne@baylibre.com>
References: <20220805121852.21254-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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

