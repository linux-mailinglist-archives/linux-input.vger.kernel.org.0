Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC7242F6EF
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 17:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240929AbhJOPWb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 11:22:31 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:63302 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232267AbhJOPWb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 11:22:31 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FAjSg1000507;
        Fri, 15 Oct 2021 11:20:19 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
        by mx0b-00128a01.pphosted.com with ESMTP id 3bq85w156d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Oct 2021 11:20:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iX9ACueCacF59vusZoxLNVTQAnzJFYYFi0iZG8k8tQQKDQPsmZwmCtkz3OdOQv/MBhc8VPAYG2ZVU3JIGLDtCAw6hWm5kqYGVWqSxVxj8Cc1g/iPnU7pRvLUziqtwENF8w9kVwDJ2Y7C4llrc49Ua+1q/wve9czMbqDwKw+xmpFpM76lqovIF4klROp2QyQHKqGqmGehPlkI9R41edEz+MQ+0+QZrjATwUswgVd8D1Vj/UO1d9BNGmrMSiu09PFCYX+TbJYWAJGfiTUXEHk8uWxZVQMX26WSwTNOY6CWi+oKVKeK7BTOgYoRvQIk+OML5tEPKnll2Ns0JO272xXkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhDImlFpAHlh6iZLqSCL1MC81WiPy6nGaTx8qSfK4ME=;
 b=N0XAGf4yB2a1pzT0IrZHszAg5kGC6L9e8Ze5gQx8dsDQVa+WQCaZLcz4f87WKCjJOmaqm3ojEhNwKLk4DbBfIVADzZq5uJMMfNDsxWqAhGtwpf1Bsikgjt/N58u5re4+IC6/Wzmz0v3mBQv7KNEFKDnzPcM2Q0AhoFT3Ofe6eAKR0ZsnuABG2bOPBvnzxXeY1NCRHEfJC36G0/oeVMIViC84f9icKkduelrR3LhDTUdnQalav7SCx/L9YgxsHNjfwb4pt7Mb3YLp7Ys/u5FX2DVDHct7YzrXi0XTL/OrFn1Bgzk1rOCepYEfXrdVsTcQUInFZJG/bgnGMK8iDCfVUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhDImlFpAHlh6iZLqSCL1MC81WiPy6nGaTx8qSfK4ME=;
 b=NdrgpCJs166mR2BPCtM/0YO36FZDzASqLmkIrrRC6iABo6k+TBNzxcoGOBqXEcDSg/c9BXfsK+wr6KbZyV05sxEZ9HVS4gAw+LDEvIjYdl4uykxoagp1ovzH5Z8ZWrQQpqTdjulETdvC2OnNFcemC3G3L1yAMWC1Caw9MMmAVtc=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by SJ0PR03MB5886.namprd03.prod.outlook.com (2603:10b6:a03:2dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 15:20:17 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::2008:e884:49ff:99c1]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::2008:e884:49ff:99c1%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 15:20:17 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Input: adxl34x - fix sparse warning
Thread-Topic: [PATCH] Input: adxl34x - fix sparse warning
Thread-Index: AQHXv9yPW665fbAyLUe2ZlSjm0PzNqvUMFIw
Date:   Fri, 15 Oct 2021 15:20:17 +0000
Message-ID: <SJ0PR03MB625379C5C0952F2E0071A6AF8EB99@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <YWZIjb91d6aAwgss@google.com>
In-Reply-To: <YWZIjb91d6aAwgss@google.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcm?=
 =?iso-8859-1?Q?lcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy02NTdmN2Y0Mi0yZGNiLTExZWMtOTFkNy?=
 =?iso-8859-1?Q?00ODg5ZTc3Y2RkZWZcYW1lLXRlc3RcNjU3ZjdmNDQtMmRjYi0xMWVjLTkx?=
 =?iso-8859-1?Q?ZDctNDg4OWU3N2NkZGVmYm9keS50eHQiIHN6PSIxNTg2IiB0PSIxMzI3OD?=
 =?iso-8859-1?Q?c4NDgxNTYyOTA2MjgiIGg9InpFZjRuNTEyMnNGdDhvdGpNMWFmUFhrZ0xB?=
 =?iso-8859-1?Q?OD0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBQkVIdGduMk1IWEFiTDVzWXdJVm9CTXN2bXhqQWhXZ0V3?=
 =?iso-8859-1?Q?REFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFFQUFRQUJBQUFBVklFdm9RQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBSjRBQUFCaEFHUUFhUUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QU?=
 =?iso-8859-1?Q?c4QWFnQmxBR01BZEFCekFGOEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFh?=
 =?iso-8859-1?Q?UUIwQUdrQWRnQmxBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQU?=
 =?iso-8859-1?Q?FBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdV?=
 =?iso-8859-1?Q?QVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVlRQmtB?=
 =?iso-8859-1?Q?R2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dCdkFHb0FaUUJqQUhRQW?=
 =?iso-8859-1?Q?N3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21ldGE+?=
x-dg-rorf: true
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2152f74f-5603-4ae4-f040-08d98fef4b70
x-ms-traffictypediagnostic: SJ0PR03MB5886:
x-microsoft-antispam-prvs: <SJ0PR03MB588664C170F54109C8F4D6598EB99@SJ0PR03MB5886.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:26;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ojEH+mcZNySrLayp9T/M1WB/LH/jFqbbK4bEWixGtGOSOxn1RKXkdJhL0W7WcmrJtUUwRYt7cbcl5g7Fb5vpiH1kEbENxw1ev5+35GoHq1yWI9HLovnjZ18ptA9CSYZCJ4DsOCZ2i+e8zSm8MJRcXzF3H2pz7ekQ3zltU1qq1r3ELWT6C+kI9ebb6wcCBh2mJu0DF+m0YvldLyNOTqCEz+Ac6Kq2Yw1llddtO0ACDyMj22ohY9JHCu3zbx33r+Z5v/MIEiDljs9KchdCz7BsKLpgx1NGc7p+tiyvo+1sCz3fNkCLmrBaXR0DUxG1u3BZwpLTuEPCOBRFBEuYqpPRdBIE1McsYa4oIsdP0NieEazDgwHWxd0WtufPmgUIzJaASS0Syldl7N5J/Gcog51fwwJYB5QfUfU0XRJzQ8JjmRJuxUgcbHkpZQdbY/k9a0cnl1Skmyx+FG9deNr6EBzTzWBxIgWpko9pKL3I5pwIjWV/zEc2esYnnVG2NoKW7jv6LX9QBw0SnZoRYO1xkSdLrLXdtg/13Mf06Irxq+YIV+fpmT/d9804NeBxj32UBr8dx78JeMG4QDL4qyz35UTDq6rDnHmBuWuWiwSau2Xl7PNJAb0msQnNX9NX/90oI7Swccu/B+oRAt7G1VQKc+4xZk7DSFgg0cnoXnWv8IHFlRX9mwcKTOuVM4Q/+ebDjWbkyxRCLDCyC7Dls/g0zX2nUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(83380400001)(38100700002)(76116006)(66556008)(66446008)(64756008)(66476007)(33656002)(38070700005)(66946007)(66574015)(86362001)(4326008)(5660300002)(55016002)(9686003)(26005)(8676002)(8936002)(7696005)(2906002)(54906003)(316002)(508600001)(186003)(6916009)(71200400001)(52536014)(53546011)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PAzm2u20AiWEuwQqRXhNWNHOxyeiH8KxQy+h7phwGvZHhkokeLIpdRvSmj?=
 =?iso-8859-1?Q?rzOj3b/cdc4NLqsk8s0EeVPf5sraFH8HI4tJXEaKyc0WF7zNWWdTp1ddWi?=
 =?iso-8859-1?Q?supm3mnB8b4VEMRub18mdjXMV/qTBxE+UKXjGjRpU5NFx+fpOTzCzAG+rs?=
 =?iso-8859-1?Q?hdpygzv7kDdVbDz9UUfw0otizd+7TOfPzd8a9qa+qO6BboMt3zyRDxfIji?=
 =?iso-8859-1?Q?txBkZ0H+eTmK3liFnuRZj+LnUmirVHJGRyhcqQckVFVevpAhomqh12Li1s?=
 =?iso-8859-1?Q?y+LkNeM00ubwqA5P/0fkipn7yW1ObhPkyvLl4gswaaylKwgcPyZYF8GPex?=
 =?iso-8859-1?Q?1TzQjcGKPaXlbT5pHkFxZdaO8E8XIcGiVYXDY2gd10qaxakQ1GaE1TNupz?=
 =?iso-8859-1?Q?ODY5Nchx+xWc8gK3qFIczLNXdxdQfVqISSECE4sDezfmsm3tYJOzVjF0lw?=
 =?iso-8859-1?Q?DiNWqqGt00fZJJcjnFgOzYFZd+IEmqdhLB7Wp76//IHQEHC1zdLpMQynrY?=
 =?iso-8859-1?Q?KzA1E9T+HofV3DdeXVY3y4L2ZLRCyYaCAJ7ZZ1KMZ0N+GJQUx60EDoatox?=
 =?iso-8859-1?Q?b1wC6clkcG3uEH84T7GOF5s33txYux1pqeFfGvLd6q5PCHK+siOGb6E3LC?=
 =?iso-8859-1?Q?D81d2ZCxL9MmOGNEX/KY73mw/iIJo+fdoKDs34DR6PTMppqMB8MOIRfmqS?=
 =?iso-8859-1?Q?0cr7JmdrkFy9M3kY83JDYIYcBVOvwA4B2cOEa6xOzkv1KnZt3rbuZw3AY4?=
 =?iso-8859-1?Q?kiIJkp6A+a3IJ6PVOjOqRYKfkGPNohCj6ENgOjdjyEqMVPCq477lwf/gcD?=
 =?iso-8859-1?Q?N++Ga6GVGFAekLiC3QdgXk6YPz2PIq1Edmj3vOeb2orp7/UVFz0f6KaUb9?=
 =?iso-8859-1?Q?B+Bwm6M6KgkyzfFcR4nTbtP5bwR8592YjLwSQXHUdjjv1tIBaTCQSb/UVO?=
 =?iso-8859-1?Q?GS5niQrkExYM8Jl+Rn1QB0U0FnJCoNfkqX5/lNt2K2+0/HSWtSntYPGmBm?=
 =?iso-8859-1?Q?PPI2TEqjBi8WDmqYLfNhzokoYRfGEA3Q2ZRd91IPY5XTuQht3OTY3lwotj?=
 =?iso-8859-1?Q?tKO7C5QffuQtXXUSFKcs5fP9QHY60oMIJd4VMMIqunn4UqmtHBY5okkhT1?=
 =?iso-8859-1?Q?VK6GCdLjxdKbWwkxwqx0X1yvqYPl51UoDvUzlE84xEuFF2K0Tp1TQ2aBZN?=
 =?iso-8859-1?Q?/1snrda6/XHxqJ1GoZB918OSOmKtvYdlDaaRLC8HF2nbSx34JtvgY0zmoL?=
 =?iso-8859-1?Q?TKWxMUpbENdN25tIV6UY+JRikkVxinvgjtEGxfc5eZGoby7fldubzRGail?=
 =?iso-8859-1?Q?ZV23NwnOLqxLWDQhmzAMHbUVNvZu8CBzzBTSkXXCwLa7+77UXN1CrZ9rjw?=
 =?iso-8859-1?Q?Dtf68i8tVD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2152f74f-5603-4ae4-f040-08d98fef4b70
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 15:20:17.2645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kopDN5tHV9vLwQDmQZSZA7d6URVqR52HuiQdchAYJ40qO2INgybLQ+NTh94Izl8d1FgU2r0oeW7AiVhVWZgVEh50XPn99RtTE3STO7xYc9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5886
X-Proofpoint-GUID: F_vAzv9rDWN3k-5FRz-9y8Pkm-jBe7KB
X-Proofpoint-ORIG-GUID: F_vAzv9rDWN3k-5FRz-9y8Pkm-jBe7KB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_04,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110150094
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Mittwoch, 13. Oktober 2021 04:47
> To: Hennerich, Michael <Michael.Hennerich@analog.com>
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>; linux-
> input@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] Input: adxl34x - fix sparse warning
>=20
> This fixes the following warning from sparse:
>=20
>   CC [M]  drivers/input/misc/adxl34x.o
>   CHECK   drivers/input/misc/adxl34x.c
> drivers/input/misc/adxl34x.c:245:29: warning: cast to restricted __le16
> drivers/input/misc/adxl34x.c:248:29: warning: cast to restricted __le16
> drivers/input/misc/adxl34x.c:251:29: warning: cast to restricted __le16
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/input/misc/adxl34x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c =
index
> 34beac80e6f0..a4af314392a9 100644
> --- a/drivers/input/misc/adxl34x.c
> +++ b/drivers/input/misc/adxl34x.c
> @@ -237,7 +237,7 @@ static const struct adxl34x_platform_data
> adxl34x_default_init =3D {
>=20
>  static void adxl34x_get_triple(struct adxl34x *ac, struct axis_triple *a=
xis)  {
> -	short buf[3];
> +	__le16 buf[3];
>=20
>  	ac->bops->read_block(ac->dev, DATAX0, DATAZ1 - DATAX0 + 1, buf);
>=20
> --
> 2.33.0.882.g93a45727a2-goog
>=20
>=20
> --
> Dmitry
