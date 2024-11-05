Return-Path: <linux-input+bounces-7876-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 525189BD01A
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 16:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B17AAB20EAE
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 15:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DE11D61BC;
	Tue,  5 Nov 2024 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q26IqfjS"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758891D90B1;
	Tue,  5 Nov 2024 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730819366; cv=fail; b=M+YUcw1VzJkw6VkqFUbr0BxFRZOyR/TbliwBwKBJnOtEgafNp5Hopr7MBUQuO+f/8yPbTeSLwTeFNdnm/iEEoW10rPnTXc/FWuLDgql8itdGRgE+K8yhAMcJYQk9pqSBv0pYKEWqwK/hU5GFeAPu2g64ttVfUud97pArQuGbxB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730819366; c=relaxed/simple;
	bh=xxGq4ji4y112ReXSMoelNu3G42yJsoOOFKpy5MIWu98=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZzVCI/2iZMAe3owORW2z5n/JjUcCZQiy7G+aYeATCy4+jxja188B1NyjO1j7QFV2gp8dJikq6Eztfknxr29oADnSY3wf0hO/bY3xqHwrMGprgIFWUd0UCI+yi6iLBjul/p7N2zmvf/+K67kKLzV/Zs32fr+shkCORCOkUIZORKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q26IqfjS; arc=fail smtp.client-ip=40.107.21.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twI+VlxVnOHwq8iqa2QwP2mx5zjDQvTfTlJCruGoB93+hY2oZRQKh2imRJKL3ARY0bbvq4HfpEKh5ilVqY8k+z3TgUmXt3du0W2FNY/qhW6/ISevd0dfAwC/LK/l2mpB4aJCxQaxW5YMguaLmT+mzhNmB1uIZPC/8HkVJAyM+0h9YTsGEm73LoG2KSDvr+AXVIT44XVbKxEAwTqGcHrdni0gR8t8J6zNjP3VI36hHM6CQpEQh4cCCSJq4okF/jPtgQaBIOtCmGYUIpjWpa5BMYyNdxxq+2QFRuSbn1qduhlyiBUR4ukBnd8qQAn+4/V3C9QG5yofGEhHa/keBNrQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfFLJOEPOZY5jXFco/+iTVmzt9NdSTP0ulrQ59HtY6g=;
 b=eUXfvWNW9SwwhUksSKmJxBzTVY/rycL44x0I4KuOa41JFPEyla5+D2zCkWk00iBD8C6hFXgSfAoMUgozqrrvP+H9no1+eX30zx3cAVs1SY2afSYYkejFWG6OBO2prWbw1Z7MxWgBfEAplSeIvNpb6iePS/swTpQaUi92WzM6LgOYZm4AqwARd+eQEUST9P0pkH3s/tKYI0D9zaoHAbELOMXu2LTgQhB1pmoW5v9t/4ym2UInCzspvtFYPLe66z8dutlOnoU12Dx19E34XDai6GMIkPKcRQIB4FyWwZ8BeXRJe5bDg48gQ26clj/pFgzN/Re36SRhwlcoIErcVh0BaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfFLJOEPOZY5jXFco/+iTVmzt9NdSTP0ulrQ59HtY6g=;
 b=Q26IqfjSf5td9WQqx3UnTcKWpR91cnDuomxBxM7RZaQ1s99JD5ikkzwGZlFlnkIqImVjz8rzSRjob2Uwhh8WUQ5Dd0fg7dQRV0N2q1Q4Fr4Eago2KpiZrQbxwflvRaP95GpSO73HBL2kMDXQ0HHyn3FqogqbEjRLXdHBTqdIK1Q+VJi1twkcjpUHhIk/X/sfCKlgRn40ZGA0yLa3nCeX7+R0k3sllXBGBkYoyGlQHVY7YmSE7amSIGfMJXTtId6FtE9vpTiYupSGRtaKnuDOgNT6vfOo6Kp+4aa/sWB2q952i71HsaADwr9GhdgZF0/FfAz5YVPwNUPwO8IUdKBfmw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9691.eurprd04.prod.outlook.com (2603:10a6:20b:4f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Tue, 5 Nov
 2024 15:09:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 15:09:19 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Frank Li <frank.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Jason Liu
	<jason.hui.liu@nxp.com>, "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK,
 TOUCHSCREEN)..." <linux-input@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
Subject: RE: [PATCH V2] Input: bbnsm_pwrkey - add remove hook
Thread-Topic: [PATCH V2] Input: bbnsm_pwrkey - add remove hook
Thread-Index: AQHbLmZ1ye+/8kslIkW8UVLp77bdE7KoL/IAgACai9A=
Date: Tue, 5 Nov 2024 15:09:19 +0000
Message-ID:
 <PAXPR04MB84590937ECEC0F60701BC5B088522@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241104031552.3475108-1-peng.fan@oss.nxp.com>
 <ZymxvLMkkktRoCXZ@google.com>
In-Reply-To: <ZymxvLMkkktRoCXZ@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS4PR04MB9691:EE_
x-ms-office365-filtering-correlation-id: cb1bf777-75b3-4299-2d40-08dcfdabd294
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9yfnZtDDMPrBmibHh8oonm+Npyl+80FBTYG1TSHoMTcO9KpcRteMVN5qp92z?=
 =?us-ascii?Q?r99nwJ3d0cJaWwuxt6DFBiBKVCzKrSxLojM74dZv2OPvIkpkvqYgrgbAXTZL?=
 =?us-ascii?Q?mzlJ8XyHPvP0ztufeD0eAM6G9G6fDuPJ6KIGyrx9eLCxFqGnE76Va0rbFCu4?=
 =?us-ascii?Q?9SCHpLAZLPYZfCW+NYiZe5GA3uyvOKPfN4EnIpd9e+v2iYhQiLmnFxnCE8BW?=
 =?us-ascii?Q?2GF1M/Ul+viE3211u9XeZBdozxsfFlsqzkSfQeFh0P3HH+vxb9OkwZXY/mQH?=
 =?us-ascii?Q?XOmzojL6tHGGRLzgAHa3t0HgOLYFccRFmK3UNSxTqGSWb6iPqhy42lsuGePL?=
 =?us-ascii?Q?fMjnAew7T0wq6Lg3yqJ3znluJl+GJ9g1iSNirjiYstIDDS+gFqT3gT/RDjys?=
 =?us-ascii?Q?fjPTsgWpR5qTIcu3ryggdLG08H52Ym2BgD01CI+Xpoo/Kn1+Hx+gAh1x7Gb1?=
 =?us-ascii?Q?uinVdaopjP/m0D9+mfjU8/61Hxn6xZVUMhNJ/KUFHLQGCAhVc6XXDQlB3b6j?=
 =?us-ascii?Q?IA3eb9/2qYPPvKzpDFrFfGMUD2g//bdYtk8B879w7+dqjbRiN0Y0fKGcQ813?=
 =?us-ascii?Q?BrzZYwtkKkNfmz8a/K4dfx7YXERaLRL0vK1k3ZPREwkEevV7bc5b90/ZwhP/?=
 =?us-ascii?Q?CxfOwodxqF5F2GCBozM9LzvLDd2IYioM60lxD8KKqBVe21JpMdl0No07hR85?=
 =?us-ascii?Q?NrJbaIihJlz9Q01U1NBpxWoa0bFj2BvrVQbCcAK8vZLMSKPN4Q5g5wuX6LMk?=
 =?us-ascii?Q?hblV/3ssEcntUUfmcdc4pVsL6Uc4t351R3urbs125vk7l2cbsAHSVyJcEFVt?=
 =?us-ascii?Q?W3ZFCSJhAaFIXNvZ9PgtnbauT8pdmM0MpKTZYtVTwQ0fEZEpqwUNEabPJ+4T?=
 =?us-ascii?Q?xdktHLXQBb/aJHErUxhQHyec0McNxQrkMIEgOpr3hIYNdAtcNjVz8dmu3LaD?=
 =?us-ascii?Q?9NgprNGBo4ktPw0U6cUCkG5mwdn7QcoeZWHaKQpMu2jldrPy/xmprpYdb4+d?=
 =?us-ascii?Q?+yfZ2G7x/2lg0nR2gN3lTeCFN5NI15J9nDxALI9r/nei2krgJoDRMD8IOpgr?=
 =?us-ascii?Q?0pCIN97L5D26st6P+ZDjMeFcpvoxguVySh8h/tqUbds3OIeJsPvYdD8f0/rU?=
 =?us-ascii?Q?fVypizY+ja+tQm1qfQ5bePFqtLJD/ghMrUdieWoYRJ2kzQ65iJ6B4zG0cW2d?=
 =?us-ascii?Q?qFJQhxfCCz2qv2XZe8Xzv3h/emhe74y0xfeqoiM43QYGN4gsKDu2F14AeKju?=
 =?us-ascii?Q?PtuspsGG3eIls2a1yKSPCDx03c3g9WyxkJpv+7GkSHINXCacDfdeyXMo9YkB?=
 =?us-ascii?Q?wNMnz7MVtizUi1XR0XIQI02VUNSN2gzkKExSzQbotOGQ719f5pS14NBFxtW/?=
 =?us-ascii?Q?rY6UNxA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?o3L+2jkKgbPILSWqrx3psftMUD7h6M08vtD0ZlPJ66ukrACvYi31J/J0GZN0?=
 =?us-ascii?Q?EioLkkM2Y4yP2wOYAWA9ZAuI9GGIzYaU/FrMLAPkasinEF9FTSiTKWH/ulj3?=
 =?us-ascii?Q?UAcJdwFU4YdtFPDqehlQp4x2fYvUCpj0yaZWIQhurJh35+b6fLYzG2I2Wt0C?=
 =?us-ascii?Q?EPHomItLybSxQxj/c0/Re29nGiSfFk1m5QIZ+6nVdn+zTg5a9FvaanHPgeXd?=
 =?us-ascii?Q?/gMUQ9JERWx9gKIp/PyMQeb6zlWP30+mwSYsuzGZMWMPulQ/bbsd/JLfpAnf?=
 =?us-ascii?Q?V1ZsaFk83axZzFBqLUcLEgVpQnB+z3dCBbkrRyRgyNJd6/Q+n+85k/mlWGIg?=
 =?us-ascii?Q?hMhhQZUAiJG8ZFTWYA9/KcxO2h7RUfOqay7Sc1vyz5VDb2KuDdCCQbP4BJrI?=
 =?us-ascii?Q?Cn0nj4lrRlaIDME3Wm6NHi3mkmO02oKWCPXiV/DXt3Cm7xons2MQRks3xCy8?=
 =?us-ascii?Q?yl8TO4IbasJ8s0ocZ79JfcXciHTlG+XVj502XaEQU/LI/wo1+wBuCNxgr/3K?=
 =?us-ascii?Q?UU1oLlh9TM/U56WULX6oBDS+obY4uNvbIcA5MzxQHJeSMJzvuAE5C2ZmPiLD?=
 =?us-ascii?Q?Jt2bCeNpRUu+ymaeATGcHHbmtSKp5pK+7VIR+HRwpKj/d/RRydc12uZ0XSpv?=
 =?us-ascii?Q?6EhrDQ6ZCkTOztn610xKPVvGqytQfwOmOSPT37+iyxTrxP8xhY5hQJodvhn3?=
 =?us-ascii?Q?W8MeyXiNi1QBWf7eNtUnvxxzynXUCMn1MFFw7xRHhOp4ahZCL1rknXG9acKX?=
 =?us-ascii?Q?1cY/vG3YhmXDRSzOUFgyittivHJtpnhVyw2dAwEuDFlhmSS3IKPbUBgDU4WT?=
 =?us-ascii?Q?NWgsHiYg2HLU2V4XJrVxy8YL0wkRri9CrIy8VX58Cv5Vlix+GwAlXwc65Jv6?=
 =?us-ascii?Q?Pgyuiio1PQtKfY0coPiG5kE7OyIrNmKjkop8cznIVDwz0cuGCGrvGq5wu4ra?=
 =?us-ascii?Q?C1WQ10z/YJFUDIqXhbgmUvqQapMsnvLk9dyckJAf4IGYCP3iTQMr7lE8K0ge?=
 =?us-ascii?Q?DYBdIwYVuOlKQ06GfkdXitrETZJpvLgycd9lhBA6fnPE3XiKoTpI4gD/zD+M?=
 =?us-ascii?Q?Dm3bdk8TTGG3gylzH5gQrRgaLYppd4tl32IQfq20QT8r5Iid3BLu7yZSxNQU?=
 =?us-ascii?Q?c7f5pv55UKdNIFVyoXSsIKVonHXbhvptIcfjgvSikmgGgOmneOHFkVnpiIhW?=
 =?us-ascii?Q?v6H5RlAFqAxvaPL9d2p05d2/fAF34pC4UGPoxIxzew8dsqqQ7OnqZZ6/HfMo?=
 =?us-ascii?Q?goxpbb/AHOdCxlu4yvi+1zwHnCVB9bJWrD2IBTuEFfM6ZvdkVZsX++u+gkEh?=
 =?us-ascii?Q?xEWxnbSi5+ESU094QVFlJW87D3BwVxPFYXqFM1bcj29ET1YjZpHlKlIaO9Jg?=
 =?us-ascii?Q?tdjyzCA36gfTIAoSMyasUajMcXvBltPYpYOgolXY5BInmUcIHvV0Y1S4XcEQ?=
 =?us-ascii?Q?XmuONu5QLkoX16KSYeVkwOHgcVU4nI3QPzVZ1iz1dalbLY1voUwcgv70grq3?=
 =?us-ascii?Q?jtjOe2OPCirS9X/zjArgOGtBkaeSJvUnK17dNuCSZm6TwksXwlAVwsHv08YL?=
 =?us-ascii?Q?qV+g5b5Hca8Xv5X84YM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1bf777-75b3-4299-2d40-08dcfdabd294
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 15:09:19.3399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2fLF0NLlAgBqwEOKmHrheTvC5sx/u7CwatX38LUt7avdD/FLdc4MsuxzVmnYv9exJRAgvySDbvQNg0aiPPBecA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9691

Hi Dmitry,

> Subject: Re: [PATCH V2] Input: bbnsm_pwrkey - add remove hook
>=20
> Hi Peng,
>=20
> On Mon, Nov 04, 2024 at 11:15:51AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Without remove hook to clear wake irq, there will be kernel dump
> when
> > doing module test.
> > "bbnsm_pwrkey 44440000.bbnsm:pwrkey: wake irq already
> initialized"
> >
> > Add remove hook to clear wake irq and set wakeup to false.
> >
> > Fixes: 40e40fdfec3f ("Input: bbnsm_pwrkey - add bbnsm power key
> > support")
> > Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > V2:
> >  Per Christophe JAILLET
> >   Use remove, not remove_new
> >   Drop checking bbnsm pointer in remove
> >
> >  drivers/input/misc/nxp-bbnsm-pwrkey.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > index eb4173f9c820..f0bf119309dd 100644
> > --- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > +++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > @@ -187,6 +187,16 @@ static int bbnsm_pwrkey_probe(struct
> platform_device *pdev)
> >  	return 0;
> >  }
> >
> > +static void bbnsm_pwrkey_remove(struct platform_device *pdev) {
> > +	struct bbnsm_pwrkey *bbnsm =3D platform_get_drvdata(pdev);
> > +
> > +	dev_pm_clear_wake_irq(&pdev->dev);
>=20
> I wonder, could we have this done in the driver core instead of
> individual drivers?

I will give a look to see whether possible to make it in
device_unbind_cleanup. But as a bug fix, I still need
to do this in remove. In future, if clear wake irq
could be in driver core, it could be remove in the=20
individual driver remove path. How do you think?

>=20
> > +	device_init_wakeup(&pdev->dev, false);
> > +
> > +	input_unregister_device(bbnsm->input);
>=20
> No need to call unregister here, it should happen automatically.

sure. I will remove this line.

Thanks,
Peng.

>=20
> Thanks.
>=20
> --
> Dmitry

