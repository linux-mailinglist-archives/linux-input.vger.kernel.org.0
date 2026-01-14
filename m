Return-Path: <linux-input+bounces-17088-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA5D1D8BA
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 10:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67C103012A98
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 09:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACE03815FF;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHzI8L7l"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650CA26F2A6;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383071; cv=none; b=MRkucYdYvTxWJsTI9/8lvpg3DRSwvSZay7QEbjy0LqVJvwqjh42Vk6Ipc4BwknMqcDGGmN1wvcbwpgmoIFriMdR3V74DV4WD6qt/WsiKbFWis/LPjgxnsKhEDE/yLi8mFVGdNicjtKhygaMvQT4ernfQa2u9Ayxuuyo6oMiah1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383071; c=relaxed/simple;
	bh=RgeYDDDmsFG1wcxEabah3hUZIil3+jDplhO0Zwj2PIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJcK4urkmYYRYfNy6/QfzVJ48SJRTeZxDbfqzpWlIYg/OI9HoKy7Z/VSjLvBKNUJLL1MySM57I8hB1+2cpkRgUzdW+wnrMnEBduSz24HCzB6wD0C4rAugptm0WH1xE3veI3ii/WPj+v53uTxwgb0Dhl9tepfqh9d11zBIZ1V4vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHzI8L7l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DD41C2BC87;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768383071;
	bh=RgeYDDDmsFG1wcxEabah3hUZIil3+jDplhO0Zwj2PIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kHzI8L7luNZ1grbpWtyj9eBH1XZcvhQcqSef9jNlFW7Yjollvq6s7gGnI3s+hoq6Z
	 tp1TaYtf6n10p77XErtmTJh8X8o23E7ofjVX+7EAWBXUZhOAY04IVqKJMAwKj8O9ma
	 CSLk5keABCXBZKe7iVNuCanhQXjozeXeA5cu4ajac1Zj+Pk4hEwDDiSLHyVqt4LnNR
	 VJF1ZR4aXUazPbCUnvGVhYknjFDDxhOubtN+m5oyAlgwpcINbBZ4phbH0tqgUL68sP
	 ZpVXZsOEejyHVkkktbIzel5rDYTb6Yo95WQJXJnzCl4gAv1kwDaFTDmGnCLNKsrWw7
	 oIP69yd94lc9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27498D31A3A;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Date: Wed, 14 Jan 2026 11:31:08 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add
 Focaltech FT3518 touchscreen
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-touchscreen-patches-v2-3-4215f94c8aba@gmail.com>
References: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
In-Reply-To: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
To: SzczurekYT <szczurek@szczurek.yt>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768383069; l=1681;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=MQJDxZRgMMx3ymnN/gSLrkJOIC2BOYzM4jCwI34QWOw=;
 b=nhZraJq9d/+bygyeCl7Xsit4hrgVv8uGiJcOqb/KP82EqguEJo1GsQmj/fuo+ip0ZI+QB+wB+
 SpQZQOsikcDAcTPidehMgtub4Eq68Ek4EisGQighE+vYhdTe7B+tutN
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

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
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



