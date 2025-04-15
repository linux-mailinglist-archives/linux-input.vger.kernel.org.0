Return-Path: <linux-input+bounces-11900-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A3DA95309
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 16:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80C5216604B
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 14:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6351E2307;
	Mon, 21 Apr 2025 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Q9hXmq7f"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57721E104E;
	Mon, 21 Apr 2025 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246881; cv=fail; b=Ij6BDW0NfN8RFE9AYzf6umDv8EIN/rJdjcnQK/fFJ0/PJp+z7wraB8u8AIMQORT4V2U7lUra2phSC01Q8Jyf1kpLciv3xbvK9XHEXoMU1t7ZSE6GuALjTCNMxRletT+ajAl7/Ym0Do2hNjUpIpI2YuHhF8ZYF5ygXcN+FOUGvPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246881; c=relaxed/simple;
	bh=Dae3IBbeqHqy2zk+EVFF1NLDBUcuuFjhagiZWrKyOYw=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=fKOWCWy8pjSlv6+JQIbZA1wqkeu5SR47HshX8kQ2ja8P78rx3LZSqb5UU2vdImEw22k2aczGhaanf8BWd0fo+h1W5iD2Zssh25NbxtACgq7lv4Z6vVH+mKqbojDXik8986HBgU0LewBDSn7ZSdeKUMF5SItl0ibHIgGWzv1+Wug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Q9hXmq7f; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0xmDYA44dfhcLa9A6yqEQ2vflBGCJ803sFGO6y3tB0do3Z3rxuzdUVOgLd2KjPACvDk/xlCZN8V67vcKS76I0CtQXOuSnqqIrzUesZ4FzLc4fcunkBDdvKZg0VpwO87EnWPE6vz7wAyumPZhbHrJBC7vp5a1YR5XTo8TPO5zkFK6m0C26OgPyYTsYKzs8MiDxW75tR5/QIGG785ZJVqA8k8JXaJ/xQy9cEZRN3zAu9vf3p1j14+RHUqmPI6vsOIJPiPH4W7SjBP3hqkO2Efn2wMEB7YEgbinOhP5X/SxrI10kMXGW5QWh7LY4a6EwIW4NuZfYYHRSWMrIBcJOlxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zQoJjd6VAXGyfhy2dULdfQPxOOXkj7MbUqSgEACHio=;
 b=QYtldgtAyNBiWdbhouZCEVHEyey23fsaUi7w4NV+aAwBjsH/zLrgXK/PPriXYFyIJYTAWq46u4HJ05MPHuJLlRSrfl6IzCsYLEvAzrXQ25FZpcQT9eCmT2JwLZQ1YkDhreQi5RpO+HexfFQ94sArdW8Q72ij24NWJ2A7v14olqxElMMMm7WAVnaJCGgGJI8kpBg62TMXAWFYoIcFGyM+6gRmMldoN9o+tnqaD0SMPOr2AC6yBbCK6CSd2TTqRRSXbKtZ9OMrw/74HkPLNee9blsULF+sM1Vu1/m4PUSnQQi/mKavcDey9VUL+0KfDiEZOKshAZ9SY6yiqZvOOddVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zQoJjd6VAXGyfhy2dULdfQPxOOXkj7MbUqSgEACHio=;
 b=Q9hXmq7fbP6ZC4lpvhiwN38egQ0w4siEhCAodpu8TvBWDZmmgjifI7j4Pc4ml5sg6Jb4GSC8xcN3Qya27F2LV/znvS1MdZrc0cCx6kSNRlm6djIJYoisDiuk5KkESgtjzDMfy6NyyH1XLRg5y5FnSBmMoW+bVH86nNplmbus9CNiH0eFtQ64FG5eituEcANvPI/4K/+q9UI0f2WdeazknVdM/zaIB8r0j4DhAhLQbJq0zPi05kD5OXdoD+YzbrY+/INq6QtgbVf7P/h8t3MBW3mCkMQtwiP5MxZHf5d1MTglJwzHRkGAajbj/H9PHloGBC8ElGleXdMfiwvX3zq7zQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5918.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:65::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 14:47:54 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:47:54 +0000
Message-ID:
 <PN3PR01MB9597468F38C8188B8583D14FB8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 15 Apr 2025 21:43:52 +0530
Subject: [PATCH RESEND v5 5/5] HID: apple: Add Apple Magic Keyboard A3119
 USB-C support
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>,
    Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::14) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <afd4e709bdf3086a53020dba01374070730a45a4.1745246807.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: cb16a2c5-e474-4a90-a634-08dd80e37fb8
X-MS-Exchange-SLBlob-MailProps:
	AZnQBsB9XmpI8tRyoOXaSUmOkLVCBKasPy+ePdN4VnX/cGym85LG6RSUyFbVr0E9OJJ5Z+HYQcHUO/qbb/jr0omYyG+i2wtDfTP7C+WCapd6VtvOMdUL1P5hLp2iC+rylXDar/XX4gRuJYhNQYJXu4rRulOPBymsYwO4IvEjiHgxWrM0aNP2f2DbaaKdYkRqDiH/FATSHDeIqRt7PFEqDS3qSIZbUoJec+CIRgCcHMmNHyzho+qiDRA+AcK/MqTY5qQJGa/w/oh6pctWrLU/rBuIIXuRuF7P4ZFt4X+V7k88Jzih/xRKO7iHcX3na03It+JcGQxNvlM6rZsJd102c49mKtdLGBlDp0ZCKHc83CuYFbVUZw6OkCavr0KnL306/BZdFFI2DoXlI8NFhD/UjjiSb61wh0EHNxZfeWjtJbToyq75ta75Yt6UidQIkC2ZXlIaZt3Z3NXeQKk9PVN3q8UQEzAYNWO5RUvOETqnST/2IpcLzLZ+8165pXd4W3CTxydevtvm+mY5YN5dtX5LZ39NRlK7Kpr6ReEUDGnAUGzvzNcWWc27RJ3b//Ss8bCccnggfGv6csu3N8r/NsKSWIyUO/lIqxznwlk2bOzZVHyqe7dHklZxdfylo9sTfgetjA2hPZTyDJp+BdJ/s9ZjdBk/H2OPehqLEgbNRHmk9sW7b2c+v4wwnpacVFUMA68UaxRB+2VTLVsIoqjx04OCHdgED/BuIu+pUv5uDtINOj3aPfCrKhsJWIZmfGhaA4QgMzTTaWAMa5E=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|15080799006|8060799006|19110799003|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3AEpjJbLER8h0m9lIUXEN8F4LWDD09V5/ztn55wdW7RUfWCHwx+OZcNH0yrq?=
 =?us-ascii?Q?EVF6U7dgKYvU3/PRuqmpEz9aTMLYBVFVJVuIHv4nnk/SadjgWm++P3aauoxC?=
 =?us-ascii?Q?mJwa/UWbyh0g2jyNcs7aYmL1eTDvuzDIN3NhEOaxlWdolQ8auxUecJkiP2oS?=
 =?us-ascii?Q?mZxCA2ymwYZ8C00yDCwxxEdGjU9cnoci+qTGPapYf50uB255YYlc5g0j6vMX?=
 =?us-ascii?Q?90ZUjVKObVp6b2+IwtbYU076KGgL/c2RA2N74nF1cW8l49FWyaWrVy8IaqbP?=
 =?us-ascii?Q?d1TYsI6fyEa666qxbIxbsaHKWzbyYJqFKjAWABf+UNqEdu296d3zG5vy0VWO?=
 =?us-ascii?Q?WYMBfvw29gQU3Jq5XKWmZOSr0Yh68OEmEtH2zEBIM2vo4NjxIh3t/Uq0x2w8?=
 =?us-ascii?Q?x9yGfIZqqxpKEvmyKURFS+Tc2f/WKQS2DENzkrQLCKJpi7Al7J108yhEhM66?=
 =?us-ascii?Q?+YestkYsV6+53c+cLmEXdOVSm57tlb8M+y7IuZLUf9V8eNMPASAZJ9l8w0lm?=
 =?us-ascii?Q?Wn1ogV1vA3bwjkDyCN7NRq7XfjLvT6R4j6rgonEKMSKY7GFcHElPMigqqKWm?=
 =?us-ascii?Q?SI3r0AbWnID4N9DIEIlA1zv7VV8YNwfjekLEKAGv1/T3Y9LmQspkq0cR65/+?=
 =?us-ascii?Q?JrStrAWfZcKhYUNMlcT3ajBJq67fRI8tJt145z8WakW5yDYEmM9HKWfsGt8H?=
 =?us-ascii?Q?Ly0ovJJgvZ+acpxwQ6zi4Bd49SjztxXOrQPf7RnFxu8FyMXe2BfeIzZa3PZa?=
 =?us-ascii?Q?sMrF1XdUv7bjjpR7WZTIKYEJdIk5hNgSS30WnldW2f3a8i7mGfevMJAEUO81?=
 =?us-ascii?Q?jTho04JvmsdULpIZ9OJvwiQvJx+g4F356aVNImx/UW55kKNs4MbaeuhfFVp0?=
 =?us-ascii?Q?EyL1Avly4COriLvLtZ0LiCBziHnpiRwdskS+3c/JbvDKtDx8v53w2QnvLhBJ?=
 =?us-ascii?Q?fpqtccO/o4x93wwQMX8+liLOaX6wFM1+Cr5oW8QGMcC1ZK7LHUcwrvhaJgeL?=
 =?us-ascii?Q?AtNChk+8LDfCo3TMfTyAX3vOWR+JG+4P4XUILNJfLmC0bGC7QcuxiT4Rv0tG?=
 =?us-ascii?Q?Tenly/LGbvidD1wlZGyQehFihl7PEZJBi7rWs47SZTWaBGPdaaQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sDHRakbgsG6QoF/42xAFBstLJvMtwGDKCA34E2XufDXb4DLhX83RT+WGHF2e?=
 =?us-ascii?Q?o/kxDyU//Zvui4vnJJHEXtyQECoScdKk1qJ/S0KJVyZRxToWRCcnB7Fn36uk?=
 =?us-ascii?Q?N9Z9D5e3McQLeNyUxQAX5TS/u7Lfkb2bVyJ5l1HV0zqNdE02YmNpC4Nl4Q/f?=
 =?us-ascii?Q?gviCOfxBTC67aHyEsJd4lUbZdnttca4Mewm+MI1V1gmaOwAaUAqvD4iR1IBU?=
 =?us-ascii?Q?1aqjRW47mjeX7Tq+0GIEFN4MWOJrIa+f04jVwVZdJsPMnzDW2gLmz1w7XEMv?=
 =?us-ascii?Q?KVFYkeRsyr8WAkiqsdPYUymg4NBhkghbbJ/1XG7TkvGBvFe5/U9j87YXs0j5?=
 =?us-ascii?Q?56BWcVON72/00Kn1HOFiY9FKAXWQphFs39nqdT71BEnuuzVAAcITe6mTvtKH?=
 =?us-ascii?Q?HX2ZnG2fskPUx5mFpTTLArOT0QhYxUnpHfiHaxHGQrMbxrAAnGUxWoNWa3hc?=
 =?us-ascii?Q?wTNF71ZVL+xlIJ24wI6XRcsw+xGzYGmrbZzhYVSkYCSD0kgSL02IDnzh2rZR?=
 =?us-ascii?Q?p/lUeJrRqpJ88UtbL1hCXibyyVH1AEcIaYKrx2r47CnZHXXcj1P6WhcIUhe/?=
 =?us-ascii?Q?wvNr/HlqrPMnoQU3CASLcohblNS+WNkihHO3VDQQR1RXnttyC5DJTbtZPncG?=
 =?us-ascii?Q?czjkYMjZvUxPJSo8l64gEiqAoUMyndTjZUvWKe8RnKMA60a5ppn635bgiEPc?=
 =?us-ascii?Q?GCw6EE/utq9uN+18C4TSGA90+u/31t/23+rvsL5Y01prmcKuOrPt6t4Cki1X?=
 =?us-ascii?Q?M3gOWaQm3pLIMLFWmLJ2mEHhRNN85vj/rtcPuiJbFtu+JqqtJuYSGORsCrHZ?=
 =?us-ascii?Q?UoW/tcXROhBWFtWYJ25VwFjFqG+LVcGJzn0SipFulqzSQBZhAU9Mt2QVlMCu?=
 =?us-ascii?Q?Oz/oZrDC9e47xJdUkGEMWEmMgZ/uOYpLoG1BRI+wZTyUcvC6ivlpqPnaCHtj?=
 =?us-ascii?Q?BODm0VoHO/oUSTK0RUKYZZODZnfQtwjYdBoaMQhwWW64KA/yCzZR7adrLxcs?=
 =?us-ascii?Q?rwQJ0D+2a4y7h0uCwXavaX8rIV9yLS37Z/SJmKTEdr3J/JSrpNTlGU8VnXT4?=
 =?us-ascii?Q?ZBYPYtOdGgUKwa6m+PiDo3YL6AWpVjXyn+KDS04ZJMOqnr/6XCpjXq9L87wQ?=
 =?us-ascii?Q?PUhD0n8yrpVK3Yg+fPLxKV76uuTw2uM5jO1tILIAlte80A2Nt3tc6688lw7q?=
 =?us-ascii?Q?fVK1BlQarI1lpKvnKbyeoO4ujp08ridNDXsWxXZ5w62mjp3srSSe1tKdeE0?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cb16a2c5-e474-4a90-a634-08dd80e37fb8
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 14:47:54.7199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5918

From: Aditya Garg <gargaditya08@live.com>

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
2.49.0


