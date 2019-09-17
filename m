Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B976FB4C37
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 12:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfIQKtk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 06:49:40 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.66]:43883 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726843AbfIQKtk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 06:49:40 -0400
Received: from [46.226.52.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.eu-west-1.aws.symcld.net id B1/B3-11059-04AB08D5; Tue, 17 Sep 2019 10:49:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJJsWRWlGSWpSXmKPExsWSoc9jqmu/qyH
  W4M0uPYv5R86xWhxe9ILRYtXUnSwWNz99Y7X4sOsqs0Xr3iPsDmweO2fdZffYtKqTzaP/r4HH
  501yASxRrJl5SfkVCawZ5x7LFTSrVNzZ/pulgXGiTBcjFwejwFJmiSl911ghnGMsEl3XLrNDO
  JsZJX73/mQDcVgETjBLNN6ZC+YICUxjkviy7QozhPOYUaLjz2OWLkZODjYBC4nJJx6wgdgiAv
  ESG9f3MYEUMQt8Y5LofHEZrEhYwFti18tbjF2MHEBFPhIzeqsh6t0kFnWfZAKxWQRUJZqW/AI
  r5xVIlJixYysrxLIzTBJtZ7+AJTgFkiTmvukHW8YoICvxpXE1M4jNLCAucevJfLBBEgICEkv2
  nGeGsEUlXj7+xwpRnypxsukGI0RcR+Ls9SdQtpLEvLlHoGxZiUvzu6FsX4k3yz+DfSwh8JRR4
  umeXnaY5qPnjkEVWUgs6W5lgbClJE5cPMoK8qSEgIrEv0OVEOECiVcrzkK1qknceNPBPIHRYB
  aSsyFsHYkFuz+xQdjaEssWvmaeBQ4LQYmTM5+wLGBkWcVonlSUmZ5RkpuYmaNraGCga2hopGt
  oaaFrZqGXWKWbpJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJEZiqUgqOuexgfD3zjd4hRkkO
  JiVR3llTGmKF+JLyUyozEosz4otKc1KLDzHKcHAoSfAabQPKCRalpqdWpGXmANMmTFqCg0dJh
  Hf/DqA0b3FBYm5xZjpE6hSjLseEl3MXMQux5OXnpUqJ837ZDlQkAFKUUZoHNwKWwi8xykoJ8z
  IyMDAI8RSkFuVmlqDKv2IU52BUEub1BlnFk5lXArfpFdARTEBHaCbXghxRkoiQkmpgkk1tkrp
  rV/w4zymNVyQ8uvPElNyPaf0nnVTN38rdW3N9dtQv3Q3C1RO7nJ2ff+OVYrmllV+6lTFV2Mpj
  jcY3hc0ndk5qept6WEyt5tpkG+80v1CzDpV93fnZjS+lxaRk23bqJgW17Vu16urWw5UH2mXlb
  5y8OGPK09/Rm80a1j3IcZrGk7+v7s+yOd77BcvWi/tVS/Fw/9jw01y9sfgEb60N/5tfk6d5fj
  k+5bNzyfx/rnFiV3OtVNq5Vvj0KPg7nynbstWjZpNOgL5V5Gv/Ff41YVNvO7KUBh6Xu8HLdeG
  igHV2/Muj+2P4lfUeWAqv1tG62nuafaK1yYPEdqWk0r6VLVr6nR9PGAZsdFFiKc5INNRiLipO
  BAAc/7jSXAQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-13.tower-282.messagelabs.com!1568717375!20497!1
X-Originating-IP: [104.47.12.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22653 invoked from network); 17 Sep 2019 10:49:35 -0000
Received: from mail-db3eur04lp2053.outbound.protection.outlook.com (HELO EUR04-DB3-obe.outbound.protection.outlook.com) (104.47.12.53)
  by server-13.tower-282.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Sep 2019 10:49:35 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHiBmHaFSCv02O/+U0MlWs3hhfo6rvtTfIHZWZPIQZHCTMB1OnidYtIqpCvk3ptljS0dluMCFnyZ7ypOUHVej/orOqvbTbxRO93v94b1tOEEVbrZAwBfnhHp0+OA9gtaKziz3OkMvhMmrQmPDNvt2F+8ZXuiajgZFj0JCjt1Qch4SqJhc8kVFdiVDz8Wz0hcUJzd5UJQMH5sqjqI/+m2/3iImo6BvNGOTyYsgjjcoAyMrT+KhH/ZdiFQJabC9tP8VVZXD5+0tLXsLasjA7cXlrUyFybR/76e1xblrCsppeQI21BJ1O4JIPobb38CopPBjtMxBeDOqVVRS+3Sqd2fCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avkfaNb3M9wFZ0k9YWngZoktSUWqWeVCOPuklm9ipP0=;
 b=Ori5qpRvGIHdCBcbvSLVBG8GZ+hpOeSfZSYHgB5/qHf3Rkyf3pYyPy28rbboiYa2kA6OViuDFmyGtKW0k8D+0q9MzVP1kNYKEIxFxsKZYlrhXadCUtYv7B1mlIlh2epLxnJnHRhB+52rHDmG5sO2zAhfsyuW1tjuQXu96W2K4Wy13Xv3D7Oe73+nt836z7NwanV2ULqAFOthhR/OPFALxjIvExvyl408dt+lrQw3L003UB/H/KsNlX+qOzCVHHXjOwpcRw0lvvYES1ysy5lnpY2ybKKBYJCUgn29kUudKpdlzOcJp/rC389XzlnKN8P++JWFaieGs0dNQI1SfBgloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avkfaNb3M9wFZ0k9YWngZoktSUWqWeVCOPuklm9ipP0=;
 b=BXMFe6m4jp+o1oLFEfd8wcyo01q+sVvVUqhw0tMWAZXeE2n3SD/agJJAO6XyOYEzUf6Iko3bh20sBJBY4+qprT8cuj+zC79662zVoU6+mh5MlGYh03KdG/VvJAPNW0pDgYi/pm+3A7O4R55I+yx8/8Rp2BYdXmB1ov+FxWnxdXc=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1201.EURPRD10.PROD.OUTLOOK.COM (10.169.155.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 10:49:34 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 10:49:34 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 2/4] input: misc: da9063_onkey: add mode change support
Thread-Topic: [PATCH 2/4] input: misc: da9063_onkey: add mode change support
Thread-Index: AQHVbJecPF3oj7kATUicChwp+YvuNKcuX9AAgAFJloCAAAVroIAAAjgg
Date:   Tue, 17 Sep 2019 10:49:33 +0000
Message-ID: <AM5PR1001MB099450E2B3AF6D7266FB2344808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-3-m.felsch@pengutronix.de>
 <AM5PR1001MB0994427D3D456A68B827CFD8808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190917101847.h22mtdtqbrlvdpxb@pengutronix.de>
 <AM5PR1001MB0994F5DB42CEADD614FA680F808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM5PR1001MB0994F5DB42CEADD614FA680F808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ee981c2-864b-469e-6c32-08d73b5cba17
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM5PR1001MB1201;
x-ms-traffictypediagnostic: AM5PR1001MB1201:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB120128825DE6C24AC04F1EA1A78F0@AM5PR1001MB1201.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(76176011)(316002)(9686003)(5660300002)(55016002)(229853002)(33656002)(6306002)(6436002)(186003)(54906003)(486006)(4326008)(110136005)(71190400001)(476003)(966005)(6116002)(14454004)(71200400001)(8936002)(7696005)(3846002)(14444005)(256004)(102836004)(86362001)(26005)(6506007)(2940100002)(478600001)(8676002)(25786009)(81166006)(81156014)(2906002)(99286004)(66446008)(66476007)(64756008)(76116006)(55236004)(446003)(6246003)(305945005)(11346002)(66556008)(52536014)(7736002)(74316002)(53546011)(66946007)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1201;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BfjGlJGwj5Ys12DfTg7VQM2JwXN9RYP6glcW9qAKFzROZ+d9le0IRlIKjLyxovxSt96W1y6XBcu23uqsemlspxiwH5Ym8C8A5bnTr4Fhv3TWrvLPJx5VnEoZdDBH8cEE3x3PB2JcYr6NN1Vc6WI05FWRtq6UQueYzzbo474KHV+Yl2pnWsFqC6x/WMh9ZMH5WdNNXZdU8YVb740vpkTqltUmgzNvUYjTcl+J5oPTKyA3bpIip3NbA72MiB+e2l4F60oQErMnG0Xzod698Yh2/oV4ASDGypt/d59v+ed6FWJ+sQqY9MySIX2CfknSGdeol0/hTkirktt48RWGIE+pcu9FsIhxecPTiuk+hOn+9keZN+UbW97NeiKfocC5XkOXZPUIOClok6CHa5y7Asfk8hUjUaP+GClAdppaYRcNGJs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee981c2-864b-469e-6c32-08d73b5cba17
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 10:49:33.9332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7vVOJcT1ToX6OqiVUFVpbWLQb+p4z8Qesg8xu34WIZZS5NZGIx7AGyjJ6DzFR+IHAPIxBxxsQvh0hAW3xjBg2hVUG0oeVi/RM5ws9wxrB9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1201
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 17 September 2019 11:45, Adam Thomson wrote:

> > Hi Adam,
> >
> > On 19-09-16 15:01, Adam Thomson wrote:
> > > On 16 September 2019 15:04, Marco Felsch wrote:
> > >
> > > > The pmic state machine behaviour upon a 'onkey press' event can be
> > > > configured using the ONKEY_PIN bit field. Most the time this is
> > > > configured correct by the OTP but sometimes we need to adjust the
> > > > behaviour so we need to add the support here.
> > > >
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  drivers/input/misc/da9063_onkey.c | 10 ++++++++++
> > > >  drivers/mfd/da9062-core.c         |  1 +
> > > >  2 files changed, 11 insertions(+)
> > > >
> > > > diff --git a/drivers/input/misc/da9063_onkey.c
> > > > b/drivers/input/misc/da9063_onkey.c
> > > > index fd355cf59397..bc982fcc87eb 100644
> > > > --- a/drivers/input/misc/da9063_onkey.c
> > > > +++ b/drivers/input/misc/da9063_onkey.c
> > > > @@ -40,6 +40,7 @@ struct da9063_onkey {
> > > >  	const struct da906x_chip_config *config;
> > > >  	char phys[32];
> > > >  	bool key_power;
> > > > +	u8 key_opmode;
> > > >  };
> > > >
> > > >  static const struct da906x_chip_config da9063_regs =3D {
> > > > @@ -193,6 +194,7 @@ static int da9063_onkey_probe(struct
> platform_device
> > > > *pdev)
> > > >  {
> > > >  	struct da9063_onkey *onkey;
> > > >  	const struct of_device_id *match;
> > > > +	unsigned int val;
> > > >  	int irq;
> > > >  	int error;
> > > >
> > > > @@ -220,6 +222,14 @@ static int da9063_onkey_probe(struct
> > platform_device
> > > > *pdev)
> > > >  	onkey->key_power =3D !of_property_read_bool(pdev->dev.of_node,
> > > >  						  "dlg,disable-key-power");
> > > >
> > > > +	if (!of_property_read_u32(pdev->dev.of_node, "dlg,key-opmode",
> > > > &val)) {
> > > > +		error =3D regmap_update_bits(onkey->regmap,
> > > > DA9062AA_CONFIG_I,
> > > > +					   DA9062AA_NONKEY_PIN_MASK,
> > > > +					   val << DA9062AA_NONKEY_PIN_SHIFT);
> > > > +		if (error)
> > > > +			return error;
> > > > +	}
> > > > +
> > >
> > > This driver is used to cover DA9061, DA9062 and DA9063. This binding
> therefore
> > > can apply to any of those as there's no checking of which device is b=
eing used.
> > > For DA9063 usage, if this option is present then the probe will fail =
as your
> > > regmap range update below only takes care of DA9061/2.
> >
> > That's right and I only updated the da9061/2 bindings..
>=20
> D'oh! That's what comes from taking a holiday the week before. :|

Actually I was right the first time. There's one binding covering this driv=
er
for the 3 devices so my original point was valid although if that register =
is
in the valid regmap_range for DA9063 then it would succeed.

>=20
> >
> > > Ideally I think you should update the da906x_chip_config structure fo=
r this to
> > > support all devices as I believe the same or similar options are avai=
lable for
> > > DA9063.
> >
> > After checking the da9062/3 register.h this bitfield is the same for
> > da9062/3 devices. What about adding a comment here? The CONFIG_I
> > register is already writeable for the da9063 devices.
>=20
> Given the current implementation of this driver only uses tables to acces=
s the
> correct registers and masks for each device, it would be neater to follow=
 this
> approach, although I am aware the register addresses and bit fields are t=
he same.
>=20
> > Regards,
> >   Marco
> >
> > >
> > > >  	onkey->input =3D devm_input_allocate_device(&pdev->dev);
> > > >  	if (!onkey->input) {
> > > >  		dev_err(&pdev->dev, "Failed to allocated input device.\n");
> > > > diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> > > > index e69626867c26..aaa1f1841bc3 100644
> > > > --- a/drivers/mfd/da9062-core.c
> > > > +++ b/drivers/mfd/da9062-core.c
> > > > @@ -510,6 +510,7 @@ static const struct regmap_range
> > > > da9062_aa_writeable_ranges[] =3D {
> > > >  	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
> > > >  	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
> > > >  	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
> > > > +	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
> > > >  };
> > > >
> > > >  static const struct regmap_range da9062_aa_volatile_ranges[] =3D {
> > > > --
> > > > 2.20.1
> > >
> > >
> >
> > --
> > Pengutronix e.K.                           |                           =
  |
> > Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
> > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
