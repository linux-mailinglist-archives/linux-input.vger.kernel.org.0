Return-Path: <linux-input+bounces-879-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571CE81952F
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 01:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DAD82884D7
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 00:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80391DFD1;
	Wed, 20 Dec 2023 00:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="EYyLb4pB"
X-Original-To: linux-input@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BECE1D543;
	Wed, 20 Dec 2023 00:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1703031813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ofG5Can+ZciJ6C/R5Us91iUFRiF2X0DgCmjFbEUpMxg=;
	b=EYyLb4pB85gKl1EUPfxOhFKSpWKlFXWhpCta0HdrQlXtMi4XLTd9fb6bl66fxc4chLuv53
	CXLVMfJwoW1wQXsDyzgaQFZeQpt678SZ2TFsu/nCP48Jp0/3ZEAgIDQCMekopW3VE7HiQj
	qqLdS/CcIZf9gdGvCqak8ZclwkTtj/Q=
Message-ID: <fb38504f15148c78c7a91850daf8c247d592b0a0.camel@crapouillou.net>
Subject: Re: [RFC] dt-bindings: input: Clarify that abs_min must be less
 than abs_max
From: Paul Cercueil <paul@crapouillou.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Artur Rojek
	 <contact@artur-rojek.eu>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, Chris Morgan
	 <macromorgan@hotmail.com>
Date: Wed, 20 Dec 2023 01:23:31 +0100
In-Reply-To: <ZYH97KVDO4lFsbmi@google.com>
References: <20231215024022.122022-1-macroalpha82@gmail.com>
	 <03a9a56362b0559234d4a21a4de3e32e@artur-rojek.eu>
	 <ZYH97KVDO4lFsbmi@google.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
	YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Dmitry,

Le mardi 19 d=C3=A9cembre 2023 =C3=A0 12:32 -0800, Dmitry Torokhov a =C3=A9=
crit=C2=A0:
> On Fri, Dec 15, 2023 at 12:19:51PM +0100, Artur Rojek wrote:
> > On 2023-12-15 03:40, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >=20
> > > uinput refuses to work with abs devices where the min value is
> > > greater
> > > than the max value. uinput_validate_absinfo() returns -EINVAL if
> > > this
> > > is the case and prevents using uinput on such a device. Since
> > > uinput
> > > has worked this way since at least kernel 2.6 (or prior) I
> > > presume that
> > > this is the correct way of doing things, and that this
> > > documentation
> > > needs to be clarified that min must always be less than max.
> > >=20
> > > uinput is used in my use case to bind together adc-joystick
> > > devices
> > > with gpio-keys devices to create a single unified gamepad for
> > > userspace.
> > >=20
> > > Note that there are several boards that will need to be
> > > corrected,
> > > all but a few of them I maintain. Submitting as an RFC for now to
> > > get
> > > comments from the input team and the original author in case
> > > there is
> > > something I am missing.
> > >=20
> > > Fixes: 7956b0d4694f ("dt-bindings: input: Add docs for ADC driven
> > > joystick")
> > >=20
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > > =C2=A0Documentation/devicetree/bindings/input/adc-joystick.yaml | 5
> > > +++--
> > > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/input/adc-
> > > joystick.yaml
> > > b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > index 6c244d66f8ce..8f5cdd5ef190 100644
> > > --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > @@ -73,8 +73,9 @@ patternProperties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: >
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Minimum =
and maximum values produced by the axis.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For an A=
BS_X axis this will be the left-most and
> > > right-most
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inclination o=
f the joystick. If min > max, it is left
> > > to
> > > userspace to
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 treat the axi=
s as inverted.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inclination o=
f the joystick. The axis must always be
> > > expressed as
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min < max, if=
 the axis is inverted it is left to
> > > userspace to
> > > handle
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the inversion=
.
> >=20
> > Hi Chris,
> >=20
> > Device Tree is supposed to depict the actual state of the hardware.
> > I worded the adc-joytick's adc-range property specifically, so that
> > it
> > covers a case of GCW Zero hardware [1], which has a joystick,=C2=A0
> > where the
> > ABS_X axis reports increasing values for the left-wards inclination
> > of
> > the joystick, and decreasing values for the right-wards
> > inclination. You
> > are saying that there are even more boards that need to be
> > corrected -
> > those are all situations, where DT depicts the actual behavior of
> > the
> > hardware.
> > What you are trying to do is change hardware description, because
> > of how
> > a driver in an OS works. You should instead fix behavior of said
> > driver,
> > even if nobody stumbled upon that issue since 2.6 :) We fixed
> > libSDL [2]
> > for the same reason.
>=20
> We have several places in the kernel (such as mousedev and joydev)
> where
> we expect that max is greater or equal to min if they are specified.
> I
> am sure that at least some userspace components also have this
> assumption. In general, we expect min to be a minimum value reported
> and
> max being maximum value reported, and orientation expressed via
> different properties (see [1]).

You can express all you want in DT properties the orientation of the
axis, it does not carry to userspace. As far as I can see there is
absolutely no way to tell userspace that an axis is inverted.

Cheers,
-Paul

>=20
> Since we codified min > max as inversion for adc-joystick devices in
> the
> bindings, I think we need to handle this *in that driver* and leave
> the
> rest alone.
>=20
> [1]
> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
>=20
> Thanks.
>=20


