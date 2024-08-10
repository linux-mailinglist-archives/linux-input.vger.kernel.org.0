Return-Path: <linux-input+bounces-5482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D40E594DBAA
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 10:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05DD01C20D9B
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 08:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E80914B942;
	Sat, 10 Aug 2024 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="kabpoGW9"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2061.outbound.protection.outlook.com [40.92.103.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773714A4F3;
	Sat, 10 Aug 2024 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723280036; cv=fail; b=ZBckUYBH8bhW3vA0MbLgBFj8Nvf3jiNJTY3sbgZ0uio4f0qUbBeSWV/YK3m0FyYe30oMh32VUjLBA3IcXxx/+NtEwIFVnWhfhRu5CuDDnV9/87OhTtz9KuZDnA2zZK9MxZQgoejOP16rGO2F65rfBsS4nXAyCby1fh5l0qSafrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723280036; c=relaxed/simple;
	bh=jCr6GauCRcC/9iluikBIxt/ItT4hMTWA3erT2d8Q39Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hFRjT4dm7FlH1SimYhSBGVBbRToBcr+kww/cXbi35mP4sSCjzCM7wx0BV6yN8c+T4UBIeE70kwpWNfI1iO7h/14IgpKKIbG0fJiYiITCyhMUi6Xqp1NL6fKsNVlsKYX2tOspsSIp7nhZnnd3OPXW5EEXBYf2CfXteW89KARwVU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=kabpoGW9; arc=fail smtp.client-ip=40.92.103.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6v7Ev9pnR7QEJPmoBihSivAHhcufgR5nyHTwTUTH2Cecv2DgwV3mOJ415yJ/tCAw9jyyG1AKz4I5TdrRV8GNXb9MOU0TbD8ghEBz37+8/dgB/0yZtYgC5RrcNnw6Uq5FRhgn0MqK5I66uZf9I02JzTht/wlaaRPjJbYm99eT4jyP+IVcmx37qW9IyMhsMXYs8gdI0capUH6ONEmdvtvzcIG6qebqm7rSQQdSgAncdWNkAi695yb/31DFHhHD0mMREftMeLhZFUnLHjcEnBaGsem9vQ2u55c0LTgAVfLVVJBdv9uKJooEuIogCzpre9AYGfp9CUrwEb56I4j1sNy8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bYZgdqTMzmRFsyXfpaWbc4sii2G3oKwpGMkDDNkMys=;
 b=Ys4o+nTu8ddIzdFftGTCeC+wUL45WeaJiizMgfE086UYVHWtJCSBo3DJpml5yZrphkXFwEmKpnwryVyUNOq2L7jE2X/W7IgGQas/4wbRk8Vz2aepQA8ZTdMv21UiBgu2VDqF0mZs2lgNKOMgrpyP5716etg2t+myIfoR9oBuDa3J1xFifewtznG3XjU8uMj8PRSVTpaOxpNpQldsAQ46es1j+Xz9SD9ypo6RwBLoLuarCWkKdlnqLFGbZljtBHQK90Pveo8Ec+bkfRz7Niz+yE0SrXxSU3OR9NnStM1vs+mOn+coX6O9ijQY4ZGyDjIGE5n6FPNJtCfaMue+3+pjVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bYZgdqTMzmRFsyXfpaWbc4sii2G3oKwpGMkDDNkMys=;
 b=kabpoGW9IGsL98KGdGTIBVdDbEVLEXsS41v1D60PdXDzYiG+bMSsA6sivYLlK6Hg2X2LnCzjb5y0rWAgVbjyeXvLfu6Bc/FNKl8QoBhfvjJFiuh8t+j8FghneL6lnKT0ZvHK6r5kGQPmVAX+ATA0iwotHt7lrP7CrkusSewE7Q/qWsF5pw1SY7Eii8xclsHX0x9zN0G/hn+fXKKCW6bOBtRsxI/j00uOKQffiXzPUTm7QfEFMTzrnpJsT4hoxpW0png9Z3Qn5eDLJlOyBGGesHsyLFhmlz07UYG61m5D6IxRzMnLJHuetA8r6j+P2F1dp+N0PdrsVl4lMNgMLOKmew==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MAYP287MB3581.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:149::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.17; Sat, 10 Aug 2024 08:53:45 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:53:45 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH v4 7/10] HID: multitouch: allow specifying if a device is
 direct in a class
Thread-Topic: [PATCH v4 7/10] HID: multitouch: allow specifying if a device is
 direct in a class
Thread-Index: AQHa6wLPmqgonwzl9k6HoZNjtz2XZg==
Date: Sat, 10 Aug 2024 08:53:45 +0000
Message-ID: <92541CE7-0D0A-4B26-B8B5-8F2289336D35@live.com>
References: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
In-Reply-To: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [aJfJCS7KRnFxxpkPu8I2oIVsWTpJKKx3Ksu0aK1nOnfbZXWLZ9mCjqJ7c/0O888HrgpWVPYlWTs=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MAYP287MB3581:EE_
x-ms-office365-filtering-correlation-id: 57b1f3f4-2ff2-4a39-3eb1-08dcb919f185
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|15080799003|8060799006|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 xwfxY6cuz2fe0XbgCLXiSK9AjrKpyaNowt3HFrYG0KxPo0Dw8XLLcFQV+iYI1TiV7h0TnJtFYsoDpcnIkg53Fp9bF5Vj+zBIbj32P7dlWTEoR2Bb+vaRR5Qa8w90KtmViidhTkusWWZLirk+Scx6Evcfdnuclrpixbv6U9Pz+hrhrY/0s/Z2pSJhc3vnazvVw+vqIY5wY+R1Aqf/ycT2Svr7+F6aGOZK+x12k1iGMVBNyFvelvRoYXw+j6av1+tBTo8LygahXKVjYharA/1m9vaOpTBnCeyhgDsJbjmexe80VoceMU9VLPQv8djlLCjs4Cc9XnP7DyYtbYqELgS8+UrzIMcSSlh1mJYq8QWHuOY1iNIn8CtxJvqM/5ZK3BbUNyA08e9AUnWX/TGjIcDc/bwg1+svpmrftU2hXBEbm4I5rei1wpwH8BhtQTOkrMamn5PT/b53SO4r8wm9jHiolJRNCUhJiLWqy9QKrcpIURWT8A7LOIyZt2v8c1B6eMuYgBWie68OI9Ed7sBvhFFZ0GbEJkhRRkG6IAJCf4MjkdU+F1Z+Qp72KjSu5GfW56pW6V0ftiRDiW892CEJMP8FOf8Zm7LzBrpr/C7H9wneezKuDW4YPNJeXPGceRJjjqaTDL68VbRNgVJMZ7VI3auN0/9OJ+nKQ+S6DrhOpv4XaE/lPSyIuQKRzG0+7EI7VYLU
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BSp29S8O2izGcAO7hl9avy5gtFjD1sL40QXno3OCuMLmgNjwmsTinpf2CBJz?=
 =?us-ascii?Q?r0EPL4EHlD9cymD35CN5vjuxLbfnRZ2t0uTNwfZI/c5MTq13COcWpa5BuuR+?=
 =?us-ascii?Q?FW5TJTP8vS5cKycujP0ZIlR1Oheoq/TQgjGCcUelp2nYDV9V1ahiigVtIwUA?=
 =?us-ascii?Q?WCR1SBl9gbOatyItzEuMu+0XIxwAC2N4DUeIlQzJ2FuU29wPCgcwSuMp6V88?=
 =?us-ascii?Q?jFjAjPsbCAYEnDVSg/hJ4HeksjUBpa+GyFKW6pXfGJRtnHHi16F8BDIl8bJ2?=
 =?us-ascii?Q?1IJTDd50tn7JL61Bv9m3bl8P7G3o6UPJaYdWHTWS0z3sttXCqt4Yb5lRa0ov?=
 =?us-ascii?Q?t4Kb/6fPtsbnkuwzVtiUGwZHUXzHlf2lUjQ9PG7bZfX/rc1v8q2hrFI5Li0j?=
 =?us-ascii?Q?lUKo4S/Usg6YtDN69SNdcgJON259o0CmLtxvZ3gUtdu3dHHywK+cXjtp8u3q?=
 =?us-ascii?Q?58gSYTTzdrf6z0aIu3BM1srbKyhyJzMRjKYgKNNO5pygNvbYpunm+wxjrflq?=
 =?us-ascii?Q?Mbye4YA+wgZoxOBnnRCadC5FcKCz71W86ubD1F2WTL9GVgPMUB+XWMtYvY41?=
 =?us-ascii?Q?3SjFHpOKl+aIphTTGdTINgeYzFGNhc4Q63W3K28Q1kEherH86c7B8piun+4l?=
 =?us-ascii?Q?TBzan+gZOUof9U4tcb8DeJJTeqTJbes3sikGJjrJT+r+YRYQ18U2r1eJDGzi?=
 =?us-ascii?Q?gqcUVo4+VXRM80xsgP0bmCbSvuZCHvB9lRW4u9iSuoct6/j8hT0EG+mifLvZ?=
 =?us-ascii?Q?F1lpofRHVikfyXMGl2nhLZVhKvs9ReUnROq9oLOBn6YYoR7RlQk6EPDXOrWF?=
 =?us-ascii?Q?ekd6oUwYIlFJ1PvqSBZ1r9vEZQZj7WPmF4J1g1lIvZwhCwZZ3RBixRLQJy8d?=
 =?us-ascii?Q?x7OcGEffPAaG9w4BCltFB1P/nl0afobNXgswpTGP90DH2Z7+AcUIBN6qtpv0?=
 =?us-ascii?Q?SlK2kQSOX5eBYK1TV4WteL50BseoN4sXrFatMZaVFS3/AuH7MYlctcSz93IU?=
 =?us-ascii?Q?/+YiRYkGjtSY3NY03mGMV4/gz5WPg6sIkM/Pt9niDQVeYBg7hQ+td24kPkcy?=
 =?us-ascii?Q?ANgF0qUAmrVD353HP5jyjvltuGEsnRLoAMqWDKSmMIpvVW9gKGLoUzjlGO1T?=
 =?us-ascii?Q?ETVQHqyShsOBEyOiHyBv2Y3Ie8+Ry2n9gTbGkrxcZwaXmk5GkpR3BRqE8vFh?=
 =?us-ascii?Q?ZAos4B8SKJ9VArvENHHti1Q2iMOEpNG5r6hBiNBCvEl4yb7WqTg9m6tMKnBk?=
 =?us-ascii?Q?r2YauJFhkWJlfB9yk639vmtL4NssfPaA0h61ita6NVf89MUdkMLekAD8Vq8N?=
 =?us-ascii?Q?APnI+P0lRhFx12780Ut9QROl?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1C2FAF4C88D9774385AA1F540DF0151E@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b1f3f4-2ff2-4a39-3eb1-08dcb919f185
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 08:53:45.6602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3581

From: Kerem Karabay <kekrby@gmail.com>

Currently the driver determines the device type based on the
application, but this value is not reliable on Apple Touch Bars, where
the application is HID_DG_TOUCHPAD even though the devices are direct,
so allow setting it in classes.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 60b675cd1..2948fbcbc 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -146,6 +146,7 @@ struct mt_class {
 	__s32 sn_height;	/* Signal/noise ratio for height events */
 	__s32 sn_pressure;	/* Signal/noise ratio for pressure events */
 	__u8 maxcontacts;
+	bool is_direct;	/* true for touchscreens */
 	bool is_indirect;	/* true for touchpads */
 	bool export_all_inputs;	/* do not ignore mouse, keyboards, etc... */
 };
@@ -563,13 +564,13 @@ static struct mt_application *mt_allocate_application=
(struct mt_device *td,
 	mt_application->application =3D application;
 	INIT_LIST_HEAD(&mt_application->mt_usages);
=20
-	if (application =3D=3D HID_DG_TOUCHSCREEN)
+	if (application =3D=3D HID_DG_TOUCHSCREEN && !td->mtclass.is_indirect)
 		mt_application->mt_flags |=3D INPUT_MT_DIRECT;
=20
 	/*
 	 * Model touchscreens providing buttons as touchpads.
 	 */
-	if (application =3D=3D HID_DG_TOUCHPAD) {
+	if (application =3D=3D HID_DG_TOUCHPAD && !td->mtclass.is_direct) {
 		mt_application->mt_flags |=3D INPUT_MT_POINTER;
 		td->inputmode_value =3D MT_INPUTMODE_TOUCHPAD;
 	}
@@ -1317,6 +1318,9 @@ static int mt_touch_input_configured(struct hid_devic=
e *hdev,
 	if (td->serial_maybe)
 		mt_post_parse_default_settings(td, app);
=20
+	if (cls->is_direct)
+		app->mt_flags |=3D INPUT_MT_DIRECT;
+
 	if (cls->is_indirect)
 		app->mt_flags |=3D INPUT_MT_POINTER;
=20
--=20
2.43.0


