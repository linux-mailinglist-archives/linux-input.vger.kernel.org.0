Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBB6F35C14
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 13:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfFELwJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 07:52:09 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:40159 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbfFELwJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Jun 2019 07:52:09 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BEBC2240012;
        Wed,  5 Jun 2019 11:52:04 +0000 (UTC)
Date:   Wed, 5 Jun 2019 13:52:03 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER" 
        <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        ~martijnbraam/pmos-upstream@lists.sr.ht
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: a64: Add lradc node
Message-ID: <20190605115203.q6jhjygdh4pnoc3o@flea>
References: <20190604172154.25472-1-luca@z3ntu.xyz>
 <20190604172154.25472-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hcblokn3om2o3hbe"
Content-Disposition: inline
In-Reply-To: <20190604172154.25472-2-luca@z3ntu.xyz>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--hcblokn3om2o3hbe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 07:21:54PM +0200, Luca Weiss wrote:
> Add a node describing the KEYADC on the A64.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Applied both, thanks

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--hcblokn3om2o3hbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPes4wAKCRDj7w1vZxhR
xUBYAP99OcI6+26CnXPVcHAESO3xSvwOMwlcDUPBniupbrvjJwD/YxeoVWBL+sDc
HZ5G/ReZtD85o3gkvxJTkvCG1/M0Nwg=
=Ekf6
-----END PGP SIGNATURE-----

--hcblokn3om2o3hbe--
