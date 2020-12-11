Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4E12D8206
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 23:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406874AbgLKW01 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 17:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394358AbgLKWZ7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 17:25:59 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD36C0611CA
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 14:25:03 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id n10so81679pgl.10
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 14:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mcajmBZLh3V7JZmymLtTRNiBfRuCQpoxfH0au10GVAI=;
        b=SU/lSqaIt5K4RN06MHhvnXO6K+niJKl5UPJx30rPi1B6kPlzaqDyEvz/TjAFtj1JVB
         aUfHcMfzVusuPMi2vzBMmv4gxOPDz+xBOG8uqDatscYjegNI+NelAJTFKoH/9F0Sksey
         NYPExgcaCs69UklOZAAamx+pPGu1zCBKj/fJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mcajmBZLh3V7JZmymLtTRNiBfRuCQpoxfH0au10GVAI=;
        b=LZEARVvOTO/E34sXNb1n+8hYfvVmRg5aca/5Q9iKHQaGBP2BXul+1LCj8gJpiqhp36
         3ZKCz21OrTFPVJzKKWRFshHP+wDHRG7BhL2Q/G+ea4IvpSZ1ZsE547aiT75IzzyRE0U+
         7AXrTK1hpwfAlQ2P3LZV+d5UZqFOnm3k4Zxkw3SSv0JwcH8sc2BCQPzqaKHZ7juP6XP4
         5nTA4K6MV8wW6IYrtgYioTuKIx1PTii/JY87brR0Q4N1F3n8py5vB1zBplJE3pFmvVe3
         YMdaASefJ0qqGPdV22T+5z07u1nMLsGvNAjfZe9hD0qkMhpvxqqTQH5Hb/7Y+pw0tZ+t
         yUBw==
X-Gm-Message-State: AOAM533oQszOZQ2fLkWSmF6bHd+0hJiOV7A74rhPAV+WZKzmEwc92laN
        v4KpE+bXri44gtjwfUJnvBfJxg==
X-Google-Smtp-Source: ABdhPJxMUqG7tw+l2/Yzui5lhB1J1HHhOJKP0K0S8tHDT8ctco8kwuLAd3dW8P2LbzwVNqrPrkfYOA==
X-Received: by 2002:a62:38cf:0:b029:19e:41ac:526b with SMTP id f198-20020a6238cf0000b029019e41ac526bmr13999162pfa.0.1607725502291;
        Fri, 11 Dec 2020 14:25:02 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id w70sm11669969pfd.65.2020.12.11.14.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 14:25:01 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     hdegoede@redhat.com, linux-input@vger.kernel.org,
        kai.heng.feng@canonical.com, robh+dt@kernel.org,
        swboyd@chromium.org, andrea@borgia.bo.it,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/4] dt-bindings: input: HID: i2c-hid: Introduce bindings for the Goodix GT7375P
Date:   Fri, 11 Dec 2020 14:24:47 -0800
Message-Id: <20201211142412.v8.3.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201211222448.2115188-1-dianders@chromium.org>
References: <20201211222448.2115188-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds new bindings for the Goodix GT7375P touchscreen.  While this
touchscreen's communications are based on the generic "i2c-over-hid"
protocol, it needs special power sequencing and thus gets its own
compatible and bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

(no changes since v5)

Changes in v5:
- Added mention of i2c-hid in the yaml itself as per Rob.
- Adjusted subject as per Rob.

Changes in v3:
- Fixed compatible in example.
- Removed Benjamin as a maintainer.
- Updated description.

Changes in v2:
- ("dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P") new in v2.

 .../bindings/input/goodix,gt7375p.yaml        | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
new file mode 100644
index 000000000000..fe1c5016f7f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Goodix GT7375P touchscreen
+
+maintainers:
+  - Douglas Anderson <dianders@chromium.org>
+
+description:
+  Supports the Goodix GT7375P touchscreen.
+  This touchscreen uses the i2c-hid protocol but has some non-standard
+  power sequencing required.
+
+properties:
+  compatible:
+    items:
+      - const: goodix,gt7375p
+
+  reg:
+    enum:
+      - 0x5d
+      - 0x14
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    true
+
+  vdd-supply:
+    description: The 3.3V supply to the touchscreen.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      ap_ts: touchscreen@5d {
+        compatible = "goodix,gt7375p";
+        reg = <0x5d>;
+
+        interrupt-parent = <&tlmm>;
+        interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+        reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+        vdd-supply = <&pp3300_ts>;
+      };
+    };
-- 
2.29.2.576.ga3fc446d84-goog

