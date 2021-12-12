Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8ED471E2B
	for <lists+linux-input@lfdr.de>; Sun, 12 Dec 2021 23:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhLLWMl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 17:12:41 -0500
Received: from mail.valdk.tel ([185.177.150.13]:39468 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229584AbhLLWMl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 17:12:41 -0500
X-Greylist: delayed 339 seconds by postgrey-1.27 at vger.kernel.org; Sun, 12 Dec 2021 17:12:40 EST
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3C112BD3BB;
        Mon, 13 Dec 2021 01:06:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1639346813;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:
         in-reply-to:references; bh=OD4Tva//bsIQF0a0cHfbQ8VxoCGH3nnfLlGz+bVKoXs=;
        b=tiAuQNJUhj5lDBrrHcRPjaXWkBX8HIwoB2k+3u+XMJ0vqN1bYAaj6YJdZKD+AGP6qEBQg7
        xdaOXZ3TD/S64vhuoWEAAUFoRORTSTV2UyN+K0TQoYCW8e8oaZPL8qTxDyT8ZuGSxf7L/Y
        3RnJbAkBU5w5bIM7withixcEhgcj/aKXCgRH8bfCVFDvIcn7NNw7INh/3c0MfCRROAz10z
        lSqJiFRW/dDjiukW4FApV2KclE+PhKDJdif3qQQ/vOw8SPN42P9zU1TY2AlzmTx2nCwEOl
        cdodI3hdK/8CK43Ubbc5xutPzxif3o9LEyRPilehIqDQseyjc7GBi0+hFeHrow==
Message-ID: <496f37b7-3fb3-a414-21a9-920f78a031fa@valdikss.org.ru>
Date:   Mon, 13 Dec 2021 01:06:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.5.0) Gecko/20100101,
 Thunderbird/78.5.0
To:     iam@valdikss.org.ru
Cc:     linux-input@vger.kernel.org
References: <20211101221132.1564649-1-iam@valdikss.org.ru>
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Content-Language: en-US
From:   ValdikSS <iam@valdikss.org.ru>
In-Reply-To: <20211101221132.1564649-1-iam@valdikss.org.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jO0cMbeL2zA5Kn7h0xvGCeir"
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jO0cMbeL2zA5Kn7h0xvGCeir
Content-Type: multipart/mixed; boundary="------------VQbHEzodTRpbHgupT9X4JVN5";
 protected-headers="v1"
From: ValdikSS <iam@valdikss.org.ru>
To: iam@valdikss.org.ru
Cc: linux-input@vger.kernel.org
Message-ID: <496f37b7-3fb3-a414-21a9-920f78a031fa@valdikss.org.ru>
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
References: <20211101221132.1564649-1-iam@valdikss.org.ru>
In-Reply-To: <20211101221132.1564649-1-iam@valdikss.org.ru>

--------------VQbHEzodTRpbHgupT9X4JVN5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

S2luZGx5IGFza2luZ8KgIHRvIHJldmlldyB0aGUgcGF0Y2ggYW5kIGdpdmUgdGhlIGZlZWRi
YWNrLiBJJ3ZlIGJlZW4gDQp1c2luZyBrZXlib2FyZCB3aXRoIHRoaXMgZHJpdmVyIGZvciBh
IHdoaWxlIG5vdywgd2l0aG91dCBhbnkgaXNzdWVzLiBJZiANCnRoZSBwYXRjaCBuZWVkcyBy
ZXdvcmssIHBsZWFzZSB0ZWxsIHNvLg0KDQo=

--------------VQbHEzodTRpbHgupT9X4JVN5--

--------------jO0cMbeL2zA5Kn7h0xvGCeir
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEMiogvXcpmS32v71gXNcgLu+I93IFAmG2cnoFAwAAAAAACgkQXNcgLu+I93Kj
Bg//VZhRL3Uh75cDB+oBgS3ZF+i3H9b8PXvhW4hN+wTVbYdyKL6QH9FvdHsXOPxO8hHVaeimk26u
oIWP+ZBaQDPnj0HoORYOewrzOj1cOHm4P9ew0wFnr59IAyyXlbXuze2ysgYBuNi+/zidsjJbhy32
Y8PPWiUVRpLdP3NfOyRzHyCn/zDURCxBUsxdCEESU43UQDbuNwb4eSGpQuQeCYzaC7nnonmrloY9
cDLIiFpRmPdZtJRcLFkc9jDTjv/mbMCPmix1V00MKqcu7MS5vfdJvA/94t2Qn61vGlDegvbXn8Gi
aekwKxTGIqXsYPeXCDjaE+FzVyiYPz871T4JB2VjgpEPPmL7Wuod6Tqs8mR1gHPnw1Nu5xUcB9mR
QzjX1PQlfkt8AsdOJAzFeAcdfd5S0nxpZVqDFYKXOyTHgLAkXtzNIGWW5+PeJ8+zJDYRVXzCdBl/
zUdOVGJPJE6IDdHcwkdubVm6xQM7Mjolr9BH0/CzGA5F2GTz/UkZeR0BSKaCN1pHjwO4346ATdgu
RESYg394VssmXDRSy5JpXynQ3RQEzJHjeHvtTlMgDovMpYZR8lySozjSFJyB6dx0zOXl2HebnTZR
F6FB5XN93x+XVcmLV2ZuwzrilHDHpFqT+bnbnPOEhzXqlgH8Qh+xd65fKscWyOEGWTI34ULEgU0a
z3U=
=CqLd
-----END PGP SIGNATURE-----

--------------jO0cMbeL2zA5Kn7h0xvGCeir--
