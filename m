Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529BE2C5C1F
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 19:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404681AbgKZSqM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 13:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403877AbgKZSqL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 13:46:11 -0500
X-Greylist: delayed 343 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Nov 2020 10:46:11 PST
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778A3C0613D4
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 10:46:11 -0800 (PST)
Received: from [IPv6:2001:8a0:f26a:7e00:d2bc:b624:5e5d:f425] (unknown [IPv6:2001:8a0:f26a:7e00:d2bc:b624:5e5d:f425])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 23F93262D01;
        Thu, 26 Nov 2020 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1606416023;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uTNgt320O/00rSmoQk8a7jfScwAEzJBA+Inppo3b1hw=;
        b=l95HcynsF/uU5JVE9lgbzJQtl9w4wIh9mxKxnqgoj+/vvGMLPAXbLWhQvSpqvujhgYyTv+
        L2NbVbtue6dBB6UdbYnb8/U5jblr2j/gXZlqJEdR3lfCXhKFGzsRo7ffV+AFRRk7kAsP3t
        gIUdKTwArDFU5K9mTE1oQheH1zHSlRGV6w2BGA+96z9Hpdy1fdCGuw+CpvnvcfTfNsAPgS
        Byir/jLJ7XfJE3TfwudGP/TfX37uOsLEPZzZDJaMOc+qq9KbOOxV+25VZAUY44CqClVJSp
        xoERBbZHYkXy7+3T6hKFMcJhxVER/QfgnoVlyphf8w0UPF/Yt8oetw9QepirrSbkYB7bmE
        b03fsc3quZyv9D8ZntWxgdBBTtd99Qdo12Pzc1P7YovNuDxG3O7Xsq61DKMk+xFoXUdrzS
        3Qmna6OIHRpn25iU6ajUmojU4PDsAhFUjlgV4jlPYJ2rz4FxwHOIEQCDP2+6oafSmymN7s
        u97eQXQtBxDP3ntYXtdXmRM/PHc4SrXfmgvK4JxsrUv2qgU4REyTNsO9U8DZFJLxQZyUFF
        p+5kYLqQuih/Nc4eW74ZJklDGYLDr7XaApuQ107IDWtrWZUiHx+0Txg68dxVDxONesjeyK
        s0aNIkPy13iJ3QZqBxPiwvGLyeH3TJeaCLFreN5nzNMi60ok7+HJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1606416023;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uTNgt320O/00rSmoQk8a7jfScwAEzJBA+Inppo3b1hw=;
        b=Gg/0MK1J9+DXlSCnQcDWhOrHSNvqPOlwUve5rMhZLcp8/2jHygnf0FCAHIeC4r8NIoe25s
        N+wCGXn/T4yCIsAA==
Message-ID: <ef254031acfe25c2fccb1fb724fc7889117e451e.camel@archlinux.org>
Subject: Re: Support for Logitech g703 mouse battery levels
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Bastien Nocera <hadess@hadess.net>, Max Illis <max@illis.uk>,
        linux-input@vger.kernel.org
In-Reply-To: <f0a3e23f8e650b679fde299702685588b6cf54a3.camel@hadess.net>
References: <CAA5fPw=5SJvsYjoZDECAhHDe5XeLt-HmEvMrmgaeJ7hQMwHnRg@mail.gmail.com>
         <f0a3e23f8e650b679fde299702685588b6cf54a3.camel@hadess.net>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-6ShTEKFmjCkQBIHaGALb"
Date:   Thu, 26 Nov 2020 18:40:21 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-6ShTEKFmjCkQBIHaGALb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-11-26 at 17:43 +0100, Bastien Nocera wrote:
> On Thu, 2020-11-26 at 15:57 +0000, Max Illis wrote:
> > I raised a ticket on upower, but have been pointed here
> > (https://gitlab.freedesktop.org/upower/upower/-/issues/125)
> >=20
> > _Some_ info is reported:
> >=20
> > ```
> > /sys/class/power_supply/hidpp_battery_1$ ls
> > device=C2=A0 manufacturer=C2=A0 online=C2=A0 powers=C2=A0 serial_number=
=C2=A0 subsystem=C2=A0
> > uevent
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wakeup27
> > hwmon3=C2=A0 model_name=C2=A0=C2=A0=C2=A0 power=C2=A0=C2=A0 scope=C2=A0=
=C2=A0 status=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > voltage_now
> > ```
> > But nothing is reported by upower apparently due to `capacity` or
> > `capacity_level` missing
>=20
>=20
> The voltage is output, but it's not interpreted, so it's impossible to
> know what XX volts corresponds to as a battery level.
>=20
> Hans, Benjamin, any ideas how this could be better handled? Are we
> going to need voltage <-> capacity mapping?
>=20
> Cheers
>=20
> >=20
> > I'm running Ubuntu 20.10 Linux 5.8.0-29-generic
> >=20
> > LMK if more info is needed
> > Max
> >=20
> > max@illis.uk
> > 07803 009 004
> >=20
> > max@illis.uk
> > 07803 009 004
>=20
>=20

Relevant UPower issue: https://gitlab.freedesktop.org/upower/upower/-/issue=
s/110

Logitech gave us permission to use the battery curve in OSS software, I can=
 get
it from them.

The issue is where to put it. I am not sure Benjamin would be happy with
embedding it in the kernel driver. I think knowing that was been the blocki=
ng
factor, although I did not do a good job trying to following it up.

Cheers,
Filipe La=C3=ADns

--=-6ShTEKFmjCkQBIHaGALb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl+/9pAACgkQ+JPGdIFq
qV3ZwA/4v62PD56vt6phXiSEEWNXdoACZnIxR0pJpsJH1ZnfTxk94BfQTGxCKYWF
Euwnl7iWU2JduFgG+ex+dJtt5N32dMNEYH3hKrNbHe250DQZaa6DQQtG85ILQoS0
Je0l888cjbPDbnBZnvS2OmHWRm4JrZHUSe4T36gJVZLSdtHd3d1MUxdHxEq1qbwC
QC/yE6wtrmyvzMJj5atjcxVBr31EEKF3YF3XnbkI5qgQMO39u+hdjRsg6r07Xo68
tNsxs+OID+349eURabw2VV5jNaSuhroMEoLZc6NDq91bh4oD/74OfMIsCKH0qNvy
DHBpvSajrXmI8Apr6st0MgmbIYUkCMkXqZW7LncimsN2srnzwJtHVn3v/WOF8HU6
DoOOQ3eFZv6zYFfVKMqnnpnJszCA/GCkxM5S5tTzoPHCHE9q9BCyNT8Kc7703kT4
VmaXZRe5ZMsLErrs3RWamE/NF0fX7DknqJukAvPsLQgD94WU9w7bjqPAwEdoppd2
+tLLbADObfQ/9TpIHkVPDE45aVWx7fFO+3y758wXfxItoVCqsF0aiGYt2aifJDj/
FdA7htZP8JoV1qYmyTl2MIIeFzuBX/H+obXKp7T/PJ7DMGfCP9W1U4wDeAzas76K
l7qFByLlUKh6zTse2Oeosi5XtO9HgL9Zs5fzVbRYDOzDpCuIZQ==
=5iTU
-----END PGP SIGNATURE-----

--=-6ShTEKFmjCkQBIHaGALb--

