Return-Path: <linux-input+bounces-7494-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3A39A0B8F
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 15:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C359E282F9C
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 13:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A291D8E1D;
	Wed, 16 Oct 2024 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVjwbspq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20088205E3C;
	Wed, 16 Oct 2024 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085767; cv=none; b=lIKpesviM19VgRBO6jsvjsdjxiBSCdo6wpWolwau/yzDPAMALxNSAe0eUKmtid50VY1cslJ8wTkmvO0/VWc76YxqXJKT6ikqH4AHjD+56nHrgd1Sx1BraatUS+f47WuKnvH8d9c3tg+RFXEByjOZIc6H5iPQ8W6AXq6XDMRZqnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085767; c=relaxed/simple;
	bh=Hzk+WfXzj1Rao4KTCzrr0DHS2W/zA3JabpGR+nqZbT0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BirSctGaseZEqqe5+TuUxE17QGjVnwkyZpaClLN9AvRejroNAPuMJ5z04uWHBo/OWF44AZ9JzNU8C7j/TT0jbY8JYWP8f3QT502JtlBIdu9hyHacMOpJm9zJVsoFUIZSr1vg9nWyaGAc/S5De22pnoe2OF0dKSO6a9XSaGCT+B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVjwbspq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso4906747a12.3;
        Wed, 16 Oct 2024 06:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729085764; x=1729690564; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hzk+WfXzj1Rao4KTCzrr0DHS2W/zA3JabpGR+nqZbT0=;
        b=UVjwbspqKSVcAw+LOQUWDf6bGtFUzpZa3jcJVHDOiLld7K9B6OYdV93JAGpMFUz9i4
         QfsvdB1NGkgdKt8fHHvbp3gv6l4M1HaMYmN8W5R0LUCsGJlbnXYcTXckD/flNB+iixPH
         aa9kXtF/lLKuSl8UrYEVLKhD5Lq0dqTug/JWkAJA8AorU5nAgdgl3ZUxKMB3PSxkea7E
         QlxHp9NK/x/yhpGw7XQoeaU31AA30Yu5gmXasoSIagc/ELW7700d84iQY00dZcHkt9lV
         NsZVgYYXpktAZWJilA6j+qq6fwyImo0BGdoy/4rfMm5SBj6Ssy4FeVS3zt3dzZ4+UiX2
         EfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085764; x=1729690564;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hzk+WfXzj1Rao4KTCzrr0DHS2W/zA3JabpGR+nqZbT0=;
        b=bfh5ZFXb4da2WEJQOiDsHadhyY/htvrwAUcn4906wiRX6CcPtBc0vpIUfmId0DYvJk
         KMWSsq5iRiQiOs08mRbWWqmotPaui7dAZv90FMp0H9D7SO9E3lbSYv5dz//Ah3Z6SVth
         +EoUS7Fas0X+4u6RK2Z3LKGtHbOdVs2zLRCNxcqjjinHa/S9ZhLNPlBkIYgJx3hVZgUA
         VPsss31r2yryzzIUuQ6nYJ9ayv5OaK/oFlzelRXwW/BoAhsnfdQNUde4EIC8D2GmNlF3
         Mex6/dt8aAV0e2HzjdpwBWesr3rPigR9Ax7zjhhPgw6SSxgqVfJmO1SxCy3AhOeMtkSB
         qpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoK6KtAzRsXe+zHnnO4ycaflreeVfdTq1KHQc9nDq+Trx+O3Mn14TmNRbI1m1pkgQ86LpstPV8haE8@vger.kernel.org
X-Gm-Message-State: AOJu0YxGs5rorLBDqnF8fIZXufcpZiRiIEEXNcjHy4kUtSYIdUztY3ZN
	i9fHR469axblB3KwfuRUOzagIAdBg8Go64DSBDlKrIusn96+1P/f
X-Google-Smtp-Source: AGHT+IHUfBEf5Lp0Sfac6ZyEYZITcvtgWGcHUlOkyEMNCh7FAaVFC9eKuFAksWgLsSe4m8LJ1NpSOg==
X-Received: by 2002:a17:907:1b94:b0:a99:daca:bed8 with SMTP id a640c23a62f3a-a99dada043cmr1075477166b.44.1729085764314;
        Wed, 16 Oct 2024 06:36:04 -0700 (PDT)
Received: from 9321da9b-2a50-4ed9-8c34-2480eb2669c2.fritz.box ([2001:a61:34c9:ea01:14b4:7ed9:5135:9381])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2971917bsm184997566b.40.2024.10.16.06.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:36:04 -0700 (PDT)
Message-ID: <d1395bd61ce58b3734121bca4e09605a3e997af3.camel@gmail.com>
Subject: Re: [PATCH 00/13] Input: adp5589: refactor and platform_data removal
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Nuno Sa <nuno.sa@analog.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Mike Frysinger <vapier@gentoo.org>, Dmitry
 Torokhov <dtor@mail.ru>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>,  Lee Jones <lee@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org
Date: Wed, 16 Oct 2024 15:36:03 +0200
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
References: 
	<20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-10-01 at 15:41 +0200, Nuno Sa wrote:
> This series aims to remove platform data dependency from the adp5589
> driver (as no platform is really using it) and instead add support for
> FW properties. Note that rows and columns for the keypad are being given
> as masks and that was briefly discussed with Dmitry. For context
> on why this is being done as mask [1].
>=20
> The first couple of patches are fixes that we may want to backport...
>=20
> [1]:
> https://lore.kernel.org/linux-input/9db96c99c805e615ba40ca7fd3632174d1e8d=
11f.camel@gmail.com/
>=20
> ---
> Nuno Sa (13):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: fix NULL pointer dere=
ference
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: fix adp5589_gpio_get_=
value()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: add chip_info structu=
re
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: support gpi key event=
s as 'gpio keys'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: input: Document adp5589 and s=
imilar devices
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: add support for fw pr=
operties
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: add guard() notation
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: bail out on returned =
error
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: refactor adp5589_read=
()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: fix coding style
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: unify adp_constants i=
n info struct
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: make use of dev_err_p=
robe()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input: adp5589-keys: add regulator support
>=20
> =C2=A0.../devicetree/bindings/input/adi,adp5589.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 310 +++++
> =C2=A0.../devicetree/bindings/trivial-devices.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 -
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +
> =C2=A0drivers/input/keyboard/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 3 +
> =C2=A0drivers/input/keyboard/adp5589-keys.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1397 +++++++++++++------=
-
> =C2=A0include/linux/input/adp5589.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 180 ---
> =C2=A06 files changed, 1254 insertions(+), 650 deletions(-)
> ---
> base-commit: c7bf046925dc5885d9c4d8fbcbb7e4e73665bfcf
> change-id: 20240930-b4-dev-adp5589-fw-conversion-955b2f42da70
> --
>=20
> Thanks!
> - Nuno S=C3=A1
>=20

Hi Dmitry,

Something really caught my attention now while checking 6.12 merge window. =
It seems
we have a new MFD device for adp5585 [1] which adds duplicated functionalit=
y (that
was already present in adp5589-keys.c). So, having this as MFD might makes =
sense
(even though it makes it harder to validate the keys and to make use of gpi=
o-keys)
but we are now duplicating GPIO support. Bottom line, not sure what we shou=
ld do next
and should I proceed for v2?

Also ccing Lee and Bartosz...

[1]: https://lore.kernel.org/lkml/20240816152738.GB5853@google.com/

- Nuno S=C3=A1

