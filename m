Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26104287B72
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 20:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgJHSPZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 14:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgJHSPY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Oct 2020 14:15:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC41AC0613D3;
        Thu,  8 Oct 2020 11:15:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e18so7628458wrw.9;
        Thu, 08 Oct 2020 11:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qB/rsrJsPeubxhjkhwrkREKj9ZU0zzE+irPCqzOkgcM=;
        b=tuXoOE6PbpzNQNzdIkojK5UnPug9AVlq+T2L6BYxPTglMOZ49ttUV5btgPN6HW+ifE
         AK3mmIR0SLxdmwO7v1nvAT69+X1Bx2Z0puP/8wyzOcF2f9nZFjDmidzEarzBy7k+GiQl
         6Nfg7Ux64NVXzo+3bOyHbYsZ6OW3Yy5Iux7OKs9c23IFe450imjh6PB2ESynHGRdUBDB
         SRLQuZ/aqKgho24N3h9KrxmbyLKGiX/siYBO5hqLrrPPuQ2DaIHLwB+KoHV0Qakj+g3e
         dXQqeCvHu9dmQmh7R2MgBAPJ/FPHdWFX4KGHzPbedZ3YDeau1GDF6rjRJW6zV2Ne+iXQ
         ivMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qB/rsrJsPeubxhjkhwrkREKj9ZU0zzE+irPCqzOkgcM=;
        b=AqdbyZRpSem95UIc5pfnql3yCXmGK6JtKm6kyMH3/JiYro5L9Am5roMYr9SK9zQr3d
         IBTzEBcBE8TciV5wnUaFVlqRczi0ddBmuNhBH57rDCyYbS8I9PmFcgkWd4jKmdp/QH0A
         BOQ5HcqVPMeoah/CNKXyw8t7bjE88Zx+boG3+fBKZB9AWUm/GM5yjXquvNh/xZdl8aKO
         LdBpv8OWovABvjwc+Zq/Zxn5cWkaks+aLIdAT8JdxXqQRfF60+ETuEykGnAGy6ehjw3+
         BrNSi64HnVP3rqRvF/LmaMx6bL8HjZtgBG4StE2wMuhfNiWUnnW6kAge4KUfRVAnPQvW
         Arzg==
X-Gm-Message-State: AOAM530rOXX2EcjoXQgQB+UeLK/uKqUMisvpU4NNg9ug39nsolvU/TuF
        zuVyBkuDTWTsdC4kTlK7RXtO0OFeo5nqwA==
X-Google-Smtp-Source: ABdhPJz4MckP9QC+ZDBFLJhQ9zoVM/JSKaG3fF2JEBGqV5YgGI6WrJVdEWREY4D45H6j2Owdzm6j5w==
X-Received: by 2002:adf:d841:: with SMTP id k1mr10744286wrl.227.1602180922595;
        Thu, 08 Oct 2020 11:15:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id e7sm8897285wrm.6.2020.10.08.11.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 11:15:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org
Subject: [PATCH v4 3/3] dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
Date:   Thu,  8 Oct 2020 20:15:14 +0200
Message-Id: <20201008181514.668548-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201008181514.668548-1-kholk11@gmail.com>
References: <20201008181514.668548-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add binding for the Novatek NT36xxx series touchscreen driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../input/touchscreen/novatek,nt36xxx.yaml    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
new file mode 100644
index 000000000000..e747cacae036
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/novatek,nt36xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36xxx series touchscreen controller Bindings
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: novatek,nt36xxx
+
+  reg:
+    maxItems: 1
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
+  vio-supply:
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@62 {
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

