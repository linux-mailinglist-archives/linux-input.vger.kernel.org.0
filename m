Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F36E495F20
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 13:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245692AbiAUMlV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 07:41:21 -0500
Received: from mail.zeus.flokli.de ([88.198.15.28]:35136 "EHLO zeus.flokli.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1380409AbiAUMlT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 07:41:19 -0500
X-Greylist: delayed 521 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Jan 2022 07:41:19 EST
Received: from localhost (ip-178-200-100-55.hsi07.unitymediagroup.de [178.200.100.55])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: flokli@flokli.de)
        by zeus.flokli.de (Postfix) with ESMTPSA id 852B51276C07;
        Fri, 21 Jan 2022 12:41:17 +0000 (UTC)
Date:   Fri, 21 Jan 2022 13:41:16 +0100
From:   Florian Klink <flokli@flokli.de>
To:     ValdikSS <iam@valdikss.org.ru>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Message-ID: <20220121124116.cj6xtxvzw7rbkcs6@tp>
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <nycvar.YFH.7.76.2201061419420.16505@cbobk.fhfr.pm>
 <e9e1f6ce-f12c-291b-81a8-c76f72ee29f2@valdikss.org.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fld72he74avpyv7j"
Content-Disposition: inline
In-Reply-To: <e9e1f6ce-f12c-291b-81a8-c76f72ee29f2@valdikss.org.ru>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--fld72he74avpyv7j
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22-01-06 18:03:49, ValdikSS wrote:
>On 06.01.2022 16:19, Jiri Kosina wrote:
>>Thanks for the patches. Could you however, please, resubmit with your real
>>name, as outlined in Documentation/process/submitting-patches.rst ?
>>
>
>I prefer to use my internet identity on the internet. If this is a=20
>strict enforcement, I don't mind if you apply the patches from your=20
>name, as a HID input maintainer, if that's possible.

I tested the driver and it's a big improvement. I just sent a v3 with my
name in the Signed-Off-By field.

It seems the "real name" requirement only applies to the Signed-Off-By
(not Author) field, and sending a contribution provided by some other
person is covered by (c) in the DCO 1.1.

--fld72he74avpyv7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEdQpT8aoDC+ls4wqU86BgVS9TAioFAmHqqewACgkQ86BgVS9T
AiqY5wgAl+unKIrUqg4w/R3cNx3NuV/bLELnkECeVyLjJ2VxioOU+88btST4Q6mA
o19ilrbnPrUT0mPOOVnOK4Fx3z5tTrNM0GqzBj3yHKJJMfu/yOiPMBrknKNqDCUt
b9xOfmKW1JTbRZQr32ToypIzpZQY9lyyXBUVY9bVim+VOY8CsyGS91v0ZVJRFtY5
PnvKUhNyBlgZoJjj6hxYCA+ojDlK2GUAu7n3p1heFIFHJG2D3FSOeB4TtHNMC3Jo
fM5JpumVJU9MwFvdcti2S+qlAj2HB8k0X1JDUFtKrSCqA6byrXGDmHwPHPtXa3mi
V0rizQvYBlji9LIguQe88Hrb3sydsQ==
=U0MQ
-----END PGP SIGNATURE-----

--fld72he74avpyv7j--
