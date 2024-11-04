Return-Path: <linux-input+bounces-7856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C326F9BB42C
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 13:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8151A280E52
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 12:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12B41B4F0A;
	Mon,  4 Nov 2024 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="YZUClsfO"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED17C0BE;
	Mon,  4 Nov 2024 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730722024; cv=none; b=lYof363JgX7fWP+9lVbFtUFLmWN5He9uUdEYXVXlotSpwaSlXwlc7bq1u1pzfXrA8rHSsCvqXnA9WQcIQEGhUFGQRxuW0C9OcucqUYznr0P3px8wf1nd14IYuc7RUj+C/rFaFvlkFE1voYe7IJWVu/aSxmE0ysGjOFjvcYkW1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730722024; c=relaxed/simple;
	bh=svftIwQDl37QDsPAYgFM9jEXoads4cBFTHeHa36t9CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qryt5X8FyEAkGiePq3S+5PKsD4OCEK7Z6uts/SpBss7jC4D1ZNGGWQabmipJRpAPe8gfwmARiyXuS0HNDeGMYbg328rV9N0aZIUH9V0mLN873mNb7m0w/ah6g64CjA7BabMWDOgIZyQrhew5hh9BE+4PYWNAzYzJa32YLMGZkY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=YZUClsfO; arc=none smtp.client-ip=212.227.17.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1730722004; x=1731326804; i=christian@heusel.eu;
	bh=isvhMXR16jgELvfkYUGhK0LUKbb8tRcCfdj7u9VzZNM=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YZUClsfOhRNFec/U9oFceOMVZmq0LtHEtwiA8QVxLFdxKv5DFHA2rHvx5QYV8XMr
	 DhXQym8+qd2uVV04/0CV6emUZHzfkR/02wGayNMz/krYv/Xdgd6ysX+1bv9SuU7FL
	 Y3z/LWiqt9iBQVSUMB6XoOd+EcmZoxgTHogU7/57RnRAYKWjNqoX/G/XQRviHWu4e
	 OlsmM+h/6VO2+QQQZAMdG1UEOfcnoh62Gq4No3BiZgwywlu62kfSHDpF+uD46/E7Z
	 euxsmNIm40Y6+ei+gVAwQTo2Wh5WpExZvEzmMP7+f3ryXhjzHBLSQB/V2ma2W5aav
	 PR+3QJu/gJjG4bnciw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([80.187.64.99]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M593i-1t92Jj3fEK-0056Mo; Mon, 04 Nov 2024 13:06:44 +0100
Date: Mon, 4 Nov 2024 13:06:40 +0100
From: Christian Heusel <christian@heusel.eu>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Ned T. Crigler" <crigler@gmail.com>, 
	Peter Seiderer <ps.report@gmx.net>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Jeff LaBundy <jeff@labundy.com>, 
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <dcde5b37-2ea7-472e-abe3-2cadc9d1e651@heusel.eu>
References: <Zx2iQp6csn42PJA7@xavtug>
 <69b6119c-3c3a-406f-9375-3e55fba9b732@heusel.eu>
 <20241027163744.2d396c61@gmx.net>
 <Zx5yIEZwT5SxzCTx@xavtug>
 <Zx8hfE2_3zXSTi05@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mv3uxb56tz6fok5b"
Content-Disposition: inline
In-Reply-To: <Zx8hfE2_3zXSTi05@google.com>
X-Provags-ID: V03:K1:JDpponhYnC4ZR0IulelKBhkv7BTepDK8a2dcHE68/+bYOMQ3e8h
 7EZ2ZT6MM6utvvtYNagWIhwdJ96Fhef1430RA6MCgKVtHzkTmb6J3AtB0pIJp48O3Qi6Hru
 6qJMKpk7H683dE69rQNwtptLUHnQ6XSdanIl4ASDH7Y02xl+0GuqWMLKMr0IW/lTpq7xdcY
 UlXBPvIxlIvyRuPMRfA3Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IRRAjWkgUW0=;L0WoqOJ0RM2nuiH11dCchM00spD
 M9W6WU0gNSZb+KuGA6Dzul9NtkLSuU7wC2zknhF3XYiwlnQ36oMw1hLPoknjg9WCT3IFLCcuv
 ep5opLxKa3E9sqmx+cReQXlbPyW4Cl29V8cApx00SQyLjvZloxfVhD0XjlQB1KxgiB2/mCIhn
 xi7qwOCp0btvK0iwt/wR5zOEpqiJ3Z8PZtNIv8w7aKHPoW2Hg70wbwqETzcLXQ+ThdCZjpEpj
 YE+wh7Ddo3iE/DudAolhsO90EHxbxn9o8ohrsit/pNk0IhwS+QdK0y9WnlrmM7oyGws3t1Psl
 PUeP8I6JeWIQNJ4PIoxubVXeCxSUd/QcbPQmAhTXtPNoNgjQ6KhP5VfnpN9dG1WqCaZnfWGMz
 c+kQRbnwwbTEQx/836HZSuH1b28il7sONrgMzNvJW/SOeMWmpYKPEUeBgRjBPYKg4+z/z7GjE
 kul78VgkZGNsS6nltqn6OvIL78y3w3tdZAauNDCQ+8hQEj5nlu+be5gIs+1TRVUMmIfQF+Haw
 Hxz3TYwyBt6U/ehgm1+8WeKXXhaKd9KTy79EVVUUF16RqXH/Egdt3mvV4IirMY/ElRrv1x+56
 viyh/d7FEx9epQWv+r50h2K4Qrk6STwz/pkdxgJzV4ESdkfjIVDHjyPcbjVR3JzhcLQe/kGzn
 mKow3CfBG9b2+ol2Xo9abyqDWDWdwfIuIcUbhSaUFrH1TlLQEYazlnwaf5iFX2HQcv1Y1z97j
 SU8j4IIiELw56Sut1KUV3DSrd5ZQD5M6Q==


--mv3uxb56tz6fok5b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
MIME-Version: 1.0

On 24/10/27 10:30PM, Dmitry Torokhov wrote:
> Hi everyone,
>=20
> On Sun, Oct 27, 2024 at 10:02:24AM -0700, Ned T. Crigler wrote:
> > Hi Peter, Christian,
> >=20
> > On Sun, Oct 27, 2024 at 04:37:44PM +0100, Peter Seiderer wrote:
> > > Hello Ned, Christian, *,
> > >=20
> > > On Sun, 27 Oct 2024 15:06:09 +0100, Christian Heusel <christian@heuse=
l.eu> wrote:
> > >=20
> > > > On 24/10/26 07:15PM, Ned T. Crigler wrote:
> > > > > Hi,
> > > >
> > > > Hey Ned,
> > > >
> > > > > It looks like starting with kernel 6.11, disabling and re-enabling
> > > > > magic
> > > > > sysrq fails with these errors in dmesg:
> > > > >
> > > > > kernel: input: input_handler_check_methods: only one event proces=
sing
> > > > > method can be defined (sysrq)
> > > > > kernel: sysrq: Failed to register input handler, error -22
> > > > >
> > > > > after doing:
> > > > >
> > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > >
> > > > I have found that this issue is also present in the latest mainline
> > > > release and bisected it to the following commit:
> > > >
> > > >     d469647bafd9 ("Input: simplify event handling logic")
> > > >
> > >=20
>=20
> Yes, I did not consider that we might want to re-register the same input
> handler, thank you for alerting me about the regression.
>=20
> > >=20
> > >=20
> > > A quick fix/hack for the sysrq case:
> > >=20
> > > --- a/drivers/tty/sysrq.c
> > > +++ b/drivers/tty/sysrq.c
> > > @@ -1045,7 +1045,7 @@ static inline void sysrq_register_handler(void)
> > > <snip>

Thanks for the patch, are you looking to fix this in a more general way
or do you plan on just sending in the above patch? (or did this already
happen and I just missed it? :p)

Cheers,
Chris

--mv3uxb56tz6fok5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmcouNAACgkQwEfU8yi1
JYXw3RAAmi2HUOlFjtSr0cKl3FEeXlPXeSujon33yrWSAZpA2TzjzgdLhYjiTEDu
xhCrH1nDtMMAn7YuByZivANN+OyliC1STUApCsNGx+JOmlD82pP6GGZGTKI/YBTC
HjMfEmkq3P3h8po3xZ5CFLd+htb5k2Psso6v/uUxC1pr99byRTJpgOeqv1TTUdOA
3ftkgCapY0i1a4WmHSErinrMPc+f6PX9o2rL0wPv/22oVK2TaCHE0whoZG1Q/aYk
89rHHoq8BxpkgM7pD1qxExk3To5WVLh38wLfbkAvJP6UYZKaqOzyMITGN/C6pzye
KEhB7+SD8ikqejHKY0vU6lzFbVdKe9v2/+60z+KhXXy5JJd5c/LkSmlP/fLhXzWc
zqhm83V93XiSlO/pY5IyatQLeD15ICMdL/qS1TaAQsAMviMkM9aVccnshqEyEnIz
aSI4VJdAA+iqqPNrWSkWyEF4TtJ5qXGthXvbzQfPc3eO2XlL7+Rr8RoI9j2ZySbU
nCuHekNR4anE8f+RquYwmYinXtlICEl8HGf2kkqZKkGGaAQqrXQuAhgPS9n41VjD
QTkLTeRGjQtxmcTo+wvP7pkmTF8QN2lfD+3JmDCZfa7NvN+6MBZr+kx+Yrs/GZlO
QM+U0fRM04GGuoy15xCaR0gnTT9CMkAfj6v8+eEeRvkZZqf6FV4=
=KUA8
-----END PGP SIGNATURE-----

--mv3uxb56tz6fok5b--

