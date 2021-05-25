Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31FBF390A4A
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 22:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbhEYUGO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 16:06:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38498 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhEYUGO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 16:06:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7F3941C0B79; Tue, 25 May 2021 22:04:42 +0200 (CEST)
Date:   Tue, 25 May 2021 22:04:42 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        marek.behun@nic.cz, linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: Naming of HID LED devices
Message-ID: <20210525200442.GA1106@duo.ucw.cz>
References: <CAEc3jaCfS=DPQiSjh+_aVePbUXHe-M7WH1t+JtSLwqu0Vktnxw@mail.gmail.com>
 <20210521160455.GA10159@duo.ucw.cz>
 <CAEc3jaBdWwfbMdrdKOc9e19Mb5HD3DE4QUNu+5UseQ9WLt0THQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <CAEc3jaBdWwfbMdrdKOc9e19Mb5HD3DE4QUNu+5UseQ9WLt0THQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I suggest you simply select one input device (call it primary,
> > probably the one that contains the master joystick) and use its input
> > number....
>=20
> It is of course an option. Though I recall in the previous discussion,
> technically the LED is registered on the HID device and not on the
> input device, so it is not entirely correct. There are also cases I
> believe where LEDs are directly created for the HID device itself.
> Based on a quick search this includes the 'hid-led' driver. Though its
> naming is probably fixed as we may not want to break user space (not
> sure if anyone is relying on it). There might be other plain HID
> device use cases with LEDs.

I'm not that familiar with HID vs. input differences. We already use
inputX naming for keyboard LEDs.

I'd say lets do that.
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYK1YWgAKCRAw5/Bqldv6
8n+xAJ9XGP6/9s9rUP1bnZj51+XkVHxBcACgl/TzQ1Ozo8ihtA95jZl42oIfze0=
=juqZ
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
