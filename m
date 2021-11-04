Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF17B445295
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 13:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhKDMEJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 08:04:09 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52224 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhKDMEJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 08:04:09 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 442FF1C0B79; Thu,  4 Nov 2021 13:01:30 +0100 (CET)
Date:   Thu, 4 Nov 2021 13:01:11 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, kernel@collabora.com
Subject: Re: [RFC] tty/sysrq: Add alternative SysRq key
Message-ID: <20211104120111.GB23122@duo.ucw.cz>
References: <20211103155438.11167-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <20211103155438.11167-1-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> There exist machines which don't have SysRq key at all, e.g. chromebooks.
>=20
> This patch allows configuring an alternative key to act as SysRq. Devices
> which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
> but other devices use the alternative SysRq key instead, by default F10.
> Which key is actually used can be modified with sysrq's module
> parameter.

Is F10 sensible default? Would it make sense to use something like
alt-shift-esc so that this can be enabled by default?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYYPLhwAKCRAw5/Bqldv6
8hfFAJ9LecIqYJZx8MdhF6gtwKzhQ0qYHgCgtmj55V1Rumu9ySpwR5FVnYK4d0A=
=hgtI
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
