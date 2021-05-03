Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A05AA3715AE
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 15:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbhECNHP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 May 2021 09:07:15 -0400
Received: from 139-28-40-42.artus.net.pl ([139.28.40.42]:57122 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-OK-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S234105AbhECNHO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 May 2021 09:07:14 -0400
X-Greylist: delayed 360 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 May 2021 09:07:13 EDT
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 595C43601DB;
        Mon,  3 May 2021 15:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1620046816;
        bh=yfHnkBAT5kvVEmtv+/ipG8gTlyOXUXK7vf9ndpqYYYE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QU197d6Y/AV/u+EeffpYvX9dcCXp84MB8dtFjXFDa08LuVYGVkOmf3ANUz6K9LSbY
         zmCdpvvELw0SamFSjGPC+5hjfyKFzakCJoYJZYhjv2spd3vx6YRO4/nU6czDDB21Sb
         nl6SKmKg3aAZETeWT6QfXxeNFQUQJQCGx7CF8+TK+ku3d55SoMv+VIE3mk0JljfJD3
         QMzsqtuxgQ+bxlXC4D+K2hGfdj9UCQUzQ9sbua6s3fJtoAR411fMFLxTwu8QMFEoj8
         sZNRl5w4o1CnqufjuWjYaOigHoQakYL6ugRYYq3Hynkqvk667eEswswvtS2auIotVT
         eMCPka8f8Nzyg==
Date:   Mon, 3 May 2021 15:00:15 +0200
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] Stylus-on-touchscreen device support
Message-ID: <20210503130015.d2qnahrrfyv3odqj@tarta.nabijaczleweli.xyz>
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
 <20210420131741.kdgxquhwqureih7c@tarta.nabijaczleweli.xyz>
 <nycvar.YFH.7.76.2105031110480.28378@cbobk.fhfr.pm>
 <CAO-hwJ+HhKU7EzPZGOtPePT_h7OUaJ=QfWi7eAcxsfRaDtQuvg@mail.gmail.com>
 <CAO-hwJKLYTqQ9qZ8LZGabze_NjNfwAq2_V-28LFewjOC=EK8rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4vmzebdqbdf53gga"
Content-Disposition: inline
In-Reply-To: <CAO-hwJKLYTqQ9qZ8LZGabze_NjNfwAq2_V-28LFewjOC=EK8rw@mail.gmail.com>
User-Agent: NeoMutt/20210205
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--4vmzebdqbdf53gga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 11:52:43AM +0200, Benjamin Tissoires wrote:
> On Mon, May 3, 2021 at 11:39 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Mon, May 3, 2021 at 11:11 AM Jiri Kosina <jikos@kernel.org> wrote:
> > >
> > > On Tue, 20 Apr 2021, =D0=BD=D0=B0=D0=B1 wrote:
> > >
> > > > > This patchset adds support for stylus-on-touchscreen devices as f=
ound on
> > > > > the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among o=
thers;
> > > > > with it, they properly behave like a drawing tablet.
> > > > >
> > > > > Patches 2 and 4 funxionally depend on patch 1.
> > > > > Patch 4 needs patch 3 to apply.
> > > > >
> > > > > The output of this patchset and the need for a kernel, rather than
> > > > > userspace, patch was previously discussed here:
> > > > >   https://gitlab.freedesktop.org/libinput/libinput/-/merge_reques=
ts/558#note_792834
> > > > >
> > > > > Changes in v2:
> > > > > Patch 4 now ANDs the secondary button with the tip switch,
> > > > > since it's otherwise borderline useless to the user.
> > > > >
> > > > > Ahelenia Ziemia=C5=84ska (4):
> > > > >   HID: multitouch: require Finger field to mark Win8 reports as MT
> > > > >   HID: multitouch: set Stylus suffix for Stylus-application devic=
es, too
> > > > >   HID: input: replace outdated HID numbers+comments with macros
> > > > >   HID: input: work around Win8 stylus-on-touchscreen reporting
> > > > >
> > > > >  drivers/hid/hid-input.c      | 54 ++++++++++++++++++++++++++++++=
++++--
> > > > >  drivers/hid/hid-multitouch.c | 18 +++++++-----
> > > > >  2 files changed, 62 insertions(+), 10 deletions(-)
> > > > >
> > > > > --
> > > > > 2.20.1
> > > >
> > > > Bumping this after a monthish =E2=80=92 is it missing something? Am=
 I?
> > >
> > > Benjamin had concerns about regressions and wanted to run a full batt=
ery
> > > of testing on it.
> > >
> > > Benjamin, is there any outcome of that, please?
> > >
> >
> > Sorry, no real outcome here.
> >
> > I ran the test suite, and there were no errors, until I realized that
> > there are no tests regarding tablets, so it can't detect any
> > regressions here.
> > And then, the usual happens, no time to actually work on the test suite=
=2E.. :(
> >
> > I'll do a "normal" review soon (i.e. today)
> >
>=20
> So I did a quick pass at the patches:
> - 1/4 -> I think this one is safe and could go as it is, maybe with
> CC: stable on it. Any regressions should have been caught by the
> testsuite, so that's a good one.
> - 2/4 and 3/4 -> Ack on those 2 too, note stable material, but not
> necessary v5.13 material
> - 4/4 -> I honestly have no idea if the patch is correct or not. I
> would hold on this one until we have proper tests for those.
>=20
> Jiri, would you be ok to split the series as this?

Splitting 2/4 away from 1/4 presents a minor cosmetic problem:
since 1/4 no longer tags the stylus-on-touchscreen device as MT,
the device name turns from "GXTP7386:00 27C6:0113 Stylus"
to "GXTP7386:00 27C6:0113", so the user is left with
two identically-named devices, the first of which corresponds
to the touchscreen, and the second to the stylus.

Granted, it might also append "Stylus" to names that could contain it,
but I haven't managed to trace where hdev->name is born to determine if
that's a concern.

> =D0=BD=D0=B0=D0=B1, would you be OK to work on the test suite at
> https://gitlab.freedesktop.org/libevdev/hid-tools so we can move
> forward for your last patch?
>
> The problem I see on the last patch is that it is touching a generic
> path and is not trivial. So adding tests would have 3 benefits:
> - we ensure we are doing the correct thing
> - we ensure we are not breaking existing devices (to some extent,
> given that the tests are non written for the tablets)
> - we ensure we are not breaking that in the future.

I'd be more than happy to add tests of some sort, but reading the
repository and tests/ under it has me positively stumped,
not a clue where an entry-point would be, or how I'd instrument a
reasonable test around my rdesc, so some sort of vague guidance
to that end would be greatly appreciated.

Best,
=D0=BD=D0=B0=D0=B1

--4vmzebdqbdf53gga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmCP89wACgkQvP0LAY0m
WPErFxAAkZnn0lFmM1NslU8/pjnkXwnNh5ShZUOiFpzU4TRPgid+1Uew7gLmGSgP
lpWeviEkSOUlyaE7zmksorCZTI/+mnzCSRuTruh8ArskVt/nDTlxwMKhQNV6IX2n
ZpHFc1k3huquOKcLrmjuvhc0xPPNumeluoDMHvizCYvb8MPLeW7Dgva3amWdhOK0
WOHeEgEWGZ19ryDks25HLTWs4OV+T0gG7C0fIKjFxEeaBF+cQfyfU7+nrEruRCOn
JcXbZ9SqNnMxIYt/kDLod+3i6n4qX74OJdjZiedQUL/1h7KkcMCewVJn5O8JQER6
O4BgzKNtPjc3PC2O9+zPcYUnuVXouxzyR2Y/FJO9FggsZCkEwiBVhd5KAaE2aJqv
tyCUQ4BbUahVIkexo7upe273Tb1MYbNQD3L5NXKkmCs5nh5x2/rhXoh4fgGiTdmq
xmPVGtMhPrNBBucK8rscY+EL7OFbiNWewUUxOfMkC0QxtyL2hzFGCQbfSTv8gbt9
f0s+gsXDw9MB1Lov+9SVXdNlXdlTsD2sitDQ946kZ4yJOchikkuoa8U6S4QNn1Yc
ef/7S1CRI+499ftPL8jDPAjA+9tfqrrTu9fgDN5xksrEbxTatpmeMgzJPoKbuq+9
kKMEPWixaP4EqHvrPFWQQuIW+YnlKBlMYOisASvkHPdH/AAYmcc=
=LazE
-----END PGP SIGNATURE-----

--4vmzebdqbdf53gga--
