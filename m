Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73912452CD5
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 09:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhKPIfl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 03:35:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:41730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232146AbhKPIfh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 03:35:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D15961104;
        Tue, 16 Nov 2021 08:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637051560;
        bh=D+EPgvoIkKqQDPenWdFX9a27MRvYHS3iPm5Evv0O5Gk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GelmWcxU+raVzETWLOLmACqEF1W3AB96MH159Pu4+oLcWe1aPkh0mtbRJ/mMUa4HQ
         BH0laKFwVvzTFlWv1FCiG6RovvPMeMOObHgR/2Xrxa3SBnH+H5xxpxN/Td2JX1Lwth
         8eN0g7XuqljQ3cMfPT9rFhxvCv8Q0yylAvvIoBMUaY7bIWhP5VxGObri7ay/bx+JR2
         q1Q7HziKUOq0CslUn0EqM+7CLtO6ZiDBLspsIzst4+BgXvDb3UEW/+x4ktmB6/MM2x
         7Wx/JaJYL8zJxSToBXCkDBrp9XrfWC7yOyTkIhXP/OUgepImuGog1zuxh+SdtTI465
         l1J2+3JUVGkCQ==
Date:   Tue, 16 Nov 2021 09:32:34 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Phoenix Huang <phoenix@emc.com.tw>, jingle.wu@emc.com.tw,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] Input: elantech - Fix stack out of bound access
 in elantech_change_report_id()
Message-ID: <YZNsoj7Onbxr68OQ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andrea Righi <andrea.righi@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Phoenix Huang <phoenix@emc.com.tw>, jingle.wu@emc.com.tw,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211116072223.8746-1-andrea.righi@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v41ANMmYrzmBanSY"
Content-Disposition: inline
In-Reply-To: <20211116072223.8746-1-andrea.righi@canonical.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--v41ANMmYrzmBanSY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 16, 2021 at 08:22:23AM +0100, Andrea Righi wrote:
> The array param[] in elantech_change_report_id() must be at least 3
> bytes, because elantech_read_reg_params() is calling ps2_command() with
> PSMOUSE_CMD_GETINFO, that is going to access 3 bytes from param[], but
> it's defined in the stack as an array of 2 bytes, therefore we have a
> potential stack out-of-bounds access here, also confirmed by KASAN:

I think a comment in the code why the array size is 3 when only 2 values
are defined would be helpful. Like a short summary of the above.


--v41ANMmYrzmBanSY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGTbJ8ACgkQFA3kzBSg
KbaIOg/+JN2dcBSJ7WQhGiwcqLcVxmJCjOLnOb5XEitI6yvzjPMME2RX1f01B9mZ
8QsQ0C9YqEQJvuA/tTO6VPhfOmA/zERhwqc1ehiFe7HMWIG3lD+jb9O2yoOTVyU2
ScrwUdDcPzzLcwZsXess6x19ub5y+rceRbZZ/bvLyY/vCEp2XStsu5Sbx2JGWT3e
X8aD9398+WnDLKtbOGELGNQI/9VqpU7J50hxoEE4Y0zBNK+A8SZLYvqAhwiACqL8
9KCmXNOec39gMKkC/O6ah4gnyP6hvIId5GewVtreG8MIsTSl+TnhTm/LGsOMynCI
IGqi5t9R20W66xMg/UjEU5OozS8YyOUpxWSa9aRCY6IppRL+h3uaYsG3vkLo4fyK
z2zQx8/gzIYWiC3wGvM7iltgMDXnxps6YzaKVr8YvMDdGGoLtNZHnAzHrGN9MA1p
Pgho+M96ZbARv6fMVj72raIo4c3D/f1oanaPAPtii5uu4beDiOTAvKv5gtd5cBD9
Qq6QRUfhQh4PK1UUcvdc8lYmk8kw7OlKvjcXCLTyBIuLAG9f7ziyyf33aRyMOLoE
0iQ2fGpVBg4BrKfE1mirNMi19wK1l8GiuH5xI5UEvBz7RHCmvncqvleBEeOSesqx
Mz5Snw0JiT74gQFDu59VMgOM3fe8GrIvIj/tc7iMlmqNc9ktbcs=
=kExX
-----END PGP SIGNATURE-----

--v41ANMmYrzmBanSY--
