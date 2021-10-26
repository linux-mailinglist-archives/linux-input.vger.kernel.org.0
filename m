Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6C943B9EF
	for <lists+linux-input@lfdr.de>; Tue, 26 Oct 2021 20:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbhJZSvO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Oct 2021 14:51:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47990 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhJZSvO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Oct 2021 14:51:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 403351C0B7F; Tue, 26 Oct 2021 20:48:48 +0200 (CEST)
Date:   Tue, 26 Oct 2021 20:48:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
Message-ID: <20211026184847.GA25683@duo.ucw.cz>
References: <20210927141109.GB5809@duo.ucw.cz>
 <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
 <20211013074849.GA10172@amd>
 <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2110220840340.12554@cbobk.fhfr.pm>
 <20211022072115.GA25215@amd>
 <nycvar.YFH.7.76.2110220924340.12554@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2110220931190.12554@cbobk.fhfr.pm>
 <20211025091929.GA5878@amd>
 <nycvar.YFH.7.76.2110251127380.12554@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2110251127380.12554@cbobk.fhfr.pm>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > go ahead and merge the patch.
>=20
> Can I take this as your Acked-by: then, so that I can finally apply it an=
d=20
> get the needed linux-next coverage before merge window opens?

Yes.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYXhNjwAKCRAw5/Bqldv6
8oMuAJ9rzLeZ39gWhTzx4oOPK84VLVucHACeIv7K/4FR9VljSYvnjRMtT8ANeg0=
=LhiS
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
