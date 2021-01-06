Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0152EC378
	for <lists+linux-input@lfdr.de>; Wed,  6 Jan 2021 19:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbhAFSss (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 13:48:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbhAFSss (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jan 2021 13:48:48 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2653AC06134D;
        Wed,  6 Jan 2021 10:48:33 -0800 (PST)
Received: from [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c] (unknown [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 811A5353042;
        Wed,  6 Jan 2021 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1609958910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pk0LtTVaQ2OLuJ7XZpRtjBMdZTB4ZKQtTIg5iXGU4Mk=;
        b=HZ6/hWPVZ4OoruqVE/SP0bf8zniFia856d1hUVBNSq7azQk7sMOGa1r1gpfjNpeexCXZHT
        /J2P0I5H4/OcQCSEVGrOtlNI/7et5+dnv92HxuTd67N52GxEFw8ocv6FGBBsi7wqs2huC5
        HArythYURiwUS5WzopL8OqOIll9kwTR9PqDpr84FNUrVo9Ap2RjbStCnWOoetJgxXe+HQv
        UuDwuLAbWm7r3FAlQIbAKkxthoeK80BLUfvVqhrsOU4hykwglsANN7vn9MNT3dSZlvdSbq
        A8SmCdOckXAGzNswsZYVbawOQvNKp9Em7dEQ6bncphlaS2i0LkTX/9BWqQpAjk6CEzTBGR
        c/YxbjFrpJ2mJykVZd5lhCpY72mrF2LTUbt9NpEoY/mbNE7AfCldAHXY5AYrYlMQlcbEX4
        nOd6MM9bk7S5Us61JvG5F38fNoHxQu+a5vBbWHrvramy54n2wd8dC7O6VskqUwQ9bIBqrq
        xgFKQohuRjvf8ssFexKtj12jqtrzur4zbR6uGzgohtTD1H98g7fCnWXEN5ODNdqbf29PFg
        YuoBLW1zyk1MBSTGUVC86q6XnSqXEtL4s9Wo39ytZJC3oGIVV5HqxAQ3zzCgpJKaQ/62mQ
        Xqpk9PXY68ghBelhsnVz1hhVrSgJXOlk5IWZlAKFx7QgNEvReduVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1609958910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pk0LtTVaQ2OLuJ7XZpRtjBMdZTB4ZKQtTIg5iXGU4Mk=;
        b=7CtTNR3DZkLOiLCI1dS9UAisjl17S3dNB/7xm8URTTPoyKtk1O9dkMXKz3yaVQRddBUfIZ
        aEpUmsvOL1ZqRwCg==
Message-ID: <bc65667903652a67f17b6b51a37a03f73309fe39.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for Unified Battery
 (1004) feature
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <0de99cc89a3cc0cc5b3818e10aefdd2eaddd8032.camel@hadess.net>
References: <20210104182937.1472673-1-lains@archlinux.org>
         <0de99cc89a3cc0cc5b3818e10aefdd2eaddd8032.camel@hadess.net>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-yLAb8pRaIDV8Q/6yXyus"
Date:   Wed, 06 Jan 2021 18:48:27 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-yLAb8pRaIDV8Q/6yXyus
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-06 at 10:34 +0100, Bastien Nocera wrote:
> On Mon, 2021-01-04 at 18:29 +0000, lains@archlinux.org=C2=A0wrote:
> > From: Filipe La=C3=ADns <lains@archlinux.org>
> >=20
> > This new feature present in new devices replaces the old Battery
> > Level
> > Status (0x1000) feature. It keeps essentially the same information
> > for
> > levels (reporting critical, low, good and full) but makes these
> > levels
> > optional, the device exports a capability setting which describes
> > which
> > levels it supports. In addition to this, there is an optional
> > state_of_charge paramenter that exports the battery percentage.
> >=20
> > This patch adds support for this new feature. There were some
> > implementation choices, as described below and in the code.
> >=20
> > If the device supports the state_of_charge parameter, we will just
> > export the battery percentage and not the levels, which the device
> > might
> > still support.
>=20
> I'm guessing that means no changes needed on the upower side?
>=20
> Cheers
>=20

Yes :)
I tested upower and all works as expected.

There will still be devices that only support battery voltage, so I might
implement the battery voltage to charge percentage in a future patch.

Cheers,
Filipe La=C3=ADns

--=-yLAb8pRaIDV8Q/6yXyus
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl/2BfQACgkQ+JPGdIFq
qV0T2Q//aB2LBSk1ESOi7PCTzNvICgrH1kqbrYR3nIYz8hL69x8ac4qlO/Spva8Z
jDgmGI46i24Ll9YZkzovbTy/7pjTL1eSWfJnNnaGERfKEZyxU/tUO4QPPqt4/Lco
aCRgtnNYGyQyo0/TwKZqu9bLdyMBppTh8QHjnx4sGMZdqiShBuDvexHuyF7Txqee
jMpx8ZOOvhxFL6lOSd5/Dumq2W0N8tmOHd6aZEQFRF+cloJsMh6kFHRCj0wm+RGQ
w4RlogqzN1UdxUXZMGz9CSaFthHLT5W7HOcmco1artgSvOxvJdTyKIQVpfS+k0Hg
InOlNFOn0ImQ2eGQXaGyVdkOoBEsUTK4swyQSpNTTbv5unzpp3EFilE4LYqyRMWB
D3Rm7tHm86d0fPYGMtLts8rx6HzujDDKzYeqgEfP4LvjN68BUcq9oOvX7v0L7C15
r1yPoE0NGjZPu1aJX+NnDfYIOYYCf5/559usYTXQDbKjFsmptusEFpln/TRk83we
ssxEGYrImz3Y+0qvTvFyYSLctNe8kkI3StzuiRAj0VRuCa86fAWy+qL31ArOs+Qb
Wmz4KM06uGhgi+p+mCW5TGgK4osLgtUKG4LXt48wi4lwOeszypU6attIJzG5xJhO
lzywMpKmJ6Cl7X80pR2q1JrCSQNLFrsF4AqFEwFhrAiLdoycf80=
=Ccag
-----END PGP SIGNATURE-----

--=-yLAb8pRaIDV8Q/6yXyus--

