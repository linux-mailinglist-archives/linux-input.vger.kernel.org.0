Return-Path: <linux-input+bounces-12432-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2EAABBDB3
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 14:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64B6D189BC0A
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C4127815A;
	Mon, 19 May 2025 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="NmRPgdTx"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B338278148;
	Mon, 19 May 2025 12:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657683; cv=fail; b=m5Brqptfhelkf9Lphj67ZbxLBTPUNSiNe3FK2JyUKvD1mxROqBrfhlM2Ur5op/DSH89uEaHPA4KNmNGj3O4j3dgoVOROYHKT3QDd2pJ5TziEl6E0asFOHB7gHpaSC3Y2vkRnk4/WNbHKbwALdT+eU08ClPVu40a5kcJL2eJw6TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657683; c=relaxed/simple;
	bh=tK6ktO5zVsFe54YxmO1cSSCt02722oDI9sSne7tzAZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TYK4zfLcvu7gg1K2i+WZQNoAcqgFCGwoQn5U1XAoBRU1k/BAHcK7ZDpskRmhHyKEpGZdhsA1xbplrtvSLGsdslA1bMNdHUPgOKalP/x9t4enZMQzIUnrhMWnvkaiC3PNN6cVGSazqFpIh9Ao7EHk0QrdQj8vrPxjOjFYvnZZx2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=NmRPgdTx; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWv8UUufKZcPODZ8Q2MYIJvN+rltiVJpNUHZiz7n905m+ZtxwdVZ1FQAnH7lL6VWo7V/nxd2fj/5CRiALGQKRwu0kSiT79vKc46Hj5YwqLy1vZ2hSYvnquUbf9DNxFNkTVFKNIohOAIk9X5J1DJ3oR1eYvEjmyfeHD6XfrH7cYEPjXBHuM89D0AgBlaWS6Zm1kMwb3r+zV8KZ5CyXQNF3W0bwmIvtgNVhDTxiWNOOgF+JMukVMUbtXWd6Rk8WLt55eG9f3UbckhwS4+qIvj17dd83X7aMzW7oYh73is38a5CRx6W/vHSOdfbiBrtzZEey7byJXAKlhqWIRhU82SFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkoRna8qwRY1b4jBYzJS9NWdjTKbvvX9VstM1qKHwcU=;
 b=b2CRoTFUOKQfcaiPXUcOqyDs3SxmQPDTRFmnlBZg37fMccCU+3ofrKJzz/9wa0uNoiquefRHJ3CuVexjKIbWYj3zFafWBKGQTCMApZjVgAiJpO6eW+D9+rl6pIEDAj13Fe7bF438DQkdQMiR8mKLTuZH2Mg8UneWtiv7RKNqcgV5sMZS8W+KE+AZsn65l1BgZyZT8qB4yiDStDrHraeiR7JfvAerChFB67Uhm5cZuyw7Gu2wqpoV8jsBn0gfIpoetEAW+jO9ypmZa10a4x963bRkG0rJbuMf14j8o/sQG9bU1CHWMpZFXSdx2Vek1kpYeXxnlJKc6LtHsNQh4ZAnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkoRna8qwRY1b4jBYzJS9NWdjTKbvvX9VstM1qKHwcU=;
 b=NmRPgdTxMLDkFiwUdEPERtrCjDss2yEs3qbXy7UfTFmOfZa3qW9iqEx+oSDLjS9oPJ68ooClwfBlUdHgIoUCUbiry434CK0Y2l6EtFABf6wXAIh5HVsbfURpW2Ve1cct7ey86GoIkxgMGb6wVJ9hpNIxXtf6sPlSSM16aOkQ0lki2bKcsFjtuczD5eU1HHY3sEBXflIMaXUshXQhouemhfMjrSES9DMsDgcqFQKJNodb3d1ZvwFWpDSMI8sJ/9wn2FKZBPpkqoSG2Nsofa1RHaPw1GVixtWnzpOA4Hk/1CmvkClML05PIfl45vXkEtwrDBjcS8HJDKBjRvuZigPV8A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:27:56 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:27:56 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v6 1/8] HID: apple: move backlight report structs to other backlight structs
Date: Mon, 19 May 2025 17:46:16 +0530
Message-ID:
 <PN3PR01MB9597506BBEB9EEB27F9EA40CB89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250519122736.38469-2-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 14acfc96-84e6-4c7b-a661-08dd96d09562
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoSu68Y5FdRDlCPOBk43FEtdHQ+wiPaAVqsLOxxQwpTeUWLftjfpEIfRLE/dO7JnJxKNapmjPZ13ouCqbPJipOkvb55ER3n+nasJ8M90BAQ0GEPly4DEpwpdMICCRcsKe3qUOOOCz8LekPfqK1o9T4HTZwfYHRw85ilfEVOD/2yALdkowc6uRoYQvyE1WE9WxA00hOnxvs6Wrh5LuxAtnkeVObS1KHtPpVTkVhEHXexUCVBZZrddTRQFC21IjajxsgPZ/TmRXky/MBZOZJPIOu7bXQ41YKYubigKix1BrJ4UrlJcQLoqcsfj1C3u3+pRx87x3i5+xa9d0mcOE1X3OR1PdE51bi7tTII0QARhX+VPXejny++lGwQGondDcyoOgvvTizo8KXe3ViogFbN46O30dX0Ow4Vgwtafc/y/j6MhM1OWEsEWIU1zO3pMJ7lzqUHzRjqF551w6mB4OK3VmhcbidBqh41gvUO0rpFutHWhmYY4MdvLNT8xrYxba6wtlmJ+c3RHO+oXM1yNXJtqFly1SuvJBkB2uNfq13V67zvuKNHbpLBrM7aYSOXkaqkTqpZ7j/BwSg0hM1gZxHMw9ht8KfyAN5BO0sc0vb/1wccVslAxE2wJfcqezpcLVhnlVnSpBAYVslQPR7HWo1+7XccSj/8+XKrw9qMyRkzjK3MBPwl14nFtoFFZgOOe+X7hK8w7dA9K4TDoxTLQmvTRLA681wGaLXbDGWuAZsS+yz327jOeOFFOgwPtoZagx2YVc8=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4moRnR0U273SxA7xKHck+2anZ1Bx1Pt+k6v/iYzCBXMrcnveJU1YBSsJih/+?=
 =?us-ascii?Q?Wic/MLm2e5YHxtiX9fIXVAZ4P9i3HpOrBi8cf5QPm3JHHH0036OVELLjGk/K?=
 =?us-ascii?Q?+VU7NOycnUOCLNevvqOdFrieJLWcrgL+haEDpx61OUAvHxD0ftYhK2M24P6B?=
 =?us-ascii?Q?DDz+pr0lDrea+8AbGypkvJquf+j6HsFu7HQuJ52m5fakyDNnC1EKS+VpS46Y?=
 =?us-ascii?Q?E8CLSdNr/OwmWNTeVQmq51b+27H1OIUYmPfZrgjGfwkR3OOh/tKQWwjh8jbR?=
 =?us-ascii?Q?NZ/XPfdL2lNGSJu52prol2ugC9hFLldvT5KBHhvWFDHPuO3YqLxfOJIm/jbp?=
 =?us-ascii?Q?ZjAqibDN17F2kZKZk70ChTdXtMcr09678bTkmS+F9mw7p1G+NyaHoyA6lkTL?=
 =?us-ascii?Q?IC2s90eGi226ZNFJNUQ+drcv0jk0kEh/Iphv+N/vaH0ZJsnkdl512WnvjQ40?=
 =?us-ascii?Q?VwfoZgB+YUUOe+ds8hp/He4BgzLIoPSurU060pA+kpaQwBzn6bN4ZFTH/q+F?=
 =?us-ascii?Q?F9ilK0tilMZPx40Gcnf/k17xxMBp/eh2D7hBoRN4t28BZ9mLUEumcqBh8ESI?=
 =?us-ascii?Q?iJlhmAbQYCCDwKNO+Wqn3eByIF12FzP2drG9XpfIii+e0LLEa/3xyvcAMTmQ?=
 =?us-ascii?Q?lgm55leWzFLWXetWGDS8QTNV+a77io1bUVUNzxPVavGWqoEd74b2om2VRlcI?=
 =?us-ascii?Q?SwJQyzNGfcfTBIPemkbI3DbqXC1FMBVv4VRtgVAgdhtEtn3YugvFkXx46O0w?=
 =?us-ascii?Q?3fakf+TIJ29enKO59vZ6SfV9OysOUdyJ3YPbEIYVoriL0CcyuZ/eTCjNXouD?=
 =?us-ascii?Q?dFcLANe/98drBPruunpxklg2R1ElxBp0O5ffWwcWXvmkOjW1F1R1WA2O9U5x?=
 =?us-ascii?Q?IY2qidFm1ljkAC/Utu24DAnCoXym+2kZdy73IhzMW1Jxi6Rh43xUAUrbBu9v?=
 =?us-ascii?Q?imFG5Ov6Bl07mSrRZHDx8cR2Mp23OkRsizsQSaVxN0Txl4vwZHkkc+fFBhn8?=
 =?us-ascii?Q?HJw3FGhdSXGzIIXTLE4K+rMBlsou4ha1WxrOkXxEayl3ka0ipp8Dl/xFlCaa?=
 =?us-ascii?Q?0USyTdTFrEmuegCeDrQiSNhtZBBUawK5dQUlAsoffbfsgZD1ZY0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?97RM/c7QIykMUhD+Pn3lF7+4xuKsuBpJjxNJATI4rC7HB7ZyXKHfksurOk50?=
 =?us-ascii?Q?WBhsFryZn4Kc5vguG2vOKkqhSprvsxEZZCtxRxOtaR11MsaFm1/h0affmiwP?=
 =?us-ascii?Q?5L55RYVObeqJSztPzPfmhdtGjpy5ejGsMHcchfvMkZmU37v8aZ30VvjUpTZN?=
 =?us-ascii?Q?WKhSlnhSeh+6vadZS9RbiqnamH6jsY/m5dcMIH033J2vhinFVpBFadlFHaei?=
 =?us-ascii?Q?fnfVmuomQwVDZLOkOkL+lIqcgGBYk32OQ1x3BGXGrG+1xDIJP7qIJCfElJIy?=
 =?us-ascii?Q?kn4jLTezKsv1DKEtj3pWR8ALX0YZAQHTV1MMJhSx96rY9W4Avaj6B+GFYPZj?=
 =?us-ascii?Q?4YCsCiBTopCMpvJWWpdE7DpdeIyMgp+R8W2GgBTbmtgYdgYqVbLpBT4NTyvV?=
 =?us-ascii?Q?c2mtdZE9PaWtavxI/iKnpYZURMBNtH2eoa4SXmEDRHQa145K/SeRGEE6QfSQ?=
 =?us-ascii?Q?9mJJCeGCTJMpDhzdFKrJvSr3dTKk/K9DfNdRo75e4OLeNmSV3yfch5aCn27U?=
 =?us-ascii?Q?8pkJRCy/ORYhUmg/z1jJjXI4dxkj0+hlb0gCheBhiB91ZWq79y+h90i8Xu2Y?=
 =?us-ascii?Q?gvf7SDzQpUVK4mWmOw5kjsTql62Lrg2SdobGy3ovB+Gxln4qQ4eru3MkioPB?=
 =?us-ascii?Q?J/S4Ui13GXDIc4w7p/Aht6XJmFaHh+VQ3nmo1dPVNIwrZ0xKU9XD2fqwWnMP?=
 =?us-ascii?Q?Rxq5MeNIKL5oBgOpQAte4/W1uNtR3574GYRfBxd4oaDx8RzkzpTAzFGY2414?=
 =?us-ascii?Q?NpITFbL6Yio/QWxSOjNYyF4CeAEPctCNNeSnckBNDdqqZ1dlsXgCAYPQTqPJ?=
 =?us-ascii?Q?m5XjXilm4OUXYP7onhLwzmJVemcBWIuIm51yLkuCU/vUfvkevr3racMo/bpI?=
 =?us-ascii?Q?AtVqRv/LVIr33EVz70bZymsdDF0ETCuxn9WoduVhJBoBrG6Ce8SGPk3fq8y2?=
 =?us-ascii?Q?fQR2jc9cSB+Eljy5eXrSC48c42j53drP+h4eJL60KdjN7fqF18OH6sOYyjZ7?=
 =?us-ascii?Q?/bXvenQaCoR1lBBybsn+pkCqO9OEhxS+csLZ8WpGDvPxhbyuM+bEpdSYs27b?=
 =?us-ascii?Q?BlMFWWrv1orIkped66qLhieJmuVR2NyPDfMi/KXX06auZnVSYtP9gVystKFl?=
 =?us-ascii?Q?hx2btNg/53oXMnoFnug5NJgfpzwQeXXsWQjRyk3xTWlpge2Zhr6XFI2y81+I?=
 =?us-ascii?Q?EoPx9kpb+eWbnMUSiF/5lyS+wMqp3ixKbBmZDAEbjH0V44IrV8seMnVdE1fd?=
 =?us-ascii?Q?/mWQWdLLt8drSG1dinymrmeCT3Hq7ck1D/M3xFfo656KJBRkk4mjsV9bVo86?=
 =?us-ascii?Q?8uY=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 14acfc96-84e6-4c7b-a661-08dd96d09562
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:27:56.2552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5917

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


