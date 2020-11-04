Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A782A5BF3
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 02:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730012AbgKDBaJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 20:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729701AbgKDBaA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Nov 2020 20:30:00 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87831C040203
        for <linux-input@vger.kernel.org>; Tue,  3 Nov 2020 17:29:59 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id x13so15138500pgp.7
        for <linux-input@vger.kernel.org>; Tue, 03 Nov 2020 17:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RtCLgP117LqdDLRX3UH1IzVtOTV8WLG1PPvChWmE/o=;
        b=NFHyO+eAi1A7Bx6bMiuUJTG1ic8g1wN7sAGWFyzSzJk+qvFdhvSaIV7Ibre/afNyiv
         6LpsEJzUjFIXiMVwT9LKaZdvLd8KxNLOvW+GLqcvHRZtqF65vEjayKBIJUcLmWW16ynF
         FyJVqRXvmnFYYTC59t1HkfuWf+r45mIrPBZ0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RtCLgP117LqdDLRX3UH1IzVtOTV8WLG1PPvChWmE/o=;
        b=QIszSJdE70+5AHxWnbqOq0qnhJSGifi+uoq7pI9BVq6mjrQ9kAzfkH5KcCW3D6nQob
         7S2M292gxaUtnUoZTx66VRGqipdsbgYpmnnERljgNKMdlTFiicG6fHCbxXquAVihiuwu
         OAo+04oWchgnDAU/bybHheQIRbUEhUbkbQ/1UHIHwEfXKoH9mjQPBCH0Mp37UF9whTdf
         kbWth+VnCsd+WzZRYpXjv00c8n+lKQo9gAu67kQxdgC9tPNqu1WK40zMD+vZcMMHFsPT
         4P3u1mlIlbndghLVqCNfh2ONECQShLMmTFryHBHC60m6D6uyUIVApGWIXWO5cP8Fh28o
         AlTQ==
X-Gm-Message-State: AOAM531Knh4HCIqTyqrjbBU1tYWxDa4mkt9XPK111bMfzvSdwpCi0Mu3
        Z7rl8aVp4S0DohcXodLHezojVQ==
X-Google-Smtp-Source: ABdhPJyiEOe8O7LHoSxYLr4fPY+iyZzJmSz8Iayqlv5QrC3kxsgyMWPy4OS8tPCJBNCtPYz1YAxRHg==
X-Received: by 2002:a17:90a:d796:: with SMTP id z22mr2140569pju.2.1604453399053;
        Tue, 03 Nov 2020 17:29:59 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id m3sm347424pjv.52.2020.11.03.17.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 17:29:58 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, swboyd@chromium.org,
        andrea@borgia.bo.it, kai.heng.feng@canonical.com,
        hdegoede@redhat.com, robh+dt@kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P
Date:   Tue,  3 Nov 2020 17:29:28 -0800
Message-Id: <20201103172824.v4.3.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201104012929.3850691-1-dianders@chromium.org>
References: <20201104012929.3850691-1-dianders@chromium.org>
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
---

(no changes since v3)

Changes in v3:
- Removed Benjamin as a maintainer.
- Fixed compatible in example.
- Updated description.

Changes in v2:
- ("dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P") new in v2.

 .../bindings/input/goodix,gt7375p.yaml        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
new file mode 100644
index 000000000000..15a38516e594
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -0,0 +1,63 @@
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
2.29.1.341.ge80a0c044ae-goog

