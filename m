Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C774452F17
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 11:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbhKPKd1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 05:33:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:49594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234063AbhKPKdX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 05:33:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D30EB63217;
        Tue, 16 Nov 2021 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637058626;
        bh=dJoICNBNvtwo8fELFQThHAtcO48zN/9C4FoNx0nlRLI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HpS32mN8DkORYLYffAQpwjWsBWtPEBjB0CHa26YtudoUQm39C2KUovSZAXnPMauwU
         kW9qQXVlwHEvFqf7cNffN38IkMVoctnQ7GveL8W9f8YBdL8mnoO2MiGO+wunp1k3Be
         xQcqCVqxOLDItJXTolTW7fuOVGp5e/yp1xvG7PMv79fikvLUL2F05UV8GYW9oYGJ83
         P12S4D4HwtVWJHBFYIfd8UerNoi6LO2AxxTwtJZkjQuci8hhL/5Cz7VWb77aWEnswA
         tCpbiqWeSLiD8+HXydZeIhxLrQn+dl0zEP77fnkJSzRQj081lLd71tCvo/fdG7qpPj
         LwZ978SLJp3+Q==
Date:   Tue, 16 Nov 2021 11:30:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Phoenix Huang <phoenix@emc.com.tw>, jingle.wu@emc.com.tw,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: elantech - Fix stack out of bound access in
 elantech_change_report_id()
Message-ID: <YZOIP1RaMpomnmLp@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andrea Righi <andrea.righi@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Phoenix Huang <phoenix@emc.com.tw>, jingle.wu@emc.com.tw,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211116095559.24395-1-andrea.righi@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="S+qPwRSR5NoZgGfL"
Content-Disposition: inline
In-Reply-To: <20211116095559.24395-1-andrea.righi@canonical.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--S+qPwRSR5NoZgGfL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> [    6.512374] BUG: KASAN: stack-out-of-bounds in __ps2_command+0x372/0x7=
e0
> [    6.512397] Read of size 1 at addr ffff8881024d77c2 by task kworker/2:=
1/118

I wonder if the KASAN trace could be shortened, but I leave this to
Dmitry.

I like the comment, thanks!

Reviewed-by: Wolfram Sang <wsa@kernel.org>


--S+qPwRSR5NoZgGfL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGTiDsACgkQFA3kzBSg
KbathRAArw2YsJMAqIun+77yhtA2noaG+bu/N3ptLQfBt0J8tD7qktr4c3G+pWIx
ycPR+EeMwpJAqtgqs/lpDkGwnVIIQPeBvS6v8mp0aTkZcJocjy2l7UucbKxzBxQj
Wc9P/kLjsNKIdADBWsGpVIe9G/u6wWHcOlHQroWugF9kNVo4LBGViDqnOwcMgEli
Zn6a6P6Nbr9s95Ma5NlGV+z5gzdGxPUN9OaEH8+1RQSVJo3nZA0zATkskNBi2x3X
f7El2ogPdCl2FFtPBJhfeVtOsQosxKHi9ToQnP0G99daODCiMg7ZMAo+5aWwYctI
IGf9BwWFU3SbmGmrgXRUxY6XEDRIjFyXJA2Yrm8NcTIxhWHlS1Pdc0hpHrBhsuTO
JTKs/eIBFFnYnzpEQeonlzoL5D4llLpcQxP+YRCcX5QOh7ce5tIQDbRoKlLOoWHT
dnGwrqeGE0HiCwz7nyY/MYbe+hreDFbxstT3eQYwBaAkgQDKs3HQqop7oaMrZdv8
K7Yckmb/eFo/c9NHd0sPzehRFTV6zvWb4e1ey3ff7JHl8YvORhCRn2pRmKihhGty
wX5YvdFiHheVuRIsmL92UsyFlSfDJpQ6/zIwIa3wc3yvllF1hE5i87Zwx4cHpCSi
KKamROF8ZbL0gQYEv8uLBJW0Tr13oeO3xZrKIudSubQtlxDygOg=
=1JDz
-----END PGP SIGNATURE-----

--S+qPwRSR5NoZgGfL--
