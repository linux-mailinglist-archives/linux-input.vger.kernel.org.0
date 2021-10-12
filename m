Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BC442B07A
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 01:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbhJLXnM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 19:43:12 -0400
Received: from mail-eopbgr60056.outbound.protection.outlook.com ([40.107.6.56]:4519
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235374AbhJLXnL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 19:43:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1u1ZaAmeem3JBg01PWWFXJ9PF0gLW1HHUlp3Xqx/dyY8qAqih3kykLgVulDVYfNYNqVMoaDP3do6r2Ec8J6W1ZyjdHzDdvNpMMeqRx+tmk7cUuMpoZWCTthp3cnvDvMghoV0UUKUSGbMxT3Vo5rdQiRSvprH0IcXI6BFPtxn0aczo7E9Sh5I1rUkOljpmoZM2NFsX6Up+dJCDD3Dx1Q0ZOzBghI8lCl1taQDQZpbkIFAtYmNCsBc/A93Dzkp1UVwm551u/7L7+hWa4hVRHEELltAUlZv/TgRlka/bzX/e61wC1MOMoUbHC68vP3s572IgdBdmhlsIjFyeduPM2IZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSY3lSQtqSE1n7aHtJDGLs4VUfJGgDOILgCAXQteeYM=;
 b=VUqoc1JCZVfWVKb4xQJQsxNDdA5Lzx2IyUCsN/9tYocw+5SMnSmeVMsOo+V2Qm6AArWVp/zq4EfM9KCg/1tkFnHSflkEYzg2OcCyceEGSQ5a08TjHzY3s9ci9QZydhUfx72H50/5iVTJE2OY/zTitDnxXcetxPpmyovF81ao/uMANtI6PSsg2a5L2f/R19Ep0EqaPWrsS6A90DKkdXG99CE/SGMuSKr520TvF+ZXMbdPUBT4JxejIO4etD+6QYyGxmCQKVyk5U5Yi1tjQsJJz/FhZ8JGSGDwPCet4NyEgb7EX0kNozvPzWFM5zJat4my7VYfe+Dzw01oBkXPSrVtPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wacomaad.onmicrosoft.com; s=selector2-wacomaad-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSY3lSQtqSE1n7aHtJDGLs4VUfJGgDOILgCAXQteeYM=;
 b=jTUhY7wZOEqjL8URCGuKjOTRYp32cphYdf9Cci9kZGG0KN979N19auXjhYs2VXflJgO0Jn40wPrvGqJc/Qm6tU4JQ3vDcQ1Mn/7ByVuX+h7/BqsepDN01HIO4Bi8JygknAht/XIiIpxCV6AD+UJuA3LqcEDvCaED/pNSGRRW0yk=
Received: from PA4PR07MB7407.eurprd07.prod.outlook.com (2603:10a6:102:c2::11)
 by PR1PR07MB5740.eurprd07.prod.outlook.com (2603:10a6:102:a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 12 Oct
 2021 23:41:06 +0000
Received: from PA4PR07MB7407.eurprd07.prod.outlook.com
 ([fe80::8b8:5840:343c:5f99]) by PA4PR07MB7407.eurprd07.prod.outlook.com
 ([fe80::8b8:5840:343c:5f99%5]) with mapi id 15.20.4608.015; Tue, 12 Oct 2021
 23:41:06 +0000
From:   "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Ping Cheng <pinglinux@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
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
Thread-Index: AQHXnLcSGNbhzjpyfU+C3ejRk0O6iquMhiMAgAPPsbGAB82JAIABhySAgAAIUwCAAwTnwIApDnTggAC5IoCACcx0gA==
Date:   Tue, 12 Oct 2021 23:41:06 +0000
Message-ID: <PA4PR07MB74073782696043BEB6E3D5A687B69@PA4PR07MB7407.eurprd07.prod.outlook.com>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-7-alistair@alistair23.me> <YS1DGuTTAEKAd2Yr@google.com>
 <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <YTcBOskPYjbv4q61@google.com>
 <CAF8JNh+PcYuaLL=ToS0hOT62YbVmMWY9BCT-CGx_x+AkKuO_Tw@mail.gmail.com>
 <YThQUtE757b/ExR4@google.com>
 <PA4PR07MB7407540AC0904ADB6D58A46487D69@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <PA4PR07MB7407EF5BE9140753388E12C187B09@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <YV3kyReNo7BkecAD@google.com>
In-Reply-To: <YV3kyReNo7BkecAD@google.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wacom.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cf3a42a-fc01-474e-2d03-08d98dd9c2ab
x-ms-traffictypediagnostic: PR1PR07MB5740:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR1PR07MB57404C3B77C87EAFFA1F218E87B69@PR1PR07MB5740.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4cU+VW8bf7nq9PR4PDpcvSd0pv45etSZsF1SqZRCQO4Xy1vpgjWfSt8UhhHvVT3J7zgsX7wYSNPmQdWmXDRKG6HK4zZ/uCeeC+DLvIxFT9k/GL/yIUIghLuxiP5OARu9EXUB+VGgJzjYXm1a+8/OlkUJc2MBycx4OqwPfWttEns05bLfCTcfesJ8W88lZJZxoyay6/WaNIf6p9ZdLPfHtG6rpa9BqZ8N/lJmXlfeLHV6qXSr4ACoevRrWwXfpGUBWnH7on2FP8o6KawRtUyjvIiaagJdHq4CAbwMgsy/ce8nFg2RhnuJfJNOGdzlKu2VFR+a7+3UorlE5/233tLwLSpZzd6upB65HEFGySZU/6r624e8/yD1cFAkf+ckC3bYgPV2rBPPGd7EVWR/+Gxuo6vYfCkuhx5czDnttJ4pocQHYS2fVZ/PrSkJYp8PTuNRtok+eSdbCXawKnUtYFaKkXpM9bQPfBWkr3TXm27W7NXoO/t2PdNUDtbySXKgdrInrmq3J9zfpWULMPfJGejKXKiR5TvSjOXkKBgf4sTskL2F1JclzUaZRWXDqPSD7xVNJkZxSvvQxYONR7Gdk0+4dC9qlxf9ly8gxNu1NlvVeGesoKZi+oEYnwqKSoYIC1iCUvTiONhYVVnwhaxklKwkaRYyaLf4L+qdSEoJN9xiDiUIoAoQAGFZnb19NyFTMBcfvlfw5xCjSke8uxZWjagx1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7407.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(5660300002)(122000001)(64756008)(66556008)(66476007)(66946007)(76116006)(52536014)(4326008)(9686003)(508600001)(66446008)(55016002)(33656002)(2906002)(316002)(86362001)(186003)(26005)(54906003)(8676002)(6506007)(53546011)(7696005)(83380400001)(8936002)(71200400001)(7416002)(38070700005)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VPy4IymNOKl76fpZpoFMNcuqVI7HCUm7KlvblL0bKTEjES9BuzGbGjDQadGA?=
 =?us-ascii?Q?JAVmrG+gSVu1FZy2+ehm480uf9KLh1DVkX94zmHof7NP/Gw0+t89/XYpKQU6?=
 =?us-ascii?Q?7u0G/FxMjC3GzK99nFvt+HhU2lmDR095t7z4/hM5NHXEzBHptk2m3uXRDx02?=
 =?us-ascii?Q?amohxLCnOALYIKSAV/tih21PBb4Jz+dBm/VgnMyuLrf8SVtPaxFxt1aYDOkV?=
 =?us-ascii?Q?p1q+/jO4EvLGemOBrxxlKvekrZ4k4LFf1s7a4D6vjvk8vggM8z4AI5wtoDy/?=
 =?us-ascii?Q?J0f+hh7sQYlhfKhZx65wRH0QkNmYIRGLBQeHMZMyVq9mPnlPqv38qcxn0r6d?=
 =?us-ascii?Q?wL/NzNfjykr0biFJDq8grIFAlXGh+WK5R8UqPSvVnXnCDck31osYm7I3Am1j?=
 =?us-ascii?Q?U06KaOtE7TepvpLrXv4S/KxzM35FoYIstcNmTEAeB8XqL+DLknF5BYG4zdc6?=
 =?us-ascii?Q?y7oz48hYDeViVGOp1WK9LUw2OvktdxX18BY//OsjulUiB+MJ9l2mFKRJLmAZ?=
 =?us-ascii?Q?4cEXqTi5zMcsr8mQg5I6YtBGx4pBVAUrpF9ofXIMjCrjWyjvE3yfsjyC6NBm?=
 =?us-ascii?Q?ebY8QLdtRWMwNAUxImiK5VhW5mcEi4jNuzhgsB6IlFklcyHIg6AzAWvxFuRy?=
 =?us-ascii?Q?rAtCNH13WhiFO0KTwoKtgqUIOVOBpmaXNFSzxFtfTzAVzBnardvCnvlCcij0?=
 =?us-ascii?Q?xZ+DFoz+1LIUM5AJ0skgRt3EtSkwctPaP21p4I8DKeRwZl/8vVPA8yNrwWSw?=
 =?us-ascii?Q?c9qSm2cvpW2IUHqvO1XKirvUcbzk2L/TavoUqWBFnjsxvhTVIken+siMJIAA?=
 =?us-ascii?Q?dmU7/zbsZkFUfaRd6N4e2o8xrpS9BWCXgKCiohR5tDn0FbA+z29PeRYFjIgS?=
 =?us-ascii?Q?I011SFbSiQ+gRRANTwqQJLV1rzyktEt7z291OmIrMKqm9qsfPnoZqpzmIHDU?=
 =?us-ascii?Q?R3efHMvVmSbvv/y1UUBbPKXQtbe6NJyJKOZKhrEiqeJtxAy2oBwasEBamQIi?=
 =?us-ascii?Q?Bkskodtc1Z39YuDsQnKt3OEx7X/+/QaWk1CsIMVnjrAYLunlh+CECnntoP1D?=
 =?us-ascii?Q?IUGecDBcUzWxtD/m0a1UyrfBWp/kHioJNUySGXO+cmGJbUDZ/lz2EiSkyPrD?=
 =?us-ascii?Q?MwKJvg2Vun2gcBZIJrDRLcedh3p/ourkK47dPnzUTi69f/ADVXGTe7kkI18T?=
 =?us-ascii?Q?O44wja27jcPQU93vkbin7IvCDeYFkfhgjUIbsu54wSgPeIiNQ4JufzwrCN3H?=
 =?us-ascii?Q?qCROuUoIJPBqQ+5aUImXY0cwwwvPJhqVR/iQYpczw+z1V/T88p3bosyRPOEB?=
 =?us-ascii?Q?lB5TYFPgcAvfmZ9y2zvBeDlX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR07MB7407.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf3a42a-fc01-474e-2d03-08d98dd9c2ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 23:41:06.1390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EY1wrJqjQFE662LuomaOngum1M/mvmFQGUhk5r8cqBUOoxwOdcFgalqPY8UcMqkcXCuD/zAyp1VLwz06DCi21GNxBvK1vQjxxXIngQkFeeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1PR07MB5740
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmitry,

Thanks you. I appreciate that your answered my questions.
I think now I agree we just stay with the current wacom_i2c.

This is just to tell you what kind of situation we deal with wacom_i2c with=
 our customers.
We work with OEMs,/ODMs and they often want to add/customize their own feat=
ures onto Wacom pen functionality with their Linux based OS, such as Chrome=
 OS, Android, Linux desktop distribution, etc.
In those cases, some of them want to use wacom_i2c.
The reason is if they used wacom_i2c, they would be able to concentrate on =
their own desired programs.
Since wacom_i2c has simple structure for initialization - their desired spe=
cial preparation- and for handling input events to add their specific purpo=
se,
it is easier for OEMs/ODMs to handle such. On the other hand, they may have=
 to look into whole hid codes throughout parsing hid collections when they
want to the same as I just described prior to this sentence; and it takes t=
ime more than they do with wacom_i2c. Also, finding problems becomes more d=
ifficult for them if they have.

We usually recommend the customers use i2c-hid, but not all of them follow =
it and use wacom_i2c with that reasons above.
We, this time, tried to update it because some of the customers try to use =
the current wacom_i2c as it is - compatible older generations of the produc=
ts- and ask us the correct one.
Yes we do then, but we thought maybe updating wacom_i2c may help them use i=
t easier.

That's it. I just want to tell you why we started suddenly update the drive=
r.
Thanks,

Tats

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
Sent: Thursday, October 7, 2021 3:03 AM
To: Tobita, Tatsunosuke <tatsunosuke.tobita@wacom.com>
Cc: Ping Cheng <pinglinux@gmail.com>; Alistair Francis <alistair@alistair23=
.me>; Cheng, Ping <Ping.Cheng@wacom.com>; linux-input <linux-input@vger.ker=
nel.org>; linux-imx@nxp.com; kernel@pengutronix.de; Tatsunosuke Tobita <jun=
kpainting@gmail.com>; linux-kernel@vger.kernel.org; alistair23@gmail.com; r=
obh+dt@kernel.org; devicetree@vger.kernel.org
Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor value=
s

[EXTERNAL]

Hi Tatsunosuke,

On Wed, Oct 06, 2021 at 07:08:38AM +0000, Tobita, Tatsunosuke wrote:
> Hi Dmitry,
>
> I now understand what you mean. The understandable example is USB. The=20
> most of the recent drivers for USB devices has bee released as HiD=20
> driver.  That said. It's glad if you can have comments too about my=20
> questions.  Especially, when someone doesn't want the whole HID=20
> driver, but a single I2C I/F'd input device driver.

So far I have not heard a good reason for "not wanting" to use a standard, =
well tested solution that everyone else is using, and instead having a cust=
om driver that essentially reimplements everything that HID layer already d=
oes. Is the additional memory requirements of HID layer too onerous? Can we=
 address that instead?

If we continue this train of thought, why are they concerned with HID, but =
happy with using I2C layer? Why don't they require a driver that bangs dire=
ctly onto I2C master ports bypassing all the layersi and communicating with=
 the peripheral directly?

> And also, I want to make correction that ***not*** all of our devices=20
> support HID. Some old devices do not support HID; that's why I added=20
> the driver in 2011.

And that is a good reason to keep existing version of wacom_i2c in the kern=
el, but we should not try to extend it to handle HID-compatible devices.

Thanks,
Dmitry

>
> Thanks,
>
> Tats
>
> -----Original Message-----
> From: Tobita, Tatsunosuke <tatsunosuke.tobita@wacom.com>
> Sent: Friday, September 10, 2021 1:10 PM
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Ping Cheng=20
> <pinglinux@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>; Cheng, Ping=20
> <Ping.Cheng@wacom.com>; linux-input <linux-input@vger.kernel.org>;=20
> linux-imx@nxp.com; kernel@pengutronix.de; Tatsunosuke Tobita=20
> <junkpainting@gmail.com>; linux-kernel@vger.kernel.org;=20
> alistair23@gmail.com; robh+dt@kernel.org; devicetree@vger.kernel.org
> Subject: RE: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor=20
> values
>
> [EXTERNAL]
>
> Hi Dmitry and Ping,
>
> I understand that we should stick with HID as much as possible.
> However, there're certainly situations in which some do not want even who=
le HID, but only an individual functionality for a certain device.
> In that case, they may not even include the bit of the HID, but exclude H=
ID. What about then; what they should do without HID?
> This would be also the questions if such situations happened to other ven=
dors than Wacom.
>
> Also, what I need to add is that the early generations of our I2C devices=
 do not support HID which is why "wacom_i2c" was added in 2011.
>
>
> Tats
>
> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Wednesday, September 8, 2021 2:56 PM
> To: Ping Cheng <pinglinux@gmail.com>
> Cc: Tobita, Tatsunosuke <tatsunosuke.tobita@wacom.com>; Alistair=20
> Francis <alistair@alistair23.me>; Cheng, Ping <Ping.Cheng@wacom.com>;=20
> linux-input <linux-input@vger.kernel.org>; linux-imx@nxp.com;=20
> kernel@pengutronix.de; Tatsunosuke Tobita <junkpainting@gmail.com>;=20
> linux-kernel@vger.kernel.org; alistair23@gmail.com;=20
> robh+dt@kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor=20
> values
>
> [EXTERNAL]
>
> Hi Ping,
>
> On Tue, Sep 07, 2021 at 10:25:43PM -0700, Ping Cheng wrote:
> > Hi Dmitry,
> >
> > On Mon, Sep 6, 2021, 11:05 PM Dmitry Torokhov=20
> > <dmitry.torokhov@gmail.com>
> > wrote:
> >
> > > Hi Tatsunosuke,
> > >
> > > On Thu, Sep 02, 2021 at 07:33:49AM +0000, Tobita, Tatsunosuke wrote:
> > > > Hi Dmitry,
> > > >
> > > > Yes, our firmware supports HID over I2C.  However, some of our=20
> > > > customers often do not want to use HID to handle our hardware;=20
> > > > even they don't install the generic HID driver neither.  In such=20
> > > > case, we need to distinguish what generation of our device=20
> > > > customer's has. And to do so, we check I2C HID descriptor even=20
> > > > though the driver is not working with HID driver components, but=20
> > > > this one.  That is why I2C HID descriptor is used there. It is=20
> > > > called, but the situation with this driver is not supposed to work =
as a HID device.
> > >
> > > I would like to understand better why the customers do not want to=20
> > > use HID.
> >
> >
> > Those customers normally run embedded Linux. Their hardwares have=20
> > very specific use cases. They don't need to support any other HID=20
> > devices except the Wacom i2c device.
> >
> > >
> > There needs to be a _very_ strong reason to essentially duplicate
> > > HID layer in a vendor driver and I inclined to say that such=20
> > > customers
> >
> > would need to patch their kernels themselves.
> >
> >
> > They most likely don't want to duplicate HID layer. They just don't=20
> > need most of the HID layer code.
>
> They just need touchscreen support. Plus stylus support. And maybe batter=
y support. And maybe something else down the road... And they need to intro=
duce DT and ACPI descriptors to be able to mould the behavior to platform n=
eeds. Which is pretty much the purpose of HID layer.
>
> > wacom_i2c simplifies their deployment and testing process. Most of=20
> > those customers are very small companies...
>
> And now please continue this train of thoughts and consider every touch v=
endor. Wacom is not unique. We have Elan, Cypress, Weida, Goodix, etc.
> etc. Vendor drivers were acceptable before we had I2C standard, but now i=
t is much better for everyone to share the efforts and use HID instead of r=
eplicating it for every vendor.
>
> Thanks.
>
> --
> Dmitry
