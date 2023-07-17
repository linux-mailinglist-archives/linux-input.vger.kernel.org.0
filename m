Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AECDD756C76
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 20:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjGQStZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 14:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjGQStY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 14:49:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270579D;
        Mon, 17 Jul 2023 11:49:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A3C3611EC;
        Mon, 17 Jul 2023 18:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1178C433C7;
        Mon, 17 Jul 2023 18:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689619760;
        bh=CkH06hP/t3of+YL0sdFM+rCrfgflqr7u01KK3AS2yXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U7GIMClvmreMUu8QudGbqUMHrmkmn1rf2xW6BK1SVIYB5ojTRMp6oN9n0Ur5rdzW6
         VWWwAkZuWL163KmcKRLKdd9+rBjGwO16GJITyZ1CMXm3QXgbfxi/ng8PGWX7+QKUka
         mJ+Rnfd+fUMBQaISlM/kMDpPmKBWbpQDuSY8/gh7bfMpG2znIQRwTXK9LvfRCn07WI
         3zY4dotpviFANe4uu1IYq+4kEJX448P883DhC9T6zI5Zrd+XaiGYE+by2ve+uVyySj
         IntSj7P3XdwMI37cjZ5GsUQ/uDLxWVKZIc1dGFRpKBcTJgVSlsubFuwQoTD9e9Xgdg
         lB08HvAT/riBw==
Date:   Mon, 17 Jul 2023 19:49:15 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Message-ID: <c65f190c-84d5-4a57-9f10-46e3e0d4c6b8@sirena.org.uk>
References: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
 <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
 <ZLVlIPHdmEGdG5D1@google.com>
 <OS0PR01MB592264ADC86061AB003048DD863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <66228ad3-c087-418c-925f-b9fd4a60fb16@sirena.org.uk>
 <ZLWIPPAfeR1+KbeH@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yVAgrhSNNXI+gTku"
Content-Disposition: inline
In-Reply-To: <ZLWIPPAfeR1+KbeH@google.com>
X-Cookie: Not a flying toy.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--yVAgrhSNNXI+gTku
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 17, 2023 at 11:28:12AM -0700, Dmitry Torokhov wrote:

> I think there is a disconnect. Right now device_get_match_data callbacks
> are part of fwnode_operations. I was proposing to add another optional
> device_get_match_data callback to 'struct bus_type' to allow individual
> buses control how match data is handled, before (or after) jumping into
> the fwnode-backed device_get_match_data callbacks.

Ah, that explains why I never heard of it!  I can see that being useful
for providing a single interface to pull mach data out of in drivers.

--yVAgrhSNNXI+gTku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS1jSoACgkQJNaLcl1U
h9DchQf+Ppz6H2BKJpUATXf72bKqMIPpwOxP7XGFdf921vyBmfoYnw2QBkYLp3gM
Rq/VxEM9O7svwl+87PtoE61+UNTpIPbVNLXSkOuf/LpxT7e5mCn+o6z34LmFgHdY
jeeTTsBJwOwt5INfIHw413d70qRe75qgqXNYYxoIIuRoPlh/EuGzkwpWbP/xFlx+
jcCEkhX0xZmO8wPVoWlPobbZCatoF0v1/YWFqVDTMu8wGzBvoV9DNn+0FzznBfvQ
gNbwYQBVOptHbjKzF1LAFJ6BWaSdJR3RB6Gm32bzaCiSQ9EwdTcB8NVwp6n0rRUs
gRY9da/S81vPw1wweRzmR5ewa/5T0g==
=fSNG
-----END PGP SIGNATURE-----

--yVAgrhSNNXI+gTku--
