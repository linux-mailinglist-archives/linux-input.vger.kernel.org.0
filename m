Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455AA423887
	for <lists+linux-input@lfdr.de>; Wed,  6 Oct 2021 09:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhJFHKd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Oct 2021 03:10:33 -0400
Received: from mail-eopbgr40080.outbound.protection.outlook.com ([40.107.4.80]:6468
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229627AbhJFHKc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 Oct 2021 03:10:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYMET4jWlaNuPSSyWgthwE17DHEfkBXhS2nKupsVjbO3GpAFGphk03YppVlL8I4fU289QpdOrlRw1TuTcR8v6J8/N2X0JWpoc+POP70TSMxShEGPFUu7CL/aOAYr5ldVeCnECbhLoPp4RoAiF0On1yrCqtZfztlLzTsFCr9ZXmDFcYaAbAYaSLlc4jbRP5MW9+XwEC5uSzjgmJJbXmkF/lfvNdarj3n6/R6VyvDn6hl/WwrodYa515zokcgPVAFxTaFI9UxW3eHkizCBQmk8eTsYM7sXpufA6AUGleGA1WgzXaQwZw/Onf+qyZwupY5btLyX5WfKya8y5k/jqEZHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XvBYB3RS6gRUGBVMXhHoY/BocOyUbq1b+6U9cc0XrY=;
 b=BO9Hc5sh/2GEPE58lpawD+EZxhCFqM6P0O/LajktEjqwINGZWI+KQYW78HiCHS4jmV8y2XnLBjMvC/Fqg7dD5UNWTT5oZsHwFl6pl0AglyKmylCI11BB8sNoopBSEECFO+rILtAs22pBARX6Lcl8FsFEbzP8ksQn9WnotHNmCN4seRAmAtgZTKfE2K7vXn02Wc/qkNeLCtz1j+GnfV3FPKWwBOXbpkyZhoz/CHboUj8jbPli/H9OHBrowNMrzNLcMkpni6i0B7xQfZVgLTsJWF7BbJ37U8FX8zNQaTnOH7QUcOGRZqVWczQVKV1slSUZ6qR+WQmTnaEpavElqPpzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wacomaad.onmicrosoft.com; s=selector2-wacomaad-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XvBYB3RS6gRUGBVMXhHoY/BocOyUbq1b+6U9cc0XrY=;
 b=P/mV+UlsEpRamzJuuShs6qJ18K1uJLq18fZktZUPiY20dtzurrZ7K8ZanMDZgczQ1IScGyWqn7/hflipbJnGarBkfSdBfpYieXTRJm3ZfgXv2FyRmduUBTlQIoxZoioQlYKlD+NeR2BwBnI0bmeyzNI2BT0xRKPOE0WrHYaVZtI=
Received: from PA4PR07MB7407.eurprd07.prod.outlook.com (2603:10a6:102:c2::11)
 by PA4PR07MB7648.eurprd07.prod.outlook.com (2603:10a6:102:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.8; Wed, 6 Oct
 2021 07:08:38 +0000
Received: from PA4PR07MB7407.eurprd07.prod.outlook.com
 ([fe80::8b8:5840:343c:5f99]) by PA4PR07MB7407.eurprd07.prod.outlook.com
 ([fe80::8b8:5840:343c:5f99%7]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 07:08:38 +0000
From:   "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ping Cheng <pinglinux@gmail.com>
CC:     Alistair Francis <alistair@alistair23.me>,
        "Cheng, Ping" <Ping.Cheng@wacom.com>,
        linux-input <linux-input@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Tatsunosuke Tobita <junkpainting@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alistair23@gmail.com" <alistair23@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
Thread-Topic: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
Thread-Index: AQHXnLcSGNbhzjpyfU+C3ejRk0O6iquMhiMAgAPPsbGAB82JAIABhySAgAAIUwCAAwTnwIApDnTg
Date:   Wed, 6 Oct 2021 07:08:38 +0000
Message-ID: <PA4PR07MB7407EF5BE9140753388E12C187B09@PA4PR07MB7407.eurprd07.prod.outlook.com>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-7-alistair@alistair23.me> <YS1DGuTTAEKAd2Yr@google.com>
 <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <YTcBOskPYjbv4q61@google.com>
 <CAF8JNh+PcYuaLL=ToS0hOT62YbVmMWY9BCT-CGx_x+AkKuO_Tw@mail.gmail.com>
 <YThQUtE757b/ExR4@google.com>
 <PA4PR07MB7407540AC0904ADB6D58A46487D69@PA4PR07MB7407.eurprd07.prod.outlook.com>
In-Reply-To: <PA4PR07MB7407540AC0904ADB6D58A46487D69@PA4PR07MB7407.eurprd07.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wacom.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a404bb6b-3a0c-4466-c8ca-08d988981f05
x-ms-traffictypediagnostic: PA4PR07MB7648:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PA4PR07MB764871A9424D75F871A6FE5B87B09@PA4PR07MB7648.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iDljMguCeZ5jaY+k0h4qXZN+eOTLZDPIbsWJ9Fu8H0siOIpdeoTq325h94MnhuQsq+G2RbSdTpHlATr3tlOzMtS6yw1OzDCglssqvkR6SKyFcdDusgHyJZSj8sQfISEk2wXoO6MobL5aXZZR96eb0kYFCronuaExCVZ0rymaURRpHG7eVgzYfWHZadzDJS9i1fZndwfUrMUOT0iZOhFG4bVrcTEM0r6gBWE9wt2VZniBcL/FyHamqlfMYkq2fgxwzTjqbsnppLt0KoVEtGdNy/dneMJz3IY4jefb9vyymBJ+cbYies6QRsh8PcT8epQAogucgJnTnInnaEhjcU1s2slqh12uyeozWlfT69gMo6h4DnSdxiyO7hvszI2qAaSeIqJiLc233s2a1Ft9UIti9XZXtZA0DpzZddMX90TBG/RZVFqbeIara8vHbgSWpaIHOcSi5yYt04fD7vZoqeKenJS2edrjjrUrTfCRaJ5QyWKc6bKk3BGjtnZSxPQF8X7maaBqI6PBNo9yvast2amTBHjHk+bglES6uNQgfCccLWYG+IhO1knQjO2ZHGYDB1pe50VihU50idT2rWqVzxmO2rHfoN+pP/akgSG7GHvN0uTZ2m135drSs5EJMm23ENzsZkD0rsJebibk0BZ3pH9OQxh7vU0yB2FMHQL8Br5JoHoGLtrKRIZ6evHd6G+lVzLRI1oItd6zNrT0dHMrDM7Xqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7407.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(86362001)(4326008)(7416002)(6506007)(33656002)(66476007)(66556008)(64756008)(66446008)(9686003)(76116006)(66946007)(8936002)(26005)(8676002)(53546011)(52536014)(7696005)(186003)(2906002)(71200400001)(55016002)(83380400001)(5660300002)(54906003)(316002)(110136005)(38070700005)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UndIWtQ2+9kIbO9bcjshXuo25IRI8/z13FPVtGg0Pf6qID3rUVzZggcvNvfd?=
 =?us-ascii?Q?XbP0eo/ZoOJAAwUezFU11sJhfmTQcgyYIo9fE0VB5klu3f2+Hts2FDbHxYyq?=
 =?us-ascii?Q?3IN9GxnBcn3kdF/LqJQUNDTkeo3+ABCNCzKK4QmUdc70KmnTlB1FNRPT507m?=
 =?us-ascii?Q?EpLS3V9j/4fevl0bcd/p8XbBofdKnREajuEL9NJYb3iD0Ty6UOLtPrCKzxbu?=
 =?us-ascii?Q?xjxwy+BrLh4gDN8hYAGzLgx79NMVTb9YJ2ShH5HQKePum4B009rhAdce5EnF?=
 =?us-ascii?Q?snf3VQFCluhxvkEiqRnqmHK+hQHbn0tyVM4l9HlWPqoLd1dxTW8RsFL4DuS9?=
 =?us-ascii?Q?GXI1g2N1szc+Dx84pqNwJM3SrGjOMAHOOiIfVHnhga4YxWbkrPvPIGhOq1hU?=
 =?us-ascii?Q?+lwRZPCm6heSSK5Z8OutgXyfkJakZf98o1EPs9xbv9vcu+G2cOtmNCR8wSa1?=
 =?us-ascii?Q?ReruZaidyEiYE7rgCPZYE2n9/UvlRaOSb6CuedlHdRSWN/+Lsl7vWoYyySFj?=
 =?us-ascii?Q?xpkS9Xcb5HGlUbmemuZnSOM/9ofNWjRC4GAOCFHoZ+m8ATkacfYh+SXyQHxN?=
 =?us-ascii?Q?aLhHRRdfLeReU9uZGGqYzQGcOSG/Yyh1no8Mzla/slOx5hJLJnmn8om4AwZQ?=
 =?us-ascii?Q?twcN3nY4he8+4ir3lnzvIzn4Cwhb07yl4NBYt0EFZEE0Z7GQJ4km0FKzcYoh?=
 =?us-ascii?Q?3iqdNMXtUSuL7Mo4MFJfX+Nqib3ZZUuobHrysE6nIJT/IRNEfVZplCXNg7so?=
 =?us-ascii?Q?dMHQROhaHvnTsEs9/zhFJa9KCq/qOaLi+nCKGVpmK6/5Sdj/GaRaqGfYjNIc?=
 =?us-ascii?Q?tbp7TKjbI6SkRsruqu1sAxZ1CeHX9WKaRSjXnnuVzcsJI/JWpztSn+dc7nWg?=
 =?us-ascii?Q?Y3+B8jHDkBBH3ylKQ4BCvjAw4NpJFLguAh3JXrhaapKZRAAegwGuO8wzFhxX?=
 =?us-ascii?Q?m8djDYdyKu/SqWSH3SnxdAhEIByOefvPyyXN3H+ivwccB0/Wrg7UUM9Om55Y?=
 =?us-ascii?Q?sl1Pmv3HSbMjPHLzKneQIENXUK9TL1805YYJtjPhc9VrLSvhKDBlqMykU+Yt?=
 =?us-ascii?Q?/Hr8ylA0BrrSJszy47kBvUeXQIM19Qc5YxuBZDUpAkg2F3TdOghSKsqWzwi+?=
 =?us-ascii?Q?NcnEgpUawKv+o5gb4zKidv2nvs4qeahnGIS0WC1WW3CDAcox0H6m+bMKnP2N?=
 =?us-ascii?Q?5E5CByPIc+pRc48ZygyMTqhU2ajgnlRFv6OAnXogps3K4Ny04X9KIDGNvakP?=
 =?us-ascii?Q?Y6quzpyHzxGnXKscxM9IAwAtc92DHMMtTiAacy6ebyi0vjyqrtc0l9OlhX/O?=
 =?us-ascii?Q?yRTFRFnfgZAouEp8q16mkCSS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR07MB7407.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a404bb6b-3a0c-4466-c8ca-08d988981f05
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2021 07:08:38.5051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jL43RGVvSzb32gGP3urIXmlI5ETwp532VhigoF/0WveozgU18uodTJYruFlzSwvznDSyqjVPOmPz8/rAvO8uRfPOiMq+QZaSJVBAwh7x8t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7648
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

I now understand what you mean. The understandable example is USB. The most=
 of the recent drivers for USB devices has bee released as HiD driver.
That said. It's glad if you can have comments too about my questions.
Especially, when someone doesn't want the whole HID driver, but a single I2=
C I/F'd input device driver.
And also, I want to make correction that ***not*** all of our devices suppo=
rt HID. Some old devices do not support HID; that's why I added the driver =
in 2011.

Thanks,

Tats

-----Original Message-----
From: Tobita, Tatsunosuke <tatsunosuke.tobita@wacom.com>=20
Sent: Friday, September 10, 2021 1:10 PM
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Ping Cheng <pinglinux@gmai=
l.com>
Cc: Alistair Francis <alistair@alistair23.me>; Cheng, Ping <Ping.Cheng@waco=
m.com>; linux-input <linux-input@vger.kernel.org>; linux-imx@nxp.com; kerne=
l@pengutronix.de; Tatsunosuke Tobita <junkpainting@gmail.com>; linux-kernel=
@vger.kernel.org; alistair23@gmail.com; robh+dt@kernel.org; devicetree@vger=
.kernel.org
Subject: RE: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor value=
s

[EXTERNAL]

Hi Dmitry and Ping,

I understand that we should stick with HID as much as possible.
However, there're certainly situations in which some do not want even whole=
 HID, but only an individual functionality for a certain device.
In that case, they may not even include the bit of the HID, but exclude HID=
. What about then; what they should do without HID?
This would be also the questions if such situations happened to other vendo=
rs than Wacom.

Also, what I need to add is that the early generations of our I2C devices d=
o not support HID which is why "wacom_i2c" was added in 2011.


Tats

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Sent: Wednesday, September 8, 2021 2:56 PM
To: Ping Cheng <pinglinux@gmail.com>
Cc: Tobita, Tatsunosuke <tatsunosuke.tobita@wacom.com>; Alistair Francis <a=
listair@alistair23.me>; Cheng, Ping <Ping.Cheng@wacom.com>; linux-input <li=
nux-input@vger.kernel.org>; linux-imx@nxp.com; kernel@pengutronix.de; Tatsu=
nosuke Tobita <junkpainting@gmail.com>; linux-kernel@vger.kernel.org; alist=
air23@gmail.com; robh+dt@kernel.org; devicetree@vger.kernel.org
Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor value=
s

[EXTERNAL]

Hi Ping,

On Tue, Sep 07, 2021 at 10:25:43PM -0700, Ping Cheng wrote:
> Hi Dmitry,
>
> On Mon, Sep 6, 2021, 11:05 PM Dmitry Torokhov=20
> <dmitry.torokhov@gmail.com>
> wrote:
>
> > Hi Tatsunosuke,
> >
> > On Thu, Sep 02, 2021 at 07:33:49AM +0000, Tobita, Tatsunosuke wrote:
> > > Hi Dmitry,
> > >
> > > Yes, our firmware supports HID over I2C.  However, some of our=20
> > > customers often do not want to use HID to handle our hardware;=20
> > > even they don't install the generic HID driver neither.  In such=20
> > > case, we need to distinguish what generation of our device=20
> > > customer's has. And to do so, we check I2C HID descriptor even=20
> > > though the driver is not working with HID driver components, but=20
> > > this one.  That is why I2C HID descriptor is used there. It is=20
> > > called, but the situation with this driver is not supposed to work as=
 a HID device.
> >
> > I would like to understand better why the customers do not want to=20
> > use HID.
>
>
> Those customers normally run embedded Linux. Their hardwares have very=20
> specific use cases. They don't need to support any other HID devices=20
> except the Wacom i2c device.
>
> >
> There needs to be a _very_ strong reason to essentially duplicate
> > HID layer in a vendor driver and I inclined to say that such=20
> > customers
>
> would need to patch their kernels themselves.
>
>
> They most likely don't want to duplicate HID layer. They just don't=20
> need most of the HID layer code.

They just need touchscreen support. Plus stylus support. And maybe battery =
support. And maybe something else down the road... And they need to introdu=
ce DT and ACPI descriptors to be able to mould the behavior to platform nee=
ds. Which is pretty much the purpose of HID layer.

> wacom_i2c simplifies their deployment and testing process. Most of=20
> those customers are very small companies...

And now please continue this train of thoughts and consider every touch ven=
dor. Wacom is not unique. We have Elan, Cypress, Weida, Goodix, etc.
etc. Vendor drivers were acceptable before we had I2C standard, but now it =
is much better for everyone to share the efforts and use HID instead of rep=
licating it for every vendor.

Thanks.

--
Dmitry
