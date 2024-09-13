Return-Path: <linux-input+bounces-6487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD37977939
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 09:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 666C3B23AA5
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 07:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E9F77107;
	Fri, 13 Sep 2024 07:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="OjqW7sV4"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F406A175B1
	for <linux-input@vger.kernel.org>; Fri, 13 Sep 2024 07:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726211781; cv=none; b=h1aXbQPgrBmHoVrOknPRnNbjukwCLnuoNf7Wsupgv6PQqvmImi1vcPGN9JCW7n3TRTV/teHBVYTfGaLHueP3WvDG8tmVGaMbvvIWYrDNrP1+FTtG4sr/cUnU/TaVCiddv015R/+rmdrFuqBHCkDjimXFDpacKLr0AnnWQ5wdlbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726211781; c=relaxed/simple;
	bh=9rnN5DwxCAvT/q+ggfK9QZ8bVqpmzE6lczSXiXpj4cA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=kGbv/II5Gp6D2A7aNmL2QY+Y3Zq9pKpP5pmaE7fZdDFX5ahJ5HYVUBz3znaDmCb8vZDJda8bmFLby+/9e+eLpWuAaz0yA5wYrgpYPymxya+xLdTFh99lUzpFyC3bKiCi+NRV4gMIEguCIC+V+kDVAHRVWYUwbPr1Q71VU1G5Yyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=OjqW7sV4; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1726211777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp4OmqcKnTSikpX6/kcq5PuqDzegL8F3f3FwoJazqjY=;
	b=OjqW7sV46IdqS/4Q+5vntDfX7mItiDwaSenxuJ6LEKi18VLoEkmq8oUetvkz4T0rsp0xyy
	xDhMUOGkZ1K3pdDSlVogDKSgCNseB1igCxgO8l5vZOeQxm9fnEaW/jTq9nbAYlXgauldlp
	5MUJ8vRs+9lOWPbxuUiWFBhmHIZ+Kxw=
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-muyF6CLRMQGwlMFDml-Yyw-1; Fri, 13 Sep 2024 03:16:15 -0400
X-MC-Unique: muyF6CLRMQGwlMFDml-Yyw-1
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 07:16:13 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 07:16:13 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Greg KH <greg@kroah.com>
CC: "jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] HID: plantronics: Additional PID for double volume key
 presses quirk
Thread-Topic: [PATCH] HID: plantronics: Additional PID for double volume key
 presses quirk
Thread-Index: AQHbBadDGCls5uY0YkK/wJ49qPEETbJVTieQ
Date: Fri, 13 Sep 2024 07:16:13 +0000
Message-ID: <EA2PR84MB37800B3DCB1F28FAAF266FC18B652@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20240913060710.1325640-1-wade.wang@hp.com>
 <2024091355-antitrust-retiree-1299@gregkh>
In-Reply-To: <2024091355-antitrust-retiree-1299@gregkh>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|DM4PR84MB1664:EE_
x-ms-office365-filtering-correlation-id: 51b572b6-a00f-4d51-1cc8-08dcd3c3f36b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018
x-microsoft-antispam-message-info: =?us-ascii?Q?CLDbdJwOtwUzzvhCofY9VLKRnPAPrSuox7d4tbg2FzrSIYTTVsUw/fpk8SMY?=
 =?us-ascii?Q?qxp3uVNoLHR1MW/SZ29lg6GoBXl7kpcEIWXTJd6gFFYl4fhD9woi9VT1nd69?=
 =?us-ascii?Q?jbBDHcH4sA/nGM6GBtuF6H/cw9JGsbJuqqwdUX9DKPsjGdFnWtPdMSsuq3HK?=
 =?us-ascii?Q?xVoXHr/EzpzUYwU2isZJ600fB4XBJM3DQFNHmqJ7HmAl0dUQBDB0RcyCrnLs?=
 =?us-ascii?Q?8jrx4sm9w3od8X8xsvGbqZXPpSzWQC3p0BruN10FemjP0oBSKqAiqhfXziTG?=
 =?us-ascii?Q?6UOgeONBdb0SWkv51k4OxHFdDiLzgEO+ZXSFG6XT9ZhMrLqIDoIsNd8rkoHJ?=
 =?us-ascii?Q?Zk3bzXQUK3SL2bexao53JrEY9DZJPn9yYQd70ZnIreT8UrxUA61r4p19/vXs?=
 =?us-ascii?Q?cqwE6Qnu5XIfxqOAtzohWQybTPwJOmI9l5CKRgVaXHKGp9mA9NX3guShjHxD?=
 =?us-ascii?Q?65lv0Z2xD4TjHxkDQlrv0NcO196R/kbDRPbYy31559WvW1cD1hJpHXt4sOdR?=
 =?us-ascii?Q?UJ+l6jsEqE9CEjd6/MgL0rhlFrGJ053KsLo0n2QiFI9bDumTqqvpiSewqEXH?=
 =?us-ascii?Q?+J19M0hGeBDzwsM5I+12tlXXnE4/8vA3LHmrwoo0ltmrmdyNrBdFH8tka10A?=
 =?us-ascii?Q?K3hp+L1wLmIKaE4j9pFsi3mi9xS0iwUMTLVCi3dmXGmPduN+seuZ2MjQnb6w?=
 =?us-ascii?Q?K4iJLj2oAca1aJ0P1rnPMqEqZqQ0g8dLkbGiIrfPZg6dGGrlMnwA4+V752Md?=
 =?us-ascii?Q?LNQNyrxoJ1MYKHdrq+Wr7Nhi8vS1WrMnynkP0S2bJvdMrSiX+H73wSNgOD8H?=
 =?us-ascii?Q?QPF/4u/ogiV/DLnz43aKeuBEP616bX9c0tPMvCJJGckbOLYfSdRJ4uzeO9I/?=
 =?us-ascii?Q?rGP8uH+eGVfFGMG6wD2joXoXMGxgahy9m0uBD5ZpidzTYSFrFpYNKcH8EuJA?=
 =?us-ascii?Q?5CY2M/wBMY/t+NzUS2qKQAJi+hqcopkY/lqjQIlGrPYDnaBFaXqKaPPJg+9a?=
 =?us-ascii?Q?WZEy/TW8ASyGlKng3uTL0TCJRlvNhmmq/zJsT45PQFWlnIqNhNLFk/hd2/gK?=
 =?us-ascii?Q?XXGeY1wIM4x/ixP5Nnob4PetJZQzuTFSmwAMNeGQbtIgGqRZFcGnZHNoNHc/?=
 =?us-ascii?Q?fFJXsnBJIqasU41ICBNmA2lTHonpQAPR4CKWjFO5YR+z3w9YAvU0rh3hT8S1?=
 =?us-ascii?Q?0g06A8C9c9/RikqZCd0T9cZcalrm0/0R6dTLGn2zjPOGnmKprpUdMRyT0yB3?=
 =?us-ascii?Q?wwB6OCw3/fEK5qeCRWl8pRcdBNXtTUBrWTEHvOSRft37ovBst5bKUSJX1X2u?=
 =?us-ascii?Q?COC6UwQyt54kVB3bfIfNpWJ+nck6glTsPv1xrQF43jfSpxjAi9PAiilaxDB4?=
 =?us-ascii?Q?N3RJ+a1urbX2KL2nYv5UBuKY0qHzOWpkMlnSKpXchLLRaD23Xw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TwlNw9czJ9c5O+vvFc0oJMo4qBLFxbdj5JmT/kM5306x845AJpPMYNbhJRcu?=
 =?us-ascii?Q?lmgLKibr8DvGJHVg63spvLUGFIPl8IKaAaUQp2HE6O6DydCROljLyYVwErLF?=
 =?us-ascii?Q?ICSPqJDxGzvgvqzeWjw5rs1YuU8+NTxZSm6oL3sUzVX41TvIQQRUOobhFvpi?=
 =?us-ascii?Q?almujiDkL/QLAhQD2yxP35OruWoYvFgQajsG5pHeeI51YffhPSWClOtlVsLs?=
 =?us-ascii?Q?ZOzmvV1OIZ7mwECCUNYZ2zA6tEYJp71RVpTXXgYLL6HGMLgFOFVgkjNIGjj1?=
 =?us-ascii?Q?Yxd0Vn0hmuxzDYxpj0/R5qBNLu/q3ndKi6kYnj2SJPUigFqJunLrswqlYj2B?=
 =?us-ascii?Q?Lm0yFaKDYujhzO/Rnr+R7Va3QGqAYw2nThytuJnfGSkr4uiCQgra8pOu2DBJ?=
 =?us-ascii?Q?pu4DM8DUfvMcpaIe1n8R3P3CjQYWgpyYiw3YuY5OCUQtJbui/GClDG4IwS19?=
 =?us-ascii?Q?P1U7TjcqDTUYFd+F8Jt+h7gKhjuPmboi1aD+ArOgmYU9YANoSy+MqEePPbwO?=
 =?us-ascii?Q?ApDkzBCP4OklFtGm/AkFJY7sJwDQZyjnhXdSvaodpCQvL3wGoXdHGB/nvj6P?=
 =?us-ascii?Q?DwJ7EIrgmFSJsnznLgTcxrkW1+r3/AnPJNT6OGyYHetr3xQ8bnVbKibwoiUm?=
 =?us-ascii?Q?lSKpOa7ClX1iEmx2+6FbxeI9j46AOofo/wLnF6tr99+MpYlvGWwOtMnGsB4O?=
 =?us-ascii?Q?sAdgaL5O/s+sOBp3usuzqeF3HdLSidO6a5kdlOIXo8CTHhX9km4Lbj9YVoIQ?=
 =?us-ascii?Q?AX2w0iYbzUNcOHPFm+LDXKuIAmFLFzVwnJvSc0pPICsfqXKl33PlO63854gw?=
 =?us-ascii?Q?zAnxdZJYRDtGZetjB1JUtz9XTNGvUQwJYuUPIm5FvA8detTocyS6O7PZHN/R?=
 =?us-ascii?Q?MDjMLg2ISd9CApFeisqscf6uFCIzVJdKXMYC9X6k+MN+jiDT983yBA24VKdX?=
 =?us-ascii?Q?XCGekghazMUgKQBWCBjD19ziLEQUt9Qjbdpnt54WTEIA03wdgdnYOK+N/e3n?=
 =?us-ascii?Q?Wk4LWnIP9TVs091/32BEH2NcNHVLJ4j6rKktrii/dofXJY9U5UrNFPJDflSD?=
 =?us-ascii?Q?iKr2qMXSq3cti3iaHHJY9VMxeIFFXHXXfB1q/g1VKYC9B6DLgOqHjGf/l8ZD?=
 =?us-ascii?Q?/voScCtCltigiGuXQea0K9lyfhPkoc8VoYwPKskXvigqFODNMKoQpVWBNMjZ?=
 =?us-ascii?Q?+IxJ+0w4yzgbMUWzCW5XHtmIeQVyNkh8J06X0RTIiXBg1+HXhj3xfNETGP+n?=
 =?us-ascii?Q?/de/D0Ky3XiBFwsHcvpLf7AyV59yeR6bU4jQ0BKZPYm9NALU2NXcGjPxBAgD?=
 =?us-ascii?Q?MY8CIHgbc00AtkBh6AX6iyi3p4KfDLC5j/TOs6KfvvTSyMnMqEWA8WgF76G4?=
 =?us-ascii?Q?TYGKrFqDArYsVdWFr8lK36oxbmM2XEjGkGGWj07UFPQhJXaattfF0hnt9ztS?=
 =?us-ascii?Q?psewlfNjfb1hVcT7oUIRFNqMqR8D1w7NRpK09WMN3JzATai54y7+SbF8XC69?=
 =?us-ascii?Q?ZxdaK+V/GdE0TPdiE0pyeEOF3/BPaygLY0SCRry04MAWqK7I5Vh577toEZIw?=
 =?us-ascii?Q?xGyqVeopBlAN46OV7l8=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b572b6-a00f-4d51-1cc8-08dcd3c3f36b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 07:16:13.5161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ihNYqHttYKf3heJv6MZoOZMwJb4THWeVAMrTFLW93ah7+16A9qCINPNC8WbG6f7TwqJPNVLhHisoeUqPJPYc3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1664
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Just add "Cc: stable@vger.kernel.org" in 2nd patch submission, because kern=
el test robot required. Any other thing I need to do for your question now?=
 Thanks

Regards
Wade

-----Original Message-----
From: Greg KH <greg@kroah.com>=20
Sent: Friday, September 13, 2024 2:28 PM
To: Wang, Wade <wade.wang@hp.com>
Cc: jikos@kernel.org; bentiss@kernel.org; linux-input@vger.kernel.org; linu=
x-kernel@vger.kernel.org; stable@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Additional PID for double volume key=
 presses quirk

CAUTION: External Email

On Fri, Sep 13, 2024 at 02:07:10PM +0800, Wade Wang wrote:
> Add the below headsets for double volume key presses quirk
>         Plantronics EncorePro 500 Series  (047f:431e)
>         Plantronics Blackwire_3325 Series (047f:430c)
>
> Quote from previous patch by Maxim Mikityanskiy and Terry Junge
>       'commit f567d6ef8606 ("HID: plantronics: Workaround for double volu=
me
>        key presses")'
>       'commit 3d57f36c89d8 ("HID: plantronics: Additional PIDs for double
>        volume key presses quirk")'
> These Plantronics Series headset sends an opposite volume key=20
> following each volume key press. This patch adds a quirk to=20
> hid-plantronics for this product ID, which will ignore the second=20
> opposite volume key press if it happens within 250 ms from the last one t=
hat was handled.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wade Wang <wade.wang@hp.com>
> ---
>  drivers/hid/hid-ids.h         |  2 ++
>  drivers/hid/hid-plantronics.c | 11 +++++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h index=20
> 781c5aa29859..a0aaac98a891 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1050,6 +1050,8 @@
>  #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3220_SERIES      0xc056
>  #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3215_SERIES      0xc057
>  #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3225_SERIES      0xc058
> +#define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3325_SERIES      0x430c
> +#define USB_DEVICE_ID_PLANTRONICS_ENCOREPRO_500_SERIES               0x4=
31e
>
>  #define USB_VENDOR_ID_PANASONIC              0x04da
>  #define USB_DEVICE_ID_PANABOARD_UBT780       0x1044
> diff --git a/drivers/hid/hid-plantronics.c=20
> b/drivers/hid/hid-plantronics.c index 3d414ae194ac..2a19f3646ecb=20
> 100644
> --- a/drivers/hid/hid-plantronics.c
> +++ b/drivers/hid/hid-plantronics.c
> @@ -38,8 +38,10 @@
>                           (usage->hid & HID_USAGE_PAGE) =3D=3D=20
> HID_UP_CONSUMER)
>
>  #define PLT_QUIRK_DOUBLE_VOLUME_KEYS BIT(0)
> +#define PLT_QUIRK_FOLLOWED_VOLUME_UP_DN_KEYS BIT(1)
>
>  #define PLT_DOUBLE_KEY_TIMEOUT 5 /* ms */
> +#define PLT_FOLLOWED_KEY_TIMEOUT 250 /* ms */
>
>  struct plt_drv_data {
>       unsigned long device_type;
> @@ -134,6 +136,9 @@ static int plantronics_event(struct hid_device *hdev,=
 struct hid_field *field,
>               cur_ts =3D jiffies;
>               if (jiffies_to_msecs(cur_ts - prev_ts) <=3D PLT_DOUBLE_KEY_=
TIMEOUT)
>                       return 1; /* Ignore the repeated key. */
> +             if ((drv_data->quirks & PLT_QUIRK_FOLLOWED_VOLUME_UP_DN_KEY=
S)
> +              && jiffies_to_msecs(cur_ts - prev_ts) <=3D PLT_FOLLOWED_KE=
Y_TIMEOUT)
> +                     return 1; /* Ignore the followed volume key. */
>
>               drv_data->last_volume_key_ts =3D cur_ts;
>       }
> @@ -210,6 +215,12 @@ static const struct hid_device_id plantronics_device=
s[] =3D {
>       { HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
>                                        USB_DEVICE_ID_PLANTRONICS_BLACKWIR=
E_3225_SERIES),
>               .driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS },
> +     { HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> +                                      USB_DEVICE_ID_PLANTRONICS_BLACKWIR=
E_3325_SERIES),
> +             .driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS|PLT_QUIRK_FOL=
LOWED_VOLUME_UP_DN_KEYS },
> +     { HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> +                                      USB_DEVICE_ID_PLANTRONICS_ENCOREPR=
O_500_SERIES),
> +             .driver_data =3D=20
> + PLT_QUIRK_DOUBLE_VOLUME_KEYS|PLT_QUIRK_FOLLOWED_VOLUME_UP_DN_KEYS },
>       { HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
>       { }
>  };
> --
> 2.34.1
>
>

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him a =
patch that has triggered this response.  He used to manually respond to the=
se common problems, but in order to save his sanity (he kept writing the sa=
me thing over and over, yet to different people), I was created.  Hopefully=
 you will not take offence and will fix the problem in your patch and resub=
mit it so that it can be accepted into the Linux kernel tree.

You are receiving this message because of the following common error(s) as =
indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about ho=
w to resolve this issue, please feel free to respond to this email and Greg=
 will reply once he has dug out from the pending patches received from othe=
r developers.

thanks,

greg k-h's patch email bot


