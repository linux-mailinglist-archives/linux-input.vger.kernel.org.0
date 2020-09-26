Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DE72798F7
	for <lists+linux-input@lfdr.de>; Sat, 26 Sep 2020 14:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgIZMsF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Sep 2020 08:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbgIZMsD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Sep 2020 08:48:03 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D755DC0613D3;
        Sat, 26 Sep 2020 05:48:02 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a9so2093349wmm.2;
        Sat, 26 Sep 2020 05:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/E0E86V4qlrZqRVabn3V9YxZrtSiuCT+gPTjZhmgR0=;
        b=pCuBBA1nbB/WZtk0pm+ZbbRvcgD/jdYKpHGZqtULTCTiqXfmutbqg/iF9hYEESGjPq
         wKHb7Wf09GCjNnTN9zXeZ5lI8oFeJCskb2F8Hc/FTX1gRuFgbfOZX2iLrMiKbSYO+ULr
         DdAmwIxBPlJ19khJZnXa/oTFx6JH5/F89i6d4RxzC6rGBjKJXb4M6FMLOqYAVcud+voX
         QAuMvLvYIXZlFPV8ru0RAUGiQP22Yk+m7fd4LFMT0rDZpgChX2jQQjW7zG6HpEqluH9O
         8Ehx4tiXO3Pihz3XUiSkmlgJ3RJlUSosv82UylJlaKga5aKSRpEK/ToT0RzI6xfouEZv
         R4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/E0E86V4qlrZqRVabn3V9YxZrtSiuCT+gPTjZhmgR0=;
        b=I2UzUQ76D3z6OVaTr8pGhj8e6hTMPG3dOJ2KOBiYU6e49v1yYhAirWP6eOzsZPijmJ
         9iHiaC8xv+4Ovh7mYzgN7+0yQsLE8sXW6/6NFHmhbveoIJ6CRNznGJl9dwG3eVTqshn2
         fLGk/wdTniY3Y/WZliumvIgFUkcVjfKwsKNk+kFEzZrEXiC5tBhYhVxn7L5XQNFD6h17
         7PVjML8aTrXCqZ9M82E4yqUx17Fz6dzKTn/1jLmY9HSfVR+QVjQgFR567+rgO/Ol911h
         2MZ2zaZrRO+Jmr/Kzuhzc5r5z7fKm2QpX0g+8jKZrEgWFgfnzyNduS0QgyE64dPskm2W
         YVMA==
X-Gm-Message-State: AOAM530CpurteD5KKOqz5wwc8vmoQkurVTGemb5WP2+dZbEoHUl2qgRj
        h60oUIYpgBY12+oeVsWBos8ytRj0/Ko=
X-Google-Smtp-Source: ABdhPJzmqf1Md66ASaM6u4QF+brG1pJfe/wnfqzKJ8KIaP47/Tqx6hwZtg/Ofci4lKzWEO6oyhpliQ==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr2442681wmz.29.1601124481521;
        Sat, 26 Sep 2020 05:48:01 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id i15sm6909901wrb.91.2020.09.26.05.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:48:01 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 3/3] dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
Date:   Sat, 26 Sep 2020 14:47:47 +0200
Message-Id: <20200926124747.12465-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926124747.12465-1-kholk11@gmail.com>
References: <20200926124747.12465-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add binding for the Novatek NT36xxx series touchscreen driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../input/touchscreen/novatek,nt36xxx.yaml    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
new file mode 100644
index 000000000000..9f350f4e6d6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/novatek,nt36xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36xxx series touchscreen controller Bindings
+
+maintainers:
+  - TBD
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - novatek,nt36xxx
+
+  reg:
+    enum: [ 0x62 ]
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpio:
+    maxItems: 1
+
+  vdd-supply:
+    description: Power supply regulator for VDD pin
+
+  vio-reg-name:
+    description: Power supply regulator on VDD-IO pin
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      nt36xxx@62 {
+        compatible = "novatek,nt36xxx";
+        reg = <0x62>;
+        interrupt-parent = <&tlmm>;
+        interrupts = <45 IRQ_TYPE_EDGE_RISING>;
+        reset-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+      };
+    };
+
+...
-- 
2.28.0

