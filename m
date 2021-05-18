Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8B1387953
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 14:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbhERM7Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 May 2021 08:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhERM7P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 May 2021 08:59:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4F8C061760
        for <linux-input@vger.kernel.org>; Tue, 18 May 2021 05:57:57 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lizIE-0002tj-62; Tue, 18 May 2021 14:57:50 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lizID-00077P-PQ; Tue, 18 May 2021 14:57:49 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: touchscreen: Convert resistive-adc-touch binding to json schema
Date:   Tue, 18 May 2021 14:57:45 +0200
Message-Id: <20210518125748.26823-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210518125748.26823-1-o.rempel@pengutronix.de>
References: <20210518125748.26823-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the resistive-adc-touch binding to DT schema format using json-schema.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../input/touchscreen/resistive-adc-touch.txt | 33 ----------
 .../touchscreen/resistive-adc-touch.yaml      | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
deleted file mode 100644
index af5223bb5bdd..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Generic resistive touchscreen ADC
-
-Required properties:
-
- - compatible: must be "resistive-adc-touch"
-The device must be connected to an ADC device that provides channels for
-position measurement and optional pressure.
-Refer to
-https://github.com/devicetree-org/dt-schema/blob/master/schemas/iio/iio-consumer.yaml
-for details
-
- - iio-channels: must have at least two channels connected to an ADC device.
-These should correspond to the channels exposed by the ADC device and should
-have the right index as the ADC device registers them. These channels
-represent the relative position on the "x" and "y" axes.
- - iio-channel-names: must have all the channels' names. Mandatory channels
-are "x" and "y".
-
-Optional properties:
- - iio-channels: The third channel named "pressure" is optional and can be
-used if the ADC device also measures pressure besides position.
-If this channel is missing, pressure will be ignored and the touchscreen
-will only report position.
- - iio-channel-names: optional channel named "pressure".
-
-Example:
-
-	resistive_touch: resistive_touch {
-		compatible = "resistive-adc-touch";
-		touchscreen-min-pressure = <50000>;
-		io-channels = <&adc 24>, <&adc 25>, <&adc 26>;
-		io-channel-names = "x", "y", "pressure";
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
new file mode 100644
index 000000000000..53df21a6589e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic resistive touchscreen ADC
+
+maintainers:
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description: |
+  Generic ADC based resistive touchscreen controller
+  The device must be connected to an ADC device that provides channels for
+  position measurement and optional pressure.
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: resistive-adc-touch
+
+  io-channels:
+    minItems: 2
+    maxItems: 3
+    items:
+      - description: x
+      - description: y
+      - description: pressure (optional)
+
+  io-channel-names:
+    items:
+      - const: x
+      - const: y
+      - const: pressure
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-fuzz-x: true
+  touchscreen-fuzz-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+  touchscreen-min-pressure: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - io-channels
+  - io-channel-names
+
+examples:
+  - |
+    resistive_touch {
+      compatible = "resistive-adc-touch";
+      touchscreen-min-pressure = <50000>;
+      io-channels = <&adc 24>, <&adc 25>, <&adc 26>;
+      io-channel-names = "x", "y", "pressure";
+    };
-- 
2.29.2

