Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4474B3D07
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 17:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfIPPBW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 11:01:22 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.2]:47528 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728235AbfIPPBV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 11:01:21 -0400
Received: from [85.158.142.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 24/BF-11748-DB3AF7D5; Mon, 16 Sep 2019 15:01:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSf0wbZRjHebnrcZBWb6WM17Jq0qAI0tJ2kZS
  pE/2HRra5H9HEzTmu9EablQN7xRWNKTD2x8pA3MaUGtaNwWK7IYSZCYwuCmQUmLahm4UuQwzM
  DDZ1AmmGIHrXK1P/+zzP9/v8eN88OCIew6Q4ZbNSFpo0y7Ek1JiDvajoP2/fr2paFmldQz8It
  IOt94DW09SLaicXIgLtw75biPaodyghH9P1Ou8k6Lo9xzDdJ3+pdIvdT+9E9wpMtL7MViQwXv
  EMY+WujbYrofOgCoTFDpCEA6IdgYNfuhL44DoKhydqBXxwGcCV+mWMC1DCh8DOYCiqiIlT8TD
  s8CEOkMgGMwBe79dxjBFaeNI3Ha2QEIsAdngaARcgRAeADc4+wLmSiULYNxdmGWdd2+Dn9R9x
  aQmhgYH7DdGmKPEsPPKHI55jEUHCcGgZ8MNoGBzyRTmReAVOj45H/YCQwaXqi1FGiFQYnnVFa
  yFBwLZ+P8JzCpybWRPwfgqO1EwAPp8Nvw/NxlgOz7QMxVgGx111Md4OVy+NRB8GibsA9l4+jq
  wXt630xVgL2+qOoty7IJEO1wYq+XQ5/C3oi1meg9/86I/ttgk2N1WDRpDj/M/aPGfDs1cXMJ5
  fgBfO3Uec0a/YAEeaZ9GzAPWAPL3FVGK0lpIms0KtUinU6s2KzQqNRqMkP1SQSqpCUUzRVgvJ
  qkryMKNkKkuLzQYlTVm7AXtXhveRqR4QaH6gHABP4fHyFJFMbt8vfkJfZqg0kozxgKXCTDEDY
  BOOy6Ho1XOstsFClVC2gyYze53rMsSFconoRisri5hyspQxlfDSKFDgjXMtrYgYpctoSpoq+p
  vrQXAmYwX9uMX6jY8DmTRZBOLi4sTCcspSarL+X58HqTiQJ4u6uS5CE219PGmeXSKeXSKz+GN
  uCSv5ryStilcf+qxrOD8ie0Q8Mo4W+E+377Hlldg7i9J++j137JldNVsnbKfTM3On8ItFiozA
  8WH0nYXR1SJ91mrOVxke8u1bb9VN0+89DCc1PJk4mNbSNBY+eXPM4o2Q735aeKO6p2u7YfEl5
  0yKoewa7b96STO1615Bhfm1PYbsjiXVJNZz2+0qfJDrXTmUD7bVKyrz7gYuZK7ZiX2qYOQ77a
  /UGwPpmV1qXVat128vYATCg1sYiUu4b1L+9ZvzJ9Jqv43cXqlyP/9z295fjmQYT8HWTv0atdG
  7iv557M5NZXpWaKfHHaDapb4a87XpA1tCH5x4PXXWvTv35a07cg5LvnA7dgeX5ChjJNVZiIUh
  /wEyTFF6XgQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-20.tower-229.messagelabs.com!1568646075!6298!1
X-Originating-IP: [104.47.6.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17318 invoked from network); 16 Sep 2019 15:01:16 -0000
Received: from mail-ve1eur02lp2053.outbound.protection.outlook.com (HELO EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.53)
  by server-20.tower-229.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Sep 2019 15:01:16 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF/6pPDTrla///3e1UMs0h2RsrK3T5lOp1jqKDqW/ZOFPAYKHzQ2a9v+GIlH4tDlaU7zIWKjGRgKKdilEO/+gPN981QMSGMIiWTf2flw0FjlqWucAe4ug31+ORHeONcWxtzti2rw/qMKBAIXjssTZCJGwTUJAknSy+u4DhmMTmPtm9FJ6EPL3aJ80wNo1qSxDzlWE5aG62O8/L7+BggHtrZSKHJrmfKAaWdqu1Z3gxAmMIUiRrTtH5ecR1SYVgi+tevJXxC8PS2yB+f61OctX0I2FhRq7STO0/tl0AVXK8zRC7O+D7lgi5rrFix6QrSgFDmRfvr8l0gQXHV6xGAAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tC3h6hHLHvY/Yfl35cxWNLPXiUvDE5ydYDHIOyBHsrw=;
 b=QTkkqbItBQkkOO3LPxdiBWAm8zkipxMdbyQYuax89YaX2xfqOXEETo4Kr8hbb4hxcrV5ddTnKiOapTtRnqfn6JOXvgqgjG9mkjTnQk0V2LGzmkWLWdjsEuY6lEB80r8H5MOiWhgrQ6npZOUNzpP8BqfWHgOhBup/Zi1u+o36Y8JoxC6bgt4JBMrEIVvC0G7f+8Mek2j2vYQgU2zvLs3aUzfANQnMQvd04whT+mHklpqafPMGQMDwe94wEvmpHPkq4LRqtEesj8FBiaRZo2ZnUVlPQa/Od+ykzzVYjKV4ObUuWhdqWEXDrDPma9iWJZCKWdrdOLROI32otEQXN9YSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tC3h6hHLHvY/Yfl35cxWNLPXiUvDE5ydYDHIOyBHsrw=;
 b=Ih9bYP2mZHfi8+jgBDq9A6uTLxW6AHctLZ430WUQSerbOKqL1HzYj/d5T5yj2d7wwzgeqvmGaTXCS1X8n2Xp0BF+EsXta24ODJv9H2bXJAww7FM9s1G+vmECl2CS0kmtB9OGMRtVQJ1MG1vCLyDaKWb5F6jZOa88hggPKq5AeGk=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1089.EURPRD10.PROD.OUTLOOK.COM (10.169.155.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Mon, 16 Sep 2019 15:01:14 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230%3]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 15:01:14 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 2/4] input: misc: da9063_onkey: add mode change support
Thread-Topic: [PATCH 2/4] input: misc: da9063_onkey: add mode change support
Thread-Index: AQHVbJecPF3oj7kATUicChwp+YvuNKcuX9AA
Date:   Mon, 16 Sep 2019 15:01:14 +0000
Message-ID: <AM5PR1001MB0994427D3D456A68B827CFD8808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-3-m.felsch@pengutronix.de>
In-Reply-To: <20190916140358.30036-3-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83365dd7-a613-45b8-beda-08d73ab6b85e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM5PR1001MB1089;
x-ms-traffictypediagnostic: AM5PR1001MB1089:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB108949E4A47247FD339B62D7A78C0@AM5PR1001MB1089.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(39850400004)(346002)(396003)(136003)(199004)(189003)(6116002)(14454004)(3846002)(316002)(186003)(7696005)(102836004)(66556008)(66476007)(8676002)(66446008)(64756008)(55236004)(76176011)(11346002)(26005)(6506007)(76116006)(446003)(53546011)(478600001)(99286004)(81156014)(86362001)(476003)(81166006)(8936002)(71190400001)(110136005)(14444005)(256004)(66946007)(71200400001)(54906003)(66066001)(6246003)(6436002)(2906002)(55016002)(229853002)(5660300002)(74316002)(486006)(25786009)(33656002)(53936002)(2501003)(9686003)(305945005)(4326008)(7736002)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1089;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Aul4yC2TKV9Qpjgfur+0AZjc3Im/py0Jgu7wa/SpTvCn6HSAFHKFBE+ekZok8y5+pTCi3aeQXVxmTKbRrLRu8exp8Ac1nwTLm+feNG2JEjqcK0ue5esq3EuU6Qn7zF95hFOp2KwQQYPucrd42ecq+HVU2joQIErDTDho6Z8+pu4LOXbZa8GZXVNcdNPiFSIzoT3pL6UgidvxMhPxffK/zKBi0EIOf9Bh3+XHkj9jlgaXqi9YTGJO86sTpKsWCI7JNcc/CeGJ/WFInHzrIHsY3lDaTrrAuhE8z1onae0nUnjvivzGeOuB9GNb2GoWLVUyHrdB/WjRhWX259rPtluWBmWOTBmuRy4A0Gzv7SKjSjrSkjk243Bby5r3leCflC/JahUrCdqZLY3JwSob82OH2rNqT8UyfyE3YckiGNbjeis=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83365dd7-a613-45b8-beda-08d73ab6b85e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 15:01:14.6111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QYPmuMZITG8x6S+8oMMNKugJn/ZEGcnPsuo5q309fR+AQlrNqDo5M4AnDtGh4u9OsiDjmcGXMnH1qqfP30sbnQtFq05TxSS5xQdUKPjP5YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1089
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16 September 2019 15:04, Marco Felsch wrote:

> The pmic state machine behaviour upon a 'onkey press' event can be
> configured using the ONKEY_PIN bit field. Most the time this is
> configured correct by the OTP but sometimes we need to adjust the
> behaviour so we need to add the support here.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/input/misc/da9063_onkey.c | 10 ++++++++++
>  drivers/mfd/da9062-core.c         |  1 +
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/input/misc/da9063_onkey.c
> b/drivers/input/misc/da9063_onkey.c
> index fd355cf59397..bc982fcc87eb 100644
> --- a/drivers/input/misc/da9063_onkey.c
> +++ b/drivers/input/misc/da9063_onkey.c
> @@ -40,6 +40,7 @@ struct da9063_onkey {
>  	const struct da906x_chip_config *config;
>  	char phys[32];
>  	bool key_power;
> +	u8 key_opmode;
>  };
>=20
>  static const struct da906x_chip_config da9063_regs =3D {
> @@ -193,6 +194,7 @@ static int da9063_onkey_probe(struct platform_device
> *pdev)
>  {
>  	struct da9063_onkey *onkey;
>  	const struct of_device_id *match;
> +	unsigned int val;
>  	int irq;
>  	int error;
>=20
> @@ -220,6 +222,14 @@ static int da9063_onkey_probe(struct platform_device
> *pdev)
>  	onkey->key_power =3D !of_property_read_bool(pdev->dev.of_node,
>  						  "dlg,disable-key-power");
>=20
> +	if (!of_property_read_u32(pdev->dev.of_node, "dlg,key-opmode",
> &val)) {
> +		error =3D regmap_update_bits(onkey->regmap,
> DA9062AA_CONFIG_I,
> +					   DA9062AA_NONKEY_PIN_MASK,
> +					   val << DA9062AA_NONKEY_PIN_SHIFT);
> +		if (error)
> +			return error;
> +	}
> +

This driver is used to cover DA9061, DA9062 and DA9063. This binding theref=
ore
can apply to any of those as there's no checking of which device is being u=
sed.
For DA9063 usage, if this option is present then the probe will fail as you=
r
regmap range update below only takes care of DA9061/2.

Ideally I think you should update the da906x_chip_config structure for this=
 to
support all devices as I believe the same or similar options are available =
for
DA9063.

>  	onkey->input =3D devm_input_allocate_device(&pdev->dev);
>  	if (!onkey->input) {
>  		dev_err(&pdev->dev, "Failed to allocated input device.\n");
> diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> index e69626867c26..aaa1f1841bc3 100644
> --- a/drivers/mfd/da9062-core.c
> +++ b/drivers/mfd/da9062-core.c
> @@ -510,6 +510,7 @@ static const struct regmap_range
> da9062_aa_writeable_ranges[] =3D {
>  	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
>  	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
>  	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
> +	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
>  };
>=20
>  static const struct regmap_range da9062_aa_volatile_ranges[] =3D {
> --
> 2.20.1

