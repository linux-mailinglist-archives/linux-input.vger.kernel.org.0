Return-Path: <linux-input+bounces-175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56B7F2DFE
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 14:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BBA81C21154
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 13:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCAF3E494;
	Tue, 21 Nov 2023 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsv05a3a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9354BBD;
	Tue, 21 Nov 2023 05:09:19 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc921a4632so48059435ad.1;
        Tue, 21 Nov 2023 05:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700572159; x=1701176959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NRonvrrZshq+dDW21ZOXNCiG05dY/dcLFuvkusN6s5c=;
        b=bsv05a3aSqWLl8LB4xDOx5wolh8aUjDMBXYom5LoNLbMqS2vrJMJmnmRJTp9p9H8EO
         XjX+b4klMQdIz2ogvcv6IkYw4PhWOP3uIrTeZLYL9uaxsYACqhi5T9WBlSxL0g4eF7s4
         wpe4rG0emWtYRpZdK2kP2Tb6Fv2gK0HVRoiUSk2KxfBrHtY61qkI44m3om4OMoHS5D9q
         sIqyltfRKcVAUglQy+u6JVXfHTkwuJCCAIMtBJmxeG3IRTs8HqJlulLcDJpQ1SV/6uS8
         omk/7OTMvxKqJjVkQlIrYaUEqN0JJJTO8CuK5HIfxcRSQ2vyQwxjxC0yUUTG9404NGFW
         TEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700572159; x=1701176959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRonvrrZshq+dDW21ZOXNCiG05dY/dcLFuvkusN6s5c=;
        b=cGUGLlpHCY4xsCWiqCz+M+HFzOq0Sfv2mykgO1tcSBZ1m2suRQWDB2C8GnBeX8VKSd
         w6reA9V986ZT9IZnDJb6IQlD+s7Wx5u/yXXDixZcPPkNnsvelwYSYg/OS4p/+ErIx5RM
         JDWikaf6Y817EcKDq2+O3+wwPpCR6oHcuibs9NPSy32qATP+EP86I2aVioPqQVshlQ9/
         G0X1qk/lQ1fAZ95dTcIEooK46cRnWSPyE73aexkCCL/Z06qwOBdafjJ2eV1N3z0QPL6w
         GXiT73XBFOI3TJRecvXqDqFqrgm2bfLlTOo0Gts3pu0EbJfZsYT0N3GdK8BGrvlUDu0T
         PWeg==
X-Gm-Message-State: AOJu0YyLHA+5p8lb3wsg1b7yPLKrGg9zrH1cuNn+Pk6ug1Q9yRT/m+jH
	cFbt6TMs5Rm4yW5Ugxohkow=
X-Google-Smtp-Source: AGHT+IEujS85pCBDH1UZ5g499eRM4PJrMP5yuw+mXaV6wQyBAnHSimi8om6o0CRvw7ZiZOoSPQIJYw==
X-Received: by 2002:a17:902:dace:b0:1cc:50ea:d5db with SMTP id q14-20020a170902dace00b001cc50ead5dbmr13859038plx.4.1700572158777;
        Tue, 21 Nov 2023 05:09:18 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id c16-20020a170903235000b001c625acfed0sm7847696plh.44.2023.11.21.05.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:09:17 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id CCE6310DA7619; Tue, 21 Nov 2023 20:09:14 +0700 (WIB)
Date: Tue, 21 Nov 2023 20:09:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Input Devices <linux-input@vger.kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jkosina@suse.cz>,
	LinuxCat <masch77.linuxcat@gmail.com>,
	Marcelo <mmbossoni@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Fwd: Logitech G915 Wireless Keyboard acts weird on 6.6.0
Message-ID: <ZVyr-of1X4RudpWG@archie.me>
References: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PkRtFTNZI60zkr4T"
Content-Disposition: inline
In-Reply-To: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com>


--PkRtFTNZI60zkr4T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thorsten and all,

On Thu, Nov 02, 2023 at 09:11:42PM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > Hello,
> > After upgrading from 6.5.9 to 6.6.0, my keyboard started acting really =
weird in its wireless mode, key actions sent are completely wrong, see vide=
o attached.=20
> >=20
> > Most keys are perceived as either E, 3 or F7, with F8 and <, as well.=
=20
> >=20
> > Modifier keys (CTRL, ALT, ALT GR, Shift and Super) are working normally=
, as well as media control keys (pause/play, previous, next, mute and sound=
 up/down).
> >=20
> > The keyboard works as expected if it's wired.
>=20
> Another reporter bisected the regression:
>=20
> > Bisected to=20
> >=20
> > 9d1bd9346241cd6963b58da7ffb7ed303285f684 is the first bad commit
> > commit 9d1bd9346241cd6963b58da7ffb7ed303285f684
> > Author: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> > Date: Sun Jul 16 18:23:44 2023 +0000
> >=20
> > HID: logitech-dj: Add support for a new lightspeed receiver iteration
> >=20
> > The lightspeed receiver for the Pro X Superlight uses 13 byte mouse rep=
orts
> > without a report id. The workaround for such cases has been adjusted to
> > handle these larger packets.
> >=20
> > The device now reports the status of its battery in wireless mode and
> > libratbag now recognizes the device and it can be configured with Piper.
> >=20
> > https://github.com/libratbag/libratbag/pull/1122
> >=20
> > Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
> > Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
> > Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> > Reviewed-by: Bastien Nocera <hadess@hadess.net>
> > Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> >=20
> > drivers/hid/hid-ids.h | 1 +
> > drivers/hid/hid-logitech-dj.c | 11 ++++++++---
> > 2 files changed, 9 insertions(+), 3 deletions(-)
>=20
> See Bugzilla for the full thread.
>=20
> Anyway, I'm adding this regression to regzbot:
>=20
> #regzbot introduced: 9d1bd9346241cd https://bugzilla.kernel.org/show_bug.=
cgi?id=3D218094
> #regzbot title: Logitech G915 Wireless Keyboard key event only detects fe=
w key codes
> #regzbot link: https://streamable.com/ac6l8u
>=20

There's no reply from culprit author nor linux-input people (did they miss
this regression?). And on Bugzilla, other reporters replied that reverting
the culprit fixed the regression.

FYI, there's similar Bugzilla report on [1].

Also Cc'ed Linus.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D218172

--=20
An old man doll... just what I always wanted! - Clara

--PkRtFTNZI60zkr4T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVyr9wAKCRD2uYlJVVFO
oxGlAQCojjy1tLoM65BFLE3n8cQxebxqvL3Bg/FqfAHAUlLWNgD9EcDhn5h7Akxe
fX+GsQutxubddAt3tS4xMsnhdWWi3Q0=
=ySw3
-----END PGP SIGNATURE-----

--PkRtFTNZI60zkr4T--

