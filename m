Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE0F40C80E
	for <lists+linux-input@lfdr.de>; Wed, 15 Sep 2021 17:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233711AbhIOPRS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Sep 2021 11:17:18 -0400
Received: from mail-eopbgr20070.outbound.protection.outlook.com ([40.107.2.70]:22930
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233977AbhIOPRS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Sep 2021 11:17:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHr+3Bjvf1xdCf9C2YydcPov6UjmNkH2nIA7tf885aS7+YEHZym3gmtJwIgNli5Wr6IYSHDgCYSxRVWxI+PJx1mLK2H1la/rHHWB0J56NcYST+T5IIi8tuaqD1vbFVbjUPxc/0UgTyMrJA/tgk8YiuJ8B8qwKW8p/Npa6lDqgVijo3iSRDBu8BdkjaZZ/TyPPKyLwqgmWFZhdfxCvLueIUV7qDxzmDaWevBawKI4nAfnFUTNfkVk10JzjFOOORHKPLo8P59sw8LfCWFRZY5YrGfKn6NUhRTS2P9ZgJ03cxqZ8Ri5qVGc43M7tlx3hXauDL3jJJ7/72GBoY9YVo9Mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=irarJ14XE0521GFJsXTCfK25INeihU/pFdLcK09J45w=;
 b=kjCmTvdayuVT1BSpvT0FaNnlcKyNQwtC6htqSogjY5zEGF/gI+uIjZ0xZlQfmJHcoawBrMHjGgANVLLB0YLCl8lE+c4gvsLejZ3qNPmOYYDRltNpPgpiTYHJpp7eqDhdNCcd4oKOSP/7ulIdC4Rq2elKW/37aSV6hx9du3i7pg28Kk5iSsl+HZ5vO1buJzt/bGi05hms0+1Hc8B3XHFLwbyM40+f+IiKYejFoV3C5jn3HgxHcsESYH72cQ3Eygs3ZCvmd8aZ5M/YCIKX62qfB8xdCiPX0cIHUT0pERs81b+8EebOh6edCVQJXGsHnoS8/q3UGbZzlS/hNirSUtEYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wacomaad.onmicrosoft.com; s=selector2-wacomaad-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irarJ14XE0521GFJsXTCfK25INeihU/pFdLcK09J45w=;
 b=ssl6557CbOSU1w2ivUFyvktgRV2rLewp6jv0zrKw3++CnQX4n7uY7aqm56fYYsEjGRRNs5H5ZFzuxqj1FwIkkohj0yooZkm2BHZR0wea7K6NYkd54cJiAnL6qj+1uRelNKnVyLFrI+tTHn/gGz698DvIhafgmSMRZryZf/MikR4=
Received: from DB6PR07MB4278.eurprd07.prod.outlook.com (2603:10a6:6:51::27) by
 DB6PR0701MB2903.eurprd07.prod.outlook.com (2603:10a6:4:70::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9; Wed, 15 Sep 2021 15:15:56 +0000
Received: from DB6PR07MB4278.eurprd07.prod.outlook.com
 ([fe80::106f:d99f:c0ba:475d]) by DB6PR07MB4278.eurprd07.prod.outlook.com
 ([fe80::106f:d99f:c0ba:475d%4]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 15:15:56 +0000
From:   "Cheng, Ping" <Ping.Cheng@wacom.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Joshua Dickens <joshua@joshua-dickens.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "Dickens, Joshua" <joshua.dickens@wacom.com>,
        "Gerecke, Jason" <Jason.Gerecke@wacom.com>
Subject: RE: [PATCH] HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL)
 support Added the new PID's to wacom_wac.c to support the new models in the
 Intuos series
Thread-Topic: [PATCH] HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL)
 support Added the new PID's to wacom_wac.c to support the new models in the
 Intuos series
Thread-Index: AQHXqY4N8AEclDx+fkSSQGBqgvA9lqulL40AgAAEtHA=
Date:   Wed, 15 Sep 2021 15:15:56 +0000
Message-ID: <DB6PR07MB42785C8760C865631AC17DAF9BDB9@DB6PR07MB4278.eurprd07.prod.outlook.com>
References: <20210914172825.63335-1-Joshua@Joshua-Dickens.com>
 <nycvar.YFH.7.76.2109151651440.15944@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2109151651440.15944@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wacom.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6b6de64-5c5d-4b10-30f8-08d9785bb798
x-ms-traffictypediagnostic: DB6PR0701MB2903:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0701MB29030B60D60E12EEA51617919BDB9@DB6PR0701MB2903.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q/soJn14L19TKaWGtVH3Up1R5LLkHjKyVrCbMizvKM4yInPoQfkyT0dLh7A8mhH41Kw88Qbu8IYHvLnavK4srk0grPFJDdG3Vhm3y66hkBk+V1jOzOS1c+brAQjRt/5rkYLDTPqb43Dunf8/7rBcbiH3zGaDSlXGyFUAHEm+SEU3h5ECfs/EtdcYCm4G+Pasm25EIdkwIbpkI75PKLBB2x+B2dPP+cOHUTkIRNSMVCpPx3gX8K5jHXzuB25MH8iqD3LHbBdRkuoEbAnqlvkJ7VfLo+23EMcpYmNRQxs1RQIfo4A6lV59hU4uBpeyR7p5W9xCRVkjf22tU/RHMsJ3pAB08h9WUS/uLLImb95IvZdrAN+KyvYMFZoQGM51pPyVMIPnD0rMbnbtHwl0Kg/AHpbmI6tH03zQzUwlB9udXEUA8KZU+8XAjEKEdzb4TQj0yJnVX5DNMRj+ShgbgJwjJoSivoQLTNFgX6mPDgJjS4LbcCepIfRPEMbCPKUGLcst+Y0e0iVJB9sMXaWXZ+QKnPexZ2EB16Za2HcwPrn8fuReGlsj5aYBy8O0Zw2p/Fw+wQDPhsgY7XKGuN/XVPDJNSQnVdEDqrtcYxqDe2dDTA+DmbZsuK3bMSSKezmO9yXf/aFiT91CctUfcpZZAyQ5ls7Pj4K70uzJxLDHTMxpXuK4ic79TVmzY2tQSdc+JnE1MLPsd0lkRbQR05xjXW775w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB4278.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(107886003)(2906002)(53546011)(5660300002)(76116006)(6506007)(54906003)(33656002)(38070700005)(186003)(316002)(86362001)(52536014)(110136005)(508600001)(8676002)(55016002)(8936002)(122000001)(38100700002)(9686003)(71200400001)(66556008)(83380400001)(66446008)(64756008)(66476007)(7696005)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O0yd0MZfC43XudTDErdD+j+LfSpyKZ6KzgtK0K6uGR4NRVDZZWtAHCP8JNEE?=
 =?us-ascii?Q?nFPqkZyk06aCISJ+eGeBooIoC/7n0FKbnTSfESHc/47Si5REv32v4XziGXYE?=
 =?us-ascii?Q?TA9hVHkgr4o9jqEIUU78rqzlorCj8edP3TSfmkcqsE+JGpa04TqZYxmvpiK6?=
 =?us-ascii?Q?OlOfPUaSD7hG7iex0XDdoLTK/seipJnipikrIZGbMkBHvpvb6l8fOcoqAopD?=
 =?us-ascii?Q?zLlkTElpEKufXShM7remguarhHPs144ALHd+u/6LtSldH3Y1KGEDRo3QE6MZ?=
 =?us-ascii?Q?aBHEx5xuxOmrFnUG9vEFA7bhr93MJti6dGFYrPvB0vRr/KJVx8AhxGISNKTx?=
 =?us-ascii?Q?8g3WFr/GAsE6S+Cu4F5Pg1B+vLslmbA+yz3/YsB2qlUYXkNHpZYoo6sUD2YG?=
 =?us-ascii?Q?d2kvevliL0gJmRpznShjQ5AjZJlJnpE1LCSPGocN3WlKZ9NiLaX0k55RyEXW?=
 =?us-ascii?Q?nQiTVzJ0tY6gjOoE2/XI0fY3GP4Xyj0kDUM4b/dNyEDdp7tf+17ncCsCwgVT?=
 =?us-ascii?Q?8NIFcYB6ntDqolsAIqC77460fzCn5VgRsbXz6RU1PgiDatcJrPOL8XfWmUGe?=
 =?us-ascii?Q?AT4HSMxjMbfhOkHReB3TYq7fZxznfNMc5iMkEPawQY5HY4sJKd7x6+8r5fDz?=
 =?us-ascii?Q?KYcHgo7DI3B2X5wjM90I9nxwy7IBRACvqKeOvLIv//SJR/2YdHMp4JD5Mj/W?=
 =?us-ascii?Q?I0cptVCEBOLFrfUXEULzc6MBHRN0L/FLb0nvKqpxc36vajqHPGvT/LcreEsh?=
 =?us-ascii?Q?5nDeIPvIe1v8of1fAQIv7faK4LKsxElafLFH6uDHR4q5yItCYfo7vjdSD5EM?=
 =?us-ascii?Q?q9qzQr+Y6+NpwWBXolq0B0KB1+OP3NK1IZwI4snudA2POeQ0oQBaEmdkhhuu?=
 =?us-ascii?Q?40aU5lVPZYCjwn2u8HxHNzLremEGE+kJR77DHL9rP4nBlqWR8XzkmGiiGPDb?=
 =?us-ascii?Q?1Fp+tAGCOhHI9SQzsRWFhurfqXewrQPB7DMLPi2EL+9WbYRcGskvR4gQxqsw?=
 =?us-ascii?Q?Mp1LUzZ+pYXUwMobrG1u2DESk1pS2IYq+cEF9duh/uUnEhHmivRAc7nbcZ4y?=
 =?us-ascii?Q?ZokmEIagN5DIIy4i6G0vB0eWehFdjpAHAY5jnn3qM1br0qo2UhedpspbtMtr?=
 =?us-ascii?Q?tEWqWOBDV9TlHhcDOoNdCVAhejS44uYTCq9C6qyoej7JTzR8lsziJOk3AN8A?=
 =?us-ascii?Q?IKMHU0mns48rwuApkMVe2SApPXC9uxqrEn7EjfYIN97+WWjrLIq41IWBhd8H?=
 =?us-ascii?Q?JoNU2yKF2Js1pYHkA7NSJgilDYw0Ps+kVC/w1P4/PN/1KFe1bDRHCDRqKGHZ?=
 =?us-ascii?Q?A87LcG/ilmA/8u5WbbEOXOJM4urOB3NX8C6yVyywSPvoxMdy5RzVv7nLJDL1?=
 =?us-ascii?Q?B58SGa2ywkKpmvD5ssO421sMKCtN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB4278.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b6de64-5c5d-4b10-30f8-08d9785bb798
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 15:15:56.5928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+f8Z74kSy1AaSdEcIrGKXq5+LnY9sGigSbXcYc2ls8IMQVnkeB6CChkqGXSX+fPR1X1S2GvywCQbo+gghgJMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2903
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

Thank you for your comments and for fixing the Subject line. I am sure Josh=
 will learn from your fix ;). With that said, the patch is:

Reviewed-by: Ping Cheng <ping.cheng@wacom.com>

Cheers,
Ping

-----Original Message-----
From: Jiri Kosina [mailto:jikos@kernel.org]=20
Sent: Wednesday, September 15, 2021 7:53 AM
To: Joshua Dickens <joshua@joshua-dickens.com>
Cc: linux-input@vger.kernel.org; Cheng, Ping <Ping.Cheng@wacom.com>; Dicken=
s, Joshua <joshua.dickens@wacom.com>; Gerecke, Jason <Jason.Gerecke@wacom.c=
om>; Cheng, Ping <Ping.Cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL) =
support Added the new PID's to wacom_wac.c to support the new models in the=
 Intuos series

[EXTERNAL]

On Tue, 14 Sep 2021, Joshua Dickens wrote:

> From: Joshua-Dickens <mailto:Joshua@Joshua-Dickens.com>

Thanks for the patch. Seems like you did put too much into your subject lin=
e and too little into actual changelog :) I can fix that on my part when ap=
plying, but let me first CC our Wacom maintainers for Review/Ack.

> Signed-off-by: Joshua Dickens <mailto:joshua.dickens@wacom.com>
> ---
>  drivers/hid/wacom_wac.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c index=20
> fd51769d0994..33a6908995b1 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -4746,6 +4746,12 @@ static const struct wacom_features wacom_features_=
0x393 =3D
>       { "Wacom Intuos Pro S", 31920, 19950, 8191, 63,
>         INTUOSP2S_BT, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7,
>         .touch_max =3D 10 };
> +static const struct wacom_features wacom_features_0x3c6 =3D
> +     { "Wacom Intuos BT S", 15200, 9500, 4095, 63,
> +       INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 }; static=20
> +const struct wacom_features wacom_features_0x3c8 =3D
> +     { "Wacom Intuos BT M", 21600, 13500, 4095, 63,
> +       INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
>
>  static const struct wacom_features wacom_features_HID_ANY_ID =3D
>       { "Wacom HID", .type =3D HID_GENERIC, .oVid =3D HID_ANY_ID, .oPid =
=3D=20
> HID_ANY_ID }; @@ -4919,6 +4925,8 @@ const struct hid_device_id wacom_ids[=
] =3D {
>       { USB_DEVICE_WACOM(0x37A) },
>       { USB_DEVICE_WACOM(0x37B) },
>       { BT_DEVICE_WACOM(0x393) },
> +     { BT_DEVICE_WACOM(0x3c6) },
> +     { BT_DEVICE_WACOM(0x3c8) },
>       { USB_DEVICE_WACOM(0x4001) },
>       { USB_DEVICE_WACOM(0x4004) },
>       { USB_DEVICE_WACOM(0x5000) },
> --
> 2.31.1
>

--
Jiri Kosina
SUSE Labs

