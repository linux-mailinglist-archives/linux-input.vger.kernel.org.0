Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6862E2973FE
	for <lists+linux-input@lfdr.de>; Fri, 23 Oct 2020 18:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750794AbgJWQdR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 12:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S460890AbgJWQdP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:15 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C588C0613CE;
        Fri, 23 Oct 2020 09:33:15 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g12so2671128wrp.10;
        Fri, 23 Oct 2020 09:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sq/g3QntWZKliuSV9V54j9Wg1RchEoNv9jy29pYMN/E=;
        b=EKBrqd+PLm4bbuJx7BQuD7BkZFToxcOjYG/fkPh1R8AhVH5S6Ozh1D0xjpl6a43/dr
         RAFENfo8DmbPGZplVWiDQeISOV0BNHj/Fd3D0LPdzeupB+JRFyK8UFwrauO9rtdGwhoC
         kZUTe47nUNN+guqFtu84tN4lrKcIi057zxzz/Wa1t+PZMrajAE9D+1zIjOoS+QVPtfh3
         ZXW80MmJ60p0Tc48qGNYn4OM6sFdcOELyfA8bdG37ZNVUbs1vkDVeRlEVHzLcGzfbUu/
         RvI6/ehsllyITJBZU2bC0xeSByAcOyam1SgrZ4uNhtkQUwnbYx3ZNImSvbLK9CmC3qyK
         Q1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sq/g3QntWZKliuSV9V54j9Wg1RchEoNv9jy29pYMN/E=;
        b=Xwf33nSa7SnbcbYgs2fecqsNjB87K8IGlOiJtEXGhBrFNr7zzQPJ1QZs6qKlw4hL7I
         Z0DIyZd8jQbS7LVZyTojKQrF9enO/zfDvRWFHcQpw05XyKDckDn/otoiS90dz9lGmQRm
         LUIBonDy/4gjbODHc0XuzwAegfGq6yMS4Lj6zxKI0AegobjTakfBCPg9pQd7eX1LgQrd
         xMBpYRxBZVYj62iu0anu1stUPmcolcZAHCWKNJpbARvNUaH+fc35xxM7I3Yt4IwUUvRR
         rwesoPHlHlZhH1/UZZh7o1p0OCpfOpb9AeDMonS+c+Ctd1WRXhaocdc9jc9Park4yxvN
         dmRw==
X-Gm-Message-State: AOAM531VWZUjC8XqH+rgUTY2oh0gX701SFifrvz95vlmpFPPylQNOwSS
        /A35WsChzhYI3N2IMwO5LRI=
X-Google-Smtp-Source: ABdhPJyjw14LkSCmfH9h0UQNf4VxXTyn4j1iRBH8nvcaFay3INl44MsKdkBKcIvVGJM9aWJQahycyA==
X-Received: by 2002:adf:e942:: with SMTP id m2mr3446606wrn.123.1603470794154;
        Fri, 23 Oct 2020 09:33:14 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u15sm4334808wrm.77.2020.10.23.09.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:33:13 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH v6 3/3] dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
Date:   Fri, 23 Oct 2020 18:32:56 +0200
Message-Id: <20201023163256.96000-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023163256.96000-1-kholk11@gmail.com>
References: <20201023163256.96000-1-kholk11@gmail.com>
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

