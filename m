Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9AA756C02
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 20:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjGQS2g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 14:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbjGQS2I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 14:28:08 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349F51701;
        Mon, 17 Jul 2023 11:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HH3AO7xNJnqp0fw9r4iF0FApmxWf4WD9XQ1G0geujwbA5225iiBsx5SW0B2kRWHuPPS/vTBTMCmMHuLBA+jJ5srpP6YJ7Tv9KiWQUOi5UmOr/kclwHjmNCRHZhe2FmelEwczxLDy/EkJ4dC4AFN4g5s9B8iJTI3wGfllMuPIMe/Spja66VV1V1E6jCgOnC8VBz/D/S3mF9DcbARBe/5P0Xnxb9OWzrpsrlPywc6yjRb1KGub+KiGRnQnFV1DHcLLyHO/puKL/ZudqBLrTlCHiqKMuFKLmU4jb0+b/L6SXEy9t+E8cfANbK2icd4fmw+f0eqXGOSlPJ4fndCVl8Mcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZc/xB+tcLm7w/VtqngbE5X+6+jWAwddXR1TnJDpEug=;
 b=RkQLH17IaajpF7ZeHEQ3jgt6WuzwqotHCiKz+ft2kDRf8vJfOeiqILZ1ahPMA86QQCBe8hA2TbXB11/ZfTwMZ/D6xUJ+vvLc1MNE0Brega+bi1PLHeJL9qMOvVYSff3TrZxnAPxJsXKyTY3HRIEhhi1wxLKs5aq4Q1KgE8sg8Z1J8+jDU/0SCR20AqzANztI97+E6ygL3VFDeqdvfa6la+Lcqp+bHBwtCEd78hKpTW0PtPYayeH3fgESDidw5NMrBVzi5EDlPj/7L2YuTYEyGlasrKN8QVb6CdfhxQUL6hs4j8VEQLjXyiux2bYwoZXHj5tbkvKODIrfwSjZOUiNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZc/xB+tcLm7w/VtqngbE5X+6+jWAwddXR1TnJDpEug=;
 b=BCgtwAoEpWcZYfMrCXlhJl4pZVoDGf7vahbGrRImt2d1lT3ZwohodIUB64iLSsLfPgoOYlUVMlq7du/rshimZanIIqTmutQf3KUdMZjoWbpmbdJuO6jGt+Qu99vmSsrvMDHh6jyKOaWKCBgAho9MYPeyyvj1UhUNed+HaBkVcYM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11745.jpnprd01.prod.outlook.com (2603:1096:400:406::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Mon, 17 Jul
 2023 18:27:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 18:27:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Thread-Topic: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Thread-Index: AQHZuLEfke7PxT5AM0ulEoLw/IRIvq++HaYAgAAHzdCAAB6ZAIAAAsDg
Date:   Mon, 17 Jul 2023 18:27:55 +0000
Message-ID: <OS0PR01MB5922E4B92D48DDC9DDD5ACC0863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
 <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
 <ZLVlIPHdmEGdG5D1@google.com>
 <OS0PR01MB592264ADC86061AB003048DD863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <66228ad3-c087-418c-925f-b9fd4a60fb16@sirena.org.uk>
In-Reply-To: <66228ad3-c087-418c-925f-b9fd4a60fb16@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11745:EE_
x-ms-office365-filtering-correlation-id: 67270825-b145-4249-3e85-08db86f38a19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IJivOOPVazDz9OQwqOZsP7a4tb8GsWdaxlnp0PB11AgHjwpYCc9Xx2EMQloO9JceSpP8z2/02DOKuK7fmdBtMU2a4w7MnGoeNCUBAVpPk3QZbYHQjIUvhaNNm6NyMK8jq76SKKU02W82eH119kYKwXz9EHSX6OrZkqPMOnJXKyQlL76M081GqvwCckjY9Leear+qtRbOmMJsFSAodfxfXVHLot3uGaIFj18hhxLduZMaJT1zCcgBH54IW/rgNVsPoc85gl2ti7lxQVPXYbkXix3UmJINdh7q7WjV7Lhm3AeoqJSMV98aXTQL0pgWzP9U5PwsFOvd757OtRg0N+QkZ6XcVEQh3bmjnSQlnodEHbUiofdb2kWTm6227E7RWrSrygt0xb6qrQ8GrnD2yl7VCGHIWYQNUjdYVfXSoZz9zfVwCIY3Y9XX0nkK0MYpUoQEdGagqOpcGKXvlaLPhca6TmwlhgVOvGP+xrJyJzinyJg0BonNeoEmMnMqk4Kl98ndctPa00wCWN9T1xiX+fq06Ezep4h6rpMUXztOIfyzDJsFw5VVGJcaVrNImm4/YPzdwWZu7bkpl+83vheeFk9z5ULYeQEmtirX/Ht8uFNUkU0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199021)(478600001)(71200400001)(186003)(83380400001)(26005)(6506007)(53546011)(9686003)(55016003)(966005)(41300700001)(66946007)(76116006)(64756008)(66446008)(66476007)(66556008)(33656002)(316002)(6916009)(2906002)(4326008)(86362001)(7696005)(38100700002)(54906003)(38070700005)(52536014)(7416002)(8676002)(8936002)(5660300002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JmsxF4kbvd18yJvoM2yIIXKsVFwVJRTu19t8PiQpYXEzUAfhaSOhCdihCF?=
 =?iso-8859-1?Q?z/C6dKkd8UqmJj+tqWINKb+MTP2QuHAlnwiFkk7AWtNPbEvEBqRMo4fAe2?=
 =?iso-8859-1?Q?+rs5yy2v21Mu2o9NJlNcxwy05qJbdu1EyLAeQw4BMX71bqcTXXqbqMkXCL?=
 =?iso-8859-1?Q?FQDNH3KY4bVUrTeZ45oaLYwfwDAIZltFdv4dc38X+WP9UKQczr2vnu5Z87?=
 =?iso-8859-1?Q?aCo7UJmOnHNOEbr9wMNeST+64MTe703fApaRIRfiGB3aTES+3b5MPCJdyB?=
 =?iso-8859-1?Q?WH01mgWjWiqu00qkGC1gz3jwLgEcJuculgI4JRdJznPO1eMjOBdGkoLYhb?=
 =?iso-8859-1?Q?yy6pe+q/ctCul71dYPBBHedMRKg2pAm3640wTQgyImqvgFY1rqHR5O9mOg?=
 =?iso-8859-1?Q?jQ1J+ljMtuOZY9dXJEecVf6ekentQ6472vRQkLiCYIw4gkJO3/4DhOT8q+?=
 =?iso-8859-1?Q?v0jpy7Wlccp7fivILa2ioKwW/xEMRr/yWcw1ZYLpErlInCKxZwuOHm8gow?=
 =?iso-8859-1?Q?zYy6yYcLjfaF5J5IAMCAjAfG2Hp4GG+u2F00AdKbr/PD+ZfZJZ5unlOVeC?=
 =?iso-8859-1?Q?vjzhNaoHAdnJhRyRHy/8I1NqRQZM/KvdICiddi5bPKW8Gyzl4oPaF3VjQq?=
 =?iso-8859-1?Q?8uG3x365fkryVzAKAzK8F9kQYp/sVF0px0TpEU2GmlRVy5+BSgOYR9SJXI?=
 =?iso-8859-1?Q?kxkyR7UYgb5WphtRaYGyuvulQWnPUMRcIrBjv8dzVTWO0z+ziWXzw5vF4F?=
 =?iso-8859-1?Q?C4kyXnu8h4/w9eBE3RtGI0y68pf/vaXlQuiKWfXVKR4/rhenJRpQ1itBRx?=
 =?iso-8859-1?Q?zPvNyreTaPDEFBHoj/x/623EKT96VYkOqy+uhsBLjxLR59TqvMaocsomQW?=
 =?iso-8859-1?Q?WLQ5l7vJ5vbgafBGsMEMWrIBubsZSrgZmAeR8CIs8fzL7e46FGGKCXhLGT?=
 =?iso-8859-1?Q?+1hu6KAUNko5Hv8c65XutAXwMbpH981jVAo6DbVmrMJMPT61rh9B2wFIOe?=
 =?iso-8859-1?Q?hbwC1N7+LtfOorlbRr58hrI6NRFGSntHqrW0ukJtNaYvviLWS4aWfEJbqQ?=
 =?iso-8859-1?Q?sy6cmUuPzBr0qUdUMulKMk+FUqeVxz4+C5Ox0SXZrEw7BgP6loGo5THbeW?=
 =?iso-8859-1?Q?7aaYEpKisD0xUP1lrO7C4oohmd5s2fcCtOu2GuN6osZ7JetSmUkhPqXSuc?=
 =?iso-8859-1?Q?6ALfn1vBcB0HRSA2a6n3ozcaGXunVqzJmVEvTiW8pbtkRyj/YvgerWKj9X?=
 =?iso-8859-1?Q?F0S+SCaSXSTGT26I/zTntWn71ecrMk4zkGK7q/t1r7M07K59fUjp8IuZ+I?=
 =?iso-8859-1?Q?1G1gCkfV5ByPLrN9xmmWQSDh2fINEaEbcb/tY45qV23s84KNI7U46eNUm2?=
 =?iso-8859-1?Q?OIomSkbJy+GpwkH2f6dq8nyuxDfDXLj+5zOp9xBvu4DtrBgo+O0/+efmZV?=
 =?iso-8859-1?Q?dAGBSilRUtk32TFTLH6LF3LLwwJhLnqozFKtcQrxzhJoSYbm249Ma2vZV2?=
 =?iso-8859-1?Q?ySHxXxn04xRYWFmm5340zZTbmzmnaOWnjVCjBuIeSlccxmEBzQ7XpSrEph?=
 =?iso-8859-1?Q?7Jfyf72kKsxqadFgqIGMT2P1x7d+RU6jcYSz0zVimFtj52ijZ6reBTFE5f?=
 =?iso-8859-1?Q?Pg/YbLYrzp0Mfpd1Pah63KQYn0iV5I7RNXy5anzcxOsPCidz81E3gd5g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67270825-b145-4249-3e85-08db86f38a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 18:27:55.4766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPtur3J2f3s153WqHnJ9AQGtlL0JKuM5EN/8kMFweOuGKBvkr+McCAV+M8qhSD999ZJa7kSTSGuTfzMtauuowVtlSr4f8L8Qq7laLxxIbL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11745
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, July 17, 2023 7:16 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Mike Looijmans
> <mike.looijmans@topic.nl>; Andreas Helbech Kleist
> <andreaskleist@gmail.com>; Geert Uytterhoeven <geert+renesas@glider.be>;
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>; linux-
> input@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org; Wolfram Sang
> <wsa+renesas@sang-engineering.com>
> Subject: Re: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
>=20
> On Mon, Jul 17, 2023 at 04:35:02PM +0000, Biju Das wrote:
>=20
> > The .device_get_match_data callbacks are missing for I2C and SPI bus
> subsystems.
> > Can you please throw some lights on this?
>=20
> It's the first time I've ever heard of that callback, I don't know why
> whoever added it wouldn't have done those buses in particular or if it
> just didn't happen.  Try adding it and if it works send the patches?

I need to investigate at some point later,

Currently only OF and ACPI have these callbacks.

[1]
https://elixir.bootlin.com/linux/v6.0-rc4/source/drivers/of/property.c#L150=
7

[2]
https://elixir.bootlin.com/linux/v6.0-rc4/source/drivers/acpi/property.c#L1=
587

Cheers,
Biju
