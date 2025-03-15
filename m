Return-Path: <linux-input+bounces-10856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88685A62C5C
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 13:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A510F3BBA5B
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 12:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6731F75AC;
	Sat, 15 Mar 2025 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="SK0ixNpC"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010005.outbound.protection.outlook.com [52.103.68.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01FC1F4E37;
	Sat, 15 Mar 2025 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742040927; cv=fail; b=aVh7yFWc0MlbqmsheGEeoCeYsZzOL7X17OaDLkhRgtXjrOD+z9F7Bz8CSBT7tLwJhtyd1Xs0QZNDJsHohKQwC0SF+xuigoTkxH6jTFE+/EfKBZSBQ3wAVr3+5B9vxcXb03iXjaYXxJTc3Oc0Z5ayEI/bpP/eXeOq3Aq0t1Eedho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742040927; c=relaxed/simple;
	bh=+HpEq0QMntHyivhJItvW0Oc2A1RjZwRFNtqXHKpm8kM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FLr1gU+FvbHA2j06E4Uc6ycnsj2ic/yPZFn/8VlpSyG2Dyi1pQ7hYriiTw9Q4tR+5of/jmIgrINL2LOEeOMmcJziQmFijV81cavhqdrRhx7Zxf9FLfOkj6+2JShHHErcchvc55jkjdgnFKPJyt1xoolZPGbgfsAEKs8UrKqJGac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=SK0ixNpC; arc=fail smtp.client-ip=52.103.68.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijd1lU+1/SDOIRBXTO1AZPXXfAV+lqoqMxeQV/gXyXnTCOLdPglnsM9lstM7wpRVozGPXkzX2sxVCLH/79j8im9M6I7d2siZlujCFGgv5ixu+6uferdoGY9NYDPkx1rmYPVzcLoP3+rUBnblPunHOCk0OlsNfy3KzpyVlOUXw7zCsIJ78mQ0RQMHlgZVtg9yUD8Tz2uZFbpk9TAxIvcezPPaxj+lBXqT3/9bFbNJLjFyqfsdfCiszcgM2EQ9FdPB2E/uTtNniGYe56XJGLTTg5Ss9/uJw45rq2q/RDUz1WMlfpO1dkW6sAq95wVZvX186FlJ77p/F4DYtBCFR2gdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBLRe1odI7c8Xvc46BqGyGymcKIFzuV3NwaThi/S3NM=;
 b=Rjaht1Qg+/EG2WM3Uaug4xrUj9UPu2G+wZT/RoBPqrdRRLXuz0Zob4s0y/eIlcxzRkGGCWsYUn4ONCysD22/7Ax0faAEcLDt65x7B4DUhtWHqxm+MGGcBDVmeUbY0tZlDH8er+s+ym5DhudiATzZTpedPZf2+xxuDegjzeDFlpIgE8kUOaagNr9CvzN6gl+6FNrMfSo/tUDadWbjaeNg+rw9Ou/vx5oLG4aFoOvIjPcallLqdvdrKlP+JBgV3XvgmB20XGM/CZ5LasnugmJrPC4UupTOj0XE6tXO6YdPWUxXn49Ap6RJQx2vbsi4dj8MB1MVEGo3GRsCSGS7W4L0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBLRe1odI7c8Xvc46BqGyGymcKIFzuV3NwaThi/S3NM=;
 b=SK0ixNpCcYT+fuj4/jOR0770tcPl6q5q/8SswcBLZBTfi9/J99t2DHnt1WDDJtpHvdAdUL90tCuRZEFDWbsREYayq0fgiW7O1eFnvGnjFPIOgq+K04D9be91QjlbMGWaODyxaAgmaGXow1lNBDHiVqvtimArf1YxCXFLUPueYplZFA8cJgooAKkr8kfT63c8T5Na6L+wHP+nYKTV5MPx8aQFWrxU6utcKJwjU0zndLwMwT9RsjEHgoX0r8PsvOQdaLeyjZop0ckAmB1tI6ZcjR/sS8Nb/wpS1MHuAq93JGOI6rbxXPE7FFG6b6qRSFJJc7NTw59fSVVliukBc29jsA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PPFA5D857650.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::1c3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Sat, 15 Mar
 2025 12:15:20 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.025; Sat, 15 Mar 2025
 12:15:20 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH] HID: quirks: Add HID_QUIRK_IGNORE_MOUSE quirk
Thread-Topic: [PATCH] HID: quirks: Add HID_QUIRK_IGNORE_MOUSE quirk
Thread-Index: AQHblaPrvblGKSYYd0mdHJI74Dg9zg==
Date: Sat, 15 Mar 2025 12:15:20 +0000
Message-ID: <1168B1D0-BCF7-467F-9850-A6CB48E6914F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PPFA5D857650:EE_
x-ms-office365-filtering-correlation-id: 5d527dd5-5257-4dfa-4491-08dd63bb0e34
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|461199028|15080799006|19110799003|7092599003|8060799006|41001999003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TTEMZ0IF8IdAI4Vdys1r3qJ5OBPhJWtTk6yVUrSeQu5EyYt3i31E2JCaYuAS?=
 =?us-ascii?Q?ZqUiL7WBCWsXdyW+rf+IY28Wo+iQXFP6qnYXu26A1toZ5xNIdArdnRXK6Y3g?=
 =?us-ascii?Q?mpK7ra47GbF/dh4MugMQu4lmK8vv8evuOr8RC+3geoTjhNCp/SRoejCpwc4Y?=
 =?us-ascii?Q?gIULPODig+cd8UnrZL6ZCTHKbvyUISQ2PklIpsPio1y+XYnn7lTpj2gV3QHS?=
 =?us-ascii?Q?Ejvn8VrKHKRIvdVKrjN6RaE3yjBcZ2nck+Nw0x579mX4Qhghuu7I+ZyofbB4?=
 =?us-ascii?Q?lPGZOXU+ibXLwUk9XLJ+OLO7C2fB9Zm/GJ6/q1l6ipOHf8NkKT5jwtXc3mIS?=
 =?us-ascii?Q?MhSd6eH/Rvw8bcd5q6vZCwR0vxjQUC2igdhkmoK1XRrT8jXrMpHI8nXOoixm?=
 =?us-ascii?Q?qivkA+7F6Dq6dmanMDvPU7xFIK0BtTziYt1vqZGCXix/aqUenJut09/t7HG/?=
 =?us-ascii?Q?r2FvY7LEDHKGCHZ5mwOCHrvaT/KpvQNjfDYKPJtUqNqfgSNyx8GBWcIUoKeo?=
 =?us-ascii?Q?cdK1/TNWj1/TbIT3CJmoRDDIVRrAPYzW6XTQK2Raedxb1+kTjCT2+1xrzXdR?=
 =?us-ascii?Q?QxE2fMS5bVYel9GPcp/fttSIpTf0GeiE73O86FIBUDjquy/ezGhR5ZCqXt1K?=
 =?us-ascii?Q?PgPLusWSeDLZBtXNrzZiDCzKieMVNwkw4sOO6PjNv1nNbWFS9gwj2zxzdsvA?=
 =?us-ascii?Q?4b1Z3FHRJmxjZBBN1VI6+0EqKMvcH+0VpjR2p+WMUiC/fHoQ8RS82vFmEOdH?=
 =?us-ascii?Q?6GYIBrUkG/qBJCSs2yg08asxX4EIXFvnzBZ739wxFdp+uU9X2CVXzKaUE0VG?=
 =?us-ascii?Q?4gY5v11j8+hdFdK6XS8Go8e9KBuxsnXx9YoRovgDjlD+3h+PJRpuOwf/RFHi?=
 =?us-ascii?Q?m1yMJBIwXMHTiZ5KSSuPLqBnZZ9RS06BHhpbG/JE2BJg89kOFsMYXf16mojy?=
 =?us-ascii?Q?khgc6LGMltNq8OjHbbs/Tkmi3YILw12oggIxMfQWRq5p12yyJD52O55Nu+2t?=
 =?us-ascii?Q?0eVyv5Rp0Wceo/DCSC3GSKGp17/t/34GIrRS5Yeknn4IiGxGK2QUozTpZkFk?=
 =?us-ascii?Q?ovFformfN4J3ZHUadbl1I2sy4kbPvhFGiVDd9rs86Za6WNxdlpT3F2HnFmu6?=
 =?us-ascii?Q?KCkNwpJytHPFUo2KrE7ntjOh04hbjdmydQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6hzPcl6Wi3qck5ZlHWjj+bMktmQPzbvcEEiP4WsthdGXMGX1lNrObVV+Tjec?=
 =?us-ascii?Q?PP3U6ipMdelxxHTeoDCa9WQyq6cnEclLG0bCgoA4X2pBUO2UY/xPsMjax2Ly?=
 =?us-ascii?Q?DTZ1vOtlvpZpEUrhBwBoDW9owqtm5buWAKGJiQDRN4uuav7hs6je14Tqh7Eq?=
 =?us-ascii?Q?z47DIDuQLFx/LRtxRF5FdLIt74wTuU4rdmimVLz8zXXrUhuuG4pIPES7ue42?=
 =?us-ascii?Q?2k7vgQ7mQnB+0BGgkt/8LSKb4pR5F2YeuolusGNM+U68od3/4xUsAo5c2+Ir?=
 =?us-ascii?Q?Ywei7//x556IYosA9vN9kVzwK/g870Y08sM9kJ3Lk5qqowtlaLPm9wCmUaVn?=
 =?us-ascii?Q?TGc5498vW0ubEBuz6f0yCRfQcCZXP87pk9nKartYsSZAhdDeFQlmrzSs9TC0?=
 =?us-ascii?Q?3akoxVxOJNEF3Li7+5bVWvUCBsxvErzu+xpKCSNvgMK7ppPTrMa+ZA+FiMCw?=
 =?us-ascii?Q?RmcVYfPeQXUNrcLlcBMKf4h7COojs0FguE6JhGHyFnxj93nmieR1AeUg7SiW?=
 =?us-ascii?Q?52acgAJD8XpikBdODOG24vtrDYN7u+66y3mrPHs2PuTvV6ve9Egc4yUqsAsl?=
 =?us-ascii?Q?jxDOZyV+IHMUQvx6c5rwS6vHQxlz7VNA572a2L9fGtqtVKJD16gfuxqCYkO4?=
 =?us-ascii?Q?B55BK3W3BeWvP6DUQTJEm21dTwCFO35UrE8FsBObFZg7Zag/sShuZRoiWKLC?=
 =?us-ascii?Q?r36FPR4Pp0IeXZENF25+29u8X419Ta00+TYMmV3nw/2IOHMoXTmwtFtLHSvb?=
 =?us-ascii?Q?ed70H1apTTDN0NWQsiXlS9yTKJLW4afeC0AAPFsVnzzcylOXMpBbkrdg3GVo?=
 =?us-ascii?Q?vUquM77FmzqL2GrMRIwyMBTuuzWQ4mvKGXxE321IcCKfqwV6Ux3lBMwniHc1?=
 =?us-ascii?Q?U0JzlnCySk2Aq0xvnZy/hVFdAKpiX7qfn4pACa0i4zKr8ikm3WUPFg7idSyz?=
 =?us-ascii?Q?REs7IODtkCL+cRrMhOxmvogBd5+qXOSmydGvruJ5LNjPajKMT7GnxN5u43eS?=
 =?us-ascii?Q?9sr2siMiVB7lD3IextX5PPtM4f8Y0RfTduQDWxbrHhZB5oPqhKWZNmi0DnsI?=
 =?us-ascii?Q?vj10OQ4fQvFm9hWf6cW8/rIWDInh6wrsYxIF1T+cW3E/4bVL1j3b1rXSFr+p?=
 =?us-ascii?Q?GJaNIlA1HuXVCZ7z6oZnENiFatHuMzo2623mIYCVoeCZK2GyLIIqhRIEOyau?=
 =?us-ascii?Q?h9HkBJX+LipQu6yULoYNtJjR++9rP5g28n0vxESWS0Fg/FV/U5PgjkeppirF?=
 =?us-ascii?Q?XsPraLyrG0Ys1b2jv2/bPPbBxtxtqhFeo0QxqhSG1iOuMrpTvGTGshnDaV7V?=
 =?us-ascii?Q?tKcTrKem9qsEWH14mt/8Rwdw?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BC31E982EED2C246BCF5D7743614F664@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d527dd5-5257-4dfa-4491-08dd63bb0e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2025 12:15:20.4533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFA5D857650

From: Aditya Garg <gargaditya08@live.com>

Some USB HID mice have drivers both in HID as well as a separate USB
driver. The already existing hid_mouse_ignore_list in hid-quirks manages
this, but is not yet configurable by usbhid.quirks, unlike all others like
hid_ignore_list. Thus in some HID devices, where the vendor provides USB
drivers only for the mouse and lets keyboard handled by the generic hid
drivers, presence of such a quirk prevents the user from compiling hid core
again to add the device to the table.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-quirks.c | 5 ++++-
 include/linux/hid.h      | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 2eb15a7ae..8917fc223 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -1042,7 +1042,7 @@ bool hid_ignore(struct hid_device *hdev)
 	}
=20
 	if (hdev->type =3D=3D HID_TYPE_USBMOUSE &&
-	    hid_match_id(hdev, hid_mouse_ignore_list))
+	    hdev->quirks & HID_QUIRK_IGNORE_MOUSE)
 		return true;
=20
 	return !!hid_match_id(hdev, hid_ignore_list);
@@ -1246,6 +1246,9 @@ static unsigned long hid_gets_squirk(const struct hid=
_device *hdev)
 	if (hid_match_id(hdev, hid_ignore_list))
 		quirks |=3D HID_QUIRK_IGNORE;
=20
+	if (hid_match_id(hdev, hid_mouse_ignore_list))
+		quirks |=3D HID_QUIRK_IGNORE_MOUSE;
+
 	if (hid_match_id(hdev, hid_have_special_driver))
 		quirks |=3D HID_QUIRK_HAVE_SPECIAL_DRIVER;
=20
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 1d54bba08..a00c58c0b 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -355,6 +355,7 @@ struct hid_item {
  * | @HID_QUIRK_INPUT_PER_APP:
  * | @HID_QUIRK_X_INVERT:
  * | @HID_QUIRK_Y_INVERT:
+ * | @HID_QUIRK_IGNORE_MOUSE:
  * | @HID_QUIRK_SKIP_OUTPUT_REPORTS:
  * | @HID_QUIRK_SKIP_OUTPUT_REPORT_ID:
  * | @HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP:
@@ -380,6 +381,7 @@ struct hid_item {
 #define HID_QUIRK_INPUT_PER_APP			BIT(11)
 #define HID_QUIRK_X_INVERT			BIT(12)
 #define HID_QUIRK_Y_INVERT			BIT(13)
+#define HID_QUIRK_IGNORE_MOUSE			BIT(14)
 #define HID_QUIRK_SKIP_OUTPUT_REPORTS		BIT(16)
 #define HID_QUIRK_SKIP_OUTPUT_REPORT_ID		BIT(17)
 #define HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP	BIT(18)
--=20
2.43.0


