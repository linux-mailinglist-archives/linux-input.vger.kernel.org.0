Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F94E33150E
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 18:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhCHRmQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 12:42:16 -0500
Received: from [139.28.40.42] ([139.28.40.42]:54246 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S229650AbhCHRlx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 12:41:53 -0500
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id A69BF360009;
        Mon,  8 Mar 2021 18:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1615225309;
        bh=WM/er/09msN1vhiF5jfwRbeNISZL5mlxkqvwhWf+jfU=;
        h=Date:From:Cc:Subject:From;
        b=ViTK9v5qPOquowA7WXNujmklDScXpjSOKPhUhUwXO15naHhVZ1yedX7/BnPKuLeFJ
         0iqTOY33VClSlTzyG45LcCXKuCbbSQICVJr0GvHqStpM4hND4xSUeYZr9FvhDPVYTC
         ZML6m+zu27366OrDrGXNAvQXeq9NrJzTwbn75UR+xcmZr5svk+lX7iqKnjAR1p2Rdl
         BmAKNGhUoc06T/2Yu3X6/wxYaOVB5W9w5vb1nmZtWQeOoplxZWrM1fY8+7TxLkDhuQ
         7Uj1P1rvWn97AkoFSmuFXkRPx1HiixGzHrafRdKu21PWi33q1EUZtW/yemHsdSBdGP
         bWQl3VOv2WKdA==
Date:   Mon, 8 Mar 2021 18:41:48 +0100
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Stylus-on-touchscreen device support
Message-ID: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fzcf3dxwgufn72zw"
Content-Disposition: inline
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--fzcf3dxwgufn72zw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patchset adds support for stylus-on-touchscreen devices as found on
the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among others;
with it, they properly behave like a drawing tablet.

Patches 2 and 4 funxionally depend on patch 1.
Patch 4 needs patch 3 to apply.

The output of this patchset and the need for a kernel, rather than
userspace, patch was previously discussed here:
  https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/558#not=
e_792834

Changes in v2:
Patch 4 now ANDs the secondary button with the tip switch,
since it's otherwise borderline useless to the user.

Ahelenia Ziemia=C5=84ska (4):
  HID: multitouch: require Finger field to mark Win8 reports as MT
  HID: multitouch: set Stylus suffix for Stylus-application devices, too
  HID: input: replace outdated HID numbers+comments with macros
  HID: input: work around Win8 stylus-on-touchscreen reporting

 drivers/hid/hid-input.c      | 54 ++++++++++++++++++++++++++++++++++--
 drivers/hid/hid-multitouch.c | 18 +++++++-----
 2 files changed, 62 insertions(+), 10 deletions(-)

--=20
2.20.1

--fzcf3dxwgufn72zw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmBGYdcACgkQvP0LAY0m
WPFghQ//cLuO0W8JSniqg9zthjILH1VTrGzoU4khDteWTrT2Tykh3t4b2iF+LB8H
/rsNXCWSpgw/Ji+RoWcsAsw8C4013LM1jNdYNqSDZBgpspCHESJ7u1pMso3aw4yf
rc3XqVVCIjEa5LK8Oa3Qun+jqkUA6hrsJtHQnGwuBUGiJGXLfE15mGqp0chZmjMZ
sT+u+SXYyMsOEigzErwrazcLzE0XgqAQ7ZWlgxpC52PGvfJDxXhGEhGH1FiNpisb
Tg1rDFiHtdzknqJw6P+Ho4tvY8jBJxGsOuNHZLfKZEdoAWAsu44RtaDe4cCMFodW
LPJyD9rVrZnyKz6CJVMBvu7C9c5QhvgeGUBnWcqpJpj6iqD8APrVVceDf/080nA8
p8j76sLStKHkGci+LYB5+Nl1LcNkVX/P1nOo89Fwlqbik5nBVwtDFduovO0ZZX8z
UZ9mGIPxqfVjtMw/Tcdbf0aokWCorFYziUsJqLr7rudCRd61w4KKKj/mrQu7v4CQ
/1HE+7K64Vzza7vds8lPhgiSV3L+J7FQjRXx4O07Otm36Wo0Kv8RcYY7vUZNH1OK
XVqadvO8L0kEMB/mnn8X3hHqbx/UseEWHX2M544+wtZ9GSF8zChLfJWmNVoJ80y/
JwuYkA0haBxwHttkvjFu3J4tghLL5UIntX3lNU6leYKpza4xVFc=
=mdAn
-----END PGP SIGNATURE-----

--fzcf3dxwgufn72zw--
