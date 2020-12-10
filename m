Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB952D5B4E
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 14:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388709AbgLJNJT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 08:09:19 -0500
Received: from mail.kernelconcepts.de ([188.40.83.200]:47084 "EHLO
        mail.kernelconcepts.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387479AbgLJNJP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 08:09:15 -0500
X-Greylist: delayed 2315 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Dec 2020 08:09:14 EST
Received: from [144.76.69.73] (helo=[10.42.23.10])
        by mail.kernelconcepts.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <simon.budig@kernelconcepts.de>)
        id 1knL52-0008Qn-6n; Thu, 10 Dec 2020 13:29:56 +0100
Message-ID: <724285f7c2d2544a11adfedf89aad1f9e8c684ca.camel@kernelconcepts.de>
Subject: Re: [PATCH] Input: edt-ft5x06 - consolidate handling of number of
 electrodes
From:   Simon Budig <simon.budig@kernelconcepts.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org
Date:   Thu, 10 Dec 2020 13:29:46 +0100
In-Reply-To: <X9FZFs3NZADoIhhH@google.com>
References: <X9FZFs3NZADoIhhH@google.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-Ws5Z8/jievU0ggPJF0Fx"
User-Agent: Evolution 3.38.1-2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-Ws5Z8/jievU0ggPJF0Fx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-12-09 at 15:09 -0800, Dmitry Torokhov wrote:
> Instead of using special-casing retrieval of number of X/Y electrodes
> based on the firmware, let's select default values and mark registers
> as
> non-existent on firmwares that do not support this operation.
>=20
> Also mark "report rate" register as non-existent for generic
> firmwares as
> having it set to 0 does not make sense.

Looks good.

Reviewed-by: Simon Budig <simon.budig@kernelconcepts.de>

Thanks,
        Simon
--=20
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kernel concepts GmbH                 Simon Bu=
dig
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Hauptstra=C3=9Fe 16                       sim=
on.budig@kernelconcepts.de
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0D-57076 Siegen                       +49-271-=
771091-17
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0http://www.kernelconcepts.de/
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0HR Siegen, HR B 9613; Gesch=C3=A4ftsf=C3=BChr=
er: Ole Reinhardt

--=-Ws5Z8/jievU0ggPJF0Fx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQTPAwhwx6BA+WIUvUM7Y79Fd6yIcAUCX9IUugAKCRA7Y79Fd6yI
cKkNAJ9X47tIpzA9rmLDBqWaGmWwxkHwLQCfYxfIA0F9eXbYcK3JOwYMtJv/KkY=
=dH1+
-----END PGP SIGNATURE-----

--=-Ws5Z8/jievU0ggPJF0Fx--

