Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE8A756BAB
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 20:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbjGQSRI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 14:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbjGQSRH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 14:17:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9352219A9;
        Mon, 17 Jul 2023 11:16:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59A65611E3;
        Mon, 17 Jul 2023 18:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F018C433C8;
        Mon, 17 Jul 2023 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689617755;
        bh=HyHmCa8jY0ydQPzv7u05TVVdOZjzH63g7dIaKez9hss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EgzpfhGONL55N3s68RBp+CIj1l0JfmsPffSRA+jGvdNdYuZGrcC5+tnJkaNFqKper
         K0459TeSeTDEbwU1UkWiBY4BgQ73hWGA67nwmXErNH/9YdQkmWpnDh65g2P2CeRUvl
         aS+TQnqVTXUsKJnh6MP65+r85OARbPIsTCLO7qGk98mh+P0hWGWyxGShoH+U/BJdnk
         /UcmNxDKXqogT/epyXS+3rlK83HRVY66i/1MdkfyLYlfNNZKgtDpO4ObN6IprYa2Ot
         6kNfmwlE1AIDZlZzfcXO+aVVbM/SLkobaWfb++SS7KXT1KrZq/xJdvKLxo8jkzDch+
         U9eAvZjzSM+Cg==
Date:   Mon, 17 Jul 2023 19:15:50 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Message-ID: <66228ad3-c087-418c-925f-b9fd4a60fb16@sirena.org.uk>
References: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
 <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
 <ZLVlIPHdmEGdG5D1@google.com>
 <OS0PR01MB592264ADC86061AB003048DD863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ofmt7vuFYJJM0pE4"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592264ADC86061AB003048DD863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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


--Ofmt7vuFYJJM0pE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 04:35:02PM +0000, Biju Das wrote:

> The .device_get_match_data callbacks are missing for I2C and SPI bus subs=
ystems.
> Can you please throw some lights on this?=20

It's the first time I've ever heard of that callback, I don't know why
whoever added it wouldn't have done those buses in particular or if it
just didn't happen.  Try adding it and if it works send the patches?

--Ofmt7vuFYJJM0pE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS1hVUACgkQJNaLcl1U
h9Atcgf9FvOHC4DKivz9j4gMpo1a1pT+DqWfsScLpyHldlFkhIr3NsWHSmK3HXcD
8b/P44GIsMJZ21D8ZuK4+2i0lJiIA8fmLo6euzKJzW+2aXpFVw2NWH0doY3busTW
L+YJeP2izz9lNtFvQ4OEANdznAPGrS7b0i3xiJdTGtRsjNyS3T741vigkkwS81hM
45bZMblQZZ8MHp+US9Dx4jI8mloPE6Z8X79SiUxEx1le5xJ0AQ8Jw9PwloDx3oG+
UU+3DRb0/tzvI2FWYXSrl6HaFv1jxq9X8Qgca5MD3P7PuKAOGSNVtxBnsoD7RSl1
mCDd4EelGqdUw1NY9BuY4oecPfCUXw==
=ZDry
-----END PGP SIGNATURE-----

--Ofmt7vuFYJJM0pE4--
