Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C5231DE88
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhBQRoC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:44:02 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44410 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234637AbhBQRoB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:44:01 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A026C1C0B81; Wed, 17 Feb 2021 18:43:18 +0100 (CET)
Date:   Wed, 17 Feb 2021 18:43:18 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] HID: playstation: revert LED class exposure
Message-ID: <20210217174318.GA26823@duo.ucw.cz>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-02-17 18:31:47, Benjamin Tissoires wrote:
> [sending those patches on behalf of Roderick]
>=20
> There is a current thread on LED LKML which basically means that
> we have to revert the LED class exposure until things are settled.
>=20
> I am sending here the full series that will end up in linux-next.
> But with some git magic, the final PR to Linus will not have the
> reverts in it, just the plain patches.

Thank you!
									Pavel
								=09
--=20
http://www.livejournal.com/~pavelmachek

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC1VtgAKCRAw5/Bqldv6
8q+NAKCasFoOHP/JuD1D9S6PWIVlQSsK/wCfReV9a2nwe0Ig1RPNcAvbJ3XlEYE=
=KPTf
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
