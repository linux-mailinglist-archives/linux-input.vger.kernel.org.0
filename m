Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E0927A0FB
	for <lists+linux-input@lfdr.de>; Sun, 27 Sep 2020 14:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgI0Mf6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Sep 2020 08:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbgI0Mf5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Sep 2020 08:35:57 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7F3C0613D3;
        Sun, 27 Sep 2020 05:35:56 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e2so3857244wme.1;
        Sun, 27 Sep 2020 05:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/E0E86V4qlrZqRVabn3V9YxZrtSiuCT+gPTjZhmgR0=;
        b=HxQl29ccgD/HnuiLjRRasb9WOz6mCSP1eiEOrIr03/M8EUcYiiy4kgREMeqsrDvIXc
         QeOPhWd7lPbqncktGbRqhROyuwP0OfUH8EBjxL2ZJvi023+aVo88jv5NHBWT53p2kiRo
         KDUNH8RYl7EC7+4BiZQib1ukSA+3HtowNO7sDmRSBRNOvE3yo8uzJizdex4l/BGefAln
         2i2fdwO5mygIw6Plcg1bemrmXmrOgRpipxql4XDCr2f+GZ6ovb/PVUqDJEsomu4S+Ee6
         MN4vr+QJcKTRecB8QCn9PrjhExWoYxx0IX9CIAsxg76OFUsonqIANm6SsdZ7QOwdqsNl
         RdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/E0E86V4qlrZqRVabn3V9YxZrtSiuCT+gPTjZhmgR0=;
        b=eUAmIwLP+YnHADqU807OSPvJAUHC0vvWLeDxU0gi8/8jY5lwZ8pPNVCEI+TC12xbv+
         fv6U/enxkdeHM7fv0EQuORhbU2B68eiLILq/Xph/0gwe0RWJcvHWSy2Imfqnd3gvHpjK
         fwPXgXOGYAeS23qbKvIAqvfo8G0lPXy13VjadE/gehFxlRc+TLdrawt6ahEPOepdP7B2
         oLfIxR9CBrMlbOi1mC1baFTeaTHM1LTRolGjyaUHwnYFMyodqwb0aGhV8vAYbDMfHjhf
         psEOcIT01ZkFrW2hUvay1IpPgFZzcPrzjMDjo51Y5qEKPGOAlfyojZXQECbou32ISW0q
         jMEg==
X-Gm-Message-State: AOAM530j+2E5aNLg1JKxOVRBJ7934Okk8ItkrhNbVNEqgbXdaDcV+esW
        LYngoZ8tFFn4hGPGRkokt8U=
X-Google-Smtp-Source: ABdhPJzA0okAHE82DQCWROPKoRNSg4yIK77HxjbH99E59/7BSpHaEd1CAWJZT4Rhr+Accj75yP/IJg==
X-Received: by 2002:a05:600c:20c:: with SMTP id 12mr7112002wmi.40.1601210155246;
        Sun, 27 Sep 2020 05:35:55 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id y6sm9470090wrn.41.2020.09.27.05.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 05:35:54 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
Date:   Sun, 27 Sep 2020 14:35:42 +0200
Message-Id: <20200927123542.553852-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927123542.553852-1-kholk11@gmail.com>
References: <20200927123542.553852-1-kholk11@gmail.com>
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

