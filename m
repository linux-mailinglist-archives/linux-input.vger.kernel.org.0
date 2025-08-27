Return-Path: <linux-input+bounces-14336-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD05B37E4A
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 11:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AD383AC2B9
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 09:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560EF341ADF;
	Wed, 27 Aug 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BYm4kJGY"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D02B341AB7;
	Wed, 27 Aug 2025 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285466; cv=none; b=hInH+0jVYkSh+q8YoSzGrWfuzUIJHn94YYiLS2S7bMSpYYu8Np3Ecr5Kt1Nhe9bRy+a1x0vZ9JieMtQKwZULzRKD9yyhwHlDjSNzkhlhdWKjAjZ2dZcmmHA6Ls42Ugn5qIaZvs5FiBlSjbX6q09uf8Xvrisb+fKUjCJFeBJoHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285466; c=relaxed/simple;
	bh=+RpJe2xt313pvzyWmm1FpG9QmaJsYu4M/l2cej6ESFQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ByPEKIdLiwpq59kcGm16OP26yNcJbZUz0BloywzQAgyT97MpFjC7PWxHpDUm/CwEvdiiyHwNhXyQGQjfXPvayE6SbikY16GSvL8pCpn+r5QDzdSeO8tNLc0/ZbgRLICT3wfwizitQ2D+ixuIJ18b67/Femm0zah2KajeUvwZGqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BYm4kJGY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756285462;
	bh=+RpJe2xt313pvzyWmm1FpG9QmaJsYu4M/l2cej6ESFQ=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=BYm4kJGYABV9d0yv5RsVER1mkHTkqzdDJMBn5MibYf4CqzzMMNTwJ2TDcKxkUSBpE
	 Vv9//c8jVzXKNxCN1LWQVju6BWkiMIaxIwy+0NC5RWrCkW4QlwYNxxphTXOJ22ELsm
	 fB1qs7gwU0S5ZLfQTaYx7fF+5z4wQ0sls8HvbEzDR51btkyoqKx45JaR3ka3D8clc5
	 CU/5LCboWVyHEbRqUq/PShhhBEqBvL1vWi6xVtZAJK0JchhjyxR5+bt+3losqxisWm
	 zQzOFhPL6e3DIrUz6u1TIZAQz9SvHFTmCEtntcw2PuRUtv1wVSoS7mpMNStrIadIB1
	 oAlF6H3fE3ACg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7513D17E0676;
	Wed, 27 Aug 2025 11:04:21 +0200 (CEST)
Message-ID: <3e0d30b1d717c8788aa95eb045a034c18e33c88e.camel@collabora.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8395-nio-12l: add
 support for blue and red LEDs
From: Julien Massot <julien.massot@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Louis-Alexis Eyraud
 <louisalexis.eyraud@collabora.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	devicetree@vger.kernel.org
Date: Wed, 27 Aug 2025 11:04:20 +0200
In-Reply-To: <20250827-psychic-exclusive-be9758124693@thorsis.com>
References: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
	 <20250826-radxa-nio-12-l-gpio-v2-3-7f18fa3fbfc8@collabora.com>
	 <20250827-psychic-exclusive-be9758124693@thorsis.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Alexander,

On Wed, 2025-08-27 at 09:40 +0200, Alexander Dahl wrote:
> Hello Julien,
>=20
> Am Tue, Aug 26, 2025 at 04:01:54PM +0200 schrieb Julien Massot:
> > The Radxa NIO 12L board has an RGB LED, of which only red and blue
> > are controllable.
> >=20
> > Red and blue LEDs: no need to choose, both are enabled.
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../boot/dts/mediatek/mt8395-radxa-nio-12l.dts=C2=A0=C2=A0=C2=A0=
=C2=A0 | 31
> > ++++++++++++++++++++++
> > =C2=A01 file changed, 31 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > index
> > fd596e2298285361ad7c2fb828feec598d75a73e..12288ad4d2932b7f78c96c0efe36
> > 6a046721f919 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > @@ -10,6 +10,7 @@
> > =C2=A0#include <dt-bindings/gpio/gpio.h>
> > =C2=A0#include <dt-bindings/input/input.h>
> > =C2=A0#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/leds/common.h>
> > =C2=A0#include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> > =C2=A0#include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> > =C2=A0#include <dt-bindings/spmi/spmi.h>
> > @@ -73,6 +74,28 @@ button-volume-up {
> > =C2=A0		};
> > =C2=A0	};
> > =C2=A0
> > +	gpio-leds {
> > +		compatible =3D "gpio-leds";
> > +		pinctrl-0 =3D <&gpio_leds_pins>;
> > +		pinctrl-names =3D "default";
> > +
> > +		/*
> > +		 * This board has a RGB LED, of which only R and B
> > +		 * are controllable.
> > +		 */
> > +		led-0 {
> > +			label =3D "rgb-blue";
> > +			color =3D <LED_COLOR_ID_BLUE>;
> > +			gpios =3D <&pio 6 GPIO_ACTIVE_HIGH>;
> > +		};
> > +
> > +		led-1 {
> > +			label =3D "rgb-red";
> > +			color =3D <LED_COLOR_ID_RED>;
> > +			gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
> > +		};
>=20
> The label property is deprecated, and if I'm not mistaken not
> recommended for new boards.=C2=A0 Do you have a reason to set it?
> If so, it might be worth adding in the commit message.

No, I just wasn=E2=80=99t aware of the deprecation, but I can now see
it in the common LED binding.
I=E2=80=99ll wait a bit for any other potential reviews and then resend
the patch without the label. The LED will then appear as 'blue'
instead of 'rgb-blue' in sysfs.

Regards,
Julien

