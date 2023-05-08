Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 554196FB025
	for <lists+linux-input@lfdr.de>; Mon,  8 May 2023 14:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbjEHMfS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 May 2023 08:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234159AbjEHMfQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 May 2023 08:35:16 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D0D391A8
        for <linux-input@vger.kernel.org>; Mon,  8 May 2023 05:35:13 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ac81d2bfbcso47780981fa.3
        for <linux-input@vger.kernel.org>; Mon, 08 May 2023 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683549311; x=1686141311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulJciNp9+1XlKIBJfPg6D9fHgUw6mUDVehwtyecw6EM=;
        b=U5GXHAq4aJMBPrI1k9iVP7Kp1DyAp854W2N1KvoA7v70jUMtjgIvgwrv3KbG81NSMZ
         LSq6t2czDIX5nwii7BD8YWo1R78spiM8peQzpzqRLkQITpjpnH9GItCXdQU8EOBwKeue
         XlKeTApzwlXElHuC1v82EKApUd+fZ3WkSJLtxbhDf+X4IotkBgR2QwO1CahppYJsmFcz
         GLdBXC0qJHhEoKpjGdnon7ncA/DI1mqqdRRQB9x/onJRZ8kq9ZIILZ/9XgQSMqGc2ql2
         sex8ItGNuH8hHfFlZQGayN66qLdmOCr97Nau2ZJo1CkgwJOqawGWzYVFD6ATuBTF4NQZ
         uLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683549311; x=1686141311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulJciNp9+1XlKIBJfPg6D9fHgUw6mUDVehwtyecw6EM=;
        b=bMR0pKtl7iYAGO5EDpAtTdQ3uQCSgbZ9KZycSWLJXOjmH0l7K6rzWYLAXMNi2+XR0W
         7PJdt6LQ0sY7yfKfsQ/iGO9HCHyfaQp5yNMxHZg47l3LMnk2L+qLfiEykTIxQC4BgQKv
         sGbpiuzN5oU4kUYSIS6grIEfBbroUlUEwbfobMIV46l1Gv/O5EHcpUfOCTGjoOnM5ZnV
         Z8oxL0bkl3l3CULYD9i/e+yd/nbcYGaCrqIvnT1UkGT1Xfftdx/wrNU/crZw6fE1hBa1
         b8MkctyfH90LHx7oeESvcNudYFx5l9QLBUIhzWYhTxQDuns3C4H8W5VeMxq50cF/6FnF
         9C6w==
X-Gm-Message-State: AC+VfDzAsSBfhGoHn51MHHJfANnJrOCMKU5ClTKHfEM7GVOla8cBNj4x
        47wHBRNvSGteKb99fSJ2R2ObGw==
X-Google-Smtp-Source: ACHHUZ4mfWFKzmhz/Ro72qavdGjf9iBzwapKmzVAgSOO01+2A+P6ObB0AbSZv9OETX4tfyYdG2x5CQ==
X-Received: by 2002:ac2:51cd:0:b0:4f2:4d0a:7bde with SMTP id u13-20020ac251cd000000b004f24d0a7bdemr1256751lfm.31.1683549311405;
        Mon, 08 May 2023 05:35:11 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q2-20020ac25fc2000000b004b55ddeb7e3sm1289593lfg.309.2023.05.08.05.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 05:35:10 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 08 May 2023 14:35:09 +0200
Subject: [PATCH v4 1/2] dt-bindings: gpio: Convert STMPE GPIO to YAML
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230426-stmpe-dt-bindings-v4-1-36fdd53d9919@linaro.org>
References: <20230426-stmpe-dt-bindings-v4-0-36fdd53d9919@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v4-0-36fdd53d9919@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This rewrites the STMPE GPIO bindings to a YAML schema.

We add the properties that are used in the widely used
STMPE GPIO device nodes found in the wild, most notably
interrupt support, so interrupt-cells and
interrupt-controller is now part of the bindings.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Realize that there were actually some old bindings so we
  need to get rid of them as part of this patch.
- Fix blank lines after description: keyword.
ChangeLog v2->v3:
- Use a compact hog node schema backed by the standard hog
  schema.
ChangeLog v1->v2:
- New patch split off from the MFD patch.
---
 .../devicetree/bindings/gpio/gpio-stmpe.txt        | 17 -------
 .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    | 53 ++++++++++++++++++++++
 2 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
deleted file mode 100644
index b33f8f02c0d7..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-STMPE gpio
-----------
-
-Required properties:
- - compatible: "st,stmpe-gpio"
-
-Optional properties:
- - st,norequest-mask: bitmask specifying which GPIOs should _not_ be requestable
-   due to different usage (e.g. touch, keypad)
-
-Node should be child node of stmpe node to which it belongs.
-
-Example:
-	stmpe_gpio {
-		compatible = "st,stmpe-gpio";
-		st,norequest-mask = <0x20>;	//gpio 5 can't be used
-	};
diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
new file mode 100644
index 000000000000..22c0cae73425
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectonics Port Expander (STMPE) GPIO Block
+
+description:
+  STMicroelectronics Port Expander (STMPE) is a series of slow
+  bus controllers for various expanded peripherals such as GPIO, keypad,
+  touchscreen, ADC, PWM or rotator. It can contain one or several different
+  peripherals connected to SPI or I2C. These bindings pertain to the
+  GPIO portions of these expanders.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    const: st,stmpe-gpio
+
+  "#gpio-cells":
+    const: 2
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  st,norequest-mask:
+    description:
+      A bitmask of GPIO lines that cannot be requested because for
+      for example not being connected to anything on the system
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+
+    required:
+      - gpio-hog
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - "#interrupt-cells"
+  - gpio-controller
+  - interrupt-controller

-- 
2.34.1

