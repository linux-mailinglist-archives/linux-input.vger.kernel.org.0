Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3418943729C
	for <lists+linux-input@lfdr.de>; Fri, 22 Oct 2021 09:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbhJVHXe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Oct 2021 03:23:34 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49312 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhJVHXe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Oct 2021 03:23:34 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 29FAE1C0B76; Fri, 22 Oct 2021 09:21:16 +0200 (CEST)
Date:   Fri, 22 Oct 2021 09:21:15 +0200
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
Message-ID: <20211022072115.GA25215@amd>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
 <20210908165539.3102929-3-roderick.colenbrander@sony.com>
 <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm>
 <20210927141109.GB5809@duo.ucw.cz>
 <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
 <20211013074849.GA10172@amd>
 <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2110220840340.12554@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2110220840340.12554@cbobk.fhfr.pm>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-10-22 08:42:06, Jiri Kosina wrote:
> On Mon, 18 Oct 2021, Jiri Kosina wrote:
>=20
> > > Ok, so let's put it in the common place. I'll take this patch through
> > > LED tree if you resubmit it. You still may want to use local defines
> > > so you can apply the other patches without waiting.
> >=20
> > Pavel, why complicate it so much? Given how trivial the patch is, the=
=20
> > easiest way is what's usually done in such cases (where substantial pat=
ch=20
> > depends on a tiny trivial change elsewhere) -- take it through HID tree=
=20
> > with your Reviewed-by / Acked-by:.
> >=20
> > Do you see any issue with that?
>=20
> Pavel, another week has passed. I am considering just including the=20
> trivial LED #define additions and take them through hid.git unless I hear=
=20
> from you today.

I'd prefer not to deal with rejects / common immutable branches / etc.

You don't _need_ the defines at all, and you don't need them in the
common place. Just merge the patch without the defines. I'll merge the
defines. That seems like least complex solution to me.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmFyZmsACgkQMOfwapXb+vIPbwCbBfwvELNVz959mosLHAHzUJQd
M00An0WlBb7SytHb7gC+HdwX4YbXd5VG
=G2Dv
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
