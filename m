Return-Path: <linux-input+bounces-910-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEAC819FFA
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 14:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF47F1F26E20
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 13:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D150338FA1;
	Wed, 20 Dec 2023 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="zGk0hC0F"
X-Original-To: linux-input@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4638F97
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1703079556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FdVpnSm8dIq6GRKRYbjXAUeu+sExj9lPfKeCXbHeZAw=;
	b=zGk0hC0FbC2pTBDtKZp39MJTqT0QgyrQr2d7WkQF47hHYsApB0f73Mi9zkzLRJLPE4aSqn
	Rsj9QEw934ON7RALXLQ0XD6cuVETnpOG/S3KGc9U0Jh8Cp/FscUOyNanJvagzcGbymu486
	uVEAEBugSmF1v4gRKM3GjYQusBeMFN8=
Message-ID: <4e902e8ff60e21a74a87887e272f6751d3837c71.camel@crapouillou.net>
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
From: Paul Cercueil <paul@crapouillou.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peter Hutterer <peter.hutterer@who-t.net>, Chris Morgan
	 <macroalpha82@gmail.com>, linux-input@vger.kernel.org, svv@google.com, 
	biswarupp@google.com, contact@artur-rojek.eu, Chris Morgan
	 <macromorgan@hotmail.com>
Date: Wed, 20 Dec 2023 14:39:14 +0100
In-Reply-To: <ZYJJC-ID4SyHhuuA@google.com>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
	 <20231219235149.GA3401344@quokka>
	 <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>
	 <ZYJJC-ID4SyHhuuA@google.com>
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

Le mardi 19 d=C3=A9cembre 2023 =C3=A0 17:53 -0800, Dmitry Torokhov a =C3=A9=
crit=C2=A0:
> Hi Paul,
>=20
> On Wed, Dec 20, 2023 at 01:38:39AM +0100, Paul Cercueil wrote:
> > Hi Peter,
> >=20
> > Le mercredi 20 d=C3=A9cembre 2023 =C3=A0 09:51 +1000, Peter Hutterer a
> > =C3=A9crit=C2=A0:
> > > On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > >=20
> > > > Stop checking if the minimum abs value is greater than the
> > > > maximum
> > > > abs
> > > > value. When the axis is inverted this condition is allowed.
> > > > Without
> > > > relaxing this check, it is not possible to use uinput on
> > > > devices in
> > > > userspace with an inverted axis, such as the adc-joystick found
> > > > on
> > > > many handheld gaming devices.
> > >=20
> > > As mentioned in the other thread [1] a fair bit of userspace
> > > relies
> > > on
> > > that general assumption so removing it will likely cause all
> > > sorts of
> > > issues.
> >=20
> > There is some userspace that works with it though, so why restrict
> > it
> > artificially?
> >=20
> > The fact that some other userspace code wouldn't work with it
> > sounds a
> > bit irrelevant. They just never encountered that min>max usage
> > before.
> >=20
> > And removing this check won't cause all sort of issues, why would
> > it?
> > It's not like the current software actively probes min>max and
> > crash
> > badly if it doesn't return -EINVAL...
>=20
> It will cause weird movements because calculations expect min be the
> minimum, and max the maximum, and not encode left/right or up/down.
> Putting this into adc joystick binding was a mistake.

I don't see why it was a mistake, it's only one of the ways to specify
that the axis is inverted. This information is between the firmware
(DT) and the kernel, that doesn't mean the information has to be
relayed as-is to the userspace.

Unlike what you wrote in your other answer, when talking about input
the kernel doesn't really normalize anything - it gives you the min/max
values, and the raw samples, not normalized samples (they don't get
translated to a pre-specified range, or even clamped).

I don't really like the idea of having the driver tamper with the
samples, but if the specification really is that max>min, then it would
be up to evdev/joydev (if the individual drivers are allowed min>max)
or adc-joystick (if they are not) to process the samples.

Cheers,
-Paul

> This is the definition of absinfo:
>=20
> /**
> =C2=A0* struct input_absinfo - used by EVIOCGABS/EVIOCSABS ioctls
> =C2=A0* @value: latest reported value for the axis.
> =C2=A0* @minimum: specifies minimum value for the axis.
> =C2=A0* @maximum: specifies maximum value for the axis.
> =C2=A0* @fuzz: specifies fuzz value that is used to filter noise from
> =C2=A0*	the event stream.
> =C2=A0* @flat: values that are within this value will be discarded by
> =C2=A0*	joydev interface and reported as 0 instead.
> =C2=A0* @resolution: specifies resolution for the values reported for
> =C2=A0*	the axis.
> =C2=A0*
> =C2=A0* Note that input core does not clamp reported values to the
> =C2=A0* [minimum, maximum] limits, such task is left to userspace.
> ...
> =C2=A0*/
>=20
> (We should change wording of the last sentence to "... does not
> always
> clamp ..." since when we do inversion/swap we do clamp values.)
>=20
> And note that the userspace that can handle swapped min and max will
> work fine if the kernel provides normalized data, but other software
> will/may not work.
>=20
> Thanks.
>=20


