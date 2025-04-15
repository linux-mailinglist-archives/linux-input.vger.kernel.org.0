Return-Path: <linux-input+bounces-11897-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA9A95302
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 16:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4577518907A9
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 14:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFFE1DF27D;
	Mon, 21 Apr 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Z3iEslNg"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6373D1C7015;
	Mon, 21 Apr 2025 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246875; cv=fail; b=OKd4e57Er9prqfC7y/J12gUkUvxcp12KVIWdW70F/yCbJqG6YSBv1Fg50mgSNL58GfyhO9IyHA4qcwes2x5VXLZ2fFItjcNpFNu+HmQ9BFIXR/8I6EhBTTmaCNsxpb+UEUc5BDTYIccxXtOXt3Qa/pzr8icvczoeXLv4LSY8Pfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246875; c=relaxed/simple;
	bh=fgMhtGPXTg5TQkEHJlL0WZ1JNZiV4Lqv/qeyp1wyGM4=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=XMqPeRIGfWNtrChi/Bz49sSeFHO0/97QfMgMgPjv1pgBrMW5D7nI+3mxDhZdRZrf+aggS3pYie0tFq2zLs/hl3Q5fUpjor3WvOfjUmpyjdZ64wkysg1wfEZbvgMtRjbtStAtt3pf66Ey+kyMV4zIdZWEfN0aCcyMqmn4c5sM9i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Z3iEslNg; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWt2j9ad1EvAgeNzFkjrnrS+fxcbd6Z4dAXPsEgevsDc9518/6mJg/l477S/vst/5R0qTR0S+IZav9Ha2XCJudZ3q+WvjQSXh4nejwKdX0JAUQQYd4t0WwzTzzKbL+/vrpPdi6SUk1PcrlpO4WuLDRxjL17tHvckeq0PLqkpbDbThCAK+BpOQEESK5hl2mFVmeTumFo0fvKHODac1CHTGOsoo9tN2CNp3eEvnel0/t6vMgeyBSSypakLRWfz2EaV4uwas6MmAccWPg30DAxSAflWGLhAOiDg99tgORggGllIXBORCcHOZSr7Hf2VwBRS0TQVnlH5Zj+2uNnVInNF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93oSHdn/OjGX63rXFaBYSNYNw6eH+4EwUSMm+W8tYbs=;
 b=DDypcOck9R0IdSKbV24qNYjsuDloEYlJ+aMo7X1eaKR2N9onw+Iw8JfovA+mHaPFNCnUeHbxsYBAqV+FuOhb9exXpN+qiPP8BAxXCXwT0Ou3Pms20WCgkM3LAWJ3NgwxjJrd/mdd2df87K3arARm/Ev/ie+S1FH7csj/SgtHqHnY0cUD6SoPZpCo/Yhafm7dksiJmZ9DsynV7NdPwqAWu5yL47cKieflwfH693CSGAG0rLty8Vvv+CHN0VY/5hlb7z7gzAp2zFmylY26v+xfxK+AhONq0ieEYf6DGWscN+LqrTMVw7HPlrZJWCsXy3x2nIyaA8d0gEZ2Xxr71oJvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93oSHdn/OjGX63rXFaBYSNYNw6eH+4EwUSMm+W8tYbs=;
 b=Z3iEslNgtY7OxemzYA85rMruik2Azm9pJqHlZe9L/sBtMZMai7zUSHEpPs+oVSjeDuLb67mG6ifFid6lu+FY9xPKvBEXOS5L7wj1yq5KUZY+VsvSyWEdDfGNk0HeRxqJeeHeJH7X086fuJRI/ebybjTX2Wg3p4ZJtYekmMWyY/K69geV2s87b39t09HsW5nAn5ndXqfObldwxnAArrBhD0WstsHQo1NApg1knJ2RELPifmtaV9s+33r//vKCc0x+EmvHGkgxgaG1dTBkJWVD77t1kFzk08olzSKvICSk07FmuUUy3pEFqLa5ofo0KiG7ElpVAkSpQKkfN24tLu5vBg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5918.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:65::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 14:47:48 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:47:48 +0000
Message-ID:
 <PN3PR01MB9597581B6B8F7BBCE0E97E73B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 15 Apr 2025 16:11:11 +0000
Subject: [PATCH RESEND v5 2/5] HID: apple: use switch case to set fn
 translation table
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>,
    Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0125.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <83172542bce55d99ecb6e0c629d9d215db7d3f1b.1745246807.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 842780cb-d3c4-4d68-2a72-08dd80e37bdc
X-MS-Exchange-SLBlob-MailProps:
	AZnQBsB9XmpI8tRyoOXaSUmOkLVCBKasKYEHMoA4vilhcwvY1cU08p6v3bWiJcm8QvpyS0kRZD6C7vCqsD+Fn8a+O8wIhGiYTrTdUXqYUtlGmhlHVud56agVhoi6p8n03/6YLryhVn+RJaiPrc/V0FIencNkPbRUHv2+m4s2uR8CK/c/D1lOPr9cpNj8f+/n22lPN3ya2svqqhFr5p/G5RWZjddsAqNoEoa3DhRYcZergywbYg7KtaFRhqtm44/7ZnsxJABb0HSVMqBmhJTKP7jCbBdBus+NtxFOW7MWQ28zQVoJESgP3P8yetLHQNdyNpAmjnQHEYE4HnknERbm375pkNuRDiQucqMmcZdI0OSLegWF0Zh97WhN+XFDgvugRle8eoCkPE12uHZGm19Hwj0OGNYLm5Q2cBxQur6iqxDj3FVkr3sMhkO2KiVAZXztrIo65wT40sb6LsZPdcx+iB00nMl+s4m2LAICxTq2YyS1+IfUfHxzZfHlqceXl9S1bg5LBLckjsNDnC/ZBnfHoeaub8EbZ1vOtilNaIm7fEQTfBbtsWlNvSuXbjb31BJxBpHBwi3K8psW65hYU9NKsQmNc2DY51ec4NhFBBOeKf3inHXL5Fp1a3I6A/1VUcUO6FN0WF7HJK00fFkby4QzKVp8LouAHnTOZ7615Mmu5ZP5CPBA+y5ijbmyyhTZ8igM4Q4r0xtZWap7/+7Tt8svsssqEJ/F/4jjPt163R7Uxtx3pTRMrD+gpyCG0oV2RPNB91tWPnQgHNY=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|15080799006|8060799006|19110799003|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NuZFyFRpHbVefPHlSJXLkdCQ52IZyJ2xUe/G8ktMw9uSudZL/J6ELzQdgAzr?=
 =?us-ascii?Q?MK7pD0Ut4l1cvwhAgCf1+qX2phgs9VS1VkW70rwEowVotA9ePXC20YpOaVpq?=
 =?us-ascii?Q?1gAK9XY6QmwMrg2MLAy8yWhNPTbVnBtP+T4DNgbVS8k+2wpLOhfOTk2manFg?=
 =?us-ascii?Q?DzYHRLE59AfIDLqZxfCONIYl88Ds8Z/q8+ma6g6MF2iX2u3tbpcrLq4bnihk?=
 =?us-ascii?Q?Xxd6U/XOiveM1T9jR5N1GUFa1mLKNUMTCGHwbElqDTgKHiwJeTe6w7P0DOMS?=
 =?us-ascii?Q?oIfi+ABWEv+nLy9R+IrnF3DIG5DJngHhGmxO/wmVMBrP3J0v42j2/QPnSOUj?=
 =?us-ascii?Q?iVrSMFlXNUkUcwoZOXLLlG6NT6mBDWkMerRaWuWcptA0AEAfyomi93ryHMtv?=
 =?us-ascii?Q?NDeGEW45EVPpAr6mOeApWjFS5FEBMFfSdpnEY0jfUPft7xOw1gFozV+DVza+?=
 =?us-ascii?Q?r5s14ofMwuylKehHELTPnBSArOa4ztUn5yrnVC44MKU0GD2fiRh2SmQPgGca?=
 =?us-ascii?Q?xTvQfxZpgVqFa18LAOKjhy8gRiFnCWCUXJohmkyySwxiSa5HFvCRSnjei30L?=
 =?us-ascii?Q?knAxJnPVom9Qy2F1B6YQpCwbWwjzjtYcChLR4ZefcHRYCElutQvfHwbePrAB?=
 =?us-ascii?Q?chA5q54uO1jngjm5ZjnZHDz7f26DkMf1g1k6IXlsF+bQgMbAK1b7WzeROKjn?=
 =?us-ascii?Q?xG9gxEuFmSfwf3LHyGgNX/fzR/sDUry7651IbrOC4ddoVMV9hgCBWj9OMy0u?=
 =?us-ascii?Q?b+th9pRjCQwpqDHyALzMwCr5zbGk/GaJpQB+tsQYTqn9JwRcF9deNGBTea5P?=
 =?us-ascii?Q?YVmF2Mc7wjL0BWEWNvXiLpeRzCxdvoIm7Rlpa98p0Q6iWrXBI9Gwx6escQzW?=
 =?us-ascii?Q?0FlzzEZurj11S2ZsIo7KpaSrBvW2WQiJQv/f3vGpECBCNENmXxbeWk/EwLxr?=
 =?us-ascii?Q?3cm78jQm/2O42ie4r1mBPkpRPuscCh1SOcrG8VQGq1OvoLtXn1hGtMKWMCbT?=
 =?us-ascii?Q?PT9lLE2l1mGU5ma9fq/DBBFkgV7VkJlQXshcYPFftCSyW2xpfNFTc71WOFp0?=
 =?us-ascii?Q?CQJu8K4TfqehUpy8XUSHfQxwx7DncNJ9vfUW6szSrZYgBrScB1g=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vnez5qvbUw5F8Dem8cCjS3I8kMCs0sTgvegzN0IBc+L/sDXi4ZeXhb/yP/Qt?=
 =?us-ascii?Q?f1pHTJnlnKO14tfLckXRIjapAoYxtkxXWCJZXLlZLKHN+PnChMTzqO5Bl2m+?=
 =?us-ascii?Q?U63QkS3n+ut2rngRthyDJHE/cMRQbqVQbNq2JXK0V/Nz1vxFqMFeNgUZq9KL?=
 =?us-ascii?Q?IB/4Wd1mQEgf12gbml21227bvs9avxAGLDeEOQKY32ONOh9P+IcCEeEfScnE?=
 =?us-ascii?Q?ndc8vYw65mL1/b4Q9GTZUzcCpVS8RVsjL87LfZSXwsIK80Pttxo+0/HsN1k6?=
 =?us-ascii?Q?H8+rCYgEZjVSGh7xR+GSCGpETvun9SUyJT6UJKGH2g06gD5rcrcD/3F+Vx5L?=
 =?us-ascii?Q?cz3aTjgLYp/EiI3jZt0IX08NFtG9e2iEWI7tcT3APr/lWOstrkx0RCFXYYFu?=
 =?us-ascii?Q?MfZ2/xFWy6pOkLCnkWoVn+CcyQyqZQpVOhVjcZhE8LuNAPpNSYCg9qm1Zfs4?=
 =?us-ascii?Q?oAoxmf2lkKrObJh8seIpS8revc/A0y9dKFysdZZwmoGTV1loEwSCOCpSTyBg?=
 =?us-ascii?Q?XIe2R/ugfjpW1eYJUt/RGBbVobA0ZkReEyiA5Jq9PE0PNHJMZjTHakHOlcJ9?=
 =?us-ascii?Q?MrjiyqaJ4S+uzVC1fTttbntMTfjZRNaYJiupruvgfv7XyB0wjrFrhOptrOqU?=
 =?us-ascii?Q?VAmeHUeX7iol6hbMWs5JSzBwHApZ4CfYvwhqTU+hEEHTV35imcjcMp/6TiKO?=
 =?us-ascii?Q?eeZurkluqaoz11mbOmrQAUczLzNi5oPQuzsSKvtjOlmpoRsEpmRnraKO3s9t?=
 =?us-ascii?Q?tPgxn/ot3GlWnQhXwZxuEQ1ld54BcHOoBXraBS9ZVuQbiXhyCll9Ne4LWk76?=
 =?us-ascii?Q?8oeE4lyFmQQvZME/IO2UZkj5NvBRIlhhuXApkx0P9QdfBWx1YYmQDQK2vhnY?=
 =?us-ascii?Q?BQFVF2WJYw570Kv2punQwvbqKEIUkl2jPlIh3PbIY4RBj5IHgLhXPB7hJ8H2?=
 =?us-ascii?Q?sbwLgmjyeOIGvlldVdpVC863GUzXLKBmJExZHhaWWEcqrFWxeROsT0GJbkQG?=
 =?us-ascii?Q?6loABeNtss+rd2JofskLmznxbmIYSEG2MiBIaY6ZLoEBLF2/eU7HIY8uVdKB?=
 =?us-ascii?Q?yU015RaoAUjnuYKnho/W/ClIL/Df/FVTu+CDhAlgsRCDuH2DU7pTDqPIp4rx?=
 =?us-ascii?Q?edA7KV5+f5PKrmKzA59O9QpZL5daS1ziQDkP/rDywWyR0J2re4t4A69z6jeh?=
 =?us-ascii?Q?Cp3k795iWIZ0l9t2s02c2NgnTCG3ZFMrAqZ0tKlPJvACUG+8nEDdRl/AZG8?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 842780cb-d3c4-4d68-2a72-08dd80e37bdc
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 14:47:48.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5918

From: Aditya Garg <gargaditya08@live.com>

There has been a continuous increase in the number of devices requiring
hid-apple driver during the last few years. Moreover, unlike previous
releases, the PIDs of the newer devices released cannot be combined in a
specific range, thus filling up the if else if statements with individual
device IDs. For such large table, its now more suitable to use switch case
instead of if else if for improved readability.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 73 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 93b990603..3d7befe0a 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -465,42 +465,51 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		asc->fn_on = !!value;
 
 	if (real_fnmode) {
-		if (hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS)
+		switch (hid->product) {
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS:
 			table = magic_keyboard_alu_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015:
 			table = magic_keyboard_2015_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 			table = apple2021_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
-				table = macbookpro_no_esc_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F)
-				table = macbookpro_dedicated_esc_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K)
-				table = apple_fn_keys;
-		else if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
-				hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
-			table = macbookair_fn_keys;
-		else if (hid->product < 0x21d || hid->product >= 0x300)
-			table = powerbook_fn_keys;
-		else
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680:
+			table = macbookpro_no_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223:
+			table = macbookpro_dedicated_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K:
 			table = apple_fn_keys;
+			break;
+		default:
+			if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
+			    hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
+				table = macbookair_fn_keys;
+			else if (hid->product < 0x21d || hid->product >= 0x300)
+				table = powerbook_fn_keys;
+			else
+				table = apple_fn_keys;
+		}
 
 		trans = apple_find_translation(table, code);
 
-- 
2.49.0


