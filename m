Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EDB2E28B0
	for <lists+linux-input@lfdr.de>; Thu, 24 Dec 2020 20:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbgLXTGq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Dec 2020 14:06:46 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:51878 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728782AbgLXTGq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Dec 2020 14:06:46 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E5D691C0BB9; Thu, 24 Dec 2020 20:06:03 +0100 (CET)
Date:   Thu, 24 Dec 2020 20:06:02 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jian-Hong Pan <jhp@endlessos.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessos.org
Subject: Re: [PATCH] HID: Add Wireless Radio Control feature for Chicony
 devices
Message-ID: <20201224190602.GB22388@amd>
References: <20201222073855.98490-1-jhp@endlessos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
In-Reply-To: <20201222073855.98490-1-jhp@endlessos.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-12-22 15:38:56, Jian-Hong Pan wrote:
> Some Chicony's keyboards support airplane mode hotkey (Fn+F2) with
> "Wireless Radio Control" feature. For example, the wireless keyboard
> [04f2:1236] shipped with ASUS all-in-one desktop.
>=20
> After consulting Chicony for this hotkey, learned the device will send
> with 0x11 as the report ID and 0x1 as the value when the key is pressed
> down.

Fun, how can airplane mode work on _wireless_ keyboard? :-).

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/k5poACgkQMOfwapXb+vJMZgCfe+Ckv3JycCWrnJWr5dneAu3W
0fwAn3+og0TRLY2dy03r9Op0bU2ITgD+
=yKtF
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
