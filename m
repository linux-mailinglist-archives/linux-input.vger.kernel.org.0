Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD514158809
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2020 02:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgBKBzG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Feb 2020 20:55:06 -0500
Received: from mail-eopbgr00061.outbound.protection.outlook.com ([40.107.0.61]:49796
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727523AbgBKBzG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Feb 2020 20:55:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jgsj0gpUJRdeUXOrx1oLdgNp4NizwxCFbb+jEqOyU3Te/nupQUQ4ImMmcrHBHjZrpKH2DmsvCssS27l9pfeNr9K5pOEX+g+mUEHlNlullW+1uNKNo8odYRut2akE254gkVsiOmF/AyEA1NX3VKfJDQ+qjtYZ0p/x0cfBtubx9QzVX4IxyVdlZzpSr0pH1+qUavv06R4LwEcg6GhxVOqKL0Zaeox4TLHvqBtNiECnV3xSHo5eGD1iWaTd1V5PujCdS36vIgF+J87mXzo7ZCHpnf4xlidD27JXL8KCWTstP4loCSXoQZuwzq3nl2c3dmJGXvYEqSfeUgIDxp94paE05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxum1+IpCCZTxdp8D35uJeDkiqFLu9/uSRqDIZ2wFeE=;
 b=g40lcWleb5AYiPuOT5OZZDX0VK+poOWwnwi38BpbowjJ1t6BJ+/vAZ5g6RWNsPDjtq9J2JIv06UQCzq1Fe7n37PwnKODrhR/x8LnbymgJlkpXN0k0kCdvvAG7tPu0utRyhFcFStiDluXfMqwRUbuPstqrqU08x/CR0IUPo0+ncCRelfsWmy/g8vVFerju3uECYDACzUMRQhHwtS/m50/mE9xT52XlnsgCh8KgyG5RiKrSzKwGX2acQs9ZX441cg2sdusmr0Wmkr/Nx2lhH2DpyTQLmbjttPQSDbqirl1WQF9VTSW0Y8Wlf9DAypnOOZ+amkN76X3GqD92SeXUmTLlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxum1+IpCCZTxdp8D35uJeDkiqFLu9/uSRqDIZ2wFeE=;
 b=ZU6u33OJbsvViAWLbyexp5VehfuVpxcM7+Y0cImu+SkS1EPpf8q1SGEuDhu8FbB8CmrX4cLQmy+ES1tSSl0m1K4zft98wXa3OWaN+XAnihc5/lcuEojcyVlV1kPaWEl+//h2p0hCYhI90RPjNqEKWXA/UP2m1AUQke+yPY767+A=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.232.15) by
 VE1PR04MB6622.eurprd04.prod.outlook.com (20.179.234.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.26; Tue, 11 Feb 2020 01:54:58 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::490:6caa:24b:4a31%6]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 01:54:58 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Horia Geanta <horia.geanta@nxp.com>
CC:     =?iso-8859-1?Q?Andr=E9_Draszik?= <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Topic: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Index: AQHV164yHhXoESmTiUqzHJu+3DHGMKgUx1EAgACAgDA=
Date:   Tue, 11 Feb 2020 01:54:58 +0000
Message-ID: <VE1PR04MB6638761F5F8549C6528FE6B989180@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200130204516.4760-1-git@andred.net>
 <20200130204516.4760-2-git@andred.net>
 <VI1PR0402MB3485EC2F82DDE52DC5CA0795981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20200209223836.GA199269@dtor-ws>
 <VE1PR04MB6638A4F4E3BABE0ED0CD4A5189190@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <VI1PR0402MB34851857F012286250BF3BBE98190@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20200210175554.GB199269@dtor-ws>
In-Reply-To: <20200210175554.GB199269@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [183.192.236.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 22d6f061-3abd-4e88-420f-08d7ae95663a
x-ms-traffictypediagnostic: VE1PR04MB6622:|VE1PR04MB6622:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB662280CA99F21E679E2B60F389180@VE1PR04MB6622.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(199004)(189003)(316002)(81156014)(7416002)(8676002)(81166006)(52536014)(54906003)(110136005)(8936002)(7696005)(4326008)(5660300002)(6506007)(64756008)(478600001)(53546011)(66446008)(66556008)(66476007)(66946007)(33656002)(71200400001)(76116006)(86362001)(55016002)(9686003)(26005)(6636002)(2906002)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6622;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0SmoLZG+Z6MExrUdWiHqSf6eafMF7PzuSliuHT6XsUe5mxjKlC5EZBOm/PyGntYXGnEv5B8I8xNDNA6HvksiDtiOt8rUK+7yYbH36NxPRAT5aaNsRI13001NZGbrMdH8HYOCd66I+bTsZsO4sXWhFj4jiaY6F6QzcuSQyV8iXlM6Jrp8k430BLsMckUe7ENeq8vY93whcQB+cyC4Id0Z8pAN8eNr//hp0W9W04+bWYiVLLwhJJuinGpt01lZ4fV6KDcmBr/a834AHa0haFAOZMsBMez5B7etBAMOFejxwA7U6GcvzhwqatDVPltzVNVdPmnHo+H0YiyERa8VxKkuz0D4ZwUHbVHteNlGhm5M92HfSmUPsVl0N+i+t2KfFcFnTXJEot3S3MYDb+uwOC7y1SgVch7rHV10ptQ/GxfUw5tmNO9uxHWXMkIpkFmA1sPy
x-ms-exchange-antispam-messagedata: sfT+q0Vj+WfYYHhQo0S7etbqyte/Vg5n9G6S00EymduV+Y1K3b0RRw6qsA/yiZTtEc0BwVO1l491aYs6s8yoY6WCte/OOtW3vGTaHebgKNaYxt6Jdy2ygWN0vhWvk6oqp5fvd7CRYE0ntShGpPSj4Q==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d6f061-3abd-4e88-420f-08d7ae95663a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 01:54:58.2899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDKdS+Kg9QIn69fKMBWJrwTd7u6OeZv3wMJeZQmUuxTa1XNFs5DgfQc/b9g+Pm7mctNNk8/ecdMu+0sz0c03bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6622
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2020/02/11 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:=20
> On Mon, Feb 10, 2020 at 06:33:30AM +0000, Horia Geanta wrote:
> > On 2/10/2020 4:03 AM, Robin Gong wrote:
> > > On 2020/02/10 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > >> On Fri, Feb 07, 2020 at 08:10:22AM +0000, Horia Geanta wrote:
> > >>> On 1/30/2020 10:45 PM, Andr=E9 Draszik wrote:
> > >>>> @@ -140,6 +148,25 @@ static int imx_snvs_pwrkey_probe(struct
> > >> platform_device *pdev)
> > >>>>  	if (pdata->irq < 0)
> > >>>>  		return -EINVAL;
> > >>>>
> > >>>> +	pdata->clk =3D devm_clk_get(&pdev->dev, "snvs-pwrkey");
> > >>>> +	if (IS_ERR(pdata->clk)) {
> > >>>> +		pdata->clk =3D NULL;
> > >>> Using devm_clk_get_optional() would simplify error handling.
> > >>
> > >> It sounds to me that this clock is not at all optional and the
> > >> driver currently "works" only by accident and therefore optional is =
not
> suitable here.
> > > Yes, then we need to add all snvs clk in dts for on legacy i.MX
> > > chips in this patchset to avoid any potential function broken.
>=20
> How many are there? I am not too terribly opposed of having the driver ha=
ndle
> missing clk if there are very many legacy DTSes out there. But then we ne=
ed to
> handle it properly (i.e. current iteration does not handle referral prope=
rly for
> example).
There are four dtsi which have clock support in snvs-rtc  including i.mx7s/=
i.mx8mq/8mm/8mn. So for this patch set, it's better update
i.mx8mX dtsi except i.mx7s.
>=20
> > In that case the DT binding should be updated too, to make the clock
> > mandatory.
>=20
> I think this should be done in either case, as as far I understand the pa=
rt can not
> function without the clock and it worked purely by chance on some systems=
 as
> something else was turning the clock on.
Yes, for all chips snvs clk management added, snvs clock also has to been a=
dd
in snvs_pwrkey dts, but for others legacy chips like i.mx6X which have no s=
nvs
clk management, snvs clock is always on, so no need such clk in snvs_pwrkey
dts either, optional is better.
>=20
> Thanks.
>=20
> --
> Dmitry
