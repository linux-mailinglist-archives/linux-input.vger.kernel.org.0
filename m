Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FB73263CD
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 15:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhBZOJj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 09:09:39 -0500
Received: from mail.archlinux.org ([95.216.189.61]:47328 "EHLO
        mail.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbhBZOJP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 09:09:15 -0500
Received: from [10.161.159.55] (unknown [188.251.63.183])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 1C70E4261E3;
        Fri, 26 Feb 2021 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1614348491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Mc1GZj3ZTdzoNAZUK5R2G3OyogtrhaRelHeC6qJIK3w=;
        b=ssIVFEiX7v0pagy3KFNCr8CJX20yDgrQHk3UJc0cFgRCAczwbqCEVCwXWqhwOohQ/l6oZ8
        cSL05g2MgdEngtbHZbw/ifp9PNStcui3XobEGQDhGBYICfo5oNaEU6rab0A9GnKXvlSUmB
        ukRM2wFSakbVgzf/6gjcZVcr+URVE7k0ahtvZvtfT0irDFne9XFDZhsW+wCW6mZg2PUFZm
        20jOrtobPwuIvcolporBSOEslQz7n50WvaibIdwvQSSNkomDSzP/f/JJgvUyolTATnXp4N
        sigcdBsHy6T4oI6xOPfSXnhkT9rDvuFEOQHV8EFhdV7BlO8T9tfjyEvDpXHzTKf4lFnLng
        ZDf7UX33PP6Pb7qgmw5eJwD+MAk5IvFCfvnsv+ZhHREkHXTO1mdV6CpX8a6eWIfDXNTM5C
        3rUNkj8qi5fFVQ/1lu2+ooXSBV+yqosPo3qzqtX2dXw43xQJS6z6lCfVNKAPicgRMQWwS0
        ZCm7vaZqarnVHZUgiJd790wbJhnQIwxot5JrSwRAKMSSzEf1loscq/jhS7+Lba3uNc/KHQ
        NrLs/p+MSkfiSEaZ4zwRwVLR75IJ24cSLvCRW6/hlx84r6I0rQU8GibotiNx5UCn4hY7bJ
        bI+byo+CDdhzbH6vFg9Uq759vQAEp71tqAh+mWcN48oB0alJTzh9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1614348491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Mc1GZj3ZTdzoNAZUK5R2G3OyogtrhaRelHeC6qJIK3w=;
        b=mpNrJYgSQM44EDwIsrZPGHxjvlbVPlgrZWX9dXRRyn7opiVPN/xW6qjgJTNB3uG848yufl
        hVjAI3nhQzXr3LCQ==
Message-ID: <2cd72b01e143f8a6c07074bb6edf062ae2124b5b.camel@archlinux.org>
Subject: Re: [PATCH 1/2] HID: logitech-dj: add support for the new
 lightspeed receiver iteration
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <nycvar.YFH.7.76.2102051614020.28696@cbobk.fhfr.pm>
References: <20210123180334.3062995-1-lains@archlinux.org>
         <nycvar.YFH.7.76.2102051614020.28696@cbobk.fhfr.pm>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-foESmcxkNMZuUk5FGgbJ"
Date:   Fri, 26 Feb 2021 14:08:06 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.4 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-foESmcxkNMZuUk5FGgbJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-05 at 16:14 +0100, Jiri Kosina wrote:
> On Sat, 23 Jan 2021, Filipe La=C3=ADns wrote:
>=20
> > From: Filipe La=C3=ADns <lains@riseup.net>
> >=20
> > Tested with the G Pro X Superlight. libratbag sees the device, as
> > expected, and input events are passing trough.
> >=20
> > https://github.com/libratbag/libratbag/pull/1122
> >=20
> > The receiver has a quirk where the moused interface doesn't have a
> > report ID, I am not sure why, perhaps they forgot. All other interfaces
> > have report IDs so I am left scratching my head.
> > Since this driver doesn't have a quirk system, I simply implemented it
> > as a different receiver type, which is true, it just wouldn't be the
> > prefered approach :P
>=20
> Benjamin, do you have any other idea how to accomplish this without this=
=20
> kind of spaghetti-style conditions?
> If not, I am tempted to apply the patch as is.
>=20
> Thanks,
>=20

Hi Benjamin, Jiri,

Could we get an update on this?

Cheers,
Filipe La=C3=ADns

--=-foESmcxkNMZuUk5FGgbJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmA5AMAACgkQ+JPGdIFq
qV3BiQ/9E2O3R+V6lbZ5/2WrDhYct1yLpK1ckMRDTQEgZbjr+dVn/HTDK54lbuIn
dGu6SxPeEa4DKCpUCVdPE7GnX1zPx13dvW/A7bsOBUdayy7fjo8/DGTWPGnBf0bV
wvodb2BotSPu9hXVBLU5Ye9sYvzViMiVnbGXL92yGb918pgD0uq00sM7Go7LvRCA
s8aUSS8sZla8d42GU7Sf2YTdbmNSgwHxnni0DxMCH3KFlHeeTLbGA17CpZyg/4iN
rIGyVUzfApdl7USnsbXSgrAoiwdIqMbofxL5RW/pez5K5PeJabLgOa3r13QsCwHN
blpmrAybEkYAfXbpI7/XMFIzNdvNXZmfvTJCLsyXvnFO4ImCzSFmmaImOhz+xtNZ
RX3GN+ZT6ibI1eqwKB2J+H7tH6cNE+tKIZK6Iguc3SGLjkYibBZna3lU82rcWXRP
F5uDruTnz2mbHlTj4UY5/XhZllPR9fk3HM0omsf88++NW1mbg5hRZsMP4/heobxE
HIYSCZbjgq685ryjB8U6qPLHCWD38MaAnLOp6vuRU5WMMc7czQ+gsw4jamXWFDbz
t+7cCOUEZWqAR2I3iPWTQIgR47s8TktmuXoGaCMt5iKThbgxcN+TdmaNgJ1kAFFP
iNBW1BSuQmB06FH4SCiU60zup6a5yeIlQaHRmP7s8Z9vkYNKevs=
=lKBP
-----END PGP SIGNATURE-----

--=-foESmcxkNMZuUk5FGgbJ--

