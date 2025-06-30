Return-Path: <linux-input+bounces-13229-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A36AEDD15
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 14:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF6753AB874
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428A028B503;
	Mon, 30 Jun 2025 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="MYu6ROeC"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C47628A73E;
	Mon, 30 Jun 2025 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287048; cv=fail; b=gikKC6qZsFKuXCFOE6nEy0cLPd1p5zJbqPdNVbbiYQaFNBcawFU2Dy4F5/LCvLxdOcrgw+HGOCphQ8SSpxhfWf5ulh5vwHfuXDjtRJWXLzpX8FIq1WfqFrZS6sz4Ap1fVZ5cV1n9prEsw4PcogTvhGQHdmNSXKl1n2nxmaIF7Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287048; c=relaxed/simple;
	bh=ijI6W+xl4Hc2lI2fE/Dbel4nuLCiZIuGLPlmLZO/ciA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NgRQFjtvfvoHUurlpF6rP9F3Dcxz9yeILl7KxD80dwURr7muR3/7XCHbxOqI8oDqPoLIbrNtorhDyZ2RdsPx8rzSAq1bZbxgy6FWB9z+7xqtEJfy2HqZfaO43lwCLDyQ5EeDHXdNNGHjgba63G4p2K/ZG8QScKwgmXD32evVr7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=MYu6ROeC; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvIFVRfHm6w9U106IxlihD98MiKF7+0aw1MD7J3oWFCmjegc3wjqcACFICwoT1RqWt1ZYVZb7Qy/YvRBAa0MM5jF98bvbUJWFyElk8ZYYFV1+VE0ZP/fm/4qVhMKqHNgvpXngr89w2ZwguDmqdrxakIHJ8mH/ZX+hllCFM/jcMg61tW7bklp4+A9t58S6bnJnCcrbCsJZ6DyH/T5NHF7RO3lXryjh9RmlIb93jdSmExWcsFZMs5vZQWnBnDs5PNG9rVvrWwPMFcgvL2lrphEpoYLteG/IUSs5RlVB94MfxNTEm7aBhkfl8pLXtCyjM+YZHYP0bNE3orTV6aEFPoaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ydKpT0kZT2eeDewhb8GNTEAcnBHWPize5apas1H2I8=;
 b=zUswhFpLFSA/aVYRN8JLB5N/UdAThq5GtivZzOOVtRgTHy7PKhAi7Pf8t7M2epiF6Qv3BLRUGsGopJBdYYaubir/Q1Zu6bGkhjHCUwJivsFs+YyVlm7AMlvUmtr6CIu4kzQFABe5MttCA8uy5VSC+6RPS/2AqpfRxRQaah3w59futjvUDGBmtZ45z4fREjFbRSrjMln6KRB+uFBBYjxDGI3yvV/Wkg1yqYtQX84bsDPkoMHUzQQQ/mDp8apLZo1kfq6r5W6Mbh/MHRLXfeavP70Dt6xEZ5Hd50grClwYRCkATjN353itg49bc/jLpERKrAfghBeT9FlcyefU9i/ZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ydKpT0kZT2eeDewhb8GNTEAcnBHWPize5apas1H2I8=;
 b=MYu6ROeCJT6yHee+7BI0U5xaZC4nZYpEJ/1nf0Pl/HrU71mxkgAMr4i2R5XBOAS98ndRxzJocTfkijmkkeon/H0IcEkNNK++dbRizHGcnAN3nY9ckEMbFZJnpApsGSzOrQ4/q8shd2ED+t1xkWCXEQ/MtLddv9kL12gh1I3PCPQB9CMyzfxnk8lL1NQVRYyPEjnvolH42Me3uzyPm0ZrRAOl0uDa6oF/Rvn5/bjDQKZDRCDCfJwuk9KP6wCNutGGdPSOHq99p7FJ073xNFdBM/xNwu97Jz9lG2h3F9tyToYUXCqNJCbM1llfbKPGJhqO2Yenbo7KDpFUC1tJJG+oqA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6210.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 12:37:15 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%3]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 12:37:15 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 4/4] HID: magicmouse: use secs_to_jiffies() for battery
 timeout
Thread-Topic: [PATCH v2 4/4] HID: magicmouse: use secs_to_jiffies() for
 battery timeout
Thread-Index: AQHb6bu1ukwnBxp1nkGwMXr+sXicfw==
Date: Mon, 30 Jun 2025 12:37:14 +0000
Message-ID: <20250630123649.80395-5-gargaditya08@live.com>
References: <20250630123649.80395-1-gargaditya08@live.com>
In-Reply-To: <20250630123649.80395-1-gargaditya08@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB6210:EE_
x-ms-office365-filtering-correlation-id: 9f079017-4241-4bba-982c-08ddb7d2d84a
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799006|15080799009|8062599006|7092599006|8060799009|461199028|38102599003|52005399003|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Tv3QI9hlu1YBS9Cuc8CPlDxPlVY/aoeENm7wiJzd7kldAQJjs46H6olsMH?=
 =?iso-8859-1?Q?fNTfWbvpVjeUHgTcvpfRxRps56uDDix+ubmGSVoV+8vFN0vTXTOvPvXzeR?=
 =?iso-8859-1?Q?kiuDieyrODmRpj1cZLQJVU3JwsCD/tpluWRot9KFgXmGRlXr/OLFA3mdwM?=
 =?iso-8859-1?Q?TpqRPlWrwXVhdMxu1LhFBWG30NiXgysbiFF4dKqcxjPkiFG2Xy9C4Zgkw2?=
 =?iso-8859-1?Q?QEUUp6w0PoPpqFCfhdX8GI8Ce+O0+E65hyAy3QY55Gj0rM8RWvSzAygCLg?=
 =?iso-8859-1?Q?Syz1fyjeWtfK5Xqy2XKpRDnAVhf5LX4yeHBLxypaUlgCoAmn02siZPHi+o?=
 =?iso-8859-1?Q?wKiijItqay5NwVS4voLfyUolw5giNQyqXkl68151XYzP/H3FS8w1MRG7jo?=
 =?iso-8859-1?Q?CACtRL5mRv6QVIa0oXhPGWE5FMFRJYsMxOtqEMoJEWr5gh6XZEDo47t8Xj?=
 =?iso-8859-1?Q?y3Eb6ApgaHLTgava2ji2sQ/zRmRDE0VKOWyzPDIVIl66uzu0OCBa221jZL?=
 =?iso-8859-1?Q?iZHzjOLPe4XYjLF+oXxs+ytC1e0zUhwfBHXDG+3IQSfynPxi6KJEdS++YD?=
 =?iso-8859-1?Q?k+t6R31dzZYQ9JQdOVMIqPkwQVs8YnYYdifp8IfoTadd44joJNEdm2kam8?=
 =?iso-8859-1?Q?CUGtVl3WvcH3TytvQa62YIMbbdDEADblMxnQCBjitWDkt9UAATTzP0i91t?=
 =?iso-8859-1?Q?5kvotG8UH1FF7t6pZP+eqrVFmJ2BshuJZO7mygDP5UQgfHQl47ICQFCRhc?=
 =?iso-8859-1?Q?5jo2OucwE7QLwn4u7f02smb/u03GAR2KN5hrfVFClyRE/DiQr0P9e8mq0b?=
 =?iso-8859-1?Q?KLb18ZP9IKnHVPVG1FjObv0n4G73z5XCNri3dwtksRwgpB5H2aiapIS9eX?=
 =?iso-8859-1?Q?3P8cA0E89gxn31CSx0qfdrcbAJ5QdWeN0BpP7ShixfSQQKsaMRYCt/Pulv?=
 =?iso-8859-1?Q?ZOeWztuRSyB8Us9T22jr5784DyOuwEWQGwaAxtDf/ESPe5jdOZVsfo/nrU?=
 =?iso-8859-1?Q?4+m701R3q1wwsLpCdwHX6N8W0UgendLM7zK8/tx7sIU7LwRvvZ6G9yr8Ko?=
 =?iso-8859-1?Q?/5DxRP1KyG/KF9lQ/ec4uOaMOEJykY8EhPKtqiapgs9Y7+EIQ3VhjCxFv+?=
 =?iso-8859-1?Q?2xB/lNN+ae2IOYTGxDT2/CQwLa8/zh9Ed9j5+l/TYNs6L4YdPpeoYFR6hC?=
 =?iso-8859-1?Q?TwQ///RPUcPhrquqBLAWxvKF9Z2GHnWtE4zE/J8FfZKfvHy1b2dGqr4uvo?=
 =?iso-8859-1?Q?ImXU/nSGiN7c0RgkjFfw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XtORvR7E+L/FrAHUBUxzMZgw/C9RxjD6tgHmdl/slSSTmsY0hNBajXf17N?=
 =?iso-8859-1?Q?UVrpmWt4RyCiom10LBrhXhmhiFZaC/U9diOv10lDlN0C/fgXpuQCDenaWy?=
 =?iso-8859-1?Q?wgJnmWx/9owlos8OTnr+0tfKO9/qraAzPyLCdnmRFa8MZoVqJrW5qi2x+e?=
 =?iso-8859-1?Q?V2dy3RCitQBkDILORxBdjkIQ+Ms7kiCM8D8KvQbXcOiXhKEhAigxHG1RFi?=
 =?iso-8859-1?Q?KrzOOiSuFGhRAmSlQSG/R08G0cx90EchzC4f+UiiLkojDb6fN++2WPa6sh?=
 =?iso-8859-1?Q?8Girs/QdbCSNo8dubGdq4SxzC5I7aF7DVcQRRyvKzrLI35hTEF1TWf6ifG?=
 =?iso-8859-1?Q?gCPcYQv6pYUpcq+wn9OIyPdDZbamv1MB1aNEGBfpDLpwbotEEnH+X/yXFU?=
 =?iso-8859-1?Q?ihr0HNMeW+7uH7w5tVx23hTBkLfJRU89sMOPOIH5jCOK7k7lRAjhmeAv6v?=
 =?iso-8859-1?Q?tGPdduuYkFfiHwDsv0GBb23ynIfEaAWFI+QpQE0akwQ4dtY5v+5/P9hctr?=
 =?iso-8859-1?Q?eYKmBo0p0MGAam9VDKd5uaDgAbvNAyIKmFekZp757jKDAUgrVKlDN9dCmI?=
 =?iso-8859-1?Q?fXJflbHAVjgj3KFOFCXXhR6jkbhjPH1Fy4uNJwK50h7P5ilI2TlE63NsJr?=
 =?iso-8859-1?Q?l6HqKQ3/ptl7tO9CQVeqrjkQsjZsxbONhYI56bj3WOARKqD6a8Vqsu4Ds7?=
 =?iso-8859-1?Q?Tq3BZXegutdRBmGjtGQXr77tpyvP1YCBF1uiNGS86UQ7Nr0iYS8KjyuQBq?=
 =?iso-8859-1?Q?m1IDGZ3+TVy9k9Ukip5A/haxeZ90RQS5zqFDITiG0Qs43pvL/B2CwrWOR/?=
 =?iso-8859-1?Q?BcX1FzqjMZdu2SQj5dNOY54pgUPFcDjA0OLBI3hfBZLcm3F6Wj3oGJlnd4?=
 =?iso-8859-1?Q?F0eCf385kVQEfJ6CL/coYm4bBnM8hQ1RczffmGNO3soz2JPUQT6x96hUDh?=
 =?iso-8859-1?Q?9BK8IhlCIv2JxFwKXEOrN5AhpBnAizAfqRb+3q3kH8di73TmiL95IKyKd8?=
 =?iso-8859-1?Q?GT2nIzA18GLccLWOTTG6FuOxAXOdhJ4ALY3j0wZhplBVSwCUArGMMnz6kK?=
 =?iso-8859-1?Q?DIk0wjeKmx8MaKaaaiip7+Pny5VtSz2MhDqsYWCNyoWtZI0C92mup6tkud?=
 =?iso-8859-1?Q?EN3o5wpX3qyLakA0Nb7FWWCzK1h/YG2SygYgdJ1KgqWyduzRxBpGGLAZtz?=
 =?iso-8859-1?Q?vtJEh8WSXURPkZ6vu2K77CjcX6n9Q5EGOduN8Z2P7iXMDEMIowgioOip8N?=
 =?iso-8859-1?Q?ALLihz95ykG//MoDtRtqrSVgGl5woLvWKQ79yU0Co=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f079017-4241-4bba-982c-08ddb7d2d84a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 12:37:14.9219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6210

The kernel now has a secs_to_jiffies() function which expands to a simpler
code than msecs_to_jiffies(). Use the same for battery timeout which was
using 60000 milliseconds (60 seconds).

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-magicmouse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 4ca0cbac9..e933bebf6 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -60,7 +60,7 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphere=
d multi-touch state fie
 #define MOUSE_REPORT_ID    0x29
 #define MOUSE2_REPORT_ID   0x12
 #define DOUBLE_REPORT_ID   0xf7
-#define USB_BATTERY_TIMEOUT_MS 60000
+#define USB_BATTERY_TIMEOUT_SEC 60
=20
 /* These definitions are not precise, but they're close enough.  (Bits
  * 0x03 seem to indicate the aspect ratio of the touch, bits 0x70 seem
@@ -841,7 +841,7 @@ static void magicmouse_battery_timer_tick(struct timer_=
list *t)
=20
 	if (magicmouse_fetch_battery(hdev) =3D=3D 0) {
 		mod_timer(&msc->battery_timer,
-			  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
+			  jiffies + secs_to_jiffies(USB_BATTERY_TIMEOUT_SEC));
 	}
 }
=20
@@ -881,7 +881,7 @@ static int magicmouse_probe(struct hid_device *hdev,
 	    is_usb_magictrackpad2(id->vendor, id->product)) {
 		timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
 		mod_timer(&msc->battery_timer,
-			  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
+			  jiffies + secs_to_jiffies(USB_BATTERY_TIMEOUT_SEC));
 		magicmouse_fetch_battery(hdev);
 	}
=20
--=20
2.49.0


