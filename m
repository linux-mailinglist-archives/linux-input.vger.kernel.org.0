Return-Path: <linux-input+bounces-10417-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BACA486BE
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 18:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 024CF164BDB
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 17:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F021DE3C1;
	Thu, 27 Feb 2025 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="IETCvGD8"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010011.outbound.protection.outlook.com [52.103.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4591DE4E1;
	Thu, 27 Feb 2025 17:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677740; cv=fail; b=U3rL22qrMoGr2vD0gTpeiiOrtMcp7dPjUG20jp4mvwaMZJBM306E1SgNzHkejTdXh+c+7BeVxNAA0fsRVrYdBFG5BHOvcGIATcEBkmwumKPtD9vJTs2OeCNrZ47oyNzeX2IET2/x47+fqjyzi8vfPsatNv8A8NOqYJ/vvGRBzk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677740; c=relaxed/simple;
	bh=ua7UqOGbXfUtWDjG5OtQcf/vLDUxWuiF4ryfyYw8a+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZAZnlFTUM5qZpThivTV5H6Bp3nIix6idO4Mo2Orygc7ksb1fhQcDMiFS3k82TAaB5+K4hsw5QPW0uSmMJxrTtCg53c1l+0yKwE/bdXBjXE+ZLyBBc2jA32ACimPjYAiVtQ/xfBAnIBQXryusyDAlB6xyUhjI78U8zJ1Nng9mMy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=IETCvGD8; arc=fail smtp.client-ip=52.103.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zyibx1NykT/vNWd5egHVyZk2qLgvsMzwzUH4xksSGJp1EDo1wjN3cIdDd+4HmngNtyu523RfjG3EyrbUhFYaMbIUEP6Q+GXIjCer4dvx9ErFf6dNvtC+FRLPtaQ9nFMuNBp8T/hG0gnzvnx448aPn7/396GkrL6WBy0pfpPOIB1+vg21XArZg7+BFncD0jZKilnwfAKE7kNNcosrFILsfRMBdOjpiunuhtRgexJsK+dBQKjgjaDfkbOlxVPdGujyY4g8zySvPvwPxFOeaJBhh3JIlvMHfnVgrVIxhr6zTrSjolNFOKT0n3Hl4s9D/5dDYvyflPU2oOLMLKyCN3VhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/04ZaODBq15k3NKBD3BcMjYaW2C7mTU+vyha+u7ypE8=;
 b=Oc2rTCfIaZwrkDm5dlogfeeFs2n6B59MXQoHffJ2yNFyyFaROIgZW9kudYol0qNUWB2NxHIGczNvrVplfiAJ6ktEZZjr5cDgcHo1QaNHZBUn1gsCupDsXTFlp4zCBUNvFVO8j6B08zWgDpZlDnjc2d5kFrre2Ko+Dnk43QN4pBWO+9bNXSZUac0EvOV2ov8BjFeJCX/qU0yXzdn2/2qrI0fNDNORki6ODktv6tzeJT3LwfL+7M8acwjxq6T+eYco45GwTBWXDoMZ1gyh+9t6wZS3JNblJqUWYkqCdYpHw/8i3yuk9n+XF6NMM22UyRLTPYllAOarSsPGvGUdFPC0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/04ZaODBq15k3NKBD3BcMjYaW2C7mTU+vyha+u7ypE8=;
 b=IETCvGD8TKEmMtz1RFaE+aN1Jc8WzDpcbhlp6xoreXL/USR3G1nZ2RGMcxgXUhb9uSXWTc8U1Gc7/Wss6GlE7KM4sAq/RHX/dIIX+fenSkQQwY/F2DWbX/+4gbKrf3yvqVAWt6RyEUEs7MV5UKa2yfNLB+N1sAaS8SOskj8eR3YyREOnpLch8xZd+3nvHcuEos4lP1llmvARGFGwx2GIg9rrFOp+y43EN3uJkW2GOXgBcJnzZQXLTJUS1e4KoCuunTRCPHrmT821beYvtIWUPvZnFKJal/soUweRx2PGmrkaH+zTc4LdCFYd/QVmXi6vvIJwaC860925w8AtHslryA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7281.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:34::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 17:35:33 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 17:35:33 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH 4/5] HID: multitouch: specify that Apple Touch Bar is direct
Thread-Topic: [PATCH 4/5] HID: multitouch: specify that Apple Touch Bar is
 direct
Thread-Index: AQHbiT4Bu6xnVkz9AkytXDVuzBLZww==
Date: Thu, 27 Feb 2025 17:35:33 +0000
Message-ID: <B7EB2918-BBC1-4502-8F7B-11B2A91ED50D@live.com>
References: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
In-Reply-To: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB7281:EE_
x-ms-office365-filtering-correlation-id: 70044c17-eed3-4f36-7439-08dd5755238b
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|461199028|7092599003|8062599003|19110799003|8060799006|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fmFyg9v971wOdz8sLN7Gm4KDpQ+AIl9EZhfAJau8JtnlG8odfVoOL2Thetxb?=
 =?us-ascii?Q?/oNr8gO1bnBwz0nQJPvmPQxmz8vfxP98HqLKDmoWJ6UQE43R/a1oHiLuAsCr?=
 =?us-ascii?Q?+OB/6FiaSnRCZeBk1KQ6NDsHn0Gst1TgJ/k844oFwVlGNftrf208fn0qzzFk?=
 =?us-ascii?Q?m3b02FIUgZ8bQ7SkO1eQpJhEaxEUIY6th3cQ05MY1SeCIb+hlat+0Q0giA/W?=
 =?us-ascii?Q?unDG5seFsn4JN+6RSYruQjzrQInGKCxvqG1VPuK/2WJnIqccKDbiIg2O85pN?=
 =?us-ascii?Q?5VcncCizm8o/gfbJfJAlhsvRen8h00x6KAxtAh3Xrj3JfhGtf/CsVSxsz574?=
 =?us-ascii?Q?D7kiTq/tSsh7vQKH6rippmV8+YIfD28Vh5MHSOo7QduwiZUXod7FtxwaxVL3?=
 =?us-ascii?Q?1pvRXe+XE9oszUo0I9pEcIn7Dw116PGDDTPIPIaHJW3TYPDPVZLKsn+mDy2i?=
 =?us-ascii?Q?J/48CGTQTOVSaJvaXRezW2ojN39A4NAaIZ+O/HyC6kSmWEqjL5FTH8MhAkG0?=
 =?us-ascii?Q?Ko215NijGjlbURGWKgW5oqWaT5aWvia0xruCw3CEDCr5+cJx0UEoXc3W7gQ6?=
 =?us-ascii?Q?gXEkgORkZtnwzDC6z391ke1HLfkHwRiWQ3OaF2tWkayV2GORAEkAbLcGECUy?=
 =?us-ascii?Q?Wi649c4Ph4Y+C/Thk3IBLmG5id60WxqneWwEscrASE8El1jFtT2mz5Qz9k0z?=
 =?us-ascii?Q?nuoRXTN1oOmLc2yRmd1/b/wqCBOWc38Mi74+qQGooT6dNtXMJ4TOfrZzX0qE?=
 =?us-ascii?Q?JP9jYuNIjO3rsaeYSJarVjLvyOga7GW4m36G7PhEa1a4CbzHYRSKqba9P3be?=
 =?us-ascii?Q?d/Axz+Abd9hQc/GLjGGYRsMa57PkPVn0oIBd+xQWNNNsbgr4/yA0v3F6o5yL?=
 =?us-ascii?Q?0OaZgKU1DmXuySFLszta9cAB7anFc4/dqqpa3JEUqt2RCGwIYUIcsJ9e7o6f?=
 =?us-ascii?Q?REjpiZsrRLE9ie8wyikxTR+VFiUeyTSxUBG1i82aD+y+hYAuUY/ZWhPeKbRY?=
 =?us-ascii?Q?W41O7m3kJpFmbLxEGNMHOqlBzAIdGr4t8mtMmRbygXEPU/hFwKitZLDHCdgq?=
 =?us-ascii?Q?2wI3f/aIpkpXMndCDE9n159SuQSDjg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lbGFnU/j+6S9C5oSgA3RmW02PxHZp6ywkDHG34tVbS07X6ntJRNQ7ezwWkok?=
 =?us-ascii?Q?TpTWtVgUjiTcXQ5lgBg8OFm7n2hGjtTfQizjpaeyR0atl0q2dYS+zikZjtFh?=
 =?us-ascii?Q?zhKiUNsaQ1emkrvUNlQrPO1j28ZS5Z1Do+5aQh3pGfdjY3CZydhEFWwhnkWT?=
 =?us-ascii?Q?/IUlLgk73IZOimQ+aCovG87ay7kpKaVUKZjZVjxj8yJ9n7t6LOkokjVVBxjW?=
 =?us-ascii?Q?U6M507O/0vlOHJ29x+v1JKfjb1o5Il8wyR3ueg8Q10QIErpf50bX1dme2bcg?=
 =?us-ascii?Q?/M6/9u4GFn86q/yl6wvQRyk0XeAa6HuAP72IvOrQSTk/gymuFt6KEesG07xG?=
 =?us-ascii?Q?vjHdIqUYjm6/fwHiEG6AJmJhudGktKPF23sFMld9L1CUM19MnTQ6903etwqg?=
 =?us-ascii?Q?WEHVB3qma6G2J8ifc5FqtiS6Bm1LcGN4U/VHfmdFZDAr9+j4Y+xuTRN602K7?=
 =?us-ascii?Q?t2yRfaUL9C5BX4yrOxXkCM5QDkk33yGssTdtjnigMbbqh4tWZ86Hp6dqYJ0m?=
 =?us-ascii?Q?xmHla3hVOUowv78UeCzEeYQMXjqKE5hmvq19LTUmPAC606+fs4ItTyNSG5xp?=
 =?us-ascii?Q?3U4+No0c9IY3n3DlztQX7MFHxmh4+0Mb1vKjgrvGG+JGPTZCQ0Wkhap62Qeh?=
 =?us-ascii?Q?pw8aw4MFDiOf0bc+BhAgercv7YUBUyqK4iweyg40hZ1Hr4sj1EoJV2WyEEGM?=
 =?us-ascii?Q?8u68UN1iZvOlvALy0l6WoprBBgCzJM6sD6vdom5WTeYGtU/7ahu8Yy2Wl7Rg?=
 =?us-ascii?Q?r2A5ewR4WU5gpkIJe/dbcb7wG+zQVsxN6JmIMTtI9ePeeAE8OiJyBYU7g948?=
 =?us-ascii?Q?pFKyftPY+ua4s9O2Gx9WHWw8GALzDOL07r2yVvCEhyJeBrEnxPideGXjIBTf?=
 =?us-ascii?Q?zzo9twx1UbrIzrnHxLSMXeX1nZtM7k5MyoayiwubKrwkq6IEMoZfQamkbyz8?=
 =?us-ascii?Q?WEHnxb0gVSRdxqqwG+AQ7qJntINQiRXYORw98AtV3/X6EkoQ80Ktku7ACUOI?=
 =?us-ascii?Q?0FUGm9EcbhqxITOc0eC+FdwILXJo6h4dj02iXPBYhc6vDRyaBSB1vKL/RpCG?=
 =?us-ascii?Q?1Wc/+ROViDsIur0UK51usz8tt7+6xBz0uZ6iSj86q//bir0M9ZBM7I3L0to9?=
 =?us-ascii?Q?Iz33Cvot5UIeBjL+YSAFTuRjdh/4GuSuBQoac06sQLOB40GgCpo98YNFa2D9?=
 =?us-ascii?Q?wDOJXqLx9sIyOuYIVrO0GybPT9YAXX6XcDmW2xL5yZRGAvtkVqsDQsEPIxEi?=
 =?us-ascii?Q?+pp49rcKVIB9ygz/aw1jAycJ2NQfmUElu02uYeJe5gQv9aGHon+XoD+6JxQY?=
 =?us-ascii?Q?kzTH/s6Ibbh4vvJDCN7MmC4q?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65E1B246A9324E468D4A5C49C4F49293@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 70044c17-eed3-4f36-7439-08dd5755238b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 17:35:33.6180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7281

From: Kerem Karabay <kekrby@gmail.com>

Currently the driver determines the device type based on the
application, but this value is not reliable on Apple Touch Bar, where
the application is HID_DG_TOUCHPAD even though this device is direct,
so add a quirk for the same.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index f7fe6aab8..66e33a482 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1349,6 +1349,13 @@ static int mt_touch_input_configured(struct hid_devi=
ce *hdev,
 	if (td->serial_maybe)
 		mt_post_parse_default_settings(td, app);
=20
+	/*
+	 * The application for Apple Touch Bars is HID_DG_TOUCHPAD,
+	 * but these devices are direct.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR)
+		app->mt_flags |=3D INPUT_MT_DIRECT;
+
 	if (cls->is_indirect)
 		app->mt_flags |=3D INPUT_MT_POINTER;
=20
--=20
2.43.0


