Return-Path: <linux-input+bounces-688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B27C080D344
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 18:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1DC91C20AAB
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 17:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE574CE00;
	Mon, 11 Dec 2023 17:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vnbnADoi"
X-Original-To: linux-input@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBFDB4;
	Mon, 11 Dec 2023 09:07:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIb/UsCfD4V7jMLiFnklBJYSBEFPb6I1ony756IEPmTPAvyR9NIHYpVNR6kbO8GuUF0w0g5sFITQQSermdaYXXyQKQeQS0ikSCu+JMeHvtein8k2tZzUf4Y46+bzmHc3yBA+kRh0EnIv21vGpzmOTcKETDAGLivraf0I8c91azq3bEfC4OMO7i4FacLKHGyovI7767ji307okSKxlD+n5b3OWzmBcDgpRu/7GaBMt7oQLzIqdi6JB6gUpGa4WYw1vRpbsxQzksaTS1E+CPGJXpeeOuNJSzCtcluJH1c8LvW/MIarMVvu4/iL5Ps4SNNveRevbQFyWzl21/5khwIQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1+5sV9+vEILc1CmuKGHwOj57vkWs3hiDe85InjmalM=;
 b=M4ewcjsvrO5jw/wTpZubl7SBfYbYPpEiKTB+vj+8y5OOth33JS/sXH4ZJF/lsfMjetsqrQY+fcMECS9q9ZKTCrBQFyPygmq8WCaE3OV7zkVwxdU/rFZ/sTy88uhzpaL2rY43IvnvULh8X0APkUjDST0hToqolQtcz5f0MDXJDDxRLKigMOA4Wsv+dZuypNRDoj/M2EKZvBwcTI8OkiCXOU5NDgBlqgG2cUel6MhNVu3XOWV+gviVTA06jjz2JM/irz3DEKZzsnpnVLY2ee+isrC+F82HdQypIGiUErT4InNE7r4a9ikG7T/RCpEvatAq8Phgw4Pcioo9ZJoKzbI8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1+5sV9+vEILc1CmuKGHwOj57vkWs3hiDe85InjmalM=;
 b=vnbnADoirCl7vXXYzp9XZ4pDXWiryzUJcAOZ7Ktv/xSWoYD+QOcfY8l6RNw7GhxzOm6cISAQ5Xy8VaU+B6RduLcZhzwoF0eS/mypAkVk6NT1PLT8hi8mG4VPTdaH0oScBsVCwFtuj+i4DsBZmGRlJhOG9RxnBm+sWrueRwTWdUk=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB9390.jpnprd01.prod.outlook.com
 (2603:1096:400:1a3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Mon, 11 Dec
 2023 17:07:06 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 17:07:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>
CC: Support Opensource <support.opensource@diasemi.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] Input: da9063 - Add polling support
Thread-Topic: [PATCH 3/3] Input: da9063 - Add polling support
Thread-Index: AQHaLFMdt6rSMJSo40ixMAE+BiEYmbCkT7Yw
Date: Mon, 11 Dec 2023 17:07:05 +0000
Message-ID:
 <TYCPR01MB112693938225D6D0C7DCB05CC868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231211165708.161808-1-biju.das.jz@bp.renesas.com>
 <20231211165708.161808-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231211165708.161808-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB9390:EE_
x-ms-office365-filtering-correlation-id: 94d431e1-89fa-48be-a6dd-08dbfa6b9a3d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Z9bzIXtuyy4lZJihTXaqn1PelGigAISmUtZhN9cyxzNgjmQeFcFxrQckX7fYRsp9GL5hm578EK90hbGufYDQMud5lkpYnUNMvUkqe6OAl3FVEdOGKf2mPq18+hDhoYm2CatTTOox2F0X7RNrDc041mU0ptc6wqyWQnrzTVUz2zNzTUpTumhmV1aFm10Hx3Dp9xe0egeKJ44sc+ZSl3mxrWHkDs1AcjGp8xYAVHHhrKPl/aP2fkBG+kD9psSuxutADl8Cu9hvdic830Ttzhd09KH6v2rp5tgvUx3OHlllhfsQCRfnvl+EtDq9Hv7nRbODYEgEOMiuDmsozrRQDR+2a5ZISfI6I85YRsSDu1RxllmYWi8MJMTwC0KYg3iiT+af2VtHgjZIBI4kOkoXRyc03ygv/ya5UNHe5ZSxc/mKM9fS+3TmDAkGAA9NzAvW3PUh9D0MZnNYE+3JUsNbsz2/j43QADl8xI4ABIMwjVrzPIPQ7hJ3bVn5MIpghDD/08AMmf8d9ya9CIPzbUrNsBImwYUfFJyCTrkTX0663RLSkVN7hc3w3tcImXe+AVPHSh11sN6rITIQXMZM+l+AaCV2lTplMyYTXCFlM1p3eKygEz0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(55016003)(33656002)(38070700009)(26005)(7696005)(6506007)(53546011)(66476007)(110136005)(66446008)(478600001)(966005)(8936002)(4326008)(8676002)(66946007)(66556008)(9686003)(64756008)(54906003)(52536014)(76116006)(316002)(71200400001)(2906002)(41300700001)(5660300002)(122000001)(38100700002)(83380400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aZGMSRp3Dq60RsbmZkgTo12UYIlkszvC0Hrbb7KiIIyT3fEga488DJFfzZvw?=
 =?us-ascii?Q?aw1GKIwGXLGNMCSfqq+Fqvh/ooNvmIJzMtE5sxLzot2lVtl/kTvg+KVe8rlq?=
 =?us-ascii?Q?DImwXunysWKukgir9i4+c44OrLWA+h+AvAglAlckWVpjVYgD28b/YuOKpldf?=
 =?us-ascii?Q?YZSTauY1ASRXUYGiIzP0hG0bNdGQUYaSzpkzN5T14N+ZJ4ZGOBs6D+eDrnAl?=
 =?us-ascii?Q?TPILjDg/aDKUaBt+gUGn7QVXa7hcCs9+iE48K1HmuDKcIOVJRJa+adsrqMxg?=
 =?us-ascii?Q?Isl6NHdTdbj3RVLzHJiwij0GQMBWW99RCqMkNJDeOgF84MGEHNnHOb0d0Jou?=
 =?us-ascii?Q?fdW4I6zLWNoYYE7u/fn85Wmq2HrxPpCcVxBfZ88+N8XWmpKE5hACKLHQzy+1?=
 =?us-ascii?Q?42j34S3Pji68mspFhLOqpcAd6wM7bXkhXMC8B9gHPQxRg2dAtTA2saG4z25n?=
 =?us-ascii?Q?k+iziIGZIua6aQQ01fm7bOL6SSr6TSAcJcOOMQj2nJmN9LHuv7uAUD5nFZJ4?=
 =?us-ascii?Q?9oQ9UhNyTCtDMdjxQEfHE4RNm7R1tI2E4UuL79iATyyMzxP64rDo0dYJWBRr?=
 =?us-ascii?Q?1CIx7bTHtxSuiR5bYTVTcBl8NjkufO6jWHM66jZ7AWbftyomoW6TwYb5fq9L?=
 =?us-ascii?Q?bA3W0sMwbosRuUZ3g0wnk0BVmy5mESEy8fsKm54Y5ja0r+VDGH55UOIF3LJF?=
 =?us-ascii?Q?/V12hPUV0Q/SD7TXSjT5vmy7o0QD9wEVVNBGUF51CwnL5DDuAQ1DJLxZsdC7?=
 =?us-ascii?Q?QiypG/k/r75DgXkngh5TtEqGYVFcLujtDXL/+BnxYwTVyrYsU85SzHdAXc/S?=
 =?us-ascii?Q?7143Sprxks0Wq0ui0uxjHLnQX4AfzTluaqHlOscb4vAfcNODrfChxL0anmHy?=
 =?us-ascii?Q?3WJFxEjTP9uuFE91y2dpX4vvUto3Bq4AlE7Fkr3ZDY3SFVYkSkPE38MF1dBb?=
 =?us-ascii?Q?KFkiwdlD8BBGEWg90iIyccZAgqMTYuHMpw7jkz8zK51cUPEIuMyj61mZt4uD?=
 =?us-ascii?Q?F0kuCn+fKyM4m0YJsgdJshSmceKfCNO6jMcMrmEaes8XSBkwgRwtHp8XE/yG?=
 =?us-ascii?Q?K5gCi1w6DU+qQoysvPIi+h1W+SYVJbq9vxsQVrSQAC0Vohexqxos0QsgNbKK?=
 =?us-ascii?Q?EiSGIbHmPeP2V/x8r7sORpzu1D8bei0oZiy6Y0FHj5pGDdrMr0IZJgIEzi++?=
 =?us-ascii?Q?tLUe0fXFeZiY6tGjgOKGqO4M6MGAzKjUzSpr82yXOtg7VEAr+32feOiuM+n+?=
 =?us-ascii?Q?eV+wiMxw7mRdvpRTgjQjCVuwvx12UYvH2s2OvUbbjCsbqcmIZDQ12uMW2up2?=
 =?us-ascii?Q?d1VFiOotRDh0uCJnzEyqzzMAdQFPnbQK5Z2fJIFYGrKLOkSb04plSGb7gMI4?=
 =?us-ascii?Q?1FB4RChXN6zwGwyaTpNCtHf/RXMImwQMG5fV1HU5YQBTEu/LuN2Q8TXmdleN?=
 =?us-ascii?Q?7xfoT03+27LG9l3DCakdNpWb+GB9hUQjOFbGyRks48/I8E0Zt9l3osXrduJ4?=
 =?us-ascii?Q?6goVreAQVWvNz8vt1yd7wLL6hiSOL2vjKgCo0A+kJ5E+jN3+wLEHMc+V2ZXT?=
 =?us-ascii?Q?jk6kRT+InxtNvYtqb6RaL6lM8vpLgz9/CRrSni4eoGMlTrPE9nUAca9EHLLK?=
 =?us-ascii?Q?dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d431e1-89fa-48be-a6dd-08dbfa6b9a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 17:07:05.9034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WZjaFzz810GPipvmCbf7tXT6JirVpXpiQSx1Rd9RcBWhrWXKLW+323ioKmXmV9pB9zhr8Qaki9XiX+n3OFBUSdTHf89UrbbSCxo9aGSLxkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9390

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Monday, December 11, 2023 4:57 PM
> Subject: [PATCH 3/3] Input: da9063 - Add polling support
>=20
> On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no IRQ
> populated by default. Add polling support.
>=20
> While at it, doing some cleanups in da9063_poll_on().
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/input/misc/da9063_onkey.c | 88 +++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/input/misc/da9063_onkey.c
> b/drivers/input/misc/da9063_onkey.c
> index 536220662b38..b9bb8c1cb758 100644
> --- a/drivers/input/misc/da9063_onkey.c
> +++ b/drivers/input/misc/da9063_onkey.c
> @@ -19,6 +19,8 @@
>  #include <linux/mfd/da9062/core.h>
>  #include <linux/mfd/da9062/registers.h>
>=20
> +#define DA9062_KEY_THRESHOLD_MSEC	(200)
> +
>  struct da906x_chip_config {
>  	/* REGS */
>  	int onkey_status;
> @@ -42,6 +44,8 @@ struct da9063_onkey {
>  	const struct da906x_chip_config *config;
>  	char phys[32];
>  	bool key_power;
> +	unsigned int poll_interval;
> +	unsigned int key_threshold_release_time;
>  };
>=20
>  static const struct da906x_chip_config da9063_regs =3D { @@ -86,15 +90,2=
7
> @@ static void da9063_poll_on(struct work_struct *work)
>  	int error;
>=20
>  	/* Poll to see when the pin is released */
> -	error =3D regmap_read(onkey->regmap,
> -			    config->onkey_status,
> -			    &val);
> +	error =3D regmap_read(onkey->regmap, config->onkey_status, &val);
>  	if (error) {
> -		dev_err(onkey->dev,
> -			"Failed to read ON status: %d\n", error);
> +		dev_err(onkey->dev, "Failed to read ON status: %d\n", error);
>  		goto err_poll;
>  	}
>=20
> +	if (onkey->poll_interval &&
> +	    onkey->key_threshold_release_time <=3D DA9062_KEY_THRESHOLD_MSEC)
> {
> +		/* detect short press or long key press */
> +		if (!(val & config->onkey_nonkey_mask)) {
> +			input_report_key(onkey->input, KEY_POWER, 0);
> +			input_sync(onkey->input);
> +			onkey->key_threshold_release_time =3D 0;
> +			dev_dbg(onkey->dev, "KEY_POWER short press.\n");
> +		} else {
> +			schedule_delayed_work(&onkey->work,
> msecs_to_jiffies(50));
> +			onkey->key_threshold_release_time +=3D 50;
> +		}
> +		return;
> +	}
> +
>  	if (!(val & config->onkey_nonkey_mask)) {
>  		error =3D regmap_update_bits(onkey->regmap,
>  					   config->onkey_pwr_signalling,
> @@ -177,6 +193,21 @@ static irqreturn_t da9063_onkey_irq_handler(int irq,
> void *data)
>  	return IRQ_HANDLED;
>  }
>=20
> +static void da9063_onkey_polled_poll(struct input_dev *input) {
> +	struct da9063_onkey *onkey =3D input_get_drvdata(input);
> +	const struct da906x_chip_config *config =3D onkey->config;
> +	unsigned int val;
> +	int error;
> +
> +	error =3D regmap_read(onkey->regmap, config->onkey_status, &val);
> +	if (onkey->key_power && !error && (val & config->onkey_nonkey_mask))
> {
> +		input_report_key(onkey->input, KEY_POWER, 1);
> +		input_sync(onkey->input);
> +		schedule_delayed_work(&onkey->work, 0);
> +	}
> +}
> +
>  static int da9063_onkey_probe(struct platform_device *pdev)  {
>  	struct da9063_onkey *onkey;
> @@ -222,25 +253,38 @@ static int da9063_onkey_probe(struct platform_devic=
e
> *pdev)
>  		return dev_err_probe(&pdev->dev, error,
>  				     "Failed to add cancel poll action\n");
>=20
> -	irq =3D platform_get_irq_byname(pdev, "ONKEY");
> -	if (irq < 0)
> +	irq =3D platform_get_irq_byname_optional(pdev, "ONKEY");
> +	if (irq !=3D -ENXIO)
>  		return irq;

Oops, this check is wrong for IRQ case.

I will send v2, once I get feedback for this patch series.
It should be like [1]

[1]
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/2023120413050=
4.126787-2-biju.das.jz@bp.renesas.com/

Cheers,
Biju

>=20
> -	error =3D devm_request_threaded_irq(&pdev->dev, irq,
> -					  NULL, da9063_onkey_irq_handler,
> -					  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -					  "ONKEY", onkey);
> -	if (error)
> -		return dev_err_probe(&pdev->dev, error,
> -				     "Failed to request IRQ %d\n", irq);
> -
> -	error =3D dev_pm_set_wake_irq(&pdev->dev, irq);
> -	if (error)
> -		dev_warn(&pdev->dev,
> -			 "Failed to set IRQ %d as a wake IRQ: %d\n",
> -			 irq, error);
> -	else
> -		device_init_wakeup(&pdev->dev, true);
> +	if (irq >=3D 0) {
> +		error =3D devm_request_threaded_irq(&pdev->dev, irq,
> +						  NULL, da9063_onkey_irq_handler,
> +						  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +						  "ONKEY", onkey);
> +		if (error)
> +			return dev_err_probe(&pdev->dev, error,
> +					     "Failed to request IRQ %d\n", irq);
> +
> +		error =3D dev_pm_set_wake_irq(&pdev->dev, irq);
> +		if (error)
> +			dev_warn(&pdev->dev,
> +				 "Failed to set IRQ %d as a wake IRQ: %d\n",
> +				 irq, error);
> +		else
> +			device_init_wakeup(&pdev->dev, true);
> +	} else {
> +		input_set_drvdata(onkey->input, onkey);
> +		device_property_read_u32(&pdev->dev, "poll-interval",
> +					 &onkey->poll_interval);
> +		error =3D input_setup_polling(onkey->input,
> +					    da9063_onkey_polled_poll);
> +		if (error)
> +			return dev_err_probe(&pdev->dev, error,
> +					     "unable to set up polling\n");
> +
> +		input_set_poll_interval(onkey->input, onkey->poll_interval);
> +	}
>=20
>  	error =3D input_register_device(onkey->input);
>  	if (error)
> --
> 2.25.1


