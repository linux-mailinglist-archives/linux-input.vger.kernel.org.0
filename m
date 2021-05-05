Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868F9374B7C
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 00:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbhEEWo6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 18:44:58 -0400
Received: from mout01.posteo.de ([185.67.36.65]:52627 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230029AbhEEWo6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 18:44:58 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id C3E7C240026
        for <linux-input@vger.kernel.org>; Thu,  6 May 2021 00:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1620254636; bh=pYv3Au9IXevKATgUIKODXyVpuytFP9QKuUl4LWhUdno=;
        h=Date:From:To:Cc:Subject:From;
        b=PZVukC/yyFtdFHmLbfMqqGCPum8ea7JEYfWFp5rcFmz2dPmdqxo3dCcypXW97nHKx
         FsF4vQh7IgbGzDyIBR8+0uZ9lgr4IbUHMwcayYrXiMmT7euHHBJAr1A8V5h9knYcx1
         C3Vir/OklK9/3IJ6iqgi70VQGb3T4jiOOSSDRVoN2l94kU8XO+x4Q8WGYrUxWpBs0H
         qrHePefArp5WkQJ4PFv3o72yX3nTA72vC78cBIKu4NFO0G7hJBa9cQH7TWg7qqySa1
         y9EanUhdKmXVHHJTEoLLEfoMsIKj+z0kKoMT5xxUsXR8f3Idp5iYireH4/Rq6lATYD
         +TNl/RuD6OLsA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4FbBZz4Bs1z9rxF;
        Thu,  6 May 2021 00:43:55 +0200 (CEST)
Date:   Wed,  5 May 2021 22:43:55 +0000
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] HID: wiiu-drc: Implement touch reports
Message-ID: <YJMfq9MbY2guEhpv@latitude>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210502232836.26134-3-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lEF1dgD/uX8Hblg6"
Content-Disposition: inline
In-Reply-To: <20210502232836.26134-3-linkmauve@linkmauve.fr>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--lEF1dgD/uX8Hblg6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

some more comments below. Enjoy :)

On Mon, May 03, 2021 at 01:28:33AM +0200, Emmanuel Gil Peyrot wrote:
> There is a 100=C3=97200 inaccessible border on each side, and the Y axis =
is
> inverted, these are the two main quirks of this touch panel.

Does that mean 100 px borders left and right, and 200 px borders top and
bottom?

100=C3=97200 evokes the image of a rectangle of that size, which I found
confusing for a moment.

>=20
> I=E2=80=99ve been testing with weston-simple-touch mostly, but it also wi=
th the
> rest of Weston.
>=20
> Signed-off-by: Ash Logan <ash@heyquark.com>
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
>  drivers/hid/hid-wiiu-drc.c | 83 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 78 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/hid/hid-wiiu-drc.c b/drivers/hid/hid-wiiu-drc.c
> index 018cbdb53a2c..77e70827c37d 100644
> --- a/drivers/hid/hid-wiiu-drc.c
> +++ b/drivers/hid/hid-wiiu-drc.c
> @@ -49,13 +49,27 @@
> =20
>  #define BUTTON_POWER	BIT(25)
> =20
> +/* Touch constants */
> +/* Resolution in pixels */
> +#define RES_X		854
> +#define RES_Y		480
> +/* Display/touch size in mm */
> +#define WIDTH		138
> +#define HEIGHT		79
> +#define NUM_TOUCH_POINTS 10
> +#define MAX_TOUCH_RES	(1 << 12)
> +#define TOUCH_BORDER_X	100
> +#define TOUCH_BORDER_Y	200

[...]
> +	/* touch */
> +	/* Average touch points for improved accuracy. */
> +	x =3D y =3D 0;
> +	for (i =3D 0; i < NUM_TOUCH_POINTS; i++) {
> +		base =3D 36 + 4 * i;
> +
> +		x +=3D ((data[base + 1] & 0xF) << 8) | data[base];
> +		y +=3D ((data[base + 3] & 0xF) << 8) | data[base + 2];
> +	}
> +	x /=3D NUM_TOUCH_POINTS;
> +	y /=3D NUM_TOUCH_POINTS;

Given that there are 10 possible touch points: Does the gamepad actually
support multitouch (usefully)?

If so, I think it would be better to report all touch points
individually to userspace, to allow for multitouch gestures;
userspace can still implement averaging if desired.



Thanks,
Jonathan

--lEF1dgD/uX8Hblg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmCTH6MACgkQCDBEmo7z
X9vPEw//fnzygV7B/u+Z+ZCU+HZDFVNVkP99lGWvOQvYeBFgrQiAfmckK0uYMnoJ
pfaUQQJFFhctDLvrRbg4xUEfeLxzCmIULANB1Z9NydCLt+Kyl0aF33AQ98o+i//c
RHDgTR2knyIxPW9Srh35lYJln16JuU5OEd0ADwN0lJMeM/QQgh7IiEooUtDHsKAs
TrGfsBCCN828ucY1aJFlc4TPebOKeoAgu5oK/ZlzOmnV4l7iUh2FZ0SHlAPn+w5F
3BUbMsFnofLYhW6dzGKe7LeocubVa7K3qZLIBZCQleuEgJTBPBEosGX6hJmvbYU5
xUGPQ32QVJFBIHgaZKuPJUGZNKo/az5mwReo2Xk0FN4GhBErURHGTdb4AXUdhNbR
sH8LVUrRBK6Oz7LN98kDPr54XZtt797weF9yABdaDDc+PxNfJEIdHL4fpJaqe5SN
v/pBI6v1REj6n8vjO9QGyH3wk4Ee6WO6r0TTdvXxgXF1QHPTPcNRbYObRaswgDeZ
tSDM1mwe6SqtvtT6TgrmCjl54bOcIqaQpFoYqKnIa59T4Soqjg0ruB7ZRaKVFd7J
jQALSwEe4Z6wkYFPCJb+qlnhb/6MQxU841e58QNA08QCzD7FDDc3nJGJz8cvG1Yv
zIfFwZX43NlzhMfrNQejnwvvwxNUaUd3er1PWTXdkIhzlWVM3wQ=
=yjsD
-----END PGP SIGNATURE-----

--lEF1dgD/uX8Hblg6--
