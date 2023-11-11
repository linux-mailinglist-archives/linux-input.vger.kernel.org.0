Return-Path: <linux-input+bounces-18-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A067E8C4D
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 20:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 725F7B20A5F
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 19:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3701CABF;
	Sat, 11 Nov 2023 19:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="W1SXl5yf"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509331BDEB;
	Sat, 11 Nov 2023 19:23:00 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B62C4;
	Sat, 11 Nov 2023 11:22:59 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 12E621C0050; Sat, 11 Nov 2023 20:22:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1699730578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8a7ot37x18JT+gqBEyQGuBYUUHo0Mfh3R3rUO53ekrE=;
	b=W1SXl5yfiiI6QN+D3QxXiEBITIBl4rQVW02b61AygAYWOlX+FTwGPdbtYW2gEAgSf7rSpl
	zPSuzKX7UUojUSqUrDi/SA0C2sH1WDD3FZoaO9SU7IPBarD2+zJ9MGuz5qt5gzByqo6V0+
	0aiqDhEnkZgK8ekM9KIdubOxOW8MMxM=
Date: Sat, 11 Nov 2023 20:22:46 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Message-ID: <ZU/O63BglhcWj0dc@duo.ucw.cz>
References: <20231106164134.114668-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m6I9gBvMJJo5CjCg"
Content-Disposition: inline
In-Reply-To: <20231106164134.114668-1-anshulusr@gmail.com>


--m6I9gBvMJJo5CjCg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Adds bindings for the Adafruit Seesaw Gamepad.
>=20
> The gamepad functions as an i2c device with the default address of 0x50
> and has an IRQ pin that can be enabled in the driver to allow for a rising
> edge trigger on each button press or joystick movement.
>=20
> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw

> +    +-----------------------------+
> +    |   ___                       |
> +    |  /   \               (X)    |
> +    | |  S  |  __   __  (Y)   (A) |
> +    |  \___/  |ST| |SE|    (B)    |
> +    |                             |
> +    +-----------------------------+
> +
> +  S -> 10-bit percision bidirectional analog joystick

"preci..."

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--m6I9gBvMJJo5CjCg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZU/UhgAKCRAw5/Bqldv6
8mhEAJ9GdnQClWwau1Z0EtpL/YDx+ogIUgCfVO/WtWIivrvHfY40X2utkhCCPXM=
=dW2+
-----END PGP SIGNATURE-----

--m6I9gBvMJJo5CjCg--

