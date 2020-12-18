Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A36E2DE7A0
	for <lists+linux-input@lfdr.de>; Fri, 18 Dec 2020 17:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgLRQuh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Dec 2020 11:50:37 -0500
Received: from mail-vi1eur05on2052.outbound.protection.outlook.com ([40.107.21.52]:53793
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726708AbgLRQuh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Dec 2020 11:50:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Be8QZlEZLMldIAAU5O+pKpBNSckkW+QN4hKo23nmV7YAHw1x0tj3sRhPO13mo6pMbDqjHgRqbkhc3hWSNZmKaYXi9MaMsAFrHofRNkJVSiO9Gx5qZ02dfAtRDChzVvjMYMwVOsWo5X+/76STSRlMaDeHP3eulbPnxbROwKt1A1bs36Lf6QV70pDPMlK4TpYPhEad8gitxsz0Q4PZq6Nyh+JV4i3hzU81cXjAiVpitxjGqf7JsFTKtgRG1GQHOGQOzjJAcdCkMUKSIicxObZNyLffgt2L8gq2b3nuvaGkxeM5NBLG313UlfeF96x1ciFtuaKUCVzRSyKA6xxvRzDBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIJ3rekNko5yDVHyvfeaztY9wQVKHpFCAchsBBQ1RgI=;
 b=GIBFQRRco9J82SlJj+4vddZGQBIJLMHwTShv5eQUcEBTZELuF9RXn2wVaPocE6T/MfXrCsTWLkPfyQlhMCHEdiLoqSvZkRsz2mBY6rW5Ex3mSzqGea4i8TsDdP2SewvxReSX/owdyusJXalzEQ8DLWtl6g/UmJjcsP6AXOT/VVHG6YPcgf9ZV7SqUQiGRV/QINXaeIa37mSxCsod0EKU7z1t0FUWhpwnMuuOWsG3KaI7TQGcI5SZ2N5lClYMbwtngekj2dR5gwvlgUStZHivkfL0YdkDhsjkBb3Ob4yc9rPSgk24eih9i80KGtbPVcmC/vJSCUdQw8J+UFeycZOOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIJ3rekNko5yDVHyvfeaztY9wQVKHpFCAchsBBQ1RgI=;
 b=0aS+KEKXonux+551VjPet7PakohjoynVLMiO4p6im4c3ZFPZSOrGkWJOCCZ7YT5OvR0em45ERXtaAecRUDDDXde3sGdCjYxp86que4ru8ihCnnHbLqWh5+4Ysw6z08VBWLHPGeJsisa/4MegKnTIKrMB5kEXJWB8o8IKL46ipwM=
Received: from AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:35::12)
 by AM6PR10MB2984.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 18 Dec
 2020 16:49:48 +0000
Received: from AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8805:7516:b929:e052]) by AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8805:7516:b929:e052%7]) with mapi id 15.20.3654.026; Fri, 18 Dec 2020
 16:49:48 +0000
From:   Roy Im <roy.im.opensource@diasemi.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     Roy Im <roy.im.opensource@diasemi.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Input: da7280 - protect OF match table with CONFIG_OF
Thread-Topic: [PATCH] Input: da7280 - protect OF match table with CONFIG_OF
Thread-Index: AQHW1QoRSbw/Sew23UOcP0mEXBFrv6n9EGgA
Date:   Fri, 18 Dec 2020 16:49:48 +0000
Message-ID: <AM6PR10MB1926A5AB8951B4DE62A96EE385C30@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
References: <X9xRLVPt9eBi0CT6@google.com>
In-Reply-To: <X9xRLVPt9eBi0CT6@google.com>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [1.234.57.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaed37c5-90bb-4e88-609a-08d8a374ee53
x-ms-traffictypediagnostic: AM6PR10MB2984:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2984D7AC90C4E93D42CC8D01A2C30@AM6PR10MB2984.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uj6VnUx2FrLaFGqqLjGFx/1vkad05w0TMD/4saVIb6E/vl1TUPTKbJqnfu2L+//xtNY4DKyNYz7sFvOVdkHwhnmVS/x0OtCBRvU9OcbkCA9wKFeWr4M6PSa1wBI7EfyCMsmyisb/4223FKaITTA/TyHryf1TQsizL26tr0hAIjdoACB8AF5U3Av7F0eHWEHEvzkiG1vEnuJ5glr7tJRRnJfgRdwaCnibOXOgfTe400Y8eAVoYbcYHkwmEhKGP5lcDpXNxeuE5c3JdktXUDq+HtMA0rgNd107+ARP3S1f4FJvUMvExJO3ZQ8GIvF2kM6IXXumIIRuijKosjOCvM25aw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(136003)(396003)(366004)(33656002)(26005)(66476007)(7696005)(316002)(71200400001)(110136005)(2906002)(64756008)(8936002)(66946007)(55016002)(54906003)(5660300002)(66446008)(66556008)(8676002)(86362001)(186003)(9686003)(6506007)(52536014)(4744005)(53546011)(4326008)(76116006)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uodTL+mtN3ID5cnqdcORWRKM702jFHfOHFNQmUZ0fJ3P8Z75v28uboH/y2LIt0ODBTNuCmN2tiEDiIaLdeAOp/BOXxRvyPOfy8jtC/4ZIUjejQJFLD+Ik/21MBx+Hh1esIh+My0V5+a+l9/6ovYOWcc5mfIBpLoYImut4RfNPKBai4YiPIGcQ/M0uVPsOyAoWcqSWa+uzzkxmk6j0jkpIZh7alUG7n3Okb2QFfOKUwLm/86BkfDvmovRQVAdqtz4kwKAyP7ZpoZZ6Jho2QPp8CE6sToQdHQ0BiMqHCcd5VvDxWXUyyFys1Xpx7cET+a7yGz7wueVGHgMGG9tXLM+wuAaKQgAgmVcFCyPIgFhxU84QgOk+uaGyZWA5IxEFJpuUN4A0J5wB2SEdZtrpVLTpaaBdB9I3H8bhOSP8X1OkEkk2E2uOKFBrU4L9xxBTktBY0ZXjYzx0IVinry0J6wuD5wOXq0KtH81vswHR8J2rqmw4pxtZm/d7RuEt9LroPZIzIe5ePvZZjuIZpUwB6Upz9ccf1vKFxvrS7SUvQo4mv8S+mCZlrntKqIq/S9wx1l8LeUj+fahn1HF29c/IS6IXSVxYzCAq9Qy9RSsNIJf9q0Hr0DzkasP/DkADehVb4l9J9xpJ2Ta5hHXkbm8hTNEnLXBxcAUqgEb/rh3Wwz29vZCg0/Iccmfrx2P2dA5cckHtUgvEedSfN6X1mQuBb+ZdYpbHfnAmlADeeK20j4gY0E=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aaed37c5-90bb-4e88-609a-08d8a374ee53
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2020 16:49:48.1621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zo9AJTOQIkbNPCUz11/7nTGVqYpJ11qXe28xKYQnpYIIBUSPR7xKzA/mLer2ITshZjY6cpHJSYOqxx87hfOYVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2984
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Friday, December 18, 2020 3:50 PM, Dmitry Torokhov wrote:

> The OF match table is only used when OF is enabled.
>=20
> Fixes: cd3f609823a5 ("Input: new da7280 haptic driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/da7280.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c in=
dex 2f698a8c1d65..b08610d6e575 100644
> --- a/drivers/input/misc/da7280.c
> +++ b/drivers/input/misc/da7280.c
> @@ -1300,11 +1300,13 @@ static int __maybe_unused da7280_resume(struct de=
vice *dev)
>  	return retval;
>  }
>=20
> +#ifdef CONFIG_OF
>  static const struct of_device_id da7280_of_match[] =3D {
>  	{ .compatible =3D "dlg,da7280", },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, da7280_of_match);
> +#endif
>=20
>  static const struct i2c_device_id da7280_i2c_id[] =3D {
>  	{ "da7280", },
> --
> 2.29.2.729.g45daf8777d-goog
>=20
>=20
> --
> Dmitry

Thanks!

Acked-by: Roy Im <roy.im.opensource@diasemi.com>

