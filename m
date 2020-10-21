Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F992294B41
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 12:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438814AbgJUK3S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Oct 2020 06:29:18 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:42124 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392270AbgJUK3R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Oct 2020 06:29:17 -0400
X-Greylist: delayed 3570 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Oct 2020 06:29:16 EDT
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09L9OjJ3011518;
        Wed, 21 Oct 2020 05:29:37 -0400
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2052.outbound.protection.outlook.com [104.47.37.52])
        by mx0b-00128a01.pphosted.com with ESMTP id 349mytvw25-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Oct 2020 05:29:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFXGoaNowEnSyoKC54hkZOB3gfcpKGtUWUlsQiZfwCyiiWybzeE/1nBVlrfGZT5IMRCD1640TD33d4SVKZeg4RFKgploU/kKnt4uHSMht/yj9lVoB4qjcdXmFBK00ixjX4g1on90a6YTfx5CHxRnLjwjt4lzOx/8VVVhthajrniWBH1DebcTTd7x7W0Gtcq2S5zb+WY1EMJE1suJ931WzwEUOyVDD84wOsDJJJQE82bVlmImWHbyMgGYlPBd6/qJPXHVHCUkN78H/ag7XphNN6JclM7AxclDN3INf9ngsHKDemE8LU5y6LbqVw1zFn65AUWoUIlU/xLlfq+9OQMbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EXdlEMww73Kkex2Ow6xLJvVNMvx9XKhgv/nfVvZojQ=;
 b=ivaDqxuesSD18EZRb6mka7Bhbsp+hIsIVj6bkW5Hv3YkhGZMKBwmKbAYmfg5NnCTVYkHeSDaeCgpTli5vdaFJe0lY8Xw6lJTQvQePlVAgLSE73FhSfF4Xeo/cyTXUp8h2eV9tduUmnhvMyqvAfg2IemNG/3LQ9Ts75/xlKS6G4zJL84jtIgQgy1BvYjA12uhXhda3fcqxB88RFuMmDExebqzrOoJA6El9W6U7wixeUtnzxd1P0O0vlnwRt5P6najBvSVTrUKlKwLPWLEnWXgs8wDGFK25n6DDR+QHtCbRuqbd/rfsm423pIOwJukTeVS449PhTNU/W+VDZlfmo+tyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EXdlEMww73Kkex2Ow6xLJvVNMvx9XKhgv/nfVvZojQ=;
 b=B1kveIJk6PodTfbyOtIRzo5FleM3bcsJ0uT3F6q4KM7Se75CqJTLKYZ34J3SULEIZ9nr75otflMOM3Yg1bXfjWL4tARFx1u7ZAC/MpCyAlmgEdo+nttJIRSwLe7tWrKhMThpIp86r5++hm1TG8bQHnyBhvVo/Wc3ZXGjeHwWJ84=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DS7PR03MB5510.namprd03.prod.outlook.com (2603:10b6:5:2ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 21 Oct
 2020 09:29:36 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f457:143e:f83b:26cf]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f457:143e:f83b:26cf%4]) with mapi id 15.20.3477.029; Wed, 21 Oct 2020
 09:29:36 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        David Jander <david@protonic.nl>
Subject: RE: [PATCH v1] Input: ads7846: do not overwrite spi->mode flags set
 by spi framework
Thread-Topic: [PATCH v1] Input: ads7846: do not overwrite spi->mode flags set
 by spi framework
Thread-Index: AQHWp4k2cK6BoHhI0ka16h4hruuU+qmhyJ2g
Date:   Wed, 21 Oct 2020 09:29:35 +0000
Message-ID: <DM6PR03MB44110236C07B05C243009E4CF91C0@DM6PR03MB4411.namprd03.prod.outlook.com>
References: <20201021090434.16387-1-o.rempel@pengutronix.de>
In-Reply-To: <20201021090434.16387-1-o.rempel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWFyZGVsZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1lY2EwYmQwMy0xMzdmLTExZWItYTVhNy00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcZWNhMGJkMDUtMTM3Zi0xMWViLWE1YTctNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSIxOTQ0IiB0PSIxMzI0Nzc0NjE3MjY5?=
 =?us-ascii?Q?NzYwMTkiIGg9ImdKMjBLT2JtenE0UzdEa3BjRFd1bzlmMVBwYz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QVRXUHV1aktmV0FUc1hjaktoTTh2SE94ZHlNcUV6eThjREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBS1ZJV2JnQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
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
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=analog.com;
x-originating-ip: [188.27.128.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f4e77cf-87ca-4542-f544-08d875a3d38a
x-ms-traffictypediagnostic: DS7PR03MB5510:
x-microsoft-antispam-prvs: <DS7PR03MB5510930071F6C4C2F7762F66F91C0@DS7PR03MB5510.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K67IUL2FGoLv7Oqxig/ZdvStYKT4lRkPFzJNgU2cyQXEHLJOsQbw4C9XKOl9NL6fVzSsBg160oulfI1ZDnqdFBCO2DMSL/1RReIJtEHGPzxOuy3jzcC1x3XKqpMgv2gQ0tYRxXqpJPW6VX+LmcSkiGu+xfXTcl1I9u70qAV/OvYg2WlkdveBBtyODb8etPqm2QBoqz/i8f2jUFuQLXBky39SDx7Z6UZePArw8RrZm/Itltmdy1IiUAQjsbhOSpFu/Y3UnlI5E2DcRN0lrSOfDU5iyndrY6nkJme8qqUGMmiICTlPyv4nsVfLanvMXRRw1KtMmHs6RAOLWmxbv6NaMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4411.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(2906002)(8676002)(316002)(54906003)(83380400001)(186003)(9686003)(8936002)(4326008)(55016002)(110136005)(71200400001)(26005)(66476007)(66556008)(66446008)(76116006)(66946007)(478600001)(33656002)(5660300002)(6506007)(7696005)(64756008)(52536014)(53546011)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uYmrAndwdTj5YbZQj2tluPUet7fdtNU0mJIHABP1jCnY6wFFIMQJTtrkxBE82z7+haX3In4hFwFNyvATpbegRGEW2paTKZlJ1VzKYZ4YFGTviizYNOorn9prTqIVVchjUnTGpgOXmQySzC/C7prVdxRGblEqlqvYfoXF/+wZkoLlqdhXEa/jpfnLeeGzIIXh0FEKE5TFccYd/9eYwRxYbqRdCIDpfKw9Ai/9Tanch/lHpDc2hwXVlmPNtCff7TZAx61MTzl2Gd65ePTahJbI0EBSXDiPtGy2enxeOZNBinQJU5aBxAQBiGUfsnNznS6m2O0+YTEDJ1x3Tma9mq1s3cH9O1c1vDaP8RKcU2VPoeCEVvr6btJJ+PvsmSots7nwcIop2HHcWAUcs7IEjKI7cgABMGBoef/0Qo+6jR4ZpVSN/ck82i4IeTNCLWXZyjV6sz3o72d8NvxP2fgFWqXx6n8fFNSGm5+PllUgzbbVgEKpPKyEkiGlJn8QSBJqfRC2tFKd6X9slZc8be1UEymy0AK18Ow6yhFLmelqS4ZanOeTwp1E7YlCtKqYWyYRvXm2oQBce4hl1fNaHcC8ogpu0WEMmRDq9es1+6wp6hReuCRKiE9mRAJRxLrxOD3RzD0D6hMbVs0kOPD0FPFTBxKwtw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4411.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4e77cf-87ca-4542-f544-08d875a3d38a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 09:29:36.0604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPwQzHJnMTO0rQZSl6dV8Ojx95XTuVRQt2qu3Fj4tb5f9pI0bxQ7eWzJKmuOpQieGwK2b0b6VPGYex9Kws6EdqrKhoZtcoZuBVLm7s6ddEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5510
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-21_03:2020-10-20,2020-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210076
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Oleksij Rempel <o.rempel@pengutronix.de>
> Sent: Wednesday, October 21, 2020 12:05 PM
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Ardelean, Alexandru
> <alexandru.Ardelean@analog.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de; linu=
x-
> kernel@vger.kernel.org; linux-input@vger.kernel.org; David Jander
> <david@protonic.nl>
> Subject: [PATCH v1] Input: ads7846: do not overwrite spi->mode flags set =
by spi
> framework
>=20
> [External]
>=20
> Do not overwrite spi->mode flags set by spi framework, otherwise the chip
> select polarity will get lost.
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/input/touchscreen/ads7846.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/touchscreen/ads7846.c
> b/drivers/input/touchscreen/ads7846.c
> index 8fd7fc39c4fd..ea31956f3a90 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -1288,7 +1288,7 @@ static int ads7846_probe(struct spi_device *spi)
>  	 * may not.  So we stick to very-portable 8 bit words, both RX and TX.
>  	 */
>  	spi->bits_per_word =3D 8;
> -	spi->mode =3D SPI_MODE_0;

I think the patch is incorrect.
The initial version is correct; assuming that the datasheet says that this =
driver operates in mode 0.
If the initial mode is incorrect, maybe we need to change that.

What is unfortunate, is that you cannot [yet] override the mode parameters =
[polarity & phase] from the device-tree, in case there are some things in-b=
etween the SPI controller & SPI chip [level inverters for example].
I was planning to do something for this.

> +	spi->mode |=3D SPI_MODE_0;
>  	err =3D spi_setup(spi);
>  	if (err < 0)
>  		return err;
> --
> 2.28.0

