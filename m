Return-Path: <linux-input+bounces-13228-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EEAEDD0C
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 14:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C9BB3B867C
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E2B28A40B;
	Mon, 30 Jun 2025 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Ow+qjnB/"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011024.outbound.protection.outlook.com [52.103.68.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD73289E05;
	Mon, 30 Jun 2025 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287044; cv=fail; b=UeGRShfCnegXfcWbB2Hgmdguh4i27+wEFCHKFcIKgmM46gMG5MG6yMN9UEgq0GtM6EoXHZdTDyM9U364nT5JSS3Hcv4bPDOpPMofSG1RPyvbo7YK1AYlQB4S9STxETHcqVUhTykKUuLMkkIRn11d0L48uxPIHYOwZCRDzThHcwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287044; c=relaxed/simple;
	bh=Bd5flgCQW8tE3ZQrY40hgeX/OMHhFdM3/Y06c/0U/UY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O8lQst4V8Z0PwouyjHl1HeRZqPHy/q2RE7PFfaky9pazTiKgOuwgi6mdc5Z2dcjB9QJ4j9aKBho0nx5aZI+5E3X0fYDGJ79XlEEc6WLhkf2kPMcc3jl3RFomTLC91RYIPWdf2/FT1LLWL+TFHa7yHAGz+SUC8uRTOPpJx9HMbbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Ow+qjnB/; arc=fail smtp.client-ip=52.103.68.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjlNICdY0oFA6wIEMR5OdtH7swkD1NZvmn5RTb1C3NxwZhW+wWYHDg396pCXpUqbBRXB0qId6UsRR0mFq5aXj9YKmraIdJhY5TwayPFq+SnxUucghm+DvM/eaP7aKK9cmu+RlyANCw8Xw/8/zbPW8ln9ziwPTTLd0FrxH3ZxXvKM6+n0/+Ke8Gm2cS9E+0q0ej3UujdA3Vb16tOSH38E+275diGv4qWLnjERR11sjLbqO1gph7932rJGQ9Ml1vpfWzVwt/gTM0YHPvkrZbqUT2HHYTaMoZz02xT2Hs0txMig26uFdy6bejeRgg8RtwiuPQPVTsESv6QGnT3pT/bTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQNC/cOSpIZVgzNgwji4426d0Js4jdAtVFgK1J8dj8g=;
 b=bql7wY0OBg125ZymKjTz1krHoVaOtiaLKjqE+T5A7s0UCrvxy1Az0FSyh75F/6hzD6B/awhpv/V2lY6xYF7xAd8MxBVOGJsSLDG3CkLVUuXnO1oVQv+b7OMrMBJoOOFH/NWQ2kuCpQ1Y34YO0yumnO1AdDWWO+5Ia2CEzSvkMMVp3Fd2HliuB4/KTJtVduhMXon/RQQD3Je8/YLYs1nJAd8xhv1xa3NX/eIk/GzB5xgU88g4aaXfhBTWVl2uiBH9D84MIA3TLFQJ1Rbw4sx3WolR+n9G5illmIZRbLQpH6IgSFE1662SwX/2L3nZilXqaoKC99fSpXDINoC5I/DZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQNC/cOSpIZVgzNgwji4426d0Js4jdAtVFgK1J8dj8g=;
 b=Ow+qjnB/gNN8MM+UcJuqchLrzBX4/zIznmsyxWHSrQzqIdpY/J7nHYvIZaUOne3bEDsUokjdKI1XhAabixEgrXH7gutaPd7xHEPG6mLv57kW+7d/Sqsz6f7AHMV84bmqjsQYPn5kq4s/eJtNzTkE2lYjQWc3N1p1n3X6RtZen0K7pnJUUFnUkuZ/AH44N/p3OpexT/e73QfUQOQ4WxABfqtzkO51c6brosGzntCHmWybwQ5A7gmOQlkjM8YKjJT4aSTbW3p/oEkdqecPJfWeYwIYiD3SsilPNGHqLYYosm2hnzvg7Q8FBfPOKsJdFB9DfQ/qIbuip8wVHIfAGVHNmw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6210.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 12:37:14 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%3]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 12:37:14 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 2/4] HID: magicmouse: avoid setting up battery timer when
 not needed
Thread-Topic: [PATCH v2 2/4] HID: magicmouse: avoid setting up battery timer
 when not needed
Thread-Index: AQHb6bu0+MDa7xrg90+z0DbzfExmmQ==
Date: Mon, 30 Jun 2025 12:37:13 +0000
Message-ID: <20250630123649.80395-3-gargaditya08@live.com>
References: <20250630123649.80395-1-gargaditya08@live.com>
In-Reply-To: <20250630123649.80395-1-gargaditya08@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB6210:EE_
x-ms-office365-filtering-correlation-id: ef150f74-0d50-46d8-66ee-08ddb7d2d784
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799006|15080799009|41001999006|8062599006|7092599006|8060799009|461199028|38102599003|52005399003|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YFBpi8u9pryQ/06EYpSaiDU+6K++ZhHI4lu5ZLWIwaka9weu9SsK5vEwdw?=
 =?iso-8859-1?Q?ltc0Bk59H2D++SsplaDXqn5qeMh2WiRslrnyrWjleudgN6Xi7zjpNI5aY8?=
 =?iso-8859-1?Q?y5Hgo6YNBPPLv8opdw3lOyLORyHULmYJsC5ftNKWaXWC2i/1OoAyQVCn2Q?=
 =?iso-8859-1?Q?k8fXM4x813v8OPurTRxtpCqpbDDfhs6d9brR4Ef9cNsR6Dz5/DabpLUnYX?=
 =?iso-8859-1?Q?3qPZWVK821WmJpqV6wObj7KHpn05tCM8N6u5W3vk2ckMbwskoyGmEYmP9V?=
 =?iso-8859-1?Q?b/p13VFpwYQ2KzHQjpyVcNakq28Q96bQElIvRGbz3MpqNEix9Su3FOr3Qq?=
 =?iso-8859-1?Q?8IvKkS4U8YGGheAZ+Lxn5OKCgXFRG1MoVSdrcEm5fryD64W1Q9KXoUqUPi?=
 =?iso-8859-1?Q?Liw6v6wSEzO6cn7veWYORZiJedoXJQU4wgFhLELKQSsOMJgcAGA7zC9FUr?=
 =?iso-8859-1?Q?fF9jRgdY163xlKxJoB0osdPM9fVkl7wL6VJYBi9ppuejbobB0tvcX26rVR?=
 =?iso-8859-1?Q?4gXUDe3Q20EpM8+vAxCq9Dvlj800p6GuDxW1/lahIMTSAeyBqVh6zkvzBX?=
 =?iso-8859-1?Q?F43j0bqe4DBSHc2TyWc3tqQC1NpBWnHBEjLZ0GSkjUfcrKfQLt99n2hBuR?=
 =?iso-8859-1?Q?a/rcFRY0RKoGJZGkZdJjnVxemOvA9ErmqVPWVYj+ubxjJoTiDLZPuU50Le?=
 =?iso-8859-1?Q?eC2QN9tlXDZwUYiH1gjg9MRqTs51zhNipHJy6KGJnfBKW5KdsSq9Mokihp?=
 =?iso-8859-1?Q?N0lq6qj/80vw4zi/HnTQhyfUemS9dlJ/1qJuAKO+VOSTehvHAaDbgDhQI9?=
 =?iso-8859-1?Q?YShE1WSZ8U0GbwUjFWdf6f4G0vVXCk4e0hBTFkEFxpccWrriI5nCF2dQ68?=
 =?iso-8859-1?Q?euV3Q3DSgX+oqn431PbHPwJT+JwZLI62i/IyvOS6j7Paz0OJ2T9fQdSkiY?=
 =?iso-8859-1?Q?l60wNyc8pupU2F621PZFuRXW/o+NofF9q11BVcfipdCRng1eYj4W3ZDeZQ?=
 =?iso-8859-1?Q?gfP9EZ5dLcmn9DbNP6Bv37bNNa1ZkbAhj/bi9zQ0hkCkwFkqnze9ckJBB+?=
 =?iso-8859-1?Q?zHUAPI4qgCThfOJWtXGCUt+7cZZOVK8tVL/8onbRT3Z5gztZWDGtOnbOpx?=
 =?iso-8859-1?Q?xg1peFGkUOhaP826KApqCmK5WXF92upf562igIRSTBmsvrtLlHctnb8Esa?=
 =?iso-8859-1?Q?nocqBOO4dp8Ltes9PS8df+Gu6UnK/z+G/ThUfzobq9+GmXHMK0tfZGhlWT?=
 =?iso-8859-1?Q?Gn73iIDf8GwQbnXqacSKMhxxZLcsZmKgToJeUvwAc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JbGja3Sl0xyt51unrsIbk4BO0l3J/oJyvoSr9CYII2t9z3+Txe0nBcWXiY?=
 =?iso-8859-1?Q?y5CbMurztZNGLvOn0/xwVG8tSI/DyavswaFwaTiwvqf4gPIOeACPBWeG4L?=
 =?iso-8859-1?Q?dpwIdJIWhTcW9RU6zs8LCoKWQLC1PQhBvzhpHjBTvvg2Jm76aCj6bPuE7Z?=
 =?iso-8859-1?Q?ekhGf7wOECsvdITMdqQGsaydjhDiRZ0hIqGr3fNYOYg1WbpDJTYclf30FV?=
 =?iso-8859-1?Q?qdfj0+xdwaQjh2MYPQ0dTN7rtPq32S72FgmwIcwG5PLWgDtJdtn//a7PQ2?=
 =?iso-8859-1?Q?xpeeEmUvONq3fO4Y9tQVV6ccCkqCt6KdOEuILr/e/FKPgMvPdiMX4ioi7i?=
 =?iso-8859-1?Q?F84OsPA1LiXCW82uw7BkesQ16PGyb2BrqyofN8Y1uuuQsVkacmW0frA+ro?=
 =?iso-8859-1?Q?zL9oQSx6h4AgG6oQDqAkfVzBqlt4rrYgpPEzZKt6MLGYCHhI+louF2KG/a?=
 =?iso-8859-1?Q?PnTr5zSN/dAdzLs9nqcu7cYZ6zi4Wo1bz3OqtDoH986ZWcu4355qIwPTAT?=
 =?iso-8859-1?Q?1YdkNkKiui8aVDK/iwjR04A0Npi+TSSHh2R99U4WqlFP8r53BKKWcasUzg?=
 =?iso-8859-1?Q?tBzKeQHkEA36+Y5b3sDOBcuQOj3HnVhDSfXWOz2GFlTE/qovFysn5lqafZ?=
 =?iso-8859-1?Q?Lyw4SQ6IICNrtcSkJusbSgEsrlxSu+ca5V0gK147MabgvslsjOGvCMtDv6?=
 =?iso-8859-1?Q?B9oj6sowxfMhpxz7u8dyBiqE1eZSTPOUrXq07GMmqk+J3Xue+evb8D6x1g?=
 =?iso-8859-1?Q?2HD+d9jxIXoWRGf4jouz2nlEurIyvXVaeA60yBPOp9RmgjJy0HVMGGR3Pr?=
 =?iso-8859-1?Q?PLY3RkkDZmfE7xtZZ33+UpkgiUI/rX+WH40vwylvIJde5WR7fhJqCElNGH?=
 =?iso-8859-1?Q?KjP+q/NZUOp7PNFVyysH4oFF4f5XEZ6IUqbxAqItmD8vzQxJI0ZEoIKn70?=
 =?iso-8859-1?Q?mr+coCjCxkTObvVKgjawfGW0TlWw+A59uoj9YHx7AF0bIrHUQrHTfxres1?=
 =?iso-8859-1?Q?/IQwiG6FW441g7+meR/prviQNnqDe0lxDk95m+TZSrAdCOKXe73dmreGMY?=
 =?iso-8859-1?Q?6rvA0arW7PfQYAdOFhWbd/UzdHawlDchKpxvYVI5ZefyV10wYu3LII/8L1?=
 =?iso-8859-1?Q?hd2ZhuuJDW5tHxJWwP948w92jI8h+4++fiEfzcGTQOUXf6S6fRewm/FKTg?=
 =?iso-8859-1?Q?bpiIXzmvJrJJSFVBknT6SDYtExYi+n6pugxTpEKGMseAUvicxBMYv52VxQ?=
 =?iso-8859-1?Q?331kY1JeW5J8v1U2kgwreZda1ijne0mwzCnfGAv8E=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef150f74-0d50-46d8-66ee-08ddb7d2d784
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 12:37:13.8488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6210

Currently, the battery timer is set up for all devices using
hid-magicmouse, irrespective of whether they actually need it or not.

The current implementation requires the battery timer for Magic Mouse 2
and Magic Trackpad 2 when connected via USB only. Add checks to ensure
that the battery timer is only set up when they are connected via USB.

Fixes: 0b91b4e4dae6 ("HID: magicmouse: Report battery level over USB")
Cc: stable@vger.kernel.org
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-magicmouse.c | 62 +++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index d4d91e49b..4ca0cbac9 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -791,17 +791,31 @@ static void magicmouse_enable_mt_work(struct work_str=
uct *work)
 		hid_err(msc->hdev, "unable to request touch data (%d)\n", ret);
 }
=20
+static bool is_usb_magicmouse2(__u32 vendor, __u32 product)
+{
+	if (vendor !=3D USB_VENDOR_ID_APPLE)
+		return false;
+	return product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	       product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC;
+}
+
+static bool is_usb_magictrackpad2(__u32 vendor, __u32 product)
+{
+	if (vendor !=3D USB_VENDOR_ID_APPLE)
+		return false;
+	return product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	       product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC;
+}
+
 static int magicmouse_fetch_battery(struct hid_device *hdev)
 {
 #ifdef CONFIG_HID_BATTERY_STRENGTH
 	struct hid_report_enum *report_enum;
 	struct hid_report *report;
=20
-	if (!hdev->battery || hdev->vendor !=3D USB_VENDOR_ID_APPLE ||
-	    (hdev->product !=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
-	     hdev->product !=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC &&
-	     hdev->product !=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
-	     hdev->product !=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
+	if (!hdev->battery ||
+	    (!is_usb_magicmouse2(hdev->vendor, hdev->product) &&
+	     !is_usb_magictrackpad2(hdev->vendor, hdev->product)))
 		return -1;
=20
 	report_enum =3D &hdev->report_enum[hdev->battery_report_type];
@@ -863,17 +877,17 @@ static int magicmouse_probe(struct hid_device *hdev,
 		return ret;
 	}
=20
-	timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
-	mod_timer(&msc->battery_timer,
-		  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
-	magicmouse_fetch_battery(hdev);
-
-	if (id->vendor =3D=3D USB_VENDOR_ID_APPLE &&
-	    (id->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
-	     id->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
-	     ((id->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
-	       id->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
-	      hdev->type !=3D HID_TYPE_USBMOUSE)))
+	if (is_usb_magicmouse2(id->vendor, id->product) ||
+	    is_usb_magictrackpad2(id->vendor, id->product)) {
+		timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
+		mod_timer(&msc->battery_timer,
+			  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
+		magicmouse_fetch_battery(hdev);
+	}
+
+	if (is_usb_magicmouse2(id->vendor, id->product) ||
+	    (is_usb_magictrackpad2(id->vendor, id->product) &&
+	     hdev->type !=3D HID_TYPE_USBMOUSE))
 		return 0;
=20
 	if (!msc->input) {
@@ -936,7 +950,10 @@ static int magicmouse_probe(struct hid_device *hdev,
=20
 	return 0;
 err_stop_hw:
-	timer_delete_sync(&msc->battery_timer);
+	if (is_usb_magicmouse2(id->vendor, id->product) ||
+	    is_usb_magictrackpad2(id->vendor, id->product))
+		timer_delete_sync(&msc->battery_timer);
+
 	hid_hw_stop(hdev);
 	return ret;
 }
@@ -947,7 +964,9 @@ static void magicmouse_remove(struct hid_device *hdev)
=20
 	if (msc) {
 		cancel_delayed_work_sync(&msc->work);
-		timer_delete_sync(&msc->battery_timer);
+		if (is_usb_magicmouse2(hdev->vendor, hdev->product) ||
+		    is_usb_magictrackpad2(hdev->vendor, hdev->product))
+			timer_delete_sync(&msc->battery_timer);
 	}
=20
 	hid_hw_stop(hdev);
@@ -964,11 +983,8 @@ static const __u8 *magicmouse_report_fixup(struct hid_=
device *hdev, __u8 *rdesc,
 	 *   0x05, 0x01,       // Usage Page (Generic Desktop)        0
 	 *   0x09, 0x02,       // Usage (Mouse)                       2
 	 */
-	if (hdev->vendor =3D=3D USB_VENDOR_ID_APPLE &&
-	    (hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
-	     hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
-	     hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
-	     hdev->product =3D=3D USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
+	if ((is_usb_magicmouse2(hdev->vendor, hdev->product) ||
+	     is_usb_magictrackpad2(hdev->vendor, hdev->product)) &&
 	    *rsize =3D=3D 83 && rdesc[46] =3D=3D 0x84 && rdesc[58] =3D=3D 0x85) {
 		hid_info(hdev,
 			 "fixing up magicmouse battery report descriptor\n");
--=20
2.49.0


