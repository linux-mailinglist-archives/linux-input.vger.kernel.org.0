Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1B72B8CD8
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 09:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgKSIIz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 03:08:55 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:53380 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725843AbgKSIIy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 03:08:54 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ84S0a018716;
        Thu, 19 Nov 2020 03:08:53 -0500
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        by mx0a-00128a01.pphosted.com with ESMTP id 34t9ybs9jh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Nov 2020 03:08:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jgu/uzTpecR+DDIlj5Ozq50S8ugPCWUsng3oz9qcR2MZncDlDUNBDXHNBCFnQxlolhFDv8o4MXqGUryx6RTeWT8MmvfCKcn6zm2ubF/Y/8r7+hwW62pYeTRbHf4iEuBq7YxhMd8d8VmJgDFh4nZTRBNTUSkEU95yaSmkvw4q670i0yTQRVg1cw1tUOSlAjVQkUUHQ67qYuGqlNQUUdb/qiPeEdKJ4lRGVi+UbJYbne9cfX7KYaI8PZfRO81EqXZNg8fVhJJrUx5vjlpzI2JMM0C78ftfeDeC6fRmm+dBtG2mjReDSGoR/aVwektDXkhYqt64dCNZdH1m6KDXJ5ph5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH3K3PeyVLiKvCIDn1zFqI0IexoqPXK1qCkKD44t3cE=;
 b=fMZj1daltsJJF7ptngZFhqOKBHkaAyeog/0xMwMbDsWfU29GoCssybJLYM2gRCvTG/XueUg6S5YBzKwKYXZHMzkwbL6bMhRiGEU18/E6esIfzB1cvFH1LL4verK4afta49iL8zKLhrsE+vmHZ4pqjrWR0Dppwa1WJtPpJiHawb5JuZJ5XJQzMCdsxoMxoxjzM8raZxojipf9DBg09f7iP1uMwnByHc+vshZyeyaGebEUJBu/J5vGGgaHEbuPEAyeawWIZtl33pY/I06wAvSWjRloQ9tmzRp+JzGNLm7ymd0LCwBLdRpNgIrovC+SunbZqAMYYUX3sTx+VZ/0ShTc4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH3K3PeyVLiKvCIDn1zFqI0IexoqPXK1qCkKD44t3cE=;
 b=wsEHOyvfVR+h8hk91jC68KQRZMw/KmItFznpGSTwA9b4SAWo5iiBJw77JDEuhfpRehbNhV5oanj6AjFa3m1HTJLtpGyZifkwmGWxRFLniVPBQUzCLdy3JjNjYx+pj35Vpx13YHgtspoxadNJXy4t7igF/BBmVlxkvZB7ZcYOxsM=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB4010.namprd03.prod.outlook.com (2603:10b6:5:5b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 08:08:50 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f99d:8928:7e14:1a62]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f99d:8928:7e14:1a62%6]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 08:08:50 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Input: adp5589-keys - mark suspend and resume methods as
 __maybe_unused
Thread-Topic: [PATCH] Input: adp5589-keys - mark suspend and resume methods as
 __maybe_unused
Thread-Index: AQHWvkUCVa4Majlqrk+sPiO82zVfG6nPGcqg
Date:   Thu, 19 Nov 2020 08:08:50 +0000
Message-ID: <DM6PR03MB44112BAAFE36D19430FF0DC6F9E00@DM6PR03MB4411.namprd03.prod.outlook.com>
References: <20201119072418.GA114677@dtor-ws>
In-Reply-To: <20201119072418.GA114677@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWFyZGVsZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy03NWNkY2VjNy0yYTNlLTExZWItYTVjNS00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcNzVjZGNlYzktMmEzZS0xMWViLWE1YzUtNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSIyMDAxIiB0PSIxMzI1MDI0NjkzMjc5?=
 =?us-ascii?Q?MDc1NTQiIGg9IjNGbWJxVDJlNUpDNm9mWXJkaGdsNjRISHErcz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?RGk2aVk0Uzc3V0FZTURnK0w1NXhvRWd3T0Q0dm5uR2dRREFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 58e30b20-2799-4316-5f97-08d88c62593a
x-ms-traffictypediagnostic: DM6PR03MB4010:
x-microsoft-antispam-prvs: <DM6PR03MB4010D7E94116C4DC6A8F9A90F9E00@DM6PR03MB4010.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:497;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 66fvttH3kjuPNA3bbsXKNmCxt5CPP8GwD/ZQ7aivVLE439DSjRHKZ7Gr5K6WnhWsAM7z+jPkS+ZBBG+T3R7juB9nNGyZ3uROjEwGcsHtfVbb1K2HLpELGmkw+EYtmsl7kwxxeAgn5NNctohgrlEn60WWQGNHicMrG2OAOmb3gj0t/elHNYpz1SNFAU1Vym9HbbyNqso2V2V8x45wOnFQAm0mX1hNcves6yX2kVkRdN3OXJMDCXzatfm+7MpFSgPKzKWvndTDecmiwyBiPkeBuBGyJozQa0p8dtUmOhsLxV6jHthiRCS++E/Rej5XtMq5cy4lNasq3Vkcp4TpLsL/pw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4411.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(33656002)(76116006)(71200400001)(8676002)(66476007)(110136005)(66446008)(55016002)(53546011)(26005)(316002)(8936002)(5660300002)(9686003)(52536014)(6506007)(186003)(7696005)(83380400001)(86362001)(66556008)(64756008)(66946007)(4326008)(478600001)(15650500001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZNNAszhwreHUlzHRZnYdzQfTsMqEMIS0sX1bLOCiJtk9l/DHm1MuuSaQgnoTsdq4gKRtmRHXRmLtZJtG9njaxZLTRTP5gqSTDI2d8hWrt4ROkFSWabLU+i+ycV+1e7rq5pyJ6Ir/LSk271EEccOLFs+Zp70g0VETeFwu/EOYOU7lajzDNoclN3Fm9X6WK/nLb8K37gXFloCWl0u4rl1I7CTzyBEsFMntPCADXnTIvlt3bDjfz3iruPs8n5jhW2RDibyuBJLaK1k7FPsPi/uR9ERLTQxzkZA5CsfGuGlM0PJu0/IdqMJdRNvd6V6x1gFFfPdbZXZTEJAf4KixZVYe+EvegC08npd5Qn+QsLXxiiVFT3FPYP4kd0URIT8um5xOefRe+dLmrZdITvRcQgp9q4QMU/h/WSLo4n4z64DUQyWT3nRKrGYWqS/eROeudTvH/0kHjRJI29qfh2tAknNQuWVBjJENLZqNNlKE9whv2I+QPy555dMvLRZ2YYOS5Rr5Qg9g2mWoH8XhamrrGtDtSZw3h+qsx2W3A8yS7LqRKyzYu0/l0wQukCDUrWtvY8j76v1NuRze6+vrSVLpDrvQFrRee71v2isfOfBz8CakdOgoA7CkXy5pdO2V0nzf1oA11y7sXnUFeDtwMGLDv7n7kQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4411.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e30b20-2799-4316-5f97-08d88c62593a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 08:08:50.3377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jYQp92p3sSE7tvQwStk2gy3sfHcKSoNxJ8YORtKRFsSdo6BS4pXYcqHl7ZAKj/6S10OGPFECMkmlB4Ycqe0EzHFYL30HhPlwmwe10NRE6wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4010
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-19_05:2020-11-17,2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190059
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Thursday, November 19, 2020 9:24 AM
> To: linux-input@vger.kernel.org
> Cc: Ardelean, Alexandru <alexandru.Ardelean@analog.com>; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] Input: adp5589-keys - mark suspend and resume methods as
> __maybe_unused
>=20
> [External]
>=20
> This improves compile coverage of the code; unused code will be dropped b=
y the
> linker.
>=20

Acked-by: Alexandru Ardelean <Alexandru.ardelean@analog.com>

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/adp5589-keys.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/adp5589-keys.c
> b/drivers/input/keyboard/adp5589-keys.c
> index 31145a85c819..a9b69a268c09 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -1016,8 +1016,7 @@ static int adp5589_probe(struct i2c_client *client,
>  	return 0;
>  }
>=20
> -#ifdef CONFIG_PM_SLEEP
> -static int adp5589_suspend(struct device *dev)
> +static int __maybe_unused adp5589_suspend(struct device *dev)
>  {
>  	struct adp5589_kpad *kpad =3D dev_get_drvdata(dev);
>  	struct i2c_client *client =3D kpad->client; @@ -1033,7 +1032,7 @@ stati=
c
> int adp5589_suspend(struct device *dev)
>  	return 0;
>  }
>=20
> -static int adp5589_resume(struct device *dev)
> +static int __maybe_unused adp5589_resume(struct device *dev)
>  {
>  	struct adp5589_kpad *kpad =3D dev_get_drvdata(dev);
>  	struct i2c_client *client =3D kpad->client; @@ -1048,7 +1047,6 @@ stati=
c
> int adp5589_resume(struct device *dev)
>=20
>  	return 0;
>  }
> -#endif
>=20
>  static SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend,
> adp5589_resume);
>=20
> --
> 2.29.2.299.gdc1121823c-goog
>=20
>=20
> --
> Dmitry
