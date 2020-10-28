Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5A829D642
	for <lists+linux-input@lfdr.de>; Wed, 28 Oct 2020 23:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731009AbgJ1WNO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 18:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731022AbgJ1WNM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 18:13:12 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9AEC0613D3;
        Wed, 28 Oct 2020 15:13:11 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id t3so696048wmi.3;
        Wed, 28 Oct 2020 15:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UQeIb9S6fRyX5SRt2bDKlf1jyr9GKEnfhYagOSnTM3M=;
        b=DlatPnFtHJrfJ07LWvkl9+nsvhNwx+orArQF7h6O2RJSm7XI44ONw8VlqpEbhEMT0M
         6Wq+lpKTWAVNnf7Bj6QMm1J/33sTXoUaLeLhmbMqoNRmXrXlGS8iS62Zhr8V0yGDz2lQ
         w5VsN4sMlVmScHmpj1XKy7YYFiOT3e34th+9xIPx6uCF0PnG8p1xHTmebu8w7m/KJ4CV
         2O9N57kTqJSw4K8GnZWP9cl42YR+TfjNF9TBsKK/FUdBMcRZr6dm4yKRE+kDUTnTryHI
         9odrtv/iBcPWIsh3jxWrbNifLAJaS7QnsvFjNkQ1bC2vGLjTbmyiWlQCBlG30xLIe/Ym
         Ti6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UQeIb9S6fRyX5SRt2bDKlf1jyr9GKEnfhYagOSnTM3M=;
        b=F6pmHbrM6IpkHC2rMjuecC+Iw8R1+s/Eg/y74iNIhgYxM6PADIvrus+ABecjiQxUvo
         RrtfmhoMCuAJ+dbemEgf3DiSl4wc9+QqZF4vRoP1i+PGtjv5y+OTnS4M/rx6ppnRppje
         J0Ei+DA0ZGl2/zigQ9PiPuR1JPymQ3pY/KKm+bLtjPYw+FF4B0zRNb2A2coQxU3wqPON
         1Nj0H/KvqA5trTk4i3qzIa6lS5LfVoNLot3kJ9HTVDJEQW0w+p4lc7VlTQENw9n/1UiH
         YoDnb8Fe3PAFWqj7P3tO4QAAXNPpuV2g+9/hF2iqzW/7VnqQvXOqqVuohtoyOe1Y0nQQ
         DpVQ==
X-Gm-Message-State: AOAM533Y1WwtY+VENDz66MrlvUt5uxQ4QG5piKvtnI6nrap7OCKfRVWA
        KKlzgTC8OW0eSDtwyt1R2Pqt3HzM63OiR6s/
X-Google-Smtp-Source: ABdhPJxdhm6P6d9+9M90lpfBiEoEfY8zosAdgCLm46HLBQ5WD9A+r5LCSE+7/tfvSXPlOzLo2ml11g==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr1044002wmc.34.1603923190036;
        Wed, 28 Oct 2020 15:13:10 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id x1sm1318928wrl.41.2020.10.28.15.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 15:13:09 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 3/3] dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
Date:   Wed, 28 Oct 2020 23:13:02 +0100
Message-Id: <20201028221302.66583-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028221302.66583-1-kholk11@gmail.com>
References: <20201028221302.66583-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add binding for the Novatek NT36xxx series touchscreen driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/input/touchscreen/nt36xxx.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
new file mode 100644
index 000000000000..a360a9f5d43b
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
+        reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+      };
+    };
+
+...
-- 
2.28.0

