Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E851C2F81A2
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 18:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731151AbhAORIa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 12:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728314AbhAORI0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 12:08:26 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9069EC061798
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 09:07:11 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id s15so5009655plr.9
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VvtlNUY05ZRZXw1HkORLQwU8MetpDw7Is/Hf+MOi1N8=;
        b=AfIDkQOnt6kOO2TACfRsIWQjT5bpOShsBMdgrJ55dE8+KG5o2Gb7WSU7jFgiUyz7v+
         pqidjVNUwod92goMvJLqWMIfS65ZrrmVwK9KqyqIc1k40v4LWY9Bxp2e0EUHIFyU7knW
         f0VH+w5k9X2PZ5VKBjGp621dTV1m2leI7ww30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VvtlNUY05ZRZXw1HkORLQwU8MetpDw7Is/Hf+MOi1N8=;
        b=HKIT8iVLlkGkLHfJf9xRTC8Kogk+A+XLiBR5eIkJd54IKeSaQMqi+x019SM27u6eaS
         vuSo/0AD8mNBjYjHZOjmOu7zfTAMUFhs3Jhi79Bf1oTtndOUB8NCYL8nD267Uc0GA3++
         eM/ZlrX+YW5WIHYo+/h6kocCdw05I6Q0ywWsUl25/nZanSlJVNMw7bCOMgo8RnvO1IrX
         dqYAfaJyu3mUl9Kd0zV3zcLzOEYyUv0yBLUJVjhRhH8AXcdc+QnIzigVtRoh8T41P1tI
         sMMlDav9iZM8J1yGg0cB54SDrz8SCVGWncXLkIgvBzHrqG3ejtLE2Z2D3OPUCvLX6nV4
         snuw==
X-Gm-Message-State: AOAM533isDlcBEuZ3gRAuS3BB7OcK23Qer8XQlDt7wYHPKTkyK+z7ZAg
        ++RsfXLnM+l8BjBzd7H/jgaSog==
X-Google-Smtp-Source: ABdhPJyFtWNYz1haJTm7CHTsmdWi6mAz16QXK0dcJU/2QxgPESAqU3D2/r7Ut9q0pMXQpc8FGma+Dw==
X-Received: by 2002:a17:90a:1057:: with SMTP id y23mr11352188pjd.97.1610730431157;
        Fri, 15 Jan 2021 09:07:11 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id t23sm8813329pfc.0.2021.01.15.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 09:07:10 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     swboyd@chromium.org, linux-input@vger.kernel.org,
        hdegoede@redhat.com, andrea@borgia.bo.it,
        kai.heng.feng@canonical.com, robh+dt@kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] dt-bindings: input: HID: i2c-hid: Introduce bindings for the Goodix GT7375P
Date:   Fri, 15 Jan 2021 09:06:39 -0800
Message-Id: <20210115090518.v9.3.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115170641.903392-1-dianders@chromium.org>
References: <20210115170641.903392-1-dianders@chromium.org>
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
2.30.0.284.gd98b1dd5eaa7-goog

