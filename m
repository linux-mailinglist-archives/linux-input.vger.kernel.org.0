Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF50E756C5F
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 20:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjGQSpe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 14:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjGQSpd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 14:45:33 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2135.outbound.protection.outlook.com [40.107.113.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1410F99;
        Mon, 17 Jul 2023 11:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoN6IhNVSeEMLg41bdHaTr+CxsIaLPB80kdtih1OO6QSCUiDnaRP4Y3mjuhapA61eHbOsq9twj62gC0fZJMH/AOI3iFhwNa7qtoKWahR9gRVigrrXkrY+B9Ys8pM2r9CtHRbHCd3fAzXONQfLThhPljlraUtddmjG8KgH4cn0ygb0ZgFub2YZeOLi21NdKm+oCkye+BkPub0mFjFocJWHCtV5aJWGk7wG26GyjzGhKNrebsKhhaag+z7zBp0wViItHmfBSLekX/5DGZy+/JmO6rKCt9DEYVE47yPcGsTeRE82eFHMZf6w6eCQpPRn0wdFUGiKZzM/HTT/mC9jri1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngE3hJTq2fToTLgvh8AwtKXem+L2BKx770ToOol8MWE=;
 b=SZ4UaxyR3M1ouwONNRS/tZ19UZur3dMTmJO61mxFyPxPrtKyl9jUQBJzr8ktvNgmaxNlbUuiq1OwGoybeFYo9sHVUanQiaY9esl2XjDOzkWeHKmNT+Alhpd2bI3MSXyqjj9vD1ru9y8TiwTMoJlkNeOn2+m2FFzt+jhg3ZPOvEffTXVyH1seg4xpDQCTUtwBG7Kk8tfu8PSrLSBTO8SbekphQa++HP+zvXtVgDUDnpfacy/CKy3aRgetzpp/cN4EW/um30KOX01Rgp+Uw4c/dvqe6Smxoc8bRquqKC3RnWLAA49/YF8Lr/xHPYTERNuhh6wLooPyfGcS4OEtz5V1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngE3hJTq2fToTLgvh8AwtKXem+L2BKx770ToOol8MWE=;
 b=k7InyyoXSZLVFASvpNw4LijztynoQ81997M63+itRCpuLhkYMkr3iiTcU2bY2aVWrEMxxIX4547kM0AAvMAyth43lTyfhX/KRQYTXR1m2bmC4fppNj1CsbrVslbQO1y2NnpWl7JmfMCGcxWEQssZ1rb4s+MeiwmBwEd1Zo5Aioc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10823.jpnprd01.prod.outlook.com (2603:1096:400:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 18:45:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 18:45:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>
CC:     Mike Looijmans <mike.looijmans@topic.nl>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: RE: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Thread-Topic: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Thread-Index: AQHZuLEfke7PxT5AM0ulEoLw/IRIvq++HaYAgAAHzdCAAB6ZAIAAA3QAgAAChWA=
Date:   Mon, 17 Jul 2023 18:45:27 +0000
Message-ID: <OS0PR01MB59225D8CF3E96808DD776A8E863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
 <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
 <ZLVlIPHdmEGdG5D1@google.com>
 <OS0PR01MB592264ADC86061AB003048DD863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <66228ad3-c087-418c-925f-b9fd4a60fb16@sirena.org.uk>
 <ZLWIPPAfeR1+KbeH@google.com>
In-Reply-To: <ZLWIPPAfeR1+KbeH@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10823:EE_
x-ms-office365-filtering-correlation-id: 4123d10b-5276-4ee9-172f-08db86f5fd17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jX1IKSIjzEJsZAmaIweHdnOdKOkr70abF4yMEUtUzO5vd8s3FbN6xvU/Nf33Scyx5QJrs+ZOPKm9Vm09mDUUFKdIwIFIxiGjYZn2SnozLbjV6TvUcGO5SNGk8Tg9YLo8gNxcjXqZlbymM7oV8+dOZp91rQC9zohwaE+eYo7yfAWMqIfP69q5Q2B6MsRPx3rJBA2eyVQOhOprhfEWQwWWP48qffD+qT+RG2FQkwR3brDWni/WFwjskdrI0fNFiccFP7iw9VLt0YkzuXsHgsfWN/VIGykidvLklh2SlwVqwgouRRLjb5XWa35ZzjLYmFtkLiij/zbPquHq8c/WnYMITstWRGHW4RDGvj9p9DUp26r+9SrFaz9Ah3YtexVyqzT7zpznwPuFMd5/Zuk5FGpLoM07clh0MXLf+YIFrE+cJ4P+F2FEa5c0aeOuMte3JHT7KIkay2E6tDH52dnUnO9/QYi52Kgb1pV73QAsINpm5kzYEwaIfZPTrhvTHFmc1gCkbWA2z47HenIOb8sBd22zNNWopHwru5HkfiLyvQLGQrLk9nFoDt/LQQP1FCGX3BybCiro2W92Nta934tW21bOPE5fTt02PbfBHUOor9h1aPc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(110136005)(71200400001)(478600001)(7696005)(54906003)(6506007)(186003)(26005)(9686003)(966005)(76116006)(2906002)(4326008)(316002)(41300700001)(64756008)(66946007)(66556008)(66446008)(5660300002)(52536014)(8936002)(7416002)(8676002)(38100700002)(122000001)(66476007)(33656002)(86362001)(38070700005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?n3TnjMW32Tk3tomAXfwjwhAr0DBPFMGKZ4eRi5yWVoHlBkdTpxVIgTVYgG?=
 =?iso-8859-1?Q?2+5WyVwR2M0TR2lHQpI9DbuBJNj4gaplP32OY1tBHIJhQb2EYZMi3+IljL?=
 =?iso-8859-1?Q?hTeL4nYeRiGXasOGxr9K7n7NfBkwagW/dyzH9/QVLU/cXcPsbdZfdTwIcM?=
 =?iso-8859-1?Q?VAyNAe1VWMVHCd9vLtUM6v260gnJDjULjLTASgLINylFdWFRLC51bVqDow?=
 =?iso-8859-1?Q?jWlVuyK9dHIJQB0bfuAjKyMMNUqe4YPCjISTjbh3ey6RZxWCnlgID/yHZJ?=
 =?iso-8859-1?Q?SAFNI3FtIqdBsvxAB+9Aa1e2AepqsCvNY6nYyL4XQVw6YlzWVJzS/Sl3+C?=
 =?iso-8859-1?Q?//sGcukhoxNkeVu0jW6FZMv/leuOi3wbegxATNkH8NVHVGt/zOQWRro9VR?=
 =?iso-8859-1?Q?8CreMOuKM/C1f2Csf7Y1tRTiFCsMPLO8YKjk7V30ZFmVXYX+kloilws+Eg?=
 =?iso-8859-1?Q?nnMgwKR4y0nu3BSSL8eg8pz9CxDGWKo+c+Oe7XXxqtdlJMqrD33mCmUk1K?=
 =?iso-8859-1?Q?/TC0iF2L1b1tdd8NzZggu8Mlivpj45XkF9d1m74M+oamGm1dOGA1HSsC0l?=
 =?iso-8859-1?Q?s+rQ8MzrLOLJCqf1gHEKxZIxHlxCiliKH6qjQLEtTyPVkY0qj/m4NtsRUP?=
 =?iso-8859-1?Q?R2W9lUbSLGP/qlLUsNKB1GSDLUp+TtM14zSD7jN3ybuG3Xq7jyFRtJkpgi?=
 =?iso-8859-1?Q?1riyy4DSD9lz9CgBrOaf2FIx9PewJ83TiMtaVaB4aT/xnxFFubPPR1kUTT?=
 =?iso-8859-1?Q?U81iPQt/hrZXCZkAstgS1+/CNEi4kjg789BJGFtc8c1YV3x+wnCyoLbFiw?=
 =?iso-8859-1?Q?5U1cslaHZfB/MYPURAyP+lYdwrbloPxuSz5iK1zptKkZ4/5pApqnPhRH4D?=
 =?iso-8859-1?Q?IZ2Rn+55mt3cvB9HrYQHZtQjUaeJwuLKVqdUPy4X6eg+5D8uZ+N9UropKt?=
 =?iso-8859-1?Q?nFx6CjeJkK7dvFt8WgdCArzNtAzaGKtIqGvQKgV2e1lQUCqWX35L9FXYlJ?=
 =?iso-8859-1?Q?eDTtNRphF1RZRT6dYjD95yLR5BUwbMkd4BUCafZsU5PS1wvXs1gIfD0b+E?=
 =?iso-8859-1?Q?9GC/3YBLdum4whK0RKK7KkIJBbaWZMm8W/8F86VsxQXvOXTso+hpf++rKH?=
 =?iso-8859-1?Q?Tc8qbji1W+PymzCF8Z0tMWmg56KBEEzSzoUWcdfFB5TOryRhSLifpLxneL?=
 =?iso-8859-1?Q?PhNOfoZO5K0MkDJefTHy4ZFHJcnvJuvdeOcy6oeryy/HXEfmcDVO/SqDb1?=
 =?iso-8859-1?Q?sIZ870A43wAUkBKzYKYMynzxtRC/Wxe/RJ86qr2r6130vUIIAAjSuljZHV?=
 =?iso-8859-1?Q?Y4kbt+UP1nWgLnD9uCXZ7fO2qXfVl1zv/NxBPDf/ko5Uew7HjN3F6+vwHf?=
 =?iso-8859-1?Q?9JNO5UYiUJ2+YJKjhQLLviEV1DyNNNlDcrj2DIZX5YulVipOMIphin8kaN?=
 =?iso-8859-1?Q?w06JODI7wa+hqsC810VzoDttvhHl8tdQ0lyiGuX4Xdf6uLZMVLlUyzxKXQ?=
 =?iso-8859-1?Q?X1aEsOkYuTfZTHoT/lZ5WTkcljvpoEtUWS+tGvzKXv0RTgAn2IUG+apgH2?=
 =?iso-8859-1?Q?OEFc+DCq1IOxuJIxsgSQnRc35O67OrVfwowPWDEIyqa9Fkm0GD5awObJqc?=
 =?iso-8859-1?Q?TI+hchcTseoH8L12lWLqM8pO7s7kOtWjR5Eq6Fc0210FcsdTyHSwJTFA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4123d10b-5276-4ee9-172f-08db86f5fd17
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 18:45:27.4222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9OFP2/YM9SA10hpEwQNSmI1u3UKfMpQ8nw2oRKqnE3Ne7AQj8b+LEu1+K1nk2iVb1JC5OR+RSLC0c6P63oHo0qh4Bd1BNxiDDeR91ay1Bb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10823
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

> Subject: Re: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
>=20
> On Mon, Jul 17, 2023 at 07:15:50PM +0100, Mark Brown wrote:
> > On Mon, Jul 17, 2023 at 04:35:02PM +0000, Biju Das wrote:
> >
> > > The .device_get_match_data callbacks are missing for I2C and SPI bus
> subsystems.
> > > Can you please throw some lights on this?
> >
> > It's the first time I've ever heard of that callback, I don't know why
> > whoever added it wouldn't have done those buses in particular or if it
> > just didn't happen.  Try adding it and if it works send the patches?
>=20
> I think there is a disconnect. Right now device_get_match_data callbacks
> are part of fwnode_operations. I was proposing to add another optional
> device_get_match_data callback to 'struct bus_type' to allow individual
> buses control how match data is handled, before (or after) jumping into
> the fwnode-backed device_get_match_data callbacks.

That is what implemented here [1] and [2] right?

[1] https://elixir.bootlin.com/linux/v6.5-rc2/source/drivers/i2c/i2c-core-b=
ase.c#L117
[2] https://elixir.bootlin.com/linux/v6.5-rc2/source/drivers/spi/spi.c#L364

First it check for fwnode-backed device_get_match_data callbacks and
Fallback is bus-type based match.

Looks like you are proposing to unify [1] and [2] and you want the logic to=
 be other way around. ie, first bus-type match, then fwnode-backed callback=
s?

Cheers,
Biju
