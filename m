Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76ECFEB850
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2019 21:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbfJaURw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Oct 2019 16:17:52 -0400
Received: from mxa2.seznam.cz ([77.75.76.90]:61100 "EHLO mxa2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbfJaURv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Oct 2019 16:17:51 -0400
Received: from email.seznam.cz
        by email-smtpc13b.ng.seznam.cz (email-smtpc13b.ng.seznam.cz [10.23.14.135])
        id 1c532b08475d7f611dfae756;
        Thu, 31 Oct 2019 21:17:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1572553069; bh=epsWpw9R5YWCuaaD5dKCnUKSIMW/0A+BbYDxS2sK8hw=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=hIcEp/q+IApY8rTKog5+nCDFLfX/Ln1uEjzuRroZCc7oZuvuATqbSCDeZpWkojP3c
         x0sW6Pjv6KsAYgY80ctx7mv4QYERSXX7IJZwHxbpvkKTvkiJX4fSTB72tEkxIo2kMU
         jGYj30s2oSi01K6KL1xJ7QZ3ArdLzxRT1STrt6ZQ=
Received: from localhost.localdomain (212.69.128.228 [212.69.128.228])
        by email-relay26.ng.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Thu, 31 Oct 2019 21:04:29 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: input/touchscreen: add bindings for zinitix
Date:   Thu, 31 Oct 2019 21:02:02 +0100
Message-Id: <20191031200202.8548-2-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191031200202.8548-1-michael.srba@seznam.cz>
References: <20191031200202.8548-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds dts bindings for the zinitix bt541 touchscreen.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 changes since v1: none

 .../bindings/input/touchscreen/zinitix.txt    | 36 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt b/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
new file mode 100644
index 000000000000..250eef2ee907
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
@@ -0,0 +1,36 @@
+Device tree bindings for Zinitx BT541 touchscreen controller
+
+Required properties:
+
+ - compatible		: Should be "zinitix,bt541"
+ - reg				: I2C address of the chip. Should be 0x20
+ - interrupts		: Interrupt to which the chip is connected
+
+Optional properties:
+
+ - vdd-supply		: Analog power supply regulator on VCCA pin
+ - vddo-supply		: Digital power supply regulator on VDD pin
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
+		};
+
+		/* ... */
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbbbffab..0db46da36c7d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1043,6 +1043,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zinitix,.*":
+    description: Zinitix Co., Ltd
   "^zte,.*":
     description: ZTE Corp.
   "^zyxel,.*":
-- 
2.23.0

