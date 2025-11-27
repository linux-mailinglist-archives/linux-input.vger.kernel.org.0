Return-Path: <linux-input+bounces-16386-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB3C90561
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 00:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BFB94E0117
	for <lists+linux-input@lfdr.de>; Thu, 27 Nov 2025 23:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0F22F2909;
	Thu, 27 Nov 2025 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="FVs4gAUL"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FFF29BD87;
	Thu, 27 Nov 2025 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764285679; cv=pass; b=nPHbVW+xIwXcGX+1hkp8DBF3nCykXN6zBSf3CkcSDZZ3AFszCvxE/uCIsnUr8f34uJYW3BwGFkxU686qBd7onr/yRuzXQEvMAmXvQh7bIm4jGn98WH2a8x4YxJ6iG8hZgz0w941hcIwVzNC4ROti76igxZ3NDa9KxiEO/znNmzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764285679; c=relaxed/simple;
	bh=gyYCwexfu8NtHO85BUf/nhLmG7/SxemmCpC+rjbNB1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V75SR5CUF5uV/WuMjHFiYJe+iTKUYAFDdFAS0NLI97jiMot44SDJ93fYOpAFRD2Z7kygoFq7kwtPcRW6gM3FAm8/DutELRi/ow0+2JDE8t9icWhyDNz9XNBtoDhyuyAmhEPwoseh9nGc+CJnzIxg0zkM7sGuuem2oJKDSCSR4t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=FVs4gAUL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1764285662; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aXbImM0GK9wOkePi9S6fYQabvvyXV2sVngRq6WaNZTYvcIeD0bKJZbmD1BROe8aKghfVvyq4xnVMTi20GSVGcEOdot2SCPraYvkKHbN5gVii8aSDUm6eyQDiI/DXUy77wX/880DBgalJfdmfBsCBqqvh3mAOyQFR4/k7D4NlsHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764285662; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JRILAQN9rCA1bAmhobsR8p0uQwedy1oDSB9Rwwcsho8=; 
	b=AjJyPcEzoAu4v9djZeyMWgwroTBbWCt+3QjJkv/iEApBsgLra+Z7qV2G6r7oYX44hB/PTN2JXAM72hkoAgAH+dXVyT+7Zftp9g8vAXvWHu2ufIQZ33VDnU6XZLli56XDIXP+NRDMXIdxJ2Jb4GpPEypO5ftfUYPqKLtAy/YV+w8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764285662;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=JRILAQN9rCA1bAmhobsR8p0uQwedy1oDSB9Rwwcsho8=;
	b=FVs4gAULr+Afg85W3iMZLpm3h1e3Nv2+k43eipRJbrelZVqXC/xGjhwRVODcotoM
	FxB3WYFtpySMB1h3eMz2DtTkFj8AWaozAANrPtUEaZxzu9rwfv36T1zv1JGrEbZvZvl
	tuu8TRFBIvzzsWhLJohFS0h3lTTnSWDs/CTUg7Uk=
Received: by mx.zohomail.com with SMTPS id 1764285659034352.8263760786173;
	Thu, 27 Nov 2025 15:20:59 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id B6CA9181B3B; Fri, 28 Nov 2025 00:20:55 +0100 (CET)
Date: Fri, 28 Nov 2025 00:20:55 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Input: misc: pwm-vibra: fix resource leaks on start
 failure
Message-ID: <rpjrvuexjh4b7ecdewo546uts6owdqpliqarpcagqi273jjbyg@lwupexayshek>
References: <20251126145635.954-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3crcdto2y3erqtu7"
Content-Disposition: inline
In-Reply-To: <20251126145635.954-1-vulab@iscas.ac.cn>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/264.254.26
X-ZohoMailClient: External


--3crcdto2y3erqtu7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Input: misc: pwm-vibra: fix resource leaks on start
 failure
MIME-Version: 1.0

Hi,

On Wed, Nov 26, 2025 at 10:56:35PM +0800, Haotian Zhang wrote:
> The pwm_vibrator_start() function returns immediately if
> pwm_apply_might_sleep() fails, neglecting to disable the
> regulator or reset the enable GPIO. This results in a
> potential resource leak.
>=20
> Introduce a local flag to track regulator enablement
> and implement an error handling path. Deassert the enable
> GPIO and disable the regulator upon failure.
>=20
> Fixes: 3e5b08518f6a ("Input: add a driver for PWM controllable vibrators")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

As the remaining driver code right now always ignores the return
code from pwm_vibrator_start(), it is expected running even with the
PWM failure. There is no real resource leak, since things will
properly be disabled in pwm_vibrator_stop() when userspace is done
with the vibrator request.

So I think this patch does not really add any value without changing
the error handling behavior in general.

I guess this has been found by some code analysis tool and not on
real hardware...

Greetings,

-- Sebastian

>  drivers/input/misc/pwm-vibra.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibr=
a.c
> index 3e5ed685ed8f..d323a12596c3 100644
> --- a/drivers/input/misc/pwm-vibra.c
> +++ b/drivers/input/misc/pwm-vibra.c
> @@ -40,6 +40,7 @@ static int pwm_vibrator_start(struct pwm_vibrator *vibr=
ator)
>  	struct device *pdev =3D vibrator->input->dev.parent;
>  	struct pwm_state state;
>  	int err;
> +	bool new_vcc_on =3D false;
> =20
>  	if (!vibrator->vcc_on) {
>  		err =3D regulator_enable(vibrator->vcc);
> @@ -48,6 +49,7 @@ static int pwm_vibrator_start(struct pwm_vibrator *vibr=
ator)
>  			return err;
>  		}
>  		vibrator->vcc_on =3D true;
> +		new_vcc_on =3D true;
>  	}
> =20
>  	gpiod_set_value_cansleep(vibrator->enable_gpio, 1);
> @@ -59,7 +61,7 @@ static int pwm_vibrator_start(struct pwm_vibrator *vibr=
ator)
>  	err =3D pwm_apply_might_sleep(vibrator->pwm, &state);
>  	if (err) {
>  		dev_err(pdev, "failed to apply pwm state: %d\n", err);
> -		return err;
> +		goto err_gpio;
>  	}
> =20
>  	if (vibrator->pwm_dir) {
> @@ -71,11 +73,19 @@ static int pwm_vibrator_start(struct pwm_vibrator *vi=
brator)
>  		if (err) {
>  			dev_err(pdev, "failed to apply dir-pwm state: %d\n", err);
>  			pwm_disable(vibrator->pwm);
> -			return err;
> +			goto err_gpio;
>  		}
>  	}
> =20
>  	return 0;
> +
> +err_gpio:
> +	gpiod_set_value_cansleep(vibrator->enable_gpio, 0);
> +	if (new_vcc_on) {
> +		regulator_disable(vibrator->vcc);
> +		vibrator->vcc_on =3D false;
> +	}
> +	return err;
>  }
> =20
>  static void pwm_vibrator_stop(struct pwm_vibrator *vibrator)
> --=20
> 2.50.1.windows.1
>=20
>=20

--3crcdto2y3erqtu7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmko3NMACgkQ2O7X88g7
+pr2MQ/+I3PvvZ68+BEfaUxCgT8zOh/4IQHf6G6zAMHZCbYkoCOmgIaqXibobAlo
LBoE/kERvGrpxFQGqzHDA27NwRYwI4t8Ziumi3OhLTTuV/3gaz7d6QFmS9XV5c8T
EfFCvkyqQjMOl8H1q/9r/4fvKq/AupTR0zVvDTP74ktU3mN4JBuH1DBcuZf7wu3C
CqZANAfte/WqfFER6WR0dXxrw1pRJeQOveswZVPO8tic94M99bbTeK3DQWwfS7XJ
OrKukUGnhj5unt9eiC/hLOtiZ0a1+p2NLafkg66ziw6JDcJAUstXB7BYXMtDnmM/
oJhoiSQNkebJ2RPk0IOKnt/YdTpXiyniYsgC7pzndTRu37t1eL+PuvKLRBdYo2XO
DrFrvkAzHTj8HOsvQiHrBYdSmRtHp3V/DNOtVztjwk9ekdEOoOnliVxNc4yZEUOb
OLoDi82YoyXDRjk5tcXTtljVn61NCwPjJfnIqg3u3dBh+MalwILGi4kqBksIzXJw
dFMPcKAaQXZ+TRADIZ16gknzkaF/skPsaKUeKxzJfBx9RRh6/y7esUj1ZSi8KFk1
z8C5gjGBEJgwheQoaQ21HeW4LFKEV4qSY8NClj+lAq4Dqx/gkYdWaCWeqTLMlVjy
MAa85g7lb/lEFFNGomZeX+HTqa1J6FQ3HclQC5sawdTpgbi/mSc=
=MCzL
-----END PGP SIGNATURE-----

--3crcdto2y3erqtu7--

