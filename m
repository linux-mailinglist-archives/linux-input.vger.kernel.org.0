Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943D5406643
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 06:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhIJELZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 00:11:25 -0400
Received: from mail-eopbgr40074.outbound.protection.outlook.com ([40.107.4.74]:16256
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229507AbhIJELZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 00:11:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ucg/LlYuNF/Wu5gs+P8t1Iziz6/CfNHssOUCPLIbD8AjVupQ/3KWTLLfgZgTLpcX6aLub7+oCofzrCf2LZviKbPrUVWzsjLSiqUQseRH6olAbj9XKlX+lpl0Pa5g3JWS+ANdjEm7xn8xAG3hZzB3hXRYVC2fNRiv7bFArujuKScAYteHBZWCdaA/PgPb438vBBdPWXvv0wLQNPHWkNmFd97S60/m3WjEQ+ZQDVQ7Wp91z86Q7HZFsme+MVinT3mr+0GKBoNP0Q3c4YiLWchBtUjB9aXbb38ghqmGM8NlvO41fQuSIKrseJ8hHJrJ/z39n8U17i6GkZM7tNmaHwfh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CLnp5liRdOZDXgXkf2kcg5WDDDCQNNxaFx/pp1MZMIo=;
 b=NB+sC3qQ/1c6dAnLUeY9epZe4MDa/tLGCBt1MAzxsUuimzRyRpqHhsEXmT6DIqnwccruwqOh+wFNVO2+ekBkLkhrPKDWEJQoSf1ELuga12VR3I0NWr5vTPn3OCq+LCX5ZU/Cl1eU3+Z5McD9bZggP4xZS2NLakLYIC6kT3D2tcWk+DoWA92piPigies0mw/r8wF2ofxCov37owWAPmwdunrf86QQBrkdow6OEMWrO9TLjxZL+C+xiPbU8V4V21WWKmOR84xlGZ+bWGPYosi0QA0V4PKTwBTETh3pQiC9tUCn4gkGMeT4QYOWaAlb06tiwbWouNnGdAD8Zh1SEB1ISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wacomaad.onmicrosoft.com; s=selector2-wacomaad-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLnp5liRdOZDXgXkf2kcg5WDDDCQNNxaFx/pp1MZMIo=;
 b=JZSNuaQvyQ7qFU7vZAUh6Dtq4KpPQix5Qw+3kYoE4xUo5sqkpEpTIuB/0POKhzfwFzsSqG+qioJfob26SPxuf1XZJLxJPjIBWI8/IFcvbCirlhOeBXtrivUdyq4ow6dKfughsDm35wP3rYjYdRwujvFgXRNN3s2EdcCRfmocPQI=
Received: from PA4PR07MB7407.eurprd07.prod.outlook.com (2603:10a6:102:c2::11)
 by PR3PR07MB6940.eurprd07.prod.outlook.com (2603:10a6:102:7c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.9; Fri, 10 Sep
 2021 04:10:12 +0000
Received: from PA4PR07MB7407.eurprd07.prod.outlook.com
 ([fe80::8b8:5840:343c:5f99]) by PA4PR07MB7407.eurprd07.prod.outlook.com
 ([fe80::8b8:5840:343c:5f99%5]) with mapi id 15.20.4523.009; Fri, 10 Sep 2021
 04:10:12 +0000
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
Thread-Index: AQHXnLcSGNbhzjpyfU+C3ejRk0O6iquMhiMAgAPPsbGAB82JAIABhySAgAAIUwCAAwTnwA==
Date:   Fri, 10 Sep 2021 04:10:12 +0000
Message-ID: <PA4PR07MB7407540AC0904ADB6D58A46487D69@PA4PR07MB7407.eurprd07.prod.outlook.com>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-7-alistair@alistair23.me> <YS1DGuTTAEKAd2Yr@google.com>
 <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <YTcBOskPYjbv4q61@google.com>
 <CAF8JNh+PcYuaLL=ToS0hOT62YbVmMWY9BCT-CGx_x+AkKuO_Tw@mail.gmail.com>
 <YThQUtE757b/ExR4@google.com>
In-Reply-To: <YThQUtE757b/ExR4@google.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wacom.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4160eb88-7952-4b25-9c34-08d97410e2b4
x-ms-traffictypediagnostic: PR3PR07MB6940:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR3PR07MB6940CF2F6608B384DFBCCAC687D69@PR3PR07MB6940.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MyX4edxOX5zu4om/kqQ0ndsmYtFLRtkFxef9wTk9wyID+KoQbh79/ZApzcNmiggJ6+Aw7nH2HAKXAsA0bFvIP18ltimOclgmAvMC/LM4re6m75HFMySvYH6xWTevfOO4g8gccovgPGX/BtdnJ2mnpSj11RtuZkNwY4Z6bLHIlQFoUIFlDbAPoEzF59K4KxnLVIGCHHyEPtdyJM6H45xE57iTd8behiibFrG08k0pVXobOwke2xVmyeYoS55ZEDbEBdSdiByyz5csruMnqNX6FAqgFVhQDxAHbPPyotUyKx1O0PcXzNuzoVP6CFWsh9CGMDuIXREqeedPQ8lMy2F+jgz/uMXXzBF4AGbL+s1bDE5RnivzkD+gI03I3xT1QlzGQNXRegd51sBoVzHSFysHJk6bXPPQIFfnEfcOCgyGXnUKqj+2hkxOFRzIWC9TaLCwY6RNqEqDeSsMuPgliVqGSM4OjLPreslOYSUZ70Rrw/s4dz0/wAHR/vLpVooQaUgQSzAaKHtwagZ6I+S74sZ/OvnO/aVrwQ9RV5tJIp+EJJ3hV3kJQKGz6UB9p3vHgSogkUUl/T4xC0pA5drN0Vtn0yUxxXS6/p4tD77gQvG2Mh8SmuARPQ2RqEwoNiz41isZxCdsLWVeQmITa6WoJsllgdcKvAMQRpKB77+XBdSlHXnaqHbayalNvx+sweZcsRL6lyisgt8OWU5kgnVJ9FmNow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7407.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66446008)(64756008)(66556008)(66946007)(76116006)(4326008)(186003)(7696005)(316002)(38070700005)(66476007)(54906003)(52536014)(508600001)(8676002)(7416002)(5660300002)(110136005)(122000001)(8936002)(38100700002)(71200400001)(9686003)(6506007)(53546011)(2906002)(83380400001)(26005)(55016002)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0BRgaxtXkfwoypls+xMAAG/UoHgx21SX/AxKsz4KoFW4gyPMKFMsegJseia3?=
 =?us-ascii?Q?JFfPhriijKdarsYcqOf2aDmIQxh1t3SBuApYH2O4yial9qbqLNVOAktp3Et9?=
 =?us-ascii?Q?AZIqsq4HSpF+DdD1a2fX2W7o2M/pfqTxHvXyR+zCEgvc/On6tJo8WkG5Fs/T?=
 =?us-ascii?Q?+7P/ikET9ZhbJ47imeDR+55vfCHL9rix7HyphbYHROJauTEE8Sas+VGx9fM/?=
 =?us-ascii?Q?R0vYiQSbxn1X9WokSqkd3dlsotmMCDEUnauhl/C4uewLw1IQrqSKciRjEKwB?=
 =?us-ascii?Q?8+U37R61XIN1tpvif2q0Mg05EjgV8AzF6b8bVrck9xi1r8wRF4Gii44WvUlD?=
 =?us-ascii?Q?pEjexsY5PE6PbLGQiXEKhED5DYDEt88dtulnW+ktGj6Z/+AoKV79lj3sk4Nz?=
 =?us-ascii?Q?QBb+WHX9TPaobP1HcnEw5Xt3ZyeMW/czZLZN5zlG92a886PH216XJc+QIJBX?=
 =?us-ascii?Q?+YTgoGx17XEGA/Cq1rK4qQ5+5OcNyE+tw7+sMsZVVYy4lt/J5LyIFHwj9mvj?=
 =?us-ascii?Q?L/oByRiLYvI3AqhAn1FlRKXGWUQDU4EEZlN9G491KPKbwusPnSwBkOCf/1/3?=
 =?us-ascii?Q?WRPyWeksPhASyBAC8H+eoah3K97JpucmOlywR+U53is/BZ9SrCWLb6AMbDe3?=
 =?us-ascii?Q?VmqvIYobQtB+k4BIqa/o08rNc9DwezCieqav2c+OMjMEcKTgkg7R9ykHW0w0?=
 =?us-ascii?Q?gZxm7qbWl7foKMwj1GAVVnPqG0cWAz3YPmEdKesmPj1XlSa8zPOFhb+GQmO3?=
 =?us-ascii?Q?cL6cyFt0ZUXYC9GjbCgcTEd6RCX9fqn8qk5Z6iD3O79UtMI/HpSwG0tR6n4W?=
 =?us-ascii?Q?WPkY9nptsV1ZTL/BArVixaTvMWoC6wfcXYLjVdYEro5VMN+o7WoAZjJ32mvq?=
 =?us-ascii?Q?IB5+P5HgOSJHzGGiXhVpDTdhx0uZCTyJDcFHh6D3k0TBP1gQvoCF0whsxjxk?=
 =?us-ascii?Q?MMONMDhU/Ss3RLRa/2fmeSXjxK2NrEtNcv8NeNnnVFQ8tnODoN0UgWUXoLsj?=
 =?us-ascii?Q?lZuhshGI8kZpz2hZsduOzsG42eDK3KTKv0erBOe/jB/DOgr5C3ILRV6fuoCF?=
 =?us-ascii?Q?+5Y46UibUJCunJrBfzf09mYbpVO0tVKmABtFAe6d8UbOm3AujEOcerFpJt85?=
 =?us-ascii?Q?4zIYvBTyIvKD9mT94+zSM5K2CsvPXagbo0OoPgSDlxN0p2AJ23q20K/QNaLO?=
 =?us-ascii?Q?eFjwSVjpmuRcDZ49cr29y+b5qADNEbOATujg+5KTT+dz9J4pOi6q/wkuXNYD?=
 =?us-ascii?Q?WOcC3EgOOrCcVugpkVB3nYH8AJRjO9nw3lpiUjLRmFoRFRbJtNAa4IuDUslx?=
 =?us-ascii?Q?ekx2sVghYg8/QxwjkuNOtENG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR07MB7407.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4160eb88-7952-4b25-9c34-08d97410e2b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 04:10:12.0361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RD+w8GZPsjbkeAWVAqwJLn0bQh4yDif/dB0mjOOsRSnhZGKy1WjOMMVQlP+Xo32/anu9xG7iaX4a+T0Z81jvrARTIXYH4u/xPlpLtbEkN2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6940
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
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
