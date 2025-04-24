Return-Path: <linux-input+bounces-11981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44665A9AB4D
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 13:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 209BC7A0FAC
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E51B20A5E1;
	Thu, 24 Apr 2025 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="C6C7KB6C"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010004.outbound.protection.outlook.com [52.103.67.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDC922577C;
	Thu, 24 Apr 2025 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492488; cv=fail; b=DVtfa9I1X3NwhJzOmJdMpd/3maJ2HAl87Z3F+TSh+6z4vuFaOPXp+xk7btnYFFcgyZN/NRLZnXb6EMgr+uyH0WePhDbm4Sb7LC3K/GCKaeY2xksYtBQ/fHN4XSD6R4FKJgHKAfra8O6gzTN5aBPs7yGkyfz9s/qsb6m4oglHAbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492488; c=relaxed/simple;
	bh=fggrRve2ZxKOPCbn8vzQxvCsxSOp9zdGwpW7ra5jnI8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ipsisJ+RKzgfoLR5IUUxhFL2VZlYcUkLmjP4bZhScNBqhB925qFKLxJDE/Wjf9lXH9V072tpuJaCIwfZZAKj1yLUCwjjGbzz/p4kcArBtbCvHGQz+eor2qYPELdmGcd0QkH/bzBanVY2si2ey5z+KcA45lWfDXjzPWwkB+W1a/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=C6C7KB6C; arc=fail smtp.client-ip=52.103.67.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPL7WMq4MotK+NffRyaVWbb2jawU6K1zrciHGlHemik11Fm5H5LXstFXE6VZzxzDnAZ7tF1hDcxYNg0ifacYPXvr2mh2RW30fW8E0nvClFsT+ZDAYCjlXbdrpqyD6p2WWN3KEmSqaUNJ8Y4qsLLwYkUlgZuxk3sbc4Hi8Zd0OMiMpheDiWsWs+X3h1Al1ZHub1I1H4xLbZY7K7GsyGApAQ3ub5KzRdOuFfNly09Wvm0BV2opl4ATcmS8L5EjRZg0cin6H9rqmQoBCijcG3nuUz0lU5wRMAVIk1eGLD+AqSvGqB5bwndBs1raciwQmrRiw03VnbSHQTfvAaSQgxE02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqKa0wY4bV3NTq0yibhAhBLHkogLpa1XKd1fHX8tdGo=;
 b=iQm4TCLOihjZRJq8iwKj6tVh17yZQiAHxIDXJdfjUdRSxtuO6R71VzwUxFXeUaWcjIWCecSAaSkAfVdsJjmNq2dVuwID5p/YEJUydcXKZcTbQdq8QEHGoASmv2ibMBMvWSJp0CFACHSjRwHXi0QXA7Jv5rw4uaZx/faOxijsMymc5QJEMYujwT85lutjS8wCnggXPhIBHq4yq9X8984mRbyQ81RbN00gkvrvPW0AswTmfriODrw0+CHbF48rPuIBMiW+FGiXuYTmI91Ok4obTnXqubn1Ng7URsWUahJBE+eomw6ZxJTSpLYD9KfrasFrjQIiMEAEKJ2RVxqCuHkhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqKa0wY4bV3NTq0yibhAhBLHkogLpa1XKd1fHX8tdGo=;
 b=C6C7KB6CM8+FY7Ar6z1cYKse9TxDCzDePf5jX1QPZOn9aYM6aIAV68VC+G4ezFgjxgr0HoFcs7aUW8jbKyRZTxJb1tB1z1BMoEuKi/DEWd2/yqVYQ/v9dvk4Uu3YfF/fIOvrLu59uKbUOsl6tr1eBDuZ6MPiFMhacmsR7oInovdZdtpZleprbodmbsM3+QBlN5o7VK4qvqYi8Hyg3kovnmNY1cYp22n6WqfBiIqhz1roJdHZQ7fc9yLknDhZwbbCRBLwC+1d5t5H+Crzlj4yan7LZWo3zY/YpMMmMnQrrQXQn77ugSVWXp1RAR3YR/pWTCI7d8Idk2YlBT58YM0UOQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PPF5B1F59906.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::491) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 11:01:22 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.038; Thu, 24 Apr 2025
 11:01:22 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: magicmouse: enclose macros with complex values in parentheses
Date: Thu, 24 Apr 2025 11:00:57 +0000
Message-ID:
 <PN3PR01MB959713AF6F9A2EF63E47440BB8852@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250424110057.10094-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PPF5B1F59906:EE_
X-MS-Office365-Filtering-Correlation-Id: af802cf5-b3e8-4750-3378-08dd831f57fb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|19110799003|8060799006|7092599003|8022599003|15080799006|5062599005|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EY9QoLY+09Vf9TvNQUpZX34lMB+C1Pg89T1LlSCLDvXIyRhnyiDGBA5/uH2N?=
 =?us-ascii?Q?C9/tLbrw/0b8/dQk2O75TbuKK8GYTXIvj3De09sfEX8VnAjQFjUHH5o1Igpy?=
 =?us-ascii?Q?tCVBCfdI/yB+fIEy7gVry9kJqM7uDXwUWcCAJb9YE6aaqj7tTM8sDFc7tHz3?=
 =?us-ascii?Q?Vfzm2jxdoRXCNBVx4PPWDew4OkwDdyEbCn3UyHtqaGSzEi/V+vA1u7FK2zZK?=
 =?us-ascii?Q?O7hR4j1CHrgbP9Bspp9cRfVBYBaf036xMojry4VvjgZPDdIqwNSh3Ryfoikl?=
 =?us-ascii?Q?K+BkO+dBupzqI3K9aLY1jPo1Ud5vWWxTNNdpHX6i7PjcpSZp0aH6VoYuhDzx?=
 =?us-ascii?Q?BQdMJQuXlLaztYh6EUKdZOmxsx8EmmEZz+w5bl/D2hOXGkWKb0OjZPC710+z?=
 =?us-ascii?Q?m4PZLEW8M76oDQMH1gP3hrOhzYyDuHMmMTD+RINVCBwR1Mer54vJ/7Zltb0+?=
 =?us-ascii?Q?ton/i5Cq2InSVUFK+jTFAW+xZQPreirNy/r0zaW6DGWP5dMdHejIGIAYYvxS?=
 =?us-ascii?Q?h59NLFGzjQPp/x++MgeJ1emnz5iZmMCa4CNnenn9wHrT7h56GgFq9exqLgcT?=
 =?us-ascii?Q?3mvwyC6vs0aDYYDgFyC4ovFKpTrQ4ipgibTelnNtvXzVvrmy0jQiu+TEpHb0?=
 =?us-ascii?Q?SAIFwv3ZlP9Bxrsv2sRWkRKGoyCBxPC3S38xAVfeh8tdTE85rtC3xcTYtwC+?=
 =?us-ascii?Q?t+G/oCVC+KEkj7ZsFEPR7lBxOb3SoGYu8y7bs/OFdLtmUBeryaOCwPQx9eya?=
 =?us-ascii?Q?ZNGv8Pfy/EdsA7S2XRpVKT9cy0px0pwYWMSUSS0XOaffHZPSfvnCe++pBQ0i?=
 =?us-ascii?Q?lwa/+rhSilxGowjHzz6gLsBFRF/A7RZBFYglSk1LIkyUW+6HUuCrgmyqoiW0?=
 =?us-ascii?Q?XTcnWe/uxJ/a7+0/UXzRDnDZbqhwFx5ZfbL8SRBLTY3L5jy7zCz5PlsCDbR3?=
 =?us-ascii?Q?Fd8adDdILhri23hD0dmp0rppiV+lWaCx05EOm9szh38EiJAHXcA2UYf4SPbM?=
 =?us-ascii?Q?MBTY8snAZEX3wHO2P3dpGp/MGvmFVNWmfR/OXzHiYqCvKE9NySeniWyoSDpj?=
 =?us-ascii?Q?H8ZMLpxxTzfzswbJpgZd9em6I2XZ6iAdEeeLKfER2GkBS1LSj1Ah94dSuem9?=
 =?us-ascii?Q?M8ZiHA60424adXV2qFP8WretMGakbpfJbSB7IrQoz58lBMitRqwwlkM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kulhLK+DPymETK52qV2Mz0kPIrp9c8ubfrq8OzskCdd1/8aBbzendosvz9LF?=
 =?us-ascii?Q?SWLfaoiVBB2xkAsBYNV/oP8nc/A0uumDrUsklWJ51O3CbalNKOg96N51T79H?=
 =?us-ascii?Q?x31xNhVxrhCds2COSF1nWy/Ss9isH+Z6E69Dk5iHExRzRlbDAjV853sIJuPl?=
 =?us-ascii?Q?6hLKxzB3HlKXquLA2wv0Ttm7oKxRUXbzlBo06Gdu8XDdCJLIVnOB7eIEAguf?=
 =?us-ascii?Q?KnbVs72q/Pi8N908DynjPqPkCeOofVUuctDoDpnBTitWMYf5evLa1WRHasRh?=
 =?us-ascii?Q?ToRsqBRbpJSJFsGSSSiyh54qRy5LA6D7Goam92IPvYiFhecMyzCsCl/AYJd9?=
 =?us-ascii?Q?T2lAyRODcranSXiBxW++xBL6zFBln9R5gRYJZF14GXrqNhk5ymXZV5t6lV2B?=
 =?us-ascii?Q?W+MbNd4gO7k+UJNM0QRL46XKoQEbg7j/3nuv5vFcUpSzyEHVr7378WbrEcNY?=
 =?us-ascii?Q?2YRgsXhcIwU0urRmxYT5UFhvxh7761ofuMGFFn+TaaQcjpksMZocpPelPTYe?=
 =?us-ascii?Q?9jwrlg15FoC+owCO+vZXlPQb0LsVwjc0+FhtMlPCRZ/A4bM42WzTnE+cxBGg?=
 =?us-ascii?Q?ye4jJMFg1U8iaS5hwG8adHd48pcFj98xt6Iij0vjHcSRNkZvE+0hdyTlZiIH?=
 =?us-ascii?Q?I/EQfdXRnzUGzMkRepotbKprE+Pt6QkM2Z4YRKZ4vwDEqnFlbsrZ28J1wiAR?=
 =?us-ascii?Q?RxijPSX0udGacOC/g4MHUtgjBy6kUs/fRW0nK1EbMXwFaMztdfAm0m3oECfq?=
 =?us-ascii?Q?FdL2WoVaS4g/bolOJ68ItdrbrRmLUROLbQ3ZImUh/XykGZQ2IQ6z8Q6omhWG?=
 =?us-ascii?Q?UQh1CgYBBolBF6BvokBwTMHT76AabXnt38lwBoXBLKHUuSdURNFmy0HVYuxy?=
 =?us-ascii?Q?mPLgTJ46sfvlI+S6t82AB7Oo5dkckJg4m3Ouk3OPwqnSvEXyvbPc/uuBGwC0?=
 =?us-ascii?Q?S+2BlzWEwVs7K2FHyIC8HLRip1kiEOP9MJ1mMYLW0M0aIWoezC0Ei8hgbtTd?=
 =?us-ascii?Q?gc5LITmyuTq54YAhQH6qVVg/4HH3eZYQ2rZG3FY0sseHB4RGsz9ltZu/xLFs?=
 =?us-ascii?Q?kKCpHx3I1QABZFniUzc3nvpZ2JJJCyG0NFzGXl/kzxUQuTlUglmXGEuZPeuq?=
 =?us-ascii?Q?L4twGEvWUfAzLSjZckiQOWcAf8tb6D5q7SHT6dr9ehjGlJgqIZ2gASeo1W/c?=
 =?us-ascii?Q?DFAbXytQVHviImWl0HFJuwiKVaj69SJYWms4lChLQDmkWaj7WQLSTTqkuuI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: af802cf5-b3e8-4750-3378-08dd831f57fb
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 11:01:21.9235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF5B1F59906

Checkpatch reported this error:

ERROR: Macros with complex values should be enclosed in parentheses

This patch is a simple fix for the same.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-magicmouse.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index a76f17158..d83909761 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -81,32 +81,32 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 
 /* Touch surface information. Dimension is in hundredths of a mm, min and max
  * are in units. */
-#define MOUSE_DIMENSION_X (float)9056
+#define MOUSE_DIMENSION_X ((float)9056)
 #define MOUSE_MIN_X -1100
 #define MOUSE_MAX_X 1258
 #define MOUSE_RES_X ((MOUSE_MAX_X - MOUSE_MIN_X) / (MOUSE_DIMENSION_X / 100))
-#define MOUSE_DIMENSION_Y (float)5152
+#define MOUSE_DIMENSION_Y ((float)5152)
 #define MOUSE_MIN_Y -1589
 #define MOUSE_MAX_Y 2047
 #define MOUSE_RES_Y ((MOUSE_MAX_Y - MOUSE_MIN_Y) / (MOUSE_DIMENSION_Y / 100))
 
-#define TRACKPAD_DIMENSION_X (float)13000
+#define TRACKPAD_DIMENSION_X ((float)13000)
 #define TRACKPAD_MIN_X -2909
 #define TRACKPAD_MAX_X 3167
 #define TRACKPAD_RES_X \
 	((TRACKPAD_MAX_X - TRACKPAD_MIN_X) / (TRACKPAD_DIMENSION_X / 100))
-#define TRACKPAD_DIMENSION_Y (float)11000
+#define TRACKPAD_DIMENSION_Y ((float)11000)
 #define TRACKPAD_MIN_Y -2456
 #define TRACKPAD_MAX_Y 2565
 #define TRACKPAD_RES_Y \
 	((TRACKPAD_MAX_Y - TRACKPAD_MIN_Y) / (TRACKPAD_DIMENSION_Y / 100))
 
-#define TRACKPAD2_DIMENSION_X (float)16000
+#define TRACKPAD2_DIMENSION_X ((float)16000)
 #define TRACKPAD2_MIN_X -3678
 #define TRACKPAD2_MAX_X 3934
 #define TRACKPAD2_RES_X \
 	((TRACKPAD2_MAX_X - TRACKPAD2_MIN_X) / (TRACKPAD2_DIMENSION_X / 100))
-#define TRACKPAD2_DIMENSION_Y (float)11490
+#define TRACKPAD2_DIMENSION_Y ((float)11490)
 #define TRACKPAD2_MIN_Y -2478
 #define TRACKPAD2_MAX_Y 2587
 #define TRACKPAD2_RES_Y \
-- 
2.49.0


