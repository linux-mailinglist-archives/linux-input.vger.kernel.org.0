Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1903D756945
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 18:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjGQQfN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 12:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjGQQfL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 12:35:11 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F87191;
        Mon, 17 Jul 2023 09:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msNt+uT3cT3juYdVp8ijnijxTKM75hbZi2aQnu9ECDP8aOvWB4ldOytZP5ijvFoW3ZSAJHzkK1x2y6F64VssEkr9EfTU2eBmG5w5WlenGlNlFu1L5OKUQ0HwTWHfD43futFf1PRHTEtIPjV5hXGMctpuZFoM1bFrTQBYLeb2QajsslqmCqkVCZ/tR5+r9qVhnJEJf9CeewiCAZ3aj875zK5hTD6KqehFmXzaZb+bE/oD7W6shNcTa6c/iN+ctvhQ3h1A4uLXWQ02XcwM4qw87kDK91YnopYBEuXbA1GyJ/prvye5BYnScsVjM2k8Y1gpqCGwg0wT4Nqncr1TyYO0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO43Tria0KpwGOR5/S0QvJOIe1v/jfK2g3ugTv2i0jk=;
 b=fohCSwZJEweUG8UaplAXZ1GPV1fEEkNx96BljnIVlpdBBtEhtsmo01hulSkiuBQpatkCQ3Fcnjcyzvwr5oDCu2iRxqhdOK0PVWfNKWkKrCQXtO4U2EaMWLTdOFWp1wa/N5GLbTfdVWFOx+/JnXQWYCDBFytzvgNp2KNA8RejoJJHk2xLlIwI/y0/AJEB1KDrKVTyfRcYi7CiTnhcadgIzYqKMq6J8OFjmMFh+BoRdaNmZd+6nrvsDsvehz9pdmHqCVQt1R+i65eW4TZaO3Ro1mki7t6C/8DT2Qwl3AcrBTovjURGpxaG63oILO7IzSapLIT0zKg2ghLixbiKGYi3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO43Tria0KpwGOR5/S0QvJOIe1v/jfK2g3ugTv2i0jk=;
 b=K3SuFzVyf9I+jvgiJP/Lx/W1MH+Nn7uRQexTb++SyCCMaIlUcvwPmc5hem68eKO/v/gcKK5a62woS2IxVIC3gRdQgr5mlaE/gh3Vo2YSql/GDgfxVDepGnPu/HEBRHdyBLuW2ha0Lng3i9lY9QXOsE99wq8VVLgF0sYSOGZ4Ibc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8720.jpnprd01.prod.outlook.com (2603:1096:604:158::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Mon, 17 Jul
 2023 16:35:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 16:35:03 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Mike Looijmans <mike.looijmans@topic.nl>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Thread-Topic: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Thread-Index: AQHZuLEfke7PxT5AM0ulEoLw/IRIvq++HaYAgAAHzdA=
Date:   Mon, 17 Jul 2023 16:35:02 +0000
Message-ID: <OS0PR01MB592264ADC86061AB003048DD863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
 <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
 <ZLVlIPHdmEGdG5D1@google.com>
In-Reply-To: <ZLVlIPHdmEGdG5D1@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8720:EE_
x-ms-office365-filtering-correlation-id: f63a68b4-7123-462a-f990-08db86e3c567
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UZHih55y6pE6sEIGdXHBhx1JM0VJ4ugm1CkPM1QOZ59FWQjzT6W14+W0jR6iCr67qfscjI/7kwmQayQKRArABeYFF7doJcVTumqDBpAwgwg5FU1C3Wpusm8JtiUfY9tera2WB1GVrnbygoyHWB8ERCPg7g/F62pg0uFtL2zduNZQ58HqnX+2KZmcR2gOUkME5NiwKjQdVxC40g/E6AOHd81UoxDTVjm8J43c5DnL5eDDkFohspXDruSnO5QadaBhJeR078dVxeX52rOpeWN7Bx+JsBs7tdWuO28yFl64qcCi9oZSUEnp1MOMvrwCMqthNaVfs0Rs4t1qRN3GKUuyu6GqSq8OslliKTIjMFuitF/6rAwb/x3o0eaw0NQ2+LFTgl/SZpwtPsLQ5Ltr5EjrT1yqPi3lWcFMQRDX+/2S7zpX3dPNoIyOk5mNgx/kRuhHa8l/V8ZVMUR7d57W8g2pEh4IxLdMXYQcMDjT6Ihfyr5J1OVpxn9LKNw2NuMda4+maj0Djhe9piPDFHGCxlBPcB3OwuPeLMPi127odoxXpNQRK46GuXPY7HctAOJRwFtXyh0YRp3hQKYyq73xEbeQyG9ZzgUXQkFDAjN2Hs9aeM6tNqSAmD/WwpLA1CmB8gJT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(66556008)(66446008)(66476007)(54906003)(64756008)(86362001)(186003)(66946007)(76116006)(6916009)(4326008)(478600001)(41300700001)(9686003)(316002)(7696005)(71200400001)(38100700002)(8676002)(8936002)(38070700005)(26005)(5660300002)(6506007)(52536014)(83380400001)(2906002)(122000001)(53546011)(55016003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8bZw0s8WAvjDG1Rz/Ze5tbwH3drlQNhh53DRvggrmKF2s1HVbZOmBPRkGm?=
 =?iso-8859-1?Q?NePzu34wZ7pbE74hZ1ef/jzvvJUUnoK+c8joKjDe3PkJhAabDA+dvQmHs0?=
 =?iso-8859-1?Q?w/RSDw6+StEeUAHQ1OJ6J8UxZXxAaK1kBbcxMztPrjbrg+4OxsSTTOMLgl?=
 =?iso-8859-1?Q?QaPa6GGUyxYYKav0GOfFxuqWJLiFVCHBposAh9oxn+ycRq7ZlwG9WUowCI?=
 =?iso-8859-1?Q?kDYQcIPaUaegIrDKmjbaTyoIk/Y0WhiUcFnKrDaJeWf8JSHmL2oYVWY0Z9?=
 =?iso-8859-1?Q?388zU10feWIB74FoRKPTWyGtA2/k5rDxKz8vZNxjJWFNGMstnCE3NFpLRP?=
 =?iso-8859-1?Q?7blCBBAJ8hUIAhdf5cblFdx6mzehJH79ww85n1Y+Zm0b8MB+1cr7ZuWwas?=
 =?iso-8859-1?Q?2vw9/7EchcaY1443Bwc685JfMei4h2geeiGEPnrXYbZ/ULiiJrOSVkkl9h?=
 =?iso-8859-1?Q?e00lUKkkQaxWgw0Fd4bjHBiUP3JmvFFFsZcQEvQa41AFFJaeVkJnGT6acC?=
 =?iso-8859-1?Q?2C5KbibwkztprTs6A4M6L5OZcavv0OY3C2btmdcBTPSKSBmSRqJcIV6iyj?=
 =?iso-8859-1?Q?boaiY1pH00Qx2SzGwioPhjvI9oOO85GQDjgb74ghAA+BYzWSAbv6F6iyuo?=
 =?iso-8859-1?Q?Kn7x66R3XnAIOz6ZNvyzT5exE9fQeQ36zT2SMMfeonHhFp8qWkJMf7RCVA?=
 =?iso-8859-1?Q?6oSrON/l7RAg+DjlS9Vpk+fdYNsBR8S4jqu6721j5nakGnkKVsaY72hctX?=
 =?iso-8859-1?Q?/YEEhn2+rI4NH5JGc0ykb1yJTxrJyjOIevqZXT4qscerDzlXyYnRlXUmeW?=
 =?iso-8859-1?Q?yXJsm/meD1pbXZcHeYKbRynjn5RPUxU2nKyr13qwydNddjJvFpxW/MPlJS?=
 =?iso-8859-1?Q?E3hw7GGYAfsZHzjppGRdSjYZKt9KKcZ1CX08RGOF2UOhC525g5muYpDVkE?=
 =?iso-8859-1?Q?HR2RggWrmeuaAUUxGtR3TtYDrd2BUPHVeutyn+Hm4M67GQnJFLrGRtsEBu?=
 =?iso-8859-1?Q?oYyigYOu/tntOkWoCFIxpOmp7WlFADZOI7cmuR1290SrYdedLWhEDs3ox4?=
 =?iso-8859-1?Q?z+uem3N5sG1RgpKYK2qrD7rJbxGIAQ6yob8xKtIR4Tb3eqGVJ9obd51oL1?=
 =?iso-8859-1?Q?rxNOJQ3L43dt7FRtRFiKtR4zJlMkvOzERdjq/oniyO6yCxmrloTFCxUo7b?=
 =?iso-8859-1?Q?rRdREkkEfnulcXnN/kiXc5GLlEv84DSNmyYquTOvFglsq0yaNrcydzNZhr?=
 =?iso-8859-1?Q?WSRpUc3dJge6EhOFH4epudnvAF2EK9hE2om3Bw4EiF3BDefWTDcZzV8jsY?=
 =?iso-8859-1?Q?/nYile4zZLxB92DcAajnrvye3qAF5Uoo58FBQ+Vi7ykFmSvEzd1SOu93uL?=
 =?iso-8859-1?Q?EgIWLlHXKF0Wv/Wlxy5Kn4evE5p+D7DpDn3zstNeLt7poYvJ5nEi2W/IO8?=
 =?iso-8859-1?Q?WEsdwqjzGO955jjkiUTI+3Nj2F3xuLxIHWc22TAbwX90x4ve5Hk/6/yjYA?=
 =?iso-8859-1?Q?ONsBYW5M0guyCpXVpf5+HPf3jCJtyihD/+pna3LF/d1AQJvs2knOR74CR4?=
 =?iso-8859-1?Q?9tpNxbuk1gPtkMiweq8mF3BWo4Pn4OV1pduPpaF2meMDJiBeJoropTzsJs?=
 =?iso-8859-1?Q?lF+ODUM0pleF9tgOwFSkN8rsvIm96ImPHYW64C4i72Q+PhXOCKhrgAPA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63a68b4-7123-462a-f990-08db86e3c567
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 16:35:03.0234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WismvkofBO61/qiY+8/Wq/9XoF/W8T8/+H2lNnwzNAwaQo9px5WgssSpYAo7RCPBh/BooZxQhWfKfvEANPOGw8NcpFNm/hyPH3S1mmUGpwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8720
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

+ Mark and Wolfram

> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Monday, July 17, 2023 4:58 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Mike Looijmans <mike.looijmans@topic.nl>; Andreas Helbech Kleist
> <andreaskleist@gmail.com>; Geert Uytterhoeven <geert+renesas@glider.be>;
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>; linux-
> input@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
>=20
> Hi Biju,
>=20
> On Mon, Jul 17, 2023 at 02:17:55PM +0100, Biju Das wrote:
> > The exc3000_id.driver_data could store a pointer to the info, like for
> > ACPI/DT-based matching, making I2C, ACPI and DT-based matching more
> > similar.
> >
> > After that, we can simplify the probe() by replacing device_get_
> > match_data() and i2c_match_id() by i2c_get_match_data() as we have
> > similar I2C, ACPI and DT-based matching table.
>=20
> Have you considered enhancing device_get_match_data() to allow for bus-
> specific "get_match_data" implementations? This way the drivers would
> simply call device_get_match_data() and not care if they are I2C, SPI,
> or something else...

The .device_get_match_data callbacks are missing for I2C and SPI bus subsys=
tems.
Can you please throw some lights on this?=20

Cheers,
Biju


