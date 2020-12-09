Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47EB2D3BD8
	for <lists+linux-input@lfdr.de>; Wed,  9 Dec 2020 08:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgLIHCd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 02:02:33 -0500
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:10308 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727709AbgLIHCc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Dec 2020 02:02:32 -0500
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B96tA2O010928;
        Wed, 9 Dec 2020 02:01:36 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        by mx0b-00128a01.pphosted.com with ESMTP id 3587qatc43-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Dec 2020 02:01:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFG3NP5elxrLcm9COANsbSX1Zz9BSLKooJ+lDZm+eQpah6QXZ6nbAd8WkxTYAi+pXd3H8rKa489tTjyYRwojmtXahADZEWh74P279PWegCkZqjWwYi9vjvWQkPLltREnuxLdqnc3Dlbc3bX3TKmsx61Pjwq8yQaJFoP5qFNFvXDvBIWAh+oNwv12Nqd4HTyf7ClkvfrD6xxDuNRgba86/cCwxMLjQn6kJjBinZUBiw7Q88IV5xt+g5TsXPx8rcv2GIQwPXPpuMgPwjK72T1A8HoUmvWNSbl/9WQ3ggTDtADv4ByR3XvTEu+b40IXLDv8YJvMEJdWba4YbNY1z0wLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBwXdom1jxGhXgc5ijomCysRKeCKfd8ZE3dlNQHRn8k=;
 b=YO5uMPT52is7LCxC4GH4tGllh7H4rNqH9Qvj/XqCUt1LzePI6txHJKerv740uXNbBuyeIG9tdt64G8QvOyTtOXcxeGMjbYP7DoQfqbQYX9xPVLV1EeXoXxh9/PIKb/c8y9zCFMnJDN4fywjBFsPd46TwUen+jIylicUatoa2E2g3ZnWdDA9KM7HK4hs5aawo/FyyeutBJSPaxLjWLZJsVIiN9pmVb7MGKSrtNa4/tZUe62S6ha7apd6of3hP5prixpmmUh3rQ97qNjPjbimBwv1Aq3qx/ZC131ZTGoZ/nhbJzMB756YZVZ80EiC266Yafld1t/2kWMeQ7dpppWW5qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBwXdom1jxGhXgc5ijomCysRKeCKfd8ZE3dlNQHRn8k=;
 b=IzZcGYldH/DjXdG/WsfzCvq1tFnJtLHMkc+qwJJ8cUvbcka9ytPqjXRXBayqMk0uFEaRw4rMl0NUuu49J6zQ9fzlKe1/WJo7zZRJlVTkDzXxLGDMW5XP3nxA43rHqJl6PKYPZD5F8Xrk6MKMrVKIPsCYtWIzYk/9qvHr3sIRGLg=
Received: from CY4PR03MB2966.namprd03.prod.outlook.com (2603:10b6:903:13c::14)
 by CY4PR03MB3080.namprd03.prod.outlook.com (2603:10b6:910:58::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 07:01:34 +0000
Received: from CY4PR03MB2966.namprd03.prod.outlook.com
 ([fe80::a45b:c565:97bb:f8ea]) by CY4PR03MB2966.namprd03.prod.outlook.com
 ([fe80::a45b:c565:97bb:f8ea%4]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 07:01:33 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "lars@metafoo.de" <lars@metafoo.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH v3 1/4] Input: adp5589-keys - add default platform data
Thread-Topic: [PATCH v3 1/4] Input: adp5589-keys - add default platform data
Thread-Index: AQHWxK58hPA3fv1qxUu5bl02NPDTsanuaH+g
Date:   Wed, 9 Dec 2020 07:01:33 +0000
Message-ID: <CY4PR03MB296674617DD0F98C54D4665BF9CC0@CY4PR03MB2966.namprd03.prod.outlook.com>
References: <20201127111420.96500-1-alexandru.ardelean@analog.com>
In-Reply-To: <20201127111420.96500-1-alexandru.ardelean@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWFyZGVsZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy01ZGU2MWRlNC0zOWVjLTExZWItYTVlMi00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcNWRlNjFkZTYtMzllYy0xMWViLWE1ZTItNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSI0Mzc4IiB0PSIxMzI1MTk3MDg5MjU1?=
 =?us-ascii?Q?NjM4MTYiIGg9Inh3THY2RUk0aDA1R1JCeXZTSzk5Q0QyMnhwdz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?Q29FejhnK2MzV0FTOUNrYkcvcWpOb0wwS1JzYitxTTJnREFBQUFBQUFBQUFB?=
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
authentication-results: analog.com; dkim=none (message not signed)
 header.d=none;analog.com; dmarc=none action=none header.from=analog.com;
x-originating-ip: [188.27.131.171]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3704df22-592b-4d77-dbdc-08d89c10438a
x-ms-traffictypediagnostic: CY4PR03MB3080:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR03MB3080BEEF5742679B06274A4BF9CC0@CY4PR03MB3080.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qXY7MLgW3VsqajIHQkJtoZ3tTlLm4FtPzXrRog2CAW/rFk/aMvYOnTncUVdx2ixi5Tkoty+MkuzJYCz0SnkdL2WCzEWZsZTCk/32gzSCetlPOzqENZwTPhQPkZAEPkg9I5POnKBD8RF3qQR9CqqTP2130yu+KxhQoTRb4VJksUVMg5MJy4WRf00042tjmCmv+aIlJm2vreTpWlp0MmqVIVM8Ieutw0929fxQ2GUX0IZEpqlAJZX1J9DgrYDvTFpqnxNgr2Gibt3iWya3i+T6RQWlBbKr9LGHGS/rHznJL9/KTeCmoCofl4dXmOyrw6oOy+M0abYqS6ELKSVWxgDjLvRn5cukTZEZkF8eJDhdHMDgBP7HIoZWDJHKLvDGOLQPREulanCyZyRVWITWM9a1+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR03MB2966.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(55016002)(110136005)(508600001)(9686003)(52536014)(53546011)(71200400001)(186003)(5660300002)(8936002)(26005)(66556008)(33656002)(8676002)(83380400001)(6506007)(7696005)(54906003)(76116006)(64756008)(4326008)(66946007)(966005)(86362001)(66446008)(2906002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Hqasck9ZimgGlvHajjqgsaOVN6C1IRyoJ+A8e9BZCdoWobHy0hmh2xLG9vlz?=
 =?us-ascii?Q?w1Qka9nALhf/QG2HVp7u4xWCjBgsgXfSlQQeBUuYCa5HDC683xJotYlQQkq7?=
 =?us-ascii?Q?P4GDu2LmJ7oYX+0qyT1+9Em0l1M+R6Z0LDabnTRo0GZ/3DG2Cb8cYl1ry05t?=
 =?us-ascii?Q?kdwCYx1vF8jDLk4e9MymI16gzYUPpjAh2NyihGx+EXkTWuh8l7a/IGgwxAbA?=
 =?us-ascii?Q?7jsTxDeyTbTyM9+ZIw04V4lbNldIMdbHTfNNx/wFdj4pj1ui4DIJOSxmNE/V?=
 =?us-ascii?Q?UqWqvNzD3HNzW5L66hSGEBEJAS00rUH2m9a1j9TuU1tFx+HgwQrqSd6gb0hL?=
 =?us-ascii?Q?fahl3ahLKe//BXcDeFh3iuyzm/J2lDadfCPtsugmRxpxoxqGlKMTZyA93OgL?=
 =?us-ascii?Q?6lr78ckjEhHd8vCn4oAezPRcOq4xcGqyFDdeDoSLkxpn0+WHLmPK7XiN5NzP?=
 =?us-ascii?Q?y9SGbeLHpXxV/cCUxIb7pNehEChgzxqtIGHo/qRUw/JfBlMCPzFSaZFOgGsF?=
 =?us-ascii?Q?MmSNpbBzog47/wQDyy3KQGbrutN3vYFyQAGhr5+Lx73RT0cCoJ7LAoHTRy1+?=
 =?us-ascii?Q?DjecpzTRDH0EZnTFPtQBHm25fSqYYGMyCk8CTwNHyKH+KltfQm5t1zWP3chU?=
 =?us-ascii?Q?Lf+1RlAmIhF3jWAL17rpZazwUbMjVm5QN2f/hGioS27RCiFSiH+XOcU1d4TD?=
 =?us-ascii?Q?3+2/halJsamb5fR98eAC0/MyDQX/zGMR2dhPTQVuFj+Y5UR26gfM5FSOyXSY?=
 =?us-ascii?Q?8NeCDg0ZN/CvKnfZxS/GwVBByJE/fcj1XvBeeXHql8g6kbij+cKAhc8407vB?=
 =?us-ascii?Q?HOzD5nSfzbaev2cnZ83k6h3RCSGQxydxPkPZcMxlNfFJWGNU1T8LoHGfw5EJ?=
 =?us-ascii?Q?hzgPFcv2f1jtuspFURNk0ATWR7GuXx2WWVHUST0Rv0X8DbZ+p5Ng4ZjnGSy/?=
 =?us-ascii?Q?R+WoSLHEwhHYqIeKEfYIqou4Sm17UYRP4Cri8CMXq2Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR03MB2966.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3704df22-592b-4d77-dbdc-08d89c10438a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 07:01:33.8539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: afT/ykPkV531zIsC57wBw8Ab/8kpzuKAUJBao2A/h+eu7obmkNAaw6SnA0fkVGTxvqFPmhTrEECoEFG/Z3xzgZO7Vso2FTRHAAPJrTNhBoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3080
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-09_06:2020-12-08,2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090047
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Alexandru Ardelean <alexandru.ardelean@analog.com>
> Sent: Friday, November 27, 2020 1:14 PM
> To: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org
> Cc: lars@metafoo.de; dmitry.torokhov@gmail.com; robh+dt@kernel.org;
> Ardelean, Alexandru <alexandru.Ardelean@analog.com>
> Subject: [PATCH v3 1/4] Input: adp5589-keys - add default platform data
>=20
> From: Lars-Peter Clausen <lars@metafoo.de>
>=20
> If no platform data is supplied use a dummy platform data that configures=
 the
> device in GPIO only mode. This change adds a adp5589_kpad_pdata_get() hel=
per
> that returns the default platform-data. This can be later extended to loa=
d
> configuration from device-trees or ACPI.
>=20

Ping on this for the input subsystem.
Since patch 4 was applied by Rob, maybe for input, only the first 3 should =
be applied.
Or, should I re-send just the first 3?

Thanks
Alex

> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>=20
> Changelog v2 - v3:
> * https://lore.kernel.org/linux-input/20201124082255.13427-1-
> alexandru.ardelean@analog.com/
> * added patch 'dt-bindings: add ADP5585/ADP5589 entries to trivial-device=
s'
>=20
>  drivers/input/keyboard/adp5589-keys.c | 33 +++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/adp5589-keys.c
> b/drivers/input/keyboard/adp5589-keys.c
> index e2cdf14d90cd..742bf4b97dbb 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -369,6 +369,25 @@ static const struct adp_constants const_adp5585 =3D =
{
>  	.reg			=3D adp5585_reg,
>  };
>=20
> +static const struct adp5589_gpio_platform_data adp5589_default_gpio_pdat=
a
> =3D {
> +	.gpio_start =3D -1,
> +};
> +
> +static const struct adp5589_kpad_platform_data adp5589_default_pdata =3D=
 {
> +	.gpio_data =3D &adp5589_default_gpio_pdata, };
> +
> +static const struct adp5589_kpad_platform_data *adp5589_kpad_pdata_get(
> +	struct device *dev)
> +{
> +	const struct adp5589_kpad_platform_data *pdata =3D
> +dev_get_platdata(dev);
> +
> +	if (!pdata)
> +		pdata =3D &adp5589_default_pdata;
> +
> +	return pdata;
> +}
> +
>  static int adp5589_read(struct i2c_client *client, u8 reg)  {
>  	int ret =3D i2c_smbus_read_byte_data(client, reg); @@ -498,7 +517,8 @@
> static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,  static int
> adp5589_gpio_add(struct adp5589_kpad *kpad)  {
>  	struct device *dev =3D &kpad->client->dev;
> -	const struct adp5589_kpad_platform_data *pdata =3D
> dev_get_platdata(dev);
> +	const struct adp5589_kpad_platform_data *pdata =3D
> +		adp5589_kpad_pdata_get(dev);
>  	const struct adp5589_gpio_platform_data *gpio_data =3D pdata-
> >gpio_data;
>  	int i, error;
>=20
> @@ -619,7 +639,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)  =
{
>  	struct i2c_client *client =3D kpad->client;
>  	const struct adp5589_kpad_platform_data *pdata =3D
> -		dev_get_platdata(&client->dev);
> +		adp5589_kpad_pdata_get(&client->dev);
>  	u8 (*reg) (u8) =3D kpad->var->reg;
>  	unsigned char evt_mode1 =3D 0, evt_mode2 =3D 0, evt_mode3 =3D 0;
>  	unsigned char pull_mask =3D 0;
> @@ -824,7 +844,7 @@ static int adp5589_keypad_add(struct adp5589_kpad
> *kpad, unsigned int revid)  {
>  	struct i2c_client *client =3D kpad->client;
>  	const struct adp5589_kpad_platform_data *pdata =3D
> -		dev_get_platdata(&client->dev);
> +		adp5589_kpad_pdata_get(&client->dev);
>  	struct input_dev *input;
>  	unsigned int i;
>  	int error;
> @@ -948,7 +968,7 @@ static int adp5589_probe(struct i2c_client *client,  =
{
>  	struct adp5589_kpad *kpad;
>  	const struct adp5589_kpad_platform_data *pdata =3D
> -		dev_get_platdata(&client->dev);
> +		adp5589_kpad_pdata_get(&client->dev);
>  	unsigned int revid;
>  	int error, ret;
>=20
> @@ -958,11 +978,6 @@ static int adp5589_probe(struct i2c_client *client,
>  		return -EIO;
>  	}
>=20
> -	if (!pdata) {
> -		dev_err(&client->dev, "no platform data?\n");
> -		return -EINVAL;
> -	}
> -
>  	kpad =3D devm_kzalloc(&client->dev, sizeof(*kpad), GFP_KERNEL);
>  	if (!kpad)
>  		return -ENOMEM;
> --
> 2.27.0

