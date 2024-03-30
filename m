Return-Path: <linux-input+bounces-2717-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A811D892A11
	for <lists+linux-input@lfdr.de>; Sat, 30 Mar 2024 10:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5785E283299
	for <lists+linux-input@lfdr.de>; Sat, 30 Mar 2024 09:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92C1D26B;
	Sat, 30 Mar 2024 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="K93VgGGb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64E1C0DDD;
	Sat, 30 Mar 2024 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711791271; cv=none; b=fC4QQiana65tSuBRu9LVdQxj6FZE6ff5mOfMXWEMyuUyrL/N8U7RK4M871aXxSYEPncemGKQUJqvN/Tm+w/W5f1F/nZyveS7NYT6tS96EAPQ8RTiHYYiR4cLFeQgh30U2SiP8I0/ogh3Uynwc8rrAnT1UuWl3fz3JxKEn3Anl6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711791271; c=relaxed/simple;
	bh=2D3W7Aq8rRi3gmv+4PXRtGv6s9okVKCpNPzM2GIJhqA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=oZ2mnoqV3I/A+ghJoH6qP0Irn46wHvNbvSS/KhvRI+DZKC2LRtBP86bbofhhHGX0OS9gAOflkKKP9w2X8lRkmtEnDk1SJ/rZpCGn47IWmwkFiPGdffd9dSPROsO1/4XXRM1P7A7FqtSLdZm5rzj34rpxayo4iIHX5v7bhBgDPlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=K93VgGGb; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1711791235; x=1713091235;
	bh=YkJ6HA2Rzwgap8CzRAVIV0XAgD0cG3+xkx0g8vSdt0Y=;
	h=Mime-Version:From;
	b=K93VgGGb/2nFZnEjPEWjtOFZjLkdRjNqs+qj0cvIh8ACa5XfYLnplq+BW+yBybZ+e
	 2gsvkxx0tZ+A8/2gYL0VpfgSPwQsE7fj2m8nxSjSXvvLkqczB/iiR/YRpbLG3isntZ
	 NqqtZjJt+rH4guTWG5Ma4VNQXFiJY+7aWakxQYS7/DuyRUw1Zg98hjFMTBnhWcbP9z
	 g/Ckj/p0F0w2SVAEfBTKxsX607AF2qYCxXQTwOlVUd+eW6M6tloL0NdruYfdpMd7Cj
	 /+WHJNMQN2qGkzrIwfwpmDnePqlBAf9zyp0Q4vqGNczUhUJSkocVDkgbHPX0iWytuS
	 MpZFthd63l3gg==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 42U9XrDM052600
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 30 Mar 2024 10:33:55 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 Mar 2024 10:33:53 +0100
Message-Id: <D06ZCKKYTQM5.3OJ6HCLHW3DZ9@matfyz.cz>
Cc: "Markuss Broks" <markuss.broks@gmail.com>,
        "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <duje.mihanovic@skole.hr>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 6.8 78/98] input/touchscreen: imagis: add
 support for IST3032C
To: "Sasha Levin" <sashal@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20240329123919.3087149-1-sashal@kernel.org>
 <20240329123919.3087149-78-sashal@kernel.org>
In-Reply-To: <20240329123919.3087149-78-sashal@kernel.org>

Sasha,

Sasha Levin, 2024-03-29T08:37:49-04:00:
> From: Karel Balej <balejk@matfyz.cz>
>
> [ Upstream commit 90cb57a6c5717b83a110c0da720a03ee32ed255e ]
>
> IST3032C is a touchscreen chip used for instance in the
> samsung,coreprimevelte smartphone, with which this was tested. Add the
> chip specific information to the driver.
>
> Reviewed-by: Markuss Broks <markuss.broks@gmail.com>
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> Link: https://lore.kernel.org/r/20240301164659.13240-6-karelb@gimli.ms.mf=
f.cuni.cz
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/input/touchscreen/imagis.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscre=
en/imagis.c
> index 9af8a6332ae67..e1fafa561ee38 100644
> --- a/drivers/input/touchscreen/imagis.c
> +++ b/drivers/input/touchscreen/imagis.c
> @@ -11,6 +11,8 @@
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
> =20
> +#define IST3032C_WHOAMI			0x32c
> +
>  #define IST3038B_REG_STATUS		0x20
>  #define IST3038B_REG_CHIPID		0x30
>  #define IST3038B_WHOAMI			0x30380b
> @@ -363,6 +365,13 @@ static int imagis_resume(struct device *dev)
> =20
>  static DEFINE_SIMPLE_DEV_PM_OPS(imagis_pm_ops, imagis_suspend, imagis_re=
sume);
> =20
> +static const struct imagis_properties imagis_3032c_data =3D {
> +	.interrupt_msg_cmd =3D IST3038C_REG_INTR_MESSAGE,
> +	.touch_coord_cmd =3D IST3038C_REG_TOUCH_COORD,
> +	.whoami_cmd =3D IST3038C_REG_CHIPID,
> +	.whoami_val =3D IST3032C_WHOAMI,
> +};
> +
>  static const struct imagis_properties imagis_3038b_data =3D {
>  	.interrupt_msg_cmd =3D IST3038B_REG_STATUS,
>  	.touch_coord_cmd =3D IST3038B_REG_STATUS,
> @@ -380,6 +389,7 @@ static const struct imagis_properties imagis_3038c_da=
ta =3D {
> =20
>  #ifdef CONFIG_OF
>  static const struct of_device_id imagis_of_match[] =3D {
> +	{ .compatible =3D "imagis,ist3032c", .data =3D &imagis_3032c_data },
>  	{ .compatible =3D "imagis,ist3038b", .data =3D &imagis_3038b_data },
>  	{ .compatible =3D "imagis,ist3038c", .data =3D &imagis_3038c_data },
>  	{ },
> --=20
> 2.43.0

sorry if I'm missing something, but I don't see why this should be
backported: it doesn't fix anything, it's just adding support for new
hardware.

I can see that adding a device ID is permitted for -stable [1], but I
thought it still has to bear some signs of a fix, such as maybe here
[2].

Furthermore, you are also proposing to backport Duje's touch keys
support [3] which I think is unarguably a new feature and not a fix at
all. Of all the Imagis patches, only the touch area correction [4] seems
to make sense for backporting.

Could you please explain?

[1] https://docs.kernel.org/next/process/stable-kernel-rules.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?=
id=3Dd40e9edcf3eb925c259df9f9dd7319a4fcbc675b
[3] https://lore.kernel.org/stable/20240329123919.3087149-88-sashal@kernel.=
org/
[4] https://lore.kernel.org/stable/20240329123919.3087149-76-sashal@kernel.=
org/

Thank you, best regards,
K. B.

