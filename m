Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 699CA7BCF62
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 19:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbjJHR0b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 13:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjJHR0a (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 13:26:30 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41835B6;
        Sun,  8 Oct 2023 10:26:29 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c87a85332bso31540615ad.2;
        Sun, 08 Oct 2023 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696785988; x=1697390788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Dl+sRwhA+6/vcdeQRfaxz6sNb8CQXRuiO63sXIRhzc=;
        b=BwjUX1OMaD8ih1oOmJffSg/lCRmtdgvg8FO3cefI+rGN2MU5eutr9Pw3phDeiMIZI9
         i7/pc7GNdXbaF9hQPZ5w9NZlVHZUYwR96S6w1fJOhEu9j959GA5ewPk+zwpJ3LvQUdPV
         U5zi4S2wFiRHJUZAwKvz/cgWrl+7pW2E0OCVuH431gpYC61OliaKXREtOW5KhMxgamt+
         EiAc9p0Kxpbb+CR3HBbu2Ds0VbrExxo11YJphVu3p63v2ZjOvNehc5VEwX435bxgl+XW
         SSkwnMOgfmKn3BDS75v1HfzMBVV8wFXmcN/MvSf72oJsSYxer3ZZo16tVTv85Q2sNhZh
         3ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696785988; x=1697390788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Dl+sRwhA+6/vcdeQRfaxz6sNb8CQXRuiO63sXIRhzc=;
        b=IWqiJCMwne8wVKiwnQZUTixOw06rEfvSKHLKVxjg5Flmh5X6E1qlcLoWvS6kpgRib9
         7qb/64+IqCFV1p8jxLROLE0w89XZnUVJ9kui3Yd1q39NpYTCj15yF8qLQpVwM6o2Sqb/
         CBpNaiTQylzkkBLoQAHcHB/pTxD1R/qvcSTD/rux20hMFeL4y/J+Q+He5eBK9C81EnJ8
         55IDPl2J0NhabA0/1017U055F1aY8z1z7lOZNgK+WZsUSwjsa9mrbYX4N7CHQ+W/WY4c
         xF/+GOQUjfkFm72prVcpy0Qc85z+BPkNR0gqW0XpTayTRqBsI7NDGUaqmzD0zO79jABl
         fiTA==
X-Gm-Message-State: AOJu0YzXG8ur7IomFvjIgCKtByED+HxAZ+/qczZf08v2ijB+OAg6QPyY
        GAbj4eNRbSZX1eXXfaIbrb9aVjJHTyNkXxxg
X-Google-Smtp-Source: AGHT+IFGmhCvkLPn4CQuz8nTXZjfyVSSTZ2rtNNnlboc8XS+9Tt+9LHj9/nPjyAFvPdyKaN8ccHZFg==
X-Received: by 2002:a17:903:230b:b0:1c6:a0b:7b9a with SMTP id d11-20020a170903230b00b001c60a0b7b9amr17382272plh.3.1696785988274;
        Sun, 08 Oct 2023 10:26:28 -0700 (PDT)
Received: from archlinux.srmu.edu.in ([103.4.221.252])
        by smtp.gmail.com with ESMTPSA id jb17-20020a170903259100b001c8836a3795sm7714918plb.271.2023.10.08.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 10:26:27 -0700 (PDT)
From:   Anshul Dalal <anshulusr@gmail.com>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Anshul Dalal <anshulusr@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
Date:   Sun,  8 Oct 2023 22:54:33 +0530
Message-ID: <20231008172435.2391009-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A simple driver for a mini gamepad that communicates over i2c, the gamepad
has bidirectional thumb stick input and six buttons.

The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
to transmit the ADC data for the joystick and digital pin state for the
buttons. I have only implemented the functionality required to receive the
thumb stick and button state.

Product page:
  https://www.adafruit.com/product/5743
Arduino driver:
  https://github.com/adafruit/Adafruit_Seesaw

For testing on a RPi Zero 2W, I utilized the following devicetree overlay:

/dts-v1/;
/plugin/;
/ {
	compatible = "brcm,bcm2835";
	fragment@0 {
		target = <&i2c1>;
		__overlay__ {
			#address-cells = <1>;
			#size-cells = <0>;
			joystick@50 {
				compatible = "adafruit,seesaw-gamepad";
				reg = <0x50>;
			};
		};
	};
};

I used the above overlay as reference for writing this binding. Though the
gamepad also has an interrupt pin that needs to be enabled explicitly (not
currently implemented in driver). The pin triggers a rising edge when a
button is pressed or joystick is moved which can be detected on a GPIO
of the Microcontroller.

I wasn't sure how to represent that functionality in the binding so I have
left it out for now.

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v2:
- Renamed file to `adafruit,seesaw-gamepad.yaml`
- Removed quotes for `$id` and `$schema`
- Removed "Bindings for" from the description
- Changed node name to the generic name "joystick"
- Changed compatible to 'adafruit,seesaw-gamepad' instead of 'adafruit,seesaw_gamepad'

 .../input/adafruit,seesaw-gamepad.yaml        | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
new file mode 100644
index 000000000000..af34f789da1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/adafruit_seesaw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Adafruit Mini I2C Gamepad with seesaw
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+description: |
+  Adafruit Mini I2C Gamepad
+
+    +-----------------------------+
+    |   ___                       |
+    |  /   \               (X)    |
+    | |  S  |  __   __  (Y)   (A) |
+    |  \___/  |ST| |SE|    (B)    |
+    |                             |
+    +-----------------------------+
+
+  S -> 10-bit percision bidirectional analog joystick
+  ST -> Start
+  SE -> Select
+  X, A, B, Y -> Digital action buttons
+
+  Product page: https://www.adafruit.com/product/5743
+  Arduino Driver: https://github.com/adafruit/Adafruit_Seesaw
+
+properties:
+  compatible:
+    const: adafruit,seesaw-gamepad
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        joystick@50 {
+            compatible = "adafruit,seesaw-gamepad";
+            reg = <0x50>;
+        };
+    };
-- 
2.42.0

