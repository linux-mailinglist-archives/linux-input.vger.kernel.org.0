Return-Path: <linux-input+bounces-10678-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD81A58F2A
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 10:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 755E9188FA9E
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 09:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188F52248B4;
	Mon, 10 Mar 2025 09:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="WVEYgIWK"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4034A2206A4;
	Mon, 10 Mar 2025 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598004; cv=fail; b=BOYyVlO8TsEUcQ6iuwdBZmhiA42+UnrAhTvRVMsbQxZQyeGGQmsrfpaDikX17H18VriMkB8sTwnv/9rKKiDmAdRoBvYBAEIRARvn8fviQLlw8JSZICM9lTQN7+EmdMei7s9Yt/LBXubFlIIU4e4QyIbxT3PSvDp8KTj01lrDP10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598004; c=relaxed/simple;
	bh=eFqnGs/8/i44OtRFQ+w//BfIyVvfgW6k1ilbQIKRSF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=afA8ZSuJkhR6u1X7z1or/N93ycuE5hSZkSK2JtdvnhAPitTKVWyojXTX380lwI23OoPaQQ8PCXQK7Jxn0MK/iqhw3h5fd9mK9aaMvQBrFzVT/NUZK1owX+BG0HWAher/vNn9JLnYJJn+wJaHXWf8vSeCVy1XiI2sOtwRAMf0r28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=WVEYgIWK; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnCA+iCJDKurISBToJgeadSP1uQCl810CxF8tS9CkzmXqXJeeKr7vxd538TnuGS0pMO2q9q/h46kw30QGfIGAlAvPTGKzDAG3VaqXaRRPJAXjbwQc41QhDIG3Sp1k5VP5aKWBti56oj3QPvHAZ4oBxegoC67wwCy3HxVpRmAEltGjQhZcmOFvr4XbkHBGnTEZRGzEnkiba2/LB1S5V4FqlqBNx97cAcM5ysjZusLDJ5Da729wOztmmztQ4I7hCuAyp8CPycDpfX96WU5WcB97fviceQxv4yy6SPGiimAIqF2GoDtLioaVVU/Jt30XF0wV51Gk6MCOhgQTZ3PYeKNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjSltGec9qsTH8QrOjYyF6dlhYH67W89spYjkatgt+8=;
 b=kEMuxZPsyWdhED/Bg8xdZ0FXGkhM/nAgN1JyvfX9HJGXOHVVyHPuhzgkMVXG/3KiRRGQp1UzbganEfrhujpvuCUez3sxJ3XCdHZMJNA797O+KBns0l3m/v7gIitmXZJJlubf/hfyvx+q/Oa9oLtxHqMubgXHHFAWVu/FEJHVIK71ycQ8XSnQ5kuVlB+XWBWLt2eI7+axRbIsnasGeH5XAhOIZfoO97DDt6NEilm7dF9RwKQf9BrJinSdh4d2MoTwSPJkZhwUC/zA01EoO8/QZZucwh0yWXrHEBxEu3PFRJ8T01Nfdb8i54lvcurA2OtAeHHElSrKHfesrdiUihUd/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjSltGec9qsTH8QrOjYyF6dlhYH67W89spYjkatgt+8=;
 b=WVEYgIWKstcSeo73I6aur4x0EjmGi3r2plICXwezfqBHFjv35iTZftmpItC5W5nlwG2PpQgjjskcg9E5aEMPart9uRs+4d/DcHWclnQrErjrlSEph64ZoZP5aM+JQCswBoc1fLSA4E7VEYMGaKjm4wPkD6xxR7C7dM2Tiqj5kemxSl9os9gJJZdMVYyysxPE2j/+vi+kGtQYNQmTaeM2bqNbD1pi6zyVXFvIpeXaSp2kb2BRagJExv8+gMvwc9A56JMrKGJv1wiVJK1Nusg03DsH+YJ5cBwvHwY9RFB/ntqeR6XK87ztPDzGxPn8qMMyMWnYH2WvzTOpDz/ECVu9Sw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAYPR01MB10587.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 09:13:18 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 09:13:18 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND 3/5] HID: multitouch: take cls->maxcontacts into
 account for Apple Touch Bar even without a HID_DG_CONTACTMAX field
Thread-Topic: [PATCH RESEND 3/5] HID: multitouch: take cls->maxcontacts into
 account for Apple Touch Bar even without a HID_DG_CONTACTMAX field
Thread-Index: AQHbkZypZAY1oMb9jU2pdgjB7D6KRQ==
Date: Mon, 10 Mar 2025 09:13:18 +0000
Message-ID: <F34F161B-0904-4E83-94CA-091EF716A78A@live.com>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
In-Reply-To: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAYPR01MB10587:EE_
x-ms-office365-filtering-correlation-id: 5b987ea5-4bc5-4aee-e255-08dd5fb3cbfb
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|19110799003|8060799006|8062599003|7092599003|461199028|102099032|3412199025|440099028|11091999006|12071999003|21061999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6JjaCydg1DvnL29hUf8oGkiM7w2+vaa+W2upJn0OsHJykl6fuu2SqSCZJ3is?=
 =?us-ascii?Q?vJ41XSWNBsMnWRUG3q5WtoVLbhtp+marMn9qpy5fB4u5PIMxzbcck3OV+My8?=
 =?us-ascii?Q?PEjCY8CAWij9cr+6jFqd6Qz/Q7U1ZYUwf/OXY82C7A5Svg2OHHoFtRn0rl9c?=
 =?us-ascii?Q?Id2tQdCYVK3UzT5AmYXzIa5Jw/Kr+0ZPSeWNPOdQmI4ryoBQJs43bxLqfUpX?=
 =?us-ascii?Q?wxrLdC2kp3vp1fMrN3Z5gZa36oFDVzy0l6bh84+GuTOii4ki7cX8kCroDXqG?=
 =?us-ascii?Q?wguXMYxnjMjMPUkjj8r9l7iU+o62Wi+U9gpEYvgM3D+nJJA74yfVw5fkF4nW?=
 =?us-ascii?Q?j6lXDAl1lu2DuZngfBCkgHnWlUEk+xIY1U71bDwvJuxFpNu1+H9nFqrxok0R?=
 =?us-ascii?Q?FgZAQD/L311omh7pIfpslpI2lZdA9D5VH8bNg4N+V7mcAesal2dkOvf+BLIp?=
 =?us-ascii?Q?Lfy4wrNO/kJqnpJg/ZI1cXhzOd2tqcUOM4WjQIJYCzqvc2JsHqaUKbXxRby8?=
 =?us-ascii?Q?a5OBR7/+A31lOEFJbulzI/yAWsQjKn7uXWLpADEYy+z6KLm2R085jWukyNn+?=
 =?us-ascii?Q?1If7gwyfgWofqKImbrFN69VyMohgmUau0obLU2kO0SP3XnAz9vV0tyE7/k55?=
 =?us-ascii?Q?ZcORA62vr5nVrSpq9fDib6PyEzItjnq/Emc/ieKbE+/jgLPxrYR1EilDs0wC?=
 =?us-ascii?Q?6jDhnIAVHdaJIzRs86ACGilYssbgXBQNm+SEJT/g4i7AOt6dWYKT51LvHrOO?=
 =?us-ascii?Q?mB4DbmITQO2s0Odf50hL+HZmtryiJf8mp3+v0Zx6Jq8Vx0nab2hUk4Hy3mu3?=
 =?us-ascii?Q?lScvoFPAdbTLq2XyfaNhooFNL3Hjw0UR/UrmvcG0W3arbdqZOQo1SZzWmZ8t?=
 =?us-ascii?Q?de6Nqfa572BCD4LAphQBNb/+movh2z88JS829lvsJbRrl8HFbM4zTXRSnKQs?=
 =?us-ascii?Q?5M+ltkL1Eda/qU5XbNhokzZXLOnMvpK5/v5YiVfAqtib6RiRYb50jfs0VSGw?=
 =?us-ascii?Q?Tr+MWwDCsUr/z6DBrDfex0AisaYmSdAUmPFmVk5Q4xsqtVQSFIaJYuz2PMur?=
 =?us-ascii?Q?RKogLcHvMieLh2B83hAZW+0Olix75Zilkpurpc7wu9yM7pb2o7/oktqxPZlD?=
 =?us-ascii?Q?/jgpvV/aSqJM3cb1J1pH1U12SJJ5S92b70tjz8AlJgHTK9GOY9bbLq0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Lb7JjwfhkO6beZZkce6p+etK8zDl6urRFAk4VS9jePfa3fE+I9mvmHdWCmXt?=
 =?us-ascii?Q?IH6KNft4Dcz5oAoe9qV7o24uHVpRZ79DW8KriwBDP99TlVe+pWnLBer23W3u?=
 =?us-ascii?Q?/sQV0sJdVOdJkgzPWuAKR99ptpvD32vx+SXDlCtGWzDzu8ieNrZa7bKohutL?=
 =?us-ascii?Q?tNU+6O0WggmYkuqOmyQQoSwO8NoPCr9SUu/2+m+UZQBf/lQcAQ/WEiz5XMzf?=
 =?us-ascii?Q?5rSZUwmoY6cRSKAwQCJBFce7MMNtQ1BRiNS0FapY5s0NpaKQCMTasZYoKdcO?=
 =?us-ascii?Q?2NdwyZYJSStcaC8Dvcaj3b+dLhudoR1fMnBF7i6rrBgM8pgE7XdeVDYrYqAh?=
 =?us-ascii?Q?7NXrMELrSrdyEXA2ycrQUgxUGnE6xuZ99MvlIdu3JmcoLgwpV2M5yc9Ee98K?=
 =?us-ascii?Q?0ekdCNbUbRa/uP6f9AY4/tY5bhEIbtmSoj/Vu9lM32Hso3+CgmUFYlIgkIPl?=
 =?us-ascii?Q?jrY3Eeqw1P7vKXwuAuaYIu6Ul2a1TBqE1U1LXVuXTJPYLQwory8lpWiHs9tz?=
 =?us-ascii?Q?B/d6GwQrMt6bKS0PcprK6te1RrraRrRhpnzlPzmejzFGKwNWMgHUfPUV9XV6?=
 =?us-ascii?Q?HGI/H4sMDBI1rLzxJuD+hiN9VZN72blbSe3Jl7m8eIw9GpRw6u9WQUiR1ewd?=
 =?us-ascii?Q?215AIkGOhXHB2ELHQ5RUb8NPQDZUwou9TYI7SWwPP5shr2IUrGoDSz4K/QCd?=
 =?us-ascii?Q?Y14Vc9n7JS0HVE8gcjtwfFR43mFo942+Ky0/dJRXe+9hXjCL+XBiuoyXwYl+?=
 =?us-ascii?Q?USxpXKHCC97sYZJPaRs+brXRbfQlZfCeRQ7EwtLv8pHewQR9tEVIT3NaMnF2?=
 =?us-ascii?Q?PrcIOiPGC2y19hSkuGGKqB/KjvDryhQwlwlF19utGjj04vuWqRW7AFLJwdTv?=
 =?us-ascii?Q?Z6vDeHdgB1/DusLl4FWag5soXWe9jD2sZY0O7plxZ+6N0p3dPBYrS3l57Eow?=
 =?us-ascii?Q?w9SmnbROzCDgPgTeS8AggwV9B/Y4OeawGsqi3mNag5f+XYS2f/XCC6DdSXgv?=
 =?us-ascii?Q?yBdmW2YiTVY6Z6yFGHMsKxdu7K+TFwF5FcYwv7KXl0xxQNfs0S2R6npYlLGS?=
 =?us-ascii?Q?5Zb1m7PFJwuCnRLW3Ug1M6wlFFCGdznUd7RI47E5VGCJKdfY97/h3HFneynB?=
 =?us-ascii?Q?O2EZFnzLgd436YuD5I29kdY/Gx9giNG/ei6ETK5E338KAQRgPPGJn5witfc3?=
 =?us-ascii?Q?kUGZiBFMzl9+56sFoEycEl3g3D9kqeF1Q08bhIZHo49rO5IW4/aNybDnAUS+?=
 =?us-ascii?Q?EiqHhE36yRHfLvXna2F6?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D6239FB1AEFCF344AA4EF0769A1FE52F@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b987ea5-4bc5-4aee-e255-08dd5fb3cbfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 09:13:18.2347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10587

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the HID_DG_CONTACTMAX is not present, but the maximum
contact count is still greater than the default. Add quirks for the same.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 70fdd8cf9..f7fe6aab8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1335,6 +1335,13 @@ static int mt_touch_input_configured(struct hid_devi=
ce *hdev,
 	struct input_dev *input =3D hi->input;
 	int ret;
=20
+	/*
+	 * HID_DG_CONTACTMAX field is not present on Apple Touch Bars,
+	 * but the maximum contact count is greater than the default.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR && cls->maxcontacts)
+		td->maxcontacts =3D cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts =3D MT_DEFAULT_MAXCONTACT;
=20
--=20
2.43.0


