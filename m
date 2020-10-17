Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E42F2913E4
	for <lists+linux-input@lfdr.de>; Sat, 17 Oct 2020 21:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439297AbgJQTCC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Oct 2020 15:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439290AbgJQTCB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Oct 2020 15:02:01 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF18C0613CE;
        Sat, 17 Oct 2020 12:02:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x7so7092329wrl.3;
        Sat, 17 Oct 2020 12:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sq/g3QntWZKliuSV9V54j9Wg1RchEoNv9jy29pYMN/E=;
        b=A3ZOgROJWtqTXK50vo9ZZn/RsXM/wU51rqWIavc2hfVj/FvwMctZTiAxPsMJhhX0xK
         VjrsZPG3aVpJ486cVkEvPHqqC/23Z9O1arYB6aE2lAVIM+Qa7jtsJz/VyPaRbb6viubw
         nS3kBcgUDIfUHbHu93yutvh2gmMb0NH7pwt3XkJLWyg2+rUHPM6+s2C15543KjyMlWEP
         1WxdLJ+SPKQKpA4/7Vr5JtLYvrjZcGjAuIG20jHoFL0onUJlVkL4tUrPCFJq0eU8pvtW
         Cfhb6i6mIusw+SaKqR3KRxJlXII68XB1uX4/DOUiuRsImTMHNeTgjeibH/oee86zWLGg
         I54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sq/g3QntWZKliuSV9V54j9Wg1RchEoNv9jy29pYMN/E=;
        b=XQ2XWy2A5la97Jym2xvHZlA+Wzpjga+M11kW41PJseUASEd+EM5vLdswcnOMyetyBZ
         F8+MqR73sffpM8oZeDW8GuumjLBLTcDgghxXvx7d5sNX0our38fs6IH23fiY+slxhUIv
         2YscvPuNeAn+tPXdKGJRIVK1vxoWOINIhixMlhST4JDFA58d+NCr9YLRBqVDR9C5B+vo
         n79JKWWZrrAFNN+ByR1oRwhPIsePYm6PZxTJml1rk1Pu7kMMd7zUAKwts2oos9hm01UG
         QUaq3+OH3TT+YaKO3dD5jd3f+ot+IXjGpzxUNrOrmArF7luYFTD/e2T/YYkUZS2Oc1Tk
         IeXw==
X-Gm-Message-State: AOAM530p0SB9qhX0weFs7nsGCHI2IW4iDjB1iOwdL150AxXUlNd9kmB6
        ZH8m5oxLwiCd6S9PaPadvJk=
X-Google-Smtp-Source: ABdhPJxYWmgr18jm3rtS63dhc4+1O0nXFwkHGQOklEDTmEVN4Xp7FsV6YbS5BgLa7+mUX802LuFeNw==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr11112682wrj.169.1602961319598;
        Sat, 17 Oct 2020 12:01:59 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a5sm9583793wrt.80.2020.10.17.12.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 12:01:59 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org
Subject: [PATCH v5 3/3] dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
Date:   Sat, 17 Oct 2020 21:01:52 +0200
Message-Id: <20201017190152.12780-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017190152.12780-1-kholk11@gmail.com>
References: <20201017190152.12780-1-kholk11@gmail.com>
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

