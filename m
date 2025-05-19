Return-Path: <linux-input+bounces-12436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12546ABBDBA
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 14:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FE3E17D5AC
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0B6279337;
	Mon, 19 May 2025 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="C69B9bxu"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011035.outbound.protection.outlook.com [52.103.67.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC5278776;
	Mon, 19 May 2025 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657691; cv=fail; b=ZoiXdQA2XXGp4FBVVawnD8kFkxZQd5a91KCAWl31y4HZV0PHXmx1Iq6WCzJuTEMr9sZYy7xbEpHBxs6dHWnaKMKr35L/W/x52SAjQiMWjNXmZywNYuCBBO9APYLQiYA7y49RnRZ+4XsUDtnJ3kcsPapfI6fLlgbFH4RyvRzn7fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657691; c=relaxed/simple;
	bh=mLR19sYOOfS/EyY5toVGNLQPh+77bdcXv9Ut/7Nlz08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fs8Rfy39RrWqdJYZFFm8IEQ4bY2szZadfL5xQlr7LJBAGFzAq/G5CmKDCMq0ucOQwJLKCDJBTrCf9viqlDrH4niqwlYbtAsaVVHVh+d3Ka+wOCFB4y2bYnfHoBQ+dQfPA6S0bQ3nxiRITejP80NX4uweBWj7XpAYMe8B9QDvA+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=C69B9bxu; arc=fail smtp.client-ip=52.103.67.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS/w3njr+xuVSGsUuzeFWeQ9hdyN4HlmCOLa/yBi9kqZYQum/DSAYZJY+dkJkXkzLx4NGwAi6I7MLiwLAvE3NmjiCZhplsGsUBHoRdIJmvCk5tWKuJx/3kqS/c9cMgkfLvQ6arNm2RQf8yHrKdleyA5pRUR6ppU+kpJxDwSizFjxKezSUhKGAIYhlJoyNlubPGA0uq3miCXh2PXvX3F8S/lSgc9vn7LoaOixOx8OvAXSvJpQGsnBxrNkV5+nSks+XdXq71GeOm1Y/XChYRP3VjVJwsrC80Y/M4fW4VQo18D8ONtUPKswTXDyGEkgJ7OKtsLpnwnmNMdhhdR/1mE2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/mzyB68TC6E9rPf0qhGlf5SVBybqXsxpxaXG0rN/2w=;
 b=ANMjqBcA8uVMuH64eGWgSoWReVTmOVHTvMqkynGtTuB07EkkaRCrBynB6uXfMRT87yldhbWW2ZoDosHCNvE8u52JPqdBLJ2Pv3tojyAFCdYFfCHGRJKRvjmwvQsHGDc5aKrCjPxlVq476nGeJo/ADvi2Nu27vY3WV2Umx3PqdQrBuQ1WzNwRL53+OQJ/gsnwO2Wa7N7z53LlLvHvo4YdbE5GtA+jVlcdW+O7n0OZ+dQbUMAEplLXUqfSe1NH/C6Z/LhqhQ1AoA95YL5WSzuYkzLXWhAb4eeC68/pYvXav/D8VnpJflqXvZrt6+bWEVtSANfmLB44d7t4FQMIO3aTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/mzyB68TC6E9rPf0qhGlf5SVBybqXsxpxaXG0rN/2w=;
 b=C69B9bxuRfgF2XyqXbTXtBiedEtJmedl0R+Q0zu+CUTohKjK/vVsNZeza5JP8KpIaY8xVhxMbWGdqCsCNoNYOtO32L7lKd8aUM2pyN1YqyN9PYq/7xrdQaE8fqGU4pkp8HLplIrsWzDe36FF33pewqWuK/65Ynv19fbMoLZnK7YqH9f8kUQQc8oOTWKtZU11M0J7EV0Q/jhXus0Hzgyl3Hus5ogUzPCA8oE40hwTnlZfkTVGhOqc8e0ibHqP8xSzRR4Qw3Fo0rDW0sjMOym8Gnk5741cAG2SgcLFCvNroYxbpqKhptgtPSmM8PcLGFbuYp1RCMzUzX5f8u4j9U34oQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:27:59 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:27:59 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v6 4/8] HID: apple: Add Apple Magic Keyboard A3118 USB-C support
Date: Mon, 19 May 2025 17:46:19 +0530
Message-ID:
 <PN3PR01MB9597BCBF379E756D24A1331DB89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250519122736.38469-5-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c3e3b3-f12e-4d1c-dc4b-08dd96d096f0
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoSu68Y5FdRDlCPOBk43FEtr9rdPw6qEg0ISOl4aQ+0i4zARUy4OAG3phMdzyZoWuAF5CLvbAkSQcyFfM8gnVMlFueUG7dJJXWBzuLM4zIUFVgAyoCfZnVa1r5ZIxzTWr9+t2PXRz22M0stD/SQLwyHDZbBKUubC7n89hfSeWlTNv4baeu/Gy0YGEzlJEmJqUM79TJlWcOf4D02srMkG523PEj9/Rng6DtZ86zJi6jbSb6lnCC5VS1ZaEURFXZrU6patSe+tNtlNpsGBomBWVAkskGTGV2G5cXm5z6wxcOBZlz6lwmVX3uM5uzBKcLKA7YMQHp1Fix1E6r7yoMtqaVhwbE4ZGd2V8lkTK18VxX6fGUZ01ZN4yu/HEY8CIo7RTIjqp6L9IJ2IVP8WHalNd9oNpoIbRZZ+SnaRcfWGzcPmoQr4O+8tynRvNakvY8g/Tw1CcU773zTDj9aR00+iuXbsTXEVEbDVZZPE2hl1oBZ8iP3jMEssL2QT0mxKQSDiXfKZeEZSGIEvubLPgmP3A8vDZOscoSAdbG23YtCppcJ/SPbU+D77Rq6qw2nocXr6CFZn7lrcHBvb2SPaNi0y5pTfVKjYRISv/zijkIz5XCVR2r23Ku/GxuiO8LnCZZ9cZXGWC4e2ULbdBObfr0QQKzN6wMix3QqEqzasyo2T//LKSpQtebmAzkxRwNEfisAU6HZzizodgkHod70H9gAHSkjykWOxWwIpYSQWBDdF+ab4ePfiE2eCdGfh+Zuo+sBIog=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IEWyBXAvdhJufwkNyzCopqbVcSlNOFdivxp0siQYhofsAgWlza4Dbv7u8n1M?=
 =?us-ascii?Q?1rnWXwj9E5p5xK90PJSnhDDRQ7WOX5t34OqrzQWBI+hw3E8jud7xYTedvi7d?=
 =?us-ascii?Q?jqgCxrKEXGBz8SyfDeAHywA0AOtkqOG7Aax3oxeKRjTuyacnH6QY2Nr/sL/c?=
 =?us-ascii?Q?rpm6EksZJ12dCXcs227jNadW+K7pdFhSmOwbfSFcUhM84jkWXdQir3BxthBD?=
 =?us-ascii?Q?c8xxly0i4pvqYiunjgFUp8DIxO3gc0tpO/zBrX6rUPCZH4THDszpP+dCmZVr?=
 =?us-ascii?Q?/fMuP2oh3mIHsF6Xc4BK8TYlteuvshkYEcaSRQ4BmjUKjWK9Kv6h7xYhGH00?=
 =?us-ascii?Q?H4i2VPa4Hm7L3IwnX2zlrgw3P5KfADKirx6wuDHrSaTMzo8cV97/pU7VsWwI?=
 =?us-ascii?Q?B0V92zL3q1XIIFr2CC7IPTw0Zz/0tlzhfY9U60Yjk5zfzQMpE5pe1RQgUXfo?=
 =?us-ascii?Q?3pQEgj1vX9jDB8VaY1rnpx8q95SRC5JVuMwEzSLXS4oDEM1rhw56XCNDFoLw?=
 =?us-ascii?Q?NMLPYEstrLePs7ZNoJukGHbaKP3ihyzBfc+0uhNGLgZrNoS1tVMI3n2PNdMx?=
 =?us-ascii?Q?N+kFUjzHsjxkkbQk5pTlneDCfCu6NP5k1w/hD5LpBTCGRjdZYAEAMCNQkkVl?=
 =?us-ascii?Q?cVZvCtNNPb56NzRQpEuPZqbPWMKEB1vLSO5E9joqxlTa9yQNorqKgG+u7K21?=
 =?us-ascii?Q?tGJhIzwztDsabT0xi7uyXdolZrDfVSorw4MG3dYkZ3BByPZOUZDBooXHYdW6?=
 =?us-ascii?Q?9TkJb+HYh5WUpvE1c9n+4c/Ux73hHQm2JfOMUSBIteEVfnZR1RnUIS/cyP1j?=
 =?us-ascii?Q?8xr1vYXbn+zQ+4fFEBonJiTSmOAhGctUEtR/1QKEu/M/ws+VsjrhLMC8AVBO?=
 =?us-ascii?Q?6pEF+T6eTvSmw8FGMcxfsp0Lpjgri5iyDKz2LMpP5zzZx7dROXhciYRFKeaE?=
 =?us-ascii?Q?K4iYv+OTL5cICV3vnsOvH9ttkHOfIV3Q7udkqEKdbtY+ir4S3yFWvV6uYXUB?=
 =?us-ascii?Q?TAO/tlHstljxz2QfcT6Y2rY7eu+fxJg0hg9afVmtIcWa8Bh97olcd+KK2K3v?=
 =?us-ascii?Q?/PXB1EAGt72PhToJGMZ6GkDQJ2jpKDFEvaXbnyf3yJ8Nz/NjT8A=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w4j+2dH34oL+ByLHIe4P1cVvU0Z9DBbEdibw2gC5LyhGEZ5znEOzMx+laZH/?=
 =?us-ascii?Q?b3Te7pLqR3FmemRzM+lVVv9lmzbvf+JAfjGtBBcISjkNLooUVayJtJx0nZ68?=
 =?us-ascii?Q?sjg7axkpXtX+aekInBRbOPzMLywh5khu7ulOnN/9wx2sC8/uMMB1PMa1OQPR?=
 =?us-ascii?Q?3NLX642VblUOFlipSPi4ONliSUdzgeXxmfysfRlRRvxZF+D10GkQQCiLkBKc?=
 =?us-ascii?Q?w1YpKHMaMNitRJWv9UhPplzAwcfdBVnRb2/+BEHq4c2tNHZ+lBw10Dv1KBoP?=
 =?us-ascii?Q?r58ydBsOdMUweJF6VIfLUwcA5YnhdMb+a9gvDz7WzzMPOO+dWYgbf829ILXs?=
 =?us-ascii?Q?Yi1+z4+5xj5xg9RY5jumteIN3uuKHZh0/A4CXvkoDPxKKI0GuWDMNb2Jr/Ix?=
 =?us-ascii?Q?tc4/v89eK6mLn5wwkK7vpnzRPpmkunL/gyRDu40Rb3qcx0LDqj0VLxFVL16V?=
 =?us-ascii?Q?9yVRxSYX5ReJfnAw3mxDByU2INT/saLUHfiogB30kT3I3F0mDaD6ap4ztHR2?=
 =?us-ascii?Q?nL/+Ce2d5Jyi8ogorswaIU1UNfj0Z5ImSTzYRiOqAxM9Jui3nI2oRT6cZ67L?=
 =?us-ascii?Q?Ax2adsfGtHk5AYnMuW+tJ6uutveqhxN4+ZD8mygnshQITH8/sMkdVcjq/Lkj?=
 =?us-ascii?Q?FdkYaXOAsajEaHg1QPyp5gH4Bz8g5Kb6eT0gDkUgbPKtzYsjQKYOpYMkZZI7?=
 =?us-ascii?Q?8DsmBsmYN2BLDgWMHERQczUjUJLj3wvJI3AqkMQqGls1g7sTj5tMSi7SJq64?=
 =?us-ascii?Q?qCIAHZSH203UWipn64Eo47dnKsLzJnkxzOZtUIa+/5iNALhG83dlgXKPop9S?=
 =?us-ascii?Q?uelBUq/vObUn6nuXBjTy5+f4M9+Hj/+8bPc3LY4agq3FBqw5BHTly4eOjFK9?=
 =?us-ascii?Q?BwPyUskYcf8avwrU28EWQRdp00yoDwPKU1i5I5j56patDGgQb9w2RZnDtoi1?=
 =?us-ascii?Q?2KR05tlMFGMuGMROXfnsCsoYvNNMd/DDlLSe/NGYYSgjvpmSG+RNHbGOAe0x?=
 =?us-ascii?Q?+9sKuZYCEd1B0r2Yy/bheZw1ikm0QOUDXz/ffl+WiwKdssbFNcAWk9Ucp/1u?=
 =?us-ascii?Q?KI6vveVnxe+Bb+ZAfER6JzqrBh8WjTwr9WL6dW+ajgRws5Vv42tgvTV11YX/?=
 =?us-ascii?Q?LSpyvxxGovtrIBlX17s8qd9yOB3xN86tznw9gwNocrO0guzl/Qt5bt+4jF54?=
 =?us-ascii?Q?LEB9DuJA0+Yuvl0fbCIHfvcHC4OjMfDOIT848FNGFytPAUxgs3yFVF5WmFUv?=
 =?us-ascii?Q?rzj40Z87QZ+juUX+AtIJJCtzo7bfFFpekTm3MuPGR/qMGuvZ7ZuoRsQ6vYrO?=
 =?us-ascii?Q?s64=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c3e3b3-f12e-4d1c-dc4b-08dd96d096f0
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:27:58.8822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5917

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
index e3fb4e2fe..6e6606734 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -167,6 +167,11 @@
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
@@ -188,10 +193,6 @@
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
2.43.0


