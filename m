Return-Path: <linux-input+bounces-12639-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78214AC755D
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 03:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 751D47AC361
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 01:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D246E1B4247;
	Thu, 29 May 2025 01:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Janl0Hws"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9461B042C;
	Thu, 29 May 2025 01:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481786; cv=none; b=eCuWCYzxGLWTHOx74HysWuKtgCBAJyWUfvTdmPrIW9zL9jOncsRS0j8AJt40kPomvOQYgKFMPBKfWgfCLqqjEqax08mkwJCFVVyIjfda98qEK0zjwD7+ku/5OCi5cjH5B0r+I+BcErmT1kaZIHGvdYn4Soxp5PJyJtLoZhrDDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481786; c=relaxed/simple;
	bh=5y7CveGbYGod76OFGDf+v0QSkzJi7YLcrk5H2SLo95E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCG85WU5W6DqHD4HJVUg9XKpk28pAPsN4YkhlD5kEdGh2TI5sZMqkVnDikhWr5fI0oSRu/i3tTpxV38liRj0O/TLqP+Z5eMxBNG1sbM1uyTY8Fg4Mt69BMuU/PeV5uR6bmusu/n2Xgw2TbmBVmids02MKrs6X+a+ga6q5Cl13A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Janl0Hws; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7370a2d1981so205648b3a.2;
        Wed, 28 May 2025 18:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748481784; x=1749086584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNcpQ6iTd23Fuh0WUpnzSmEEECvnd8gbAVf510WE3Vg=;
        b=Janl0HwszOVx4THtVmpFX07vI3Oufv2zP6Se2kZxMTWYV8nLvWHle6GYN8q97HoBye
         y4BoDfx6U22lzAxOukOsLsTP/xPTwXDyg+z5ymI10JX8H8s9feF9at669cSQQ4Zix/5L
         iqy6+1RVTh2EEYwPBUTtN3toutAWnpuUP1DXc0QPZQOVOyUdmSH8dIPQ5pTf6DtWHBF2
         rNnx4os2d79OW94DJ4RmLbfmqTUOTAuum+Yidj99FM4WEdN1HmYYcY56PqwLoefXm8G4
         0tlpu8oqNG9jSkY7su3SzK0nyUfKQ0N0fmRazoFhnevdR5xPBURkriEXMfZqbnylzmQX
         BFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748481784; x=1749086584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNcpQ6iTd23Fuh0WUpnzSmEEECvnd8gbAVf510WE3Vg=;
        b=H+Xfo7qO+IzDaYNT28FccnLkwURyY69R/0EiiVEvIVxaPJYnLoKvVHqqRzYIHjSoyJ
         NJTGRHFAl5DAGfNJPkGAGD+A+nRmJbolHHVAGQne2qmMgfxjlVK238uMmoQohDgLP2BI
         x590+SsFiYzu+rWAwT6FK6WIyZfxtiPhnjOvp9Kg4tIK6iW5NrtaHFOs/IqZ8l5N5cG2
         O7ayEgSl6mbVEfSeMJFKjWGNymdfqrehe6ZPSPJ4pMaOJQuDJosxikMD/m4kMr+eyuwE
         VZr+FLLJKAjV9ekb4M95Zv5tkf7Lr+Pm+cwFvEnwpY7EIOciNBZCOaL1G5Dpe1M4Rxlb
         zRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiFdL+baZNQ/gcYO+aELiwUNSn79+AjMTsVnLVu5ZriYoJmh6MDCikVwiPfKO6uiZNNTwF4XDn3Zs=@vger.kernel.org, AJvYcCWIygPOLwCWWsKryAdrMPJ6AaNNb+IoosCH0p0TaFMll58wxLvZ0u2+yuLxSDf6mXcewRTOjMODFM82/FVX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/GMd0AHf85p/xMrrS/F3NJW5hfo5mjLmu13wUucjhfO+Zxiul
	Muin8p/MB6u1UA4Ik5wyqPt5VDh7gwW4uTfzgLbnYDTNw6piHcVj7TW1
X-Gm-Gg: ASbGncu0CDtHCdUMmPitlroKCqejvPl/+KDdbCgrK3EnrhKgGcu0OkC4ANIwQBNdQRn
	AUgsRy1lzBWlO6lh1Wet22cOZ+PZXt6vzrfzw+UF21lCBKIZQYr4aBIF+xKceaIPh1yCfSKtgaf
	q6BM8ntnE31t0POw8mnPMu8KbcpvHlWLApVjYGzfB/SqGOyEL69TcmLg7Z1dzV13wEUgcQdm7HF
	eYJei9xWUT1H9xIoKi8PQ+/PN4DQ5nXeDpyioNB4t9ARh5WpJlO0XceBBJLby2qKRSkaNMvWf0D
	UCIRz0JiX7flfDZCO7uf1m45qXjUtAeEf9f0I9tB+D880cTfVvg=
X-Google-Smtp-Source: AGHT+IEq7cO8TC8Du8MUlyjcSTXy0CPrk1am1y/cD3TkFUUKjnPvY8xKVFDO7oe1jBnbh2UVTJ4sXg==
X-Received: by 2002:a05:6a20:d70f:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-2188c1e8dfamr33868375637.7.1748481784332;
        Wed, 28 May 2025 18:23:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe9639csm248215b3a.17.2025.05.28.18.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 18:23:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C918B41E4844; Thu, 29 May 2025 08:23:01 +0700 (WIB)
Date: Thu, 29 May 2025 08:23:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/4] input: docs: Fix Amiga joysticks grammar
Message-ID: <aDe29U-JljGPpKiK@archie.me>
References: <20250526135957.180254-1-contact@gvernon.com>
 <20250526135957.180254-4-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K4011M0stGA66i1P"
Content-Disposition: inline
In-Reply-To: <20250526135957.180254-4-contact@gvernon.com>


--K4011M0stGA66i1P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:59:51PM +0100, George Anthony Vernon wrote:
> -         +-------+----------+-------------------------------------------=
--+
> -         | BIT#  | FUNCTION | DESCRIPTION                               =
  |
> -         +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> -         | 15    | OUTRY    | Output enable for Paula pin 33            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 14    | DATRY    | I/O data Paula pin 33                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 13    | OUTRX    | Output enable for Paula pin 32            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 12    | DATRX    | I/O data Paula pin 32                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 11    | OUTLY    | Out put enable for Paula pin 36           =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 10    | DATLY    | I/O data Paula pin 36                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 09    | OUTLX    | Output enable for Paula pin 35            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 08    | DATLX    | I/O data  Paula pin 35                    =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 07-01 |   X      | Not used                                  =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 00    | START    | Start pots (dump capacitors,start counters=
) |
> -         +-------+----------+-------------------------------------------=
--+
> +         +-------+----------+-------------------------------------------=
---+
> +         | BIT#  | FUNCTION | DESCRIPTION                               =
   |
> +         +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +         | 15    | OUTRY    | Output enable for Paula pin 33            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 14    | DATRY    | I/O data Paula pin 33                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 13    | OUTRX    | Output enable for Paula pin 32            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 12    | DATRX    | I/O data Paula pin 32                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 11    | OUTLY    | Out put enable for Paula pin 36           =
   |
                                "Output"
> +         +-------+----------+-------------------------------------------=
---+
> +         | 10    | DATLY    | I/O data Paula pin 36                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 09    | OUTLX    | Output enable for Paula pin 35            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 08    | DATLX    | I/O data  Paula pin 35                    =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 07-01 |   X      | Not used                                  =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 00    | START    | Start pots (dump capacitors, start counter=
s) |
> +         +-------+----------+-------------------------------------------=
---+

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--K4011M0stGA66i1P
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDe29QAKCRD2uYlJVVFO
o2NgAQD2R4HfOj4KSacO1xNyyC/L6FQDftc+OlaWuS7P7PjNHwEAqxD7T/wXLCmO
uKixNwmxZN2NxZBvJnkaw7Dn7Q2jQw0=
=pYvh
-----END PGP SIGNATURE-----

--K4011M0stGA66i1P--

