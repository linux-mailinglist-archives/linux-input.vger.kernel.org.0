Return-Path: <linux-input+bounces-183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2A07F302A
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 15:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A0C2821AB
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 14:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075B843169;
	Tue, 21 Nov 2023 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSD+AuGj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFFBCA;
	Tue, 21 Nov 2023 06:04:01 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6c398717726so4682045b3a.2;
        Tue, 21 Nov 2023 06:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700575441; x=1701180241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YXE/wSY7rxsEQtyGCU8Vo4ysURLqqemytpp2DMRejDM=;
        b=cSD+AuGjhMVw7N29qTboHDk2feCfvK0fIr4GfsOIug5MjAvvop2pNZ2yxqNEbGGspS
         slSJrduRSeg5kxMg7fx0xXG5RWY+52WstxmQ07KY/qnBGB/Ifl25gnGm+yy8nSxwstaX
         HLLqNVQn2BmRD430PUHXn6l2nbBc9oJXf0fKrVcwDP2omuHIoUhsRZOIuu/vRFLNeH9C
         xhVLIlzTgSLoDfEIkk5fiMTWXgd1EMcZ9JSIxgFx2QUeC+PFiHb/xaNubvMd5MrJqpDL
         xtKTPymz3yiaBCIk+8GYa4Ik9ononY6Zmc+sMIVQUvOp3YKNj6L2+WE0mrP2OUpG+GGq
         bLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575441; x=1701180241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXE/wSY7rxsEQtyGCU8Vo4ysURLqqemytpp2DMRejDM=;
        b=MZrt2CNM77pbgCsXbIawtTJVhXR682Ej+rLQx/mdFYlZg13NnO/6h1CBKqMhiZNHUT
         WOkgqNs8MPVOr58HFuFBh8NCbJRzG0ewv1eODH3ww6uzTbYMQRpqXL4VL8dpqA58BXhl
         7WDwb436Zjij4mR5V9UAVeC0Ps0My1cjeNg6SBO727/gpIkopxCYSnzEYwHD3q6tsYza
         YEPIPJHmPHJhTqVTMt3RFwC7WACK3xfmx1vJv884+iNHab2D6J5UAVjnA2wqFtFjk6iQ
         mXzJTMPodCszNiLF/orNLBnH80ZR0CQ3hJ79florJGHhQ+mZeBGPzC5nCM/X8gKVljjz
         GUbw==
X-Gm-Message-State: AOJu0YzPwPA0ovI27iEQhFKMszgD4hIe/jj/C1oJbYUxWX3y4R2OQIdn
	Avfngw6eTV3qXU991Zp3fAo=
X-Google-Smtp-Source: AGHT+IEh4zH4UY4YdBn32K7s1Y6nH6BG5UROVv7myOkk8sqazLdYJs4o3x7Qu/siDjrbnw+khPLUgQ==
X-Received: by 2002:a05:6a00:4286:b0:6cb:835a:8606 with SMTP id bx6-20020a056a00428600b006cb835a8606mr7433156pfb.4.1700575440845;
        Tue, 21 Nov 2023 06:04:00 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id j12-20020a056a00130c00b0068fece22469sm7906337pfu.4.2023.11.21.06.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:04:00 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 1E86010207145; Tue, 21 Nov 2023 21:03:56 +0700 (WIB)
Date: Tue, 21 Nov 2023 21:03:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>,
	Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	LinuxCat <masch77.linuxcat@gmail.com>,
	Marcelo <mmbossoni@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: Fwd: Logitech G915 Wireless Keyboard acts weird on 6.6.0
Message-ID: <ZVy4yzbN6-ak-TPI@archie.me>
References: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com>
 <ZVyr-of1X4RudpWG@archie.me>
 <0e10112a-7560-4dd8-8a03-5fdfc838168f@leemhuis.info>
 <nycvar.YFH.7.76.2311211458030.29220@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="82F1+VoXxx3lD9u8"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2311211458030.29220@cbobk.fhfr.pm>


--82F1+VoXxx3lD9u8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 03:00:50PM +0100, Jiri Kosina wrote:
> On Tue, 21 Nov 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
>=20
> > I guess part of the problem is that Bastien got reassigned and might not
> > care about the kernel anymore.
> >=20
> > Another part of it is that Jiri was CCed, but Benjamin was not.
> >=20
> > Ideally of course Mavroudis Chatzilazaridis, the culprit's author would
> > look into this, but from a quick search on lore it looks like Mavroudis
> > is not a regular kernel contributor and thus might not even know how we
> > expect situations like this to be handled.
>=20
> A comment from Mavroudis just appeared in
>=20
> 	https://bugzilla.kernel.org/show_bug.cgi?id=3D218172
>=20
> pointing out that indeed the report descriptor of the device he is workin=
g=20
> on is different than the ones from the reporter.
>=20
> Until this mess gets figured out, I am now pretty sure revert is the way=
=20
> to go for 6.7.
>=20

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--82F1+VoXxx3lD9u8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVy4ywAKCRD2uYlJVVFO
o5QtAQCvCeR2G8h32Yb8lh3PpeX+7/ey4sJROo4PU4Pa445r0QD/ZUL1oS6lFhFw
UN6HQu7S0B6JJCnknxUk9dV8J/hzgQQ=
=42xF
-----END PGP SIGNATURE-----

--82F1+VoXxx3lD9u8--

