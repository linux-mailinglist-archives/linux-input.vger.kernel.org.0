Return-Path: <linux-input+bounces-6651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0354984152
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 11:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04EC0B23000
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 09:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EF87316E;
	Tue, 24 Sep 2024 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="M9YvQttV"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E332149C69
	for <linux-input@vger.kernel.org>; Tue, 24 Sep 2024 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168426; cv=none; b=b5/YeE0ghjmHikMNioBN1bqhR81TXNqkLhCiBlhJ9zi8ZqbhGkj1pACRxM+SVUbCW5AOg2lMmSxSZlelBOFiojBc5cvr9FrGMhddLxsdLIP8tUdhPqfSEahbRBq4Use53vMEFc3jCHRFJmF8fsmhr/DeaZGewOvBPg4I1hFCfBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168426; c=relaxed/simple;
	bh=keu7kifCKXrYHIx3OuD+5sqNN/PVaBYKmwWM7DbjXTA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=k53yqs00i9LIzIq733DwQUEZtDE/Fh4/rnsyU4/l2AHz0EbmS5JX1iXIQCtJLnOlj+/9gjmTwNnHR+w8wfOWby+jyLgDCrdwrabWFxL+AWtfUb2vWOKglQH/e4nvzw9bK7SMxhCqtwSqDxGNpyIO/23lOYy3esBeXfOzYE4xxTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=M9YvQttV; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1727168423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6bIxlMUjefuFVQ5uYfrdWVa4I3wS2RpzsdVnj1BBwU=;
	b=M9YvQttV+9vtXfafqpvWzNcT9Q9jKV/JSj44Fnv7N96ScwdDYb8osI84HKRMObIolgyRFX
	fN66bkwQ9Zep6vdcBMpS68qyUYnDO7lN0KzSdm6d5FnA8bReEDlc69rBfFUmstcQyToE5n
	21ubCMYS4NmPXm1hRAmoFlzNr10sZWA=
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-0-45jaMKM2SX3lVOL2WsFA-3; Tue, 24 Sep 2024 05:00:19 -0400
X-MC-Unique: 0-45jaMKM2SX3lVOL2WsFA-3
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by CH3PR84MB3446.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Tue, 24 Sep
 2024 09:00:15 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 09:00:14 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Topic: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Index: AQHbBeXJu68qxmQNwkyRo9KKHud0xbJaEwUggAye3bA=
Date: Tue, 24 Sep 2024 09:00:14 +0000
Message-ID: <EA2PR84MB378082C6FA58AA25258DC74B8B682@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20240913060800.1325954-1-wade.wang@hp.com>
 <s36bnt7ptdarrxpejm6n62gf3rvvwfagmmpyq4unpv3hn7v2jf@up2vjv7shl2q>
 <EA2PR84MB378051BB14F857BA84E662818B602@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <EA2PR84MB378051BB14F857BA84E662818B602@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|CH3PR84MB3446:EE_
x-ms-office365-filtering-correlation-id: d86320c8-4976-4c87-6ff1-08dcdc774d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018
x-microsoft-antispam-message-info: =?us-ascii?Q?OMq45L6SCOB2lIjhoot9OTLQlDGxiOqMHAulc+g0plbHpyhQMkBYfyrIMcSP?=
 =?us-ascii?Q?GeD6Vf+S9bgONK1e5BmxcG8UM0+xadaZ4w+hUY8i1DRVoLp1bAQWgX+/k9Cc?=
 =?us-ascii?Q?b+D3eNYxWK+5J3TRsgeuPaOQPq/A5dDNEmELEfNXhkVrKYb9MzaTKlaaI8jq?=
 =?us-ascii?Q?MZTtyZZhNNrFnsowuK47z+fEAzVv//JQXZrdQMOwDD15wyrug7jxRHj9wQX+?=
 =?us-ascii?Q?DkZZpA7WSQhFEAYzIxYhPJG+jkClr4NXFWfQT7ROPQcVg9QoZBnJ/VJNETcj?=
 =?us-ascii?Q?PaiiJaAn2+Bm7QGvsiZ6AD7aXT2Mqa9dh5mFnbYnKloCZwf5zZvNk8pURufa?=
 =?us-ascii?Q?fud+jXnvQdh2BnqCfw82qQ66pv4m09MimlS9uJhrB8YkK6y8xXXaikB+t2i2?=
 =?us-ascii?Q?HtmPfPlHmmdALrz3RbLhm4bVmCiSMa2oXhjkS1zSpSoNJUacKvEID9uV2ghZ?=
 =?us-ascii?Q?7N8qivUD6p6Y0tNbXcPsN7lB3EZBCq381iinI2GWaft7vCg+l29GZ6ySBj94?=
 =?us-ascii?Q?PgpJyUSEZB5SMymedxFPb2E+L5tM/X8s9E78eUQHSsd3VmWGdyyRTxNNm4jy?=
 =?us-ascii?Q?cwBWpgxjq0NEU2Muw0DBmcdzu8p/8BkDMhc+djv6rnM5DxumRL6Y3y+Pk2Go?=
 =?us-ascii?Q?5qrTDBpwkZxQYQxXaWcLCCsMPe0wj/CWKoE5VcRDpVFmQ62J8Dipbeyt8vD1?=
 =?us-ascii?Q?LNAFmuJhoyTg4XYVh84DSXTmhnohMINrsZycIqH1AwiKT4wx+a01y9ZJt6Ce?=
 =?us-ascii?Q?bZxAlgAAcVgjc37yOu9Ailkb9wtoMEH3I4OYsxUBZJLmZ6bRvMDnJXOL1itI?=
 =?us-ascii?Q?gpnANbwa5lZkvhCkFPIczWIt7ayrfhhq6nGLUxJwy/V4HnSAKlBI8ame1TCn?=
 =?us-ascii?Q?aTpr21yYO8PaFogfABJYzKXygSdyF81Q4PX53lG3MTulKKEhp6JVKCERrLuB?=
 =?us-ascii?Q?CUVz5aXIK6pEz0SIqrR6ETDJILCyCMdVwunXTV3SQgPauyszy5abKlTbckSs?=
 =?us-ascii?Q?62ixQP2D/gXk/NufESqmlXsChYO8fi53uuI5Dd6E12z4x+Jt3E+bXN7l93tg?=
 =?us-ascii?Q?3jpHZAvvqaUrZkiSKSTjy6emaFxTYxbX1Kkne9dUCPV7hTqqaOXWCSkN8/us?=
 =?us-ascii?Q?aw1yay5kqdg6wQVYRbrhKbbIPexc54iyQ2Grhlw7hcrdqb85tnyrR/D7q2Iv?=
 =?us-ascii?Q?yd4ym/02Ug/SNFPL4BU3MiVLJfXR5qnVQaBKGaUKwcNDL+ydO6kX9y6EWCPA?=
 =?us-ascii?Q?hqQ4pGVjtOVs+TQAamYjHadGWl3+gwoHmc2I/t/UlnihxHkiGqyzesVxc7ep?=
 =?us-ascii?Q?vhGi8AyPQveiGj4rUs6QNBmUcqvjH0vfM9ZtsMd0PSpCegt0AKW+906ynHSz?=
 =?us-ascii?Q?2u4ANF8gFZ2BG9iumRsKBVN3fWuZsQ9tRApaRSDm1B6PsPXMBw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1XUM7ByJNDL7/yRgJbiTE8zRH1G9Bnv5UZH45qCULNIIO3JwZ1/VdPDehPuY?=
 =?us-ascii?Q?QDRQ5bUGIsd7R1+vC0czBygRAk5E46T7yjjulbmiDfvLx6/8UJ2xfXRzPVu9?=
 =?us-ascii?Q?/a1Ap9D24XaCDoX7pepckcsn8for172dHhYwPRrnAX9VDD+o7VRG+wDDjyR6?=
 =?us-ascii?Q?O9w++wQ4bUr3scMSthFgwfijGF3CT5ssxW1AIjPC547cz2PnsIWU0EySK4Ul?=
 =?us-ascii?Q?FwOHphGnWcMia06F8rvplDRBRx8Xu5MNrzeWSPrmcvmdLUL4uuwt0sV27qLF?=
 =?us-ascii?Q?CTeSqRbKnjbYrmvM/JxCOWAoGSIf2sbF96FLhDbE319AvFWRCA7iDPID9yMH?=
 =?us-ascii?Q?JSSNBQDIKyxuUjnKDZxSrGqoo8wWBTbzK2kxOjGmTmsFY42MgLdg7RsrgFtb?=
 =?us-ascii?Q?iMPiFmMMvELh/EfZd4lTr+bp3CZdoNvhA/EHzAhR2F/PRpeqnV4zCypjzy1o?=
 =?us-ascii?Q?EsnDrgJslaZ0LaAxcN30lHRBexv2ktTRrM0tYff7DJ1OP5vq0+VB/bpMzvVF?=
 =?us-ascii?Q?MyVXdwz4z+4ZtzT+K7BtTSfLNzwqNvn2zmipIriZjnTEEuAh1vtY1uRyTqB0?=
 =?us-ascii?Q?TQgyOD+cxNboxAnavlH9AwG8f6N7wYV+WPrempV9iIP53b+2w1OAjig2yemu?=
 =?us-ascii?Q?fyuwLaPGdN7ydHgw8Cscta77hdszDcVY54F+tufdrDzR1Qlafk32j5xaQOBp?=
 =?us-ascii?Q?EooNSQhXbn1aKdGJgXQPq/VGDP7fNggQMfZGs2UWozet98dAZrIlmgsQNkKk?=
 =?us-ascii?Q?2BbmFPJ6nc8ws1srGGqj6J73VtOBFrTunISpLQRDRkwU8PHN6aV5nuxtkaoi?=
 =?us-ascii?Q?yrazhFytxp4D3orTyyS82eIqPROK54KpL0VajGTh6ugGT6MtpKdnxG4lREti?=
 =?us-ascii?Q?pWipV3gSTrGV3qRyZoJFEQtHgVM7QVEmqbkYt8DbmTfzV0d7gdbs+tEIiQ6b?=
 =?us-ascii?Q?c0bW4j4IneI006N1knjg2cibN0+jliLZYXfvs85hK9Ce7SvBJv2eqw73zIDj?=
 =?us-ascii?Q?r6Ep2FpuUpyQIojXTw4SnqkAoRbKwr/fjfsHznw1ojYeWxXM5OTlayYlf0JR?=
 =?us-ascii?Q?4jrwip9SvYWehZgbYAHeKtcLwNecK/RkLKKBNXl9x6hiZx8ExHClGerheFEU?=
 =?us-ascii?Q?vknGpkmBEaoFBwMRezLq7z0/GbWQicQ7UpYK4PHNHLwVK3TtHSHrfVWIOdkO?=
 =?us-ascii?Q?VMLfmSdvxnpkOXkLaAsQo3MBIexX/uaJ0ZgGRlbklDHJZVwxEpElMet/UJy5?=
 =?us-ascii?Q?VfL9iSBHhRErhB89YhZSwTJ1BSL6O9dz4uWh+wzKzG5FX3YfqXNwqPo0XcLg?=
 =?us-ascii?Q?tb7Wcbzp2yOQ7G+nBcizayOaCB5jdcge2xAGxauHh27naJcJWK4dlY2TDjR4?=
 =?us-ascii?Q?3QzYAouIq/YKz4KpoixU4mRk5VQK9P/gBYxuhE00mzwndLQqQKCAVSEFiBjU?=
 =?us-ascii?Q?kx+Nqj75vPqIlLjw+bVPZ0+RuRZL9lerVnYw+rLm3pXumjrGogx+9nyt9pen?=
 =?us-ascii?Q?BGEsXIw2CS9z7+CaJgWpzO8w/lkcbRlOwQQuxR21ATCx4OF4q4B3T8S6Srjt?=
 =?us-ascii?Q?Hh4iGdBfJ+Ll5lR+fEA=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d86320c8-4976-4c87-6ff1-08dcdc774d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2024 09:00:14.0439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUUYDflqMTvCbY8vkjVCQjuHP6R7+3fhP3PfsReA0cc445OtFhHCt9/3cPSjjfkkhWmLhvhmykd4aMP9qDP5pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR84MB3446
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Benjamin and Greg,

May I know the review progress and anything I need to change? Thanks

Regards
Wade

-----Original Message-----
From: Wang, Wade=20
Sent: Monday, September 16, 2024 4:13 PM
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel=
.org; stable@vger.kernel.org
Subject: RE: [PATCH] HID: plantronics: Update to map micmute controls

Hi Benjamin,

This patch is for all Poly HS devices, and it does not depends on other pat=
ches, it can apply directly by " git am -3".

With this patch, MicMute button key event will be send to user space, I hav=
e tested on the below Poly devices:
        Plantronics EncorePro 500 Series
        Plantronics Blackwire_3325 Series
        Poly Voyager 4320 HS + BT700 Dongle

Regards
Wade

-----Original Message-----
From: Benjamin Tissoires <bentiss@kernel.org>
Sent: Friday, September 13, 2024 10:04 PM
To: Wang, Wade <wade.wang@hp.com>
Cc: jikos@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel=
.org; stable@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Update to map micmute controls

CAUTION: External Email

On Sep 13 2024, Wade Wang wrote:
> telephony page of Plantronics headset is ignored currently, it caused=20
> micmute button no function, Now follow native HID key mapping for=20
> telephony page map, telephony micmute key is enabled by default

For which devices this patch is required? Is it related to the other patch =
you sent today? If so please make a mention of the concerned devices and ma=
ke sure both patches are sent in a single v3 series.

Also, have you tested this change with other Plantronics headsets? Where th=
ere any changes in behavior from them?

Cheers,
Benjamin

>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wade Wang <wade.wang@hp.com>
> ---
>  drivers/hid/hid-plantronics.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-plantronics.c=20
> b/drivers/hid/hid-plantronics.c index 2a19f3646ecb..2d17534fce61=20
> 100644
> --- a/drivers/hid/hid-plantronics.c
> +++ b/drivers/hid/hid-plantronics.c
> @@ -77,10 +77,10 @@ static int plantronics_input_mapping(struct hid_devic=
e *hdev,
>               }
>       }
>       /* handle standard types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
> -     /* 'basic telephony compliant' - allow default consumer page map */
> +     /* 'basic telephony compliant' - allow default consumer &=20
> + telephony page map */
>       else if ((plt_type & HID_USAGE) >=3D PLT_BASIC_TELEPHONY &&
>                (plt_type & HID_USAGE) !=3D PLT_BASIC_EXCEPTION) {
> -             if (PLT_ALLOW_CONSUMER)
> +             if (PLT_ALLOW_CONSUMER || (usage->hid & HID_USAGE_PAGE)=20
> + =3D=3D HID_UP_TELEPHONY)
>                       goto defaulted;
>       }
>       /* not 'basic telephony' - apply legacy mapping */
> --
> 2.34.1
>


