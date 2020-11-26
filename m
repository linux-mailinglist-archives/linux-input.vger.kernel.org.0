Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBEA62C5D98
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 22:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390838AbgKZVmm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 16:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390601AbgKZVml (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 16:42:41 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFF6C0613D4
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 13:42:41 -0800 (PST)
Received: from [IPv6:2001:8a0:f26a:7e00:d2bc:b624:5e5d:f425] (unknown [IPv6:2001:8a0:f26a:7e00:d2bc:b624:5e5d:f425])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id B43312637C3;
        Thu, 26 Nov 2020 21:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1606426959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pabVM2RFKyHtHyI9MG00Gown5Dh74dT4wAYqENkNwmw=;
        b=OMw7Aw/dlPkReY7VSGrbJiXiVkKXgCaoijYShXyQslg6gEZ3BcOhhw793+lZ2cvvrVI+P9
        69YNgDXYm1TRKMbcykX2XelVmTlpGLrv5U5YGCEYobDJG+jnmvL6R5480G3hBXq3qoAIgR
        Rqr1puIE7BvXFW7aVO35rDuY6CTKsnmhbTtuPzdKZnan1Aq5cp0JKXc+a5cyg4n4GcGjJ7
        K6ZT6mQkXwL6RorSDsmIdrJ6s+ZEBE2QNMt5DcNBSIRqmSLGAFIBXAwBGvOl7zLC1sWBkR
        eg8crvWhX84JKs/ZrvovM9dIc8gUFFooFwqibZ216Ut6WDy+P4LjnwOjF1UV36T2VsZ+QK
        0xtZZaNjZQdEaMjdyrTpr5as7TNB0B8vpxXdnej3HRInZiU0o6fy9U43QwTlp7kM9VUmlB
        +n3vKI6YqSyUN25N4BL3/QHWcJnsHCFCH6y+TItGNhwsfW7R+jCIuI+8Tv7nF44OR1tWze
        zLf5P/8iyIJYuGE15dYX17iDnhZZxOGmnZR/3wR0rjGOE4vQRBfCJkLcWQanFXKzfBIBzI
        ABv/2e3ncYJytHC1+P6UUeOOHwVgg/eIE4CxeGZ21kU76jKYXVmksszPcTcQQ4+eznw31m
        Kv5QHISsV/AxyNEH4c/UaOX0eK5pTyshoIz3KxPeyCduRvCcevT3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1606426959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pabVM2RFKyHtHyI9MG00Gown5Dh74dT4wAYqENkNwmw=;
        b=YHgLirqIW14TD35Pa9+bw7vbHUNBBrvNX065YnLBACvOsTjo+qRVSLuXvSMFVy/0hgr8au
        z3QpfZNJB3qzyCAg==
Message-ID: <c8d4d17798e2c9fca417223d4edf5f4b1aebf75d.camel@archlinux.org>
Subject: Re: [V3, PATCH] Add additional hidraw input/output report ioctls.
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Dean Camera <dean@fourwalledcubicle.com>,
        linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
In-Reply-To: <2c2bfd55-3a03-9839-22f5-16058ac24e35@fourwalledcubicle.com>
References: <20201125223957.5921-1-dean@fourwalledcubicle.com>
         <2e19588821053914eebe30088b4590af51959409.camel@archlinux.org>
         <2c2bfd55-3a03-9839-22f5-16058ac24e35@fourwalledcubicle.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Jg4ce3Bk9GZHisK5LNyb"
Date:   Thu, 26 Nov 2020 21:42:37 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-Jg4ce3Bk9GZHisK5LNyb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-11-27 at 08:30 +1100, Dean Camera wrote:
> Hi Filipe,
>=20
> Comments inline.
>=20
> - Dean
>=20
> On 27/11/2020 6:05 am, Filipe La=C3=ADns wrote:
> > Hi,
> >=20
> > What is the difference between V1, V2 and V3? I think generally you wou=
ld
> > add a
> > small summary.
> >=20
>=20
> Sorry, that's my fault -- the contents are identical. I am more used to=
=20
> modern tooling with code review platforms, pull-requests or even emailed=
=20
> attached patches, so the old tooling took me a few goes to get right.
>=20
> V1 was mangled by Thunderbird, while V2 was missing the cover letter=20
> when I submitted it via git send-email from my test machine. V3 is where=
=20
> I (think) I beat the tooling into submission.

No worries, I was just wondering what the differences were, given that the
patches were identical.

*snip*

> > I am not sure using the same approach as HIDIOCGFEATURE is a good desig=
n
> > choice.
> > The first byte of the supplied buffer is the report ID, but you can set=
 is
> > to 0
> > if you don't want to use numbered reports. From my understanding, this =
makes
> > it
> > impossible to use the ioctl with report ID 0, which valid per the HID s=
pec.
> >=20
>=20
> Report ID 0 is reserved by the HID specification and may not be used in=
=20
> a device with multiple reports (see "Device Class Definition for HID=20
> 1.11", section "6.2.2.7 Global Items" where it states "Report ID zero is=
=20
> reserved and should not be used.").

Yup, you are right! I missed that.

> I think the designers of HID forsaw a sane future where in userspace=20
> everyone just assumed the report ID was present at all times, and the=20
> HID driver would just omit it on the wire if it was zero. Unfortunatly=
=20
> every platform seems to handle that differently now, with some always=20
> requring it, and others selectively omitting it in their APIs.

Yes, it's unfortunate. Perhaps if the HID designers made the spec easier to=
 read
we wouldn't have this issue.

> > My suggestion would be to automatically use numbered reports or not
> > depending if
> > the device uses them. A HID endpoint either uses numbered reports or no=
t, it
> > doesn't make much sense to me to let users try to use numbered reports =
on
> > devices that do not use them or the other way round.
> >=20
> > But I guess this is a question for Benjamin.
>=20
> I'm *strongly* in favour of always having them at least in the=20
> `ioctl()`, with a (reserved) zero value indicating it is unused - like=
=20
> it is now. That makes userspace easier to deal with, and covers the=20
> quirk case where a device does not list report IDs in its HID report=20
> descriptor properly, but requires them anyway.
>=20
> It also makes the new requests consistent with the existing request, so=
=20
> there's no extra cognitive load from working with one then switching to=
=20
> the others.

Yeah, it makes sense given that report 0 is reserved :)

> >=20
> > I tried to track down the discussion about the addition of the
> > HIDIOCGFEATURE
> > ioctl but from what I saw there was no mention of this design flaw.
> >=20
> > Am I missing something here?

I was :D

You can have my
Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>

Perhaps just split the hid-example.c change to another patch.

*snip*

Cheers,
Filipe La=C3=ADns

--=-Jg4ce3Bk9GZHisK5LNyb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl/AIUIACgkQ+JPGdIFq
qV2MLg//UaE5o0oBqbScrmGX9Rzr2yrh71TSM4dnT1WpggL23n5HKLknyPuiHoCD
mm3kwhfohelMwfwpJu/lDZ3Qo/IMn4S9rPRZbmYO4x/3rI5BnX4/evszvK+8QkqZ
InQbHYgnhyWo4JSvJQT3r1O1FuaU1HuAcZv97qbICFnO/HTmh86c6QoBPhxsLGap
Y9BfpopLsero7QmsxorUt0rVPr1KBi4p17CulOs8ZuMazhURzmvbXZq4jzWT8try
dkni+Wc7IOcpt++iCcddAfUdRiCmbaeHw4VJKImp9T1nrMDhmfXSb1VKUk2x5LuP
JpDHXx7MEDEzSSOST/tor7HeHLlRIzatH4JNZ5328SQ4P5+QUItn4Wo191+s+j1o
EnNQvRfznCi8YXDpCrIEsqumaW85nT99Jf40HreQgEszani3MXcahLuxJmTy+bB0
vLvZQ5EGOzvmaAobQ0lOh5bwwTPrnYroTGOzqQE7k/4yoAsbjxZ0TGPrCajIPM7y
r+33N4+dmW0NIltCzYT6hg48sR2bZ4tAzEHKCAzXYK+7LA83i503C0j0ixAk20LQ
YSKnOP5bObwgAC5aBi4JLyLdxDHlVvZXzCijQ5vv8RYsrHXFNpaKca3Xc4bT1X/8
j0iL0oQ7DY/YAOgRfSqfOfR0dOWHz7VR6D8eOeKGKQb2RTLr1NY=
=tOut
-----END PGP SIGNATURE-----

--=-Jg4ce3Bk9GZHisK5LNyb--

