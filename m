Return-Path: <linux-input+bounces-11339-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2B6A74C8A
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 15:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F795165114
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 14:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD74F1C2DC8;
	Fri, 28 Mar 2025 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="g7MVjF1p"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011036.outbound.protection.outlook.com [52.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73731C0DED;
	Fri, 28 Mar 2025 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172002; cv=fail; b=IeGCTdD9Brvrne6xfa1HyN1uF0Y5vv+U7+t2D16yKUs8BuAVkRVBCknzPaGbvz32zPWylsPnPsEZYZ6hWPmK+d59fxCVdIVst5pUpjpttM33mXNZEYW1ZwtoD72Qd2/2pA93i+wxn/8pbSIKXKwAsi+QsYRiBmNZcf6VapYchOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172002; c=relaxed/simple;
	bh=lnwQ5N5338bQQoTujUoN6wFrBlLi0fQlBnV6zpQq97Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VXxJ5OeaJEM3kT2vv+lrvETuKXh6UcgosaH/RqZxRnEHEElxkBLUaZ9C6iwc0JNHl/K9lzxb9tIGuIkN1YwBrMZFRSL1KUd7tLN2XSgXqVcACaX95+DQb3o8Mnbd803iFImP7EHM2zyki34nwvm5ql/vSqsoVFRjPu5IKy6aLx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=g7MVjF1p; arc=fail smtp.client-ip=52.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPMtE86Kfi1+fEWZEJ5RSLoMgaRaXLdrqqV4i2IHQ1ZMm5Tn9dTCjzhPHjJ7tWXwbrw4+mZacFcu6sRKOoKVlBPcwgycjkumfRT+EMo7vAZJJAxg3Q1CpkWRwghmharTj0Eo1vfLCt2nTkUctt1xuuC/u1NSO12sh6KN9rMRRplyW2GMEw7rhkbpBjMjvpNLPd4UVVD56ieam882jLMlAgHaIhSdHk47Dex1AdSjXcBYGjZ4tPE25+ZyT2F0NjqRstvNkhfZRANkGqFydViQgNtHClDtGLdDJvLR+lmnHsC7g6ijooRcnHg/DDd8g6YsFbCxnYhBaniDI5ZCAkkoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKelwVBFA80QHsCgPypH53zAnfTgkITVXXIAttCTwlA=;
 b=UzbNwvcrDnUiEmvzhJ5dRAast57pbWbjTKPCOGh8n+7FNO0tr7RWQfNJIyVDIcwoS44AAI/SryF/w+PQezr9BoKUstY4VMwvKeq6jLJYEBCLJTmVq+0SX5SuQ1KGRPA9bacehZSSUOUngjIIK3cOY+Vy/m1zMMkHD+ENp4HzOo2WGyhCMpYF5MNbXeSP9C6AU3cK/cDzlPyMac93UT6/iwQyLMS2I1HuBmGu+v0nRFgPGynSDrL88xabciAJ41MEihaERAWGuqBoC/o/8QB98nUKZ5lG5kw0DC54mqDEYcQMLiZsJRhTuWFo5eL5KvyN5dc/MepQvk9WsmN2eQN3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKelwVBFA80QHsCgPypH53zAnfTgkITVXXIAttCTwlA=;
 b=g7MVjF1pMiU9+2h0f0ne4w09OgQciSoIC4M07F7jIrcQEF0zKs3z/+4+wevZ+S74BMT2qVJE5XXfuV2wvWEo2CppBvkKs/pFgVAYygcnP1+c6vDdcYxiRs9kOXIYNtg3tKrGrboW/G8hcKJCBY64vJ2rTeDmdsEVT3T5vDhv+elrPJ9fDuuGvBtxyl+mrH+1CZz6pu18t9O0gaUrXBzpmP5GKDSF2p9vWx/uqUromBJ60y8UbJbKm5SwrXfB3VSti1xnZ+rwRaK4nA9GjmZfOKSLeWJhXcCAVnjIQb9gGbEfpmuqOqcdvnnlwnJ/AikD9KaLb2EeMjOC48lXIV6lxg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9447.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:26:36 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:26:35 +0000
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
Subject: [PATCH v4 1/5] HID: apple: move backlight report structs to other backlight structs
Date: Fri, 28 Mar 2025 19:48:23 +0530
Message-ID:
 <PN3PR01MB9597F81842294D4E828385E9B8A02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328142625.12980-1-gargaditya08@live.com>
References: <20250328142625.12980-1-gargaditya08@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::26) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250328142625.12980-2-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c71889-e5e4-4e88-f3e0-08dd6e048b85
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|19110799003|8060799006|7092599003|5072599009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g6GZqfB5Z8/YoH3IpcSA/Qyf0fJWUtD2Wr2a4ALHwUp8ji+59MuJq10bL0IH?=
 =?us-ascii?Q?y5HTrtfIdSC1tcoBzHAb9U8LsaYP7z5eMCwSrQ7s0Meqkng1ASa8+J1z8cfT?=
 =?us-ascii?Q?0GRDmdxB2cw1nqwtIpg2ku1XpKnna0+wx12K8z+E/BOB6O/2Hu5k6/9jsIiE?=
 =?us-ascii?Q?YDkgG026miDrwv9KmbNpJqqVPfGf8+JjnU5BI1PcWu/C/N1QBJIs85CSN4t9?=
 =?us-ascii?Q?yPBE5bi4UtgXbgOZzBe+pYyorWUnzvw4FxS9xU5BCPzQfsNu6t8DTRyRYWFH?=
 =?us-ascii?Q?WpRtiZFTcB9PNyvsCH9zJCnBnhYgdfBzOXFooCAmVtVed1/kidFcDeCZn4QA?=
 =?us-ascii?Q?zrq+Q7NAQeKB5cx3S+XIJ4u6jM4KFie4pM9nkDLz11QA7tg6GJ0/N53+e4Qj?=
 =?us-ascii?Q?mW0KtgIlGtAG65z+ZQh2nnyTse/pxMOpfmRAl85XC1AZIMbHGHJLd8fV9ytL?=
 =?us-ascii?Q?OHWBj49iDdEUjRmGTuMtPsXuNyBsw5oZH23uChBgJ8sN259wAZmr6K5TLZ9/?=
 =?us-ascii?Q?QTsOTD/Z6V9w27TXzXQN8PTOe8ew9RA78ZqVukbyzlDUBGaDcPMEMZugueIZ?=
 =?us-ascii?Q?G1UY6iPQqEWf3+qCE6Wi4hveUdu4DK+7i/fKaYoZBdaSpUAWSWofvFXLUm9e?=
 =?us-ascii?Q?bRkDoR7ES6DmkQSGvPLou5w9h5SlN0rwUbPo8YiMeOXSE17WGdojX2aQzd+q?=
 =?us-ascii?Q?7JlXpBvfp+HR1FUNQJoatKC1UmHyAos5NvelnfSW4AkrtbtAx+XQkSt7Poa6?=
 =?us-ascii?Q?BPQnt7qRcHf+J8yPXp9imt389EpxjOi/X43IXysyp6H0rTiRmu9CEG7OCRTl?=
 =?us-ascii?Q?BEilwK2Zttu08nKdYYznGrVNCKKU6w1ue4dpG6bBtSTOgvXE5WzI/Xpg+lkz?=
 =?us-ascii?Q?lsYKo9SlORdMtaaaOEhHjeWoz3SjjMRdnQiSH1AapVsIRlMIU6UuKqN6L42T?=
 =?us-ascii?Q?YuHf0TJ0F3MCPS9Fg6pGao9svhRyFquUZKn9ZKeUD/GS+e9ENTh3jzWDuxwx?=
 =?us-ascii?Q?WFSHF++GuN/8Vyl9Gj56Nmmw6U5uBUy+EzOCdL5ZsT7msZ5UyTONFQb9+6pm?=
 =?us-ascii?Q?I9l6txpoF94uvukICTZGjVMQFe1pKgTdrKmLXxd7JloDSXqQqMdzSFE1c40t?=
 =?us-ascii?Q?ODWIBrxP5NHbglVhcYaFz7F5SSM21l2fAA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dwuGtphNMGMC4n/8zZPmtOToMLdVpJ0kqYZ8gvo4PkQD1Wqge30vKtaes7Zd?=
 =?us-ascii?Q?2WdMDYNWvG64ZytJnMr5KSUwTMCGkclc80P9DO28zfZVCmHl3qXWinYKx/RY?=
 =?us-ascii?Q?ZDsfsvdRAHpGHK30+zIZMFpR0D3GLoQ6y1Z4qmvV1MAYkFxtqHXNSKWpw5wM?=
 =?us-ascii?Q?sv8P7jBVTwb12BOjjrEWMgLqV9xMlprBDS0gucqWSchnmSj2CFa9d0JEG/Bn?=
 =?us-ascii?Q?BdQjWV6ax8RT4Dgx8nAwlYLicEgOkF3lNg/kJ4/QZngsxO8PGnNyCEwr3lDz?=
 =?us-ascii?Q?dlSR76xqg+ccJZhUdUN5WjS0VWvo/p9QEt7SW2ngxwc5twMADu9zqgx0j7j7?=
 =?us-ascii?Q?bYHlgPUL8Qk7znz60fvCr/iCEckqJbL0vCobuUVMVWWOoU1svEAMC0aOP+Qs?=
 =?us-ascii?Q?6B4zn6nhwb40vfOySPd4XDoQcVaa6KUJg+5dhzxd27x2p9esoL6EyP2hjpSh?=
 =?us-ascii?Q?gLkKnkn6panQM0lLBjEuiQDtkj16g8RrKZ+40V/I8YJSWo53EdBoK2+hcVov?=
 =?us-ascii?Q?qF2EWqujScQjznB3wZe6mHq4mX86hWqoX4/K26e8BEFNN0wh2iVPadSgWS+Y?=
 =?us-ascii?Q?K0e1WVAP+rXB233zVhryNoQBRjTir9GsnZKrTA8gwt2WzV6GeQgL6ldGsDU+?=
 =?us-ascii?Q?q5c+TRdHDFRB/DOKkOidN2QXWKmWmkQF9EUiTgNKVcsNTu7/9i6EIHL4Gttv?=
 =?us-ascii?Q?hT5BqiTSA7rRFtsTgtGlpWX1fDQgsAjU/CD7RjuqIv0DDxvuKCxz73TOkt3/?=
 =?us-ascii?Q?i8DrxWWcixlBX4/ux9m1fv1dcs5JpbLSl2gq594zaX8ON02FpJzJpCaSUcGJ?=
 =?us-ascii?Q?sctLuBC5W6NDZckOylPlmO/znMid9R7OVFsDkoKdVMLl5/AFL4LNW/wNEeRc?=
 =?us-ascii?Q?ljdRtFz65acxsYpKcXuwpbUa5y8wwTxrzNNoQzTGVo0Vo6G4hbp+izg7nPWF?=
 =?us-ascii?Q?6qHflsm5a5u95e4QbBMl9Rl7KOaNyEKCxTfy6kfwYT3O/ebPI1M5p0tisg2s?=
 =?us-ascii?Q?874XBjCtOGoqBzfX0MOKlL5eEif0wCPm8kLyhblpiNCGtK1+Le+KGmulpD/j?=
 =?us-ascii?Q?Qbfw9qT/iLOWVuv+Vt8SKNrDD+w60eTcRxNMMOW/JcPSCKAl4aDCUvrjM8Zd?=
 =?us-ascii?Q?9HTP49m8TqRZYQFppkJ+YUpfXVLXUsqzBwP7KjAzYFMw+A5UC68B521XtqU1?=
 =?us-ascii?Q?8YSH6UPZeWc4Bmi09szt9JeFgNowdUKPr+5AioN6ItDPs8NfBzohydt7xxvA?=
 =?us-ascii?Q?YV+kiAhblG/tWDlbcvRPr/h8uXNEuUtcGwhG04ti0DXYPsK+l6kIpGbop+k1?=
 =?us-ascii?Q?AMU=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c71889-e5e4-4e88-f3e0-08dd6e048b85
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:26:35.9121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9447

From: Aditya Garg <adityagarg1208@gmail.com>

The apple_backlight_config_report and apple_backlight_set_report structs
were incorrectly placed between the translation tables. Fix this.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d900dd05c..93b990603 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -89,6 +89,19 @@ struct apple_sc_backlight {
 	struct hid_device *hdev;
 };
 
+struct apple_backlight_config_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight_off, backlight_on_min, backlight_on_max;
+};
+
+struct apple_backlight_set_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight;
+	u16 rate;
+};
+
 struct apple_magic_backlight {
 	struct led_classdev cdev;
 	struct hid_report *brightness;
@@ -152,20 +165,6 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 	{ }
 };
 
-struct apple_backlight_config_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight_off, backlight_on_min, backlight_on_max;
-};
-
-struct apple_backlight_set_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight;
-	u16 rate;
-};
-
-
 static const struct apple_key_translation apple2021_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
-- 
2.43.0


