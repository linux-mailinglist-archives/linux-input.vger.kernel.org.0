Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133CA176568
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 21:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCBUzZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 15:55:25 -0500
Received: from mxa1.seznam.cz ([77.75.78.90]:42117 "EHLO mxa1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726579AbgCBUzY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Mar 2020 15:55:24 -0500
Received: from email.seznam.cz
        by email-smtpc11b.ko.seznam.cz (email-smtpc11b.ko.seznam.cz [10.53.14.75])
        id 2b9617137098437a2a3fdb4d;
        Mon, 02 Mar 2020 21:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1583182514; bh=PrVyWKz+cStZKFUbfG88xeiAHpw+y5USeILJtHAAfcU=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=NA++ZvB7/6OZBV1Cnxjlju81CR0v1UVWTJjLbPPZqXXugCLxpek+lEiueRwZcYT/R
         xlv7qgvf7WNpvlGXhjkOWyqPmecLzkt6Y7zn6EGC4rxBXswA+etykz+JWcWwERl1qY
         BEMH/f4V+1zC17eMS7SAoJJCVSgf6emiE9oXSlNo=
Received: from localhost.localdomain (212.69.128.228 [212.69.128.228])
        by email-relay4.ko.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Mon, 02 Mar 2020 21:55:11 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v3 2/2][PATCH RESEND] dt-bindings: input/touchscreen: add bindings for zinitix
Date:   Mon,  2 Mar 2020 21:12:16 +0100
Message-Id: <20200302201216.12410-2-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200302201216.12410-1-michael.srba@seznam.cz>
References: <20200302201216.12410-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds dts bindings for the zinitix bt541 touchscreen.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 changes in v2: none
 changes in v3: document zinitix,mode property


 .../bindings/input/touchscreen/zinitix.txt    | 40 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt b/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
new file mode 100644
index 000000000000..446efb9f5f55
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
@@ -0,0 +1,40 @@
+Device tree bindings for Zinitx BT541 touchscreen controller
+
+Required properties:
+
+ - compatible		: Should be "zinitix,bt541"
+ - reg			: I2C address of the chip. Should be 0x20
+ - interrupts		: Interrupt to which the chip is connected
+
+Optional properties:
+
+ - vdd-supply		: Analog power supply regulator on VCCA pin
+ - vddo-supply		: Digital power supply regulator on VDD pin
+ - zinitix,mode		: Mode of reporting touch points. Some modes may not work
+			  with a particular ts firmware for unknown reasons. Available
+			  modes are 1 and 2. Mode 2 is the default and preferred.
+
+The touchscreen-* properties are documented in touchscreen.txt in this
+directory.
+
+Example:
+
+	i2c@00000000 {
+		/* ... */
+
+		bt541@20 {
+			compatible = "zinitix,bt541";
+			reg = <0x20>;
+			interrupt-parent = <&msmgpio>;
+			interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&tsp_default>;
+			vdd-supply = <&reg_vdd_tsp>;
+			vddo-supply = <&pm8916_l6>;
+			touchscreen-size-x = <540>;
+			touchscreen-size-y = <960>;
+			zinitix,mode = <2>;
+		};
+
+		/* ... */
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..1b0b5e23267d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1066,6 +1066,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zinitix,.*":
+    description: Zinitix Co., Ltd
   "^zte,.*":
     description: ZTE Corp.
   "^zyxel,.*":
-- 
2.24.0
