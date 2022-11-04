Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 959D461957F
	for <lists+linux-input@lfdr.de>; Fri,  4 Nov 2022 12:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbiKDLkW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Nov 2022 07:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbiKDLkT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Nov 2022 07:40:19 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C632D2CDEA;
        Fri,  4 Nov 2022 04:40:12 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 61DE01C09D8; Fri,  4 Nov 2022 12:40:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1667562010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6G9a03OG4uPCDarm3te8m4iW/sw9UHZqahTSi9gxxuE=;
        b=rE485ZYDDln9A7EU5Velo8HPJWTVT4VYByB/4BIQ1O6by+JFqEJg1MPm00d1+EIUyCeubH
        9x++GbxnTwR3bh3lbEHPOIBN8CBw594lC4kiQYTuPem1/J4DCFhnBT1byljLqzrw9TIxci
        fFfRVcji+QRJBDqnhcubRZ7Aww6kM3o=
Date:   Fri, 4 Nov 2022 12:40:09 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andreas Bergmeier <abergmeier@gmx.net>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: Litra Glow on Linux
Message-ID: <20221104114009.GA4874@duo.ucw.cz>
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu>
 <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
 <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com>
 <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com>
 <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com>
 <CABfF9mMf433M=kXjqG85rdavFXHRqn0hyBujbMTfEoUG7vZD-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <CABfF9mMf433M=kXjqG85rdavFXHRqn0hyBujbMTfEoUG7vZD-g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> See my first stab at the problem below.

> index 71a9c258a20b..bdc2949d1be5 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -11,6 +11,7 @@
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> #include <linux/device.h>
> +#include <linux/dmi.h>
> #include <linux/input.h>
> #include <linux/usb.h>
> #include <linux/hid.h>

> @@ -206,7 +208,10 @@ struct hidpp_device {
> struct hidpp_battery battery;
> struct hidpp_scroll_counter vertical_wheel_counter;
> - u8 wireless_feature_index;
> + union {
> + u8 wireless_feature_index;
> + u8 illumination_feature_index;
> + };
> };
> /* HID++ 1.0 error codes */

Something very wrong is going on with your email -- all spaces are
deleted or something. You'll need to adjust your mail settings.

Best regards,
								Pavel
							=09
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY2T6GQAKCRAw5/Bqldv6
8sYSAJ4wErF/n0SJoLS9RJAMw95c2q0YxwCghu4I8W6G1B0SevkLvwHUoQw3Bx4=
=GDir
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
