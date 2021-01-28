Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEE0307923
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 16:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbhA1PHo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 10:07:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:53718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231195AbhA1PHV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 10:07:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3702F64DFA;
        Thu, 28 Jan 2021 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611846399;
        bh=xk1dd2N7bT2aaQG6gk2VFDmTx80tdLgmCS2g5QD6Vfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O6Qj/jHawGkiZqPgEDvLj9ZPJP6+o8nSO8qVzILGm0EHlGi5Z8yj3Ddvbrv7HkFx3
         uLgqQN82C5Vy9RuaoKW46TXPdoh5cdTsCr7IfzLZ2sAvdoFo4B1vjAlANA+lcg5wwa
         I0JPWfOmnqbOQAczwbWWIOhOg1bXToaz/wY1SuCJfYA/5FPylqbhh/oWB76W5SPit2
         oJaHd3NyeZh6DZElOO9Sw68M+z3IERMbUjLFff5jxNq+zZXIpTXQR0WsYQVT8LRmC/
         TnaNNQjrjr+U/mC+Vw3wFUnM0QtzC2HmFS1deKAGjRuDksxGPXLfJEaKTWGy1xhLVg
         EWZsXImulRUfw==
Date:   Thu, 28 Jan 2021 15:05:55 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Lee Jones <lee.jones@linaro.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v5 05/20] Input: axp20x-pek: Bail out if AXP has no
 interrupt line connected
Message-ID: <20210128150555.GD4537@sirena.org.uk>
References: <20210127172500.13356-1-andre.przywara@arm.com>
 <20210127172500.13356-6-andre.przywara@arm.com>
 <YBHCF2tWIX4MeMia@google.com>
 <20210128104627.76b35a5c@slackpad.fritz.box>
 <20210128113601.GA4537@sirena.org.uk>
 <20210128123136.417eea7c@slackpad.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline
In-Reply-To: <20210128123136.417eea7c@slackpad.fritz.box>
X-Cookie: Do not pick the flowers.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2021 at 12:31:36PM +0000, Andre Przywara wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > It sounds like you're trying to register an IRQ chip with a somehow
> > bogus configuration?

> I patched the AXP MFD driver [1] to skip the regmap-irq creation when no
> interrupts DT property was found, but this NULL pointer now
> understandably confuses the -pek driver, and leads to this crash:

> http://lists.infradead.org/pipermail/linux-arm-kernel/2021-January/634969.html

> Hence I wanted to plug this hole, which seems useful regardless of this
> particular issue.

The driver code here looks pretty confused.  It appears to be looking up
the interrupt to use from a resource (which is what I'd expect for a MFD
child) then for reasons I can't fathom trying to pass that resource into
regmap_irq_get_virq() which is at best going to just return the value
that was passed in but may potentially end up just returning a random
interrupt other than the one that was asked for since we're passing in a
global interrupt number rather than a controller relative one.  I really
can't tell what's supposed to be going on there.  A driver should either
use resources or it should use regmap_irq_get_virq(), using both is a
bug.

The MFD for this device is also just plain buggy in that it is providing
IRQ resources to the children when there is in fact no support for the
interrupts on the device in the system.  This means that the MFD core
sees that it has no interrupt domain, assumes that those interrupt
resources are in fact absolute interrupt numbers and passes them
straight through to the children.  This means that the children will
just be requesting random interrupts in the system which may actually
exist and be requestable which probably isn't going to end well.  When
there is no interrupt controller the parent should not be trying to
supply interrupt resources to the children at all.

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAS0tIACgkQJNaLcl1U
h9AEMwf/eFfLeC/kkFhgn9OSqbusFPI39IMYbjPipgnGjB5lbEJDgqfI5u2yChVO
FlxvhKEY40Qhu4FFuT/yx16fJJi6AzPbuKuCstGQWdpO7njXX6GgF2Zecc+bvr93
MBCpXPizJnmoddwMAxQ5mKFuQUkn1QBtoFWQ+5wcAh10X4Pl3PyA3vpQgqzaErvT
qNp+eLszYjPfRlvWBWogxKtJ68tewcA1H8dHTMbGax4CfUhiKDvuZ99vjryK3Kc4
pmZSZzzi3gU33uz/zCc+Op1eqzDsXzEuznt5ip2B8UKJ9QGOEeYKU9/R8+kldKKb
iZayujeDX/cpnEggntD5az/CLmLQ4g==
=HQTd
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
