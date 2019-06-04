Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8361434B9E
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 17:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfFDPIO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 11:08:14 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:47186 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727822AbfFDPIN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Jun 2019 11:08:13 -0400
Received: from g550jk.localnet (80-110-121-20.cgn.dynamic.surfer.at [80.110.121.20])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 86472C5AE9;
        Tue,  4 Jun 2019 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1559660890; bh=zaAaHqRh524jBgxUSZGEHXD3aaBdPWcefSF2HtJ/9iQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=AjEsKnAHmL87BRiX9xgo2aImU9EqSkkVH3yVyQAJqw1uOeyMqmHblkFu2DiT0u0Ir
         rlqAsEKr5k13pjZiih1v3/L1SvCjlA54Sy48/3UO5cnQW31O07hfV/+gi5Mhudniul
         qVSTol9I3tVYwL18RzvW3APMYmOmMvqZZw5bNYzk=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
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
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date:   Tue, 04 Jun 2019 17:07:57 +0200
Message-ID: <1832388.aQYCy0c1Lq@g550jk>
In-Reply-To: <20190604145907.j3fp52gxupd3bkih@flea>
References: <20190604144252.26965-1-luca@z3ntu.xyz> <20190604145907.j3fp52gxupd3bkih@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2909352.anXG0Hpojg"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--nextPart2909352.anXG0Hpojg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Maxime,
sorry I forgot to mark it as a v2 and add the changelog to v1.

I've actually not split the patch into two on purpose as it's a pretty small 
change and the patch adding support for the A83T didn't split out the device 
tree changes - and recently in another patch of mine, the extra devicetree 
patch was squashed into the driver patch by the maintainer while merging. I'll 
fix this up asap.

Luca

On Dienstag, 4. Juni 2019 16:59:07 CEST Maxime Ripard wrote:
> Hi Luca,
> 
> On Tue, Jun 04, 2019 at 04:42:53PM +0200, Luca Weiss wrote:
> > Add a node describing the KEYADC on the A64.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> 
> You should have a changelog detailing which changes you made to your
> patch with the previous version, and why you made those changes (for
> example because we looked at the a83t datasheet and found the two
> controllers to be very similar).
> 
> > ---
> > 
> >  .../devicetree/bindings/input/sun4i-lradc-keys.txt        | 1 +
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi             | 8 ++++++++
> >  2 files changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> > b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt index
> > 496125c6bfb7..507b737612ea 100644
> > --- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> > +++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> > 
> > @@ -5,6 +5,7 @@ Required properties:
> >   - compatible: should be one of the following string:
> >  		"allwinner,sun4i-a10-lradc-keys"
> >  		"allwinner,sun8i-a83t-r-lradc"
> > 
> > +		"allwinner,sun50i-a64-lradc", "allwinner,sun8i-a83t-r-
lradc"
> > 
> >   - reg: mmio address range of the chip
> >   - interrupts: interrupt to which the chip is connected
> >   - vref-supply: powersupply for the lradc reference voltage
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
> > 7734f70e1057..3a42352b5c9f 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -704,6 +704,14 @@
> > 
> >  			status = "disabled";
> >  		
> >  		};
> > 
> > +		lradc: lradc@1c21800 {
> > +			compatible = "allwinner,sun50i-a64-lradc",
> > +				     "allwinner,sun8i-a83t-r-
lradc";
> > +			reg = <0x01c21800 0x400>;
> > +			interrupts = <GIC_SPI 30 
IRQ_TYPE_LEVEL_HIGH>;
> > +			status = "disabled";
> > +		};
> > +
> 
> The bindings and the dt changes should be two different patches as
> well.
> 
> Thanks!
> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


--nextPart2909352.anXG0Hpojg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE66ocILd+OiPORlvAOY2pEqPLBhkFAlz2iU0ACgkQOY2pEqPL
BhkUqQ/+LT63fs1EFL67wFkz1sDABOyesiVfTNGHeZxt7U3iBZKMlWr2imGwPypZ
FZkdHq5CgOTVceNoMvxJtaKFNuewU75VUjGo5bEw/+hO7qdawpu7oni+6BjOaPGY
3KaDj0GxNELe2wO6ZBcvfJNrgc2IoA6lkTDWdGqkchTO+bb824VGZmeStPfGRAAg
UXcjmqeQ6UfUZN7OMSKD82VOXNsG55xxLZwGFBIZlw45vZ9+wVEJhPAQFmn6V03V
y5CHvQYAQ9zOpvPe4DQz3ruOZm7Od+bUEMUP0W2hYVig0l1rkzUMPEEXsrcAY7al
ow3Mw0J2wMHy7WN6Tjx1MO2C8eTLd+D1e8VfqulEtA/4oy7hvXpiIjEKR5HwQb3P
Sdk/eWGhnrDLcWZ0tcpP7P5k2k6OrKJzlvaZ3Qiy/sYifBYzM1p+LX3V4WAHGoYx
5c8vt4XnmGYZN3zyDWnDW/gbpyqNal0PvtiDjnzglFfaYOn+smu8KOB7yJaBzPuT
+F/ziMdUpiTHvIwbGr/5iNi2stbTp22DE2b86w9JtPJanuLvibQ0Ub/iZXgWR+6j
GDwAaH0fqhqBoq0dqWkB3LU0dDnjWN4v+ADShF8NYkMBXcCFoGDNlRMrlEmltSM+
al4GF+2ykyt8QQWDYfBu5fp/ZT0P7XzEo+Cb8SeUOSqZNxXOG7E=
=Q6BY
-----END PGP SIGNATURE-----

--nextPart2909352.anXG0Hpojg--



