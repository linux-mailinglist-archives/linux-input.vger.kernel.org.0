Return-Path: <linux-input+bounces-5260-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D288C9437CA
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 23:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9125A281F81
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 21:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A33016CD33;
	Wed, 31 Jul 2024 21:24:57 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231046EB5C;
	Wed, 31 Jul 2024 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722461097; cv=none; b=hLhmD+PL89DfQ+1O2+v/AeXsEFNRdWF+t+nIjx9js4zlkH3oPKqZQ4Aib+K3AFH9jnO3AbE296ggDvMa5sZWlFVOSARheA0GRltrqZvuwBIcbLGDKmK9GiJ33mUIAGES+ZdegHsjq4zrxxkUwcFvpKRwGQ1ZPG8lQHQ/mYhfuhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722461097; c=relaxed/simple;
	bh=09KivGoGc4Pv0IQGH9j0x6dXZZIgfM7SGRm7MhgvkAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WEW4nCmXTNTu8dfuz5Krvb/RaDYd290ROA322guXPg4JAVRh1BttWhYZWXjRiEsM1KBn5kIKctpPp0gw2NOCqwGR76rJoL5NWV5+nyStxmsrdgs6aN6SUR0BfcVwdRDpdOzQCWYD/ACMaE4jQ9zs4TQp8/Xmsy8742t7k2Jlgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875ac5.versanet.de ([83.135.90.197] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sZGoP-0007jg-SP; Wed, 31 Jul 2024 23:24:45 +0200
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
Subject: [PATCH v3 6/7] arm64: dts: rockchip: hook up the MCU on the QNAP TS433
Date: Wed, 31 Jul 2024 23:24:29 +0200
Message-Id: <20240731212430.2677900-7-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731212430.2677900-1-heiko@sntech.de>
References: <20240731212430.2677900-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MCU is an important part of the device functionality. It provides
functionality like fan-control, more leds, etc and even more important
without it, the NAS-device cannot even fully turned off.

Hook up the serial device to its uart and hook into the thermal
management to control the fan according to the cpu temperature.

While the MCU also provides a temperature sensor for the case, this one
is just polled and does not provide functionality for handling trip
points in hardware, so a lot of polling would be involved.
As the cpu is only cooled passively in these devices, it's temperature
rising will indicate the temperature level of the system just earlier.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3568-qnap-ts433.dts   | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 6c4269b3d9597..bff21684a3970 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -465,6 +465,54 @@ rgmii_phy0: ethernet-phy@0 {
 	};
 };
 
+/*
+ * The MCU can provide system temperature too, but only by polling and of
+ * course also cannot set trip points. So attach to the cpu thermal-zone
+ * instead to control the fan.
+ */
+&cpu_thermal {
+	trips {
+		case_fan0: case-fan0 {
+			hysteresis = <2000>;
+			temperature = <35000>;
+			type = "active";
+		};
+
+		case_fan1: case-fan1 {
+			hysteresis = <2000>;
+			temperature = <45000>;
+			type = "active";
+		};
+
+		case_fan2: case-fan2 {
+			hysteresis = <2000>;
+			temperature = <65000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		/*
+		 * Always provide some air movement, due to small case
+		 * full of harddrives.
+		 */
+		map1 {
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+			trip = <&case_fan0>;
+		};
+
+		map2 {
+			cooling-device = <&fan 2 3>;
+			trip = <&case_fan1>;
+		};
+
+		map3 {
+			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
+			trip = <&case_fan2>;
+		};
+	};
+};
+
 &pcie30phy {
 	data-lanes = <1 2>;
 	status = "okay";
@@ -563,6 +611,12 @@ &tsadc {
  */
 &uart0 {
 	status = "okay";
+
+	fan: mcu {
+		compatible = "qnap,ts433-mcu";
+		#cooling-cells = <2>;
+		cooling-levels = <0 64 89 128 166 204 221 238>;
+	};
 };
 
 /*
-- 
2.39.2


