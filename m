Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8DB3659F5
	for <lists+linux-input@lfdr.de>; Tue, 20 Apr 2021 15:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhDTN0s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Apr 2021 09:26:48 -0400
Received: from [139.28.40.42] ([139.28.40.42]:53048 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230479AbhDTN0r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Apr 2021 09:26:47 -0400
X-Greylist: delayed 512 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Apr 2021 09:26:46 EDT
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 843573610E5;
        Tue, 20 Apr 2021 15:17:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1618924662;
        bh=EiOKgZTBodR81vZVJMjOvy13uxSlbill1AD5HwjJA40=;
        h=Date:From:Cc:Subject:References:In-Reply-To:From;
        b=JMSw5V3cZPEnh0ibl7hSxYNACatq5siEbFyf3bfylxYQ8bocw+3oUbbpPbg9Tc6JC
         hLUYQ27+QBhw03AjC+XCLHy818S6g2Yux5CgdcXqNaAWfrepU/fJywVYl30JHe+u22
         oJS8Xt6eFQq2Vkw9ZDI2gq9HowuQjxjKqmQQbvgjbkyLnHCcvVBBl9g1K8qoE2J7zv
         DmF8eWISQAOoL8z22ztElhwyfSXhYgKeePAQsQ2V3TiM02D5Mziv22KvGpZES7Ljc9
         B21gx1fUgyowu/h+haUXu+BQSfivKnf4w5fyuwXOybfRbjDzsIPk7u5Zdi+vZfPqho
         fwIE/NT2hT5xQ==
Date:   Tue, 20 Apr 2021 15:17:41 +0200
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Stylus-on-touchscreen device support
Message-ID: <20210420131741.kdgxquhwqureih7c@tarta.nabijaczleweli.xyz>
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xoiz3s4du4e5aytw"
Content-Disposition: inline
In-Reply-To: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--xoiz3s4du4e5aytw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 06:41:49PM +0100, =D0=BD=D0=B0=D0=B1 wrote:
> This patchset adds support for stylus-on-touchscreen devices as found on
> the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among others;
> with it, they properly behave like a drawing tablet.
>=20
> Patches 2 and 4 funxionally depend on patch 1.
> Patch 4 needs patch 3 to apply.
>=20
> The output of this patchset and the need for a kernel, rather than
> userspace, patch was previously discussed here:
>   https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/558#n=
ote_792834
>=20
> Changes in v2:
> Patch 4 now ANDs the secondary button with the tip switch,
> since it's otherwise borderline useless to the user.
>=20
> Ahelenia Ziemia=C5=84ska (4):
>   HID: multitouch: require Finger field to mark Win8 reports as MT
>   HID: multitouch: set Stylus suffix for Stylus-application devices, too
>   HID: input: replace outdated HID numbers+comments with macros
>   HID: input: work around Win8 stylus-on-touchscreen reporting
>=20
>  drivers/hid/hid-input.c      | 54 ++++++++++++++++++++++++++++++++++--
>  drivers/hid/hid-multitouch.c | 18 +++++++-----
>  2 files changed, 62 insertions(+), 10 deletions(-)
>=20
> --=20
> 2.20.1

Bumping this after a monthish =E2=80=92 is it missing something? Am I?

--xoiz3s4du4e5aytw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmB+1HIACgkQvP0LAY0m
WPE8wBAAkC4INzasLoLgrGLkqcPtP7yAQIu/e5PX5u2s2gUsqIFGjcnNE4ZRgRUo
J7Hzq5HPVdeoaVkB1J0I8MzJFIuIyjy4wU6eRWIpizl0GQ/IGqAW5YFBfiX/JeV4
7wsteSnCw+GV5d+LvWeED8x0IA/6RMX2Syyex3uS8+hq0iEVtml3my0rTdg971f3
1AS+1ALJbp5W1QfAv/DxpSLoVbvrcdqKJcbA6Sh5H1SxUIRr36TL+W5uP2OvWYNr
jtvcvDfaPrCv1VN5WYnY5wlE9dRA+NpEkem9LksiLSmLLEBjvHWSCyrHz9zxOYJp
A2f5em4m1zx6ji28XhZLyFLnCGlWvqu84xu8NdMsWTwhywFSyul4tKiuJ40pnkRB
QPvQ7lCLgqI26d4GCe2zpThU0s2ABzChRYwEUM0/KTS5ALE6+VvvXfo0rGxUDUbS
wa+54cvtamJuEzDLJV247Hs/Q0A+GW/GyUHGBNt+EDRCa+GPuEp3yIQ8Ihij4oHK
bVccu1eFMnFIkmm85YfQbWws4juj7TsuVtWadOFOtH7GJdRUTtL5AmNdmmw0RRzw
Xc92Hl3oLuBlpZgbdV6CFSDuAAdyZZgs+axfRZkMH9NgZjOyimqsmNz1DDgzy4C2
OY90At6C/aODHhaSYP64hTYBfdNCROdHos9BE1pnB2sVFtz0U2U=
=JcQn
-----END PGP SIGNATURE-----

--xoiz3s4du4e5aytw--
