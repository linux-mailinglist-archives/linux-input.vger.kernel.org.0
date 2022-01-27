Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99AB749E06F
	for <lists+linux-input@lfdr.de>; Thu, 27 Jan 2022 12:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240090AbiA0LPs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jan 2022 06:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240081AbiA0LPq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jan 2022 06:15:46 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3DEC06173B
        for <linux-input@vger.kernel.org>; Thu, 27 Jan 2022 03:15:46 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id l25so4033587wrb.13
        for <linux-input@vger.kernel.org>; Thu, 27 Jan 2022 03:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Issr/GTHNwZVejNrxQmDGDcXB9G0EQeUTGuqcjSvixA=;
        b=gJMkegCV++HieP031+dMKGWYR0bLuffs1xCsQDp2I/1x4bL13iEe9HP4FVZnQ9slMV
         ZERFDCfG8JIygTjY7SP7Kaw7BiRi3l9uON10ujd9Z0TW+z4wYQFiSmdCSukSJmK+PFpn
         9rns12c1OADrSKaLP4xM6aj4zOdaucyGPBhKdr6Bjijz3gHxISR4qNgK2Ko0radr96dA
         17tbnjrJz+/0OfdUzOnQ3Z6rbM4QR3QwOgl/JKqEstGLB0/VjhVqcgV3xSoKsSGZ3C5C
         ruC2fJTC6Ttqr+8Dv7EeL7/WGu21nqQAMF/hYl9GIHJPys6rQ/xBRu24XEM2u2qJ810c
         I7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Issr/GTHNwZVejNrxQmDGDcXB9G0EQeUTGuqcjSvixA=;
        b=f/Lnhzuak90nj88Z7IYomER79uCbYicevnz6pVsGMP2/Eh81zHsf2Lxtnp/GxYfAxE
         rvrMJUhfCiR6WkXKzi0bWsKF0WzkU2U12VrSN7AMnKB7pk4T8b55BK+njJCy9LjEsHno
         J94KzU6/Dzaub3/SQEk+FBenRrU8ZisQTbXPhxEsvgLmQWwH+FgNSTkld/a1qAwuqEjm
         WzdhapuXE55KCxX6hY19ekLNOiuepBFbSVDBteSjcd1Rw6JW7NmD9Tp9vQd39EjrEZ/x
         pPRVMLivjjtee+dlfOr6/Fo0S8xyfTQp10guLAl/mQWYUiKFgdda4ZFs0UueLiawC4HD
         trpg==
X-Gm-Message-State: AOAM5311MNI2vJY/TOLsDN0XSqrz/WXXNDVk5wEMYvleAyztU9+Hbp9W
        U+LvAfaM99X58vmNtPzthou8tQ==
X-Google-Smtp-Source: ABdhPJyYSqmwS3bfJTyGbBTcK2ikaGoPG+ScfYyYq8ahZaWYdOBnBjIifEe/TLLyH8qO3WxEZYsKYQ==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr2523734wrb.678.1643282144969;
        Thu, 27 Jan 2022 03:15:44 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb19:8b2c:5e00:7d3d:d638:46ec:78dd])
        by smtp.gmail.com with ESMTPSA id r7sm5956311wma.39.2022.01.27.03.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 03:15:44 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fengping Yu <fengping.yu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v20 1/3] dt-bindings: input: Add bindings for Mediatek matrix keypad
Date:   Thu, 27 Jan 2022 12:15:24 +0100
Message-Id: <20220127111526.3716689-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
References: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "fengping.yu" <fengping.yu@mediatek.com>

This patch add devicetree bindings for Mediatek matrix keypad driver.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 .../input/mediatek,mt6779-keypad.yaml         | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
new file mode 100644
index 000000000000..b1770640f94b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/mediatek,mt6779-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek's Keypad Controller device tree bindings
+
+maintainers:
+  - Fengping Yu <fengping.yu@mediatek.com>
+
+allOf:
+  - $ref: "/schemas/input/matrix-keymap.yaml#"
+
+description: |
+  Mediatek's Keypad controller is used to interface a SoC with a matrix-type
+  keypad device. The keypad controller supports multiple row and column lines.
+  A key can be placed at each intersection of a unique row and a unique column.
+  The keypad controller can sense a key-press and key-release and report the
+  event using a interrupt to the cpu.
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt6779-keypad
+      - items:
+          - enum:
+              - mediatek,mt6873-keypad
+          - const: mediatek,mt6779-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: kpd
+
+  wakeup-source:
+    description: use any event on keypad as wakeup event
+    type: boolean
+
+  debounce-delay-ms:
+    maximum: 256
+    default: 16
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        keyboard@10010000 {
+          compatible = "mediatek,mt6779-keypad";
+          reg = <0 0x10010000 0 0x1000>;
+          interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+          clocks = <&clk26m>;
+          clock-names = "kpd";
+        };
+    };
-- 
2.32.0

