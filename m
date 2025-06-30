Return-Path: <linux-input+bounces-13226-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D8AEDD08
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 14:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A3087A32FD
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D12825B2F4;
	Mon, 30 Jun 2025 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="UnfigRqo"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011024.outbound.protection.outlook.com [52.103.68.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255802472AB;
	Mon, 30 Jun 2025 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287039; cv=fail; b=DYeu/1GPEn+4rp6fNXCIy4yNu6oXYkcUmiaJqa+czRJ7acHx8PCmGxn0H6wjzMw4k6IDlK0GFOcpPxudvqj+FcgweXTxDVaqtgEtafdhYc3P1TEmU4ddtI5HR0S2klhGyWBb/2/j3v8SY5A19YQzCPUhePYx/hUfYgpFodRq7Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287039; c=relaxed/simple;
	bh=D6s2TGl2pv5eXxJd+AC6Q7Sgwv24dX/Ufcjg9k0VR9o=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=n+/lH7awPpcDCzOR3oGBzgcYmC+6c9WwTTsLzDhrrot4p26gftCvpNai//S4geKMRa/FfxTUpaaTnEc68ZEQPN58dffm6ePfevYZhgzpYDfJ0fxxMthvblxpPabjNtqjwPRecdM+ybm5mROy7gNhHhMcVXO/wDmZ6Y/Y3W8Lfh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=UnfigRqo; arc=fail smtp.client-ip=52.103.68.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKZmGwWKENAxtL1Ua16714RESCZorVXFojJi1ZDTU4aPHuXLxbeFCLPMnHrf4vitnfyGj6bY/iJvnNPiERHadVuQqmVr0b3tXHsBnuRKV2c4AfKGscZCyxYn6vGumDpV1R2IiblMBqPd3bMRydoAlCwoVdKrAS6+tRFkM53R7v/gHbvGm9C4POeXYwFkH2Up0Vv8yr+hXG1siu5lH0rB0ay/I5LZJRpeC64DAKO2xoXTTUODPxJG3euaV7L3Geoqi0czmb2zKODx1+2SQW7ULN4mJULYmRcfTOK+L0/+pNsU7eCeTgIxKqlkrvCdTRKamb2XiDNcAF4Y7AlRaaJ3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1kuxqsY8M/TVH05pXts8imoZ/5G7Qixmzw7U8ImIm0=;
 b=ZknTZacjBry47buckQMAalvVhcGINn3vGOo27QqktJOl+yDWizfRCzaP7dDnH0KWv/yyf41CNvvhzBp6t/eRZ1AOlOvS/ppyXI/w6YyXxDFZnIkfrz2j9oDdpullKCf5D8JHrnUa4JxRptdV2UVaYl3uLbVLsvdpzCySGaDKdtqmjdIUyXxNMz+FQA95sNdUSJdIV4hBPoQ3HDKDtJBhIo2lQLAP5IoStZY9KW7G+b5E8SUOjPmLM76XIEXubwHvda0UHonL5Ci7YvEnGBMlKLky9VCKa89ViCivqIO/T28ClKXBefhbVOTekjwtvGIx9bnkxaE/KCU1OaOsYX+Zuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1kuxqsY8M/TVH05pXts8imoZ/5G7Qixmzw7U8ImIm0=;
 b=UnfigRqoHuwF2Nqn3LYKece/5K5Sr1O2y4Pu4pE2uc0r9bo5HeanGnyuoI72XQv824cpLFSx9vdZdcS/Ie5QUYQ5IcpmCi82RBDF0YzXX2l9H4R0SA0R7uSbhNEWU9lzYLIWmwu6inUnnAf2iZVANuapF5wUky9RFcq7XJxYgGZKY19Disk0OvQBf1+m9hmfXJPnCP64CXMzJmtmtriTG7UgGNDk4a5G7x3Wd/2WNRAAi5NQcmLZjBPga7bTAlBqDm2w8ETPx7kLH1oYtAUG2XlJjjZehN7lCXZiPU5/t2Dj6n1TvrWMqoddcR6oPYTjZqUSm/ewKgir16sYR/I2qg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6210.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 12:37:12 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%3]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 12:37:12 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 0/4] HID: avoid setting up battery timer when not needed in
 hid-apple and magicmouse
Thread-Topic: [PATCH v2 0/4] HID: avoid setting up battery timer when not
 needed in hid-apple and magicmouse
Thread-Index: AQHb6bu0boEw496P5kWf4S4YYOwYPg==
Date: Mon, 30 Jun 2025 12:37:12 +0000
Message-ID: <20250630123649.80395-1-gargaditya08@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB6210:EE_
x-ms-office365-filtering-correlation-id: 3b46f866-4415-4c4c-a700-08ddb7d2d6a1
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799006|15080799009|41001999006|8062599006|7092599006|8060799009|461199028|38102599003|52005399003|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KTws4lq91JGsvBTzLFpvh6JZvgA1Fd3O7HD4r8onkplhox43s9/aSoEGAE?=
 =?iso-8859-1?Q?gFzhhJgsmG10FNHqnrdihbFoGCtNVg3cFkuZNEu1Hpuzx+VmZuimOFP6mG?=
 =?iso-8859-1?Q?W2p/GPXdtAdXubbD7ab3yx3KIGOZQCqZDVjl3cOWy7sPKTl5dYbmNiNvRX?=
 =?iso-8859-1?Q?Ga2y/Tf6BQ6n1AIOsT+6IBUZ9XyUNGfZn589fgpIjE6CAx8lne0pavFMX7?=
 =?iso-8859-1?Q?P4B5R5QO6y/Hle+tebKAYn/FqIjVsAOJUl1VqchRAmQSpRYAuG2pIqPuEY?=
 =?iso-8859-1?Q?016AgmkJQFwlwkugIA9qoNJjjQsNZCDK3Uv/L9INQoWvBKCOf/TsDq0aW3?=
 =?iso-8859-1?Q?zhT02EZwK3YJ/yL5RH13v9Dd2ZNg+6pRf/ug3Z2vSb6TiBHW4PrJfZy7qW?=
 =?iso-8859-1?Q?eqQsRkIYtgRqzRe8QNl1MJ9971fr5Pm9z3PYHUbypv51N9OuYnau0RXOj3?=
 =?iso-8859-1?Q?MqosC+JYduPrcptpwK/7CERCrQzfHKta1nXrWjrfKKDSWCWP/+Lf822Gr4?=
 =?iso-8859-1?Q?bs3P6Vnc4YH0tl8WdBjzLolsAPR9jUbyoW4/kitK0bzcoQQCwTtevh9wvs?=
 =?iso-8859-1?Q?A40qiAEkfL9XgSV2tLnRcvaruiGRpCOihmeMgxUgpJrlSfm1MwoTBfsO/i?=
 =?iso-8859-1?Q?ipO+JjS7y6HwA6kgpNdNpSFC9YRA3yRHf0pyexPxZzEz5Fc5ZtwEOFeG33?=
 =?iso-8859-1?Q?MJxvFG1Jki8XaxjBYOyLDUZraRBAVAjwoOQspaRDmHDj/D8lMCUN+rPhX9?=
 =?iso-8859-1?Q?Al2cbetxEgxW9j0oirSxY1X55Y6bXN3tJvKqtVR7tUYYqGVZkegbbPmeZg?=
 =?iso-8859-1?Q?viLrPnmSJGqgKEWkYmRII6BMU6Uw/iWwDBuWhOZiq2wouwp+f0AChYPirZ?=
 =?iso-8859-1?Q?ji3pjud/qVuOsZ6zgoEh4gdEkPkgaFn/P39aBj4DqLeWTPl+WUL7GJjGE8?=
 =?iso-8859-1?Q?JeMhU6GYsMNkoVjXuVjz35vsrBv2IGgTVlSM7bj4qIGbaQ7a/PKi59pX00?=
 =?iso-8859-1?Q?roNRac5MZf6STfPKYvLFYgj+KeRuo7IHU5dHDKrc4xxvTEna2rd+1M2uR4?=
 =?iso-8859-1?Q?fZ2izzKYziHDLw/hJHSXtd8JYxZ/Obxoab4FW7Z/+Khr0fvTX8NecAT9uL?=
 =?iso-8859-1?Q?3hSh+T+KfeTIOCb6JoG4bmGxIpOsfNHvouZSNc+4uA/1YlT7svMfPqzvlj?=
 =?iso-8859-1?Q?xYb2hQeK0TZL7r58Z3VXLEOF/Ih85ObFqpft5dRfI4P53V7Ukv6bmTj1s/?=
 =?iso-8859-1?Q?dQlgeXQxjq7h+v/vpO6R3x5U/7EvVbXqiB7W/66YU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tN/p1Fwz5nXMiV1yky52K5B6KkcjeMXEaNdcvUL2c/Y8pzNRYj92GUQZ/J?=
 =?iso-8859-1?Q?fItdlYuqLN4ayAPG2rebe7uyavyWdto1SyutLBFRnOk0Odfx5PHluw43yE?=
 =?iso-8859-1?Q?yzERhKvUEYOwd0ZhZ2FqteYEEKlb9B5vhn0VOgx8WwAKf1ywgPliudDYYC?=
 =?iso-8859-1?Q?mPRMcVNXTPN2F76ocncLW8tIdZovEcGxQTLnuW8+yTna7kZ2C8Mk+wypNV?=
 =?iso-8859-1?Q?rXEOSgPFCI6YDQYtrQM7D6K4GZ5yk+MlUqAvBUDsEKSHw16+DiY7P7dK3a?=
 =?iso-8859-1?Q?ybZWjP8mLwvXvsn9Aox7Q6p7yUn1OKcRONkSBXZkbMoc2TNjiOoqx6L9Gj?=
 =?iso-8859-1?Q?kBRnsElElp+gtJW1uvQM39OBcRVC+v8r7zfH5x60zD89bF82m6BRe2vteC?=
 =?iso-8859-1?Q?n/zPjCcNedEQ0yb/KDK2x8tTLyZlyNC8MkhpOOf7JIlZtYuh1JaHE8q5bg?=
 =?iso-8859-1?Q?D07jgl+V1qdSxU5gd3ZKPHKxJq091xJaXcnyJaPLJ6FIrUwJY7nbUQIEEO?=
 =?iso-8859-1?Q?hH2v4HncQhUREQ4wmQXqalBm095mSiqE1rhegbYQ8od3QD02X5U1J+KHnE?=
 =?iso-8859-1?Q?nj+uS0TL4GmywQCMxElyTh3jyTmLjzQxEK1HO3+z36gTkcgCH9LeS5XQLs?=
 =?iso-8859-1?Q?OlKNrHokPnFTFNPAvPFvJhBH5vReBRBZohNPznCmoulsqeFbC+9jarwR8U?=
 =?iso-8859-1?Q?4TRsnf6RiiA1Skq+Sr/+3EzCq3PjF9uiri4Jv/Hjakc0P9KYrPg0288Iyg?=
 =?iso-8859-1?Q?iDJVnlJViOMRYdOcKc4d7YsRHVd6mWURK3BaDVak8ueGIuOe5JLP4aGEhl?=
 =?iso-8859-1?Q?H61xAamVWKkmwu6THxIRsxmeZKKjKHlDbV83pb7WxBRtjo6c4SWo8MXB3H?=
 =?iso-8859-1?Q?lKQUs1kRU+QoBsnB9gqFP4qGDIomuLFr0YBVTBch3b+mKi7Kmm0NlojUXh?=
 =?iso-8859-1?Q?p6H9h2iVyfC9d4FfXjAK9+nsfMp2WTgRykpUxClprTDugp3MqI4VkizGHm?=
 =?iso-8859-1?Q?IHcl/PeoFmqUesWIoYZ+aon3jU2zcby79jgW6LLLixNSfOMvAq3S9oLyKa?=
 =?iso-8859-1?Q?7slOOSH5+ddQ+mfzswC06P76ZG6niEeFZnLUxGW03k2dRjqGKXTx1aEGVR?=
 =?iso-8859-1?Q?12V6xVcnW9368GQhNOC5SvAtyfQZfLosBrytZkVu09B8HtUCiMCKG1/TPI?=
 =?iso-8859-1?Q?jsGLCsm6VBp75zMsTMbyymI0Do+5rKE8gX0NWPqOosl7rX5FnmeG8nfUe8?=
 =?iso-8859-1?Q?ZlQsnJiagSIuVK7g1vgGbV7To8rtdYQlXLoiBngeI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b46f866-4415-4c4c-a700-08ddb7d2d6a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 12:37:12.7780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6210

Both hid-apple and hid-magicmouse require set up a battery timer for
certain devices in order to fetch battery status. However, the timer
is being set unconditionally for all devices. This patch series
introduces checks to ensure that the battery timer is only set up for
devices that actually require it.

v2: - Address the cases of out_err and err_stop_hw left in v1
    - Create a function to check if the device is a USB Magic Mouse 2 or Ma=
gic Trackpad 2
      to reduce code duplication.
    - Add 2 new patches that convert the battery timeout to use
      secs_to_jiffies() instead of msecs_to_jiffies().

Aditya Garg (4):
  HID: apple: avoid setting up battery timer for devices without battery
  HID: magicmouse: avoid setting up battery timer when not needed
  HID: apple: use secs_to_jiffies() for battery timeout
  HID: magicmouse: use secs_to_jiffies() for battery timeout

 drivers/hid/hid-apple.c      | 21 +++++++-----
 drivers/hid/hid-magicmouse.c | 66 ++++++++++++++++++++++--------------
 2 files changed, 54 insertions(+), 33 deletions(-)

Range-diff against v1:
1:  05b6ac964 ! 1:  41c49e1d6 HID: apple: avoid setting up battery timer fo=
r devices without battery
    @@ drivers/hid/hid-apple.c: static int apple_probe(struct hid_device *h=
dev,
     =20
      	if (quirks & APPLE_BACKLIGHT_CTL)
      		apple_backlight_init(hdev);
    +@@ drivers/hid/hid-apple.c: static int apple_probe(struct hid_device *=
hdev,
    + 	return 0;
    +=20
    + out_err:
    +-	timer_delete_sync(&asc->battery_timer);
    ++	if (quirks & APPLE_RDESC_BATTERY)
    ++		timer_delete_sync(&asc->battery_timer);
    ++
    + 	hid_hw_stop(hdev);
    + 	return ret;
    + }
     @@ drivers/hid/hid-apple.c: static void apple_remove(struct hid_device=
 *hdev)
      {
      	struct apple_sc *asc =3D hid_get_drvdata(hdev);
2:  25b52facf ! 2:  a1617042f HID: magicmouse: avoid setting up battery tim=
er when not needed
    @@ Commit message
         Signed-off-by: Aditya Garg <gargaditya08@live.com>
    =20
      ## drivers/hid/hid-magicmouse.c ##
    +@@ drivers/hid/hid-magicmouse.c: static void magicmouse_enable_mt_work=
(struct work_struct *work)
    + 		hid_err(msc->hdev, "unable to request touch data (%d)\n", ret);
    + }
    +=20
    ++static bool is_usb_magicmouse2(__u32 vendor, __u32 product)
    ++{
    ++	if (vendor !=3D USB_VENDOR_ID_APPLE)
    ++		return false;
    ++	return product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
    ++	       product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC;
    ++}
    ++
    ++static bool is_usb_magictrackpad2(__u32 vendor, __u32 product)
    ++{
    ++	if (vendor !=3D USB_VENDOR_ID_APPLE)
    ++		return false;
    ++	return product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
    ++	       product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC;
    ++}
    ++
    + static int magicmouse_fetch_battery(struct hid_device *hdev)
    + {
    + #ifdef CONFIG_HID_BATTERY_STRENGTH
    + 	struct hid_report_enum *report_enum;
    + 	struct hid_report *report;
    +=20
    +-	if (!hdev->battery || hdev->vendor !=3D USB_VENDOR_ID_APPLE ||
    +-	    (hdev->product !=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
    +-	     hdev->product !=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC &&
    +-	     hdev->product !=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
    +-	     hdev->product !=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
    ++	if (!hdev->battery ||
    ++	    (!is_usb_magicmouse2(hdev->vendor, hdev->product) &&
    ++	     !is_usb_magictrackpad2(hdev->vendor, hdev->product)))
    + 		return -1;
    +=20
    + 	report_enum =3D &hdev->report_enum[hdev->battery_report_type];
     @@ drivers/hid/hid-magicmouse.c: static int magicmouse_probe(struct hi=
d_device *hdev,
      		return ret;
      	}
    @@ drivers/hid/hid-magicmouse.c: static int magicmouse_probe(struct hid=
_device *hde
     -	     ((id->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
     -	       id->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &=
&
     -	      hdev->type !=3D HID_TYPE_USBMOUSE)))
    --		return 0;
    -+	if (id->vendor =3D=3D USB_VENDOR_ID_APPLE) {
    -+		bool is_mouse2 =3D (id->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOU=
SE2 ||
    -+				  id->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC);
    -+		bool is_trackpad2 =3D (id->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC=
TRACKPAD2 ||
    -+				     id->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC);
    -+
    -+		if (is_mouse2 || is_trackpad2) {
    -+			timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0)=
;
    -+			mod_timer(&msc->battery_timer,
    -+				  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
    -+			magicmouse_fetch_battery(hdev);
    -+		}
    -+
    -+		if (is_mouse2 || (is_trackpad2 && hdev->type !=3D HID_TYPE_USBMOUSE=
))
    -+			return 0;
    ++	if (is_usb_magicmouse2(id->vendor, id->product) ||
    ++	    is_usb_magictrackpad2(id->vendor, id->product)) {
    ++		timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
    ++		mod_timer(&msc->battery_timer,
    ++			  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
    ++		magicmouse_fetch_battery(hdev);
     +	}
    ++
    ++	if (is_usb_magicmouse2(id->vendor, id->product) ||
    ++	    (is_usb_magictrackpad2(id->vendor, id->product) &&
    ++	     hdev->type !=3D HID_TYPE_USBMOUSE))
    + 		return 0;
     =20
      	if (!msc->input) {
    - 		hid_err(hdev, "magicmouse input not registered\n");
    +@@ drivers/hid/hid-magicmouse.c: static int magicmouse_probe(struct hi=
d_device *hdev,
    +=20
    + 	return 0;
    + err_stop_hw:
    +-	timer_delete_sync(&msc->battery_timer);
    ++	if (is_usb_magicmouse2(id->vendor, id->product) ||
    ++	    is_usb_magictrackpad2(id->vendor, id->product))
    ++		timer_delete_sync(&msc->battery_timer);
    ++
    + 	hid_hw_stop(hdev);
    + 	return ret;
    + }
     @@ drivers/hid/hid-magicmouse.c: static void magicmouse_remove(struct =
hid_device *hdev)
     =20
      	if (msc) {
      		cancel_delayed_work_sync(&msc->work);
     -		timer_delete_sync(&msc->battery_timer);
    -+		if (hdev->vendor =3D=3D USB_VENDOR_ID_APPLE &&
    -+		    (hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
    -+		     hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
    -+		     hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
    -+		     hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
    -+
    ++		if (is_usb_magicmouse2(hdev->vendor, hdev->product) ||
    ++		    is_usb_magictrackpad2(hdev->vendor, hdev->product))
     +			timer_delete_sync(&msc->battery_timer);
      	}
     =20
      	hid_hw_stop(hdev);
    +@@ drivers/hid/hid-magicmouse.c: static const __u8 *magicmouse_report_=
fixup(struct hid_device *hdev, __u8 *rdesc,
    + 	 *   0x05, 0x01,       // Usage Page (Generic Desktop)        0
    + 	 *   0x09, 0x02,       // Usage (Mouse)                       2
    + 	 */
    +-	if (hdev->vendor =3D=3D USB_VENDOR_ID_APPLE &&
    +-	    (hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
    +-	     hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
    +-	     hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
    +-	     hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &=
&
    ++	if ((is_usb_magicmouse2(hdev->vendor, hdev->product) ||
    ++	     is_usb_magictrackpad2(hdev->vendor, hdev->product)) &&
    + 	    *rsize =3D=3D 83 && rdesc[46] =3D=3D 0x84 && rdesc[58] =3D=3D 0x=
85) {
    + 		hid_info(hdev,
    + 			 "fixing up magicmouse battery report descriptor\n");
-:  --------- > 3:  3ebe25998 HID: apple: use secs_to_jiffies() for battery=
 timeout
-:  --------- > 4:  1d3400714 HID: magicmouse: use secs_to_jiffies() for ba=
ttery timeout
--=20
2.49.0


