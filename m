Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0837297BFF
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 12:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761109AbgJXKvh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Oct 2020 06:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761072AbgJXKvY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Oct 2020 06:51:24 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9717BC0613CE;
        Sat, 24 Oct 2020 03:51:23 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 13so4786133wmf.0;
        Sat, 24 Oct 2020 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sq/g3QntWZKliuSV9V54j9Wg1RchEoNv9jy29pYMN/E=;
        b=gghvbGwyzyua7lEb25CgL2cnMZlNxJAbetgC6vSEA4diF1YkNZdVbg6Bguw5N444al
         9/QwfvWTsEnfAawhZxOiyV/gYm3wsU7og0dCQbvkSPbcq/giBXUAfm9l8ypWTf78KuUh
         nJo02E4qSftesu5wkYu8ClVABaT9VVBf6Pyg3zilnUVr0XoAwBaCgv2mfVpEB7xPAtZA
         /VQSd6xsH6JWjZaCiE3GvncvSVg52KFKwjODL4zMzhvGJYst6EALeoe2GK1Yu23Vvqmz
         X4+X3iu8lU2SrVAFe+MvUPkyTbRG1QZBpDWRTVve5g8rDwpgRFFGWfPgmFn9moui8b1E
         4sTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sq/g3QntWZKliuSV9V54j9Wg1RchEoNv9jy29pYMN/E=;
        b=PhdwIfs90YWEI/d2zpRZYdiI/G/GjYwMf3753XNAvqn9RwxwBUpuK8epX//Jlhlz97
         AT1nIrErumXSBPCOtmgMQEAzM6iifQS0r8fP6DNjrQtxU7kMGZe0GmKXkVqCZlyd2wRz
         sAFurSPfix2RI0bu0ZFQRfdSf6iuNKxpbsPl7KYT7i0QuFFwhwD6KS9V3TbD5W7zyRoJ
         F4IR7yAV5B7m08USubLWH9JCi/Q/7KAUA/tThTTd9Oj5MhewYCaFWircfIl085klv6tB
         NFv5FKFj1+IY3TYFlICyy15a0wWnPQwbxBDpDReQbA/Mq2CEyrEwlKnIABLJtgnERkhP
         Jz6g==
X-Gm-Message-State: AOAM530ZJssxfNzceWlMFIm+jmls/DtcaT/u2mFDCDqcry1D0yFocVCW
        f1bJqJdcl5xRFlTNBu3WYrc=
X-Google-Smtp-Source: ABdhPJyOVfJCCxsbnRdlNwPQQBn9LClTz5MwVi8sGfeJQRSlKBm0lAiVrBTTR5ULQvX2QVcyB9ewBw==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr1573678wmi.105.1603536682261;
        Sat, 24 Oct 2020 03:51:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id 3sm8792632wmd.19.2020.10.24.03.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 03:51:21 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH v7 3/3] dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
Date:   Sat, 24 Oct 2020 12:51:11 +0200
Message-Id: <20201024105111.15829-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201024105111.15829-1-kholk11@gmail.com>
References: <20201024105111.15829-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add binding for the Novatek NT36xxx series touchscreen driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../bindings/input/touchscreen/nt36xxx.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
new file mode 100644
index 000000000000..1486b20d6c49
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/nt36xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36xxx series touchscreen controller Bindings
+
+maintainers:
+  - AngeloGioacchino Del Regno <kholk11@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: novatek,nt36525
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: Power supply regulator for VDD pin
+
+  vio-supply:
+    description: Power supply regulator on VDD-IO pin
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@62 {
+        compatible = "novatek,nt36525";
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

