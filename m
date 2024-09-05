Return-Path: <linux-input+bounces-6265-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2409896E260
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 20:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50EA71C22FBB
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 18:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7B61A3AAB;
	Thu,  5 Sep 2024 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="g27V/o59"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27D919DFAE;
	Thu,  5 Sep 2024 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725562373; cv=none; b=ovGiOP8q8Uay2hPpcSZ4fHCk3OT1DC9pN+O1DiTp2Bjdfue1KtPLmKZDyRu3xPU/B9w46J+3KRwlxO1w8zN0FiyM5WMl1+lnsCVjGGjYMAqvcClbbu7xjEZKJ/AyCSVWU8OE8DxfJagPM8FCZpH6e8/CgonbLefpI7eeaFssdcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725562373; c=relaxed/simple;
	bh=iqySBVgrCYk4SEf5Smqb0R4Fqpk7CWOcEPykIQqXkH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBlPuinSC9d6Gjs5YMeBiB2GRx+d3pdO6p2MirzwUox3+mnb5l4JgvMEASTQAqLmFewjv/wuezfpZg/pJO1bx6tPINAG1XeLlXz7FYBhV8wPOv+anNsSuEtATfRlRRPghaPl+UpmeY3Hbgi7vvLnPVfaP0UmGr3VadHPm487K/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=g27V/o59; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bN6g5LuUOiaBgVx2RDzw9SfT+Ft8rUzg+cw1TiUo10A=; b=g27V/o59LNxWoNbaCSB6thYih5
	l2oEdnCb/MzcowtwFYnPlmmx/GG/kINEuib6nUQQTg9VDBWFV84OdCWdBpsflYCjtFVZMfsRLIvGk
	JmQPlJ8QMOpgJq/RRlZhqBujlfv4g8G+9yVNtANV4APPQxw3IRlrgo59/UgjXsf0yZIAJVCou3D1E
	jSqIyPK5DCrP10K1omTfVYj/fD20UtOXhAw3yHWteS+byO+d2hrtlTXmwGJTdOr/3B7Y2CVZjmLjk
	KfaT4jiRRAOVROCG90WHyLv0SJxrsxAp2Ti80UP4+23JwHGts5M8J18ZOF5NASVJd8BTK4+U++B+R
	XYczvFnA==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1smHax-0003sR-C6; Thu, 05 Sep 2024 20:52:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	heiko@sntech.de,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 2/8] dt-bindings: mfd: add binding for qnap,ts433-mcu devices
Date: Thu,  5 Sep 2024 20:52:26 +0200
Message-ID: <20240905185232.2899464-3-heiko@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905185232.2899464-1-heiko@sntech.de>
References: <20240905185232.2899464-1-heiko@sntech.de>
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

LEDs, buttons, etc are all elements of the MCU firmware itself, so don't
need devicetree input, though the fan gets its cooling settings from
a fan-0 subnode.

A binding for the LEDs for setting the linux-default-trigger may come
later, once all the LEDs are understood and ATA controllers actually
can address individual port-LEDs, but are really optional.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/mfd/qnap,ts433-mcu.yaml          | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml b/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
new file mode 100644
index 000000000000..877078ac172f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qnap,ts433-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QNAP NAS on-board Microcontroller
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  QNAP embeds a microcontroller on their NAS devices adding system feature
+  as PWM Fan control, additional LEDs, power button status and more.
+
+properties:
+  compatible:
+    enum:
+      - qnap,ts433-mcu
+
+patternProperties:
+  "^fan-[0-9]+$":
+    $ref: /schemas/hwmon/fan-common.yaml#
+    unevaluatedProperties: false
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
+
+        fan-0 {
+          #cooling-cells = <2>;
+          cooling-levels = <0 64 89 128 166 204 221 238>;
+        };
+      };
+    };
-- 
2.43.0


