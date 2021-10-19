Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2DF4341D7
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 00:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhJSW7x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 18:59:53 -0400
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:36200
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229483AbhJSW7w (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 18:59:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h34d4FvQeMWiufEBKbQDD3PfwNDQu61jeMyl41wbUhBsec2ndnagodvTZIb73BuoZP0RUVCTUbQNltIW7ieymY+O2QWW3q00Cruxx4t3PejrdR9YoHUnKemhFO8p9uBgtvgoFdvPRz6pMhrx0hjwe1phO+c2Twn5Qqas5aub0kYcRFIeuhgVzVlQQhvrPlm5PDEUxqx1Vh7wU/8hh0DLW74vXwYzLqhi/nGBROUQJvklYQT48Gdq0TexDmg461+H3odTvg9glvTG8XQdgz+sPpZe4xBcvL++7i3qZdUsHSOJX9n1t2f9KkV2e4woPR/xKKAs2N1XMkR2PVYlqwlVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyJdeTqjbHQcH8HJiW6MatwE1WWzOzSvViihFdPiJOQ=;
 b=Q7cofUYlkw9Xbol9q+BIbHRo5umNu4SE02H1O7Z7Q0gxO3OaxSVgSfDKV3QcR1eerNdPIR9AjvjGYxLocPTTUGFydK0aN9nVOJUByw1FGpJxIf31xhbyxh2Rxuq/3yl3RsiOujYO3GlsFtKt2ICe6Z7lgYnduIeN0tcqHSj/U70lZU6/1VTEuejAy9lYiCmFo50zlaPO3I8kxwuZDG/a3R+UZaf2Z9JHyHd58ZFrO1pqllV6jhdDjMQEWPlZfpnZdAUXvUyWgz4Oh9WK0zi2z8UCFxwZO/3jnZh/ELHYalNCjvY1hzSc+HupG8+cU6pb3kIDreRZEME7/KOY5wOqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wacomaad.onmicrosoft.com; s=selector2-wacomaad-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyJdeTqjbHQcH8HJiW6MatwE1WWzOzSvViihFdPiJOQ=;
 b=nmPJHuet8SuVXgJQ3GOJubsxh/zerQvxY6IHpIsmKA80J5ufSCVFIgQ42z80Qli5s5zptNJtsyagdC1mnlCh0CuOk5029YbIo1elKmoJkOLggWiFrww7CGlBAKaSDSaUxQsXp1UKZOa6IEuXgaSPRHAaytvyDRnnxLMri/MuQOk=
Received: from AM8PR07MB7396.eurprd07.prod.outlook.com (2603:10a6:20b:24d::23)
 by AM9PR07MB7057.eurprd07.prod.outlook.com (2603:10a6:20b:2cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.11; Tue, 19 Oct
 2021 22:57:36 +0000
Received: from AM8PR07MB7396.eurprd07.prod.outlook.com
 ([fe80::65d3:ed38:b118:fc4d]) by AM8PR07MB7396.eurprd07.prod.outlook.com
 ([fe80::65d3:ed38:b118:fc4d%3]) with mapi id 15.20.4628.015; Tue, 19 Oct 2021
 22:57:36 +0000
From:   "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ping Cheng <pinglinux@gmail.com>
CC:     Alistair Francis <alistair@alistair23.me>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "alistair23@gmail.com" <alistair23@gmail.com>
Subject: RE: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the data
 values
Thread-Topic: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the
 data values
Thread-Index: AQHXvQLkRs45KqGVP02BAT9/lvnGjavZnY8FgAFeRDA=
Date:   Tue, 19 Oct 2021 22:57:36 +0000
Message-ID: <AM8PR07MB739659D037054A3B1EB2647087BD9@AM8PR07MB7396.eurprd07.prod.outlook.com>
References: <20211009114313.17967-1-alistair@alistair23.me>
 <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
 <YW4kgnI0DQHj4sw4@google.com>
In-Reply-To: <YW4kgnI0DQHj4sw4@google.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wacom.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c76167c2-a57c-412e-1576-08d99353d7cd
x-ms-traffictypediagnostic: AM9PR07MB7057:
x-microsoft-antispam-prvs: <AM9PR07MB7057ED4B89AF0CD7CE01643487BD9@AM9PR07MB7057.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3/UoTbaKrgzzmlp3/8ElVNN2/4pyhHWeKILP2ZF860pqGojh/kP46eHbHIm6B6ik1R6ujgHX2VpCOkgiAiQUUP/XEZQI7Z5l1jUINLi9LYttNBnksKaifKC9tnkvrR+Ua/bJ5wB9a4IbggLUKwwJTxfQIXuk0+SY5ZLKvR99INTMxJm+I7dBVgIiA4BhIxRj8WEXny1ZW6gYM6djeLzuTGviJvAdMg7o4XuJGW4Zb7INY0GSoZCrN1uRBaL0QY+uzM8c8bFocMrevgGYLz7n3nZqIyIxdpDIeUmSqzofXvcEkcWfm67EbfEmLagWqXMdJdO69uUC/0+6TbNVRg6SOg4hOb9YppIW6mS5BlGcG+aVoKvPhh9ti5c81gGMXD4N1N6X7GRqt/ofYnrwF6Y7KuQwxQajS0Pm4DsjSv3ZW/8raAIfmYw72MBqyjaegjZMDiweBljpLyKnb5bcGYpPuuffKBjjouYP3CdQcLSgh+n/XDR4GB16Ns3WxI6lLsDaYnh32FSmg6ExsCe3PVp7YH+/KKzW2MhokgJ8n2nd2+40sdnsrxfZuvcETzy5a6Rmg3zMBSlPKl1NbWZOYCcRpPsa2bZE/daBEmud3VTAuN+8Pt6NmC0ReNNaBAZ0LurPwQEydLQhsUXqv3Ut3XWZZeQ8Jj2G8t8AyDgwmcdSQDaJzenYzxQRVZ10ujLC278DhBFvp8DCIn7RqlPOG7YHUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB7396.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(4326008)(122000001)(6506007)(186003)(52536014)(8676002)(8936002)(83380400001)(55016002)(9686003)(26005)(508600001)(71200400001)(38100700002)(86362001)(38070700005)(2906002)(7416002)(5660300002)(33656002)(110136005)(7696005)(54906003)(316002)(66946007)(66446008)(64756008)(66556008)(76116006)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PTxBnpWtz//eYVtzaLMaDHbwjUS1JTnfBwyGM2nlWFuCDN6TWkPtdBxABqQJ?=
 =?us-ascii?Q?JrorHJX16/QWe8mzF0Py0/jdrd2zpNfwHxLpSjioaEoVwHjRq2lpP6wCdQZX?=
 =?us-ascii?Q?tg1yCYwpsO12xHm+Dn7Tcx+MQOf9PT4q7WoRxaM5woB94uIqBO3tM54epmch?=
 =?us-ascii?Q?CO+/ASFU8LjRdBk7n0HL2ANNTZwb6l9Jlzh8FQFjhMxZzDtuqWoW8TJiYa9X?=
 =?us-ascii?Q?GutK6vJMVdF9rya0jFuBF5T6r14UOA/qTgLgyzOWk/tjBrNEOBqyLxkuG+EO?=
 =?us-ascii?Q?r2MB2ERkU3Iw/CoVvIlQCt+JUfoNSD3FOqUCddk9Lc/g5WvFKguYxC6p1oBR?=
 =?us-ascii?Q?K+ZNbp6p3XjMy1ub+6KO5wMP1iy3JYpshlpDdfue0m1uzTD7zkqsLkvjlhcn?=
 =?us-ascii?Q?udiLgp5XI+KOKa29bBJSZ+24/ow0R7qlvQaDCIlfU8AF+DzA3xL7/EgKWttU?=
 =?us-ascii?Q?wXatJJKCdvEcmRoHXdpGzxfd9q9afVv6pq+8e30fMxVcm2J++zczq21FobH9?=
 =?us-ascii?Q?KQo/t/FsOC8A79qYK7kxjbp2N7sN99AG8dhQtl3dl+k8to+TWgVqV4fr4LNL?=
 =?us-ascii?Q?iASiO/vju0UMNqNOFR50/hmgrMPHracfJQ3diuGhBml5fhsepL9/6o9NwzPf?=
 =?us-ascii?Q?ERNHu87EeVoD0eUYKlLFo2WkYomLGlReCma1hW89jhIa3Qv3nuK59KHlpxLi?=
 =?us-ascii?Q?YFuJ5SDaXbW7DlPNHdrdiC0Vm8GcjXdYdv4tRAMAHFSe9mqiVRhXOGWRTsH9?=
 =?us-ascii?Q?GE493p0zeYp2jQvbHFv4gp3+Y0u4mVz56dI1H/fjz1INZADMvuMC3RatF2Wr?=
 =?us-ascii?Q?yv5U7ph2s6v61frR7GAJrG5cCFRnQ+/cVzCfucvnZ086EQFQrSgc4jUFKebs?=
 =?us-ascii?Q?ur0/rgOzzv8TkXs2ZPq7DSzHWN6dj2sZQ/TyKcYh+fcsLRdcIjsiNuNMj00A?=
 =?us-ascii?Q?Tdm0Wrgkpvb3eOmmd9tMb8cfrckEZbGtsyCR1LAp7QJ5NjWazJgeEDuQDm/B?=
 =?us-ascii?Q?6DZV/z5YtdAcDvisKTzWJy7tFmgoy8fFvifZVMZJC/AI/9uC+ww6vEZjimFv?=
 =?us-ascii?Q?58aSN4WiTJKFeoiK6eJxOsHYJS3wguBFUoa4+QFWUEUSfLmmBnV5okSjSsK/?=
 =?us-ascii?Q?IaLnYPi3F6/J7FK4zAD+YtjnZ3SN29JZ4jn247FzqMFJC/8JZ8Dnvqrw4+7C?=
 =?us-ascii?Q?bf7QFU43UCmwyXks5WNSJ3vY9+mvV0aLCpUCVRENnR4jgcF6+Tc5PvRUgAm+?=
 =?us-ascii?Q?4dE7Jk+O4UTKNKrLQj9ZNgLKN70y6MivjM6HvzX5jxaTjHF6fJHucB/1Wr7N?=
 =?us-ascii?Q?lrhnLMiBjwBBUm9U24CkYUrvSRLTdV2tOL/vVR6TxHBei4u+GO98+MtvRSlj?=
 =?us-ascii?Q?Dkk/QQgRUHABaEnkJ6ehQHkiYFnoMu97sAsd7msOY2OgxjVto2i/Afb7oBRk?=
 =?us-ascii?Q?1zGoHkdTGl0x/OYDCf7KXHgxiu3CC2w5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB7396.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76167c2-a57c-412e-1576-08d99353d7cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 22:57:36.0671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tatsunosuke.tobita@wacom.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7057
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

>I am really confused about this distinction. Could you please elaborate wh=
y wacom driver only supports 0x056a (and, curiously, some Lenovo) devices.
We want 0x2d1F to work with ***ONLY*** with the generic HID driver because =
the every recent firmware is designed for that; no help is needed from othe=
r sides.
In contrast, the most of the devices is required help from other sides. The=
refore, the devices with VID 0x2D1F devices are supposed to run alone and s=
eparated out from our brand shipped products.=20
I don't know how much we can go further to tell you about this -because of =
our business, but 0x2D1F was obtained such purpose. Your understanding is m=
uch appreciated.

Thanks,

Tats

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
Sent: Tuesday, October 19, 2021 10:51 AM
To: Ping Cheng <pinglinux@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>; shawnguo@kernel.org; s.hauer=
@pengutronix.de; linux-imx@nxp.com; Jiri Kosina <jikos@kernel.org>; Benjami=
n Tissoires <benjamin.tissoires@redhat.com>; linux-input <linux-input@vger.=
kernel.org>; devicetree@vger.kernel.org; LKML <linux-kernel@vger.kernel.org=
>; linux-arm-kernel@lists.infradead.org; alistair23@gmail.com
Subject: Re: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the d=
ata values

[EXTERNAL]

Hi Ping,

On Mon, Oct 18, 2021 at 10:41:55AM -0700, Ping Cheng wrote:
> Hi Alistair,
>
> On Sat, Oct 9, 2021, 4:44 AM Alistair Francis <alistair@alistair23.me>
> wrote:
>
> > Add support to the Wacom HID device for flipping the values based on=20
> > device tree settings. This allows us to support devices where the=20
> > panel is installed in a different orientation, such as the reMarkable2.
> >
>
> This device was designed for hid-generic driver, if it's not driven by=20
> wacom_i2c.c or an out of tree driver.
>
> wacom.ko doesn't support vid 0x2d1f devices.

I am really confused about this distinction. Could you please elaborate why=
 wacom driver only supports 0x056a (and, curiously, some Lenovo) devices.

Thanks.


>
> Nacked-by: Ping Cheng <Ping.Cheng@wacom.com>
>
> Sorry about that,
> Ping
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  .../bindings/input/hid-over-i2c.txt           | 20 ++++++
> >  drivers/hid/wacom_sys.c                       | 25 ++++++++
> >  drivers/hid/wacom_wac.c                       | 61 +++++++++++++++++++
> >  drivers/hid/wacom_wac.h                       | 13 ++++
> >  4 files changed, 119 insertions(+)
> >
> > diff --git=20
> > a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > index c76bafaf98d2..16ebd7c46049 100644
> > --- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > @@ -33,6 +33,26 @@ device-specific compatible properties, which=20
> > should be used in addition to the
> >  - post-power-on-delay-ms: time required by the device after=20
> > enabling its regulators
> >    or powering it on, before it is ready for communication.
> >
> > +  flip-tilt-x:
> > +    type: boolean
> > +    description: Flip the tilt X values read from device
> > +
> > +  flip-tilt-y:
> > +    type: boolean
> > +    description: Flip the tilt Y values read from device

Do these really need to be controlled separately from the main touchcsreen =
orientation?

> > +
> > +  flip-pos-x:
> > +    type: boolean
> > +    description: Flip the X position values read from device
> > +
> > +  flip-pos-y:
> > +    type: boolean
> > +    description: Flip the Y position values read from device

We already have touchscreen-inverted-x/y defined in Documentation/devicetre=
e/bindings/input/touchscreen/touchscreen.yaml,
why are they not sufficient?

> > +
> > +  flip-distance:
> > +    type: boolean
> > +    description: Flip the distance values read from device

I am still confused of the notion of flipped distance.

> > +
> >  Example:
> >
> >         i2c-hid-dev@2c {
> > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c index=20
> > 93f49b766376..47d9590b10bd 100644
> > --- a/drivers/hid/wacom_sys.c
> > +++ b/drivers/hid/wacom_sys.c
> > @@ -10,6 +10,7 @@
> >
> >  #include "wacom_wac.h"
> >  #include "wacom.h"
> > +#include <linux/of.h>
> >  #include <linux/input/mt.h>
> >
> >  #define WAC_MSG_RETRIES                5
> > @@ -2730,6 +2731,28 @@ static void wacom_mode_change_work(struct=20
> > work_struct *work)
> >         return;
> >  }
> >
> > +static void wacom_of_read(struct hid_device *hdev, struct wacom_wac
> > *wacom_wac)
> > +{
> > +       if (IS_ENABLED(CONFIG_OF)) {
> > +               wacom_wac->flip_tilt_x =3D
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-tilt-x");
> > +               wacom_wac->flip_tilt_y =3D
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-tilt-y");
> > +               wacom_wac->flip_pos_x =3D
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-pos-x");
> > +               wacom_wac->flip_pos_y =3D
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-pos-y");
> > +               wacom_wac->flip_distance =3D
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-distance"=
);
> > +       } else {
> > +               wacom_wac->flip_tilt_x =3D false;
> > +               wacom_wac->flip_tilt_y =3D false;
> > +               wacom_wac->flip_pos_x =3D false;
> > +               wacom_wac->flip_pos_y =3D false;
> > +               wacom_wac->flip_distance =3D false;
> > +       }
> > +}
> > +
> >  static int wacom_probe(struct hid_device *hdev,
> >                 const struct hid_device_id *id)  { @@ -2797,6=20
> > +2820,8 @@ static int wacom_probe(struct hid_device *hdev,
> >                                  error);
> >         }
> >
> > +       wacom_of_read(hdev, wacom_wac);
> > +
> >         wacom_wac->probe_complete =3D true;
> >         return 0;
> >  }
> > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c index=20
> > 33a6908995b1..c01f683e23fa 100644
> > --- a/drivers/hid/wacom_wac.c
> > +++ b/drivers/hid/wacom_wac.c
> > @@ -3261,6 +3261,63 @@ static int wacom_status_irq(struct wacom_wac=20
> > *wacom_wac, size_t len)
> >         return 0;
> >  }
> >
> > +static int wacom_of_irq(struct wacom_wac *wacom_wac, size_t len) {
> > +       const struct wacom_features *features =3D &wacom_wac->features;
> > +       unsigned char *data =3D wacom_wac->data;
> > +       struct input_dev *input =3D wacom_wac->pen_input;
> > +       unsigned int x, y, pressure;
> > +       unsigned char tsw, f1, f2, ers;
> > +       short tilt_x, tilt_y, distance;
> > +
> > +       if (!IS_ENABLED(CONFIG_OF))
> > +               return 0;
> > +
> > +       tsw =3D data[1] & WACOM_TIP_SWITCH_bm;
> > +       ers =3D data[1] & WACOM_ERASER_bm;
> > +       f1 =3D data[1] & WACOM_BARREL_SWITCH_bm;
> > +       f2 =3D data[1] & WACOM_BARREL_SWITCH_2_bm;
> > +       x =3D le16_to_cpup((__le16 *)&data[2]);
> > +       y =3D le16_to_cpup((__le16 *)&data[4]);
> > +       pressure =3D le16_to_cpup((__le16 *)&data[6]);
> > +
> > +       /* Signed */
> > +       tilt_x =3D get_unaligned_le16(&data[9]);
> > +       tilt_y =3D get_unaligned_le16(&data[11]);
> > +
> > +       distance =3D get_unaligned_le16(&data[13]);

You are still parsing raw data. The point of HID is to provide common frame=
work for scaling raw values.

Thanks.

--
Dmitry
