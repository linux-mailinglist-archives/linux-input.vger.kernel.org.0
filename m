Return-Path: <linux-input+bounces-3275-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6578B33FC
	for <lists+linux-input@lfdr.de>; Fri, 26 Apr 2024 11:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4F02849BC
	for <lists+linux-input@lfdr.de>; Fri, 26 Apr 2024 09:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D0713E8B2;
	Fri, 26 Apr 2024 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Lejg8FGi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08D213E419;
	Fri, 26 Apr 2024 09:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714123787; cv=none; b=MbNXb519j8U/7m/OZK/1CCyHFu9Vz79eWcPzWVhBkg3ZLVBmwoYwS6WBepo+E+FgON6O19NvJ9z+Q3bSbHkNTOIEiUgaoWzUnQqkJllIBiBbYKGptpvsGA1ktC4EJugCwxZuzfHPOY8plCmZhHCoQZsaOHNGEInS0nVAvOnPv/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714123787; c=relaxed/simple;
	bh=vhWL4TsMiT+ueSiMq1eCaqx+bCRNFM69v9SBRH83wRo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O38o2gjdpyeUYqJA/fpvB+voJlBhCTvu4m43gWRWNaVjRptgNQ7pTYjpujZj+qI00rSh0YLLLQRIt0SqQq1QYxYwNIpkzBkbg4GM9sB8QZ5l44ygS6MvwZtrsRHG6rQMP40mfkAMATm9HooEAPUG3tV4kF7nw3qQ9pXCzH0yfTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Lejg8FGi; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1714123782; x=1714382982;
	bh=GoXvkl2agTiWSX6jA4XFU4wprNl2DE0VQkVFPmYL2qk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Lejg8FGizAWCV2U9FFtlck8B5Ty6U0utO5x7Lb5JnDHwwFKOMXdsB1+yozgiSIcdF
	 Ubk+DFi2BZ5E4m9vUums8ePOT7jlytuLFonmFNbiQP2U0mFPS/ldnh/k5Iw/MkJWUS
	 GQLG58j477/ImUyVujjZoa+pnd4EKlV0c+LE4CY8lKEdEE+vc5+L3D9dN+n2y45Fjd
	 M1m6PJi9Nhpx1ocE9We4+jiaq5/s+uTspoifmGN5CYYqk0LOcU4OKXW0VYE1WY84Ea
	 gMSwgum48PGD4jU2tqd5SEWIOZm3lcZzXiQ6TZakPw55OEbVNeEY/ZdzCWrEI0/T1M
	 fW2zYARj4s4Pg==
Date: Fri, 26 Apr 2024 09:29:37 +0000
To: Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
From: James McGregor <jamcgregor@protonmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/2] arm64: dts: allwinner: H616: Add LRADC
Message-ID: <20240426092924.15489-1-jamcgregor@protonmail.com>
Feedback-ID: 83670259:user:proton
X-Pm-Message-ID: 06a1c2158f7c5eab9994d2a7991a6038f3e8a336
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Version 2 moves the LRADC DT node to the right place. It was out of
order before.

The Allwinner H616 series of SoCs have a low-rate ADC (LRADC) with
6-bit resolution and one input channel. They're compatible with the
existing drivers, so it only needs to be enabled in the DT.

Add an LRADC node to the H616 .dtsi, so board DTs can use them by
adding 'status =3D "okay";'.

This was tested on an OrangePi Zero 2W by attaching an expansion board
with two key buttons connected to the LRADC, and adding them to the DT.
/dev/input/event0 then properly reported the button presses. The patches
are based off sunxi/for-next.

James McGregor (2):
  dt-bindings: input: sun4i-lradc-keys: Add H616 compatible
  ARM: dts: sun50i: Add LRADC node

 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml |  4 +++-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi         | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

--=20
2.34.1



