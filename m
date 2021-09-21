Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078684135F5
	for <lists+linux-input@lfdr.de>; Tue, 21 Sep 2021 17:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbhIUPP0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Sep 2021 11:15:26 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:58738 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbhIUPP0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Sep 2021 11:15:26 -0400
X-Greylist: delayed 315 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Sep 2021 11:15:25 EDT
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 0BB7CF40B68; Tue, 21 Sep 2021 17:08:37 +0200 (CEST)
Date:   Tue, 21 Sep 2021 17:08:37 +0200
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] HID: wiiu-drc: Add a driver for the Wii U gamepad
Message-ID: <20210921150837.ingexwsauvxgluca@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210519085924.1636-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ez74el7qvw7jyttg"
Content-Disposition: inline
In-Reply-To: <20210519085924.1636-1-linkmauve@linkmauve.fr>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ez74el7qvw7jyttg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:59:20AM +0200, Emmanuel Gil Peyrot wrote:
> This driver is for the DRC (wireless gamepad) when plugged to the DRH of
> the Wii=C2=A0U, a chip exposing it as a USB device.

Hi, I=E2=80=99d like to request a review on this series.  I=E2=80=99ve been=
 using it
with success for quite some months, and from a self-review after not
having touched it for as long it still looks correct. :)

Thanks!

--=20
Emmanuel Gil Peyrot

--ez74el7qvw7jyttg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmFJ9XIACgkQOWgfYkb2
LpCb/wf+PtGYAKzWAKJDC0I5XoreW7e2FLGsBvkwfnzcTQlP3DfyueyEMKTQXDZy
ifvED6JV/hqgrMAyEekPNMmOez1kC1w8+JWrK0OvtXlIfwvEFNwpJScTQXusab5w
bX4+DLwfLKE47LOXGWljzWTtQxh8uBOxpfwP3DojZYgQLPucXpbCN2DhbZznFtif
Duv07lAsE16bxV/jxfw5e7w9Nf/ZSdypLDJ0R51IM3LBC7CAQIadj//HQHH6QWCl
fuh2bd1ahvG96uwMrqg70s3q/A0Y9SXE7vwWTmFQsMwR5Rsuaeu7OcKxn/6RNvdX
1g5zkb1C7jI+KN+0SYxTlu45G2VS4A==
=Hrq3
-----END PGP SIGNATURE-----

--ez74el7qvw7jyttg--
