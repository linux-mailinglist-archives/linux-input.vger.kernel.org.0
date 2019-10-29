Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC293E8358
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 09:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbfJ2IkY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 04:40:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:40568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbfJ2IkY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 04:40:24 -0400
Received: from localhost (unknown [91.217.168.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 292D52067D;
        Tue, 29 Oct 2019 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572338423;
        bh=mgWIhjckqxqZSyRbf9Ero4ZNiEz9TMOyb3Twc/C42Qw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VX+bTrWJaxeA2GZo6IMS5PC8kXNJvpeD5Q4wP4xSZ7Dr2B5qn68G1qj1p3C1WtNj9
         tgZPaKROjJoIbCD9PNoQMMTZg1tQrDhBnNx/3TihzsuYA5c+v07maBq+iDHzyr44sg
         RebUP5pDHloE7kPCl3rCVrWGqXWjBrgT+dUVSSzY=
Date:   Tue, 29 Oct 2019 09:30:12 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm: dts: sun8i: a83t: a711: Add touchscreen node
Message-ID: <20191029083012.62wgvonpxkgmznpn@hendrix>
References: <20191029005806.3577376-1-megous@megous.com>
 <20191029005806.3577376-4-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vjc7bik6lfh4bmzh"
Content-Disposition: inline
In-Reply-To: <20191029005806.3577376-4-megous@megous.com>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--vjc7bik6lfh4bmzh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2019 at 01:58:06AM +0100, Ondrej Jirman wrote:
> From: Myl=E8ne Josserand <mylene.josserand@bootlin.com>
>
> Enable a FocalTech EDT-FT5x06 Polytouch touchscreen.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@bootlin.com>

Applied, thanks

--vjc7bik6lfh4bmzh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXbf4lAAKCRDj7w1vZxhR
xVbSAQDT1XY746DPYfIud8pyJ8oPJujpzqL4+l8r1CyT6njIYQD/UIVWkNxtxcoq
K3j4wdKkaXwfIZ5fyFVqDB6uE9PToAc=
=wvMX
-----END PGP SIGNATURE-----

--vjc7bik6lfh4bmzh--
