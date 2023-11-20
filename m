Return-Path: <linux-input+bounces-143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9AB7F1E3B
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 21:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBC01C20D67
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 20:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C82225CA;
	Mon, 20 Nov 2023 20:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="eLNR+Dfu"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7982D2;
	Mon, 20 Nov 2023 12:53:53 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 7E54A1C0050; Mon, 20 Nov 2023 21:53:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1700513632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6LfoMY/Fvp0UXzBZ+W7X81hPAVnp3D1vcRIVa9CydA=;
	b=eLNR+DfutupDoKP3c+C0DbY1+lXsFmpXNqcRY2eGyyJiC+LFIxjZecUl6vD1nvFUkbTnB2
	YmqpbfQNE0HH5kFd/oyl997swsjsEr5veurdUfW7I5FcrEMyOV3zJH200Dv6srV1ymkYhb
	YI7sDEE4i1X6oCwkGwaPtFw5K209GFU=
Date: Mon, 20 Nov 2023 21:53:52 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, jikos@kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linux-input@vger.kernel.org, ojeda@kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Message-ID: <ZVvHYAsM1p8O7J8r@duo.ucw.cz>
References: <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com>
 <CANiq72kvZcNp2ocXoqBae9q2UW+RPQy3dXUr+QS-izKpM1yyoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jeVF7q2cF6LMKnm"
Content-Disposition: inline
In-Reply-To: <CANiq72kvZcNp2ocXoqBae9q2UW+RPQy3dXUr+QS-izKpM1yyoA@mail.gmail.com>


--9jeVF7q2cF6LMKnm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2023-10-23 13:44:46, Miguel Ojeda wrote:
> On Mon, Oct 23, 2023 at 1:40=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > One could also reasonably make the argument that controlling the
> > individual keyboard key backlights should be part of the input
> > subsystem. It's not a display per se. (Unless you actually have small
> > displays on the keycaps, and I think that's a thing too.)
> >
> > There's force feedback, there could be light feedback? There's also
> > drivers/input/input-leds.c for the keycaps that have leds, like caps
> > lock, num lock, etc.
> >
> > Anyway, just throwing ideas around, no strong opinions, really.
>=20
> Yeah, sounds quite reasonable too, in fact it may make more sense
> there given the LEDs are associated per-key rather than being an
> uniform matrix in a rectangle if I understand correctly. If the input
> subsystem wants to take it, that would be great.

Unfortunately we are getting no input from input subsystem. Question
seems to be more of "is auxdisplay willing to take it if it is done
properly"?

Best regards,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--9jeVF7q2cF6LMKnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZVvHYAAKCRAw5/Bqldv6
8tamAJ9ay6bqjz3WKWY0hzcjA1oaf0rrFACghHK4/NlmCVR1KurSm8xzJvVcKSs=
=1Jqp
-----END PGP SIGNATURE-----

--9jeVF7q2cF6LMKnm--

