Return-Path: <linux-input+bounces-10676-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6044DA58F1C
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 10:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D3C416A96A
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 09:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BAA2236EE;
	Mon, 10 Mar 2025 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="UzPHMvHM"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010012.outbound.protection.outlook.com [52.103.68.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18526224220;
	Mon, 10 Mar 2025 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597930; cv=fail; b=R6S5xnN1AUGicOTM2VAeXELFuRhEAwKZlw2RGZFrRgH8/ud3je8oaKRYqVPT/iwUCThe9XQsD0qeE1Abf7hYJivvKmjc4CL0BvNnAlP6xHIyFfv1fnCFSLmQhx7si9/B1RN+pPxV+tRy9Snf4ROBMofZMSv89vczqc0jZ04pXWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597930; c=relaxed/simple;
	bh=0I3uw8tOEl56mBmh9KGnsJ8vLZOZj3vNBqBpPaPh4tA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cN3GRMilV2F7po2ub46q4JExUIvd1h2N9MbhrWxFayQI4feR4KBk8hiH2k9xyH7vv897Anmnv4Kshkx3rGaFIT2DW+15ksstOpn2IZ0xhY3SDtUi3NTrECQNP80Ux91r1MMTH6mYnNJLaVdsQFb4Sd94lCoePCaBKLRcSDRLrUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=UzPHMvHM; arc=fail smtp.client-ip=52.103.68.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeapgYUlvhlY+5sCUv5SOyrEiHQimXCpWzCSm3Gz7i9OG/tPLyQGVF0TkZjzLcg/p6k4S7QrjOqEdkTLClhnvcW5kL3R4VdLJ/6H8uafIagH5uDCe6DehC1zyoTwbB2rGywPevilpyA/ByDApDrm+I+YO788tUh5LJh/fSD6pxkw5R8nVjLwNtTeKV+SKZIFmL2Yjc7vHZwUojf5KGh60s+rBxYBUkeLWoGiaZuJhOz3IV4riGflNqcn1+Eg5+AJKi3Aih0xRkyUynk/MLC0Xf63wT6j6KNp7PZgwY2qZqgC5XFWiN3YfVO/5n1piK1AZrW3O9kh4Z3WhlbOfieEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwoq7VPxPKTyeCZY8T3zEYkw2WQXtqJ6jwzuubyMmOs=;
 b=uIn1TdWbFNqlNaeeHbZvIDczUa1emI2nwmd3odFH+gtqDmUN/1gwnq27VnRDtRnrLWK4tfZdLWAZMnae+9SWIGhA4pJm3MlFXl0NMxrL7XpNP5ycvOTUjhkBDmoik2h9ycVoLxC40pNVb88kAHOHQOOYViPmWR3mDYx9y7tVjA70qrPlqom8+O36wIZHxaHQCaMXvQLqthxRtZ0fUJXWp1qKtIClt5r/M8rhicq987xLT0Gw7aioBUhLM3KbbgMl+FNJRoc6CApCMUtf4JCNjqMx64/c0rR1eunT0IXDsL93Kz0EJW+JaQz9GYg2PSThClEtoVZs2pBOcNcwAPI29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwoq7VPxPKTyeCZY8T3zEYkw2WQXtqJ6jwzuubyMmOs=;
 b=UzPHMvHMxJ5wZoozUHGYpCuLyzWx15dVKF/R8X8ySUTRCAorUnXQuSiNMi0wS3H0e146VCOK/QqWQoARlwxm7p8JBLUqehYgUA7nEdgIwd6iCJysmG0saQzGyUOAaa2cy+eYsiOrZ6/vzvneWzdnuad5VqnREqSFkPvNA+je6q8guATrVlvH3g/jQm0BY9lLIYMQTHt8S/y6/aH7cEnk3G2Udepc87q63YyihwpcvyxUx4Snf/oPyWLpP4Tox+ClX8wBQn8ob7eVkHbNJJMXD20FE2L+Z9YQagG9jp/Q0nzrENaC9sCBzyuwWY0JpFXHD1tiIujTZS7C64bNz8r3WA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6518.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 09:12:02 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 09:12:02 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND 1/5] HID: multitouch: Get the contact ID from
 HID_DG_TRANSDUCER_INDEX fields in case of Apple Touch Bar
Thread-Topic: [PATCH RESEND 1/5] HID: multitouch: Get the contact ID from
 HID_DG_TRANSDUCER_INDEX fields in case of Apple Touch Bar
Thread-Index: AQHbkZx8ip74tff+akSsCQ/5elS5lA==
Date: Mon, 10 Mar 2025 09:12:02 +0000
Message-ID: <46C388A3-0CA4-4B6F-BF0F-42B200E8D813@live.com>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
In-Reply-To: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB6518:EE_
x-ms-office365-filtering-correlation-id: 8fd0046c-acbf-44a2-2bf4-08dd5fb39f00
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8060799006|7092599003|19110799003|461199028|8062599003|102099032|440099028|3412199025|41001999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pieWKKQHqaEKojFAYY0OQ3BPWnwfuoo532sKL/42Ha25+1PMGVa8Odyw/I9H?=
 =?us-ascii?Q?wYkegF5XDzUDJ0/PN+K2SqecdwwPOpqIEKjLy0DUVDqNpXa965xtMfst44tA?=
 =?us-ascii?Q?llNo0lKQZJ3quc5A7cuIovebhJEUY7OBe0fO0Ds6XL2j+IH8aJyrfAULYVQ7?=
 =?us-ascii?Q?8ybVuLrtqymKOIL9KMnjSLn1/AvzcSmUlZNrkIWTeuLe1HZa10fJZXZJXdV6?=
 =?us-ascii?Q?znLYM0TcMknkgVFMFp2lmbqp3vtxKePzCUJiJrcIQ1X7ZOfBI+ZkzwVhRHRC?=
 =?us-ascii?Q?bmrPQjt4m4d5Hm6qXeOtRsojj0VDv1RZoxyFotEYV/exCnig/ETTveyUn6u6?=
 =?us-ascii?Q?MCezRsJ3XkJR+xZeP/1e9F4SIZ/acYHZC0l6+ES+u6+ELcv+7xFscNvbKwXt?=
 =?us-ascii?Q?P4EiEQmr/wKzj+X3g/STPVfWKbuycD2ObqZEgEcKkKfO7J/PgEDFO3/MrRGf?=
 =?us-ascii?Q?qOV+dGmIlwK3HIyY76TtYOg7Y1w68qyamkLkMZzbMoG7Acw19Q17aGdG/NmE?=
 =?us-ascii?Q?go0oFYgWpfcPQVANsj4aOtxd2J3iCjc152ZpbPZQmJgEG8V/SJGSCC1S651C?=
 =?us-ascii?Q?Hvl4g2zTZcKHXQfoGFFS3SIik63JRBodx/KlZfuzyHwwSljTLL7jHuKdJbly?=
 =?us-ascii?Q?gghNCvv/c7KUPKKqbfKfJDLX2xCpMDuwNDIBe86Kr2GEi3cz4dc9lDJFaHYv?=
 =?us-ascii?Q?lJ4THRfIW4jNN3r7JKz7IaRUACyZIWJsxuoF/SVyqj+ht+ZOh/xx6CAJhF2B?=
 =?us-ascii?Q?Qpi4Z7HzmSLpupKdqQbwW6wFaoGCNdNLjslhV6VUA1QUv/9ri1yJG9F89Eno?=
 =?us-ascii?Q?vf69th6xSKRu6dGNCShn4syA44hXZvU2z+1KTKSnv+0lH7RsC/t/b4YTxF59?=
 =?us-ascii?Q?h/I+0pYQ5XYmfDdaN+vfrs9/pog0hYSBOHUEIg9CzVcXFd5UHqWIgBWx+zkV?=
 =?us-ascii?Q?hGMr0SEgoVcc+Xu1zBTKp+pB8k05QwOwyATsrakmlUkHOxF6JWL7871TPvU1?=
 =?us-ascii?Q?j4P8GnBGLmCmnHApxsMu0kscDVWiFFArzGuHlJApigl4v9DIxg742aOB40ca?=
 =?us-ascii?Q?el+NEn5OsxG1hSssFRUUWIocNUhnwMZF3bcNwwbMTzLDtoK6vyk=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TXdarqefviehR+lfmvjsJ1x+45LyiWcbOKElzdHqqsJsKY2kvh1le3Wq2BJ7?=
 =?us-ascii?Q?cFAcC4qQoEqgcodgcxAoXFFEWW+YexbOxsnjCMGhR4C0Bp2HC+wec1dHgAMr?=
 =?us-ascii?Q?BWv7i7V8J0vuhHQVLBZsAznUbiO4XpwyB3+63l+uhYBeWkx3LBkLRuTmcjKa?=
 =?us-ascii?Q?2AlEGo3XtFaxPXuX8rl+BsS/57Ve51xSIIBlg3hBzGPoYewRLjHapPiPiHKP?=
 =?us-ascii?Q?2UBPkBwR2+QX9esqsiDbR3n3O+ep/UfPhLQPo2lHrAY2Iyqye0qbrR1ueT5Z?=
 =?us-ascii?Q?0lApUu0mqO95tcaUfj+wkdqGsNUr5r0//Y3pKwGND6hs5oJCQzE0HDvLaQBa?=
 =?us-ascii?Q?3+NhL5XXLDTtAXM+u04Nwv8vLOCVMwCfuZp1GaAQtguBg4Ioj4Z8s3WfYh7t?=
 =?us-ascii?Q?0ZJpzshLP9F3BH1jhmrkkp6FjMJE9knp5zxsXsWQ02GhBZ1Ot4gFujh321Nt?=
 =?us-ascii?Q?3/Nc2qM+E4rPfDBexw83DS4jQA8PHJrTn2hyUAwkGcKuSJeUNGJRsqDjLExd?=
 =?us-ascii?Q?LnfQ8hJAjAoFTmsYObdnUbV8M3pEwSgFzCGwKHy+aUCxWMqw7JFfF5rV5UvJ?=
 =?us-ascii?Q?A+UYpcuXQV4BeNhSNZcajP33Bejdqgcb2GLjWP8wRhfh3qGsuW1LBYBdSFiA?=
 =?us-ascii?Q?UEFqgA7BU6gro9hOLeamwGKBVl3zPPaqQwob5UGurNl9hmnh24l8Sh1sKt3M?=
 =?us-ascii?Q?cwB0s5coO3kz+U+m/x5XxRuufseN8koffFPiXCmACCIesHCYA2084F5EnGbf?=
 =?us-ascii?Q?t1F0ebRPR9aGOG+LjI+zfBJ04BkGLXHwjlgeLUt/UA/dPrLnxqVJC5cj8Gvj?=
 =?us-ascii?Q?tEz/phXxZJe6kWa0p0SeflgyFTBWYhze8KN9XGpZHj3nCszrKz7xwBkWXVi+?=
 =?us-ascii?Q?edJ4ly5lcXCR/Mq+8sMlbsZucBXthzslcmWfRYPyW9BaWc6Tc8oBVZh5ztp3?=
 =?us-ascii?Q?mRylhXdHRCvT5F1E9bZGUDhqJxjxrA7clsFBgmhoOkH45xi/+Ia4Os+rkJ9I?=
 =?us-ascii?Q?eOMPs7GEqplelk7hIG9OC+J4aras2azzw0My1oVjWBzjD9cUIgeV3y1LN1aY?=
 =?us-ascii?Q?NxraZtaMNpyLOtQvhjhFnLmZLddb0S19y/Xi67VFbNWGLZP+5M6cXB3awX/J?=
 =?us-ascii?Q?L32fIEd9dfzYR2ovQZYNqt8X1Roe5Vuk4x9Ivjc6uAUKgrsEGP8iruNWzOxf?=
 =?us-ascii?Q?1xQ4adxoLQwYIhVsalF0j+TIOStslU9YkZyhmatTyLZy8/DKxIAmd+DjYHaN?=
 =?us-ascii?Q?SvFQ6txogvll1G4oCSTC?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <312F9B6A206F964580C5A3F065344BDB@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd0046c-acbf-44a2-2bf4-08dd5fb39f00
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 09:12:02.7829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6518

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


