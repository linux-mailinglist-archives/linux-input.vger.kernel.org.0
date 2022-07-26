Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9968C5813AC
	for <lists+linux-input@lfdr.de>; Tue, 26 Jul 2022 14:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239068AbiGZM5B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jul 2022 08:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238808AbiGZM4r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Jul 2022 08:56:47 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26C2275ED
        for <linux-input@vger.kernel.org>; Tue, 26 Jul 2022 05:56:37 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id b21-20020a05600c4e1500b003a32bc8612fso8110628wmq.3
        for <linux-input@vger.kernel.org>; Tue, 26 Jul 2022 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:cc;
        bh=Pv8Wb/XUfgDvlUBb7xZCItYlnc14Qbd8klbk0fBR/cI=;
        b=JQC0LDeiyCTONLO9wJzCR3DZayr2OeSY97UtihVtK2Bg//mORTzwXNPQ+3bZvguNmQ
         G8HgNDfEkkPic2mCzlej2yTg5sJBWpWQOKJW4hmFNVLOtUNlTHZLmvnLaYTGO57swON9
         JnMb07hRleek6DOVe9ppMcxjCwr4KlqQ5aYSfJsjWJ43VFGGsOTp1NkHXUuBaFtIwwkt
         /bgJS8DYAK1Zn8Fw53JRW+sZoWXXjJs3uWAfYWySQg+Yc5Wpnwa6Ee7Xuue3cpQ89FD+
         e5reycwqnH7QxWvpijS7glQJuXIBJEVn4DgeAUml+0SWnmHj/ADspwBVxwBwtXp/TTOc
         0OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:cc;
        bh=Pv8Wb/XUfgDvlUBb7xZCItYlnc14Qbd8klbk0fBR/cI=;
        b=C4PRiYy/vW6YJRNjYsVCtPlhcptVQ4KxXCxYAmdiFiVcqm76qfhC/HDGUP8k9EPoXM
         1fKI4JoJlOrSE3QXGwUlBIVXW8fK584jTJaMoqRLj2lO2ukDBaFYo6vRSNv8+1u51Y0C
         OG0tJ0bkU+mYRnDYNuj04wDASnGa0PJ9yLOJwPWoccAO+e2C/QDMnoWmnfUEovBAcyfn
         GZk+RRC/55HXnoBEUmc3Ro36qHofGtxP3lu9sL2/SQNly7xM2Bg/GbBzEMYqgGcSJh0U
         emAZIwYX88hb0Dg/eJoQ8uiE6w9TK0iLR6gPCziIc96DpNZHHnJD9tGHrLEJBspZLwy2
         PTCg==
X-Gm-Message-State: AJIora8VZP/pesD8J3O6N3hRtvvuIxWQX9FSbIfULLPZJ6PH+PfKAIB8
        PxaIXi34iG9Z8J2Z+WQERBR99Q==
X-Google-Smtp-Source: AGRyM1vvvRdQPmoQCB+VQgE8Mf8j6lPcMzabj6A5fEyQBKVFOEwxFB9YOwKu5xXK1jyzEiBm23752g==
X-Received: by 2002:a05:600c:19cc:b0:3a3:3cfe:d548 with SMTP id u12-20020a05600c19cc00b003a33cfed548mr12225185wmq.6.1658840196274;
        Tue, 26 Jul 2022 05:56:36 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:35 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date:   Tue, 26 Jul 2022 14:56:12 +0200
Subject: [PATCH v2 7/7] arm64: dts: mediatek: mt8183-pumpkin: add keypad support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v2-7-6d42c357cb76@baylibre.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,MISSING_HEADERS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Fabien Parent <fparent@baylibre.com>

Add device-tree bindings for the keypad driver on the MT8183 Pumpkin
board.

The MT8183 Pumpkin board has 2 buttons connected using: KPROW0,
KPROW1 and KPCOL0.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 530e0c9ce0c9..a1d01639df30 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "mt8183.dtsi"
 #include "mt6358.dtsi"
 
@@ -122,6 +123,18 @@ &i2c6 {
 	clock-frequency = <100000>;
 };
 
+&keyboard {
+	pinctrl-names = "default";
+	pinctrl-0 = <&keyboard_pins>;
+	status = "okay";
+	linux,keymap = <MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN)
+			MATRIX_KEY(0x01, 0x00, KEY_VOLUMEUP)>;
+	keypad,num-rows = <2>;
+	keypad,num-columns = <1>;
+	debounce-delay-ms = <32>;
+	mediatek,keys-per-group = <2>;
+};
+
 &mmc0 {
 	status = "okay";
 	pinctrl-names = "default", "state_uhs";
@@ -226,6 +239,14 @@ pins_cmd_dat {
 		};
 	};
 
+	keyboard_pins: keyboard {
+		pins_keyboard {
+			pinmux = <PINMUX_GPIO91__FUNC_KPROW1>,
+				 <PINMUX_GPIO92__FUNC_KPROW0>,
+				 <PINMUX_GPIO93__FUNC_KPCOL0>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-pins-default {
 		pins_cmd_dat {
 			pinmux = <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,

-- 
b4 0.10.0-dev-78725
