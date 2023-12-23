Return-Path: <linux-input+bounces-954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D981D4BF
	for <lists+linux-input@lfdr.de>; Sat, 23 Dec 2023 16:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6741C1C20D05
	for <lists+linux-input@lfdr.de>; Sat, 23 Dec 2023 15:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47CEFBF0;
	Sat, 23 Dec 2023 15:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="DlqfTaCq"
X-Original-To: linux-input@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BBDFBE8
	for <linux-input@vger.kernel.org>; Sat, 23 Dec 2023 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1703343714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O3rV5E0dr0esZj7iSZvqMFOd+h80mprST+FM8CUCroE=;
	b=DlqfTaCqiRtbJnBluZGX+6j+X6bLswNsyRkAtMMuoN6nE/VhggxDF4zEWJxrBAUO/M2ePa
	cQ2WeYEV/fWbeJoppOpGBDCVYWi7P3OM64GlMY5eQdiqMKQRt5B3eroC+8E3JfW8yJviZL
	p0HcOYWlCe8kMGzBJvKsKnS/IBJEmOw=
Message-ID: <0ac9f339380ca3acd76eff065238599f39cde039.camel@crapouillou.net>
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
From: Paul Cercueil <paul@crapouillou.net>
To: Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov
	 <dmitry.torokhov@gmail.com>
Cc: Peter Hutterer <peter.hutterer@who-t.net>, Chris Morgan
	 <macroalpha82@gmail.com>, linux-input@vger.kernel.org, svv@google.com, 
	biswarupp@google.com, contact@artur-rojek.eu, Chris Morgan
	 <macromorgan@hotmail.com>
Date: Sat, 23 Dec 2023 16:01:52 +0100
In-Reply-To: <954f6537-15d5-42db-94b5-d148d4942870@redhat.com>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
	 <20231219235149.GA3401344@quokka>
	 <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>
	 <ZYJJC-ID4SyHhuuA@google.com>
	 <4e902e8ff60e21a74a87887e272f6751d3837c71.camel@crapouillou.net>
	 <954f6537-15d5-42db-94b5-d148d4942870@redhat.com>
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

Hi Hans,

Le samedi 23 d=C3=A9cembre 2023 =C3=A0 15:29 +0100, Hans de Goede a =C3=A9c=
rit=C2=A0:
> Hi Paul,
>=20
> On 12/20/23 14:39, Paul Cercueil wrote:
> > Hi Dmitry,
> >=20
> > Le mardi 19 d=C3=A9cembre 2023 =C3=A0 17:53 -0800, Dmitry Torokhov a =
=C3=A9crit=C2=A0:
> > > Hi Paul,
> > >=20
> > > On Wed, Dec 20, 2023 at 01:38:39AM +0100, Paul Cercueil wrote:
> > > > Hi Peter,
> > > >=20
> > > > Le mercredi 20 d=C3=A9cembre 2023 =C3=A0 09:51 +1000, Peter Huttere=
r a
> > > > =C3=A9crit=C2=A0:
> > > > > On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
> > > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > >=20
> > > > > > Stop checking if the minimum abs value is greater than the
> > > > > > maximum
> > > > > > abs
> > > > > > value. When the axis is inverted this condition is allowed.
> > > > > > Without
> > > > > > relaxing this check, it is not possible to use uinput on
> > > > > > devices in
> > > > > > userspace with an inverted axis, such as the adc-joystick
> > > > > > found
> > > > > > on
> > > > > > many handheld gaming devices.
> > > > >=20
> > > > > As mentioned in the other thread [1] a fair bit of userspace
> > > > > relies
> > > > > on
> > > > > that general assumption so removing it will likely cause all
> > > > > sorts of
> > > > > issues.
> > > >=20
> > > > There is some userspace that works with it though, so why
> > > > restrict
> > > > it
> > > > artificially?
> > > >=20
> > > > The fact that some other userspace code wouldn't work with it
> > > > sounds a
> > > > bit irrelevant. They just never encountered that min>max usage
> > > > before.
> > > >=20
> > > > And removing this check won't cause all sort of issues, why
> > > > would
> > > > it?
> > > > It's not like the current software actively probes min>max and
> > > > crash
> > > > badly if it doesn't return -EINVAL...
> > >=20
> > > It will cause weird movements because calculations expect min be
> > > the
> > > minimum, and max the maximum, and not encode left/right or
> > > up/down.
> > > Putting this into adc joystick binding was a mistake.
> >=20
> > I don't see why it was a mistake, it's only one of the ways to
> > specify
> > that the axis is inverted. This information is between the firmware
> > (DT) and the kernel, that doesn't mean the information has to be
> > relayed as-is to the userspace.
> >=20
> > Unlike what you wrote in your other answer, when talking about
> > input
> > the kernel doesn't really normalize anything - it gives you the
> > min/max
> > values, and the raw samples, not normalized samples (they don't get
> > translated to a pre-specified range, or even clamped).
> >=20
> > I don't really like the idea of having the driver tamper with the
> > samples, but if the specification really is that max>min, then it
> > would
> > be up to evdev/joydev (if the individual drivers are allowed
> > min>max)
> > or adc-joystick (if they are not) to process the samples.
>=20
> I don't see why a driver, especially a userspace driver which
> then injects things back into the kernel using uinput, would
> not take care of inverting the samples itself and then just
> present userspace with normalized data where min is simply 0
> (as result of normalization as part of inversion) and
> max is (original_max - original_min).

Yes, I totally agree.

What I was saying is, as Chris is only "piping" events from adc-
joystick into uinput, that the problem is more that evdev/joydev don't
handle axis inversion and provide min>max values that most of the
userspace (and some kernel drivers e.g. uinput) don't support.

> Note that this is exactly what is being done for touchscreens,
> where having the touchscreen mounted e.g. upside-down is
> a long standing issue and this is thus also a long solved issue,
> see: drivers/input/touchscreen.c which contains generic
> code for parsing device-properties including swapped / inverted
> axis as well as generic code for reporting the position to the
> input core, where the helpers from drivers/input/touchscreen.c
> take care of the swap + invert including normalization when
> doing inversion.
>=20
> Specifically this contains in touchscreen_parse_properties() :
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prop->max_x =3D input_abs_get_=
max(input, axis_x);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prop->max_y =3D input_abs_get_=
max(input, axis_y);
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prop->invert_x) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 absinfo =3D &input->absinfo[axis_x];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 absinfo->maximum -=3D absinfo->minimum;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 absinfo->minimum =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prop->invert_y) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 absinfo =3D &input->absinfo[axis_y];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 absinfo->maximum -=3D absinfo->minimum;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 absinfo->minimum =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> and then when reporting touches:
>=20
> void touchscreen_report_pos(struct input_dev *input,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const struct touchscreen_properties
> *prop,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int x, unsigned int y,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bool multitouch)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prop->invert_x)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 x =3D prop->max_x - x;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prop->invert_y)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 y =3D prop->max_y - y;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prop->swap_x_y)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 swap(x, y);
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_report_abs(input, multit=
ouch ? ABS_MT_POSITION_X :
> ABS_X, x);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_report_abs(input, multit=
ouch ? ABS_MT_POSITION_Y :
> ABS_Y, y);
> }
>=20
> One of the tasks of a driver / the kernel is to provide some
> level of hardware abstraction to isolate userspace from
> hw details. IMHO taking care of the axis-inversion for userspace
> with something like the above is part of the kernels' HAL task.

Totally agree, but this is not done anywhere, is it? evdev seems to
just pass the hardware values alongside some basic meta-data (min/max
values, fuzz etc.), it does not tamper with the data. Should evdev
handle axis inversion? Should it be in adc-joystick (and every other
driver that needs that) instead?

>=20
> Regards,
>=20
> Hans

Cheers,
-Paul

