Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA0D72D0754
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 22:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgLFVYJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Dec 2020 16:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgLFVYJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Dec 2020 16:24:09 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3D0C0613D2;
        Sun,  6 Dec 2020 13:23:28 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id d3so9855247wmb.4;
        Sun, 06 Dec 2020 13:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YUCdqSWayGE2L1mNvPdD51yYQKe14Hi3uCXNm1Fq/s8=;
        b=UDml71/9v3kNN4UJDQKqgEFpEMw6QpHpEhnAkuTO9lQ0TiwbhleXDPfmGE7ZB34WIT
         0UNFtpSV9VGyDMN6lREZ1qfPBFq3PP0cD+am0Wp28TRzE79lYKcHNx92meuzUeGuvZgL
         W6xjYvBgqahxNNErHkkfL31A1gKl1Pmfh80sfU5Ycepl2Y8C8KU1izjT1shDMEzkD1NH
         BY+hV+yZTQXoW6Cbf3AtgnpO3EfuTT7diI9AWyFLhEiHnp834i5naPl1fmzakdBLG0Hm
         Uh39rawGy5dT4yeWfD7LUd5tsyBQSRU6dF0P5/KCpo6dXho0WBKduQhwo9w2GXZIktJH
         HXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YUCdqSWayGE2L1mNvPdD51yYQKe14Hi3uCXNm1Fq/s8=;
        b=YT/yKWcnVHixiPZ4eZsW62tiqwug/ZOQqBG50vjwCAVDbVUsh9kRhihy7UCbxSUe01
         GTpaFKKFWzaWj2lLhLj7cV4+XCiCLSS246mxhEe9howFRn7l8r2av2/YoRPBxXLhehr3
         ZzG072mYRLPcxii9amNO9vUIS8uz3XuLinrhbycnXn9MhmiPuSMaQ1Uj1uYRCoj4Iw3W
         2iuJHair5XfM1LVnzMusXoExznZiIZ72XCHpM3YN9YY2DfNmsk2LeVthG1/E1ps18KDf
         xK14QP1RCb2yACVWFG0BBe05YAswy8YuHUBuT9dvNd1nBkHa026AaITbgBsHOBlI6lXr
         DMXQ==
X-Gm-Message-State: AOAM533sVwlTVmP92gNpQlQP/LG5UD0eKnWeXxRWa9oJ3DlgM7ZotC7R
        eQPVrWs3PRTEjswQHsrVbO0=
X-Google-Smtp-Source: ABdhPJzlnsNMtolLAlMHcMCvVimXMcXpIkj9pYjBQ1IpPHw6j9y3FlEr/drg80OOqRCVOOZgx8H+tw==
X-Received: by 2002:a1c:6055:: with SMTP id u82mr15530487wmb.61.1607289807694;
        Sun, 06 Dec 2020 13:23:27 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id l24sm12737540wrb.28.2020.12.06.13.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 13:23:27 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: input: atmel_mxt_ts: Document atmel,wakeup-method and wake-GPIO
Date:   Mon,  7 Dec 2020 00:22:15 +0300
Message-Id: <20201206212217.6857-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201206212217.6857-1-digetx@gmail.com>
References: <20201206212217.6857-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Atmel touchscreen controllers have a WAKE line that needs to be
asserted low in order to wake up controller from a deep sleep. Document
the wakeup methods and the wake-GPIO properties.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/input/atmel,maxtouch.yaml        | 29 +++++++++++++++++++
 include/dt-bindings/input/atmel-maxtouch.h    | 10 +++++++
 2 files changed, 39 insertions(+)
 create mode 100644 include/dt-bindings/input/atmel-maxtouch.h

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index 8c6418f76e94..e6b03a1e7c30 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -39,6 +39,13 @@ properties:
       (active low). The line must be flagged with
       GPIO_ACTIVE_LOW.
 
+  wake-gpios:
+    maxItems: 1
+    description:
+      Optional GPIO specifier for the touchscreen's wake pin
+      (active low). The line must be flagged with
+      GPIO_ACTIVE_LOW.
+
   linux,gpio-keymap:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: |
@@ -53,6 +60,26 @@ properties:
       or experiment to determine which bit corresponds to which input. Use
       KEY_RESERVED for unused padding values.
 
+  atmel,wakeup-method:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The WAKE line is an active-low input that is used to wake up the touch
+      controller from deep-sleep mode before communication with the controller
+      could be started. This optional feature used to minimize current
+      consumption when the controller is in deep sleep mode. This feature is
+      relevant only to some controller families, like mXT1386 controller for
+      example.
+
+      The WAKE pin can be connected in one of the following ways:
+       1) left permanently low
+       2) connected to the I2C-compatible SCL pin
+       3) connected to a GPIO pin on the host
+    enum:
+      - 0 # ATMEL_MXT_WAKEUP_NONE
+      - 1 # ATMEL_MXT_WAKEUP_I2C_SCL
+      - 2 # ATMEL_MXT_WAKEUP_GPIO
+    default: 0
+
 required:
   - compatible
   - reg
@@ -63,6 +90,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/atmel-maxtouch.h>
     #include <dt-bindings/gpio/gpio.h>
     i2c {
       #address-cells = <1>;
@@ -75,6 +103,7 @@ examples:
         reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
         vdda-supply = <&ab8500_ldo_aux2_reg>;
         vdd-supply = <&ab8500_ldo_aux5_reg>;
+        atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
       };
     };
 
diff --git a/include/dt-bindings/input/atmel-maxtouch.h b/include/dt-bindings/input/atmel-maxtouch.h
new file mode 100644
index 000000000000..7345ab32224d
--- /dev/null
+++ b/include/dt-bindings/input/atmel-maxtouch.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _DT_BINDINGS_ATMEL_MAXTOUCH_H
+#define _DT_BINDINGS_ATMEL_MAXTOUCH_H
+
+#define ATMEL_MXT_WAKEUP_NONE		0
+#define ATMEL_MXT_WAKEUP_I2C_SCL	1
+#define ATMEL_MXT_WAKEUP_GPIO		2
+
+#endif /* _DT_BINDINGS_ATMEL_MAXTOUCH_H */
-- 
2.29.2

