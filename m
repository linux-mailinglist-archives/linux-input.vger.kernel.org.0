Return-Path: <linux-input+bounces-12433-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935AAABBDB6
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 14:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 975953AF173
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93879278752;
	Mon, 19 May 2025 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="SjmAoXBA"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DF6278743;
	Mon, 19 May 2025 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657685; cv=fail; b=Y+TTnz8YBSDK0f/btQBt8KW0Zj7VTpt+VPBs9R5eEHC0ybJHoLsY3fx6+3JhFqnuUhzYNVxmXKsC7YImiFTosN98fQyVI6UftaNofE40GJmT6ZaaADEOTyh5QZ5Tn0FsDtZk4ZL9QS3trKiWCCBwKxHvDK341snDWox+V+LRjUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657685; c=relaxed/simple;
	bh=TkeXFRtl7bMbMNj2niwgIGeBT8TAWsrWfLf0vi7uopI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bWPigusKPzE6qV2WJLJTe+5uCm2kFg15qbsPUAkoSPeGIZNNU5uCWW4Bbif8iDQpO7T8pkItiap1TTURLxOtaA3I412LhhdUTpaBLxTUGkJpUto3LwsZWc/2P888KtKEWZZRC6ntonOvTJoOwe1+HPTdpdrI2d/T4DjX9gSfq+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=SjmAoXBA; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRJJH4q16vfnsUCH7Q/c69yzQfM37VrYEzk9G39fBTVzDWqYOzKh536JaQNyWdAK3YaBsjjX+E6j5fhuBOBaSocXLkFOWhU3+9MgJuU7APSQFdN6dIcWhPAG8Rbnhba3P6+5C3Y/O32G0EvzRIKIFPD5UpMja0GnT9KqXNamxXscl8C75WdNEoyfY5CX3z9nKU/HY/rynhUqcHWDw8pcgdczdaaGHZaHuQnPFTEPozxKHbfMxwUt8cmbkebgVhCnkiu+5SmeaoBHXX7/6k3xpXG6nOSxWyU352dult5FY2SWZHwe6STKSyUnNnx9aS1ZE4LSzMD6xquJHXwmlqSpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00krwKKW0/VcbJ9EvH79x9DU1zqCpeuZZPEFI9+3fek=;
 b=SIKdaeq5HuY4gr4ZiTNUSyLOGxe5IC6TCS1/pSMuelYQeZCb+B1DTumu3pXRmRCiHv7qCaCwEUatcW9cPJkhedru1Rhi2emOsmX4EIJRDV1b8Ua5sRoJXr5X0E7ZV5U3U7p0ky1/991181RczlY5acsrqMcTfQtSClc/Z8MzfF/lpn06FhYulDS9g2YgkN1cjZQGFkL+dCrcI4hec6rxg1FWgtjRyxB/rum73z+TDNB/4sx7cCI/bIf7wL456MeoTIbNiYwpgAmnh4FMQRDMlnlkRu3Zmk9IYi/80cro13crE930efKRdvvzpV7dgXmJN4EeYoQca6HnB1QfYWpYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00krwKKW0/VcbJ9EvH79x9DU1zqCpeuZZPEFI9+3fek=;
 b=SjmAoXBANQzHjTTFy2ez1WsJeeuOyhO/qZH9wcqH46t9Y7Tux1KrsIfzzNXtOWSpE4n9Wqks4oVibo94Rc+rjmKdnZZV+AtDNBBxQ2c7TY/mF2NNopriQJi7rA9krYcxAhFNCWmO8c8W4tT6vy1M8Tdc6hL3u9Cq43uGFavHn8x/Iqp9+4Nq9FXRbxDKFtHUqwwJGg520qzodbtypaqGpJnNlpT4gkuNwWGLFtl1JpGegkPX2hbeRXJdShIMxx6RmNzAYRETrVbVLNJS2/f59lA0JSe1JHr901vRvyqus8mQgsUMYLFWDEK0CY9txnnkZEA1XrU5n5F6pxRQrZWNQA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:27:57 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:27:57 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v6 2/8] HID: apple: use switch case to set fn translation table
Date: Mon, 19 May 2025 17:46:17 +0530
Message-ID:
 <PN3PR01MB95972D7D4DEEB499F09A361DB89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250519122736.38469-3-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4dd896-c71e-4d8b-659d-08dd96d095e4
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoSu68Y5FdRDlCPOBk43FEt4Vazij0oKYtJwH1GSI7wy7nxdx/+gh8esza0LcLNb6Y9PAUA8n07hzSATaJxz5gnA1qcMOA8Zswd8FcYMLwfDulviZpFfrtjqx3GlVmXpsvXNvMF3v7LUM5BAEVqLbr7UXyaE7RyNZLbeHO//88J8AWAJBT4XJEtB2CebY7HpT7mBsdRtCAwmgsox+ah618PwB7YsNshS1JBeOqI21/bW14IzRg3mQi14B1Drlk8kEUf96KEfQ5vTnfQc3a4eI4ZvmDOo9OjTNpxR9V0w7GwabwSrU6kZA9ipdSee/4gYL/+oX/asY5WEUldy1/rL68BtCITGnfKapPkXgNcFjhjTBVCvJbnZ5ehaXzBqgRGUTNQrnZyIBEDGEmXI4goAJMAwnqSQzdpN5tQQ0ilqhHAyc698Ih1XeBUO+Po8cpfR8vnaoZMkU0/AVh8DzvHXVqHQCkqFq68OnDEDtMxf3c+GawTfOWK6rQFmcKq3YVqA6IWWPZaLIxJT74ouu23LmsCW/jrwVTYdhHdtF+FIDY4q6bPuwgb7VUhRulultx/O7hIs19yk0OJxEGvsK1YB9paAhZWEgM5g1p9obMomJoCje35+eSIt6yGTijH1xJq3QCDvFW3lAURZqoZipHJQy3xrz64vig+5ctIbvmrVRe2paiQvmhnI0beUaqbZxveG7Q5HWvm/WJpCo441SB42cS084LENEUvkAzmpLLCnFnSV5ERmvwl2zZ88ey+/Py7DgI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LGqjmrZMa+oqMegtH8plKhaqyGgnblPXIhF7ea1lkIj9yqX3gV3GgBPY5uIz?=
 =?us-ascii?Q?Fn8vUvuZ2+txqhKCglG6bPrSw6vAEN9e5Yp67RE/vnN7XkzrixBqvjqlWlO4?=
 =?us-ascii?Q?zPLHPV86XZSnZPfOi11mExNrwnwZLjlrgbYV/CKOiiagMh5ebn/XZOaceBDv?=
 =?us-ascii?Q?GpA3hSD5QxuSUURcV0vthWrEIdvzy6mBJBiR38cqLGwPTNxFoOnxVjX4TW0v?=
 =?us-ascii?Q?VndHtFVqAaZCeoORpIj/i3ToQ3ENFIg7TE4puYL9BfAj3RLDuSsV7MOjkLH/?=
 =?us-ascii?Q?yh0AJhrm0L6dMZOszFzV18CM0JoryYrwfrYN/rf2HAdSnbxo2TpK5HaPWVQa?=
 =?us-ascii?Q?ZSGaOTzf+7a4YaLK6Zhpz5r+/amzH3P3TeaX+2blqEO0JGHCwvL3vJevxzI5?=
 =?us-ascii?Q?FJZLGWu67kqXf/X4YZ8CQOXFczK0UhWzFCHQO2Pvg8bjBF/YyCnwrBRGr6Sp?=
 =?us-ascii?Q?yoaL3uFnZByEwIQyHzfNxKE8nccIgfddjRgRS96YOixr3oGnV8YYNNBa/ymv?=
 =?us-ascii?Q?s5U+ApFGLjUbZQHS0n362FfOrm//d0PY+L5J/3tuJ3GKLwY2o2FqWltX4PVb?=
 =?us-ascii?Q?gRbqc9kM9MasS1/CTxyd4z7dWBvjqSqdUzssqjoSz4cOH+fzvlXlj8GsA4g7?=
 =?us-ascii?Q?uEm7QdXSTvZgGIuG6q7rL7yATR2hLtLkyOi7HZBA5f/84IXf7w1eHbTNBiIm?=
 =?us-ascii?Q?VlzXgOd/tWCeQax8c9HV2MrQvSBsSGE7wdWO/RZ25C623c6sE9YVee/8Bvs3?=
 =?us-ascii?Q?HyPVDwGKB6LbsQHjAQ2qd6SbtcDtMxei1LQIu55ZJo5SmSPz2LTgySqP6Sg+?=
 =?us-ascii?Q?EVYBbXDUwW8tHcAlf+1z08eOCefjgpdM/GToPLlzDrdgEoEeXHNMGFjhe3CJ?=
 =?us-ascii?Q?dWZEIwcbEdF3vAbOb5RzELfyg5CTsZkcLHNcGQT82zIQPJEU+Txt2KKZ3zLV?=
 =?us-ascii?Q?QPEU/qFj+Itv3SddrAeHJAFqnLOvDdTc6h5jmaJr+7qRZV/tKr4OTLQ2NXra?=
 =?us-ascii?Q?J8WUny/9CUkXKmP73whx+Yw3evKQ8NOazm3T1aJ6NsWDj/nW1NXgmhHgwD2x?=
 =?us-ascii?Q?Szpa7/s4V9ARY1C7kNqOEr7G5482bFsH0YjC9mrskALsGvooxoA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?deEyJILRKkPl7yChrxukP3gSprONofHQU2P5g4Kf46LLHV00Ne6EMHP5+HRc?=
 =?us-ascii?Q?ZQ6lUB4/zJEGPJUqLK/qVoymQkGTXFGbparkIsYFR0myp5h5suZ1IBD+VBJ3?=
 =?us-ascii?Q?ixHUrHWx99Ik6szSaxtdoTVPIaIvQbDs3OdNM+OydyNfh4Iua6yocj04EF6e?=
 =?us-ascii?Q?BEhtk+lWgMg6/fjWgAF6aaVa9okKV19yT1f1c4YadpqDxQ7+MHtLPpLVX440?=
 =?us-ascii?Q?uUJw4YOzRArm8VCQgQXJdzCHChwYt8O436uvJUDg+43pJ9GalooLtW3ZQTuT?=
 =?us-ascii?Q?3oEKE+ABW2f/eqYQgZYE+9OdkqXCztDzgzXpcB6un3x13qoGnWlmq9ZWuod3?=
 =?us-ascii?Q?i88Bfkz1Coo1OPLfCAwcb405p6xHraEv5pn4UbJcHB/NwMoiiIXA0FEU+R7M?=
 =?us-ascii?Q?5jLYucdRxEs0Cjm/mhXMbXN3/Qp6gfcwtb5RGEcwZlqZyGXjGs2Ay9+K3Mjm?=
 =?us-ascii?Q?UGsAjvl34nfr4nd4BU3sZYq9aReNGgce9WDDpatLOtZuvSEqaTtxAqCKMH5+?=
 =?us-ascii?Q?yRSTPE1aWcGR0UdGf26ZOc9bu0lGrztoVE/zIWPb7Jvsn+6knz0DGk02uD2X?=
 =?us-ascii?Q?okNM8aSwCPpNwZiR40qwT5t2izCZdAabW9sAMf5OkENzZtH+f20Cfhkz6z7F?=
 =?us-ascii?Q?dcUPu6PsT47Omk+s9LO/z12h5oBhJcgzchJozgrMGk23aLxADoaNDaLCZKEB?=
 =?us-ascii?Q?xrekCGi0/0fjsaJYbMnv4Sl2oPnzamUU550nLmoOdsD8EQNdBt5zcCgWwxX3?=
 =?us-ascii?Q?BZRiyqLbo2tZAUJzkr9J+DSBNM3pSe4nN8xmpPu3JktNX6ZtFgP8D9y94T1N?=
 =?us-ascii?Q?JLanvhFd531WHR0vEUTkk0/fuUpH7qKlTRVe0NiL6ICv/2dKFx2NHHl8bWcW?=
 =?us-ascii?Q?q7ebieb5dDsvz8Rpqf9GueHp+zwku70ChBzVfkSozDipUsR0wJZECRqSRDp6?=
 =?us-ascii?Q?wcufscdcblLgRwBR5cNmgiQkM+ND5HoSSI++1hXuxE6gOuq3fix7sG62yjrQ?=
 =?us-ascii?Q?D4ElQSDe+wJh3nBirHD0XBEw+7kcKKLjwZXM2bMOX3B3Wb81Ww/mIDsbhpal?=
 =?us-ascii?Q?6NSNmAC/06Xi8k2Kwa3lhPAdypToDMinikwAmwczsajmTSf8DZbCWG8dKNIh?=
 =?us-ascii?Q?u4FMXoZo5wMZRjyY+VCjCfsxGJ2bEZVBgmDRIoffkZybIPkEBN7af1W7SWaq?=
 =?us-ascii?Q?XCTYPf3FTbU14EJ+Tx26CFuXnBOfAD9SuHbIVq9RYA/W3EmdmFH0ofgVGXn6?=
 =?us-ascii?Q?MUzybc6k/AS5ZktAdLEJg44CVR/asJE5uLRKbWo63g1ilbVOYJqRUC01Gjj1?=
 =?us-ascii?Q?ykk=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4dd896-c71e-4d8b-659d-08dd96d095e4
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:27:57.1688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5917

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
2.43.0


