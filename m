Return-Path: <linux-input+bounces-6264-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8096E25A
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 20:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A393D1F270A2
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 18:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4105719FA8D;
	Thu,  5 Sep 2024 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EeRxgour"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9B18DF78;
	Thu,  5 Sep 2024 18:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725562372; cv=none; b=VJBcvJcQSaBUIaGPfbuqrxxeQfVeEatbN4tMvgbPt3VsAyygDgHdrVRtaU/EV7gKisPzPTLo/Rm7iEmXec3WNkMYSnDInkttBq9fG5jfb01bB5No8Q9sIdTE0h3Nf5TCx2k7D9obMxfAhmTjPSsIqMyZMszcskXAVFRI+Ak5rUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725562372; c=relaxed/simple;
	bh=I1ayERe8+MKL+sKOTVHqL9vNWgJrFIP3xM5InJN9/c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rp4Q8S3ID1HoM04ZmJX0jG+c5C6NVaSG8UgfRe0x1toNjF5H5Efvi4uMZ4kOv4jQSAFqFXxM32lm45Qv6OtyfZtv61oP8TTnhKb6OotvPB1X3Kg9vJ1fTosw/Yz3iyYS2PxvYSNsAq0d20JglBIZcJ8smLarBCgMo+Z56PHeoU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EeRxgour; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OX2mDGoNhn5NuPQsdotMoW4uOBKIyWHrefRAShTe53U=; b=EeRxgour15Ya5XHLTphGx1wZz2
	S+5glFb4R3wmamLqsaGdrXKfJV08lBq/5f8Xg8mFa/KGKPFV6BtvPPHgZ6hOkjZjAKRhUsuBgkDRh
	SB0+0HdF2sXr3Bo/JPnpf5QkVjT3Z3EUxEdGuCyA7X8oj0ZrQ+Rc1wW+m4V0nvJWLCcPTaWP6eiCf
	9q4/CiI5VNdXk/KyLbu3zqkUleAAJAEP1zwhv9z3PFgk2sEc5FlsS5s2BNDnGOieBK8OzFrI5JNfP
	GenWoQ0xDgvpn1pZONWYUYJiiM925KbDwb7Jddg8XnpNQa+a9/qgJ+n1mIv3/d2U3U0NCEOqktpyC
	ts8AeFtw==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1smHb0-0003sR-QH; Thu, 05 Sep 2024 20:52:42 +0200
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
	linux-leds@vger.kernel.org
Subject: [PATCH v7 7/8] arm64: dts: rockchip: hook up the MCU on the QNAP TS433
Date: Thu,  5 Sep 2024 20:52:31 +0200
Message-ID: <20240905185232.2899464-8-heiko@sntech.de>
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
 .../boot/dts/rockchip/rk3568-qnap-ts433.dts   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index e601d9271ba8..4bc5f5691d45 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -483,6 +483,54 @@ rgmii_phy0: ethernet-phy@0 {
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
@@ -582,6 +630,15 @@ &tsadc {
  */
 &uart0 {
 	status = "okay";
+
+	mcu {
+		compatible = "qnap,ts433-mcu";
+
+		fan: fan-0 {
+			#cooling-cells = <2>;
+			cooling-levels = <0 64 89 128 166 204 221 238>;
+		};
+	};
 };
 
 /*
-- 
2.43.0


