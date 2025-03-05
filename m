Return-Path: <linux-input+bounces-10550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFEA4F5EB
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 05:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25ED3188D67D
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 04:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E083E19D065;
	Wed,  5 Mar 2025 04:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="rLvHINT5"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011025.outbound.protection.outlook.com [52.103.67.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D741D2FF;
	Wed,  5 Mar 2025 04:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741147602; cv=fail; b=grOaIqYH/D/rCgj27GvWcVGhCZSeOzfNJCRn9ZLpZeHSAo4vuA4hiec0JJQLXNpmwDGgT/J2ulq0h6C3KWgvBuAYcWiDR2PsV+9J32j7fSLSat/vZ/IAifyLsQLFGlb6SI0bKnLDhMSzcxx9/sXYrX3AtmCkTRQJEPAS6I7P06M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741147602; c=relaxed/simple;
	bh=WHUUh7QWuN55HvSFusPvS3TggS8reqD8qwZ7Woo7cyU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VNFGqTwSMhS6iOfjRM0P52pGEgPtTURGs/7xU+WTFXmrlkCfbgtR9D/3Cy8W+ocvC+3MaIJaWOusawNwSb2N8adx5O+oBloC3dzTQtqf1Y09XZCNm5Ep5jEWrf6vt3FR1oQH2vUqvXdr/Qt7OHBkyvOmIgg0hrbmy6vn5WRXvIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=rLvHINT5; arc=fail smtp.client-ip=52.103.67.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H42w0j2WePq4A+NYkzXuTELI6wAMKJh13TovBLeg6ndEc2HfgUUlHvHyk3wMwap9OdjduzDAy9yH3yOFdoV1VxM3490nf3M2IyKj+U2rI4fBUAOE4CuGnzPAiNG23rKveyJpPVdz0TU6jGJcCOfvbI2pFOjqmvO6QgP9TSb8qfEdZg8YblShzcLfHzlGi0hbAJe3w40sQp06XaAfIXDzmlrnAQ5ajQx8a1ArymXtmVr/4+sL32yDgNJBecRPxDA/3QWNa927VNJuZ65mnkPTlItYIqRF26d6SrpDF1ON1Z2yWIG+oCbtYjpJ4Ws2aB9hq+duvN7HemzPoPJ9fLm+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfURnbVasnG66phUTNDFKcKrWjt3s/2L+KXYWRPcngg=;
 b=utNKuWyCTbPdm27KQI2JnaXCTcSwtzuB6N9ejWcfrZHiDh/99/uP2CVoH/vMcTWHz/2D+99Fi1nW2EmKl/XMHST3B5gUEh3YPSejhhAoYYkI7wfXQN2lkP6sYihk2c71Lyoj0HZOYFH26oEEtMGbNdFFHJksypBwArT4xAmeTEAnRTttcBvUVhHXrCPLfhAIOxkIn4GtAx9+KqvLYLv47h2sJW9VP5PITsqwgCDETs4hseVTLdVQmyiCwxlu6hl4SXz6+Jfyi5ViBuQL4evboMC7U87PBLx6lMiH6swql7ZQcHQ6CyKnkUMh9xH6eSe6AZ/0aNEvrkxOOhrWAXFWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfURnbVasnG66phUTNDFKcKrWjt3s/2L+KXYWRPcngg=;
 b=rLvHINT5yQomWoh7VntT6q+dLh2LaFvDsdF8RW9/Zz1G2flwWa13o1WTeu4HxAKU3/1gWPWRzSnIZFgRUQbwoA02IcHBCZlZO4AhmlI/YnSq4vCC1rPDD27ptC1mtFyQU09rRDd7auitjfbpO6LvgDm6wixJDa/Sl9oFH4M3QuvlkwO8LKihGC+DrW0I5a4jVxfefbqs608PRT+9JlmQ0sfwwA/3JYSrvHQjB/SYYHyotJh3ckUcIliQcIepLjaPd12TVpjJcEwXThgsMd/7UhoBFsNxqlUvlwroOFGg+udT2WpofAAjLAHXNwWdYBa1mUL8epE8tYSzDYFeDp2RUQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB7351.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 04:06:35 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 04:06:35 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH] HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
Thread-Topic: [PATCH] HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
Thread-Index: AQHbjYP8WlAbAbwLMESMrSz25c3BPQ==
Date: Wed, 5 Mar 2025 04:06:34 +0000
Message-ID: <4CBC715A-59C2-4815-8D90-62683850E176@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB7351:EE_
x-ms-office365-filtering-correlation-id: eaa77326-ba7d-4f5a-315e-08dd5b9b1ec1
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|7092599003|8062599003|8060799006|15080799006|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mN9B3/g91FtFBRIXiqVs8C9XspeRQJ9/N9irtKOJMoPns+JrJlKeynMEP2c5?=
 =?us-ascii?Q?gMnmIt9N32UjzhnHcAH5Z3TuC2MZatuAr7McPrzIqUQzue1v+3IvmzwwINSD?=
 =?us-ascii?Q?cQLEnVZ9NuT7B3+CUfSaMmHv3mwVZPPDYOQp4FQSfRRA5ecoFUUciC1VO7VP?=
 =?us-ascii?Q?NYMM4EtvqXvzntzifB2Q5lNnNezLSmtEwn+jc27/SP//hgRocVJBtGzXAZMh?=
 =?us-ascii?Q?APSdZ3HqHqqiOwGY5xcUo/0TcAVnRxnJ7FB8olp8ncY+hFduwXL29XdVjVUF?=
 =?us-ascii?Q?PBne0uSxc7+UjFYZkNZf0/F/TMxOv9MN6BQG8OGBeALasxMGKo+3aDi+8Q+h?=
 =?us-ascii?Q?52njGI+3LEUcSZXbzgJATPM5YLYBg5reLFabDL17pD+fKHOj9oiX+L3GKnKW?=
 =?us-ascii?Q?F2nuhRZ9NBLT7CTb0U17AqWFyb/DWtvZWl2ECDFPg28G31ieJCVp/vChvid6?=
 =?us-ascii?Q?3O+B29pL3silARi+IeZ/c1duIq4SVaTN4WMDGIVq66RL4M4jTag9eGmc2xuf?=
 =?us-ascii?Q?roqpQQ6k4HjMkpOwIXYERYDurWfyUlYm4Bd86UDPfTNpDK0ROWaTMBEaSJA/?=
 =?us-ascii?Q?RWfhWk24NxdQFJ9Wqi+OVgAlAtKQU6kyqS3ILY7C3EyrNmoz2PUuW68fEpin?=
 =?us-ascii?Q?BU2VlgRFulbQrVxGDlQ8j0lgt2gRmuI1JsXs6RmJJpVgceWgkFDOeykLw04g?=
 =?us-ascii?Q?D6alRxzh6s57ZS+ehcmBfFu2aaeuQFN3IYh07B1Ud4+ftQvZYQmUkwFdDalx?=
 =?us-ascii?Q?WNdRi1SMz83dMPBUDKBpZnFzGVkwk0v27mKk8Otc4hIkSnmlg8JoBLScrUJY?=
 =?us-ascii?Q?epJMSHhlKaCe0WMrveiI5VNd8nbjVMOo18kwLp23cIf1D2vsronU5McRVoBu?=
 =?us-ascii?Q?TNKi9+YXz14P4bpOD2Pqn4IOHdLUmiSYUu48InP6stcBNQN9r14z3TqnbzNK?=
 =?us-ascii?Q?GkPeGIxJ/gk2EQP+wzHQDWRmpL9IuoArzR/0/R64X8blNzjpOC3F5MLEpIP5?=
 =?us-ascii?Q?+lZ/WCx7XPReVK+S4hx8gHAkHI9XOCKBnciHmnphIqzkM4rbGqjGpr741nd9?=
 =?us-ascii?Q?rA0RapO+xaRGh8BXXSkAgIdUKZM2dg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hTrIiBq5dwsPRGv2588VXu0AHihOf1V7f3AQWeFdMi15nHWxNBaDsaBSbaM/?=
 =?us-ascii?Q?ydJ7YtubohbKj4SkZZTQ4dpeyfd3X6V0POCVtfJsIfU95F5mlsB14C5TU6aD?=
 =?us-ascii?Q?BSc89abEismMW14NtK+HAKzO+ImLywtpJRGDOCAAv/hgOhzCXQFET5lTLq39?=
 =?us-ascii?Q?+vyfKgacyVbRjGCa4883SkI0Bv0tZ6SlAIBBnCrruh1qpYbpDCQPRs4ExS7a?=
 =?us-ascii?Q?YuKsxhw0ppOpWX21fx1enJSl9GqfXOj2H4WS0LbbS7DI51GmR/oWF7GH29k7?=
 =?us-ascii?Q?NJ3G4KUEU7ZFwx69sDd1oLtWnABCczL0Pwo+Q1PbiheVE49ahcobPzZLxoGa?=
 =?us-ascii?Q?uNIwqrfiakbN4PrbZsbhk0Aw1WwZaZ1cNlA8hehsZcqparbjgK9+NZo1XKdm?=
 =?us-ascii?Q?LK5zQ7pTDrpMNXogwjQy4uan8Wb137LgUtqgQfjGpd2muXBIZMLcgmUp2EM+?=
 =?us-ascii?Q?r3Pfp5eOvJgjM/c5Y8l/A/2Syh/3GF8PvYCcwWwAo4BAIPC/SUI0I3Nc52DH?=
 =?us-ascii?Q?ZR/WQfXAaAT3+tmI8Q7BFl6t4iLamnsEFpk6HQ3DSGcNf5JvCOF6nY40amgs?=
 =?us-ascii?Q?5PxbuRQ2tYdN+4ly6I7xXXzFc64aJoxZRuOlPlIbiICktzISBCIDEuIS0AD+?=
 =?us-ascii?Q?5DnvCPBewJJ6nJNSMZ1mrxfQ2YzPf6hbRU70yR90P66RjaBi0Kpi7C9K8km+?=
 =?us-ascii?Q?qH54JZIBEB2VOqiljnF1LrgRQu/siAuakmBK6Jlf7snd1J9UOr3R7hB4AUGV?=
 =?us-ascii?Q?DtjxEigO89QpM3+70/3gZ40dVrfsrYSz0wdTRToVkt/aRLPHqe0uvhUCQFti?=
 =?us-ascii?Q?Cote6wnbEvFjP2hHJq2Y825f0xsIXvoouwl76uLhC57RFCjIJJWfGrmTxZEt?=
 =?us-ascii?Q?V4q+sxnqrOet/00514CQzR7tywUIUQklCESa1nyKAwvqzgT4OpJcoAYzqnaV?=
 =?us-ascii?Q?jCAT908Mhte7xHiVo+9xRHOk+wJyQa1oI0I5nknhlJ2HilkNdGMrwjcSWdxC?=
 =?us-ascii?Q?yYWIPQoybxBCz1hC+RO9VKTIpnVjHsUbbSwRtqDwd5uyYz9R1vYH7UzlgM8D?=
 =?us-ascii?Q?6nPKyFgWL4m7ZRbBPdUZT77OvaMgoNWMJgPsyuBFQ1KZaSmDSi7y+2q1o2Iw?=
 =?us-ascii?Q?6TjhmOxn+BwIUqPb2n2DdqKw7IaejgmrIjicPP804oA5/uPJ/vu/3HK4oKce?=
 =?us-ascii?Q?7w80QrNYF42ovveo+lKzXV8xt2lpjEL+YuLE0OirlcI8uBedeLwDLuriDO6a?=
 =?us-ascii?Q?s/jLeIVmN1GxCDhQLWrAvbJUSFhmHkoTaXk9+Y46nbWMUJjedMNACT3DphRC?=
 =?us-ascii?Q?muirTIDny6wfuYWWnGt9CtSg?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D1B6E7EED7DE5843BD8DE0CB44204972@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa77326-ba7d-4f5a-315e-08dd5b9b1ec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 04:06:34.9972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7351

From: Aditya Garg <gargaditya08@live.com>

The APPLE_IGNORE_MOUSE quirk was not used anywhere in this driver, so can
be removed.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3d7befe0a..fde438bee 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -30,7 +30,7 @@
 #include "hid-ids.h"
=20
 #define APPLE_RDESC_JIS		BIT(0)
-#define APPLE_IGNORE_MOUSE	BIT(1)
+/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
 #define APPLE_HAS_FN		BIT(2)
 /* BIT(3) reserved, was: APPLE_HIDDEV */
 #define APPLE_ISO_TILDE_QUIRK	BIT(4)
--=20
2.39.5 (Apple Git-154)


