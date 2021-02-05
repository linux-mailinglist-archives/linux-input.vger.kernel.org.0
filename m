Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23C3311576
	for <lists+linux-input@lfdr.de>; Fri,  5 Feb 2021 23:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhBEWcf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Feb 2021 17:32:35 -0500
Received: from mail.archlinux.org ([95.216.189.61]:43238 "EHLO
        mail.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbhBEOQ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Feb 2021 09:16:29 -0500
Received: from [IPv6:2001:8a0:f24a:dd00:4cf5:7496:69c2:e329] (unknown [IPv6:2001:8a0:f24a:dd00:4cf5:7496:69c2:e329])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 5474D3C79A4;
        Fri,  5 Feb 2021 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1612535769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BdcXeBS9qmlteXxnHhvqawgjzqYPg8DsWN42PLeY9Uw=;
        b=SKdb0TY3NI1ktIS1bXV/VyeImO251PIuFlomMzudJzF8MDhG9MdrXsppS62EYl6vIueIlD
        lowAbALkjsVNBh3R0hbTQgtrlRGIXDOIzRVzitFzUdR+ZbWlH6zFLuL4q9Yk8godUGN7iY
        qQv1841GvBeVyIXqWLust8zg+A2L/E3O03lVDed/LBY9iixDwdrP9giw/MjfeYcwYWIQF4
        5RhMx5LryNcpkY5gRXAjituzuTdaKe6Z8lu88lyrZpj1i0cEtkt52Z/rNBaFuqiD4Wk4jh
        cHJlx8+yXqTmBNDj4WhDNaZ1J98bC0NlGyvZPqwxI6qii6U4olVT22ljnpGMGDSpY7Bmb7
        2kxlcOvNZmsUxCnfTXcT60bVCOcHl3K2BMnaTKWdHbsu/F1nf1AE/YBx4BoUDEHerAvrXj
        vPDFa04b6oXoa2vKFTNyc9b0+gmsLx05f8g3xUs8Nhu3YpR6oMyyxsTTpPJvWO/wltZTK0
        62I01TekKTq+yj0kSX1wBwO+Wolh0lfhEqAhry1MEGoIIxz27nK9BLtF7on63c1CkV9wM/
        aISUJy/3Qn+Q4o9fazqx52rBi7apO71gPqWmcu0p11FdSwmKi59wyIngsHloxBVgpYCrZt
        6i+jmw3krTPWcmv5DMbwfKK9ccoG5gkzeTn70WqoTxceRNfx/pjh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1612535769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BdcXeBS9qmlteXxnHhvqawgjzqYPg8DsWN42PLeY9Uw=;
        b=ScRsbG7dsJuiG9yEt4pgaqc5RIZVQRXKXsBZKahEHzphpHPG5L+JkImc2rDMSkNrMZCF6U
        Ysl0v6g7G+6AfPAA==
Message-ID: <a80853410f48a7d29541c155bca1341bdd24a671.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-dj: add support for keyboard events in
 eQUAD step 4 Gaming
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <nycvar.YFH.7.76.2102051018370.28696@cbobk.fhfr.pm>
References: <20210130191027.1225465-1-lains@archlinux.org>
         <nycvar.YFH.7.76.2102051018370.28696@cbobk.fhfr.pm>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-k0whzotyicswfAMqfQHg"
Date:   Fri, 05 Feb 2021 14:36:07 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.3 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-k0whzotyicswfAMqfQHg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-05 at 10:18 +0100, Jiri Kosina wrote:
> On Sat, 30 Jan 2021, Filipe La=C3=ADns wrote:
>=20
> > From: Filipe La=C3=ADns <lains@riseup.net>
> >=20
> > In e400071a805d6229223a98899e9da8c6233704a1 I added support for the
> > receiver that comes with the G602 device, but unfortunately I screwed u=
p
> > during testing and it seems the keyboard events were actually not being
> > sent to userspace.
> > This resulted in keyboard events being broken in userspace, please
> > backport the fix.
> >=20
> > The receiver uses the normal 0x01 Logitech keyboard report descriptor,
> > as expected, so it is just a matter of flagging it as supported.
> >=20
> > Reported in
> > https://github.com/libratbag/libratbag/issues/1124
> >=20
> > Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
>=20
> Given this is a regression, could you please add proper Fixes: and Cc:=
=20
> stable tags?
>=20
> Thank you,
>=20

Done :)
Sorry about that, I am not yet familiarized with all steps of the workflow.

Cheers,
Filipe La=C3=ADns

--=-k0whzotyicswfAMqfQHg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmAdV9cACgkQ+JPGdIFq
qV1VBg//STnnbEKSewk1aaAAqd1Z/FWysoLF2bMHMv2Q4AORetDU+oYmE/zNY0fR
+DpspflqBfk9O1T7THJia5bHm0/bWEAu+dXGgRyJuAfof1CFJJxxs0dZn+V3Pkuh
oauYl2+Ee20K4cbahKOnxaYNaAnh3GOa3ssxA8YLCaaYrRgR9Jf5N9jXnCSp8yGo
X828i2u6+joOFhdcWhnzFRDC0lPEyLJoNdD/gcibfDk1b2GjtCfWAHgLO5P8d0xb
VaViRfIhF6r5971Uh8xHCVvCATKJX9qSlAQXEX9oPtfWLUYeAZarQSVJ3yH9Sl05
YNA/sOfnIrCKvx86eBPoFugbuVSzI0d+JzldBqPUnh1oOPOmTw4qm7hjkECl3et8
iK0ZWYdzTd2HNN9RIxtSKT4SDuMi9HKGLwValJf5Z5yOc/nMGpg1NgaVsCBry/+1
3ZPnTVu3gSZp8h+vN4eIRtdHuhCA+QahqCa9D58P8o0LAQy4uUSxyhhlJSa1908a
+0Y7cYdKcOQlgEbj9vubdmvLfhucCSpjTsj4HaWVz+BnlYNy9yOSTpP8ZcbZGf9O
pHoNLwJNZJzrSVxfhSJiM2ZXusW59xjX/s0Ilw/Z9GpPSmcFVCzf7FY07V5crrwO
LA0vBZxxlOAwX2EnUV8FNEV7ITrivGxs429yP+bfimaTilD/Dqg=
=6fgA
-----END PGP SIGNATURE-----

--=-k0whzotyicswfAMqfQHg--

