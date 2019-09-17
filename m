Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53790B5235
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 17:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfIQP62 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 11:58:28 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.69]:32430 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727404AbfIQP61 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 11:58:27 -0400
Received: from [46.226.52.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.eu-west-1.aws.symcld.net id DD/04-11071-F92018D5; Tue, 17 Sep 2019 15:58:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBJsWRWlGSWpSXmKPExsWSoc9hoTufqTH
  W4O4Ndov5R86xWhxe9ILRYtXUnSwWNz99Y7X4sOsqs0Xr3iPsDmweO2fdZffYtKqTzaP/r4HH
  501yASxRrJl5SfkVCawZj1/dYiy4KVhxbLdmA2MrXxcjFwejwFJmiQ8NlxkhnGMsEgevdLBAO
  JsZJX73/mQDcVgETjBL7Pk3mRnEERKYwiRx5P0ZdgjnMaNE47Y9TF2MnBxsAhYSk088YAOxRQ
  TiJY7PPQvWwSzwjUmi88VlFpCEsIC3xK6Xt4A2cgAV+UjM6K2GqA+XWLl8OViYRUBV4vprB5A
  wr0CixP2j96F2XWGW2L/3Hdh8TgFbiSsP7oLtZRSQlfjSuJoZxGYWEJe49WQ+WFxCQEBiyZ7z
  zBC2qMTLx/9YIepTJU423WCEiOtInL3+BMpWkpg39wiULStxaX43lO0rsefAOnC4SAg8ZZRo2
  r+AFab52padUAssJJZ0t7KAPCAhoCLx71AlRLhAYu/0Tqg5ahI33nRAlctInLr6jmUCo/4sJG
  dD2DoSC3Z/YoOwtSWWLXzNPAscFoISJ2c+YVnAyLKK0TypKDM9oyQ3MTNH19DAQNfQ0EjX0NJ
  S19xYL7FKN0kvtVS3PLW4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwUaUUHPfcwXh31hu9Q4ySHExK
  oryzpjTECvEl5adUZiQWZ8QXleakFh9ilOHgUJLg9WdsjBUSLEpNT61Iy8wBJk2YtAQHj5IIr
  yxImre4IDG3ODMdInWKUZdjwsu5i5iFWPLy81KlxHldQIoEQIoySvPgRsAS+CVGWSlhXkYGBg
  YhnoLUotzMElT5V4ziHIxKwrwlIFN4MvNK4Da9AjqCCegIzeRakCNKEhFSUg1MZ/gE1y3xzFj
  ZUarMWbpxrc5sk7fcIdeONjUvvRvImH/CfHVeiNUPbt+NH/7xP6+xLN1wS/eAwipv6+vftDgV
  Ejie8E8ROrursPTj86mrmPeIBWl96Xwx2Tmo9U3L0S3bt1cV3hE7tKy2Sc9O2Dew/Yh62Tuph
  THfqj+wvH4fdJepTudb2t45V8J0+zqnvjxpG71ppc3CYvcj8X5fl6ie+d1+29OszmPD7tNPBS
  3S7/ws1SzYq/skz+HClMznJ3rYfnHMdeG8dPuOv6/Gn4XJyW/Wz/m0ek/S0lNJDJFP3N3vW7/
  zfzrtoBRPTvLOjuYEnUVcN988vvam/NF0f/3oc27q1b0Hlhd1P25W9BJoV2Ipzkg01GIuKk4E
  AOqT8ClbBAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-17.tower-282.messagelabs.com!1568735902!61160!1
X-Originating-IP: [104.47.8.56]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1768 invoked from network); 17 Sep 2019 15:58:23 -0000
Received: from mail-am5eur03lp2056.outbound.protection.outlook.com (HELO EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.56)
  by server-17.tower-282.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 17 Sep 2019 15:58:23 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/KMZLZqljOOaxIFYllZZqFsR+p/eAaz1yWMYx8yonTd0d7z3lNT+lxS8bwCFETq1IVkUYzUxkI1rOr67VEnPvFK1G1uCA37I68E5JLvbHUyYJutXc/i2lwJKrvXkhMxIToIOX1+N8kqVAHCINBFkzp1TA+pWk0G70DlLJhZWjwx7JdgqwV6mmqNR4WP8ZkxfQOLS4rkYQuhRhKslhIEEWgOglLG5Z9Xq5kYNVXyzXKHSzRfEBeh+0PBaZLJ/YPbA7xk392A10Ll9sxjax6A2lR3/x19NVydC06q8qeaRdYldZuhvy0Dk4KZret3X31xt+aXry8YUdijj3XJIBamXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zSvsbfiCHYbBF2ET1iMf/oqgAoOpfvkHV+OPBto7SY=;
 b=lCm2Cxl7rRyl+tXlF9Te7AoSNaH/ZnA2FvRUCqXHJk548mqWnSEzfO/qA2VO/d+DJnbQkQmghmNJZvuYFC9lV7xiPFqtc1gCAC0yP8t2XVgFJoa8tnzrHkuRxmtFj2wOyi4tUm83CZBKuJB904xqDmd38VM5uez92EnKv16VHGw+qZuqQ5JsqiclMET17mIXg1x0wUVzmQ/zuYABn4qoWz0QV9k4BIcLltOdE2rzN9KM/tpUQoqAxA/GhWO03KnOj0vLgKZTTikxmjltCL/ySGMN8w44Mwe8DZ2XDgvUTTTC3+kc6/wJax7KNAZVswGn47EqkE3o/Cew6ZZOrAZ0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zSvsbfiCHYbBF2ET1iMf/oqgAoOpfvkHV+OPBto7SY=;
 b=USCOi3hzdrFMyRvx6Ozhp4L3r2fGKLLulYBEcdUPTJDiFhjp9KeEqJcycGPDjb/MPnPOtv5xPR1z+Fj2hOgUHKY7OUciRkf6fz7MeWMJykNvJgb1J4InOrnKH5vOUf8cHfhAF9LIugPnNmoFSQEohtnO1fsuYQ6fjLwCqdOZvlo=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1090.EURPRD10.PROD.OUTLOOK.COM (10.169.150.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Tue, 17 Sep 2019 15:58:22 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 15:58:21 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 2/4] input: misc: da9063_onkey: add mode change support
Thread-Topic: [PATCH 2/4] input: misc: da9063_onkey: add mode change support
Thread-Index: AQHVbJecPF3oj7kATUicChwp+YvuNKcuX9AAgAFJloCAAAVroIAAAjgggAACxoCAAFEZ8A==
Date:   Tue, 17 Sep 2019 15:58:21 +0000
Message-ID: <AM5PR1001MB0994E5BE4BA55AC7FF0C1B05808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-3-m.felsch@pengutronix.de>
 <AM5PR1001MB0994427D3D456A68B827CFD8808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190917101847.h22mtdtqbrlvdpxb@pengutronix.de>
 <AM5PR1001MB0994F5DB42CEADD614FA680F808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB099450E2B3AF6D7266FB2344808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190917105603.6mhiyqnmeiz43dxb@pengutronix.de>
In-Reply-To: <20190917105603.6mhiyqnmeiz43dxb@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ea1d24b-6696-42f3-af78-08d73b87dd8e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM5PR1001MB1090;
x-ms-traffictypediagnostic: AM5PR1001MB1090:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB10909E124255D53F48A58CADA78F0@AM5PR1001MB1090.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(199004)(189003)(52314003)(11346002)(5660300002)(55016002)(26005)(9686003)(54906003)(8936002)(110136005)(8676002)(66946007)(102836004)(6246003)(81156014)(81166006)(99286004)(74316002)(52536014)(71190400001)(7696005)(305945005)(7736002)(53546011)(66446008)(55236004)(71200400001)(486006)(33656002)(76176011)(66556008)(14444005)(256004)(316002)(86362001)(66476007)(6506007)(76116006)(64756008)(14454004)(446003)(66066001)(476003)(25786009)(478600001)(3846002)(6116002)(4326008)(186003)(2906002)(229853002)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1090;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vzsIfEK8mBz98MJF+kYXDL33kntQB8k4j38lYmPbn5dJCZMiIRJvATUf0ZC5j0bAKk83dmn2q6RRzYkodFCgTLGir2X9eaZalkKScLS/63ARK9Ups8E9cC5S5QicVXZq+OWSmmb8nLZToX8le66AvRsGHKxDlYrji1b32CEoofaaH4D0MwzCMdjxTgdmCWU6YJYY/pysaxTxEn9Ih2aVBXvuNWBPNTNPREDH9nqR2WCW2f60FFR+OjDitUK5Nf9xv6ONtvQHP093+OIhRuwNmCRYtMm+Qe1aB0eF3gNNUwVNIbmDBmt3W+QOwHh3bK5nYMcCQF5KMTg+gWVw4liuVLRkGa/uCh/CW3+cFEEQrj4bRZlL5Wc/dMD6pAbYp0yuPjheMazNACQ/TIyX6NZVx8Az1YZLskPFkBacvuwHVhg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea1d24b-6696-42f3-af78-08d73b87dd8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 15:58:21.8504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxw/LPWn/hvMWTG9Rr01kqK2VO7W5mHW4BUkRWH5ZlQlWoHCKA9G3RuODvFtBzxPSvsx0L+7rPW3sUGWpvFb+QyPEg+ZpoTBnSoNiysxRL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1090
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 17 September 2019 11:56, Marco Felsch wrote:

> > > > > This driver is used to cover DA9061, DA9062 and DA9063. This bind=
ing
> > > therefore
> > > > > can apply to any of those as there's no checking of which device =
is being
> used.
> > > > > For DA9063 usage, if this option is present then the probe will f=
ail as your
> > > > > regmap range update below only takes care of DA9061/2.
> > > >
> > > > That's right and I only updated the da9061/2 bindings..
> > >
> > > D'oh! That's what comes from taking a holiday the week before. :|
> >
> > Actually I was right the first time. There's one binding covering this =
driver
> > for the 3 devices so my original point was valid although if that regis=
ter is
> > in the valid regmap_range for DA9063 then it would succeed.
>=20
> You're right, there is a bit of mixing the naming.. The driver is called
> da9063 and the binding is called da9062-onkey.txt.. Anyway, as you said
> the regmap_range will be valid for both cases :)

Yes, that is a bit misleading. Really the binding document name should real=
ly
match the driver name.

>=20
> > >
> > > >
> > > > > Ideally I think you should update the da906x_chip_config structur=
e for this
> to
> > > > > support all devices as I believe the same or similar options are =
available for
> > > > > DA9063.
> > > >
> > > > After checking the da9062/3 register.h this bitfield is the same fo=
r
> > > > da9062/3 devices. What about adding a comment here? The CONFIG_I
> > > > register is already writeable for the da9063 devices.
> > >
> > > Given the current implementation of this driver only uses tables to a=
ccess the
> > > correct registers and masks for each device, it would be neater to fo=
llow this
> > > approach, although I am aware the register addresses and bit fields a=
re the
> same.
>=20
> That's right because they are needed on other places during the value
> evaluation. This register is only set once during probe and shouldn't be
> changed afterwards.

I just think that given we already have a mechanism to differentiate betwee=
n
the devices for register map access we should probably stick with it. To me=
 it
feels a little messy using the direct DA9062 register definition for both
devices, but will leave the final word to Dimitry.
