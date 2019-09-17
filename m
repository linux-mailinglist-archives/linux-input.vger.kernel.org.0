Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1122B4C26
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 12:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfIQKo5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 06:44:57 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.68]:45614 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726181AbfIQKo5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 06:44:57 -0400
Received: from [46.226.52.200] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 95/F1-28272-329B08D5; Tue, 17 Sep 2019 10:44:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUxbZRTGeXtvS8FW71oqh24lpBYV13YtQVc
  0Jss0phlqUAMaJ8GWXtrGUmpb5CsudREZXXBkzMHqGJRtakqAhUVdJ1MCLV8G5hgOiiPM0Ro+
  atyAEJTJ7O0tU//7ved53vc8581hY7whlpBNVthJq1ljErMSccOehGdlj3kdBYoFF1/V6htnq
  gbaF5DK85kXVwVW1pmqO5d/xlQ1V3zx+1hqr2s2Xt3jqWOpj/2tUK/2pObibzONZm1pxbtMQ1
  dLF24JpFUcdg6zHGgjxYkS2Ig4j4F7Mt2JEiM8iMPH4bs4fbiIYLP+TxblwolhDNa/fpoSeMR
  JBvh/cEUFHjGPoOavtyhmESpoHL4VrScRhTDUMoZRFzBinQF1C9dxSuATOXB5cQY5ETtiehma
  66tp/34ITn6P6Gbp4J2ejTKX0MBpbzdGN15H8MeNjXhKSCCehwtzpzB6BhGsfdQRZYxIhplgK
  4NiIAg413sVo1kAi/NbTNpPwsjhaUTXpTA2FYyxGM60+GIsgonWozF+BQa3aqMhgAghCPXWx2
  9f9o8PxkwqOHe0BqdZCMPX/ExqSCAksNVfSZctEDpZF8vzOEyHj2ANSOH6T2yapdD23QqL5t3
  whXsZc0X/YgeMnAribQj3oL1aq1FvsJdojCaZUqGQKZWZMmV2tmxvplxTJdPKyTJZOWmzy5Ry
  TblNbqssKTLp5GbS3oMiO6WzDKkvoXrfsrwfpbAZYgHXdcJRwHtYW6qrNGhshkJrmYm09aNdb
  LYYuJnfRLQdVlJPVhQbTZHN3JaBzREncT/4NiJzbRZNic2op6VRJGM3LLa0YzzcXGomhcncNc
  pEUCZDmfnBE9v7PYFEQj4XxcXF8TgW0lpitP9fX0LJbCTmc3MuRV7hGM32B52WIiEYkRAZRR9
  SIeyafyWhgyG9P/oTd2QisSrrS6HzK+nprdp9xb3LfQ81rUpudJCc3LrbXe83huWdrze7V6XQ
  mTP/xKFfpQP3yz8565nRPaNrPnPv/DFr6dV2ZfUbaSfeuafQcvqO3JQY/JZDv+xUuTtIcd6mX
  vAeP+gI5PUfOLgn4Pht15yEHCoqVPnSq1sfTQ9mSF/MS8ry1zJvXXMXhMRxY2f73pR2H0+d+n
  Ttgtmb/0LnylLqSz13oWn31HMZQf6r+XNtgobsJ38cFcl35hbP5vg20O/hYkG4c6YxJX8ydGd
  Eep0jslpewy6SvVXdaQeOV0nc4xmB5uQmz/7NKwfdAzez8m93r+njPn+kCHeNinGbQaN8CrPa
  NP8AJRjRKFoEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-5.tower-288.messagelabs.com!1568717090!128185!1
X-Originating-IP: [104.47.9.58]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31298 invoked from network); 17 Sep 2019 10:44:51 -0000
Received: from mail-ve1eur03lp2058.outbound.protection.outlook.com (HELO EUR03-VE1-obe.outbound.protection.outlook.com) (104.47.9.58)
  by server-5.tower-288.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Sep 2019 10:44:51 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8TeVfAf6CSRq4v+32Elei1/Pio1pFmqeuhkkyTn3gJnhAQnuVYjB46J2bpUtEVuVJ7Z7v/F/w8jCqb6nA9aehSitEuJQTi1Np89UuKat9cALeZ3cw/b0Lln+wYUYQbR6GfVbjRnJmiBACAqb4pfI8oZSRJqaOV8YwFbedO+f8EEih+5/C5YG5cA4Trjme2eeapz3sQwhMrarirPTEClL6B9VExAWzG//THOWbLjl+YPeDLyn5/hferh01Q9G8mZ7E+8rzx4MYvlwa6u0OZqtElERoOz8Bym8mnKYatyf/ImRi/Tk5Wblf8ryJLWsoLi1cguFUfDWjRzx9R01U6VzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Nmz5i3BDXnh8FO8rcE5S3g01IXD7WUsp5s7xWsJBjc=;
 b=TSPvcMNvHJnhBRqR+0InD92dv9CO8nXjQytThzi2yAlS/WVyPjT5H+Dv7PSAuC54FTCaZu6ErDVPkr2hsR8DtvpCtqk1b+P4/SntMEcB9/KPs0QRazcA4H5Rt00hmUQvfBvg8vvICRk5PfIpIPlpbYnGKykPK4EOVHuzeRwqZoo1WDqsn+uhOymSMCLtUXYrQs4XpBYTgjqO1CVEFEOoj4NNl5+rCWdTfsWyfp+ZtcrrcvIcXTZSlTtHklRD0hjIL2OzuJN5uTvMCwh3LDKOclcZzMkJQ90TRo7E3DkUBx/LzkNe6Voebid1kL9zTZUJw0mHxrbevAVbeYzoHNhg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Nmz5i3BDXnh8FO8rcE5S3g01IXD7WUsp5s7xWsJBjc=;
 b=jADZDviBwDeiVY/1OYa+beQ9IdsWmYlcbyNgLo5MIs2a4tAcubKnoe2Of1b6neimlxCQmQufLooHRSyRioWFFlYdiTGqY+jGBXh94lRvKJlkzVU0hNDGhYbbcXofwWHJ8uFOyMUtjSOeTxlh/ky74UpKXEpuPx6XEdrCvloFK0Q=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1201.EURPRD10.PROD.OUTLOOK.COM (10.169.155.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 10:44:40 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 10:44:40 +0000
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
Thread-Index: AQHVbJecPF3oj7kATUicChwp+YvuNKcuX9AAgAFJloCAAAVroA==
Date:   Tue, 17 Sep 2019 10:44:40 +0000
Message-ID: <AM5PR1001MB0994F5DB42CEADD614FA680F808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-3-m.felsch@pengutronix.de>
 <AM5PR1001MB0994427D3D456A68B827CFD8808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190917101847.h22mtdtqbrlvdpxb@pengutronix.de>
In-Reply-To: <20190917101847.h22mtdtqbrlvdpxb@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6559cbdf-7fdd-4c66-5ec9-08d73b5c0b39
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM5PR1001MB1201;
x-ms-traffictypediagnostic: AM5PR1001MB1201:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB120144476A8DDA0DB1231CD1A78F0@AM5PR1001MB1201.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(189003)(199004)(81166006)(99286004)(2906002)(81156014)(86362001)(26005)(256004)(14444005)(102836004)(8676002)(25786009)(6506007)(478600001)(74316002)(7736002)(52536014)(66946007)(53546011)(66066001)(64756008)(55236004)(76116006)(66476007)(66446008)(66556008)(11346002)(305945005)(6246003)(446003)(5660300002)(55016002)(6306002)(229853002)(33656002)(76176011)(316002)(9686003)(476003)(71200400001)(3846002)(7696005)(8936002)(6116002)(966005)(14454004)(186003)(6436002)(54906003)(71190400001)(4326008)(486006)(110136005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1201;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3aJz0r+ocX0H93qMk3itOiL0iMu3wJyR93WP4PoG8WncfQaicy3DUGH5khlaH74tzpHS+Edg0ZMFywVNOSMQ02ffxsmrx3GYRWWR79IV7TX2J4VlQZMpL+/KQs4SZdq8xWxzQ4wAtHuAbuva2y6cA7W7QTm4nlcoYzqWbSjIc+0MxiH9ZvwVYMSkK3xizTceBElt/YUdkHO/C+Nspou8vaxvFMDPo9KPozCq1rqDp9BtTPu33fvWqfJMHmvPv9quDuFkE6MZFCDoHE6HbqtlckWAds2LrWaKEBhxB7vPxtXrj/El76uG43ay0KqT4EVgEFNv2FIovX8ojBKxSCSj+Fe28x47nQj51BaNkyilJywJamiwq4QZk5Eyuh+UO9RVgeFQHD+r2IgnCrDFu4kl/9Z064Rjo2kSScPFwGKV7mE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6559cbdf-7fdd-4c66-5ec9-08d73b5c0b39
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 10:44:40.5744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UzMl7/RmPWj/nbXuZPOlCTlhbTEYhiqEYQgYuXZ6R/+WcUcrV6lhQw+uvy69OZfHzizhFh+4v86cAiaWDXhPwGVOBS7dDrYaHUIuQmzEHtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1201
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 17 September 2019 11:19, Marco Felsch wrote:

> Hi Adam,
>=20
> On 19-09-16 15:01, Adam Thomson wrote:
> > On 16 September 2019 15:04, Marco Felsch wrote:
> >
> > > The pmic state machine behaviour upon a 'onkey press' event can be
> > > configured using the ONKEY_PIN bit field. Most the time this is
> > > configured correct by the OTP but sometimes we need to adjust the
> > > behaviour so we need to add the support here.
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  drivers/input/misc/da9063_onkey.c | 10 ++++++++++
> > >  drivers/mfd/da9062-core.c         |  1 +
> > >  2 files changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/input/misc/da9063_onkey.c
> > > b/drivers/input/misc/da9063_onkey.c
> > > index fd355cf59397..bc982fcc87eb 100644
> > > --- a/drivers/input/misc/da9063_onkey.c
> > > +++ b/drivers/input/misc/da9063_onkey.c
> > > @@ -40,6 +40,7 @@ struct da9063_onkey {
> > >  	const struct da906x_chip_config *config;
> > >  	char phys[32];
> > >  	bool key_power;
> > > +	u8 key_opmode;
> > >  };
> > >
> > >  static const struct da906x_chip_config da9063_regs =3D {
> > > @@ -193,6 +194,7 @@ static int da9063_onkey_probe(struct platform_dev=
ice
> > > *pdev)
> > >  {
> > >  	struct da9063_onkey *onkey;
> > >  	const struct of_device_id *match;
> > > +	unsigned int val;
> > >  	int irq;
> > >  	int error;
> > >
> > > @@ -220,6 +222,14 @@ static int da9063_onkey_probe(struct
> platform_device
> > > *pdev)
> > >  	onkey->key_power =3D !of_property_read_bool(pdev->dev.of_node,
> > >  						  "dlg,disable-key-power");
> > >
> > > +	if (!of_property_read_u32(pdev->dev.of_node, "dlg,key-opmode",
> > > &val)) {
> > > +		error =3D regmap_update_bits(onkey->regmap,
> > > DA9062AA_CONFIG_I,
> > > +					   DA9062AA_NONKEY_PIN_MASK,
> > > +					   val << DA9062AA_NONKEY_PIN_SHIFT);
> > > +		if (error)
> > > +			return error;
> > > +	}
> > > +
> >
> > This driver is used to cover DA9061, DA9062 and DA9063. This binding th=
erefore
> > can apply to any of those as there's no checking of which device is bei=
ng used.
> > For DA9063 usage, if this option is present then the probe will fail as=
 your
> > regmap range update below only takes care of DA9061/2.
>=20
> That's right and I only updated the da9061/2 bindings..

D'oh! That's what comes from taking a holiday the week before. :|

>=20
> > Ideally I think you should update the da906x_chip_config structure for =
this to
> > support all devices as I believe the same or similar options are availa=
ble for
> > DA9063.
>=20
> After checking the da9062/3 register.h this bitfield is the same for
> da9062/3 devices. What about adding a comment here? The CONFIG_I
> register is already writeable for the da9063 devices.

Given the current implementation of this driver only uses tables to access =
the
correct registers and masks for each device, it would be neater to follow t=
his
approach, although I am aware the register addresses and bit fields are the=
 same.

> Regards,
>   Marco
>=20
> >
> > >  	onkey->input =3D devm_input_allocate_device(&pdev->dev);
> > >  	if (!onkey->input) {
> > >  		dev_err(&pdev->dev, "Failed to allocated input device.\n");
> > > diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> > > index e69626867c26..aaa1f1841bc3 100644
> > > --- a/drivers/mfd/da9062-core.c
> > > +++ b/drivers/mfd/da9062-core.c
> > > @@ -510,6 +510,7 @@ static const struct regmap_range
> > > da9062_aa_writeable_ranges[] =3D {
> > >  	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
> > >  	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
> > >  	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
> > > +	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
> > >  };
> > >
> > >  static const struct regmap_range da9062_aa_volatile_ranges[] =3D {
> > > --
> > > 2.20.1
> >
> >
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
