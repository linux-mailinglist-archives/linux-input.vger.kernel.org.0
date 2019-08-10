Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E972E88738
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfHJAUo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:20:44 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37994 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfHJAUo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:44 -0400
Received: by mail-pl1-f195.google.com with SMTP id m12so6961221plt.5;
        Fri, 09 Aug 2019 17:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNJfm8Ss+ApMMqzSgCDSHSLWiJsY8AkFZaYFg0RkVX0=;
        b=u5LBeK/lFbp7JDrg6ei376G1hpLPlGEEBvDGA6+5DldfsPF4dLnKmzBJ9u+QdWO08b
         XE7NisxEqK8WqRRVWY4h7p838iiQzVxLFysxkj9v0UI2lwY6km6qU9Gn3x7QLJE4PHEv
         cAqaDKdfRurkhpntGEtaM/3KmCUkPvF9aUdjEseu5ovNMPA53a3ahL2jlKzr/cd5ZzVB
         0EZ7CXd0ahtqBbLC8+12foZpPuIWR6Gy/DXghyMdJtGSAZoBDEAm40VXEpRhHJE6tydM
         Bjgpe1qU3tN9t0kqRMy51bjN+QSS96BDF4M9HoSbzujRJhOZOyii8vO1VO9q/Wx2JElN
         aaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNJfm8Ss+ApMMqzSgCDSHSLWiJsY8AkFZaYFg0RkVX0=;
        b=NbGFunAvxZkTrU9F9Mm4LgvqXBA+zYrq+3q9PfD+6KyaGc0g9DLL8MeKXOPB6OeU8Y
         aXsw0B7JPGrGuOCqLjIaXEv/jzuvByBwB3oOd4Ndz4lTwlTbCGINtodUe5BVt3mk2sNS
         kdO5+uCeciVT0C4YXVC5Bklowj5efsfEoId9fnh1WTSWItsoBCsWMEl0lc5C47Eenrdc
         1wGtji1F7nc2vEc/Uguc9fj8IOjNucDQzbtg7PfRNZ6ml6piwdKhjzX0UUrGUfwHJ9A3
         T5P2l9srEMQVQxf+W8tr6JD2YJzouwKtcq5s4e6PfINhKmJWV+pfmPJei7lFWz4PDGje
         AySw==
X-Gm-Message-State: APjAAAUjolnqQDUX282cACz3IYe9p9H+TOIN4M6e1OIOXh0Ygcir23iC
        NYx2M4aELGqzqDrF53st9RM=
X-Google-Smtp-Source: APXvYqwjZYACV7aKSt/zij4/Jp6G9kGGa0/WrGJ98Lo25/Oh8BfTB4JcrB2JW0OSEDOw0qi7Gmuf8Q==
X-Received: by 2002:a17:902:4324:: with SMTP id i33mr21394489pld.108.1565396443559;
        Fri, 09 Aug 2019 17:20:43 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:43 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] ARM: ux500: improve BU21013 touchpad bindings
Date:   Fri,  9 Aug 2019 17:20:29 -0700
Message-Id: <20190810002039.95876-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In preparation to update to bu21013_tp driver properly annotate GPIOs
property (the INT GPIOs are active low, not open drain), and also define
interrupt lines so we do not have to have special conversion in the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/boot/dts/ste-hrefprev60-stuib.dts  | 14 ++++++++++----
 arch/arm/boot/dts/ste-hrefv60plus-stuib.dts | 14 ++++++++++----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/ste-hrefprev60-stuib.dts b/arch/arm/boot/dts/ste-hrefprev60-stuib.dts
index aed940bd65a8..b78be5f4c212 100644
--- a/arch/arm/boot/dts/ste-hrefprev60-stuib.dts
+++ b/arch/arm/boot/dts/ste-hrefprev60-stuib.dts
@@ -4,6 +4,8 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include "ste-hrefprev60.dtsi"
 #include "ste-href-stuib.dtsi"
 
@@ -23,12 +25,16 @@
 		i2c@80110000 {
 			/* Only one of these will be used */
 			bu21013_tp@5c {
-				touch-gpio = <&gpio2 12 0x4>;
-				reset-gpio = <&tc3589x_gpio 13 0x4>;
+				interrupt-parent = <&gpio2>;
+				interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+				touch-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&tc3589x_gpio 13 GPIO_LINE_OPEN_DRAIN>;
 			};
 			bu21013_tp@5d {
-				touch-gpio = <&gpio2 12 0x4>;
-				reset-gpio = <&tc3589x_gpio 13 0x4>;
+				interrupt-parent = <&gpio2>;
+				interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+				touch-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&tc3589x_gpio 13 GPIO_LINE_OPEN_DRAIN>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/ste-hrefv60plus-stuib.dts b/arch/arm/boot/dts/ste-hrefv60plus-stuib.dts
index 0f3c3b86bb20..9be513aad549 100644
--- a/arch/arm/boot/dts/ste-hrefv60plus-stuib.dts
+++ b/arch/arm/boot/dts/ste-hrefv60plus-stuib.dts
@@ -6,6 +6,8 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include "ste-hrefv60plus.dtsi"
 #include "ste-href-stuib.dtsi"
 
@@ -25,12 +27,16 @@
 		i2c@80110000 {
 			/* Only one of these will be used */
 			bu21013_tp@5c {
-				touch-gpio = <&gpio2 20 0x4>;
-				reset-gpio = <&gpio4 17 0x4>;
+				interrupt-parent = <&gpio2>;
+				interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+				touch-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio4 17 GPIO_LINE_OPEN_DRAIN>;
 			};
 			bu21013_tp@5d {
-				touch-gpio = <&gpio2 20 0x4>;
-				reset-gpio = <&gpio4 17 0x4>;
+				interrupt-parent = <&gpio2>;
+				interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+				touch-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio4 17 GPIO_LINE_OPEN_DRAIN>;
 			};
 		};
 	};
-- 
2.23.0.rc1.153.gdeed80330f-goog

