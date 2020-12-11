Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFEC2D7D18
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 18:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405582AbgLKRiR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 12:38:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395343AbgLKRhP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 12:37:15 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE8CC0617A7
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 09:36:00 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id b26so7418641pfi.3
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 09:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mcajmBZLh3V7JZmymLtTRNiBfRuCQpoxfH0au10GVAI=;
        b=N1nJjyTFfjMds4zMRb8/0go3TTug2Sh7Q3C6Tky8usTP5ayoupM8fDqupu5p9tAleM
         mxdLIxY3OqF3lZnhU4xY20iKWCAe+EQEpZ+UC9WMXJC5A7wGYktcR11oTiPhNKvq2veU
         GJkJ7lJJOraxlZM8crBrbJjJZfnFP48iIIoVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mcajmBZLh3V7JZmymLtTRNiBfRuCQpoxfH0au10GVAI=;
        b=VN6/RXgVyL2z7qUDNMPvdxTR2JHp4PXGFtSgHxvjH2A2l7THrR3hlVpygzhnlxzAAH
         CKp/dT3Rx7+ah2fpXk/6P1QKA+gdUD6Kzd4CKsy7Ovx9LsF3nNQVNU/YBmH8aNoNQIq9
         dU7UId7NsrE6IOspQfA9T6LukDOwae+7GIqhoSF0cb5v2TSdRNQewxkju2yz87405vI7
         hb2SrfV4v9U18orjgapdUpPWG5NIIojusKikBiGU3+jaHAXxlN1ubl8sBBdX++u7zwL3
         xA9ldl5mdT1vgspWydx8+zHAqc5JktfVeRQH2R5VmhRBzD/eGkTlRfpccULAuTLVoWfK
         5Tmw==
X-Gm-Message-State: AOAM532N5nuYTaxnxv+h+CfFPOcAqJ/bbajaWdupbkggTbPAHWzwBsL7
        ZZIr9Vo0aM4P1wk/FG9IlcDXXg==
X-Google-Smtp-Source: ABdhPJwbVKboISP/X6FXJGfRrNYIwh7kNfEkjlT0nINMx6ate+sQAGwmp5PxKqkAY948T8WbAJnN7Q==
X-Received: by 2002:a62:2c9:0:b029:19d:d3f7:7dba with SMTP id 192-20020a6202c90000b029019dd3f77dbamr12561187pfc.40.1607708160195;
        Fri, 11 Dec 2020 09:36:00 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id r185sm11402765pfc.53.2020.12.11.09.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 09:35:59 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     hdegoede@redhat.com, swboyd@chromium.org, robh+dt@kernel.org,
        linux-input@vger.kernel.org, andrea@borgia.bo.it,
        kai.heng.feng@canonical.com,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/4] dt-bindings: input: HID: i2c-hid: Introduce bindings for the Goodix GT7375P
Date:   Fri, 11 Dec 2020 09:35:25 -0800
Message-Id: <20201211092956.v7.3.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201211173526.1516653-1-dianders@chromium.org>
References: <20201211173526.1516653-1-dianders@chromium.org>
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

