Return-Path: <linux-input+bounces-881-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C748195C7
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 01:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3C4289252
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 00:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3606BB658;
	Wed, 20 Dec 2023 00:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="QTDae2aO"
X-Original-To: linux-input@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3CA8BEB
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 00:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1703032721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YWh3YM95PfGapLaObaYkg5krptXBwvONTsKa1OQBHnU=;
	b=QTDae2aOKOPYjzRkAAnWyGIRWoe1rptIo+yXvyOyAndVTwJ55BdPDWXmLQ5oI8pIE0Ki3z
	C3EeYRbJxBR2erFkca0QTGTvrwhsgH/RCGy7h9B6KGUD5YgfYvlk8fs9SG0bKrJu7nBEGP
	OzmK8vNnKlXp8LtX9MoIHH1FtBL/qLU=
Message-ID: <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
From: Paul Cercueil <paul@crapouillou.net>
To: Peter Hutterer <peter.hutterer@who-t.net>, Chris Morgan
	 <macroalpha82@gmail.com>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, svv@google.com, 
	biswarupp@google.com, contact@artur-rojek.eu, Chris Morgan
	 <macromorgan@hotmail.com>
Date: Wed, 20 Dec 2023 01:38:39 +0100
In-Reply-To: <20231219235149.GA3401344@quokka>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
	 <20231219235149.GA3401344@quokka>
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

Hi Peter,

Le mercredi 20 d=C3=A9cembre 2023 =C3=A0 09:51 +1000, Peter Hutterer a =C3=
=A9crit=C2=A0:
> On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> >=20
> > Stop checking if the minimum abs value is greater than the maximum
> > abs
> > value. When the axis is inverted this condition is allowed. Without
> > relaxing this check, it is not possible to use uinput on devices in
> > userspace with an inverted axis, such as the adc-joystick found on
> > many handheld gaming devices.
>=20
> As mentioned in the other thread [1] a fair bit of userspace relies
> on
> that general assumption so removing it will likely cause all sorts of
> issues.

There is some userspace that works with it though, so why restrict it
artificially?

The fact that some other userspace code wouldn't work with it sounds a
bit irrelevant. They just never encountered that min>max usage before.

And removing this check won't cause all sort of issues, why would it?
It's not like the current software actively probes min>max and crash
badly if it doesn't return -EINVAL...

Cheers,
-Paul

>=20
> Cheers,
> =C2=A0=C2=A0 Petre
>=20
> [1]
> https://lore.kernel.org/linux-input/20231219234803.GA3396969@quokka/T/#t
> >=20
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> > =C2=A0drivers/input/misc/uinput.c | 9 +--------
> > =C2=A01 file changed, 1 insertion(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/input/misc/uinput.c
> > b/drivers/input/misc/uinput.c
> > index d98212d55108..e90dbf2c0b34 100644
> > --- a/drivers/input/misc/uinput.c
> > +++ b/drivers/input/misc/uinput.c
> > @@ -403,14 +403,7 @@ static int uinput_validate_absinfo(struct
> > input_dev *dev, unsigned int code,
> > =C2=A0	min =3D abs->minimum;
> > =C2=A0	max =3D abs->maximum;
> > =C2=A0
> > -	if ((min !=3D 0 || max !=3D 0) && max < min) {
> > -		printk(KERN_DEBUG
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s: invalid abs[%02x] min:%d m=
ax:%d\n",
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UINPUT_NAME, code, min, max);
> > -		return -EINVAL;
> > -	}
> > -
> > -	if (!check_sub_overflow(max, min, &range) && abs->flat >
> > range) {
> > +	if (!check_sub_overflow(max, min, &range) && abs->flat >
> > abs(range)) {
> > =C2=A0		printk(KERN_DEBUG
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s: abs_flat #%02x out of=
 range: %d
> > (min:%d/max:%d)\n",
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UINPUT_NAME, code, abs->fl=
at, min, max);
> > --=20
> > 2.34.1
> >=20
> >=20


