Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6E04FE97F
	for <lists+linux-input@lfdr.de>; Tue, 12 Apr 2022 22:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbiDLUkB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Apr 2022 16:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiDLUj3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Apr 2022 16:39:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E2D7AF9561
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 13:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649795109;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z+ent/yy95aJOm6DnI9kx/1sJTBsC05TLsSw4BZBHzs=;
        b=TX0jWIpJ33M7GP09HZ/eorgsQNSZM70LtKkA8tWHrjOG/XZ1MURMcMFYuFktkdzfwRhikj
        W1OkKURRaKROX9wrtOVh7cavEW1uumMfUtK44kqgPOMZeKEGqm8tdFIC8G37fKRqmpH5qg
        r6JZuPH/QMGlOlILrgIX4YnnxUuQ6UI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-jV2QJMBaNQm-JZsySZMRTA-1; Tue, 12 Apr 2022 16:14:14 -0400
X-MC-Unique: jV2QJMBaNQm-JZsySZMRTA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C51D85A5BE;
        Tue, 12 Apr 2022 20:14:13 +0000 (UTC)
Received: from cmirabil.remote.csb (unknown [10.22.32.76])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BA279416363;
        Tue, 12 Apr 2022 20:14:12 +0000 (UTC)
From:   Charles Mirabile <cmirabil@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Charles Mirabile <cmirabil@redhat.com>,
        Serge Schneider <serge@raspberrypi.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Nicolas Saenz Julienne <nsaenzju@redhat.com>,
        Mattias Brugger <mbrugger@suse.com>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, fedora-rpi@googlegroups.com,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, Mwesigwa Guma <mguma@redhat.com>,
        Joel Savitz <jsavitz@redhat.com>
Subject: [PATCH v8 4/6] dt-bindings: mfd: sensehat: Add Raspberry Pi Sense HAT schema
Date:   Tue, 12 Apr 2022 16:13:41 -0400
Message-Id: <20220412201343.8074-5-cmirabil@redhat.com>
In-Reply-To: <20220412201343.8074-1-cmirabil@redhat.com>
References: <20220412201343.8074-1-cmirabil@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds the device tree bindings for the Sense HAT
and each of its children devices in yaml form.

Co-developed-by: Mwesigwa Guma <mguma@redhat.com>
Signed-off-by: Mwesigwa Guma <mguma@redhat.com>
Co-developed-by: Joel Savitz <jsavitz@redhat.com>
Signed-off-by: Joel Savitz <jsavitz@redhat.com>
Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 .../raspberrypi,sensehat-display.yaml         | 27 ++++++++
 .../input/raspberrypi,sensehat-joystick.yaml  | 33 +++++++++
 .../bindings/mfd/raspberrypi,sensehat.yaml    | 69 +++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/raspberrypi,sensehat-display.yaml
 create mode 100644 Documentation/devicetree/bindings/input/raspberrypi,sensehat-joystick.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/raspberrypi,sensehat.yaml

diff --git a/Documentation/devicetree/bindings/auxdisplay/raspberrypi,sensehat-display.yaml b/Documentation/devicetree/bindings/auxdisplay/raspberrypi,sensehat-display.yaml
new file mode 100644
index 000000000000..5e41d6b7817d
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/raspberrypi,sensehat-display.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/auxdisplay/raspberrypi,sensehat-display.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi Sensehat Display
+
+maintainers:
+  - Charles Mirabile <cmirabil@redhat.com>
+  - Mwesigwa Guma <mguma@redhat.com>
+  - Joel Savitz <jsavitz@redhat.com>
+
+description:
+  This device is part of the sensehat multi function device.
+  For more information see ../mfd/raspberrypi,sensehat.yaml.
+
+  This device features a programmable 8x8 RGB LED matrix.
+
+properties:
+  compatible:
+    const: raspberrypi,sensehat-display
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/input/raspberrypi,sensehat-joystick.yaml b/Documentation/devicetree/bindings/input/raspberrypi,sensehat-joystick.yaml
new file mode 100644
index 000000000000..c97cd1d8eac6
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/raspberrypi,sensehat-joystick.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/raspberrypi,sensehat-joystick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi Sensehat Joystick
+
+maintainers:
+  - Charles Mirabile <cmirabil@redhat.com>
+  - Mwesigwa Guma <mguma@redhat.com>
+  - Joel Savitz <jsavitz@redhat.com>
+
+description:
+  This device is part of the sensehat multi function device.
+  For more information see ../mfd/raspberrypi,sensehat.yaml.
+
+  This device features a five button joystick (up, down,left,
+  right, click)
+
+properties:
+  compatible:
+    const: raspberrypi,sensehat-joystick
+
+  interrupts:
+    items:
+      - description: pin number for joystick interrupt
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/raspberrypi,sensehat.yaml b/Documentation/devicetree/bindings/mfd/raspberrypi,sensehat.yaml
new file mode 100644
index 000000000000..2484ec91b430
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/raspberrypi,sensehat.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/raspberrypi,sensehat.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi Sensehat
+
+maintainers:
+  - Charles Mirabile <cmirabil@redhat.com>
+  - Mwesigwa Guma <mguma@redhat.com>
+  - Joel Savitz <jsavitz@redhat.com>
+
+description:
+  The Raspberry Pi Sensehat is an addon board originally developed
+  for the Raspberry Pi that has a joystick and an 8x8 RGB LED display
+  as well as several environmental sensors. It connects via i2c and
+  a gpio for irq.
+
+properties:
+  compatible:
+    const: raspberrypi,sensehat
+
+  reg:
+    items:
+      - description: i2c device address
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  "joystick":
+    $ref: ../input/raspberrypi,sensehat-joystick.yaml
+
+  "display":
+    $ref: ../auxdisplay/raspberrypi,sensehat-display.yaml
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - joystick
+  - display
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      sensehat@46 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "raspberrypi,sensehat";
+        reg = <0x46>;
+        display {
+          compatible = "raspberrypi,sensehat-display";
+        };
+        joystick {
+          compatible = "raspberrypi,sensehat-joystick";
+          interrupts = <23 GPIO_ACTIVE_HIGH>;
+        };
+      };
+    };
-- 
2.31.1

