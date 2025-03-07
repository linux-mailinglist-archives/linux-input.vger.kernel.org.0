Return-Path: <linux-input+bounces-10620-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 843DDA56751
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 12:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBEDA1887967
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 11:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF9421885A;
	Fri,  7 Mar 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="F9O/iRTq"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C05218AC3;
	Fri,  7 Mar 2025 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348745; cv=fail; b=bnu6qErx3kmBOaYtL/4/d5AEnlXANeW5GX3K88vZgYKve8pCsxiGhtY27zi7p5NFdMGqrg2ZtR6vLFEc+HFVwAgKAC92Po5XPx10FgkGlIVozY7mhgaE9hi+FA5g0AGxazBasHRrp/6qO9fyonLYL2SA3KHbECzxXXrgFjAl5vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348745; c=relaxed/simple;
	bh=PeiTzW5o9wKpnyZDDQe10Dmu4K0SkPHy8pclGTcW+vw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rKSNekCO41NQv3fwUXK87WyuYzkMgcs5tBo+Tf9FroWtj/4t6wYX5mrKfi9XyxxySKg61cQ0zoLgFuSOozsNteinvZEWKxmdGz3jY+pwMkJnJPErkfbFQ6GElqc1anKqE5UcrAhBJV5F5ISIIshqEBWv+K6qWvSdBo1WAyEVPFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=F9O/iRTq; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV2pRxhSH2NDUvZ4z65dEn+rtrc5R/YaSKOW7LOTWqHMKO2TSGaCkKztGsKoKoNC77p3sTD5adJM9ZWp3E0sF+7qbR4GaAPw0XsLrJts9Y2/vEnENz+4+stoBwlulNeiRSkY7aulqZGHHdvI1BYFrEC1D18M/omxlM1R7THX99EKMS+8DkLAhAH8VAjvCu+t8r5/YHlVrHXOjW++QXntsM24KmCXVFoPaHprWZdVjchbC89SFUlgn6TqNn3FlsQ299LUwot5OGVIjL+sJn/039yLbZ01nJKsMMRgweVmpRMXJAK6UohjvDXIZbfMxZd/sc1HxLVz5vsFvSW2wJBZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS2jSA0c1p0hWrd6JoRRE68rFn/0+dHUhqUBnRc5TKo=;
 b=oMJmYfUgnweQVvyRs0hsg2CoED55pzLkKX++SKERRKNS808KLMgA6SdXD8STbqMX/k6QgBU4CBnFUDXg4cZquLJHMmjXa8TmFSkm+hNHC6RHTEDXDqU5OuNa0gmGR0jiRqPkZujhW03cZROvtbcikK336N23tHOElG7cAyy5xOotcTUIh1Gi+dkYt83oc1oH4WaValquBtEOV5LDwPW5kiJrR/MFxnyPiQOWzbIAquhIo2Oxc/hU2O6rBRa8Obxw5MBh4iSv9dsVJvKgwyPrYLWqqKpDv4PJ+p075jP49Pm6LOHibymLiZ5YJ+v+cjb0Kcr2Fs8fCqYqyWPPle8d5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS2jSA0c1p0hWrd6JoRRE68rFn/0+dHUhqUBnRc5TKo=;
 b=F9O/iRTqjsiDne5ouksOaxPDfS2BesdvsfL0yINAzUQqO28pcx+R/0W0uMbht1+rX3wjuYLQ9SWcondJoai6QPhzftv0PfQm1yD1lCTGjSmD/Dk7hmdL3V8k1lrb8XRs/iaRSv/YSDcFufxK2cnumI+ygEdcpRvXRA2YXIifSUdIFnuQF0ZtDDLiQnPeHwFDUnQ5Ztt6Seb9/aLPdXsCL6aVPbIOFK+63TjoCj+ESazRpouRw9xLjgTf9lOQc2vOurXrcOtu4FZM1UDS+4oKjT0ew+ZkTloen1bUexH3TKUMG8VjBqkA2T0yqPrJdWLdR9uR22Z5/XfTua26eAr9Tg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB10324.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 11:58:58 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 11:58:58 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jkosina@suse.com>, Jiri Kosina <jikos@kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH v2 2/4] HID: apple: use switch case to set fn translation
 table
Thread-Topic: [PATCH v2 2/4] HID: apple: use switch case to set fn translation
 table
Thread-Index: AQHbj1hPe/Apnv4JUEusqFQAUo4b0w==
Date: Fri, 7 Mar 2025 11:58:58 +0000
Message-ID: <63EEE173-8989-4257-BE21-C5A8FE0FF677@live.com>
References: <A4FBEA54-C7BA-4864-9C4E-E41933D81FB0@live.com>
In-Reply-To: <A4FBEA54-C7BA-4864-9C4E-E41933D81FB0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB10324:EE_
x-ms-office365-filtering-correlation-id: fdde1077-d243-46bc-fcd6-08dd5d6f71ad
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|15080799006|8060799006|19110799003|461199028|8062599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fEXs97tSW+6RcMiEjg+3P/JYki1MTVUufXBBFo3Kriy6Re0COLTWqpc0ACdy?=
 =?us-ascii?Q?9SA/gZ/7/woyQ8E1guMdAqqo6ipJ6ifCqGCQyOKvMsP5RL0AQAhw5noRKAUz?=
 =?us-ascii?Q?c/u+7pYntBH5KNZrwakmOPdJNDFo2X54NtDA35I5qOv2/jIQ+5xqym022n9b?=
 =?us-ascii?Q?gBdaVvjW/xiQ1oXq2JjIV+dskxPGZcnfnKQlZNj+FNXd/OW3tGJwXjfw5M0o?=
 =?us-ascii?Q?WjeO871xhObXn5c3EKns4fMa0v1RvW2x8tffFy4IcozVRzRyrVfQ3twHhoCp?=
 =?us-ascii?Q?MZWu3OP+ag5Fvd4hSOpyQGz7G5/ktXu5PKek+4qLyVSSOPZ764cI6jVmARmo?=
 =?us-ascii?Q?78hfOhuAnZ9HI1oQicYm0T/ufwlEWtawhJdi9AwnjdcXZarJY+8BytsxkzIb?=
 =?us-ascii?Q?k/+vdep/eSNOWzNiE6YAzDTqcY5Szt3wh+Qe9pN51mKL8DF5SsLdoE42rqBH?=
 =?us-ascii?Q?KRxdd4fi4RBsRLORupdC1nS+CQuBXxrydimzqvTpFneVb5TQptLWEGVcY6wR?=
 =?us-ascii?Q?Vbp2ouJW0HYunhsI1KoEcVk0yvBhFIVoXMJSg4uwJwPu7bXyEX7eOmAIEskx?=
 =?us-ascii?Q?xsbKtSya/vrtq2zCWZ1aGWjsUqHK1J9oxSyyg8deLcHFaCnkDS11aFrZGvUK?=
 =?us-ascii?Q?2S7+B2RX24Ae0XNXD10389FJY9D7YjB8MKTARgrmKP3qaSRe0XjwN2QZ/g48?=
 =?us-ascii?Q?jK4nPV9V7OhGfippvqsHDByWD1nuHWjFCeVc84lxUVlQq+HfFDo0EiiD01lz?=
 =?us-ascii?Q?Wx2pTGOAOjl47BvundCH/mN8i//3DBn1cM4/5VaXYj569KOL2+mMwJzMX4AF?=
 =?us-ascii?Q?uNdOBLW/8lAB3aLgb1ml15f2N9jJKmszC/pPKrusALui2GTZfsoDv301sdwL?=
 =?us-ascii?Q?dpw12k5kfgn8G2cTv4wt0j+4umD2yf4uW4ZBDMArHf8oBpNF7OxAEmT+trud?=
 =?us-ascii?Q?3nqXpVlyliIw8BtRIbv46lDpFREpmvfQZrKmcBIKkENNqRvF4eZZcRu5kzV9?=
 =?us-ascii?Q?lHKYuoTpHkwT0PDYA24T1zqN13KGXl58fwVvGdiA4WtY97j9oMbbFYQy+7kh?=
 =?us-ascii?Q?CS5G0LMItc35lh1dA3vUct2/QHKCfw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?202uPUGzyOuUEi6sF9rkmr/RsEBv5sKP+1FrNgoT7eqRmhykamYqM9nTdKB+?=
 =?us-ascii?Q?E1+sfJ6GYoZcrdhRsCRik2uzqpLD0lFKjsKpxPcBRwph2qYY6/sTHPw25hdK?=
 =?us-ascii?Q?gFCfSj+YYWwMiu48AJYQHLb6T2S6q2BMCap6Yofb02HjMPXcVlhjZLHX6bre?=
 =?us-ascii?Q?zE7oNEGf9mmCqfBiZ9g3cD1Rf9eui4wAGVLreiHaHby4kGXi47x0nrrXsZW7?=
 =?us-ascii?Q?XO+gX69eua8aMgpnZ8/RMK0fSNb71GkaPSp7jnHmo3/G0fwEriyGChTJdIpJ?=
 =?us-ascii?Q?iHojFhTpnH2icbKZ+tcm7XUl3CTr66vhH2orC9052T5eL1W4tODFAOl0Mmff?=
 =?us-ascii?Q?BmRg0+lMCrFM347G0KJ+3y0WFFx1MRcSasIfey+sCuw0tOqelkWL0FnGaLzx?=
 =?us-ascii?Q?3s6jRL2dQc4yIyH/3XdqGNNsgC3nMSeqgmhg2YSYURkWxMeoVryY/QQ50S7r?=
 =?us-ascii?Q?5XDs5408VgVTK5nipowrz7rZ5tAYcoEESgvwogvyg4N37Hw8sTMzJF0+K3O5?=
 =?us-ascii?Q?Z4Q9LsgRhup2FsCdmBo9nW2gj2DSVdrKW9uJ3an1x7PjeyPk5yml79jqXFcf?=
 =?us-ascii?Q?0+3flsKLrJRwe7ikRPCMElgaw3N8HH+dqt3HS8KcbHjr+J72NDF+PnKvQALJ?=
 =?us-ascii?Q?mCzCGHSPO5NOWrYWUKst5OnF+lbF+CqndW8mEMZGeaGqTHDQiACti4W/9DV0?=
 =?us-ascii?Q?EVNC/BKJUTLLqPfdVfTDhqVbXkmh4GOAjNUv3kS6xdg4ivCkTr98ivSdK2vN?=
 =?us-ascii?Q?ZtZmhx8qOBFmvWMtvfmTLHjy17cAV6oz1foVQfkBxAdGN0oEGCV6f4T1zzPY?=
 =?us-ascii?Q?kXdgJTenFrFYDkw/IajmI6cWlZHuE3e37JcFFbNLX8aSGC7NW2T726S45kZ3?=
 =?us-ascii?Q?+x0GxtqL35oLm69TDmqLEX/aWvGIp/GzdlApLOx48vi4xDhkCRhFfzaW46tK?=
 =?us-ascii?Q?gH6PuF7koYTZ8Lw2reLX4w3Of6t7NbWdkwgz8DPszDJahmW3Gm2g7tL9hPxx?=
 =?us-ascii?Q?NsEnGvtCvASZiVClhx4KyEOL8GeHm7FmWYsOVosmAh31ibnr6QLAOe9GFpZx?=
 =?us-ascii?Q?3VmTeB/hzyeFfkA63vopwloEE632j16Ry7CNo3jYRD7oApzza/c7F0ZEKsVW?=
 =?us-ascii?Q?nVSJgaA3SU4QIuvOygxGpVb+LSwZU7N9xxGYUGx5WN9DyVr8GcgYDHHR9Blg?=
 =?us-ascii?Q?vqdVb61agAgZzNdgxQI1AG5c53Ueb7uWaCfsH6zW7S39AyZpPSXsx/IKCUZL?=
 =?us-ascii?Q?lHr5PSXTuJI6ZK8hGvVURMDi5PMFgVkLGYe8QLGayK6v1vpwbda6c1KdYUSl?=
 =?us-ascii?Q?a9yiMyuFSqqv4Gdyg+aAWcOf?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <63B9DC2D18B834498D692982F03200E6@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fdde1077-d243-46bc-fcd6-08dd5d6f71ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 11:58:58.6108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10324

From: Aditya Garg <gargaditya08@live.com>

There has been a continuous increase in the number of devices requiring
hid-apple driver during the last few years. Moreover, unlike previous
releases, the PIDs of the newer devices released cannot be combined in a
specific range, thus filling up the if else if statements with individual
device IDs. For such large table, its now more suitable to use switch case
instead of if else if for improved readability.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 73 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 93b990603..3d7befe0a 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -465,42 +465,51 @@ static int hidinput_apple_event(struct hid_device *hi=
d, struct input_dev *input,
 		asc->fn_on =3D !!value;
=20
 	if (real_fnmode) {
-		if (hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS)
+		switch (hid->product) {
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS:
 			table =3D magic_keyboard_alu_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015:
 			table =3D magic_keyboard_2015_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_202=
1 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 			table =3D apple2021_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
-				table =3D macbookpro_no_esc_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F)
-				table =3D macbookpro_dedicated_esc_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K)
-				table =3D apple_fn_keys;
-		else if (hid->product >=3D USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
-				hid->product <=3D USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
-			table =3D macbookair_fn_keys;
-		else if (hid->product < 0x21d || hid->product >=3D 0x300)
-			table =3D powerbook_fn_keys;
-		else
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680:
+			table =3D macbookpro_no_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223:
+			table =3D macbookpro_dedicated_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K:
 			table =3D apple_fn_keys;
+			break;
+		default:
+			if (hid->product >=3D USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
+			    hid->product <=3D USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
+				table =3D macbookair_fn_keys;
+			else if (hid->product < 0x21d || hid->product >=3D 0x300)
+				table =3D powerbook_fn_keys;
+			else
+				table =3D apple_fn_keys;
+		}
=20
 		trans =3D apple_find_translation(table, code);
=20
--=20
2.39.5 (Apple Git-154)


