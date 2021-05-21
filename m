Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3D538CA94
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 18:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbhEUQGV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 12:06:21 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39126 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbhEUQGV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 12:06:21 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E038F1C0B7F; Fri, 21 May 2021 18:04:55 +0200 (CEST)
Date:   Fri, 21 May 2021 18:04:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        marek.behun@nic.cz, linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: Naming of HID LED devices
Message-ID: <20210521160455.GA10159@duo.ucw.cz>
References: <CAEc3jaCfS=DPQiSjh+_aVePbUXHe-M7WH1t+JtSLwqu0Vktnxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <CAEc3jaCfS=DPQiSjh+_aVePbUXHe-M7WH1t+JtSLwqu0Vktnxw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Earlier this year during review of the hid-playstation driver there
> was a discussion on the naming of LEDs exposed by HID drivers. Moving
> forward the preference from the LED maintainers was to follow the
> naming scheme "device:color:function" instead of the custom names used
> so far by HID drivers.
>=20
> I would like to get some guidance on the naming direction not just for
> hid-playstation, but Daniel's hid-nintendo driver for which he posted
> a new revision today has the same problem.
>=20
> The original discussion was on "why not use the input device name?"
> (e.g. input15). It was concluded that it wouldn't uniquely identify a
> HID device among reasons.

I understand that problem is that one controller is present as
multiple input devices to userspace.

[That is something you might want to fix, BTW. IIRC input protocol is
flexible enough to do that.]

I suggest you simply select one input device (call it primary,
probably the one that contains the master joystick) and use its input
number....

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYKfaJwAKCRAw5/Bqldv6
8sL3AKCS07qtoN9QiU7CUVG6j0NWp69LHwCfXHJn3ylK/k9Uw1IW6y6goe8pJa8=
=mPYK
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
