Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE21330B6E
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 11:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhCHKkn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 05:40:43 -0500
Received: from [139.28.40.42] ([139.28.40.42]:49824 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230135AbhCHKkd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 05:40:33 -0500
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 9BE3C360002;
        Mon,  8 Mar 2021 11:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1615200029;
        bh=taIOxwAx6M8NKtQdTHVRJSVo9x6617p7Mk8axUF/cg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XVjLPqtUEUAE1aYyQiV+yrSvK688NcR9D4YhP5Ecy10ZjlST8ue+Dx2A6dQCqojca
         4GOJ+5Gz+Zob9NqX0xsHhDVHNO0k/xmTKh4/xI7wrGRLGIWksshFD+LmvKSEyrhrgS
         d7RGP3l+026mMuE+SPmwAtRs/VhXAf+WSb5AVcNf6OJR1Rw+22HGwuNClKV5bEPKCm
         R/ZEU+A5g4/4xOCbBptRheGd8cI8jIORZOfK4QGeHg7klc4rmAKkWkxLEdSSaPzZ2Y
         2ALrCUhmJ25oG/4QW/kOQHQyfLbNGNZc+jtUT4sFm0VCOOYMyUzBGTZmSiS3PbYTpk
         ZQTaLKsXCxi4A==
Date:   Mon, 8 Mar 2021 11:40:28 +0100
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] Stylus-on-touchscreen device support
Message-ID: <20210308104028.tq7r52iekibi4qat@tarta.nabijaczleweli.xyz>
References: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
 <nycvar.YFH.7.76.2103081114580.12405@cbobk.fhfr.pm>
 <CAO-hwJJj0KRCOYPmpNEmU1oVD+SNNYn9+BoGxnPbSthFuCxK9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6ctdsodpewz5r3qh"
Content-Disposition: inline
In-Reply-To: <CAO-hwJJj0KRCOYPmpNEmU1oVD+SNNYn9+BoGxnPbSthFuCxK9w@mail.gmail.com>
User-Agent: NeoMutt/20210205
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--6ctdsodpewz5r3qh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 11:21:56AM +0100, Benjamin Tissoires wrote:
> On Mon, Mar 8, 2021 at 11:15 AM Jiri Kosina <jikos@kernel.org> wrote:
> > On Wed, 17 Feb 2021, =D0=BD=D0=B0=D0=B1 wrote:
> > > This patchset adds support for stylus-on-touchscreen devices as found=
 on
> > > the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among other=
s;
> > > with it, they properly behave like a drawing tablet.
> > >
> > > Patches 2 and 4 funxionally depend on patch 1.
> > > Patch 4 needs patch 3 to apply.
> > >
> > > The output of this patchset and the need for a kernel, rather than
> > > userspace, patch was previously discussed here:
> > >   https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/5=
58#note_792834
> > >
> > > Ahelenia Ziemia=C5=84ska (4):
> > >   HID: multitouch: require Finger field to mark Win8 reports as MT
> > >   HID: multitouch: set Stylus suffix for Stylus-application devices, =
too
> > >   HID: input: replace outdated HID numbers+comments with macros
> > >   HID: input: work around Win8 stylus-on-touchscreen reporting
> > >
> > >  drivers/hid/hid-input.c      | 47 +++++++++++++++++++++++++++++++++-=
--
> > >  drivers/hid/hid-multitouch.c | 18 ++++++++------
> > >  2 files changed, 55 insertions(+), 10 deletions(-)
> >
> > Benjamin, this patchset looks good to me; do you have any objections on
> > queuing it for 5.13?
> >
>=20
> Please hold on this one. I am pretty sure this should break the test
> suite but couldn't have the chance to get to it. Will pop this one up
> in TODO list.

This also has minor behavioural problems regarding BTN_STYLUS reporting
that came out in testing, and I didn't have the time to dig through
and verify the logs from pre-v2 a tester sent back last week.

I hope to send v2 today/tomorrow, energy and time permitting.

Best,
=D0=BD=D0=B0=D0=B1

--6ctdsodpewz5r3qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmBF/xkACgkQvP0LAY0m
WPFRwRAAkDsDjWfdd8HKR7cQcFEybNgEr+VZAwltqAAI2rogu5myQxwNRdVizujn
+V+51jlAlUJKuOXYEkWYIS4NWsO6GQyErF+EJlqJ0T9zWwpoiW0zEP3lenUUMDyQ
9npQslGj5f21khhbEdkStJbI+6p7T4qQGcPgv2FNMCroX6qcVkpie1m5tAx8MK60
6MduGOzv2P3vfLodUESRHQfHRP2wexWymw1Q0ZTF+d+7Ui4fC02FjZ+HCMkrrRdN
w7DzS4CBuDzzSzHh+9sK2Rj8xIiUgXigi1I9GqTL+BFVwKe4FDmfnMldcIPA/lfA
hZlz8dFl0nFQpGEHTa6tmGew0EwxgA4VMr9N2/xvJVom9iQjoDeLOO2fYP3jS1Rb
U5WMOsWpXfZyp3rsK8mJ55QrqY0p+UO8EQ0aecHWTf4A/2zawzZUE+5kBs2YLbeM
g3Df7BAg8tncxPTvbTAplyWJNne61ji7amzeICv6FDA4pHt1fNqovWFehYatiY5Q
quvcX3614RIvbSZ1873aNXEeMHZqNT34upi2LJJ59Dywx2jYguQecDhyZ+k+ejUd
HGNGcrDwARkW7fha2Hiqp5J280VJ5rUCrDb9Zo7FpebXjCxUWbpfnQZ4XO+644hZ
iR8modZwgqlVB2JTH43oxx6Gfie8biAJ2UPDNXaKAVMCAMom4oU=
=I9qN
-----END PGP SIGNATURE-----

--6ctdsodpewz5r3qh--
