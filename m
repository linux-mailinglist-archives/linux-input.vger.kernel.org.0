Return-Path: <linux-input+bounces-12012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D17FA9D944
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 10:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A69E922957
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 08:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAF2193086;
	Sat, 26 Apr 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="FiOHQD92"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A728C1A256E;
	Sat, 26 Apr 2025 08:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745655322; cv=none; b=r3A37zDF1K8RpZ/bekoCE7wlbrNQZnkaBN3+1uOZ4xi8UvXOOnmU1S2HPumgVWdLJK7ZG4gb7ogxuxRHeEZj6JVbT/Z6QOO+8nvUkyzB2uwNMuAq3lWAzTHEkV1RYvDWAFibk2keNHs7NZMX9+ucdThcqV6Bex+5r3M+UefDvYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745655322; c=relaxed/simple;
	bh=7hCpdRrHPG5AnrvBhsmUCpwkT+h/yAAlPnblQqDEZqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKwiuK/LLUO55Yw0lu8ySL8lwRUFisVTPicwYfpInDMnltjeqnIWJ69zpSwWe6TFdHv9Ou9ueaQvxLbEZfc4iI3TfWId6TpyJ1S8FS+NnAl8KQc+JqXDpHjklWD5ZtZl+KKNhfWgqKOtfE1TgXxugJWZqveEq/1bYSqZOg7SSE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=FiOHQD92; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A08B91C00B2; Sat, 26 Apr 2025 10:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745655316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k53jycQ1Z1Eu66/LQMNEr9yLtX94D7f7ZDVDMYc63pY=;
	b=FiOHQD92UDWxgvy+h8JIRPjndClKxi/cQcGvDS8O8GUrf2YR/o3mh7/4pHG2/t3HQZzMu6
	xJlhRjqiltiNVV5QsxpT9E3mTgsjGE+ogMsug8ZAHTPLcoyJ9wHmvTtVCrcBy9cRzs+6K7
	adcerje2Cq0OTBU0rgDxcCM0p0Y+uDA=
Date: Sat, 26 Apr 2025 10:15:16 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Mario Limonciello <superm1@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
Message-ID: <aAyWFI+o/kU9hDVs@duo.ucw.cz>
References: <20250425162949.2021325-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i07FpDtmzUu2qUCx"
Content-Disposition: inline
In-Reply-To: <20250425162949.2021325-1-superm1@kernel.org>


--i07FpDtmzUu2qUCx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2025-04-25 11:29:48, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>=20
> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
> to lock the screen. Modern hardware [2] also sends this sequence of
> events for keys with a silkscreen for screen lock.
>=20
> Introduced a new Kconfig option that will change KEY_SCREENLOCK when
> emitted by driver to META + L.

Fix gnome and kde, do not break kernel...
									Pavel

> =20
> +config INPUT_SCREENLOCK_EMULATION
> +	bool "Pass KEY_SCREENLOCK as META + L"
> +	help
> +	  Say Y here if you want KEY_SCREENLOCK to be passed to userspace as
> +	  META + L.
> +
> +	  If unsure, say Y.
> +
>  comment "Input Device Drivers"
> =20
>  source "drivers/input/keyboard/Kconfig"
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index dfeace85c4710..983e3c0f88e5f 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -370,6 +370,13 @@ void input_handle_event(struct input_dev *dev,
>  	}
>  }
> =20
> +static void handle_screenlock_as_meta_l(struct input_dev *dev, unsigned =
int type,
> +					int value)
> +{
> +	input_handle_event(dev, type, KEY_LEFTMETA, value);
> +	input_handle_event(dev, type, KEY_L, value);
> +}
> +
>  /**
>   * input_event() - report new input event
>   * @dev: device that generated the event
> @@ -392,6 +399,12 @@ void input_event(struct input_dev *dev,
>  {
>  	if (is_event_supported(type, dev->evbit, EV_MAX)) {
>  		guard(spinlock_irqsave)(&dev->event_lock);
> +#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
> +		if (code =3D=3D KEY_SCREENLOCK) {
> +			handle_screenlock_as_meta_l(dev, type, value);
> +			return;
> +		}
> +#endif
>  		input_handle_event(dev, type, code, value);
>  	}
>  }
> @@ -2134,6 +2147,13 @@ void input_set_capability(struct input_dev *dev, u=
nsigned int type, unsigned int
> =20
>  	switch (type) {
>  	case EV_KEY:
> +#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
> +		if (code =3D=3D KEY_SCREENLOCK) {
> +			__set_bit(KEY_L, dev->keybit);
> +			__set_bit(KEY_LEFTMETA, dev->keybit);
> +			break;
> +		}
> +#endif
>  		__set_bit(code, dev->keybit);
>  		break;
> =20

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--i07FpDtmzUu2qUCx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAyWFAAKCRAw5/Bqldv6
8uhKAKCjfvAZFk7Uua0kfLuXA45ZnzJbnQCcD/rUkXDBqsEQKK8A86UKF0DFdzA=
=OY5R
-----END PGP SIGNATURE-----

--i07FpDtmzUu2qUCx--

