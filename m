Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B797BCFAD
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 20:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjJHS6N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 14:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjJHS6N (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 14:58:13 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A652AAC;
        Sun,  8 Oct 2023 11:58:11 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-351250be257so16648645ab.0;
        Sun, 08 Oct 2023 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696791491; x=1697396291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8MjhZIChqwGFfsu7+wv7ehcHu+Do5Sq2jxL2J+21PMg=;
        b=BAyX1cwDLkJWHzsQOXtkv3iQ3ddXtZbk0yqvnd/CTqklRsZ/VdVfyyFVZRuO1wZ+XB
         uNeuDbT+qrpTvPNuuPpRazVcfdNyZCbPkUItSLQKLAMhGhuvzbfv1/2aHvR9b7DdT74T
         DvNobrFLTWMA4bQGuRr/3/swfTVfKuey//5df4xjM63XsVxeyixGvwa6TYIjXOYVL3DV
         mzpXKJQoZNEkmZHCyqgVHwY4+Aba45OIJlosL7Tv4w9boZrDBM8cavSojTmw5yiizm4Y
         bhE9CB0IzbWa+wUE/rrSlX9qGYQOapSGovB0QsbiWk/76yMw+vmX3wgO+YpE/pOntmq6
         6vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696791491; x=1697396291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MjhZIChqwGFfsu7+wv7ehcHu+Do5Sq2jxL2J+21PMg=;
        b=lACuMzZioeTPev/PGYAK4BVDBSAfoM7t9YNRiwlp8dc42B92iJfb4I/m8Md7ylcBtU
         zqwG08gZpeGTxE1FwXV692yi+7Z/C7HiITPlUI8ypgIlExNgURdSFhAsCNxSG/c38ozN
         8njoSWrIwl+/eeVEc5iRmWKkKA3oioyTxm6VbZoBaUfF0latWS0/HiYSBmt6L6/RM5xr
         3ntoYI/wi8+LOdEzlOJaAl4/PZbUSVMcFVJsLQgHVtLi/zOhMfxZgnFQ5j8dBb4xE5ik
         HF9zMbpRCHeOlh9rPKi7snbRCIwuVMHL67lFkvyXyAzS/5oTqqx6L5IiWnnfTk7rOSA1
         GHQQ==
X-Gm-Message-State: AOJu0YxBKFbO0PtaR5rRiivc4xEXP9n/KY0XAg6xwwTudDqo12mwgeUu
        TsI6fWxrvPgE4UwHRKgLvIrKBvHMJu8vxj5M
X-Google-Smtp-Source: AGHT+IHyneyQwv4vXVxcAEKr/7ktYor5bWTJzAo0PskO4igXwQi+a9dJwhSB1rvCmOha2X96/wedjw==
X-Received: by 2002:a05:6e02:12c5:b0:351:2104:64f6 with SMTP id i5-20020a056e0212c500b00351210464f6mr17909173ilm.1.1696791490741;
        Sun, 08 Oct 2023 11:58:10 -0700 (PDT)
Received: from archlinux.srmu.edu.in ([14.139.187.71])
        by smtp.gmail.com with ESMTPSA id ij8-20020a170902ab4800b001bdd68b3f4bsm7906882plb.295.2023.10.08.11.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 11:58:10 -0700 (PDT)
From:   Anshul Dalal <anshulusr@gmail.com>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Anshul Dalal <anshulusr@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
Date:   Mon,  9 Oct 2023 00:27:06 +0530
Message-ID: <20231008185709.2448423-1-anshulusr@gmail.com>
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

Changes for v3:
- Updated id field to reflect updated file name from previous version
- Added `reg` property

Changes for v2:
- Renamed file to `adafruit,seesaw-gamepad.yaml`
- Removed quotes for `$id` and `$schema`
- Removed "Bindings for" from the description
- Changed node name to the generic name "joystick"
- Changed compatible to 'adafruit,seesaw-gamepad' instead of 'adafruit,seesaw_gamepad'

 .../input/adafruit,seesaw-gamepad.yaml        | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
new file mode 100644
index 000000000000..610c99594439
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/adafruit-seesaw.yaml#
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
+  reg:
+    maxItems: 1
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

