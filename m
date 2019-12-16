Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADDC011FC62
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2019 01:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfLPAzi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Dec 2019 19:55:38 -0500
Received: from orion.archlinux.org ([88.198.91.70]:38036 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbfLPAzi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Dec 2019 19:55:38 -0500
X-Greylist: delayed 353 seconds by postgrey-1.27 at vger.kernel.org; Sun, 15 Dec 2019 19:55:36 EST
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id D062417441C8D9;
        Mon, 16 Dec 2019 00:49:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.3
X-Spam-BL-Results: 
Received: from genesis (unknown [IPv6:2001:8a0:f254:2300:dad6:8c60:8394:88da])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Mon, 16 Dec 2019 00:49:41 +0000 (UTC)
Message-ID: <895e66cf60a022a01701d03d8b873321aebcc30a.camel@archlinux.org>
Subject: Re: hid-logitech-hidpp / hid-logitech-dj driver hiding inputs and
 breaking Logitech G700s buttons
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Hamza Attak <hamza@attak.fr>, nlopezcasad@logitech.com,
        benjamin.tissoires@gmail.com
Cc:     linux-input@vger.kernel.org
In-Reply-To: <1576438494.7054.3@auth.smtp.1and1.fr>
References: <1576438494.7054.3@auth.smtp.1and1.fr>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-9xr/A8w3plp53V1CC4Fw"
Date:   Mon, 16 Dec 2019 00:49:39 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.2 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-9xr/A8w3plp53V1CC4Fw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2019-12-15 at 19:34 +0000, Hamza Attak wrote:
> Hi,
>=20
> I have been facing an issue with my Logitech G700s mouse on wireless=20
> (id of
> the receiver is 046d:c531).
> Most of the buttons are not working, namely:
>  G6, G7, G8, G9, G10
>=20
> My testing has shown that when pressing these buttons, no input at
> all=20
> is
> showing on both interfaces:
>  /dev/input/by-id/usb-Logitech_USB_Receiver-if01-event-mouse
>  /dev/input/by-id/usb-Logitech_USB_Receiver-if01-mouse
>=20
> Further testing shown that having 'hid_logitech_dj' or=20
> 'hid_logitech_hidpp'
> module loaded is causing the issue, just one of them loaded is
> enough=20
> to create
> the issue. This led me to contact you by looking at
> 'drivers/hid/hid-logitech-dj.c' and 'drivers/hid/hid-logitech-
> hidpp.c').
> rmmod'ing the modules and using 'usbhid' module alone is solving the=20
> issue, as
> Linux is now receiving correct input from the buttons.
>=20
> Blacklisting the modules would do the trick for wireless on my local=20
> system, but
> it doesn't seem right no to report this bug for others.
>=20
> For info, it works perfectly wired, so I guess the issue might be
> with=20
> the dj
> receiver code.
>=20
> Before thinking of modifying the code myself, I am sending you this=20
> message and
> see what would be a clean fix for the issue.
>=20
> Thanks,
> Hamza ATTAK.
>=20

Hello Hamza,

Which kernel version are you using? I am pretty sure this is an issue
that was fixed in newer versions.

Thank you,
Filipe La=C3=ADns

--=-9xr/A8w3plp53V1CC4Fw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl321KMACgkQ+JPGdIFq
qV0C4w//WWVUKQyHAd19tmedpQpyU4yehnqQAPJi9brEaTl5rdaIKHiqVgqH3N0n
i1QZgmhVaxrr9EiGQodhdMLvPCuaWXrBr2+HxfBuUcaIK1GhLI8z0iPaZt23XQtl
zjNQAbaViTX5A4cCsiCkWZeouwvcx8WFB9A1FD2peFpRW3mTxcWwjw4P9AMTffjg
MA8elHmcs7FmGNN9bQP5QpRKj/JyEU9FXRBypFOMBi/roKF8zo9mjsAkzuFaSdFJ
MkKQKxqIxL+V+/vnM6HDXRoj/0xZl3tMgUNtC7zOBajcORuTu7Sj7jIXgPmnXZXz
whscegXI1nGpzKkPVfpKOnQ3q3ZtIg7AoWjRNc3qVYEOkB9gdnc/+HUiNQpLjbD6
iyJ04SiQCTQRXfUaHDcbRH2eb5/JoSVCYbcxtZsBcYvwWK4XhKD13JsNiDobXFBt
77/3Ib/Gt+S94SOWvpByw2l9iPaszL7huz6yK35mDXOxcU8sElZ2tjTBa8L53dNP
QlFoYo6NHLTb800ZnmsIdggt/NHxnB96DvEeXDP6FJ8ZAn/0DdTNDLS/Cgb2Bobd
0JUGbzM6mJj1ivJ/k5kf2ulQRLURAnxNUfANUKQU0QDD8ZZFK40XpeCbxpngNUXj
qmJwFxk8fD3lcg5xoP2mtVeq3HWQcvm/a//KxzH1RJ/nNCcpmpk=
=h0wC
-----END PGP SIGNATURE-----

--=-9xr/A8w3plp53V1CC4Fw--
