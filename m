Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44F9DCDCD9
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 10:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfJGIH5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 04:07:57 -0400
Received: from orion.archlinux.org ([88.198.91.70]:39954 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfJGIH4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 04:07:56 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 4E11B15AD266E7;
        Mon,  7 Oct 2019 08:07:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from saetre (p200300D267088A00E81B87A2F8884333.dip0.t-ipconnect.de [IPv6:2003:d2:6708:8a00:e81b:87a2:f888:4333])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Mon,  7 Oct 2019 08:07:54 +0000 (UTC)
Message-ID: <3a73789b18ce109a2c9c810b638d42001c74df34.camel@archlinux.org>
Subject: Re: [PATCH v3 3/4] HID: logitech: Add feature 0x0001: FeatureSet
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <R1ooPQVKZmsUqlvqixQWt1oSjWQh4x9pfrGMkSKOuBhCPB2QHPSUBQKtdC3E-SVODHPXI9E4a43KCtV_q_EeXDGHMY8vjss9y23_39OfS8E=@protonmail.com>
References: <nZMYgsXB3gdFVoIR3TeMjdbHiP4STlPINtmdH7TkH-nLrHS5APVXn00Z-L89Bjnam4_EBf1GLqI5KAZDZhFnH9hyWGyCOGJQKZzpyN2tqlE=@protonmail.com>
         <e0dc8d111e1615d35da0c87b4b93b55b3bb89f23.camel@archlinux.org>
         <R1ooPQVKZmsUqlvqixQWt1oSjWQh4x9pfrGMkSKOuBhCPB2QHPSUBQKtdC3E-SVODHPXI9E4a43KCtV_q_EeXDGHMY8vjss9y23_39OfS8E=@protonmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-kGv6YloVMQJBMwlPHIMb"
Date:   Mon, 07 Oct 2019 09:07:52 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.34.0 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-kGv6YloVMQJBMwlPHIMb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2019-10-06 at 19:29 +0000, Mazin Rezk wrote:
> > >  /* -----------------------------------------------------------
> > > --------------- */
> > >  /* 0x0005:
> > > GetDeviceNameType                                               =20
> > >   */
> > >  /* -----------------------------------------------------------
> > > --------------- */
> >=20
> > Please use `DeviceNameType` here to keep in sync with the
> > documentation.
>=20
> Since I have not modified GetDeviceNameType in this patch, I will
> keep it
> the way it was for now. This could probably be changed in a different
> and
> unrelated patch.

Ah, sorry. On my quick look it seemed to be included in the patch
:facepalm:.

Thanks,
Filipe La=C3=ADns

--=-kGv6YloVMQJBMwlPHIMb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl2a8lAACgkQ+JPGdIFq
qV2gQhAAqbcpl2tftYpSAs14KZ1Wef/yfREgL6ctnYSKsZncr8iAmPngNQ3Kzyq4
1SBct54cKn+zN5H445nbwwrnhCb7lsusV6w0J9Lrm6Fuw4OLUBHHbgK72nmaxT2g
IhAbth0jmNmAhFv+vpaYL7ZDKzBbeTTAEWXtdRJfrCX7TL4mT0jYEpvlYcD3VzLJ
613PTovHRjZ8AdGgfzwEQPLRg5D1znnl2DTu8wFlqvY5WUSzVfE2Mg0UXv3WtMhv
h1+BLrYyVcIPCT02hzG8UMR5Y8yTgiWA4pUKwzGfjd3N75HCh/M4Ii0jHs5lgD7x
Cer/8aMhVEE4ucJ5pM022XM+VMgtgrqQBKu5YUsWVNArBdlxtge0wcbATiLx2Mda
9YxrmQNpq43oKo2AnwY0U/18tuxbleaqL45fljn0aGV/AIaUI7BW4M4jEE3Fq4BB
YnJDdBmeyNyDTw2g9VVJE5W7FH/3kAUzU+su2mpQelry1ia9KJB9FMnSpHtfBHqE
b8QrGrfq5K3F73DzYp7o9UMyh0R954HG6UTJCw6W27lJoFiMzj14HFIr8+gLUoHl
NyPEJyGKodM96M6lJ6AWdRq+t5Yxk5UKgv8oUxZx7rWzD9DL5P1yU8Rl1peaR95I
Xojg2u8KQc3Yb4EZDzUSXH21LFyGtVskht1Qb4M8q+x9oGnpHBo=
=zItG
-----END PGP SIGNATURE-----

--=-kGv6YloVMQJBMwlPHIMb--
