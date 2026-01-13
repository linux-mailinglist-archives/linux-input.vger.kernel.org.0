Return-Path: <linux-input+bounces-17064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C9DD1AFE2
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 20:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A724E30B7ACC
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 19:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAAD35F8AC;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaK7WmUd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9998835F8A2;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768331574; cv=none; b=MWr2VeGzBRyHVLdkPcXbUAb9BNo9Pc3kcsogJqgdMANFRVR+cskpAlOT0SnlLsILef5/OLvWWq7pApQnEdVzxKQYdMj6Ue9VdnRrrcWVfreOGsHeHLcQ6pP0Y7Sl3uxRh68ATNOh7EsUvNkZVzO5RCV+5FG8fRYEYKFZzkYIeRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768331574; c=relaxed/simple;
	bh=0kFijDOcv+vm45cY8ChqpQ8slT5vfyOnuCap/rUiGyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NpCOzr/Y4jEFjSJg7ZG17Q6fLFuecOXHyF3AdB+9VLNI7SaVjYSyGkMGZfc7aGY5ocqdZ2iiag9txSmD2K+DFL/4lXYhmTesd30jDApG7xeuMfXnb7SPxqbE8wP+//n5xuq/EGQk1o0NuofU9TT1SOflYx/Ny8U4L2WAdCmU6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaK7WmUd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50871C4AF11;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768331574;
	bh=0kFijDOcv+vm45cY8ChqpQ8slT5vfyOnuCap/rUiGyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oaK7WmUdRHwP5gFz/OZb6hXOtICPNqXw/Irz2C2gSWFBaaHgPtCOFqNZ17EtLPU8i
	 qlad/pRXISdAjLpaiMe3Fx1lry5WKSeVhRc44J2F0QDNfdNqaeSSHXWnswid58PSQV
	 30mOMn7K5KQb4ijIEITmYFzexD6crWmfvIThauwT4vNRgk9lj2rmiaw3Wn4F5IWLwV
	 Ow/TpBpM/3C4gUqdhHWoLc05vny58UJ2UfWBW4jakyWADjfGsJO+EeVuC3tAwBhnLx
	 pa+0Jhfb2BC4SCk25HUIntto3hgzHAGCkKpQD8cP3g1jgKV5FeiDhbsC7dExAhn9Sy
	 I9jTUkxfpvdlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40246D2502E;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Date: Tue, 13 Jan 2026 21:12:37 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add
 Focaltech FT3518 touchscreen
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-touchscreen-patches-v1-3-a10957f32dd8@gmail.com>
References: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
In-Reply-To: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
To: SzczurekYT <szczurek@szczurek.yt>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768331572; l=1665;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=G8tF74xDojoie4elyfMmN4wtgVzbzTbxl5RkQ9cPElA=;
 b=CZNXBSuCbx5TRlVSw/G8H282U6ssHspK3rRxwE2x0mM0EOTPQhSkTnFhdJfNmFi46ejk7NKj+
 n+84X1fOk5OC1VHBoWyaUmRENIzp+wsQgVrfdgLgMdqvFZ1YZlqW6xF
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com

From: Yedaya Katsman <yedaya.ka@gmail.com>

Add device tree node for the Focaltech FT3518 touchscreen on
Xiaomi Mi A3 (laurel-sprout).

Enable qupv3_id_0 and i2c2 bus that the touchscreen is on.

Co-developed-by: SzczurekYT <szczurek@szczurek.yt>
Signed-off-by: SzczurekYT <szczurek@szczurek.yt>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..97feed708d3b6483eab72cfb0ae39be6f5ae3a11 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -119,6 +119,18 @@ active-config0 {
 			};
 		};
 	};
+
+	ts_vdd_supply: ts-vdd-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_vdd_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		startup-delay-us = <70000>;
+	};
 };
 
 &hsusb_phy1 {
@@ -411,3 +423,25 @@ &usb3 {
 &usb3_dwc3 {
 	extcon = <&extcon_usb>;
 };
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "focaltech,ft3518";
+		reg = <0x38>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <88 IRQ_TYPE_EDGE_FALLING>;
+
+		vcc-supply = <&ts_vdd_supply>;
+
+		reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1560>;
+	};
+};

-- 
2.52.0



