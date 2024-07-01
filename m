Return-Path: <linux-input+bounces-4779-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F169F91E868
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 21:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EBD91F24335
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 19:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E0C16EBE7;
	Mon,  1 Jul 2024 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="iXNVztRF"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2034.outbound.protection.outlook.com [40.92.103.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3581E49E;
	Mon,  1 Jul 2024 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719861509; cv=fail; b=OXApT/5umMMsvjd51Fc530DgTqw27nnw/twy7dxCa1aelqgjPJ7LJ4f3eco6Xxv/iHdgnPKZotWzHSTLraop7tSEDVHZmAhi0xImY5krWY4nhzSNQC/vzPFeVZy2T4aUFwDCtY8YLhiCt4d2hS4pbjtl2HuHbVrmpjbOqmzRSN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719861509; c=relaxed/simple;
	bh=ovC/UBs2g5yo79HPhaHzGkpO0p5+/DMSnppNqLg1pAs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=C71ncQqXOTXpV2DWQMuwwg3MaRNBmR+tLWRfDCrDqZ967Yk0Y8cZSN/OZtZPMq0qtYxX0hf0rTrOLlg8U2LOYZw217CJLaM8oHg81i2BNi56q3zH9hhfmKDXCWeyb5DZ6umop4VS7lhiNg2/T3mA6wk6xRBXrs9wxjDrs3AR+wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=iXNVztRF; arc=fail smtp.client-ip=40.92.103.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWH1dqIF1v+DkZYjG+vrq/0D6BaPmUKgHgrCvi5J8rndEH0GJ2AIvF3OKaEkPUFl1mksPpls5R+YzNPYdcIBgOCWfl/Z4IVE1Xdmu+il2BphNwr3Wvx2/+RzGG0L+/Kv6wRZUEvcf2UwoCgs6Hk533/dqonQzJa+v/mkcW8p5TVgn1DgfQ4sGUKF3R9ukejZP+8t4SfXWfGcKFVVaWzYez9XWdw8fU2cgnXn0N7ICyaRLvdkEBAwuIeyjn9/M2+DkOODkDl79+amp1/O/v5mrnjMKoXPLUEvpiEZwARuIxjoYXPqkS+MTT9ZKYVKqaM2LZ+UGzMAlrpU8Im8K1u/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz3saferaEkca5r9/GbIc0wad8ephS3HYrsopMygFx0=;
 b=mbUgBGcwPgtduMh2YfKaQZcEbkBzPIhRzB5NccWsAes0uEl9TJy5SDtS8kDsI+EzBhnVX7Np8IBw0hyozwq9y9wlhrtXuGvVVi2pXEzfCq6GswrsSJ2ye30WzlK2IeQ/9TdmqRhoWFuEfyBH9IFbM9+Ce5jJivHEbm5APmNSm+BgkDMwCxg+Hr7s8tAtZG6FerIuQCOQ4NbCMqTZUtXZ9HdFmWESKinp1XFU8tBiJRjOh0/UR7JP9aMFz2MjmmzgK0bENrDwS0pIKiSq+13HZ/lZGkMJJzz337SwA/gPx1Y8Rtfqo15yR3Hw32R7qN4h2FL8us5xU865yoWcC5Vezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz3saferaEkca5r9/GbIc0wad8ephS3HYrsopMygFx0=;
 b=iXNVztRFRk2aIUhtZ/NJvu1CLWCg0K+dM83pKENzFahk/1d9DRY5JMABZ/vQUOfGsRTlfCMZK7iU3lhq8gr1Jc6bmQrbP5GXEcSxCGUvOIpU9b9Ep8jfnUVmzy7GaTE6rw8CEZjgQdnBEJmXtrjyy+HGNE1zD8r5Tx1U5QTLnjNHIOSKQxFW1VwAeJ8TMpg8JH7RtzzUE8vnivswnC54n8zGONL1cC+Nd4Kc2ahZEl2sHK4zdYEPUQXnmYQKfs594dlJ4A0EE/8HEPLnluXUh42HYmIDGQdjnioHAC21LM7AospkIhx8QOK78XWfFdwg8unIs1DsBujGAzT2yYsqeg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0651.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:157::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.33; Mon, 1 Jul 2024 19:18:20 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%7]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 19:18:19 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Pavel Machek <pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>,
	Kerem Karabay <kekrby@gmail.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, =?iso-8859-1?Q?Thomas_Wei=DFschuh?=
	<linux@weissschuh.net>
Subject: [PATCH 0/2] Add driver for keyboard backlight on Magic keyboards
 found on T2 Macs
Thread-Topic: [PATCH 0/2] Add driver for keyboard backlight on Magic keyboards
 found on T2 Macs
Thread-Index: AQHay+tu+kky9VD7J02WwQm6wUWVZA==
Date: Mon, 1 Jul 2024 19:18:19 +0000
Message-ID: <3055BCC5-8F8B-4472-9E94-1319D1C6DEED@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [49w5fTR2qJwhfKEx9vjMANz5B0oaNaO0pNiBkb5T94JSyNtX3dy4H1l9DCf0tLFowKQwb03uVOY=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0651:EE_
x-ms-office365-filtering-correlation-id: 7b25372b-281b-4abe-f8e8-08dc9a029108
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|102099032|440099028|4302099013|3412199025|1602099012;
x-microsoft-antispam-message-info:
 abAYnF407763HrEhGv6EaP/5YvWo/Frz+vz/kEOqII4qWhY5xH0JHpnQY+Qowbkn/MeU9XMAhaQOxsFN/hL5eLR9FH4U5ZAoYutT8Ra3xTT+ZS/JbByxhM+7tWCIELlWEnxNRmENUSw6bhQ1gkJftOydp0IxIiIaXSJVmNlBO5akjFHxe3iVZ4Z3lyccBgIpwokN1B5UFRbjaZPC3Sn5Dh10LFjKXc6fCrtP/BP3Y2eTpt/xOuEuu82EpSmoowNFXGMpwT+vxK7x6fNvoRvuAf8/y6W7aUyuza6V4a2UKtK7aN9yVuQk+zcC2kW8IJ4KTCcYJK+qaBM76JueK5KjmzFbM8AKReS80OWVASY0M+GM2XCIcQiIVs2rF9eIsJ+BNf2A0PRUyG5a360dFFPX7QlgJImtrfSdQGxuxPha5mtwEzw5+7ifdZUM7MGQOn9o54dztOyaFhVFrylBo8/9Va2pGKMeb5XDzqFc+kWn5LWPCqda6sQh73obzJnORlGn0rrd+2alfKOWibh07qxrb+XEf5KpVNVI/7PoykZnbFSWXVk4qpV2IMWbcMMGtw8eVzumy/5pUHgm8emFBTMadbiy92BzElEQgWXpKfBNtXIz7snWRu2+PW82MozqGEwd49o8JUHcU0dQPebjICYc31yNXXraLWbaCC6AXGxYYJH09azdX2h1enExKV/PiUrMGfR+mEbqUXzysRKv/jimCXjRYifnk3plzYusGn2aSS0=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TcQC3kR5cx1jfk0debmzqtz2PZigq0qCVwgWsySWQfxKq6bevFqzv9GFOo?=
 =?iso-8859-1?Q?iIwr89/TXTTznUxAFymgazrq6OMcaGQF1R1546Q9i1NZLzHasINIh8JGX+?=
 =?iso-8859-1?Q?Zx19Z3NxSYlsC3tL2wByWA8GeR0WxYm8iYjbsn1cork4ZU7igFP/kvrCVR?=
 =?iso-8859-1?Q?0pYpXdkH7XCzLl69HG/lY09aDVUJ5a9EQR2IQmu6jBlKkf9Ng0zddTj8ll?=
 =?iso-8859-1?Q?5zzF45jE7JoWVfyJbPfDJIvsueDM7s+pdlTrOqL2sUVuefm+y6fm2DZ6tH?=
 =?iso-8859-1?Q?mObrFty/i+IR0ulgLOLYAxtQw5pExSsT9vp1TKmHC2rOu5IXld3A2klscX?=
 =?iso-8859-1?Q?9Q51Sm2qHejJQJPWq1Iet219Hknv6bAj7xOUerlnGsdXnqbj3ttertPxau?=
 =?iso-8859-1?Q?CHMh9MUlE3tMDKC6cQI9LOKSmkJVjxGs6lUcH3oMRrmkYvi2FTndsORUfq?=
 =?iso-8859-1?Q?yboRYJ22+It7NXzn8f8rac5pK5HnxdizOSdUnOQpTWtZI4YXRr/7cUrG9z?=
 =?iso-8859-1?Q?5EF6aGRAIhzYLa3ZQKvLnZUebEldxvGU1yOJNfwN9g3wD4IP5sfbsYl9l9?=
 =?iso-8859-1?Q?OlcJhHz6qpGBp/n+kxs+BMU8qrcxAs3+tMUnGSMZW9EXmN1QwNVor51UvO?=
 =?iso-8859-1?Q?eGMzyTtu2cX5pD+hrpWOmxNtcCsQiAeUnvjfGomm7BNE1bxUffR/oeUNEy?=
 =?iso-8859-1?Q?DikbtlQ1sij27k+UCD54k4nnHgC9KjlWbQ9EkVMmfub/1/mjTxexskDH2j?=
 =?iso-8859-1?Q?+VPR8zllu2Q/FLaxG+kWjKgecaKcPweYyzzS78q6QkF+CcIhs/18nVCaAQ?=
 =?iso-8859-1?Q?aDgf1ox1FO6v2TZLYYH7I4BWa/m/InO9YrRTWzuwWLGM7fmhyr6GvCNlVV?=
 =?iso-8859-1?Q?qmlGhi89NSJjy6rWrnlaCsYqtRjyHF6ge+0PUY3wCXWRBS6nf/wlP3kC78?=
 =?iso-8859-1?Q?DP1mxskjIJm8O3LCtf4Pp8PPIc+TDO7QoYVeKK1gtPY9VOnpp6XtVjtNGx?=
 =?iso-8859-1?Q?OIZDU+y4Z4cSnQchgdzxxUxTVJWpbM0//HCJP1YPhierJNEQ0KTuZzIoYo?=
 =?iso-8859-1?Q?iPWSdJkHAqqest5vmLBGzYGImTwtSRiS69t1LobeydMZuHw3Nt+I0Ji43A?=
 =?iso-8859-1?Q?iT2IDVdq/sdIkanKgPsA1sV9Yy1bYTi32qammjJ3FF1jNBHnLTHv0PhJhm?=
 =?iso-8859-1?Q?sppRAMyT7+pqHuLaVgifRI98zVgJekpeu5ND227OBQI/NoXHDczI9936W0?=
 =?iso-8859-1?Q?d3otyJrJtkWlBGA5e45REDI6HtQJX1xhLTpXC5/KPbVEEZJnTYBbzUmd4r?=
 =?iso-8859-1?Q?u6ECfnXpRAvKSwP9+qdiKBz9hskbaZ5KJJopJzoPH+dkDq4YXgvawwGZd9?=
 =?iso-8859-1?Q?gnmP0cbyx1?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9A13D01C650D8A4AA8242F9D5FFECD9C@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b25372b-281b-4abe-f8e8-08dc9a029108
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 19:18:19.3560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0651

This patchseries adds support for the internal keyboard backlight of
Macs with Apple's "Magic" keyboard (MacBookPro16,* and MacBookAir9,1),
and also documents what names should be used for keyboard backlight
leds in Documentation/leds/well-known-leds.txt.

A separate driver for the purpose of backlight has been chosen because:

1. On the MacBookAir9,1 there is a USB device dedicated just for keyboard
  backlight by the name of Touchbar Backlight. Adding its support to any ot=
her
  hid-driver breaks the device.

2. Its now possible to use drm on the Touch Bar (similar to what macOS does=
).
  So, the Touch Bar drivers intended to be upstreamed before are no longer =
used.
  https://lore.kernel.org/all/868AA58D-2399-4E4A-A6C6-73F88DB13992@live.com=
/
  The driver that supports drm is still out of tree and yet to be submitted=
.

Orlando Chamberlain (2):
Documentation: leds: standardise keyboard backlight led names
HID: hid-apple-magic-backlight: Add driver for keyboard backlight on
internal Magic Keyboards

Documentation/leds/well-known-leds.txt | 8 ++
MAINTAINERS | 6 ++
drivers/hid/Kconfig | 13 +++
drivers/hid/Makefile | 1 +
drivers/hid/hid-apple-magic-backlight.c | 120 ++++++++++++++++++++++++
5 files changed, 148 insertions(+)
create mode 100644 drivers/hid/hid-apple-magic-backlight.c

--=20
2.39.2

