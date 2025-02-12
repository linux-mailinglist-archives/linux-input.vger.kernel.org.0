Return-Path: <linux-input+bounces-9989-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07793A3231C
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 11:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8619B3A9132
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 10:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A512080D9;
	Wed, 12 Feb 2025 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="niLmCy33"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010003.outbound.protection.outlook.com [52.103.68.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B432A2080D0;
	Wed, 12 Feb 2025 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354587; cv=fail; b=RV2a1qs8Orq4gZ9QWPKaa88nY51dCrJK2OgD5n60/Q9mTOVfZvgmTGjY9LtGVwvyaI7NrHMaC7RmteUWkD2/0gTc06AQFXj/tf0OGECZf76XnVMHoLY2nD22Q5UrlJ1iv+VO0sFEXFRXCDDr30XWWn6odLYwGo/Y3Yb6ScFb114=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354587; c=relaxed/simple;
	bh=AQOlqBDnB7cLJAgP8lzTnMWBvgDnU+SFs76pQ16IDu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i/wg7xZACV2UQWqu98jJsXNdu2ekuFJX1uadsdvjCaQYeiu6PZpGgF9wb1U359B5+oFmfugopmTZ4b2H6GMCGPkJMjfqtkInL1Eo4H+9KfNrsf1rl2LizLo2lUT/rHOz14exQ1aaUv4olEHpye83fl6qcdAL1r4XRQ7Vd6gOSIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=niLmCy33; arc=fail smtp.client-ip=52.103.68.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQqWspinlgu4IBmOSYJlWMUz5i0oyNGtVor5RsjEPoWqwSG1ZeBemjMY3CZIkMk/yKG+Fprdv5ZfrF1HvdBF+tZVsKGjMPzHkG2UsN6ler3FTOefNGk0VL/mVE8hVlOwiOBDtI/pdTYSIHRNoReIDwLT3elVZhukCgP4+Eyalbjv7IfTrF+7t/yP+/2EQIDc9dZtWm3idv/Hv6t2dhkxlu9Q4fjG/MI9etaRKF4bRexa3t5bfIbeHiF05T6mrjc4i2nENthax0VzhWjuLDG6pLJC1SmAA+0sMsiPGN+kjKkGv9AzcHViLJmqChoFuGrhviYl/s5dGG7XemP48Uc5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTYRjwX3SgZ48vmK8X/POKlNQdYbvoOOqDKIdAvACsY=;
 b=Ea4CDVc7bPijtLiVGJ4kZbbEnh0hxj42m/nzGtHxcAMTKfkfMxSKhAe2+x4vbZaY9DlE3ANehSU1tupSh2Co+IobrzrHEJLsRuJODJSbQNzxiy0IydBNPlJymUhfwV7pY6FntNNtCOw4plZCzM1M8qUhQL84ONapx6AbJw9PTWqm9UBSDjMgCDz8eGG2JCeqgV61shRnOUjQLcFpVIoYOJGjK0QR385jmfDStt4NGKYOEv/9TSQIj5D/YTFBaN3bU9cO+xPf+gWSlCZDGIa/gfZySkImONEIErPRXmQjTBI3MuVsqpi8oRNp5Nt0bpfgMi6J+yoCktCBAJShXeux0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTYRjwX3SgZ48vmK8X/POKlNQdYbvoOOqDKIdAvACsY=;
 b=niLmCy33ZkKoJ8bzM4/tYL3pWlfX1jK8AqbRUFiHNhyQW3QsPkx4mrdsOh/LWw99AUCn5fgSYIIy/JXitBgCN+BlYp1FcstY1TprrsXlm38d/YWPQj4CfjhyTjguZ3tUFVvPKHtTMMWzlL/IKqx+sMlqvewAbjZHj7YHrqtaCAf3X2/Cc+tJQcGHYjmmnjxTr3rnU2zcW9OiwjsQaeCWI1iho7xqIg+MGncN4oVzcQROf6LshiFvfYj67rHuaZiQ02ymWElUKzfRpJ8qc5DR5eGsnyRmoVcDEjyft9OSVBKUy5Cg42W3qdaMd9ZnPzRfY27HjrvhzV77Ng9LG2W0yQ==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN2PPF10DD11BE6.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::585) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Wed, 12 Feb
 2025 10:03:00 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 10:03:00 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH 2/2] HID: hid-appletb-bl: fix incorrect error message for
 default brightness
Thread-Topic: [PATCH 2/2] HID: hid-appletb-bl: fix incorrect error message for
 default brightness
Thread-Index: AQHbfTVM4IHCc5iYHUW/FHt3tt7AWw==
Date: Wed, 12 Feb 2025 10:03:00 +0000
Message-ID: <0CF9D2C1-6FCE-496B-9030-195891116C01@live.com>
References: <588AFB72-03C9-4EC6-853B-3F4C362B7AA7@live.com>
In-Reply-To: <588AFB72-03C9-4EC6-853B-3F4C362B7AA7@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN2PPF10DD11BE6:EE_
x-ms-office365-filtering-correlation-id: ae4348f8-f343-4834-ade1-08dd4b4c6ee0
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|15080799006|7092599003|8060799006|461199028|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?F1uZNmNCCiGs5Nhh2+ZDcJo1gEIDPj+CY1s9ei1BCCqSVmbjRb/YPx7fSV6h?=
 =?us-ascii?Q?la9+YP1y+AiS4dE+ljqdLiUHLT5LEBzMoo/72ICZK5vKtcJ+wPxuUV7uZlmE?=
 =?us-ascii?Q?gx5HWVbcGqXmRbeuj6eiB68e/89H/jpC+wv/m7LyM5pbQ0//HjG/TXEZZgxB?=
 =?us-ascii?Q?v2AaY0Ks8Amh5U+7dAxT7qvgNDI1/kqNAwpYtZ4AfzCASmV3DYF5loeWYeM8?=
 =?us-ascii?Q?GB+iQHEpfTP/nnEFel8pp7EBw0LOgc1V7RMh2zKOhlrrlyDjOMz6jpv28nm5?=
 =?us-ascii?Q?3vYUAcxDY4DEvwXp74JW1JZ9r0Np/8RsxLcOqLd5aUeXU37xx4om3oTLhbYq?=
 =?us-ascii?Q?5lDxdXs48M4l9HCD3K5hvVWktGnvqRqmFWmaxYA9duZVyoramHLWoGqqQBrd?=
 =?us-ascii?Q?uJ7KOCPTuwMZw/t6OJdt+jWpU/GBGhXlVRFhBD81wjM1847ezXfLUtS/t6H7?=
 =?us-ascii?Q?8aQTf/l7UglAY2IsAAS/wa82MjjVsOD59RlmX97aFVhgyDMGsC/7apYwZ9Vq?=
 =?us-ascii?Q?+hpqeEBmEbF1PJ9fyTRQrtpWLzapHLbBYWOrulLU/DoZteCgXhPpKZpHDhLd?=
 =?us-ascii?Q?n9cqRqfcOXryQMbE7y/lF+1O4wAr4RCJP2LLQbKVuPuYGYQr2awPqqTrDa5p?=
 =?us-ascii?Q?1eRM0j3d70c5jQaNNASB92aABpB4Ait9xjYi3OBXTMRtY5Vc8sCash/lqh9A?=
 =?us-ascii?Q?EKcT08CMzD+tIIPgNerGTpZMtBVM/ICe5tV/XSygMy20RCjd+KaiYz86FHN2?=
 =?us-ascii?Q?CChiBT3HtbwzTz2i0qGtSbRwsIIh4Ahejqt1vSIAmR/aqKzfG1st5KbZgG0o?=
 =?us-ascii?Q?qoVb81UCT4jXh5DjsUSvSbpRGTDSYNKBVsgiRQya909wOxE3JTZilk9PDtw8?=
 =?us-ascii?Q?l+GxkJquFsTaer0kqp5EsPX+mhUvjBhJuuePJhgQL4YMBcHqb8k+pUurTRZQ?=
 =?us-ascii?Q?TTRT2TiFEeCnciqDafNlAZL3iXPDG6Hq656BLY6VbCa7Y7s1EWI7V5vbAwIr?=
 =?us-ascii?Q?xjhpgkE5wl7syomt2AqDQu0qt4N/ZY1zjqDEM/ZYK/3ET8waw9ZC3NxzTzQ2?=
 =?us-ascii?Q?huh6NRYJ/w63ZZ/jsmhPj08sudr9Vg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Of6qKzi8gGlDwMcOS9ab/kIOinH5wOXdoJt6mh/tRbS3xO5jpRMcC9+TMG0n?=
 =?us-ascii?Q?vT8v2zqBcpShihaTStdJyFlr9UaXo084Z3KbkXsDFFngEfyECbSyPH9/sfI6?=
 =?us-ascii?Q?6JHTAoADhkGPuTvp62w574HtAmyBb6t2xgFkJkTW/pVY1zQZUhaJTos2rCdg?=
 =?us-ascii?Q?UyXWuWAYZtz9U3MLobIYnEhtutbCaIACrINcmTPFHqJnkMLGaUmR12PfBE2Q?=
 =?us-ascii?Q?6QcWAy+ngMvFEbjWT6DIuo3Q9hh4pag4lXrYZdd286alS/BsTLPkIWltrN0G?=
 =?us-ascii?Q?PUYgHRFX8/7z4oaSpucrBrMFZtkqyLbTQj8xrsGbylXWfZqirktWjw++Eppm?=
 =?us-ascii?Q?vbUDa1sTWakpbCZ2aqBjSB0XAumlQUIStAqvA/egW/n/BTp7L5few/InTbxL?=
 =?us-ascii?Q?WOkduZxGPB1kIDTPCsCTAfkXTYMBigZ4sl4diwQCoVY9Eia626GWbyl5ga2S?=
 =?us-ascii?Q?UeAeKVFCxQRx+RKQKknI3+CQP9sfQUtx76zCFLgURkVEhB9iRGU9/u60eCWZ?=
 =?us-ascii?Q?W4jDCeKzBdl/9Eik6f4aHhRGuZrlxGdQe8TYRkIU9LnzkSMhIvOaJ6yB4+Ab?=
 =?us-ascii?Q?hOSkRpTqczSOA4YDgvXQ4/Z5IrkUmZfsOMbTtiwIXyCHDvTTwizFg6FD21lT?=
 =?us-ascii?Q?sIJ2YrOxP37ZExJ4zd3JTNlQRtEWeO6ElbozpZYNX08udD/DfBPagMWzQqCv?=
 =?us-ascii?Q?qY4t+m3Smc0k/YZ/fvr2wrDX97eTpTUIBPODQcawCnMA8dIx6CWZ29/4w7ra?=
 =?us-ascii?Q?EbIrhreVk1YlWfdC9WJL2m6tiHy7zMSISbslVHts1TZLNdBvYiUA7weoW4DP?=
 =?us-ascii?Q?EUqp85gs+7gYk7h2NzwgM+an/bzvgZgRIHbzmthrF4w3p4RWSD+bk+R7TDia?=
 =?us-ascii?Q?0bJLBvxIUN97t1uv9NFeCndqPhA+fczlRjB9q3A+GrwdEGoYZRkxfcUQUB/G?=
 =?us-ascii?Q?498XsjBz43zYTToxVHEQZengMlu6HPvlOkSW15cMCeNeCIF4d9QU39oEdDqz?=
 =?us-ascii?Q?qGrv9taTubNNkZdESLtKk9Nea0dTsDA5ezY4bMLYrAx7QyXaBSkhSFLrRby8?=
 =?us-ascii?Q?XyIhxHxsV0zEIHGhja4VP0xEqon1qtd9V8Ngnn/wUZK+yDxAJH+iyU5gu+SU?=
 =?us-ascii?Q?wXi54kjjPvDARCQUkFdjOTgKk+bVDYqjPVrmXad1Uy10dhQWofEJl0Y4MCc4?=
 =?us-ascii?Q?H4bQW9Lxvy+MXRZ0xuDeh0N1rgi4Fl6FjwDh1Om3F+Y3w2AJ4DYBldGRvqnT?=
 =?us-ascii?Q?1jtb/VuT/ydEXzHuKJAhWdz33mPqoWr3Mf1kh/DcP6WNHSIVlJ8gNE4fX8nY?=
 =?us-ascii?Q?slYmcte1dCvn3gwpXpWMWL0w?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F65186DE17E31649BF3FEDD4DE3E435A@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4348f8-f343-4834-ade1-08dd4b4c6ee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 10:03:00.5646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF10DD11BE6

From: Aditya Garg <gargaditya08@live.com>

The error message responsible to show failure to set default backlight
brightness incorrectly showed the intended brightness as off irrespective
of what the user had set it. This patch intends to fix the same.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-appletb-bl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-appletb-bl.c b/drivers/hid/hid-appletb-bl.c
index 1a3dcd44b..8e15ad5b6 100644
--- a/drivers/hid/hid-appletb-bl.c
+++ b/drivers/hid/hid-appletb-bl.c
@@ -145,7 +145,8 @@ static int appletb_bl_probe(struct hid_device *hdev, co=
nst struct hid_device_id
 		appletb_bl_brightness_map[(appletb_bl_def_brightness > 2) ? 2 : appletb_=
bl_def_brightness]);
=20
 	if (ret) {
-		dev_err_probe(dev, ret, "Failed to set touch bar brightness to off\n");
+		dev_err_probe(dev, ret, "Failed to set default touch bar brightness to %=
d\n",
+			      appletb_bl_def_brightness);
 		goto close_hw;
 	}
=20
--=20
2.39.5 (Apple Git-154)


