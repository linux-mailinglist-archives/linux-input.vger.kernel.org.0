Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735659B1FD
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 16:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393931AbfHWO31 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 10:29:27 -0400
Received: from orion.archlinux.org ([88.198.91.70]:33726 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390586AbfHWO31 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 10:29:27 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 6C95114C6B3B17;
        Fri, 23 Aug 2019 14:29:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from saetre (unknown [154.53.1.40])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Fri, 23 Aug 2019 14:29:24 +0000 (UTC)
Message-ID: <c9acf405f4e10e587809fe88a07ffa882a6ed7de.camel@archlinux.org>
Subject: Re: [Resubmit] Read battery voltage from Logitech Gaming mice
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Pedro Vanzella <pedro@pedrovanzella.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
In-Reply-To: <e6014a01-1094-9ec7-9b37-2abdf70e305f@pedrovanzella.com>
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
         <CAO-hwJKQcTpmk8cVf-YmKu2awXv_53=qfpy2yfmy2rgMu_DEug@mail.gmail.com>
         <e6014a01-1094-9ec7-9b37-2abdf70e305f@pedrovanzella.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-xuWjDQq/RSZ7ZoquJLBK"
Date:   Fri, 23 Aug 2019 15:29:23 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.32.4 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-xuWjDQq/RSZ7ZoquJLBK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-23 at 10:22 -0400, Pedro Vanzella wrote:
> I actually resubmitted by Filipe's request, since the patches weren't=20
> applying cleanly anymore. The idea was to apply these patches and in the=
=20
> future refactor the code to use the feature discovery routines.

Yes, I want to refactor everything so I though there was no point in us
changing the patch set again. I did not review the first revision of
the patch set so if that works for you (Benjamin) we can just merge
that.

> So we (you, me and Filipe) should probably come up with an action plan=
=20
> here. The way I see it there are two issues here: one is adding this=20
> feature, and the other is refactoring to use feature discovery for all=
=20
> features. There are advantages and disadvantages to doing one or another=
=20
> first and we might want to discuss that.
>=20
> By merging this first (probably after I resubmit it as a single squashed=
=20
> patch) we get to test it a bit better and have a usable feature sooner.=
=20
> Plenty of people have been requesting this and there is plenty of stuff=
=20
> that can be built on top of it, but only once this is actually merged I=
=20
> think.
>=20
> On the other hand, by first refactoring the rest of the code to use=20
> 0x0001 we avoid some rework on this patch. It should be minor, as most=
=20
> functions here do all the heavy lifting after the initial feature=20
> discovery, and are thus mostly independent from how that is done.
>=20
> I'm happy either way, so just let me know what you guys decide.

I am also fine either way so I think we should just re-send the first
revision of your patch set as Benjamin requested.

Thank you,
Filipe La=C3=ADns

--=-xuWjDQq/RSZ7ZoquJLBK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl1f+D4ACgkQ+JPGdIFq
qV2ezw/8CXhS7XgzWsqZOz7/x3H2JtpFxmu1CUKSz4RQde8zc0lygZKJumdkJqU0
8f6FeqBwLdAM+XHZg8qM+RHeg7zoXK9cKLVxiZphxo+bA0sDvAkjvczZ7juTyVQm
oQUxrvSPUU69iUvVE7crB1IYDq49rWZAtXDMrrajXojciXmeipbqfiJZn+EclPrF
rqZ2WFzlzpeM62pWCJ2vv9fxpBHWw8lGtdYPiehvE14Ot03ph3nVhzNSH8aHLptU
bb+54QaEgDVXqyIdjvle0PUk2kRTbg+THb6anjXtaQQHcZj2Hibphnz36Pc7p1aU
bWhGtyLgX3u5wEXS9jvXxCsnqt1yZ0QHt7ri03WVVBQQqFiq2f083c3y6uoqTQRi
ya5EqpHHN1mtjLAKGodbO74n793kj5V2eLXY0TdjmrtDqluG8sPY7jm8zcU5RvBK
V3ybuLGvkd9JHlpcgH4QKJ6VtVwhWPtz1DThjF8z69bhkWsijdtrzxFg8WXJnB+G
IsnTwuZaa0ytvUa94X0160588+qK0AoMQ048EfS2M0NF9d7u41jEJoG7qK+gNzc9
3JN63STo9eFGkp6Bowzj6U/KtjqCOMKknr/pqZihyk1fSja9R6dhoWzb1BEK+gyA
KXMU7Q48jGa26os47hA4m9Th6/D1aLIx5gxFVo3JpG1Q6A6cc5o=
=G32C
-----END PGP SIGNATURE-----

--=-xuWjDQq/RSZ7ZoquJLBK--
