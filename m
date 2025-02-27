Return-Path: <linux-input+bounces-10414-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BB6A486B1
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 18:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE9E0163F74
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 17:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2958F1D63CF;
	Thu, 27 Feb 2025 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="usC99+c3"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352261D5CE3;
	Thu, 27 Feb 2025 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677643; cv=fail; b=m0ezDdGd9+5sNhARNrpll08mf34Q/ahJfZ92wGaYrlq6nZJrK2au855mWzdf586FFe1RObD/tYtZPdGi8h0PWxTjRw6S+x29nRrITDGdyI9jTLFEccjkcvtcx4Vib/MEpYQcebJOTSmCgUF4SMchNHtvUOv6ZvF7PQaZRMJS5UQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677643; c=relaxed/simple;
	bh=0I3uw8tOEl56mBmh9KGnsJ8vLZOZj3vNBqBpPaPh4tA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cAuGXOZogv/VQsFrdeGMj4K8fMPtTzqv6IcyWbiIim3tUcbl7k8Rk9yvtwmb8CpLieVe11Ssv4PSzwW8BkUdXfnXF+wt+p6M10l1Dmm9iYd985dHnvLAoOvewYyDABIhy3a1a9CoGrI/vQN+jovvKSlj0CdDZUvoXXyimdswCwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=usC99+c3; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOQuHyzaNzDdl7uOhTnFHQNFlkT1ZuXV+efAWw7rrPxYPCR6q3b4+yN/IPbvIE1R78P+k4s8HnoEr/cwKvENHEsrJ25GFu92n4mU5jIEqTbFzSaa7qEMLiSeIAcvv4HDjkTxGVmCzoa2ninZGumtPCEyfc07oPZjFBTsHF4Q/G/v3eA1I1Xhv1HPYq32lxlnXqfqep9z4+Uj3888FAoVHxDcVBAuP929p4XkgF9bRWdVSnM18qemUvbBZJxk8m4ioT8TfFdBQ9LMl8SmBniKBiAM3C1I4m/YP2XD1tibAuBWZncyIUvp3ZYKbXqHQK/koQWUscQf/4fPKhqQsqOz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwoq7VPxPKTyeCZY8T3zEYkw2WQXtqJ6jwzuubyMmOs=;
 b=C0NO6TziZw3mKSvnhNJkE15CFK6IlW9HjQb0AA3IglsyTK+ad/wi+zTr58UHuslSsO8q83WESvcNafmbfUiHPMxabgEvXgWjbU9UJoKjNwuROuObsFJMdeQVHEAGdD5dorvuXF/ndaGDXTq69rI6AHOsGF6/oaatOXav6saHq3fxAVvhVHFwlGa26nvtDl5PIUq+pCU2+H0Vs2WTmdveUgcVScJSpENmSx+0l0U3VIB5CoSfDQ5SRQtuL6G1pJTAIgKPv3uMsz/1KpAfeRagGUISFvoV984mj9TMFDrv4NDsi7QiiqOHk9YQk7Y6lxR79qA1HLe9QBxZgWv63pLMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwoq7VPxPKTyeCZY8T3zEYkw2WQXtqJ6jwzuubyMmOs=;
 b=usC99+c3zbs2kg+R9qRe9EHt9U5LQl17AdV6DKneLIZ0R6wbBnFvhl1kWJQpVUzJDxmzMfPHnJXzBkfAUMDmCYPGGTX5WAyR0sq7pPjbLtAtzT6GqRGecWl20r6TL3Iqk3mXd6vQMf0AgDu6ZTXI97hhXrK62kgYHLmNftks2KLU2eUptOF2IW1C9lf8zGh9XbhtQGWuPDJ0mFP9FmkW7WqpnsZfAtVTZMPN7N4PVM7UReOSIEEXYfqixTuSfx61xDPPEqGiiM76LgRvqzFw14HyIGISv4hMm637gMrh7YLDGsRQBjp+eDo++fB38mYBc7SS+m1lQwuilMVF67Y8+A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7281.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:34::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 17:33:56 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 17:33:56 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH 1/5] HID: multitouch: Get the contact ID from
 HID_DG_TRANSDUCER_INDEX fields in case of Apple Touch Bar
Thread-Topic: [PATCH 1/5] HID: multitouch: Get the contact ID from
 HID_DG_TRANSDUCER_INDEX fields in case of Apple Touch Bar
Thread-Index: AQHbiT3HSnOJH/SKwEixDd3tCNNt4Q==
Date: Thu, 27 Feb 2025 17:33:56 +0000
Message-ID: <C1E82928-1646-438E-AE94-7E91BAE0D689@live.com>
References: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
In-Reply-To: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB7281:EE_
x-ms-office365-filtering-correlation-id: f1fa2113-779e-44ae-45bc-08dd5754e9c1
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|461199028|7092599003|8062599003|19110799003|8060799006|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?p+S7wqR6GtyEtfQ9BRadj4iB+VrBdfueC1JwAZS8r6fOfAQRyWdbWPIk1CyM?=
 =?us-ascii?Q?2+po8+/dPmAzG61SyDswpuykjrhLa5OiPssTQ7p3UZYsiKgGT31Mss0vmw3f?=
 =?us-ascii?Q?YKmBO7qEnF2ymbx65+QABPsHoyxKbesMrP6JTnk0GRSePtqjHxEGpI+asu1c?=
 =?us-ascii?Q?22eeGahoBzLtopI483u0eNJ6983WsSwUDy8+vM4g8rJ0iT4ah99YVBd+vr5r?=
 =?us-ascii?Q?7m2jJuUTsTm4ZllTIC+K6xgXbwinOfmvy0ivM2mvseV7biirtce7W6ncD/p2?=
 =?us-ascii?Q?JfGftz2G3tOQXwUfLN3sejQSkrtcU6Qso/pxb144AVs9PATczxuL3RJlCV+f?=
 =?us-ascii?Q?549s96MvgzZmL9peMTUGFFo/E7v/avrOoWdrvQ55nmacNJ6afoqmCwCz78Wd?=
 =?us-ascii?Q?nKZ2sPJGiZe+liJuXii7P/6uwx7XWHgSu18DPhRQRWvzUPcG6DQ8UOfex1R7?=
 =?us-ascii?Q?S0Ffu3DwmcGgLf8CS2o+B1lYkYfw55zXTiS+5UTlPEfHs5H8hYqt6SPeucWo?=
 =?us-ascii?Q?aU0DfySRezqvCj/sdR7LTakpn/JhwdKJUhTUfDw5xueBIVYNC1INQKKVxLVN?=
 =?us-ascii?Q?OJhlACwuOgMgdwtO0YuGMkgd644JpkS233Olw30F25NkrACfqyd3qRqdsXzg?=
 =?us-ascii?Q?PVFeGyDi10J6CqCjuGtNuKPB5E2UqRx9Iip7WyvSGUz7mkTQnBRSEqOHeZ8F?=
 =?us-ascii?Q?Md6DDXrVslANLLoe+xi+SUKLQt86ZUP0sQEikKgJ5fty7z+i1ZlDHJD2J30f?=
 =?us-ascii?Q?r+8J//Wbc8o3Ffuprf3HHOIiiPYU+JAYK1IPNFLk+Uph/f3SrBTKAej6v43/?=
 =?us-ascii?Q?C1c7O+jaoCQk2Rj1Snam3UAhpZVt7I9xNhxS0xdaYmWwUGTTX7x4QQO7cn0E?=
 =?us-ascii?Q?vZDGMop0+rR0n9ncDzLulZzqCurYD2D0XLLQXUps71/ZYEB2yG/6qAF7A6kZ?=
 =?us-ascii?Q?V7xqmtvLQsrwyzpdBKtWg1MSY55kmQB+v6mcREdr7vQLHE68eZO/rongYIbI?=
 =?us-ascii?Q?O5kkuyFcZNZYDFc9VydVyEdr4z+98oIMv15pPsbLPQ4nAYr5IzIpVo2ntPaV?=
 =?us-ascii?Q?k6YO+8IIqYFJat4SQvk4Xg80l8MOXT8Yh56PPT9c1P/eZaFK/cM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/UDWul5ifcyfhvTzeY6yry+kIaBzZ7t/WOK/gkUhy6BLDqLN9WP6xgCCl1kZ?=
 =?us-ascii?Q?ntrrgrrodnQN13kMPBi4/784CAbFBFw0mVfNoLB1h+zojuSgF0jmPPBaSx4f?=
 =?us-ascii?Q?SU9Fg8lKNno0YhEkB53Kre8H8YOwWnWGU/dR5YZt2TDT7ekMeCmhv2jYqd1a?=
 =?us-ascii?Q?TakGt8AqEyogwOr5zjPgTJ/DHTCq9gRcDTBBMmzdrUHVWprufHGqh3bwQvV1?=
 =?us-ascii?Q?c2y0+9OdQHemLOheXyVVXKpmx2JjqhnkFXYyaF5q1E/ESogHzi7DSld2KfKx?=
 =?us-ascii?Q?li+YTGQdNALFU9om97VdJr0UnORYT78s6uy3VspIrbEGYOHAQMbgyfoj/Bjh?=
 =?us-ascii?Q?B0dgtd0X5JGYy4Pm3mH3PIa2dOqTDfRsEsotVDC2LY+RrLIdCDZeSjKAdAJ9?=
 =?us-ascii?Q?sai3T+LMjCeht5r+UkQXe4olt1ZEKaC41FMDJz+e+e/mKGODLpkGhVY56S7t?=
 =?us-ascii?Q?ARcnvVUx9iCOYBgsxqZ1Iil+SaIyt+I8GCnxcXovGVRTWaDMPC+O0cJXlfaR?=
 =?us-ascii?Q?hhSaYOe46TSXdeDwEbZit9ScmZsNLpfuOwBV3bHUlNEQVi7vOsnI2UdyJVdI?=
 =?us-ascii?Q?vG2tHw9ST7rDcqAESYVfW6UohyrkaLJVI46jhfnMH2Yo3CI8ODJbbBws9wyR?=
 =?us-ascii?Q?iwOiikJgUZcgP2T7mWY7/xJxl5bg+FdXTA1B95pZZIQOSdJT4Q2pN2G0Qil3?=
 =?us-ascii?Q?4T11Kk7pbRGP/NxfdWDxakZkxfHBsCM0H8pH7XPEhj4zBoQMn7MPZGhq2MFF?=
 =?us-ascii?Q?TlR4gNpc/3RnbzNB7NRSBvIKEkm/HsHKuoQenOBhgtkl1ROMcpBMk4qwqz4c?=
 =?us-ascii?Q?difXTEJ4p8tE2u4Zb/lVU8uW6PmXGKetnpxtjXADc+9eoN81jlnEHAsUQoMk?=
 =?us-ascii?Q?MmGg2qdY62dldNoZ3oNdw+0snnRNfeQ/qUCdVAdroVlA+znr33AzKBxE9qCn?=
 =?us-ascii?Q?OmxC99J6H7+RQUKdw4amC8jSq04lYxZaIiHo5roFiqHhu74R9xrlGWGg7kcM?=
 =?us-ascii?Q?xNqOy29fAOPMfX50DsaIg5r2NkJfCoUNy37KIgw5Bb/LGSqeKQtMIYy2KgBt?=
 =?us-ascii?Q?RWwF9xdBMyMT9WoA7DnWjUMIxXkPVmQLQykLqd4YoGCHAbTLK6CRiVLCN6ph?=
 =?us-ascii?Q?lmcuxgXE6bgprUAlr7u1BCBKOFTen0gpduaDtify8Yf3HWFqDREL4hkbMZhu?=
 =?us-ascii?Q?56dMv8/EW5+C8d9GBzBelZbLI8OLFqvwL4rSypfkY7WtdVLLtlK74dfe4bCn?=
 =?us-ascii?Q?8/d/Z5lnkAo3y0ZMZla214F05p/ihHrE3gXWEJemoe3VqJTfAQ8Th0eivN1g?=
 =?us-ascii?Q?Gf7JAsW8iPkb7M+MKXZmnlv8?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5D1929FFD390234DBC42A261F3E4D7F0@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fa2113-779e-44ae-45bc-08dd5754e9c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 17:33:56.7059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7281

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the contact ID is contained in fields with the
HID_DG_TRANSDUCER_INDEX usage rather than HID_DG_CONTACTID, thus differing
from the HID spec. Add a quirk for the same.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e50887a6d..6e7f34a47 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -73,6 +73,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
+#define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
=20
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -625,6 +626,7 @@ static struct mt_application *mt_find_application(struc=
t mt_device *td,
 static struct mt_report_data *mt_allocate_report_data(struct mt_device *td=
,
 						      struct hid_report *report)
 {
+	struct mt_class *cls =3D &td->mtclass;
 	struct mt_report_data *rdata;
 	struct hid_field *field;
 	int r, n;
@@ -649,7 +651,11 @@ static struct mt_report_data *mt_allocate_report_data(=
struct mt_device *td,
=20
 		if (field->logical =3D=3D HID_DG_FINGER || td->hdev->group !=3D HID_GROU=
P_MULTITOUCH_WIN_8) {
 			for (n =3D 0; n < field->report_count; n++) {
-				if (field->usage[n].hid =3D=3D HID_DG_CONTACTID) {
+				unsigned int hid =3D field->usage[n].hid;
+
+				if (hid =3D=3D HID_DG_CONTACTID ||
+				   (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR &&
+				   hid =3D=3D HID_DG_TRANSDUCER_INDEX)) {
 					rdata->is_mt_collection =3D true;
 					break;
 				}
@@ -827,6 +833,14 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
 						     EV_KEY, BTN_TOUCH);
 			MT_STORE_FIELD(tip_state);
 			return 1;
+		case HID_DG_TRANSDUCER_INDEX:
+			/*
+			 * Contact ID in case of Apple Touch Bars is contained
+			 * in fields with HID_DG_TRANSDUCER_INDEX usage.
+			 */
+			if (!(cls->quirks & MT_QUIRK_APPLE_TOUCHBAR))
+				return 0;
+			fallthrough;
 		case HID_DG_CONTACTID:
 			MT_STORE_FIELD(contactid);
 			app->touches_by_report++;
--=20
2.43.0


