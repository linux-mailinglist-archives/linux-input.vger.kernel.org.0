Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAF72C5C78
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 20:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgKZTKg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 14:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728161AbgKZTKg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 14:10:36 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E9AC0613D4
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 11:10:36 -0800 (PST)
Received: from [IPv6:2001:8a0:f26a:7e00:d2bc:b624:5e5d:f425] (unknown [IPv6:2001:8a0:f26a:7e00:d2bc:b624:5e5d:f425])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 9AF3C262E8E;
        Thu, 26 Nov 2020 19:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1606417834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5Gg0ytXiyjJnpUjGk0WgN2sSbIH9df8tOKPceW0rwds=;
        b=iBElDT7PL4Y+X46t5DcvP3hkZlpMST7VfZhyllFXPR71ivDPiUQn7YJjBB870jaxlxzLgi
        EZc602GbhsN5ion+3X4/D/xYaGHuOdeJg6voIWqVqjutWWucKc0J0V9T/wh82v2O5EGWyS
        Uj6OR0nIV9NPw1JHYQIcdzREcBkN42Yf8GgMM3RaZf3MuKFm7MBezrJUTjagyrXoCiXWrJ
        FL4thB1NohjbSXnGD2lxF2RI++RWRU9WPo+X94IgEtfbnRTBewP2Kz6Aj8G7yNMeyqnNJO
        jp1838x3xW+HrQ6pLrlJY+Dqs158pSF63ezHP9WVqslC2XfqpUi/z1RGBOrtZVk5PE4vSH
        Guo1aSL1neTfS7/46jF8DevD/wsM5i7i9zMxZ2nUJxewF1T13oSdW6QGQ08FOAKZeMiGlN
        1XB00vYUl+5RUd7TWWLY1DDEqcLC08VoopA6foZ4hLbxlvrjGmPY1y5aklUy3v9ECVz3g0
        yd8EQVf6VcVodsptAaDouALR0DGx9BGHZUyV/Sli9mrpzLo8jOTBSxG68UV8IVJNlQIvDj
        WCGZa2evgwPNa3NUcww7UMt3wUMe8kIk8J4CmxTrEQS2A3QU/7u74S4kHNbq7/yAoULj6p
        mUvTES7culsMrqyIT7LXCjq6cEJzsWx3hmhWVUNS6oM83o9nsbh4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1606417834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5Gg0ytXiyjJnpUjGk0WgN2sSbIH9df8tOKPceW0rwds=;
        b=AtyOpPR/uCqAKTmv+g319cnyFgovCYfxCacz0u3HyPlitY6M4Ng0vvNAskhOoz/e6cijPt
        xA00hkaVI+cbZTDQ==
Message-ID: <c80acf5d8bfea8eef32be6b31d444787ed8182de.camel@archlinux.org>
Subject: Re: Support for Logitech g703 mouse battery levels
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Bastien Nocera <hadess@hadess.net>, Max Illis <max@illis.uk>,
        linux-input@vger.kernel.org
In-Reply-To: <992fe59c8da939e1adae51c8e6a52812da05e700.camel@hadess.net>
References: <CAA5fPw=5SJvsYjoZDECAhHDe5XeLt-HmEvMrmgaeJ7hQMwHnRg@mail.gmail.com>
         <f0a3e23f8e650b679fde299702685588b6cf54a3.camel@hadess.net>
         <ef254031acfe25c2fccb1fb724fc7889117e451e.camel@archlinux.org>
         <992fe59c8da939e1adae51c8e6a52812da05e700.camel@hadess.net>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-s95ApSIm40bIcL9Fo6Ba"
Date:   Thu, 26 Nov 2020 19:10:32 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-s95ApSIm40bIcL9Fo6Ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-11-26 at 19:46 +0100, Bastien Nocera wrote:
> On Thu, 2020-11-26 at 18:40 +0000, Filipe La=C3=ADns wrote:
> > On Thu, 2020-11-26 at 17:43 +0100, Bastien Nocera wrote:
> > > On Thu, 2020-11-26 at 15:57 +0000, Max Illis wrote:
> > > > I raised a ticket on upower, but have been pointed here
> > > > (https://gitlab.freedesktop.org/upower/upower/-/issues/125)
> > > >=20
> > > > _Some_ info is reported:
> > > >=20
> > > > ```
> > > > /sys/class/power_supply/hidpp_battery_1$ ls
> > > > device=C2=A0 manufacturer=C2=A0 online=C2=A0 powers=C2=A0 serial_nu=
mber=C2=A0 subsystem=C2=A0
> > > > uevent
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wakeup27
> > > > hwmon3=C2=A0 model_name=C2=A0=C2=A0=C2=A0 power=C2=A0=C2=A0 scope=
=C2=A0=C2=A0 status=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > voltage_now
> > > > ```
> > > > But nothing is reported by upower apparently due to `capacity` or
> > > > `capacity_level` missing
> > >=20
> > >=20
> > > The voltage is output, but it's not interpreted, so it's impossible
> > > to
> > > know what XX volts corresponds to as a battery level.
> > >=20
> > > Hans, Benjamin, any ideas how this could be better handled? Are we
> > > going to need voltage <-> capacity mapping?
> > >=20
> > > Cheers
> > >=20
> > > >=20
> > > > I'm running Ubuntu 20.10 Linux 5.8.0-29-generic
> > > >=20
> > > > LMK if more info is needed
> > > > Max
> > > >=20
> > > > max@illis.uk
> > > > 07803 009 004
> > > >=20
> > > > max@illis.uk
> > > > 07803 009 004
> > >=20
> > >=20
> >=20
> > Relevant UPower issue:=20
> > https://gitlab.freedesktop.org/upower/upower/-/issues/110
> >=20
> > Logitech gave us permission to use the battery curve in OSS software,
> > I can get
> > it from them.
>=20
> But where's that "battery curve"? If we need to put it somewhere, it
> would be incredibly useful to actually know what it looks like.
>=20
> (And it looks like it's what I asked 9 months ago as well :/
> https://gitlab.freedesktop.org/upower/upower/-/issues/110#note_411028
> )
>=20

I did not have it at the time, Logitech has since made it public.

I went looking for the link :)
https://drive.google.com/file/d/1F_fuqL0-TbZ77u0suXRcj3YcDidCcN1M/view?usp=
=3Dsharing

Cheers,
Filipe La=C3=ADns

--=-s95ApSIm40bIcL9Fo6Ba
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl+//agACgkQ+JPGdIFq
qV2hRQ//djuRSEOEwgpQD/sUwmKcL+T3xzSNg/fWUE+TGj6cuO29rqAHInqJP01p
WMogzS8BZSh13ehQ/8OSOJz9bpv0fp/ISESF8Yq+3etP5pczb4Wnm1jXxenk5F2b
PvxSJIWj5Pl/F057085hw1i7pd72eiYTHg4ANDIKXr6q8EYqBXXD6qSPBxG+YUch
r/iG/vVe3iPWvfck+RYau4CzCIuRzKvMxlSwpA45W9FD9twfJPSswZOXv/4NoEyE
xM6KYbekfun4EILzS5B0gybtVsUnefR5PWxy7EAU8AxTv3aMRr0YjMwzFVCq9GHQ
v3f3LldHMd8uSItbrwTPXHDKkJPcjEVmOiR1V2OzKQx5QX5/njMi5hnZdfGyNtiM
D7o7LSdB5GliVKHlGggwtl9MA4nKirTpvWMKL6xJX5iI5scXWwPZJa4G96P4BoEQ
PyYvDt+jBHVs2jmQYqz3YhSFnK1s1xNmigcyGV3Ij3Vt7jByZ2xFXeQwUvENKO11
0F8HJO4auMpFKKf2C530db/AIhyGUF92zDBgyND+igpj6SETc8sMGVreqhp4aJIm
Q++aIWeecKShX40Ry5fLrpkIzaJkyCgwC0+6gRoFBx0zpRNSq0JwKqdj1A8JFYLj
LOOqeyHxNq8tY9XjUMUyXFQLpixLC1NV1bNIolxG6sp3dGNG19E=
=ZOjT
-----END PGP SIGNATURE-----

--=-s95ApSIm40bIcL9Fo6Ba--

