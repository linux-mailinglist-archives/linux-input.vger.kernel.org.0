Return-Path: <linux-input+bounces-11899-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC90A95306
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 16:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D05391895242
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 14:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3201C863D;
	Mon, 21 Apr 2025 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="rXmDXtS2"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64DA1E0DB0;
	Mon, 21 Apr 2025 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246879; cv=fail; b=RwkNaWGOEy9Njl4XxH+Np+hmiYMIV4AOEgdpHINPhw1jrrCBKdGppNeQL+CW/LdS4rPw5+9xFTN4R/TWQh//QvRQINMdkz+QpZJuG055IxyqJP4ZzIuPaaAsIMsBBL7GVs78GU5bs1Kz8W6Qp/g8iu2vQSvhT+e4C1J8R1K9HWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246879; c=relaxed/simple;
	bh=FS7hBHvXyqLE+Clhwk5Ap0AeWggtrPNArMYSNfkgerM=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=OY0ButGErAfJvy5mK4vCGYvkZzOc6VsOsoet/XYMWdKIg8CUuTclWt+VH+jqi3dtsSd8wyTdM+ALqpe4WH4sxz1LksGcKvufm2O2p5yAsQEOtz0zje0g2GXrJXNOTbvNmA9ytq1+AK9lLzVEU7pJHJpPq0EA9q0bWwKX+/vpVNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=rXmDXtS2; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiZqv7p1is70rbus56I2KiUVVqY/zyy5RvlRP1FvhFwByIoM5YA8isv466mUiFYP61Mh8qn/JBpfAxKzPicwulj/DpznKaz23z2ArSl2cGRITAI/NSbQAnt4DpMDRFzJOHF12c678mBi/4TmXeoYNpZGUNyOZLoYZuL2RJGPonyqTUrav3UeDNAqz9WxoJB4aHYNgB4gYNEeyHkLSY7/veRzljzQ8flSii2j0N9K6cwMJE/6b1oH6wZ4ZSOTwL7T+kkrDPKu5nTbwA2XgxtR/pTVcRar7ADG7aGXCoCDx/8vCqIpbDUmLMyujXcnICs/7aWDUZv19VDcoPNmocg3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gtc+M+CQmqzmrC0LRrLgaPI0HpccnUQG4WHu9ptieOc=;
 b=eyLfnlPwSxdZcQJ8a2t/rv7ePUYveXor+WsYcST+F6xYzAJRiLBMlK6pWsZ2fNgFCbb+Uee1Pg3mZkBYbsk0mwkDF26fPozm2zE6ZAeVMoBEooVTsnnK4Fons/fMoYyJNuXBFnuseYOl1wXnj0fN38qgI8nplY7oJn/q1GATdW0PiJjkXKQ7OUXkOMkGzVnD63LPP3ilfnFtiD1O0z47PeIB0Yv32lOV/ZZYRbbaLDpYVm9pB/aDfiiZdmJc9lwjUyZQ5jPzPW4dqTqth5uQPHbDtS9ZTtwNFqAlOdAYcEe5xUigNT4RulY0U4YuNhw5mv/PzjEXBA8d2GmB58lmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gtc+M+CQmqzmrC0LRrLgaPI0HpccnUQG4WHu9ptieOc=;
 b=rXmDXtS20s42w6NQCFwQdmkoeaozHETW/cetZ/F6tDGYmj12IHoz3/dBwhtMOkcI5OJd8Sh95usMcutlK64OUyacs1mEON3ePdrDc6exz9hTh8QEKFnB5KBi9U363hj0ONu8jUUJMM8qnEs6hH/Es1TWCy0D/9doSvHJ3O2tCnRQ13g5m+AZp/T17hvOwAB+O4zPqu79LlAXMX6gbd1L+RLoVmRC1a3ncqrK+DXIx48V7QxtGz8iCfEaqmUU8uAjMmJLXP9IjJwGVoNMhslCA9jrDMpxYW82/ofJ8n2Q0tCGiqGC+h8D3R9FZmBBwSttpAUNismiGhA635bH0cenYQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5918.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:65::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 14:47:52 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:47:52 +0000
Message-ID:
 <PN3PR01MB9597E5751AA8BFB198EB7358B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 15 Apr 2025 21:43:14 +0530
Subject: [PATCH RESEND v5 4/5] HID: apple: Add Apple Magic Keyboard A3118
 USB-C support
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>,
    Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <4fd664b0f2a95b934c8d33d02d68f2da48dab65f.1745246807.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 263645f1-9caa-44ca-c76f-08dd80e37e7d
X-MS-Exchange-SLBlob-MailProps:
	EgT5Wr3QDKyfA/kqhNtxhLoDzMvzACCoeW0SWDMAlLo5qG/jj5bGCt428+vU8CTG15w8zVSK2vvRQuAVFvNwujUp536ydcUMLXoc8haQenZAtLNKHVFi+08sKYpr8Y8X35R0Tc8Psp5deFFMHs5rTU6RtOIeKNn5e8/xQpteQn86HaRMdjFINS7vYp+YwgO1dP6ZcL6eC21dhIJXtq2IpyceKrZ6alnkmFFhqCnbcejzprXtf+Vn3QhN4X0NpZQwiqNbobu9Hzw3aCMtXNKAJcsyBzZ0Ey0sgWL9CQrwTWmYjfonnuvtqgE1ERU2qxDw8tTtGHga0fsEzCpAs4ZFT4dmCxasVnbGC5q9laE4C0Ofd2pcOV0qavgEJLoDW2jx8E2idGIHolhokFgrEtaZbkXlvrzA7ZZnfBnjpYq3OY75s1TDlXSY0eqLI9o57y7hcb76sFhXXPBMrvEl1W4UFVa3z7/CH2LmtEMFPGk1PLVXHRCjTMiRF3rwn3jXGWuKvMJF+i8JyqWfH+Ph8PXhHAc5loX3pfwbo783baE4SaWqr08rUmv/4N4vv7QQ01I5rEo6iwwH/algI2c9RtFloaw948okoxfwpAXKJ3RZyetZEsjdY1irPodNuOmTHeIBMwAvS4IszMYvaTMUcjzxAnvCAm6t9gnLm4v5VKrlV++mLY7Dhro2lRGZrKNdejQjyvfU24/8kIzUotwk2tLfVTOJmePOy9cW1PwLSJzmUUc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|15080799006|8060799006|19110799003|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s6NoAWUiX/MTVgdy50JHjGvHdozLXbh5m4Bk43VhDdRKTN8tdnrz/kfwn6R1?=
 =?us-ascii?Q?oYPBBKRL2tTcEAxS5L9icr6xa1BGwcrv+AGKn8Okn3XJIGOOhE0o+Jx3Y7Jy?=
 =?us-ascii?Q?/SUrHXNTHdOw8l3vlCBjbsnWkEceuhA/4VTKkeOVNdDmiT3neSR9OGjjruOt?=
 =?us-ascii?Q?hAQBWIkteXIFgCVsD/SEoy7WcYuuIQvzVa4irzWUIVjErH1Q9UgKE/kmuh0r?=
 =?us-ascii?Q?xN/wNHMXQ9AhtbZO1ETlfUpO5jQRBTNozihaNAG08n7SphU6PSmJyZ20HMqt?=
 =?us-ascii?Q?NTX4z96OJ9HdEJ/NHatY0MUtLmXcTxcpYMBP0AgYonyUCuEz9EjPEqCDCI7t?=
 =?us-ascii?Q?m1EJ39BTCAkR9KY1I7kHUUAHu8hS7goo1MBi+SAVXpINFf7XHxlqHrUSZUj8?=
 =?us-ascii?Q?qIkdhi8rlPqCUFWO82YnvII4lPGnbhO7wWPFlPa5JGYJvE3R6pYb6i6CUWFL?=
 =?us-ascii?Q?h+cvnZYCei4rSHAvs2c8BrqHou7X+OmEG4USvLrFF74+iMqyIVRTDj3GcO5r?=
 =?us-ascii?Q?FXjjF119Y+xe7R8cEjpXPE/sMFikk8b39bQ+zyY+EEtSFT0bLC6GFzFFCE/1?=
 =?us-ascii?Q?DeM6L6HEXF/6sFsCmOhPS3REkCy4XVwA+3d+jdu1Foc2tDvchVOUxnlwCR8d?=
 =?us-ascii?Q?VlO3Ju9ownSB5qv9WcpOd9X/Qqo++cD2w+eUOxU03usRDaycPWxt0gIfGCWt?=
 =?us-ascii?Q?yzbWGiG9310ijqMb5XFMurL/Q/wzf8pohzTONIBz0lNueHEjs328dZBycHpB?=
 =?us-ascii?Q?OxA1lhaaFUJ681zHhbOq4+RIa2hhsIB77dMSPr3Z009XYyBIWOO6PFqRkm8s?=
 =?us-ascii?Q?QSF5ZJVivluHzpGx/07skc9V1JSxKMqEO4sQmxVssSySEE1nJ5J6wdUtmHP0?=
 =?us-ascii?Q?WHAKsTOcpEtRT5JK0gocdTFw3R05F/Zee9IlUzlhABoh1g2H7P90uw5AIz3P?=
 =?us-ascii?Q?pCPq/lQtn1E9M6ax0WkKu4/OpMESoLPVI+h5KMdkjIRLNrtej26uMflGBDvs?=
 =?us-ascii?Q?DURPLRuA8DinT/gT+YQ7T0KvmmMmQgfigWGwy2Gce3YxctnCFL9q9PTqH2jM?=
 =?us-ascii?Q?kZXh0t+OIyExA1m4MkU7Y5UqJdFlsDiaHmWjQ7yDuxe3VbJ0AnY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OEqiL7iC6jHPbWKHtysM8NeTUc1sr95csRQHQ87IG6MuK9VXPVz8HixXYj5+?=
 =?us-ascii?Q?i6KY0Q1voaKmbQJidOP8FK+5wN1jMEg0r0Xn6sRFAhV7xuHX58Xwu5gzplNC?=
 =?us-ascii?Q?N7YriNYrSSfm6IjYPjW26n1+8uAydBU1oMECaCP7jzj5BCXGLDFfScnkDa6e?=
 =?us-ascii?Q?lVh2/yZweH0n1pgTO2LJuWdJIPpLLUeffT7TDExd0XFKMhCapLtQi7gnzZsu?=
 =?us-ascii?Q?P8JX7xUTyiop5SJRf9PK0d0suOlelge5KaEbz0Wrd63wnIOxrU9AvDEqFlvD?=
 =?us-ascii?Q?/FSJHOaQdoWfTEZZ7p16Beksv8Icm+wgHn2gilZNVi+V6YH7zVl47bckKL99?=
 =?us-ascii?Q?v10JjPfQCMYlIXgq+9TjOA534rHKQyfRwMPWsXCaIFY4ECVOGPd8802a95wN?=
 =?us-ascii?Q?gVtFsRJ3Ebtn8Los1cBl1XHm7tlZtLsDKNBrPBJh04U57P4tUr2ow/evoHhA?=
 =?us-ascii?Q?eODbYcL+frnhCK8ReJeHAEQgR00XkCSKf2ycoiftHsaat+23zB6toQm5iBGB?=
 =?us-ascii?Q?p+saMul19zn+mLOur3GrKnpLBMwcL1mdyH9fR266Uv6YhBxSeg3egfc+MwHk?=
 =?us-ascii?Q?7DPHkR6bfRObjExduq2/qFy9m7OdDhNMK1e2smAI7ZxFSg9uKgu01p/FBa1Z?=
 =?us-ascii?Q?QFVrKtoo19NFspgPhLNc1ph9tH3+zwg4lej+OsdU20pAakR+lguLVj6E+Mrk?=
 =?us-ascii?Q?inkpMtedqYSUVQ0Zm7WtgsfThl6voKy9VL0z3OkqGbPEm1Y/2LHnjfXo1XW6?=
 =?us-ascii?Q?S3gI17j5n7NaowT0CoyOyzgpsEfmGXk5n0IZLwEC7BQQYeujPSVQFcNYQ2+1?=
 =?us-ascii?Q?Q24NhpYxd9er1rDx91sGUbNeYpaTYHsN0MQXg8YMrX2bLvaJcfRung1Nixy2?=
 =?us-ascii?Q?Um+YVor0930SdEekLn4dafIkocJoMnj0uWODYgMiZmJ8bZmlQ7Z4/SM9WS4W?=
 =?us-ascii?Q?E2P2auLmXiWeDcF2lrWyjlhpNAspT+vGnM+Vt5zmyKiaIHnJF8B4wYdnJ4LR?=
 =?us-ascii?Q?Kdp6lRGRLvYcKdISln+0Ffc25s1rH8wKI3vaqIRejHgMeSGLmv1fRumSi6iC?=
 =?us-ascii?Q?phBFsmEaqYIuXYjt9P0MMlnYvYhNaTr34FybY2rSc4fPzfRwVuMmIXAlt60L?=
 =?us-ascii?Q?20M+HVSRgikmDHO0Xr73QAP6ajQfOxFgn4X3ciTE0CU4SAqf+1sxcCDg90/1?=
 =?us-ascii?Q?ahj33FvnKwYMmNie0RB1OK5hpMv1HLlxcBGSKE12ic6PUlxLlk9ZWBBO01Q?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 263645f1-9caa-44ca-c76f-08dd80e37e7d
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 14:47:52.6533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5918

From: Grigorii Sokolik <g.sokol99@g-sokol.info>

Add Apple Magic Keyboard 2024 with Touch ID device ID (05ac:0321) to
those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.

Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 21 +++++++++++++--------
 drivers/hid/hid-ids.h   |  9 +++++----
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index fde438bee..e95a54113 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -165,7 +165,7 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 	{ }
 };
 
-static const struct apple_key_translation apple2021_fn_keys[] = {
+static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
@@ -482,10 +482,11 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 			table = magic_keyboard_2015_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
-		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
-			table = apple2021_fn_keys;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
@@ -690,7 +691,7 @@ static void apple_setup_input(struct input_dev *input)
 	apple_setup_key_translation(input, apple_iso_keyboard);
 	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
 	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
-	apple_setup_key_translation(input, apple2021_fn_keys);
+	apple_setup_key_translation(input, magic_keyboard_2021_and_2024_fn_keys);
 	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
 	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
 }
@@ -1165,10 +1166,6 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
-	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
@@ -1177,6 +1174,14 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864..8682e1b11 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -162,6 +162,11 @@
 #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS   0x0257
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015   0x0267
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015   0x026c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
@@ -183,10 +188,6 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL3	0x8241
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
 
-- 
2.49.0


