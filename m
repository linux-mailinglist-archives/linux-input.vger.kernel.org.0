Return-Path: <linux-input+bounces-5619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D79557A8
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2024 13:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 608C31C20C23
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2024 11:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4805FF507;
	Sat, 17 Aug 2024 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="UrowVdlJ"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2109.outbound.protection.outlook.com [40.92.103.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779CB14AD19;
	Sat, 17 Aug 2024 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723895429; cv=fail; b=Yg0l6Mf4tQXg4tI3phl+sSXBnsWybu8p2rzdAAIZEyCwu/SdsUPHTQgYSaOICwl+D9jhUNTs3BzrbVVMGpwas6y505mPEO8hpMeipWgHDIe7vKv8imbWFfqH2qZsCrKOLH9VLLU2a9N7z/GG0Lrdsh/soKRrAa6pRtk2ijF5TwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723895429; c=relaxed/simple;
	bh=jCr6GauCRcC/9iluikBIxt/ItT4hMTWA3erT2d8Q39Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V7whLy1tELpNN51sJoFVR+JAl+Mo0Wl2skQQbuheN4z5QmiOelQ5dbKFRbjvSXYGVQE7mTxSJi7I34G5tJvI+GJnZY6CI+rFpYgWbIBi72NGBOsT5RRXg0jNgZ7NLQBNdujxasxOCEtOdz2NbV0z2sRQt3JOvJlpOPfpTt2Z2WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=UrowVdlJ; arc=fail smtp.client-ip=40.92.103.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVPL1r8qjkYlhyxw9BkqioOc9ctpaMtSXvx0a5PyS1fU3Npr395sq0Y8Ve83hwFhMzvg3jZOf/mdFKg0ANz291u/eAbUqWIjGUfjv6/f71dnL6QErJ1YSShCq0ktWZIPlBtaelmkzGLnVZSaliuSxHBZB4GixH5kpnpikE6WyvRYIafB0+GkoZwAL11n1W/e4fl0KlfBvpAUyb/r7bf5QMJEjKDLk+2qbjBGSx4IGNXt1Z4Je8THbHwKjzY0ToriuC7f6/tdOD3J8tSyBIK3WOGhbf1A+Ua8pZa1X7ckj1VjS1rYQdHcE5GY1mOEOPIqNLuAYYcD11B17JhIK1e3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bYZgdqTMzmRFsyXfpaWbc4sii2G3oKwpGMkDDNkMys=;
 b=kfmhoYlfS8LgFvPZsbYNykR696Tz8Hb/E4s8zuYTlffpkAzwNak4NZj3+BUbZGbHHlf0a6KCooWhSHAQRpYJuL8wZiya8fE9K23ZPdqlrELQQ2SV5JTepkaNAs35zyLH97zvdDExPGEyRpjJJR7Ksn/8ojN/QopxYzFw8+9JPK/u1i0jt2A2Y67GMFyi1qQ+GXXOJ+Akvb++MYYowW2ajMix6c8YynzX9iCd5Pubq0r1eTxb3BW6ibPS/v4pQ3jC8T6Wie+Xcp0sGUjwFvd4BSgXY6LO8MWsIYtvZ+VlwWimxI5w5c30BnOT6exMIT1zg+376/T/uxvycYkwj3emNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bYZgdqTMzmRFsyXfpaWbc4sii2G3oKwpGMkDDNkMys=;
 b=UrowVdlJSK8ZnIiOGXOxaGJMvYv23JDC8EzBTOJ+xx4SbBD69LUqWW3A6kVM7USAnpgqye7QmqLi/D5DCFPdi9r70/gIp+fXNG5RYxXyzM2tEQf4Q7XnHeak3anyb0D6/nOyLzh8SXJ0e4C8qauijWt3UIF+4ZiCJr6ZtZzHYHVjcXnQ6C+h2QQgQ+VnLFgcbVpNmRjcyN4gyyO7q7WaNci2MnpKLPW2HYLb+DTAF3hQ5n1BtwCyrnLaxF1J1h1fxJoyZ4SUDAJgx8D2JFY/hmF+tH6OORohNUu18NOrEHp0wN8bDKfsy+qhQR5ZUEHmCV8LQZB8/DwpP2v/T2q+Jw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB0120.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.18; Sat, 17 Aug 2024 11:50:18 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:50:18 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	=?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 7/10] HID: multitouch: allow specifying if a device is
 direct in a class
Thread-Topic: [PATCH v5 7/10] HID: multitouch: allow specifying if a device is
 direct in a class
Thread-Index: AQHa8Juh8n5ElnZBdkWDzdlWlxIp2Q==
Date: Sat, 17 Aug 2024 11:50:18 +0000
Message-ID: <013F1B8B-F187-4A9B-9882-0FD174B73860@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
In-Reply-To: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [LwWg1CGZoXqr7mZ1EK/g4gmjsAtg6IBd/sobjkd/95Ng31Y+NfcX+XxAozzC7JRnKqOqZ3xWZFk=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB0120:EE_
x-ms-office365-filtering-correlation-id: a880d336-efe4-4d4d-b606-08dcbeb2c44c
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8060799006|15080799003|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 H1Q85fij9oeXoipeR/uEnt6FV3CT2RrdcLPI5yvBYPoEM0jJ1dJ6K5QgXQzUGokU5OuEylFSBR5cUfjGQ71yANDntyOPaTHBHhZGIq1MFk2HFDZ4V9wcI6JvC6UVFl4oEpFNpPh8KLcvXCaUQu9szIEifrQYfkcy/aAutfFdm6RO4DP79IczNUjI1W843BQJqffanvw5eMDrrq2nYNX84yC4ZWNhWTthP2+1vPLbD4Yvy6dV4NgilN6uZUXnQ2n2lccQAzxVP/IODloCSRNdcEOpbkVOaoTqVpcTNFDCQVRksMS6w+dYQ1owJLwvrAmVSbJA8MhgglcE/KkNhkXtVL//Q0n/Xe2EbWP8Bk0ZeJ1J0kCixZOkszgbEjJUY90Ri5SP9cu0m51ENeSXU8xP+jyPoOSTTbhCVJ8ggYa8nDzxcf2D97IBvh7gyl99tZ5prvLQeqyYVrhWI1yJP54su7WrGXEqPrkuH8fEutIk2i0F464kTYdO3ED9KMsKc3Tg7Gq2+zO+Bb601VYdPxfQL+I6UAHKroRELh2LaO00pVd8M+bJ1uhLxH+Kl5lJnWLMLaOPz+wjOwM9pBEIwswL3NdxdbMGTIw+wh5us45luK7UM+Qqd26CnkUckhq+p2UIXA0RaxDBpe1OdC+A+LiN0VDMcddomxZTTtWN2NWOJiJl4A7MdICoKfRYezhbV9Ye
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yO9GVNNO7Q2IGPiI+cLhcdgHXnj97yWQgDvB88DLaiXsg6cbW6XVg4T1p2?=
 =?iso-8859-1?Q?GOhezbxWREFMMax99Ox0iGWNfksGufm/5G/hGY+5wVVJKcdR9gUtsJYsme?=
 =?iso-8859-1?Q?Rupmz7eGwVMqDaqusHiE0LEdJiL7kQknPYi5zNvGNneXDkuJCMKaTyuXzi?=
 =?iso-8859-1?Q?qgX6sjZRhyZbEt/RjZBhisr/1DuinjurcJqypexhOcoVzW8AIkcKeW63W6?=
 =?iso-8859-1?Q?XKnoL7ehh8DlGJ1XGvX2A4h0gL2B+XRVsql/WrJt4UODe3GapG6duvTs2c?=
 =?iso-8859-1?Q?NphJ79mbARkWSvJMa70hbLzy/9EsFAE15uI4+xeiogCTTdXaPB4LgccXSJ?=
 =?iso-8859-1?Q?rw6JIJRycXAL8CaNFggS28Pi5jOQj5zZSGiY7uipRxNTnAPXNyyzZQN1QY?=
 =?iso-8859-1?Q?DXmVIPP+7QwoTIQtgpMkphrlCCa+sPTV5aIn/ZSOfcVcLiPA7N/A2EM5td?=
 =?iso-8859-1?Q?cSDL+4Pcl8ebE6TS31lWjGqNh2rvR4jbdUaSTazToMpwPAByOIipCd6s0S?=
 =?iso-8859-1?Q?yK0SElTpfJ2gDKfrVnYeRFJCSw7sCNkWB8J/V+9/XrztHf/uHtS9snz3S5?=
 =?iso-8859-1?Q?Pyh4G0lr2myrp/0oJ+2C8uZr3yQkJ61o2ApThzQhq8ofXN9M7LI7DKT1XB?=
 =?iso-8859-1?Q?S/74TQ3UCc+4Alo0PwdAuj9tHcR7MQmrgOiWDiXjlGd6JrfQXWB18JD/hN?=
 =?iso-8859-1?Q?1gwTUlZ9gBSS3b25/90B4BgqQxYwmaxN8Rul+cMTj6U72W0R6WhwSpLvI4?=
 =?iso-8859-1?Q?gTtOGmIve0Hu2E+spBkJYuv9F7bEtCcTCpWBxjNvg6ISYkEAVOqjTOg6Qf?=
 =?iso-8859-1?Q?WA12sxQLS8/TRxFkSsr47uPnPC8+QqBVGKyc5n75M+lSK3qpsGoN7ovtXk?=
 =?iso-8859-1?Q?oUWhcO1KFFpHItlHqSIM5G6I2POYnt75BXw2R3LMmLnD6NB8hFs5POOaZ5?=
 =?iso-8859-1?Q?HYA95p+JTNKVd7E2nmW/5/1vHLSvmF+9ubXixYeb8zY3uBgrDbMi7BBO8b?=
 =?iso-8859-1?Q?MyH967CkwvWDwlDIFX7nV2i7m9NcRCwYPnagRtiBGsFPqPc/uEMpjoPVvb?=
 =?iso-8859-1?Q?1/JanrlUyfaDldk+/KImabu7aqFhLfVQ7dvFZTOXVMlr791MIVms5EhbnG?=
 =?iso-8859-1?Q?kGntM9M5SNhDFsald1WoLKNCbdZ+8Ne5oeo+VxJdOUpuUHP/wvchh9KKxj?=
 =?iso-8859-1?Q?laBpz5Yz76/Mphp1mPI0oT1LWoSWNPlds+HcryuRLQEcNLNR8TnBKbu/b4?=
 =?iso-8859-1?Q?Swuy9qiD2knkE9nV79u4JJmZiHU0Q7VEVUCiS1P9t0yzTP/5Y+LkkdUkKo?=
 =?iso-8859-1?Q?tcUFqRg8I1sksY2Z2MU5l36Xt392hYvUGDu70mtKoyyYWc2RxCXQmkg2mW?=
 =?iso-8859-1?Q?lxIA7hggl9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <174014C2A698AF44AE672D11956C26EA@INDP287.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a880d336-efe4-4d4d-b606-08dcbeb2c44c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:50:18.6311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0120

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


