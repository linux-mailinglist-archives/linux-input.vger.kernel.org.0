Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28383186A3E
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 12:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730867AbgCPLlu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 07:41:50 -0400
Received: from foss.arm.com ([217.140.110.172]:46706 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730860AbgCPLlu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 07:41:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1695430E;
        Mon, 16 Mar 2020 04:41:50 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EC353F52E;
        Mon, 16 Mar 2020 04:41:49 -0700 (PDT)
Date:   Mon, 16 Mar 2020 11:41:48 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH 2/2 v1] Input: cy8ctma140 - add driver
Message-ID: <20200316114148.GA5010@sirena.org.uk>
References: <20200310142818.15415-1-linus.walleij@linaro.org>
 <20200310142818.15415-2-linus.walleij@linaro.org>
 <20200310170809.GC192640@dtor-ws>
 <CACRpkdZYU0zvjRC-2L-Ra=td0iUSPLhP3BFQKUTkh4POYHTNNg@mail.gmail.com>
 <20200315222248.GE192640@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20200315222248.GE192640@dtor-ws>
X-Cookie: I thought YOU silenced the guard!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 15, 2020 at 03:22:48PM -0700, Dmitry Torokhov wrote:
> On Sun, Mar 15, 2020 at 05:12:29PM +0100, Linus Walleij wrote:

> > > > +     /* According to datasheet this should be in the 2.7-3.6 V range */
> > > > +     ret = regulator_set_voltage(ts->vcpin, 2700000, 3600000);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to set VCPIN voltage\n");
> > > > +             return ret;
> > > > +     }

> > > Shouldn't this already be in DT? We typically do not configure voltage
> > > on various rail unless in very specific circumstances.

> > This is the consumer range, and DT has no facility to put
> > restrictions on the consumer voltage window.

> > I think it is pretty natural to do in the code.

> That means we will have essentially a boilerplate code in many many
> drivers.

> If we indeed want to do this (although I am not sure if practically this
> makes much sense - nobody creates a rail delivering 24 volts by default
> and saying "oh well, when driver loads it will request us to lower the
> voltage down to 1.5V that components attached to the rail require") can
> we consider adding consumer side constraints to the DT so that
> regulator_get() can set the voltage right there and driver does not have
> to? I am just trying to limit the amount of custom code in the drivers.

Consumers shouldn't be setting the voltage at runtime unless they are
actively managing it and will be changing it repeatedly for some reason,
if it's just a case of ensuring that the supply voltage is within spec
for the device that's the job of the machine constraints.

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5vZfgACgkQJNaLcl1U
h9BcQAf/WpdPWMXHrAXruGlAqtmeURtoCqMQmo288rtRHe88dvEVV3t4KOBO2wR8
Xlr3YlYpOVrTZbgwtJSlRDZ2pRRDEQhXznTCKCiBVmfZPIWGnNgHC0mcR+LPg8/z
f5y7c0uPIHFBMrFUEcbFFb8ewjfhhb9K+f4TQ3oisk+yQjLgzEb/nl69lgk7h/br
lc2/OsPEGQItxN9CinoOySeZVBSZTCm7gbUJbS2lrunUpfdlqQTrG9Qnimr8EIoM
F7EIHKJ1lI/kXYEPZm885kY66gUlEqMME0j0X7UdMntb0n4UN9xTUNqAtcdVFOjD
Oq3Uk82e+471qT1wXxsOHglyw4CVvg==
=5pdT
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
