Return-Path: <linux-input+bounces-3277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 020638B3401
	for <lists+linux-input@lfdr.de>; Fri, 26 Apr 2024 11:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE1A3284B66
	for <lists+linux-input@lfdr.de>; Fri, 26 Apr 2024 09:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B9C13F42A;
	Fri, 26 Apr 2024 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="X5BgBOH+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7897513F422;
	Fri, 26 Apr 2024 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714123797; cv=none; b=D9k1t0ISSlhdggCjxnJmwS0hneCA/c1nFjrLlWyM7/p776ttwEqzPUmqCmgc0hCGPKeIG32b9M2xhdfPsVzAMb+XUggC+tOonFW110dF39G2SsPvNi6iQXrbe8h7CefkTgqVy8JFFtHzpzfNIBS1JzuAu8lHqVceLEkMTGa2Sws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714123797; c=relaxed/simple;
	bh=sx8Pxj3Yd+hfnhbKFAeUw/Vd9gJg8B/6v/pp8znps4M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ejNy1ycn+vLtWRbQzpOhjQhwmTr8T0Tg925twK9W/0/IRj6p1yMzp/eMZhYKl6mJUUM8j5yZo3gcPWPit1OQwaTRYlOs+7bOz8o9fXT1/oVRgARvqpNDMrUIT0Gi3f3GtsvVewk2TZR5VpB74nLfj7acYf4qYogjOlgFIcCFPc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=X5BgBOH+; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1714123794; x=1714382994;
	bh=7WxpZMdg3EZmGrATmPvkRyZYicG/SWQxlQq7eqn29DQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=X5BgBOH+5p2Lg/t2MgOl4lqwnHbXTJNi1VegpmoXOecJOYuzCfxyj+jLKxsVJ4rFE
	 r1xnPZlbCCOwYQFhspgf6fBrxLzWEc7zdZLnmOvKJPaDOHH6QAAHNKApZQuDHduyyz
	 w9NBGz6KssNwUWK+bry1XJ1F5h8DmciaJFisKe1R4vZBrAIYsuXp7Zk0xRuKhDPZTy
	 0CmhodEfJ00JIY4GQWT3qpuDWvqPpANo/V8TjmMUPOJf1voX4t7OENhHE23nVsmYO3
	 LK8Xixt/JK+Xxf3Awk8cq0ak79lW76PkwGEllFpD28aKhcJQgBCzFAGBUm8G9sPSde
	 sbaviabnWqabw==
Date: Fri, 26 Apr 2024 09:29:48 +0000
To: Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
From: James McGregor <jamcgregor@protonmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/2] ARM: dts: sun50i: Add LRADC node
Message-ID: <20240426092924.15489-3-jamcgregor@protonmail.com>
In-Reply-To: <20240426092924.15489-1-jamcgregor@protonmail.com>
References: <20240426092924.15489-1-jamcgregor@protonmail.com>
Feedback-ID: 83670259:user:proton
X-Pm-Message-ID: 000efd86400ecf223551e437dab467ed1dc8ad71
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a DT node for the Allwinner H616 LRADC describing the base address,
interrupt, reset and clock gates.

Signed-off-by: James McGregor <jamcgregor@protonmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
V1 -> V2: Moved DT node to correct place in tree order

 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h616.dtsi
index a061b69c07c2..1e8538ca7db0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -594,6 +594,16 @@ ths: thermal-sensor@5070400 {
 =09=09=09#thermal-sensor-cells =3D <1>;
 =09=09};
=20
+=09=09lradc: lradc@5070800 {
+=09=09=09compatible =3D "allwinner,sun50i-h616-lradc",
+=09=09=09=09     "allwinner,sun50i-r329-lradc";
+=09=09=09reg =3D <0x05070800 0x400>;
+=09=09=09interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09clocks =3D <&ccu CLK_BUS_KEYADC>;
+=09=09=09resets =3D <&ccu RST_BUS_KEYADC>;
+=09=09=09status =3D "disabled";
+=09=09};
+
 =09=09usbotg: usb@5100000 {
 =09=09=09compatible =3D "allwinner,sun50i-h616-musb",
 =09=09=09=09     "allwinner,sun8i-h3-musb";
--=20
2.34.1



