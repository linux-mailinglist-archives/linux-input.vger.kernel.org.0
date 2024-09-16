Return-Path: <linux-input+bounces-6562-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B74E979DD8
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2024 11:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7C0CB21EA2
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2024 09:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC18148FF3;
	Mon, 16 Sep 2024 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="ftLgKsVM"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE1413BC1E
	for <linux-input@vger.kernel.org>; Mon, 16 Sep 2024 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477568; cv=none; b=dc52MyaCXNmLuYAj/WFYJI8/VfURKBEOwH7DWm4uctOfIY1GiViyNCqSm7ozC8Hk0h7CeeU3NJ6Wjh7ZHDL0i2jMYN16nzDNHqxX9GymaOJ7mcP3FOuXxz5KT/kl1x2+wrq94+Dj3HYCqxGDPvqyTqXlsPUQVzztKi9GmsHvHKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477568; c=relaxed/simple;
	bh=XnSJ7nwiV++WH7h/weW60AsMWZHn39CemEXH7P6KMkU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=n2y6CZziYc/pm4A94kq4h33WDIeC83d/+uESH0SR1qb2get5QIYD4g2Q/iNaMHR5Xp7BCcr7UX1qR7UuFGpLWOog4iMY7u7F05n5y1K8o/GjH1MBn2W5VdPrH4kiSN1iTqE6nfRzL5xjXcVS528Xk/Og75Xx/eMK7ZLjS9azZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=ftLgKsVM; arc=none smtp.client-ip=170.10.129.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1726477564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fc+7K3orTpcMfJXPpo7vMGCpQC3kEfmLWjRKwjYgOhM=;
	b=ftLgKsVM//32ZApVzrzpZslSEKkxEkDbOWRQq3Oeu9K9EBRRDzSUb1TBaPXcmpdYLOJdkW
	69xPYEIkeMlB6KM+V9dYhaWfmmyka5k7RrAZzZNbyMTwqUDGkkIdkXTwdBScX1CYoiaE8w
	s89P1chiAqcOXVxh40iiAV5jld/VEc4=
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-xzLHaF1jNGymKVBmlfCPew-1; Mon, 16 Sep 2024 05:06:02 -0400
X-MC-Unique: xzLHaF1jNGymKVBmlfCPew-1
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by PH7PR84MB3552.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:300::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 09:06:00 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 09:06:00 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] HID: plantronics: Additional PID for double volume key
 presses quirk
Thread-Topic: [PATCH] HID: plantronics: Additional PID for double volume key
 presses quirk
Thread-Index: AQHbBeVuSs8Dt1e4A0a1MKmzfli3SrJaIwWQ
Date: Mon, 16 Sep 2024 09:06:00 +0000
Message-ID: <EA2PR84MB37804670F5042A839E87CAC08B602@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20240913060710.1325640-1-wade.wang@hp.com>
 <kn7ykebpcapwnwhof2wlquko6zzjtfgn3xdwcfd2e6eyytzu32@wh3tck74weut>
In-Reply-To: <kn7ykebpcapwnwhof2wlquko6zzjtfgn3xdwcfd2e6eyytzu32@wh3tck74weut>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|PH7PR84MB3552:EE_
x-ms-office365-filtering-correlation-id: 2f16e3d4-e124-4183-9ca1-08dcd62ec8c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018
x-microsoft-antispam-message-info: =?us-ascii?Q?Fwpq4nDU5wiLP5xZPqCgQQJ78v+7HnzJDBu1+ZhD3CV7yL6qxQyehHmRVP7z?=
 =?us-ascii?Q?hkWOPJxYM7fpi3/dlspJXPHhNC164Pm/gkE8WgWku9O9fCvENHCUCgBT48bA?=
 =?us-ascii?Q?MDAgI6oZOgrXU7M+HyQYTVz4bEWsleKYirDD5A0lXLjmsi6EdmnEV+TkEOZf?=
 =?us-ascii?Q?RibP5zcNoR/8POjGii5W71dd/IYxA3lw4zi76tXI5Y+fRUj6WWytr7tP7ZpR?=
 =?us-ascii?Q?Cjg1VpHLKohTW7MJLgKc3kNMHxGzSz0TBMdd32CURqjJLh+5NFl4YHLHbOyL?=
 =?us-ascii?Q?37fyBMQ0Ge1oqIfwL8fvqMww76P3cCKjvHki/NQcq82p+G/mpC7zIz0CFZQC?=
 =?us-ascii?Q?KiKRDSVKMH9c8nsZDqlEIcV0rsaXUxHIAxmORbUBGTtPO4pkSgGl1tAe49lD?=
 =?us-ascii?Q?hvYPctUdtQjDfol1cHWkMgYJJBwNC3mMk62+94YHEbEUYwGZHXoKBeefAC+3?=
 =?us-ascii?Q?2uL4EPNA9HlGSK6f8SJJVMpnokNeZ9SjXcRapwEoBJQBINrU8InvyB3//Wz6?=
 =?us-ascii?Q?vRLcdkIMXuBCM16pYgiFuC7NAdxryn1mtYH+Z0QGi2tf14JEeWsbUOYQKQ7k?=
 =?us-ascii?Q?9IaxCjrL85/4WIzeRkbkOwgreaVk7CG9n9nIP4jCT48PJvZ9vnO3W+rofzDB?=
 =?us-ascii?Q?WzYCPs7N0VtAAqIrZI88pYUVaFmd7lRNnIbShsaLJG5VpdiApKok+eSHHK2z?=
 =?us-ascii?Q?t5GZADSDidgN/Z+yJaJ4MwrCu8EtairnBhoBP0/KnRbFZo1Gu2a/m7UI3xa1?=
 =?us-ascii?Q?zaNnzlRHcGidp/f4TebTfs2YPFNxhQsgo2+cddRoc1R2S5bXq9ZIihmDkHf2?=
 =?us-ascii?Q?HgqVFqThPdqgdymBstcAq+47os5mhfGL7dJ0GlrSjP6Hp26vmStKuzxcamg5?=
 =?us-ascii?Q?VE81dDioB36WCHRSwEJKFwU/xlsiwQhfZjs3U2nFOUOGc+D56eQqXvAi9fVj?=
 =?us-ascii?Q?ZjoMi+hbLEwSYWV7xJyptp3KfZMOgOZ5fSc6X3kNOMxClAaufiZUPHJGhfA4?=
 =?us-ascii?Q?esE8kiRO49ABNbztqldov68DacuU/KwZnF37gYLhnLKWT3Onk44NDUm0DgEa?=
 =?us-ascii?Q?qq9x62BMdA3jcYCUpa+eimw6KYsjoC5/4K+W+9IJiy4gb4nmmndrqSilFp6J?=
 =?us-ascii?Q?xeBeodX958tWJJtAYzzh7ShhtP7Egj27o+h5GdFSN1JZUOVgDzWSfDS29TTm?=
 =?us-ascii?Q?cYGQ2dMuzQlG2x1/XOLmwozK3pJ9zPEdvZICiwD204hmUxZ6zAQx3ccoEQii?=
 =?us-ascii?Q?bynu3UjW/mZKUjdDEuUI4wp62M152FHP+5NfQrdxo4iDyzI0FDJ1b9pVM1Kq?=
 =?us-ascii?Q?J4QtatEk99ac/PJ7Lsvby5pWeNx+3HRG4b8HEeP6LnpLcrIklTHJNaOFLybk?=
 =?us-ascii?Q?+JNltdeq8ukrPZvas1zLAzLgFyTehTDOFGQkNGfDFJSRN2y7Cg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QQSSuJD2Y9TgGXwiItBUXa88GAlFM0k5td1aVgqt5T4auV6tnUrLSbd+jLKP?=
 =?us-ascii?Q?3caKB9rxzUW9qdUrhq/QeQR8JnBM8pM1kmbfrxEvBW4iuedjyAiufq98gqij?=
 =?us-ascii?Q?Epj65LxNwF6mmyqIzBmgm1RjS0tsV1hhpoektlYOE6i197Q6AT5LPDXtIHiq?=
 =?us-ascii?Q?T5uriI0wPdZmDBe6uWpSgvfbrHoBUfERxSiJWZXj27SZ2JGF4S0EYZrY8xff?=
 =?us-ascii?Q?J3A/JbgZQLDFPZ5WnGgkVJLv1fct3NTcpBOqtEMer81RgB2WUPJrXcmH97Iw?=
 =?us-ascii?Q?hjg3XjMOihPaHKdAiVnWnmS4ToZXjxdBwmkvojqmq/rn5bRCcmGhmNAJJRU7?=
 =?us-ascii?Q?JVqAvJHtQCuy5AKPe1GwKuDfMHMofZowvi3Y345tZz3ssafrAU4KWJkeNj0M?=
 =?us-ascii?Q?3Py9qD9B4kLzXLQ15x+K4MKndd3akGT9WXBZjghiR4qgy6Bnv9pkQv9Y8W3k?=
 =?us-ascii?Q?V3YH5N+vgaWmzSSHK5YcpFIxG2ZD17kIyRbPiE2y/Q423tWtXHxZI3Wz/eNf?=
 =?us-ascii?Q?WTWXoe8f92HyKYJYtoS9Lwe2Lv7thfXRD8TJ7I4Kr36c3u79ExJM+bRwNLl+?=
 =?us-ascii?Q?ETNcV7yNOMnWxKlEshFiNcUS33ZvrUpm77EzYRfQvCXFJ1eJQYc7lzyjLF2F?=
 =?us-ascii?Q?yEdEd2otlB/gW25ApVzwyEIgf4Dat3XcoypO+TTRqy4a8d8klKZw361FsTzL?=
 =?us-ascii?Q?Dv0XwzK8dmVqRphDe5hH6ZrcKcg1qjZkcwZW2klEE73gDJ48cRLQdh7sPu/x?=
 =?us-ascii?Q?rrDfaktiyDV0u17+8TufbysGBhx3ngrxh1XKFcPyqUWZpG26zZ+i45uc4apA?=
 =?us-ascii?Q?po99IP6yG6qBvrCYf437FXDKX93l78/1tr85QHDv4SqArDaGj96oqaAwQMqh?=
 =?us-ascii?Q?kSI571DETwrMa4zFpllpBiGN4G8c5tWEqM2yxe+733WHPtuZ5uFP7i3KnpzR?=
 =?us-ascii?Q?YY94JSqyjiLblOHSIK12ZwikB90aaq9zd9cKYEnrWtrMFs5TLic6GTyb3HL6?=
 =?us-ascii?Q?oDLtUYvl3zFZuz/tI6rCNrWavnVYhAQEQ9k2G/AkGfS9P4YDieYQ1QA3dZV+?=
 =?us-ascii?Q?6JXnpDcWvpMzwlNV7XChT6vLoat3CU0Ouun0qmHYFhKhi86suBFC7kr+EdhA?=
 =?us-ascii?Q?XUuMSz9wW3i+U4MpSfqzbYhOLjDp2wF/A+OGyBkY2Llh7IyNHrEjyB6b9TIa?=
 =?us-ascii?Q?kIOQARyQ3j5RLItYhu4j8EARpqhXpolzyA+mY5lNgsIBegJQm1e8aW3d6E+E?=
 =?us-ascii?Q?pmJUpu7BDOMPBeonPKW0g1cJagCFpbchRE8nsovyIusNTYS80kPtDcRag+a8?=
 =?us-ascii?Q?Qe2OhSNg0MDXdp+ULaDs4yNZ9TA/KxCqIqjqC0IxsFl5GQptCq45SP5w661J?=
 =?us-ascii?Q?lqKyjk4NjIUfdv9jwLcMNi/A/j+YnwZbGXx8VFiIMXATsFkXwpqw4cd3zZQy?=
 =?us-ascii?Q?HRRKTwau4eksqGt9ED1zs/EVGdxDA2rQ9MPmG8fYVtz0tOsZfPAal8i9Nlt8?=
 =?us-ascii?Q?6u9/hcZZaavFUGvA5N7lFTPHhFyJsVud7M+QF7i+Wqk1jojg3vqAh4H8ZGKe?=
 =?us-ascii?Q?+q7p2kicvAYSD4W0G7c=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f16e3d4-e124-4183-9ca1-08dcd62ec8c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2024 09:06:00.4542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sw6vBC8C7ZQ/EDnbv4Y1351txBp3zp8zhB6wYMEn2Td1Kt4x4beOd6E8dJ4gOnlYJmW+u+tYBNlp6IN8PoE8TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB3552
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

I have sent 3rd patch per your comments. And this patch does not depend on =
other patch, and can be applied directly by "git am -3"\

Thanks
Wade

-----Original Message-----
From: Benjamin Tissoires <bentiss@kernel.org>=20
Sent: Friday, September 13, 2024 10:01 PM
To: Wang, Wade <wade.wang@hp.com>
Cc: jikos@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel=
.org; stable@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Additional PID for double volume key=
 presses quirk

CAUTION: External Email

On Sep 13 2024, Wade Wang wrote:
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
> These Plantronics Series headset sends an opposite volume key following
> each volume key press. This patch adds a quirk to hid-plantronics for thi=
s
> product ID, which will ignore the second opposite volume key press if it
> happens within 250 ms from the last one that was handled.

This commit message is very confusing:
- you mention that you are quoting 2 commits,
- but then you don't quote them but slightly reword the content
- and then, and most of all, you insert in the driver a new timeout of
  250 ms, which seems to not be with the same bases than f567d6ef8606
  where it is mentioned that "Auto-repeat (when a key is held pressed)
  is not affected, because the rate is about 3 times per second, which
  is far less frequent than once in 5 ms." -> 250 ms gets in the roughly
  same range than 3 times per seconds, so some more explanations is
  required

Please also follow Greg's advice and, as you replied in your last message
that didn't made the list (HTML), please resubmit the series with a
clear v3 indicator and a description of changes.

Ideally, I'd like to also have the other plantronics patch you sent
today in the same series, so I know which order I should apply them, in
case one rely on the other.

Cheers,
Benjamin

>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wade Wang <wade.wang@hp.com>
> ---
>  drivers/hid/hid-ids.h         |  2 ++
>  drivers/hid/hid-plantronics.c | 11 +++++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 781c5aa29859..a0aaac98a891 100644
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
> diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.=
c
> index 3d414ae194ac..2a19f3646ecb 100644
> --- a/drivers/hid/hid-plantronics.c
> +++ b/drivers/hid/hid-plantronics.c
> @@ -38,8 +38,10 @@
>                           (usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_CON=
SUMER)
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
> +             .driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS|PLT_QUIRK_FOL=
LOWED_VOLUME_UP_DN_KEYS },
>       { HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
>       { }
>  };
> --
> 2.34.1
>


