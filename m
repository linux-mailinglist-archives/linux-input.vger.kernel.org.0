Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E29DAFA
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 06:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfD2ES5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 00:18:57 -0400
Received: from p3plsmtpa12-07.prod.phx3.secureserver.net ([68.178.252.236]:33834
        "EHLO p3plsmtpa12-07.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726014AbfD2ES5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 00:18:57 -0400
Received: from localhost.localdomain ([136.49.227.119])
        by :SMTPAUTH: with ESMTPSA
        id KxkjhklQ6ZCuPKxkmh2EYf; Sun, 28 Apr 2019 21:18:56 -0700
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc:     linux-input@vger.kernel.org, rydberg@bitmath.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v9 1/2] dt-bindings: input: touchscreen: iqs5xx: Add bindings
Date:   Sun, 28 Apr 2019 23:18:43 -0500
Message-Id: <1556511524-7850-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
X-CMAE-Envelope: MS4wfBW3p5ZEH1NB2R0Upd2yZ82jlSLJRoV6UB8l1rfYy55ge+tnmpy7Jamvz+m18WMmPYD9O4G1RBv+pK1bCvr0DKPUp5YLZStExKKgIKaCs1rz3TLWtlz8
 LumgCqy+vYZeUPR+su46PXS3Wi4gbKe4hHSDySGEajyWyPCIJAsUrZAbZgYspi3srZ8/uhSUoxFKnb34am4Cx2g2vTvbqdROWbXWIlTlwzGB+e0MhNuqfLvk
 zxMM23q93djRcZgsBlSdATxkKH6T/0/ZTlE89nRKoDUiGxItIpcxxylQ9+u88tinBfhaEfwv8XVO9L28i35a9+8aTiUz0lLcqEdAXMkqP7LiB5jmX3MjhBYJ
 qDxDYEGegk+YlvY5cLqXG2mpx0dHBQ==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds binding documentation for the Azoteq IQS550/572/525
family of trackpad/touchscreen controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v9:
  - Corrected the polarity of the reset GPIO in the example node to match that
    of the device's active-low NRST pin
  - Removed previous Reviewed-by trailer as this file has since changed

Changes in v8:
  - Added Reviewed-by trailer

Changes in v7:
  - Removed the azoteq,exp-ver-major and azoteq,exp-ver-minor properties to
    match the driver's updated device identification scheme
  - Updated the example node to use a level-sensitive interrupt rather than
    an edge-sensitive interrupt
  - Removed previous Reviewed-by trailer as this file has since changed

Changes in v6:
  - None

Changes in v5:
  - None

Changes in v4:
  - None

Changes in v3:
  - Added Reviewed-by trailer

Changes in v2:
  - Separated each valid "compatible" property with a line break
  - Specified the polarity of the RDY and NRST pins
  - Replaced duplicate definitions of common touchscreen properties with a
    reference to touchscreen.txt
  - Specified the example node as "touchscreen@74"

 .../bindings/input/touchscreen/iqs5xx.txt          | 80 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
new file mode 100644
index 0000000..efa0820
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
@@ -0,0 +1,80 @@
+Azoteq IQS550/572/525 Trackpad/Touchscreen Controller
+
+Required properties:
+
+- compatible			: Must be equal to one of the following:
+				  "azoteq,iqs550"
+				  "azoteq,iqs572"
+				  "azoteq,iqs525"
+
+- reg				: I2C slave address for the device.
+
+- interrupts			: GPIO to which the device's active-high RDY
+				  output is connected (see [0]).
+
+- reset-gpios			: GPIO to which the device's active-low NRST
+				  input is connected (see [1]).
+
+Optional properties:
+
+- touchscreen-min-x		: See [2].
+
+- touchscreen-min-y		: See [2].
+
+- touchscreen-size-x		: See [2]. If this property is omitted, the
+				  maximum x-coordinate is specified by the
+				  device's "X Resolution" register.
+
+- touchscreen-size-y		: See [2]. If this property is omitted, the
+				  maximum y-coordinate is specified by the
+				  device's "Y Resolution" register.
+
+- touchscreen-max-pressure	: See [2]. Pressure is expressed as the sum of
+				  the deltas across all channels impacted by a
+				  touch event. A channel's delta is calculated
+				  as its count value minus a reference, where
+				  the count value is inversely proportional to
+				  the channel's capacitance.
+
+- touchscreen-fuzz-x		: See [2].
+
+- touchscreen-fuzz-y		: See [2].
+
+- touchscreen-fuzz-pressure	: See [2].
+
+- touchscreen-inverted-x	: See [2]. Inversion is applied relative to that
+				  which may already be specified by the device's
+				  FLIP_X and FLIP_Y register fields.
+
+- touchscreen-inverted-y	: See [2]. Inversion is applied relative to that
+				  which may already be specified by the device's
+				  FLIP_X and FLIP_Y register fields.
+
+- touchscreen-swapped-x-y	: See [2]. Swapping is applied relative to that
+				  which may already be specified by the device's
+				  SWITCH_XY_AXIS register field.
+
+[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+[1]: Documentation/devicetree/bindings/gpio/gpio.txt
+[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+
+Example:
+
+	&i2c1 {
+		/* ... */
+
+		touchscreen@74 {
+			compatible = "azoteq,iqs550";
+			reg = <0x74>;
+			interrupt-parent = <&gpio>;
+			interrupts = <17 4>;
+			reset-gpios = <&gpio 27 1>;
+
+			touchscreen-size-x = <640>;
+			touchscreen-size-y = <480>;
+
+			touchscreen-max-pressure = <16000>;
+		};
+
+		/* ... */
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8..51f9954 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -53,6 +53,7 @@ avic	Shanghai AVIC Optoelectronics Co., Ltd.
 avnet	Avnet, Inc.
 axentia	Axentia Technologies AB
 axis	Axis Communications AB
+azoteq	Azoteq (Pty) Ltd
 bananapi BIPAI KEJI LIMITED
 bhf	Beckhoff Automation GmbH & Co. KG
 bitmain	Bitmain Technologies
--
2.7.4

