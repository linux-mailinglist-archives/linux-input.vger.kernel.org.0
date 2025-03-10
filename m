Return-Path: <linux-input+bounces-10677-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D44A58F20
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 10:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F9E9188FA28
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 09:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BE121422E;
	Mon, 10 Mar 2025 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="vKkH1b2u"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011036.outbound.protection.outlook.com [52.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C12170826;
	Mon, 10 Mar 2025 09:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597966; cv=fail; b=FksjEYHIGXEcVmsZuD/LKTau3Uv7sVLMm+Dsn5S7OuvNLICij6GCPQ9cLTII5pjOdmdky63TbjelNTitmdzmkvCXeab4ZR2Tr8fpDdvlX94y6ico/rBsbPWfOe6wpMhtrDdnKqu4bMca2a97C/nF6SMigl3aiZaSOkO+v3mZXGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597966; c=relaxed/simple;
	bh=Hd6y0t7ybwlnGFKggZ0+d1s87oGPE1rRMDOzDiMCMXc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IDjfi5vT2cSL9uQnnwShGcPmUdkef9h3FQ1Vz6jx3KoYk4lnYRv1HJWDBOoNth30ByVWBJ+FuubAApTSQ46SysIlC3QYrfIR3t5oM6lDL/4hgqPBqXzpBXjaJ//PuPT9t2MUyCPirub41GkRK3S3Uv9bdStwYnNvyjnDzRLe8mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=vKkH1b2u; arc=fail smtp.client-ip=52.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxAgG5ncGc/ngURwz+rEAzhCqQyLvunEByBm6hM6BjlF1gBMiHBlFw5f+D8yFTZw2W6o9yYf9wBKh+r+fcnqVgwwOkQmZ8ktie4aJLn6RdYrPrdD9IHGcvXIa2/D7Ynbli7C3DrBLhXFMHMju/yTCGzQRTBy2re4DtqldKZTkmthzp28daw5Kw/awdrA/P363Lhe25qHrcaECCKcQNyDgoBIa6erjhXwpZJsAQv7L9F0z1sXAtqHF5HJ0kUhCHM5jFOaZb/OiBeMtQkdMVIHcLpa3LWqjm1J+rPvf4oJOaontlZYlOr6MC8uoH30p/B/R5/Lssxp8gkAe9e3qREG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74JDL78FFxPmkNw5CBr/tGtgziCBGn5Q7VmZhATL5CM=;
 b=BPcefS3SP7yEevj+mzXBc5ylxE9sBJ4YFeFPgwkDIwuRH8NPvHIoXjzPNwJswH16WLP4TISdW8Garhofi2YC082mX95PmGOFXZwRd3xun33fo/MYSpXkdtCULufQpSksNw/EzUz642/hnteODy5MBLjbeZ4eGrfWY8FTchn4zYigQgRHWS3RleZ34c3Y/pzf/2irN8O23aqwii6VsVwWkYrDWZs/ncnZRFUaD2IK5DFSOI1roJx5dcIpde7XdikQsQbpUmfBQvayiAS4JWLi4iYLfhnoeBXLOLnBTkrBn95Vl+wYDkm/Xp2mKws4AfBSzvlv0jFy28Gj0steTkssbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74JDL78FFxPmkNw5CBr/tGtgziCBGn5Q7VmZhATL5CM=;
 b=vKkH1b2ugy1qT33Gl2aZOMhRs5FVrW+taWCGAQEWWUk58s9WWFobdXuOqlulgP+DctOpCIxHdWJ9IkEGVirtJUS7V83h0qeEyGQFdba8ktgmzneadBYhhR08gYAaMpqT5QJHcxCG1OtjKjLm2ePyvrA+15cX1afw+/yk4cg93xuaIyZg8pO1gz+Sajk8RPRjkd/toqzvQto4LWue89m+ILYEHS0bhhH8WxCJqeNJabap3CnS8VMC3vgFA0+HV38ZHuZ7UVLVjHKc8F/mxsLyLwXLF9XstMqW4u+FO4y82uMGGpYeLwQ66eVi4kJQK3xecI0VsHEv74xTgOxlE0or5Q==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAYPR01MB10587.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 09:12:37 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 09:12:37 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND 2/5] HID: multitouch: support getting the tip state
 from HID_DG_TOUCH fields in Apple Touch Bar
Thread-Topic: [PATCH RESEND 2/5] HID: multitouch: support getting the tip
 state from HID_DG_TOUCH fields in Apple Touch Bar
Thread-Index: AQHbkZyR09yrvivHAU+hr8BQkrWIYQ==
Date: Mon, 10 Mar 2025 09:12:37 +0000
Message-ID: <0699DD36-24C5-4859-85BF-75480B87128F@live.com>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
In-Reply-To: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAYPR01MB10587:EE_
x-ms-office365-filtering-correlation-id: 89a5e1cf-a026-42e0-5512-08dd5fb3b389
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|461199028|15080799006|19110799003|8060799006|8062599003|41001999003|440099028|102099032|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CEf/Uscj3XroRPIea890KzTP+BqPNTT+u532gC9kkU33Cz1ZvOhcKBHO6Px5?=
 =?us-ascii?Q?i+erWh6SuRQb3X09+Lp3YzB5zfRTPDvx+HfaNtlBaM0lKaBb+aspD7skTrCM?=
 =?us-ascii?Q?TPKoC5/0rjMP2zmQfjUobqUYRGgUFQVst6p+Pz0DBFz70xgPCwbOGLBKIugw?=
 =?us-ascii?Q?6d1r1qadAkKBKbo/f/4Xe/ywwi3bQzA5wlftI6nodyBmvVnUM07WZQ3VCZJg?=
 =?us-ascii?Q?/Kc6JAQIc1GGWXAad5tkTcmVUbs/kna2Jwsv1boBURtDI7Hhm43lFzGuS/MO?=
 =?us-ascii?Q?xfJSRTfHaFmpY1qbupMsYxNdzqJnM6NTM17zPtuFD2wxgCzwcQ6W6NbUrUaB?=
 =?us-ascii?Q?tnrRv7iMMwy8VVVSAsjK5X0iFKkJds+2JWFjFgIbsRJZArr754K9xf3nASSP?=
 =?us-ascii?Q?US1513TvAEJan8fUEDwtrs64GtWTe5ZSvRck/bF7TvTYA+lOYwOhBlqbLjtv?=
 =?us-ascii?Q?w/Y7BPiO0wYZmbcSyvfpWIQjQ8xpNdy7e+QB3WPRuYDxXOWK6VDjlsjFz/sC?=
 =?us-ascii?Q?U9vg9tsf19a1g0og6A/tn51E5OfknUI700onj+Eo2kdhWvuYSDdRK1uvmkhU?=
 =?us-ascii?Q?vdlB0Mwm4BkTf/3hvoPjFsDbtqVz5R+CdLsENZ7GRhavwTkXiHnfXgUh0002?=
 =?us-ascii?Q?FwdumKcbypOxUesMDyAqBSIzyKFYSg9F1DXxXwPM+eaReyYpFEDaWTlZIKGA?=
 =?us-ascii?Q?51O2y1foX1Qyxz74I9lq4HI2upsVkGFVOETyVYs+rrk8C1bznPkYuF03jrc4?=
 =?us-ascii?Q?oiCxHfcmbHf8oifFqeFT8SicJEicfAfEYkv0IZtFNZs6Z31msMoc3NWvxNep?=
 =?us-ascii?Q?wXhLtK3hjjy4TkS6+7JRUhifElADhgP6l3q80YNCbp57VQCmY3yIbwOnKBBp?=
 =?us-ascii?Q?j/P+bCTnjszh5+R8MVL2a2G6jaZ0qLu8HMppcj2FEwOMr4RB131TOGIhQtLY?=
 =?us-ascii?Q?UAYwbbC3cWe3uKGfs/HEPk9+lmwLOmloRwFKcIyZ5hPwDY4Nut7dgr/XoV6C?=
 =?us-ascii?Q?XS1n42YbXbwB4j0g4n80yW1tlAhJ08g+2hkAV1AF1KA9SCC98wghKpT3GTdy?=
 =?us-ascii?Q?ggW1LqsLK3qkbOYAGfEGDVk2rpErST4TPpWwyDiHRYzUy1TDbOw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gGtc6CVbjAa+k+xaURvQllSlFvG0m6lRExVRcpi8VUCzeDxv+h0T23aFjdsV?=
 =?us-ascii?Q?4k4p8hCzmjv1U4LLI1I48fei7CDJC6/kJ1JHmJOTWFAeF4IFZAeAa5ydkFkk?=
 =?us-ascii?Q?k79yDps7v/rKzPGZMt7mDmq2nFiFyx67Mf9/V3/wAOoL5ksB1LKyr+svM17K?=
 =?us-ascii?Q?4cKHm4Quyxi/xJcUbfmJ2QlcK10p18+4oX6O7266JmaBg1UOFqJfmmSZeBzc?=
 =?us-ascii?Q?Xcq9ZF+ndK15TAX/k02uqc4ch/WzeBForqWworkWt/I0kcsa03xgZ8ru9YVy?=
 =?us-ascii?Q?ndiooNgTgd7UXLnBPcD8n4bUd2/xiHVkiM6S5xkHSiqGtB0kdQMxkdPf8O64?=
 =?us-ascii?Q?etaVmHXOxXebJueO1mhMp9SIj2+0ul+SVUBmmvZA+L4vbL6tPNOVXxcUvQXk?=
 =?us-ascii?Q?4XLO0p4GU5Ta3djQC1MCmmL2IT+fR5aAvgLfAmfMigQeOS/wmVnq6MXbiAp5?=
 =?us-ascii?Q?1XJCWsKQgPz5JmbdLRJBYJJrhmCXYtTsDz3Or2h2bE+kqc+PsI/Fy6TVxeQe?=
 =?us-ascii?Q?KtOInd1vIgFNfuj76QMZwBCqMyhvqkggeETNbmymLTI4SKcoo0p3xIr5hMx2?=
 =?us-ascii?Q?eUDOGipRFKwt9rZ4FCiwf/pPikZhfEHf3bD9xIig2Dgh0jZ2KwwbhWNgaQNI?=
 =?us-ascii?Q?GN6UhRzRw6/Go7a0lbd2b9p/ipBnPRYKUUfGxPciKRud7H/8+Ts6dXIb6GGl?=
 =?us-ascii?Q?N3jieL4vjCHY6fG9xyle/mLx7VKajwPiWOLw8uidfIRFxvdzUoMGZ6NKdnVi?=
 =?us-ascii?Q?IVuoIhc+GCb+tUzWw/kxUrmhenKps2185/r2zRmYs73T+ktGVoHiUIOMdH0S?=
 =?us-ascii?Q?5gZf03GtvVZQWsEjzfvDnSLIH0xf5RIkXKroD+Nfojjb9gqfXcVxW7eccKu3?=
 =?us-ascii?Q?IROfy31ar+j4/9qIO6/RIoVxUyL8ZgY6ND01oDmSnKYjmOdQH2dEuRYk5tGT?=
 =?us-ascii?Q?Qx7PmRC1Kv4fGTBIpM2BEgg90sNY5xItzCBPlLMuqs4C/ioMWhOr9uGU67Db?=
 =?us-ascii?Q?Wkv0h4gL3d6JNGqI8GFr90JO1nU0XCIshVi2eMRqDeYltGFYVaaEGo9Prai5?=
 =?us-ascii?Q?VGK6DSCyVgaDHlJkzc7FoSUx/h6eJOFyrPvoUSS/0VLBlHsVEyUdlM08p8XP?=
 =?us-ascii?Q?/cbbWXVE3MCfbhphEeIW7BQnj1E0C2CGiReV6c3BD6P1xS++7rf7KgenR3/d?=
 =?us-ascii?Q?SdQeQMglCH0NsSnz9DE8EyVPHk86gpXrmsksl/UijHfPci3XyPjeR+uEZqs2?=
 =?us-ascii?Q?wtixu/VELQF9ztG/NeMe?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1C5914A3117585449ECC60BC8227CEAD@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a5e1cf-a026-42e0-5512-08dd5fb3b389
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 09:12:37.2352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10587

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the tip state is contained in fields with the
HID_DG_TOUCH usage. This feature is gated by a quirk in order to
prevent breaking other devices, see commit c2ef8f21ea8f
("HID: multitouch: add support for trackpads").

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 6e7f34a47..70fdd8cf9 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -827,6 +827,17 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
=20
 			MT_STORE_FIELD(confidence_state);
 			return 1;
+		case HID_DG_TOUCH:
+			/*
+			 * Legacy devices use TIPSWITCH and not TOUCH.
+			 * One special case here is of the Apple Touch Bars.
+			 * In these devices, the tip state is contained in
+			 * fields with the HID_DG_TOUCH usage.
+			 * Let's just ignore this field for other devices.
+			 */
+			if (!(cls->quirks & MT_QUIRK_APPLE_TOUCHBAR))
+				return -1;
+			fallthrough;
 		case HID_DG_TIPSWITCH:
 			if (field->application !=3D HID_GD_SYSTEM_MULTIAXIS)
 				input_set_capability(hi->input,
@@ -897,10 +908,6 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
 		case HID_DG_CONTACTMAX:
 			/* contact max are global to the report */
 			return -1;
-		case HID_DG_TOUCH:
-			/* Legacy devices use TIPSWITCH and not TOUCH.
-			 * Let's just ignore this field. */
-			return -1;
 		}
 		/* let hid-input decide for the others */
 		return 0;
--=20
2.43.0


