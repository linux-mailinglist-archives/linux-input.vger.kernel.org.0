Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDFB286684
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 20:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbgJGSFz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 14:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728652AbgJGSFt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Oct 2020 14:05:49 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23841C061755;
        Wed,  7 Oct 2020 11:05:49 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e2so3482480wme.1;
        Wed, 07 Oct 2020 11:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/E0E86V4qlrZqRVabn3V9YxZrtSiuCT+gPTjZhmgR0=;
        b=el+wTqBuLl7i6DNDUwkJJPoio0xSSkwDERpuSW2YCDZ+TIOR+TbTxdrfAG6bV1L1R8
         oSk5LbCNvetkOnDO80eAUnFhlSzGATRqFn8rxxFVYBT72HU2syRkSwp15Q5sMUAgZ9w6
         d9xcbDKB+H+FZ+Yr4TL0pa1g01nT+zFjNVJc9GCN3s1YFfLZYy2zSjuhYCCX2psxzDti
         PUyCT2Rue7hwC3+UbZxUmUBdx2KR6Tosc9AC9vZ8CGDjOPqVB29YCTkVQKty2Z8ikXUd
         AczWxpX70BBTUhaRsq1M8x3Bf/bcOhZhdqzH+KFs8SCVMAyum84kY0kLHp20BbinsWQL
         VPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/E0E86V4qlrZqRVabn3V9YxZrtSiuCT+gPTjZhmgR0=;
        b=e6s+ovT00q7e/hUJIjvXswEKq6+x4HQ3+xrVXiDamImKiNHCFSd9iNlxXelBhUzgp0
         7J0+4oU1mC0dbxIt4r6+6xyhnjFo8ke38fWlkkYYUBJSfDK1amGrA8700VZFA2gMBAiZ
         FhIYjS1tB16K2XaQmhZgbbEJEevQMNNdBQDWvNEIq0sDm29egWIqVWy4fAOaqca9gqlE
         h3iQrUmRQBITrh6ALnvZvTeSdTNe45olnlNM6gQuuKRb17UHg72JYW8ZL6LiD0EqslFO
         adAAiQi0xN2oqIXPh6o4XBSXGb0pDYlaAvRCg74XcKLnNoe/sih5ngmEneWPPJVsE/+X
         cydA==
X-Gm-Message-State: AOAM531l6+zeuhjK0Aq0nxx4IqR4PLcTl8cr32oLmnjN6GvcQGqTwSpI
        ikceHIhfY4tKnSidaCJtghJ4LNt/HhXEnQ==
X-Google-Smtp-Source: ABdhPJwdS6sp3VKVidmda8KeJeB8mQzj+55i0oqRb3hbsjV1jSOuHmwe2tJ4ErpJCClKG4iiotsheg==
X-Received: by 2002:a1c:f005:: with SMTP id a5mr4595433wmb.160.1602093947675;
        Wed, 07 Oct 2020 11:05:47 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a17sm3814496wra.29.2020.10.07.11.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 11:05:47 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org
Subject: [PATCH v3 3/3] dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
Date:   Wed,  7 Oct 2020 20:05:40 +0200
Message-Id: <20201007180540.322257-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007180540.322257-1-kholk11@gmail.com>
References: <20201007180540.322257-1-kholk11@gmail.com>
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

