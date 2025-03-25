Return-Path: <linux-input+bounces-11894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3EA9518B
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 15:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CC561890F66
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 13:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CBC266B75;
	Mon, 21 Apr 2025 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="uhy40Xm0"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430F4266B56;
	Mon, 21 Apr 2025 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241721; cv=fail; b=VeUI3zZIFeM3Ey4yDESUbBnBKxd5Tjm6IspaJFoky5upGiZT/DqzM47UzT7JpgdKXtIfLuP89FpWO/Hyci9CvpntdlSXk1MzkeVV7aRSiT+XKV/y3HxCAUXdyafexjlQYfubSIsKhUk3zW/SF8BxXtMbfZ0R8wjpesexAzvgsH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241721; c=relaxed/simple;
	bh=8/uMRBh3mK796+LKtfMh2T6yfdl7GLGGRlyEhsLeeyo=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=Y1vkODBINCM5B0q5EXMmtRLRk8MtKeNmWLeSykUv9q34OFuXLE5Q4OQGDzhNvFupdVePdxrC38uN2+xrhqbrjOsP3urtB78XN+kxUo8zDkSdUS5JIwYW9oCN4QGqkSEMMZgFQLJhsr5lLbcYv0ESi2f5FXnj6lEAteF2bzJQUzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=uhy40Xm0; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdqSUW5PEI7JWyReQ1LOj/wSJyQz8ZjHxspEQAgVaCvt3yW59L+auxwJ10PINMGl+lwWo8Pj5DwlDVaQ+D8BGVBybPy0q1R3A9BCEwKPM6J3wZqVJxiWrEvObI2uM857mkraoEIHwwTDyd6jS7Kra7kqf8xWUzT8ViV03IT6Cg9yF+xQC4we2GJaQPTkcPMJfMIFD1J1wClKnpVsmHI+ARUFjEouNSSWpq+MRveH3Zni39vUF3q+y4h+emSz3+uRXK4q1IcBQvJT4xHotT1pKeApGVNIeY83vVskEpjyk3JOT8b02R3Nvdrl8wk7Ny75+QgXtk+K2tdSzOnIKI/pRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYYHBv15Cr/EVMsakWkXkgVhCcei5/+8+zGzUiU2emo=;
 b=F8Q03T0Of+ZO6q/hrmIip6bLI/Rq4rQiSHw4FeBdDwtam5X5IjA3J1Bq0SN2EhCxwFwHJOhJLwqWrpL9k2Gzm4+rg89Xba2qrL9htpIKBjf32HY+HH6NdEc6oNDYxHraZP/JhRQIyRzVFJw9FIVeX65f69UEYnLDW/AyRa1JfxUlm3NyyQZdH06kzpdo/meCFRptsOxLYB3fiG/li9/HKVoh1CODdO0H5m05nN5h9qvM5pYkoZ+xK7c6N3AH4QeCJRQoZHjxN1WoW4P1A43VRESfrtqT/4yM66wwlcS9D5qcTjNhTPXU3DIwg2b7ygHFTPun9MMUeY3EcyF1GtBwkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYYHBv15Cr/EVMsakWkXkgVhCcei5/+8+zGzUiU2emo=;
 b=uhy40Xm0QGq6y3fmU1IHFKxU8EmeWk6OOLPwzmPYu7rygqu+Gq0H+2FAKxbQz8hH3cc+UZ7sN/9oVUViXqQ2jua/40FilCKsPF70hn2uVih+tElA3sgR0wyQijy97lv7fsEr6ydJ3gEu1xPy7WClUvQTnIPynYvmXi2fst/VbJXWiCBCRr5YTbEdqPJEMrpl0nD+XTQ/vL9wP5AvjNalIIIlBTwMAOA/fogVOghYIuIgzah9bhFqv5CZ8XX2f+wtyXh+juNeDfDp9LlOAr2aBdXuHLvI7dPbBY3TIxaO2xv4TTRA8niecR3OzsMsu2sQ4sxnoToJiE6gKvHEJQlCuA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNXPR01MB7289.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 13:21:54 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:21:54 +0000
Message-ID:
 <PN3PR01MB95971FBCC7D26D6D5ABEEAA0B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
References: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 25 Mar 2025 17:57:28 +0000
Subject: [PATCH RESEND v2 5/5] HID: multitouch: add device ID for Apple Touch
 Bar
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <bentiss@kernel.org>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::6) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <a2da0ea4adc44ff8a997b9184da48c866cbc454b.1745241627.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNXPR01MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: ae71da35-0b6d-4554-68d6-08dd80d77c0a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|7092599003|461199028|15080799006|5072599009|41001999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YkkDZhT2cztZEK1xftzuUBcUBn1qyF4OFSPP7d8f/rkxQmkPKBJCnaL7/RsJ?=
 =?us-ascii?Q?clQjjmjngy0mdVmqQlxwpUXZHMOgmjRe5jgr5iMIj9Zn54R5zIAUQCN4sS+T?=
 =?us-ascii?Q?jE4eXsct9kujmC7uLyAL7OKsXe8M7mp9eM3453NcRmwxX2Hih9OH2QmrI+6I?=
 =?us-ascii?Q?8WyIQkX9jFY+dNMtjXyfG/UjDwBiJOjS56nLHP08IMXEwDbezfoj08BBgpGu?=
 =?us-ascii?Q?iM31rPe9hwMq2uksHIX7y8S23tIlPss5omiPR4Zm0gYgcWGd4rhGyLQeBMDL?=
 =?us-ascii?Q?doX2CNGGrS5DbBW73XH2mre9tqHrqUdGU25AtBNIFhaUb7u+lqlWGMegoIG7?=
 =?us-ascii?Q?zjt4NBG2VbuedHCGiS5wVP4izc/JycoHcy/KsYlmfW/uro7c4lrWd8VGsB4d?=
 =?us-ascii?Q?+haIrAgOa2SWC+LdEasYpSCRi+JFuawaw/i6KFRUafWQLfZh9imZULdyGPNg?=
 =?us-ascii?Q?qS55nlSXuOufrJyxKSi+44IREbuZhEbIpjgQ5jwvBHK6EKXptr4s6DkPWu+G?=
 =?us-ascii?Q?Z5c/1GAuLeHTfabd+MeOqNGavIATnF5J+PSftMCub9ufSn5+9yCQ2xXr4IKQ?=
 =?us-ascii?Q?a8ClVDJvW+747GK4uU/ugtf3Z8cdZYNhuhl6voSpKneCeJ5g+o/jUYvkVfPN?=
 =?us-ascii?Q?UOWocUuhYk3wI7UHC0akKTpjK8cMie3sXU6SOnexJsWAnuULBKRz59OXYsju?=
 =?us-ascii?Q?SW0XeDp9/8NzJ06DZlxIwZWcAAWg8RnWzLJsw45HarBK9IfA0L0D6rqgWXbR?=
 =?us-ascii?Q?+gQ+suyNc6oFa0lnxYjIDZasQDHvG5/Y4q6LlW6T1ZQJhuyFWK+Ust0fErZZ?=
 =?us-ascii?Q?2BV1pmw3/Z85/nRsZkhZN0IzryIDvC7T+OYLYO0ukhFB33kNNpud1grWMB9B?=
 =?us-ascii?Q?AbbwkTmnbH2CPQXoBUJFV2v3ZdJ8IPYzMYcQL22YiD1BhJzEPlvovodBHxfj?=
 =?us-ascii?Q?glhJLzinTh9ICCtrOLTY9M7wMgYEUfl3ONoU9DAOS30JFXePqMUuZrRa6zM2?=
 =?us-ascii?Q?n3mael9DlirYWc2DwBzxrkNOo77PiXGT1VUome9DO4EVw98ezAO+ChY0UrMy?=
 =?us-ascii?Q?v7X+Ov4VAw1gi/3E3kJdgo0c5omWnhWWacVnefq23yyappTHsTiZISbVNt5K?=
 =?us-ascii?Q?s2nlucSY2rxAVlQxXNCmTu0qttrXzeBxGQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IsL9Bwca5cJa5a9oyWEXxzeqtOsvaIp96lE/kZR7jfaZA/e8L85LiroOw+eh?=
 =?us-ascii?Q?mKR8TGXShws7RHiuco1dU72Gi+55qzG105PVJuI0k9DumQejdvwzPOJzEZ7q?=
 =?us-ascii?Q?zhoCH7NAEo0k0XL0sdHciV1Zjz+yFjowdvZnT+56rT/jrEuW9R+EjmA1UU5N?=
 =?us-ascii?Q?tmFR3PuZx5DZRc2Rvv4okE631izTz9YpwsI9KBprgZMPe2Ez4yjrA9+kcQsf?=
 =?us-ascii?Q?MFCyfcBGI2c49fN/M+/UWqni1tZl6vswVdocIgD4rVEUGx3BxzRJ6K1iUt5X?=
 =?us-ascii?Q?4k54dYNOxWgPyugiclpoN+dkcBh3nyx6VsyVrzySybuIGyVWav2iyYsRr689?=
 =?us-ascii?Q?jMqyA3guhi3d6oMuq4aV3++pn2vhgi/sBsueAcOoLoxH2UuslnqC9XZSW+DG?=
 =?us-ascii?Q?Ibd3ijS657XMP+iFCt1FoBLWvU1rpf1JmRKQfi2pDFOtSD52Ge/P9+ub4Xoi?=
 =?us-ascii?Q?Ebd+7f0ft8E8NY/OxrudalCmy6llsgXhQnEBDmDVo1vg6uvZmnfzJRNHXH6Q?=
 =?us-ascii?Q?wLNuynUQNvtyGq2RS3KEaPqjvv1eTGmfAkRYS5M1QdOEddyoTRlrIkaaFbm3?=
 =?us-ascii?Q?YIWO8qFPMHpTsgOMER5mFkQJ+sD3+MCR5qVa6lrlHDySLejyZgCmcxnGCa2M?=
 =?us-ascii?Q?O+jfVwxktlg0GQLFi6Nkjt30IR1JPV0HQ8w+D5KdAKRfrVKlfzj0lPo8g1Y2?=
 =?us-ascii?Q?iIwNVI3AetuNgPvGDwA3zcmUVZJESZJmDJwv0HsnsaJQHbn4x8R9Y5yDQe3q?=
 =?us-ascii?Q?xmk/BaxY8wPfNJwhdNyp9DSvBqB8HCwaGU20o/bppPHgI2MWy5085q1zxeWi?=
 =?us-ascii?Q?YKkLXXYjz/7W4vb02dlIHM1HmU3OxmqN0iBYfL2Ha5rKwf9FJXG9LADKp/un?=
 =?us-ascii?Q?OcVJZJgAMbj7D9yXNqRipBfTaAQwgms72kzI8kbzNDppE/oKgvigbVrThmes?=
 =?us-ascii?Q?fP2X/UdQqLXJpiGHRdoA7YIJermjbZ7GwNhd6tgHYX/nUxrjU0agBr9XouCo?=
 =?us-ascii?Q?85nL1losAQU8lIFGccTrGC+ybAlG++BZQZok7DCIw2h8uUcQV8K6pZORs2k+?=
 =?us-ascii?Q?DcpNzT7ayj77tJewMUuhiyioMlB+nrLn0F3XlzcmW7T/FsN4TZBtT0gf4Ue0?=
 =?us-ascii?Q?gEWZi9LEilELkkphCc8U3aP9PzCk9XGHlVcFsoT9F+6wnfentcxzydvVVlCc?=
 =?us-ascii?Q?WFxnJ07PrmDh3uR/I1gzuiHhA1N04EZXMCeB5VQhsAwhxuEBgnCLVY24qRw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ae71da35-0b6d-4554-68d6-08dd80d77c0a
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:21:54.5682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7289

From: Kerem Karabay <kekrby@gmail.com>

This patch adds the device ID of Apple Touch Bar found on x86 MacBook Pros
to the hid-multitouch driver.

Note that this is device ID is for T2 Macs. Testing on T1 Macs would be
appreciated.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a50325270..403f4517f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -769,6 +769,7 @@ config HID_MULTITOUCH
 	  Say Y here if you have one of the following devices:
 	  - 3M PCT touch screens
 	  - ActionStar dual touch panels
+	  - Apple Touch Bar on x86 MacBook Pros
 	  - Atmel panels
 	  - Cando dual touch panels
 	  - Chunghwa panels
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 66e33a482..41d206f80 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -221,6 +221,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_APPLE_TOUCHBAR			0x0114
 #define MT_CLS_SIS				0x0457
 
 #define MT_DEFAULT_MAXCONTACT	10
@@ -406,6 +407,12 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name = MT_CLS_APPLE_TOUCHBAR,
+		.quirks = MT_QUIRK_HOVERING |
+			MT_QUIRK_SLOT_IS_CONTACTID_MINUS_ONE |
+			MT_QUIRK_APPLE_TOUCHBAR,
+		.maxcontacts = 11,
+	},
 	{ .name = MT_CLS_SIS,
 		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
 			MT_QUIRK_ALWAYS_VALID |
@@ -1858,6 +1865,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret != 0)
 		return ret;
 
+	if (mtclass->name == MT_CLS_APPLE_TOUCHBAR &&
+	    !hid_find_field(hdev, HID_INPUT_REPORT,
+			    HID_DG_TOUCHPAD, HID_DG_TRANSDUCER_INDEX))
+		return -ENODEV;
+
 	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
 		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
 
@@ -2339,6 +2351,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_XIROKU,
 			USB_DEVICE_ID_XIROKU_CSR2) },
 
+	/* Apple Touch Bar */
+	{ .driver_data = MT_CLS_APPLE_TOUCHBAR,
+		HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+			USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
+
 	/* Google MT devices */
 	{ .driver_data = MT_CLS_GOOGLE,
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
-- 
2.49.0


