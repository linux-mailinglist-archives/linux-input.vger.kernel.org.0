Return-Path: <linux-input+bounces-11343-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1ECA74C94
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 15:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8CCB16CBC3
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 14:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485BD21B918;
	Fri, 28 Mar 2025 14:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="jAfwJsJ5"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010008.outbound.protection.outlook.com [52.103.68.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B5421B9C4;
	Fri, 28 Mar 2025 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172019; cv=fail; b=DvQSFn8o2f+wNzULiyh7h4Fj6XO6LtHOuHn7yPO45bCSg7ZFk+uMbDIRHH73/VFBasLCnT1IipDGfBOWry/PrTAS3CBYdnRwT9KkJfu1+fBip7YXZ4yIFzk6/NgRfQGvfjmfXgcUMskH7tvj4wLHUsBzzihwnNwGzTcubYrsnS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172019; c=relaxed/simple;
	bh=4GRrAptYOXIh5D8xjGYTRfzkBuX/XYyBdHgMW453hmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TJ2r4RjEm4i97UbbGWnko8euDCxnbal39ZRsechFD/PAClwvoTFBWODqSIRrbsTx8u/yPMX+rvdLxBjP9Dd47waXCnRfIJ8YScJOw9JwE3vrFlqNoftQi1pO/oGe8h0qLozA6ZN/wB0nvxfu0ZhPalrEgLEnRpW1UllC0Ph2MyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=jAfwJsJ5; arc=fail smtp.client-ip=52.103.68.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnnb56BSJ4PAgT2bupsiU2uCchbYd8ZIn+ZQcE7Uv3AirtxNPCiLyZllq6cFyPxb/eu+dgxMQvYFyuFXsBNRIjUTkcCjq5gcg+VMjy28UP87ZhQvgMS/p8YNadvJYgbaDsAcq9EupS6EdQCg0C9IBFXGmTvwPRWkcBTGFmjPnLnOwgNa78GLmNAxDrPHl3bxt6U1+ncjaBBojQ+w02HWaCrte3WHaHOJYCRKKNAAqc6hWwceyN1JmhWDhrRRCRPOm+dPeBcwWN6Y4ZMjWkRZSVHq4axUBwbxYlUpRdLlIhMPoBmN1xXDUmJkYOld0ACWaF78nUt7ViGvxZbG6idC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mic8xoczLuvnAcXZA3HGUYaPNZVaxjhHyNgf2obqsLk=;
 b=ubquygKXFRPVInf2NnMLHEKNpMPMmdCeZj1ir+WN8n+Y1K6z0juA2s4jdgVyq8ZWcBatIDo0benm9wQrsQBe5+wl3ErnMJRnzUjJ+7qMfQnHtIAGpHSeGAttuIfTZ5nDNxvCjmzvAMCZUFaqL0pRpqCxN4XBCPgIoNxFEj7UaCx3Vs3tz/0ZQB9uYvw55FgPVeHUFzGikHeNLMC6fDnIi1IJYMKZAKUnxpB9asTlgyMoWriHfSOGeieg+wdAEykObkcETNXFF1S88ux6KIwrGVDBBmSwwrLdhLGV1XbJLlpMNJ7yxJfI1F5v90wQoWNrO8K8CD6hdoJ+g5NDHtX2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mic8xoczLuvnAcXZA3HGUYaPNZVaxjhHyNgf2obqsLk=;
 b=jAfwJsJ5TljCv0tQqzq1cecnmEOeQojs2ZYXIXqmtGUrCbyQDFS24zLwQmgjBPKhMSb7pje3KegvntkgMPANl7aTq9Fslj1Y1wGQfASH/qOcoqyqnwxh0zRZSvJl8guG9Bv3F17mwFCYZNaRDHtSrPIW4Pd4R5TV/migJ1XPqHoOCq4RXA8OFsDvANdk66yYw6sJbDQGr5Xv75uiIocUUS7mQdj3TCffPBW9+wJ9H23UWp7M7vfEW/1vfQlIo+54rG5PEQI67DI9uTdx1vnLAsxKsIrsVgQ3HWMMV0/QMajxFwYemsPkePc7pp2Ozc2xytzTb/7yWFdYV5yDstAP4A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9447.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:26:51 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:26:51 +0000
From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Aditya Garg <adityagarg1208@gmail.com>,
	Aditya Garg <gargaditya08@live.com>
Subject: [PATCH v4 5/5] HID: apple: Add Apple Magic Keyboard A3119 USB-C support
Date: Fri, 28 Mar 2025 19:48:27 +0530
Message-ID:
 <PN3PR01MB9597E15D1B5ED64DE45F4343B8A02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328142625.12980-1-gargaditya08@live.com>
References: <20250328142625.12980-1-gargaditya08@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::27) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250328142625.12980-6-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: fa685f2d-ab4b-464a-f423-08dd6e049498
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|19110799003|8060799006|7092599003|5072599009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HT9EygxCnXm6uow2TrxHgtyoeLSt1A6huwU8l4DvOPNWalUHMSkuiDHKdvEF?=
 =?us-ascii?Q?Z+EzPWzoZF1X5yHw9jlMuzpDv+MySYf+BR0SEkiuP9H/Q2D8QWjYVTd8Nh2x?=
 =?us-ascii?Q?HE/xlRgLK7D7a0ZPzZdj2kMTIHRmPV4UGOyTGV036+NefarstWtubQ8ecvU6?=
 =?us-ascii?Q?n2kBBexCdJm5y6QSzPy4UgsNrezz3ma8lUVXTM6m7dwPU9xF9sWZgy3VXFtv?=
 =?us-ascii?Q?Q19CqZovOsYAqrEDPgVRYwy7mlzbAAM3znpEjF76JHt88mxQCMr5LSk4M8xg?=
 =?us-ascii?Q?QW/Jh0mllzenDXqxci4/bJ1ITwwr4ekwlKB37l4TU0k8K/Bbqua5BVkZ8mBF?=
 =?us-ascii?Q?YZnuUbM+5QpPrANCyDFpwhrpAT2R5oNYqkMH1WjxpR9gwawKMiBNReSnfKPF?=
 =?us-ascii?Q?kzV8rieXNu1xrkC8zymvND5CXal4qEeEuUWFGGQ+JEitBzRwEMv4W5J8kYKm?=
 =?us-ascii?Q?N4h5kpO/veI6g4mkGBN+y9AbatoTODvUVMUY+Gel+DUj8ud0iVfWKu+XX7Ov?=
 =?us-ascii?Q?gPvUiv7eSWRln5ONG2UZtpuEcCnaqcuzPu7joEY3KNqPnAZJrc/uVUuCxe0Y?=
 =?us-ascii?Q?KQZosFOpotChlod+fstiyMQHLuCWTdJdnCLS71l36uzJnGmEvtE/rMBpdsyg?=
 =?us-ascii?Q?zoABTJS2UtOQmauMPdM9P3vezOyLa24K2eBuGkBGPvQp0lPyMK5QFfnVYojk?=
 =?us-ascii?Q?c0bBILgzJEAFKnTsNUdMlT/B+gZjy4qv5I3GF38xnBUIsZdKTfmWJ920XkVf?=
 =?us-ascii?Q?zTDIwJevLieTIgPpvR0MPR5RKqCO4V+wW8XzdnkwAzERYpJr9eameZyGAqbY?=
 =?us-ascii?Q?r0wME5ZafUZRX7khfU6tHf8/NDc98DvOqXm5GE343NFVOXK8uVynYkd4goxq?=
 =?us-ascii?Q?e6UoPQsdKzVsZmF/EITy4Wf2vOPWNvFwH6wxa8Gt8Sy6XE/xApJhM8Oi47fE?=
 =?us-ascii?Q?wZbAaMw4uzd6nmw3tmVcG4u3lPrIKDdsHej/QLEuiSMyCJ4MDdReXu46+e6+?=
 =?us-ascii?Q?hssKAigmhF+2f0Q8OMCcQzsdHcEFPFt39zRuIqNeGCoo4knyVigHnlKBFSPj?=
 =?us-ascii?Q?I+ui9b/n9rXJb2lsG3y8fmYfNC5AM8UIUbo000IeEBytBH/IEATxQ+wJqy4p?=
 =?us-ascii?Q?3t7ZR265tplfkQRG1z9nvjkslPYlZH3CGg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J7bBWqMcLW7rdGkgJ8gep1wvmYV81UGP3HxtGWS0vxvaDzrY8c2WRPrZ566u?=
 =?us-ascii?Q?Xont5FesyKz33JrEAW8Y3VHaz+Ytr80H+j1hWe0R18UJScuGafBMrjaUGlrC?=
 =?us-ascii?Q?Af5qV+cbp9Cgc2thiRmEPCdpoxsT9lNFZN+1JCE/8j8IJAJzM/YcG7D7Me4W?=
 =?us-ascii?Q?Uhy2BiOFWLBujw6yMzpabvmKbkffBMy05kKBhV8F6hkLQene9yI9LnU7EDeL?=
 =?us-ascii?Q?L+pYFf5RR0wQF9oOY++AIglb1NWAFtWX3xpbiKsha18uZHdnmiNIprh8OBYJ?=
 =?us-ascii?Q?K/C+0otXRTFxrS5LAsDlpkDdk5mfH2u5TutaMf+pS3u7OOtgKl+r6TXo+X7N?=
 =?us-ascii?Q?gqiQ2GpUwFT+1dnxv8z8omOFrXRDuKDmbAc1FbZ2QHkbjDI+/4vQv5qwOlJd?=
 =?us-ascii?Q?GMv3uxU03MRTAhfTzKhePnMoeoqQPEkn3Nt+7asPuvS6AO36pZSmGDG6WdTR?=
 =?us-ascii?Q?ggsvG7MdnprIukopbKanHq8z3GpaXBfBlJKMG2WVy/8rHTq67tZup5JEh9x7?=
 =?us-ascii?Q?9WrKXBEQZo3/ptNwZ8CkMNSki8Davy8DE8SUm7E73kIY9Hfzg0ivhS7ycuqj?=
 =?us-ascii?Q?1fQDqCV7zT3dGrxfuYs5Y29lcoC1e7m1FgAg8VoOijzrN8aT7XS93mKjE52C?=
 =?us-ascii?Q?/G8rPKdtFv013iBtsqzvCJatQkVoWp0aRx3qwcuAUyyZQV6N38WW5Lr14MyF?=
 =?us-ascii?Q?Eu0G0wHjXHsRoNOacKbuE8l3kqHIGPCaZurTHaYVXAkLIpNKUya6tJGvcetE?=
 =?us-ascii?Q?IysBvCen4Sf1XZFWMU0ljQzk4xhS8AQCFRzMCcKCFCuVaK/tsKqvxf6+p/MZ?=
 =?us-ascii?Q?JSIqNl+Fo8qHkstLwJShlKu0YPjCa0wHScthUok5mKbArpGbRMaeB6RgRYSU?=
 =?us-ascii?Q?4HevHFsb7Sp1EtsnG3pT1CXOA6k9f4Z2DJUceSD0MWsY6Nn2kF9CXkrqwHxa?=
 =?us-ascii?Q?mS+g/tCqVGYJhKR+wKyGNFUFyWfKx9VpWhuOsYAwhb4Zu7xtefZwrXxNYQVM?=
 =?us-ascii?Q?E+OEaG3Bcmdcic4w6aq352HMU5ZvTt5Qxueviyo7SvfLHJH8YCkYvboCOxyQ?=
 =?us-ascii?Q?8CeQbPj3rnuv1r6ALzdih25tHGI8oN51oAZTNim9ZkrWR6vCgfkkc7g3E4Ew?=
 =?us-ascii?Q?s4GKUZYYsaSc27m3G8/WhWVqOPnKQMJ368LDJANn2RxYycj3r2hi0ZC3mGoG?=
 =?us-ascii?Q?7TwAfZBr1rVnlPAZqQkC1mIxt+sTKUFPvEOyLQMjXAXe0RkXBodHzvb2WwQf?=
 =?us-ascii?Q?YR/YkkmeNeoyt6BcfVNd4yumH0fwTUAZZIFsIAGX99pc5BJ0S1A5V36PUb9y?=
 =?us-ascii?Q?480=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fa685f2d-ab4b-464a-f423-08dd6e049498
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:26:51.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9447

From: Aditya Garg <adityagarg1208@gmail.com>

Add Apple Magic Keyboard 2024 with Touch ID and Numeric Keypad device ID
(05ac:0322) to those recognized by the hid-apple driver. Keyboard is
otherwise compatible with the existing implementation for its earlier
2021 model.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index e95a54113..0524893f7 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -486,6 +486,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024:
 			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
@@ -1182,6 +1183,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8682e1b11..4925bfd08 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -167,6 +167,7 @@
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024   0x0322
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
-- 
2.43.0


