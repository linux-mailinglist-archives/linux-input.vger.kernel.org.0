Return-Path: <linux-input+bounces-4398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EBD90BF5E
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 01:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D2C1F22BC6
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 23:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A09C18F2E1;
	Mon, 17 Jun 2024 23:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG/tIj7I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7608018FC71;
	Mon, 17 Jun 2024 23:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718665302; cv=none; b=Gai7RGf556V1ZNXr5tR8MHlpLdroNCeBGyXpo2prVsPtfw1j9AnS7WUIgghWCc0IbiwH4YGY3lj55ifioN2oOfgBDl2Z91jgQPIJZqZTMoLMLIwMWTo4orDPG0CO9RXJvQU1NEYXc+88O1Sze97a1kYNv6jq0S4omjdouf0z+i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718665302; c=relaxed/simple;
	bh=pIEOwufWC2y5eoQS6n7mxaQG6ft0e8y9l7crX0kEIc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCL3Db3ewVeSjuMkZjS7Y6BjEjuM8V4yf/KUrlBQ/5SW0C5YUgKYycvDgJuEz1XBYm7AQZ8SFd1aoheltRap8RX4U3exCJ4eoXvGl/0LZUyuylr7v+dRxVAeIP/7PYOlnkq071Q/9li3itZFcr+XFZjajTmh9/8mYb0D0786mDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG/tIj7I; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so586605266b.2;
        Mon, 17 Jun 2024 16:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718665299; x=1719270099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CJ83HLFAZUCV7EwHWbXwHiRW1l+Q+S53e9kUsFHbb0=;
        b=FG/tIj7IoWh+w+EkmrKbqADgXL4H4JuMztokrrjsjs6W9wRYxcc7mgdGhSqjftvIE/
         PxoVofS9oJtHwG9Ls/UmRCxVjXPd0RkeM+3U+EcToSToohJSsLmXyRXmypfhtJKn9mHX
         0h10kQUWrNBanhj6rnoSkJ4YAL1sPcc/vczbIRSF2UjszvBkXE3igkPQr47mfsh3es4D
         Vr/oWmcs3cwNWOiKSI11kKJYDQRAsoeQG0sTcVrb8lJaMrMfRIWWV0/TIREEN6GSt349
         5lGQhWR5wh+Mqxduu+ld6b2mDN7QNV+Qioqvwi2/M9bMs2fu9FThKoTWSul4XC5rJ8wf
         Pf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718665299; x=1719270099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CJ83HLFAZUCV7EwHWbXwHiRW1l+Q+S53e9kUsFHbb0=;
        b=Itzp0CEEoMw++bmGLTjRydaYmWVwbu9tac9AlS147PgbueeTI7njJZAFdV8SsjfMs8
         cagZ7rZkSJahwTNIX2tkcxAHFm47uKfSIHQcWYhOPkcGqMuej+k80fdmAxFToIu3byl5
         EqBTnwQZE5lHJvIp83yH41AUWAciiOevMYhkz6p31GFTtYdGHLZAWTXKlaKCEjCzztFL
         arVZI37GIqjvTs7VSfnwFug1RRLkUjoYA/h8yckgfkua0FkLTsOTUc/XEFvH7EeXptbz
         XbAsDmBeCzZZJEk1ZlHW+4/1vouiFPxC1c6hK9ZXIqR0Q+7kbMFWySouwENIuJncsC/y
         YsTw==
X-Forwarded-Encrypted: i=1; AJvYcCXg3kQUesYj2+G6GrTPWRubOOnKp/+Qj6bhrtEMIqdr4TB/H63a662LRGmP5eG0ptxOHKnnOBVljuN2B5FGQKRhEdbjdBVuyYdoSqXLrmyQ6b/t7A/CFCi3j2dpbGwkiiHKjWC3R4vi/A8=
X-Gm-Message-State: AOJu0YxLJJfYkYnA5P8SOGts2XgkjvmMrXUKZcQ1ZsD9KuTUsH20a6O/
	X2ZNqp8rxknBxsoFeBo0Vkc0ves3AxDn9TWxT568CmdYFeoMpg06/Wf5RfrnRabzmRKNkxY3eED
	AEcoJiQSWI950MOC/jClIQ6Immgg=
X-Google-Smtp-Source: AGHT+IHrXxhFBt8Wt95++4bBVZPGxGcYsybnCS+Zxhx0lBG6vd9trPBwfyrwc6+jjWntmVSBm+rcKPgyqg1NOlPFj5s=
X-Received: by 2002:a17:906:2c16:b0:a6f:501d:c229 with SMTP id
 a640c23a62f3a-a6f60cee3a1mr640500366b.9.1718665298527; Mon, 17 Jun 2024
 16:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616163055.75174-1-max@enpas.org>
In-Reply-To: <20240616163055.75174-1-max@enpas.org>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 17 Jun 2024 16:01:26 -0700
Message-ID: <CAEc3jaCkH5JwNTpHRZYsekbwX+G6T5tMTLD0+O6E7Q2hqcAFHw@mail.gmail.com>
Subject: Re: [PATCH v1] hid-playstation: DS4: Update rumble and lightbar together
To: Max Staudt <max@enpas.org>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Max,

Thanks for your patch. I'm a little hesitant to make changes here. The
console itself does the updates similar to this, though there are
different userspace kind of ways there to send things (so some paths
may kind of do what you saw). These flags are often used also to
enable other features in the output report (e.g. audio settings or
many others).

This driver is used in a lot of devices. Different vendors ranging
e.g. car manufacturers, phones, TVs,.. have their own unit /
regression tests suites to test integration. Where they send FF rumble
for example and check the bits in the output reports

We went through a lot of pain with many of such vendors (and are still
going through some). I would rather not shake things up for such a
narrow use cases for non-official devices.

Thanks,
Roderick

On Sun, Jun 16, 2024 at 9:40=E2=80=AFAM Max Staudt <max@enpas.org> wrote:
>
> Some 3rd party gamepads expect updates to rumble and lightbar together,
> and setting one may cancel the other.
>
> This patch maximises compatibility by always sending rumble and lightbar
> updates whenever updates are sent to the gamepad: valid_flag0 is always
> >=3D 0x03.
>
> Further background reading:
>
> - Apparently the PS4 always sends rumble and lightbar updates together:
>
>   https://eleccelerator.com/wiki/index.php?title=3DDualShock_4#0x11_2
>
> - 3rd party gamepads may not implement lightbar_blink, and may simply
>   ignore updates with 0x07 set, according to:
>
>   https://github.com/Ryochan7/DS4Windows/pull/1839
>
> This patch leaves the lightbar blink feature as-is: Likely, most users
> are unaware that it exists, hence it's unlikely that a packet with
> 0x07 set will even be sent in practice. Let's leave the function there,
> so users of first-party gamepads can continue to use it.
> ---
>  drivers/hid/hid-playstation.c | 55 ++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index e7c309cfe3a0..986a4ca8b664 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -387,12 +387,10 @@ struct dualshock4 {
>         bool update_bt_poll_interval;
>         uint8_t bt_poll_interval;
>
> -       bool update_rumble;
>         uint8_t motor_left;
>         uint8_t motor_right;
>
>         /* Lightbar leds */
> -       bool update_lightbar;
>         bool update_lightbar_blink;
>         bool lightbar_enabled; /* For use by global LED control. */
>         uint8_t lightbar_red;
> @@ -2092,8 +2090,6 @@ static int dualshock4_led_set_brightness(struct led=
_classdev *led, enum led_brig
>                 }
>         }
>
> -       ds4->update_lightbar =3D true;
> -
>         spin_unlock_irqrestore(&ds4->base.lock, flags);
>
>         dualshock4_schedule_work(ds4);
> @@ -2143,26 +2139,39 @@ static void dualshock4_output_worker(struct work_=
struct *work)
>
>         spin_lock_irqsave(&ds4->base.lock, flags);
>
> -       if (ds4->update_rumble) {
> -               /* Select classic rumble style haptics and enable it. */
> -               common->valid_flag0 |=3D DS4_OUTPUT_VALID_FLAG0_MOTOR;
> -               common->motor_left =3D ds4->motor_left;
> -               common->motor_right =3D ds4->motor_right;
> -               ds4->update_rumble =3D false;
> -       }
> +       /*
> +        * PS4 seems to send 0xf3 updates by default, according to a HCI =
trace:
> +        *   https://eleccelerator.com/wiki/index.php?title=3DDualShock_4=
#0x11_2
> +        *
> +        * This seems to be a very compatible value with third-party pads=
:
> +        *   https://github.com/Ryochan7/DS4Windows/pull/1839
> +        *
> +        * However, hid-playstation in v6.10 does not set the upper nibbl=
e,
> +        * and neither does hid-sony in v6.2, or BlueRetro. We should sti=
ck
> +        * to that for now, to minimise the chance of unexpected changes.
> +        *
> +        * So let's always update rumble and lightbar at the same time, w=
ith
> +        * the upper nibble cleared, resulting in valid_flag0 =3D=3D 0x03=
.
> +        * Hopefully this will maximise compatibility with third-party pa=
ds.
> +        */
> +       common->valid_flag0 =3D DS4_OUTPUT_VALID_FLAG0_MOTOR |
> +                             DS4_OUTPUT_VALID_FLAG0_LED;
>
> -       if (ds4->update_lightbar) {
> -               common->valid_flag0 |=3D DS4_OUTPUT_VALID_FLAG0_LED;
> -               /* Comptabile behavior with hid-sony, which used a dummy =
global LED to
> -                * allow enabling/disabling the lightbar. The global LED =
maps to
> -                * lightbar_enabled.
> -                */
> -               common->lightbar_red =3D ds4->lightbar_enabled ? ds4->lig=
htbar_red : 0;
> -               common->lightbar_green =3D ds4->lightbar_enabled ? ds4->l=
ightbar_green : 0;
> -               common->lightbar_blue =3D ds4->lightbar_enabled ? ds4->li=
ghtbar_blue : 0;
> -               ds4->update_lightbar =3D false;
> -       }
> +       common->motor_left =3D ds4->motor_left;
> +       common->motor_right =3D ds4->motor_right;
> +
> +       /* Compatible behavior with hid-sony, which used a dummy global L=
ED to
> +        * allow enabling/disabling the lightbar. The global LED maps to
> +        * lightbar_enabled.
> +        */
> +       common->lightbar_red =3D ds4->lightbar_enabled ? ds4->lightbar_re=
d : 0;
> +       common->lightbar_green =3D ds4->lightbar_enabled ? ds4->lightbar_=
green : 0;
> +       common->lightbar_blue =3D ds4->lightbar_enabled ? ds4->lightbar_b=
lue : 0;
>
> +       /*
> +        * Output reports updating lightbar_blink will simply be ignored
> +        * by incompatible controllers, since valid_flag0 =3D=3D 0x07.
> +        */
>         if (ds4->update_lightbar_blink) {
>                 common->valid_flag0 |=3D DS4_OUTPUT_VALID_FLAG0_LED_BLINK=
;
>                 common->lightbar_blink_on =3D ds4->lightbar_blink_on;
> @@ -2459,7 +2468,6 @@ static int dualshock4_play_effect(struct input_dev =
*dev, void *data, struct ff_e
>                 return 0;
>
>         spin_lock_irqsave(&ds4->base.lock, flags);
> -       ds4->update_rumble =3D true;
>         ds4->motor_left =3D effect->u.rumble.strong_magnitude / 256;
>         ds4->motor_right =3D effect->u.rumble.weak_magnitude / 256;
>         spin_unlock_irqrestore(&ds4->base.lock, flags);
> @@ -2520,7 +2528,6 @@ static void dualshock4_set_default_lightbar_colors(=
struct dualshock4 *ds4)
>         ds4->lightbar_green =3D player_colors[player_id][1];
>         ds4->lightbar_blue =3D player_colors[player_id][2];
>
> -       ds4->update_lightbar =3D true;
>         dualshock4_schedule_work(ds4);
>  }
>
> --
> 2.39.2
>
>

