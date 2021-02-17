Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5ECC31DD81
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 17:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbhBQQmx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 11:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbhBQQmw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 11:42:52 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009AEC061574
        for <linux-input@vger.kernel.org>; Wed, 17 Feb 2021 08:42:10 -0800 (PST)
Received: from [IPv6:2001:8a0:f24a:dd00:c4d2:6bfc:479a:3ba9] (unknown [IPv6:2001:8a0:f24a:dd00:c4d2:6bfc:479a:3ba9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id A9CCA40082F;
        Wed, 17 Feb 2021 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1613580128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pm9rcs2FFE7aaDQ/CZILv137Z41yCdrQlltnGhPYPHM=;
        b=ZOSxjDnkb2HVqteJt72MTn+FhB9uFks9FhUIzRQtyKnDGNiHjmBo79HY5sVDjJnOWmv3nI
        RCNaCRDxpbqF2nmDWxJWUvUJLOSodJl5U2i6v87nDv87G+j+yxZaByiGbY5qz4nLna8xXA
        MuzLOyCThT+j+WCTKvlVzVRE11rxoLEikWJSCQUyy4K6J0/zBjNM0rgeny24jxydlunnbf
        zspL/d2h1EXeyGA+kLt09DOXC1SmhDXSRTREmWpCyopAMeobaJBHCPui0blnZntEUaIBno
        07SRcEbYpLmhb6Lt2sC0dEVbD1xxIWk6PlG2qQGP4C7go2dH6tN/GScWJCFiQimkoMKmJG
        wGrUmaiRd14SFC6s6tjmleLg9KEhYH1GQCJEDT2vtw8wF5vS00lA3KpFQsZ/bQBeZBsym6
        ujYEKOB1TbKncKBW92yqLP+gZBZrmBerEzx11CveiG0aUYtpdjQBgJRdXexeI0W1xjxFWz
        nFCpFQrHgtouJTC+P9H8qwTmNFBwTE419wfmuiH9BxbqcW+JMqdAwtoei6+3tVx9Bb2hXT
        Tj/ZIe1GJA4BeEl5zvVhb+0wI8J1DNm1fE6ZPYKMxnOWsdHXe5ic9uFk5D46x1ptgqDeoJ
        vG9SBVDxgD3e2nZiFI5/sR+X5lOszMvHDMxR4rPzDr3JKy7BPFnfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1613580128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pm9rcs2FFE7aaDQ/CZILv137Z41yCdrQlltnGhPYPHM=;
        b=P8bClqQynvk/G/ky+MnHYpJQPhrjoGWZKaNHZMhQJK77At53mwlfCePhEQ3oVBISfRljfY
        aPcCCM9aA7PIeFAA==
Message-ID: <4ed664ce163ec2248244d0fbb15f2b81c3098225.camel@archlinux.org>
Subject: Re: PROBLEM: Error logged when pressing mouse button
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Koopa Koopa <codingkoopa@gmail.com>, linux-input@vger.kernel.org
In-Reply-To: <CAM1wO0=2zM=WNmGyDJETLa4wsECE_Nxvq-gAa6_Wb_cMH43K9w@mail.gmail.com>
References: <CAM1wO0=2zM=WNmGyDJETLa4wsECE_Nxvq-gAa6_Wb_cMH43K9w@mail.gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-v0yOpu+CF422v91VohLu"
Date:   Wed, 17 Feb 2021 16:42:06 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.4 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-v0yOpu+CF422v91VohLu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-02-16 at 21:51 -0500, Koopa Koopa wrote:
> Every time I press a button on my mouse, an error is logged in my
> system journal.
>=20
> Starting recently, every time I press any button on my Logitech G602
> mouse, the following is logged to my journal:
>=20
> =C2=A0=C2=A0=C2=A0 kernel: logitech-djreceiver 0003:046D:C537.0005: Unexp=
ected input
> report number 128
>=20
> This includes both primary mouse buttons, the middle mouse buttons,
> the buttons on the side, and the buttons on the top controlling the
> DPI. It seems that, with commit
> e400071a805d6229223a98899e9da8c6233704a1
> (https://github.com/torvalds/linux/commit/e400071a805d6229223a98899e9da8c=
6233704a1
> ),
> this driver was enabled for my mouse.
>=20
> My /proc/version:
>=20
> =C2=A0=C2=A0=C2=A0 Linux version 5.10.16-arch1-1 (linux@archlinux) (gcc (=
GCC) 10.2.0,
> GNU ld (GNU Binutils) 2.36) #1 SMP PREEMPT Sat, 13 Feb 2021 20:50:18
> +0000
>=20
> My kernel .config file: See here
> (https://github.com/archlinux/svntogit-packages/blob/packages/linux/trunk=
/config
> ).
>=20
> Thanks!

Hi Koopa,

This was fixed in [1], which is in the for-5.11/upstream-fixes branch, so t=
his
should be released soon-ish, I think.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=
=3Dfor-5.11/upstream-fixes&id=3Def07c116d98772952807492bd32a61f5af172a94

Cheers,
Filipe La=C3=ADns

--=-v0yOpu+CF422v91VohLu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmAtR1kACgkQ+JPGdIFq
qV0wgA/+IhhmyUkbQN+1qLNeu2yas/I8qQ4mqLYazygAsMV2jmiT5t28EP8C/Exq
1Whj2kHFbi2UXkfuCwKNJJ4RqI8dnmglGDm9CgfJTjOLOsxYdqP2+WO/kLWGw3Xq
0KmpZsfszIkuDf1C6+66Olf41nWjdg+ATYPm1qUoQ2nVS7AGhBITWeOKf3hTYGoc
o0DTmFqmHtWz/g3B+8egTghPg42vVHlA65w4ChbN37KZ2uwNN3s3UiPJuB0S4J5g
98j77j60QxO6UF2WUpeHxKZuiPYij8VwUg9zUIlXc3lkc+n/B9mMvtODvRXNZdgx
bvreFGeNgp8aAYrii/GAYLt5r/0+hnnZothKRkDMjPEGs2pWu1a09sCqOsDFT60R
L1RNi4wtAOIgozSTdSM1YjkRXkChxJK+IxrTF/0fI6QuSaJQO1GbdJiRCHclbJ74
CgkxsvGAc2YxAtQnmY/YWDnGDoMoIKUoxCxcETDT4S23Fzh6lDe0hxNoPh+c1HVV
3oH9c41kKNPALTvqOwQCyZTsYFxK45Xi1BVTEKiy+yGPlsZgXLVVJVokb2Pbgz4l
7vp8n5hgfbfmZ+1tuu1yIqeWihWqilTwK4R3EAh4yZG/aN+Zjh1bpxJS/H7oJjHk
gC63fMTUsHA33+i6wHxhjSXdtvrp42T4JKvtdVAyjXQSwT887vw=
=NkxU
-----END PGP SIGNATURE-----

--=-v0yOpu+CF422v91VohLu--

