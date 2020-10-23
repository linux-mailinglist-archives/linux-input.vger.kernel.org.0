Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC4429799E
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 01:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758582AbgJWXX2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 19:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758578AbgJWXX2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 19:23:28 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D240EC0613D5
        for <linux-input@vger.kernel.org>; Fri, 23 Oct 2020 16:23:27 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r10so2520828pgb.10
        for <linux-input@vger.kernel.org>; Fri, 23 Oct 2020 16:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d8xAtwDVMhNalLtWYZPCO9wz9pojtecxgYkkAm7a2YE=;
        b=mp/78y+GJ0rc6wdkGEh20lyDMfXAtkv4947P3Lkr8AilrLo9WP0oBIeknsHvQAe0el
         HEcgpmS7KrMrOHe9XqHuqCHhRnQy2hZnwyDji2aXxGt8lRYiA+RCr4HDTDe3/WMb5AmO
         wEuDDF+XTo2+MHfz9KDQBACMF+CVBN+1nmVWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d8xAtwDVMhNalLtWYZPCO9wz9pojtecxgYkkAm7a2YE=;
        b=CQ0iaTcqMx0OYGdBb3+MqBjyPu16V0mtnFtAey0ew8gn3jUdnoC8y+4AXfwQqxIlMK
         3zxbv+8KKuboB5ZjYrdhSsBciIvZ5jvhgm9190T+BPE+X8/jQHbxqHwSwnf3RDxnHWIn
         a7BrVQU4EYaqQzx33QJJ1X41IKVm4fnzhnF44RklNrejpoS02+WFlzkFEklpsG01vcRx
         yrVpcKaewjBXHDufjOf01j6HR+7JO4aJ69uVvs++mL81LcpsN7J3MLzy8ndk6DVdierU
         Wkyjhn6+gwzQHCOsLGzbbw3b2tk8UIolvppnCuusV9nJV9ZNGzBY3zc7vPcsU+xubqaV
         3n8A==
X-Gm-Message-State: AOAM531Y3sdUDFmBvgGQ1y15SqCz51AFM8Jjk3n4W5jtJ+5H08qr1tVM
        bDbaEOJWKOYvCLQFv+L+LYw8ew==
X-Google-Smtp-Source: ABdhPJx1sO6DuIlMnW+hVd4EBOhapt9SdD8UJIqqO1NSna53HQ08BKrQi3asON0KdwrvPVKG6PMS1w==
X-Received: by 2002:a63:c55:: with SMTP id 21mr3663254pgm.392.1603495407402;
        Fri, 23 Oct 2020 16:23:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id v17sm3789476pjy.40.2020.10.23.16.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 16:23:26 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org
Cc:     andrea@borgia.bo.it, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, swboyd@chromium.org,
        hdegoede@redhat.com, Douglas Anderson <dianders@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P
Date:   Fri, 23 Oct 2020 16:22:53 -0700
Message-Id: <20201023162220.v2.2.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
References: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds new bindings for the Goodix GT7375P touchscreen.  While this
touchscreen works with generic "i2c-over-hid", the current advice is
to give it its own compatible string.  The cleanest way to do this is
to give it its own bindings.

Among other things, this has the advantage that we can list the two
possible i2c addresses for this device, which gives extra checking.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P") new in v2.

 .../bindings/input/goodix,gt7375p.yaml        | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
new file mode 100644
index 000000000000..b5008f89e26c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Goodix GT7375P touchscreen
+
+maintainers:
+  - Benjamin Tissoires <benjamin.tissoires@redhat.com>
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
+        compatible = "hid-over-i2c";
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
2.29.0.rc1.297.gfa9743e501-goog

