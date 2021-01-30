Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF90309806
	for <lists+linux-input@lfdr.de>; Sat, 30 Jan 2021 20:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhA3T0E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Jan 2021 14:26:04 -0500
Received: from mx1.riseup.net ([198.252.153.129]:44508 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhA3T0E (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Jan 2021 14:26:04 -0500
X-Greylist: delayed 586 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Jan 2021 14:26:04 EST
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4DSkRy3KYCzFrZ3;
        Sat, 30 Jan 2021 11:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1612034133; bh=01W027KtHbXm+NEmaYFFR+K9m9ORoqJ9gOoyoxHZn3Y=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
        b=bTRHhPTGQlXGSQtKuLm1/gMRQVWEFkAEjPZ10wgcM2jIcG7j8OYnmVzlnmN9URgna
         7tzRJ95UVgV4dhY6/zBIKmsMxULbMPRoQdcfGP1oYLrLectSZ9S9es+gYiG+SFcadk
         /mx0pXajRpW+0PMJdZhtEWjckAZ5nwNPI9YNFi90=
X-Riseup-User-ID: 2AE6315AD4F3751793A5853E788D9D4ECD8B26915AFBCD6958B3F1CE47694DA6
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4DSkRs1PFvz5wB2;
        Sat, 30 Jan 2021 11:15:03 -0800 (PST)
Message-ID: <265604c19e2e875ca17e4cf713000492b9ffd8d8.camel@riseup.net>
Subject: Re: [PATCH] HID: logitech-dj: add support for keyboard events in
 eQUAD step 4 Gaming
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210130191027.1225465-1-lains@archlinux.org>
References: <20210130191027.1225465-1-lains@archlinux.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-ttFDhVXLX6h3KITV9oN0"
Date:   Sat, 30 Jan 2021 19:14:56 +0000
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-ttFDhVXLX6h3KITV9oN0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hans,

You added support for non unifying receivers in
74808f9115cee2bb53e7161432959f3e87b631e4, could you please test and make su=
re
this cause any breakage with your devices?

AFAIK, they could only break if they have a 0x01 report which is different =
from
kbd_descriptor.

Cheers,
Filipe La=C3=ADns

--=-ttFDhVXLX6h3KITV9oN0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmAVsDAACgkQ+JPGdIFq
qV0O5A/8CSwqFsOoNySySK/ut9TFVugny8nT+0txDw+hH+c8Ilpuy2+g2yuBQ7qy
J5p6JZtjuy55fS+CNLaxOjWU1ClfziezOaNAxO1ypqUiMDRxIn3DzvTI9mKdHzvu
yoK5eFmPFhrkkMU75iFR+ajYPx/baRePZht6dBSq38ApOmk5nABalFoa88YNaXfv
y1DtHiFSEdMfT/Hd55pyvWQO1JI/LDEX+FsgNxFwtB4ClSPLK0Yl7LRG0ssC/sEg
Bx46B4wPV1Pg29hIDbDvQ2v19PAfZWBALohjP4CNw3U6HOnRqYgpKPow+nWTjVg9
gFkG2f1/yUA2oWtQs4TY+EYT2WB/3e0y0J/KWbsqcnpb3GIsZD94SLXF5lU8K0Eo
GswJI0v/1joN2bWrWJVeXHE2AR44shxXjPoVfOoQCt73YvyAV9v7HunDWbM1Z1Se
ZrPxicyMjw2CjcNZ+cj/NF5SP6uzLGy+KX/KtRTEDsOUnzu54q1apv1FhmlvF5pr
6E+4iC5yc0475zSDZDi3ysyjJJET3w6gr3wDZDehKP1G/+indvCnMqw0gFusEHbQ
bhLG7yKTawxJDejCgoRf2zyFYgxFng3SS6Wd+3BZdGY9ITBCyoF1xjFHKprFyBrh
UvBjf0Uf/ULAHEtoVTeBR1NCyJXFUVarq1sOYXeGC+YIYmjcvY8=
=Tzqm
-----END PGP SIGNATURE-----

--=-ttFDhVXLX6h3KITV9oN0--

