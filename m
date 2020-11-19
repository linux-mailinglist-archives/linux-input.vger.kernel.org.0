Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE9B2B8D34
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 09:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgKSI2w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 03:28:52 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:7340 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726096AbgKSI2w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 03:28:52 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ8N08H031929;
        Thu, 19 Nov 2020 03:28:50 -0500
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
        by mx0a-00128a01.pphosted.com with ESMTP id 34td19gwuk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Nov 2020 03:28:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwVMEVBwgnuRqSJtlw3jFIPcDLwNdeOsWzlvWdKDgIMDXzIlfwS2iFaDhlsq9KOfvFAOHph/YU2cFaLZLfUXHqSyvVNwMCFwY98ye+GsaDptPAjgtey6FZCSmMQ3Gbk81w7DBsDZM5qmpX8PdR8GZCIPjQT8Q1ThlHvK/HG6POeu44Q+RC4IvuXYHobqKwd5uyJlEq6x70lo0KjpgfsXEysFXt0igMNlMM7HjHiFUvkNueEFhktbIzWTv1CHy4FS3+GtQTBb6tubTOFz6S1hTtJvz+AVSUEQ98X98w90c6FT/lp21u9Ty5487TH97TjJmksW2TfcNxRoxnYIluPtSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j/ZyQtke4wHlgAaAXpQJ6TQoP4FNOoa1BFBCnzX1Ts=;
 b=KAzFwMpqg7lF4IRuS2GAaITC2tSJOzui8ZHoBPtU0Pmq0XfVseXbxCt1YdbJIIM1Hogi/JUlBiMUdCJcDSXMvV8USzYkOPy7zBA438BGVN9NdA71RFVe5jYk15cFW/VyuWanbgcMLMiYhnAJfXO8ZeGjnb7IPk9wDUyKOeuMvVwvPKY7LACNBR3tay+7ki+h319BpW9K/pYk09GYal8qRK79CJDiBnHHbuVqiCNEwp0LNiGra+8rrWaP7Tp+kn8gaoY117RBzxdJH64fqnVF3Bz6qu+9GYpaiV+OX2nP07dZ1wKxcXD1tNGzg9Oj6sbPU/GufUre05jwye0IPzML9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j/ZyQtke4wHlgAaAXpQJ6TQoP4FNOoa1BFBCnzX1Ts=;
 b=KqS3qTr2QGY2/yxvuzyzI7EnQ0XyqnplJsVZ67gHFFZ/7pHDpdzt2EHK9f4dIga6byjSPLLVOZu0GyYt28TJMum3QrGEkWWMXiiA/V45VGDJgwa0fwz8FBvazq5QUE9QAvekNtY/Hx6iKew2dzu/ZSk2zgHJKq6p2fag6nlugPI=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM5PR03MB2426.namprd03.prod.outlook.com (2603:10b6:3:73::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 08:28:48 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f99d:8928:7e14:1a62]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f99d:8928:7e14:1a62%6]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 08:28:48 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Input: adp5589-keys - use BIT()
Thread-Topic: [PATCH] Input: adp5589-keys - use BIT()
Thread-Index: AQHWvkUPJeCFd1iW/06EZxx1eVFZZKnPHbUg
Date:   Thu, 19 Nov 2020 08:28:47 +0000
Message-ID: <DM6PR03MB4411A1914B715473B5019D84F9E00@DM6PR03MB4411.namprd03.prod.outlook.com>
References: <20201119072440.GA116840@dtor-ws>
In-Reply-To: <20201119072440.GA116840@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWFyZGVsZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0zZjhlOGNiZi0yYTQxLTExZWItYTVjNS00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcM2Y4ZThjYzEtMmE0MS0xMWViLWE1YzUtNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSI2MzYxIiB0PSIxMzI1MDI0ODEzMDI3?=
 =?us-ascii?Q?MzkyMDYiIGg9InFLK2lxSXUvVklNQUZrNFczNWRyWk9LdGRWWT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QUdXZWdCVHI3V0FmRTdockV3SEZaZzhUdUdzVEFjVm1BREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBZ3NWMDRRQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=analog.com;
x-originating-ip: [188.27.128.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 812e374f-8191-4667-d125-08d88c652328
x-ms-traffictypediagnostic: DM5PR03MB2426:
x-microsoft-antispam-prvs: <DM5PR03MB242672D24DED3FD6D2901D83F9E00@DM5PR03MB2426.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:605;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nUKlpmuit4ZL1sSLuIrPqu3Xpc4IxjutvHnWf+aINv1ELW9HnEOZB+JXuBLg/JLQ4x1dhGOw4N9gxpwfV2vqzbEmcTk/FbmyrxYcM4SYj8pwBLb32Uvjb9UxpCEIUjWWDaOX3RsVFLp44DFbF78sRCDf0JcmXUNAikIRGBNStIQsJL/10J/I8W+lL2sRLg0ouRtQJ99a3zQTo8E+6hV3owVGlfPoSkcmoAOfi9jLmHpxc0pxQYaqvs0XJ36RB2cpzKTQ/EU3GZdNjbIT8jmcmq0+pMkf1iThGM+18DFoAnH622+IQy/w7C4uqrA0ySKJuZcuwKpTZEcuYDJ2ELuhNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4411.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(86362001)(66476007)(6506007)(52536014)(66946007)(5660300002)(66446008)(66556008)(64756008)(33656002)(71200400001)(9686003)(83380400001)(76116006)(4326008)(2906002)(316002)(110136005)(26005)(186003)(53546011)(8676002)(478600001)(7696005)(55016002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ltMK7yc7pVw05m20ic/x2u/QUMVf7QvlDzd3wjVq/mI15WGAQOxbCRoQb3VXmw46UU9zN24E15NBJVF6SZdC+SJ9sdS019cOt4OZ9e1BbTL79qh80DAwpQ7zCJ0bHJi1el921MPyYAz2eIRjWohvtACh8jp4tQgCVYDJOjb5zLnJ8clxWpDRc01ujF1Zs2v1auzxiAwKfzR0VzgdOt3cr3dm9heA30KOO285OwgT7JxnQqCyGRqgWpQkKI7ChEUGSSTZmhPDW+ELbM2RKtNCRJ+57iMWAGP4oa39xtLNn6QaCZ4U5v56iaTS9350SEr9z6wJ6LNrMfs2ef5vF4TL1aFBrt2UGw/L/I6bf3QkN2zCwi9iuVTpWYLJmKiz7IL9Pk117Z50+l+F1wY7/O8iM3kxOrNqvNGh5heellhgrahGkszR+Vo9LqhqTTgsCnvOJKsLV279HuM8NGnJiW+PWhC1G/BGSuy+BnuI8UL+T2l06/HDZt4SAKPk2lBmCeiWV/kfX2HLnNxS8XADP5RRrXw2ZQDVjIu7IacFN5x/VE/+dUOB5v4c9q6L7GK0j8XSEU+1dL4jgtkxGWmJD54h5c2OPUPwOawLjL+wcyP4glZk6oBcK51iPTa6pji/Nlmh+tQ6M5PWxcw2dlFLE10cPw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4411.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812e374f-8191-4667-d125-08d88c652328
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 08:28:48.1298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GailVc2s+akew8Mu/A1XB+CXYwkzQxp4u4+wY6CEXoWExLXjgE1Sm7DvFraZar7NCXdqWI4RQWGUCrfFnzTH0gtxDvPHYoTAM74P/DtQghM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2426
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-19_05:2020-11-17,2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190061
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Thursday, November 19, 2020 9:25 AM
> To: linux-input@vger.kernel.org
> Cc: Ardelean, Alexandru <alexandru.Ardelean@analog.com>; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] Input: adp5589-keys - use BIT()
>=20
> [External]
>=20
> Let's use BIT() macro instead of explicitly shifting '1'.

As a first iteration for cleaning up bitmask stuff, this looks good.
So:

Acked-by: Alexandru Ardelean <Alexandru.ardelean@analog.com>

As a continuation, in some places, some GENMASK() and FIELD_GET() macros wo=
uld be an idea for some contiguous bits.
I can do that later.
For now, my todo-list doesn't include these conversions.

Thanks
Alex

>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/adp5589-keys.c | 69 ++++++++++++++-------------
>  1 file changed, 35 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/adp5589-keys.c
> b/drivers/input/keyboard/adp5589-keys.c
> index a9b69a268c09..70c8d1c298ee 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -7,6 +7,7 @@
>   * Copyright (C) 2010-2011 Analog Devices Inc.
>   */
>=20
> +#include <linux/bitops.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> @@ -153,48 +154,48 @@
>  #define ADP5589_5_MAN_ID		0x02
>=20
>  /* GENERAL_CFG Register */
> -#define OSC_EN		(1 << 7)
> +#define OSC_EN		BIT(7)
>  #define CORE_CLK(x)	(((x) & 0x3) << 5)
> -#define LCK_TRK_LOGIC	(1 << 4)	/* ADP5589 only */
> -#define LCK_TRK_GPI	(1 << 3)	/* ADP5589 only */
> -#define INT_CFG		(1 << 1)
> -#define RST_CFG		(1 << 0)
> +#define LCK_TRK_LOGIC	BIT(4)		/* ADP5589 only */
> +#define LCK_TRK_GPI	BIT(3)		/* ADP5589 only */
> +#define INT_CFG		BIT(1)
> +#define RST_CFG		BIT(0)
>=20
>  /* INT_EN Register */
> -#define LOGIC2_IEN	(1 << 5)	/* ADP5589 only */
> -#define LOGIC1_IEN	(1 << 4)
> -#define LOCK_IEN	(1 << 3)	/* ADP5589 only */
> -#define OVRFLOW_IEN	(1 << 2)
> -#define GPI_IEN		(1 << 1)
> -#define EVENT_IEN	(1 << 0)
> +#define LOGIC2_IEN	BIT(5)		/* ADP5589 only */
> +#define LOGIC1_IEN	BIT(4)
> +#define LOCK_IEN	BIT(3)		/* ADP5589 only */
> +#define OVRFLOW_IEN	BIT(2)
> +#define GPI_IEN		BIT(1)
> +#define EVENT_IEN	BIT(0)
>=20
>  /* Interrupt Status Register */
> -#define LOGIC2_INT	(1 << 5)	/* ADP5589 only */
> -#define LOGIC1_INT	(1 << 4)
> -#define LOCK_INT	(1 << 3)	/* ADP5589 only */
> -#define OVRFLOW_INT	(1 << 2)
> -#define GPI_INT		(1 << 1)
> -#define EVENT_INT	(1 << 0)
> +#define LOGIC2_INT	BIT(5)		/* ADP5589 only */
> +#define LOGIC1_INT	BIT(4)
> +#define LOCK_INT	BIT(3)		/* ADP5589 only */
> +#define OVRFLOW_INT	BIT(2)
> +#define GPI_INT		BIT(1)
> +#define EVENT_INT	BIT(0)
>=20
>  /* STATUS Register */
> -#define LOGIC2_STAT	(1 << 7)	/* ADP5589 only */
> -#define LOGIC1_STAT	(1 << 6)
> -#define LOCK_STAT	(1 << 5)	/* ADP5589 only */
> +#define LOGIC2_STAT	BIT(7)		/* ADP5589 only */
> +#define LOGIC1_STAT	BIT(6)
> +#define LOCK_STAT	BIT(5)		/* ADP5589 only */
>  #define KEC		0x1F
>=20
>  /* PIN_CONFIG_D Register */
> -#define C4_EXTEND_CFG	(1 << 6)	/* RESET2 */
> -#define R4_EXTEND_CFG	(1 << 5)	/* RESET1 */
> +#define C4_EXTEND_CFG	BIT(6)		/* RESET2 */
> +#define R4_EXTEND_CFG	BIT(5)		/* RESET1 */
>=20
>  /* LOCK_CFG */
> -#define LOCK_EN		(1 << 0)
> +#define LOCK_EN		BIT(0)
>=20
>  #define PTIME_MASK	0x3
>  #define LTIME_MASK	0x3		/* ADP5589 only */
>=20
>  /* Key Event Register xy */
> -#define KEY_EV_PRESSED		(1 << 7)
> -#define KEY_EV_MASK		(0x7F)
> +#define KEY_EV_PRESSED	BIT(7)
> +#define KEY_EV_MASK	0x7F
>=20
>  #define KEYP_MAX_EVENT		16
>  #define ADP5589_MAXGPIO		19
> @@ -472,7 +473,7 @@ static int adp5589_build_gpiomap(struct adp5589_kpad
> *kpad,
>  	memset(pin_used, false, sizeof(pin_used));
>=20
>  	for (i =3D 0; i < kpad->var->maxgpio; i++)
> -		if (pdata->keypad_en_mask & (1 << i))
> +		if (pdata->keypad_en_mask & BIT(i))
>  			pin_used[i] =3D true;
>=20
>  	for (i =3D 0; i < kpad->gpimapsize; i++) @@ -651,13 +652,13 @@ static i=
nt
> adp5589_setup(struct adp5589_kpad *kpad)
>  		unsigned short pin =3D pdata->gpimap[i].pin;
>=20
>  		if (pin <=3D kpad->var->gpi_pin_row_end) {
> -			evt_mode1 |=3D (1 << (pin - kpad->var-
> >gpi_pin_row_base));
> +			evt_mode1 |=3D BIT(pin - kpad->var->gpi_pin_row_base);
>  		} else {
>  			evt_mode2 |=3D
> -			    ((1 << (pin - kpad->var->gpi_pin_col_base)) & 0xFF);
> +			    BIT(pin - kpad->var->gpi_pin_col_base) & 0xFF;
>  			if (!kpad->is_adp5585)
> -				evt_mode3 |=3D ((1 << (pin -
> -					kpad->var->gpi_pin_col_base)) >> 8);
> +				evt_mode3 |=3D
> +				    BIT(pin - kpad->var->gpi_pin_col_base) >> 8;
>  		}
>  	}
>=20
> @@ -677,7 +678,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
>  		dev_warn(&client->dev, "Conflicting pull resistor config\n");
>=20
>  	for (i =3D 0; i <=3D kpad->var->max_row_num; i++) {
> -		unsigned val =3D 0, bit =3D (1 << i);
> +		unsigned val =3D 0, bit =3D BIT(i);
>  		if (pdata->pullup_en_300k & bit)
>  			val =3D 0;
>  		else if (pdata->pulldown_en_300k & bit) @@ -697,7 +698,7 @@
> static int adp5589_setup(struct adp5589_kpad *kpad)
>  	}
>=20
>  	for (i =3D 0; i <=3D kpad->var->max_col_num; i++) {
> -		unsigned val =3D 0, bit =3D 1 << (i + kpad->var->col_shift);
> +		unsigned val =3D 0, bit =3D BIT(i + kpad->var->col_shift);
>  		if (pdata->pullup_en_300k & bit)
>  			val =3D 0;
>  		else if (pdata->pulldown_en_300k & bit) @@ -813,7 +814,7 @@
> static void adp5589_report_switch_state(struct adp5589_kpad *kpad)
>=20
>  		input_report_switch(kpad->input,
>  				    kpad->gpimap[i].sw_evt,
> -				    !(gpi_stat_tmp & (1 << pin_loc)));
> +				    !(gpi_stat_tmp & BIT(pin_loc)));
>  	}
>=20
>  	input_sync(kpad->input);
> @@ -859,7 +860,7 @@ static int adp5589_keypad_add(struct adp5589_kpad
> *kpad, unsigned int revid)
>  			return -EINVAL;
>  		}
>=20
> -		if ((1 << (pin - kpad->var->gpi_pin_row_base)) &
> +		if (BIT(pin - kpad->var->gpi_pin_row_base) &
>  				pdata->keypad_en_mask) {
>  			dev_err(&client->dev, "invalid gpi row/col data\n");
>  			return -EINVAL;
> --
> 2.29.2.299.gdc1121823c-goog
>=20
>=20
> --
> Dmitry
