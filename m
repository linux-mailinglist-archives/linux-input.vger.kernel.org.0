Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D802B1AB7
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 13:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgKMMEx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 07:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgKMLf5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 06:35:57 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4727DC061A04;
        Fri, 13 Nov 2020 03:35:29 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id q10so7425135pfn.0;
        Fri, 13 Nov 2020 03:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cwblAwrthFP5iML4nReKbhHlCULpAolx+4p+cyi0LBY=;
        b=lQPPE2S8KfvQzoJ8PWBkVO+bHS1tTS6japw8QhtSmNyBHBrX1l8fZNWJH2gBLWBPHW
         SneiGkvF0dfzFdj/kHqeHHwkFYn36KCA2YK1MsEW7NzSfcYHeFXVK4FQos9vyu2Mr3AR
         C9FlBu3tBkHVtHQKNW9DhW0ahav/ygiEJ3u9K5AqS841JjedsyJaJHg8CQoWABW79Q+m
         +fuv0XpThogS5kpqP05BsuA9i7kJrb8TaH/PY1YifzTTvSDyBcSw+uxHaGQnwxlagy/Q
         8Jg4qJN5MK96C6x2eGHSurftcLwIMqafl6/vdcCIhHPVJOP+VaypLfSFJNClZPGxkZZ2
         Xl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cwblAwrthFP5iML4nReKbhHlCULpAolx+4p+cyi0LBY=;
        b=nMJMMvGjJO8Z1ef8zB+aczKJBM6/t2X6uxZhKupU9XOybNlc3DvPeoCXR9annGb3rW
         9HySnKVC+hm7ssP1o9QZy39kj2jVmFgX7fwGbHFrU4TZft7bHa60LTvPfzLgHQeDxu1L
         GY1V5CXHuU3S55CPL8FA+ldkJ1jWVy4T8f3pNhaHEbEklANEXOxSHKvhhkN5Wzeos+tX
         hAyGyc2x7k4AmHYmssw00Ri3R3EEMI3kkr9DJvyvrXmkdEq1E2QS4abIbVbYxONYahy4
         /NRZR7AY1Csr5A6TCGYMpHLktj/sAuUlGnC+/4Xw5C5y6kwIoeM86fL/UeDBwVJMj+A6
         njtg==
X-Gm-Message-State: AOAM532KaTLxFaiEqqqTj9BvzyO8DBRrXUlVpZIaKcPloe/EevHyxrrW
        RO7LoHOJn5WHEBvBjtovrgZiOwMQocWmuA==
X-Google-Smtp-Source: ABdhPJy7NZ9Xvw13+N4Ka68ovy/Qu3Gz/fesV3cynxVEgdrKookoNhRd7NauefMpJzNL56AL+IIbRQ==
X-Received: by 2002:a63:34c:: with SMTP id 73mr1720930pgd.172.1605267328838;
        Fri, 13 Nov 2020 03:35:28 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id q12sm9900987pfc.84.2020.11.13.03.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 03:35:28 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Nemo Han <nemo.han@unisoc.com>
Subject: [PATCH 2/3] dt-bindings: input: Convert sc27xx-vibra.txt to json-schema
Date:   Fri, 13 Nov 2020 19:34:50 +0800
Message-Id: <20201113113451.52355-2-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113113451.52355-1-zhang.lyra@gmail.com>
References: <20201113113451.52355-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

Convert the sprd sc27xx vibrator binding to DT schema using json-schema.

Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 .../bindings/input/sprd,sc27xx-vibra.txt      | 23 ----------
 .../bindings/input/sprd,sc27xx-vibrator.yaml  | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
 create mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml

diff --git a/Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt b/Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
deleted file mode 100644
index f2ec0d4f2dff..000000000000
--- a/Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Spreadtrum SC27xx PMIC Vibrator
-
-Required properties:
-- compatible: should be "sprd,sc2731-vibrator".
-- reg: address of vibrator control register.
-
-Example :
-
-	sc2731_pmic: pmic@0 {
-		compatible = "sprd,sc2731";
-		reg = <0>;
-		spi-max-frequency = <26000000>;
-		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vibrator@eb4 {
-			compatible = "sprd,sc2731-vibrator";
-			reg = <0xeb4>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml b/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
new file mode 100644
index 000000000000..abdf459d9141
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2020 Unisoc Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/sprd,sc27xx-vibrator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spreadtrum SC27xx PMIC Vibrator Device Tree Bindings
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - sprd,sc2731-vibrator
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    sc2731_pmic: pmic@0 {
+      compatible = "sprd,sc2731";
+      reg = <0 0>;
+      spi-max-frequency = <26000000>;
+      interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      vibrator@eb4 {
+        compatible = "sprd,sc2731-vibrator";
+        reg = <0xeb4>;
+      };
+    };
-- 
2.25.1

