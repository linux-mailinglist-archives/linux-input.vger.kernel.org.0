Return-Path: <linux-input+bounces-12638-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162FFAC7557
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 03:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C77F8168B44
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 01:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D237419F421;
	Thu, 29 May 2025 01:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/JvdK1R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A021CD2C;
	Thu, 29 May 2025 01:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481654; cv=none; b=mO/NzSc2UDg9ydHkGkm9bkZuUan5HT1QlPjbN8qM3Gz3aiapd9JmElwTq9djkv+ZsDtooFqe1zlkb/OhT+hwJ+AiS7Y3CndkRLzotwaqxJdQm9r3jWLHSrVK+zL/HK+WkKeAdgdD8OuKM9+4XNNoInNShmdPdZtckog6Y5ValtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481654; c=relaxed/simple;
	bh=3OK0VxEb+VLLMAFdOrUGLFNoNozrgMg19aZDk5v7nDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVWEPg3M6/Iag4p9KzykkWCtsYE96f95MnGyRe0GV263TP88oa4YHMZyEznFRhQ2bkzzprqjLbeebhSLkmBI94Cw3DxVXCGrpJmu33eGEXDBABRFkwb5unBC8N4uoN4v6QCDPKqo9IS1WkHh1Jm2CKJTyYfdSaXIhJ23wc9XkoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/JvdK1R; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234e48b736aso5170275ad.3;
        Wed, 28 May 2025 18:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748481652; x=1749086452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y0+2QuQx+ehz4K9bJJ84ML9CjshKIYtlcF+IayumVjM=;
        b=Y/JvdK1RNAjnga5UYMHGv9QlAfja8REBIxoI6QuWJVuEl0l43gegNMVU7LZE8pEbKC
         nE86wUExZgdZYJsWzf0R0mrs0xAKaWBo5pIMJDo0YO0J3uJFSJjjSggezOkhjJRE4iLv
         /D2IiaeNRyyj9uPvbzi5w1cRxZZwsmhhWARfhQM9x3AuZe+GGVX0t3JRABzcjoWliemr
         x4PRiL0xZLNqZQsKO58hwOWIdv3MD4l41ilJVOJKtkNqXctRFTiJATgY14a13jx70lK5
         lXvWuxmGNtZoBwSZDxHowq/6UJeoOiVsag5axsYN7x2Cw9CKLyGpTGkTlH/8R2J6hx2o
         /0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748481652; x=1749086452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0+2QuQx+ehz4K9bJJ84ML9CjshKIYtlcF+IayumVjM=;
        b=XPL3blfr3S3Y6op4mkJPf3tugcCb/4zq648qZwVEQSrST7tSTplS5Wfdik06/14D5O
         JVpPjJVfgp5dpnUKHEmJIPBhxG7+WbltrzBgculckV58U9tNnNsFyKOy1pOXvKwsAK9N
         nJihGVk6xy3i5+svBMgrEI00PbMTKLLCHgEPyrHMJyuLzky4/BNjhwSCDVdknJsf/Iaj
         Cf+h0dWydqvkXfo9lHnYIPEEP7GlPWRb0p1zMUvU0AsUs5p4KxxA90l0R1VjoFCg5VKe
         JDA7NQHwDzvUFv5BeOn6ukhhydJBVvqJMiJybD2/+L+GLPIwUNmrMrC9E7bGtZuAXB/U
         rFyA==
X-Forwarded-Encrypted: i=1; AJvYcCW8kP6Mz786oxZlUSZdUyo3QuoJ4ha5vUyntLO7eWxGReeVjXuuPG56Y0Opzdgi8JBbdxSni1lPaPM=@vger.kernel.org, AJvYcCXqZ3QSszP0njRVu7nWDaEwZfq53nB5nnk55T9+KPTGHyrXtKMcHRnkwSpXq6u/BGLxIhMPWVwT9h/rSWCD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp3XxPY1NNPYqSrZ2HxxtxedDWia98bsCJU8SMkS9bIsxnpwbC
	gcUavWI7IrsSE1yN7euo9yZolPfbXDpOmvn7ZvYEhJEVpM9HQmnnnJZH
X-Gm-Gg: ASbGncvb5L76Fyu42nI2kO2IrEYozlnl7LNcvoO4/MB5cJaG1qxmNSLnF0ZAjlT5CS2
	eyxrctXvX7a2PPfS0RLaVl0TvBStAqgcZE+doyqa2G2O0CY2DcX/q8QjbTR4+TCEkkop9NYxCnw
	45lTRWMZrrizLrpM18PAM32ibx1p2z/GO1PDRyFRsc2uBt97qDF4OlHOHBPHBenDUi9BmkeQNJv
	5G8YWndUmja4veSRngIQxFA7BM9hNAyO5ZUNU0emWUnBbaikcbQcfL/TsZWrBKC1khsZz+hjpXx
	KRFs8mH/cOlX054XCawufAGmtnl2STrZLH/+kCGs6/2WzWB4Kaw=
X-Google-Smtp-Source: AGHT+IGpXSSNw5tDig6jalJ6b4bhI3tDTgUvpr1WwFbPiYU4ovoIe4S/MayssORVh28ZBDmQUKt5Kw==
X-Received: by 2002:a17:903:2312:b0:235:5a9:976f with SMTP id d9443c01a7336-235080195f4mr4823515ad.24.1748481652338;
        Wed, 28 May 2025 18:20:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc95dasm2150585ad.23.2025.05.28.18.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 18:20:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D3D9741E4844; Thu, 29 May 2025 08:20:49 +0700 (WIB)
Date: Thu, 29 May 2025 08:20:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 4/4] input: docs: Make headings compliant w/ guidelines
Message-ID: <aDe2ccCxG8I24gsQ@archie.me>
References: <20250526135957.180254-1-contact@gvernon.com>
 <20250526135957.180254-5-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xF0tG2VH+L8g8DO8"
Content-Disposition: inline
In-Reply-To: <20250526135957.180254-5-contact@gvernon.com>


--xF0tG2VH+L8g8DO8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:59:52PM +0100, George Anthony Vernon wrote:
> diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input=
/devices/amijoy.rst
> index cbc5240f8af3..a81e9de481c7 100644
> --- a/Documentation/input/devices/amijoy.rst
> +++ b/Documentation/input/devices/amijoy.rst
> @@ -1,10 +1,12 @@
> -~~~~~~~~~~~~~~~
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Amiga joysticks
> -~~~~~~~~~~~~~~~
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> +Pinouts
> +=3D=3D=3D=3D=3D=3D=3D
> =20
>  Amiga 4-joystick parallel port extension
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +----------------------------------------
> =20
>  Parallel port pins:
> =20
> @@ -19,8 +21,8 @@ Pin    Meaning  Pin    Meaning
>  19     Gnd1	18     Gnd2
>  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D   =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> =20
> -Amiga digital joystick pinout
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Amiga digital joystick
> +----------------------
> =20
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Pin Meaning
> @@ -36,8 +38,8 @@ Pin Meaning
>  9   Thumb button
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -Amiga mouse pinout
> -~~~~~~~~~~~~~~~~~~
> +Amiga mouse
> +-----------
> =20
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Pin Meaning
> @@ -53,8 +55,8 @@ Pin Meaning
>  9   Right button
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -Amiga analog joystick pinout
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Amiga analog joystick
> +---------------------
> =20
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Pin Meaning
> @@ -70,8 +72,8 @@ Pin Meaning
>  9   Analog Y
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -Amiga lightpen pinout
> -~~~~~~~~~~~~~~~~~~~~~
> +Amiga lightpen
> +--------------
> =20
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Pin Meaning
> @@ -87,7 +89,11 @@ Pin Meaning
>  9   Stylus button
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -------------------------------------------------------------------------=
-------
> +Register addresses
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +JOY0DAT/JOY1DAT
> +---------------
> =20
>  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME     rev ADDR type chip   Description
> @@ -159,7 +165,8 @@ JOY1DAT   Y7  Y6  Y5  Y4  Y3  Y2  Y1  Y0     X7  X6  =
X5  X4  X3  X2  X1  X0
>           | Right      |  4   | X1                              |
>           +------------+------+---------------------------------+
> =20
> -------------------------------------------------------------------------=
-------
> +JOYTEST
> +-------
> =20
>  =3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  NAME      rev ADDR type chip    Description
> @@ -176,7 +183,8 @@ JOYTEST       036   W   Denise  Write to all 4  joyst=
ick-mouse counters at once.
>    JOYxDAT  Y7  Y6  Y5  Y4  Y3  Y2  xx  xx     X7  X6  X5  X4  X3  X2  xx=
  xx
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=
=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=
 =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D
> =20
> -------------------------------------------------------------------------=
-------
> +POT0DAT/POT1DAT
> +---------------
> =20
>  =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME    rev ADDR type chip   Description
> @@ -217,7 +225,8 @@ POT1DAT  h  014   R   Paula  Pot counter data right p=
air (vert., horiz.)
>           the counters will count proportionally faster.
>           This should be noted when doing variable beam displays.
> =20
> -------------------------------------------------------------------------=
-------
> +POTGO
> +-----
> =20
>  =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME   rev ADDR type chip   Description
> @@ -226,7 +235,8 @@ POTGO      034   W   Paula  Pot port (4 bit) bi-direc=
tion and data, and pot
>  			    counter start.
>  =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -------------------------------------------------------------------------=
-------
> +POTINP
> +------
> =20
>  =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME   rev ADDR type chip   Description

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--xF0tG2VH+L8g8DO8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDe2cQAKCRD2uYlJVVFO
o+p5AQDjvhscw1VppovnGOx4e9IlS1aQ/twuA/EprY4nn7POugD/USwRk/E7Vev3
pyd1/PacDAOe+xt+gSvJykXAizoFigM=
=o5E0
-----END PGP SIGNATURE-----

--xF0tG2VH+L8g8DO8--

