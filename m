Return-Path: <linux-input+bounces-5152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C922B93C8F3
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 21:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 061261C21733
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 19:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FF913AA2A;
	Thu, 25 Jul 2024 19:46:15 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83149762EB;
	Thu, 25 Jul 2024 19:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936775; cv=none; b=kD2B6+xaCw0KLSn/TIb6tNSws2SUCrWQL6t5hUoTRV6+HnbBGkuzCWewgSHf6Y+iD23sl6vXMIIU5/gkvTDLBDg5ccrJfvc6QHEYp3GeQzroTGC5vOI8dmxaZ1Xzm2WcxM6P0XpPUF5O7eVOpYjCauR9NtSEJwFYMaBpqrNwyyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936775; c=relaxed/simple;
	bh=IP68vUdNzVSNudRdfpyMCb7gGfeDSlK8BmqYyXksQzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BEXDSbcArf+94MSjPZYtWnfs8S+rX2Zk5EfXiX42aoOI4X6/u6KwTzcTwIvt7dBczUQVjc74up+4/bIlnJ32OpaX/z0IEqVo/udxy+bq3tiwx0styeep1Os0vrkC5WL3jHvapY3GfsH/UXJp4p+IH05wGui6S0vf3HOhTM0iJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e860cdd.versanet.de ([94.134.12.221] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sX4PO-0001rD-6Z; Thu, 25 Jul 2024 21:45:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: mfd: add binding for qnap,mcu devices
Date: Thu, 25 Jul 2024 21:45:33 +0200
Message-Id: <20240725194539.1780790-2-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240725194539.1780790-1-heiko@sntech.de>
References: <20240725194539.1780790-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These MCUs can be found in network attached storage devices made by QNAP.
They are connected to a serial port of the host device and provide
functionality like LEDs, power-control and temperature monitoring.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/mfd/qnap,mcu.yaml     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qnap,mcu.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qnap,mcu.yaml b/Documentation/devicetree/bindings/mfd/qnap,mcu.yaml
new file mode 100644
index 0000000000000..3b1ad8cb54da3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qnap,mcu.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qnap,mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QNAP NAS on-board Microcontroller
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  QNAP embeds a microcontroller on their NAS devices adding system feature
+  as PWM Fan control, additional LEDs, power button status and more.
+
+properties:
+  compatible:
+    enum:
+      - qnap,ts433-mcu
+
+  "#cooling-cells":
+    const: 2
+
+  cooling-levels:
+    description: PWM duty cycle values corresponding to thermal cooling states.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      maximum: 255
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    uart {
+      mcu {
+        compatible = "qnap,ts433-mcu";
+        #cooling-cells = <2>;
+        cooling-levels = <0 64 89 128 166 204 221 238>;
+      };
+    };
-- 
2.39.2


