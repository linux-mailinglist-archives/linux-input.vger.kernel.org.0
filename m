Return-Path: <linux-input+bounces-11892-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 496EEA95186
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 15:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94A647A6983
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 13:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1592B266592;
	Mon, 21 Apr 2025 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="BU6LcxqI"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAC0266578;
	Mon, 21 Apr 2025 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241717; cv=fail; b=cUUUCOoiZDTt8NtrTb/YMImv1euelVHWEwEuj6H65vsaowLhbeWJ4CwqPaWzztxfDLLBqcEDEp6RI2SQeqcf+JcHKfHv1uI2Z6+Bkq/ZW68EmW/+bW7wDOH/GwUbF9+wPG+uSzJDemL4EdgFPVtH5N5TCUxW2lsOarytNp6yaF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241717; c=relaxed/simple;
	bh=DmY887p1WKX5lnaqaaiXL/2vbBdMl1/fAZQXd7c3lm4=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=ff9y9NEy4j9rgwFYjuBuR7c7KCf8FydZgRoc/LNY8Te1hw/FZvvfIPtehgTR/zcXhXNF+aL6X0JhF1oaRKoPl+pDvBm//i5RBFj+wKHvc49QYHm18hUuKndZnWBr1MKUDKb2CeQG9qU/auUZyGkmuRpGrNHFVbDV0zr9FgjQCnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=BU6LcxqI; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBicI5EHbmx4tUy0zauuzi5gnZZAiBSJMTwX5fyf9jaHiJa2lY6pCv2p7dtGOW6+rjDOM28s1/j+dkr33LV1K7kTwL4tOVk31EdATIbgFLk/o70I0tQThaPywlEb1vwtToTvkvWj+U6VWbyGMa57GctAWHa/gj+WP/w8fiRx8oE9QegxcqGXSs4kaKVOozCr+bW8bImfJfbYs+CJ3mvCOyDdhjGr8oNGUC+Z1NuK+wfZhM0hH1HrRujic1OdJNuSIV5dloH+5u/evNQnbtgV8batZ9C9O3jETuLBM8nHJkaJkMfXM0C3nlOHMY4sXzQVMD3de9RK9w/x85a+LYuyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuvfQtrxFOajCLHRPepiqXZW8QwhvcCKnYPv4jVs/lA=;
 b=p2C00ivYu+j6cDfZp+HWYFOM7BjFEQwVo045WnLpA4xu0PEb1+U/W7dRkJ+N/k2avTJkxyiqBqiG4luEW7ruQXvTprU97/HQwk7QtLjf6Sye2GcI+CwUPvBSfwvaHIqEQCFOnnF5OPx3nczeKiC/usC338w3Imvb4LmqVqA2smoRmSWMXE01/c2e5wxR2mBKCQQIAngNrPmub40QXiAyVo0YHeO1JFuoUTxJ0aFCur5uEMuGpQYAF7Mc6k5+M1FJqn/q+7CnlVzlGkylnT5oGo/N/u+Di0s0BWagj1/9GyjPt8kjP19FSdLKyjNMws4+Qi+tHRUqiuPDXh5lQZcNIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuvfQtrxFOajCLHRPepiqXZW8QwhvcCKnYPv4jVs/lA=;
 b=BU6LcxqIkm0bWSQuzPfNEl53UYED2whhUj/UAM4isv5+ZJAeJitmpiFqCjUbncSx1/BqRqqvVtWzLZi2145O3f78aYszH3v+XgeuYjDvbC7+mTRXPplM+JZ/hIAXeJJGeDqK85Lw7HKBIPgqS7oSNTnqUk2PzAa92EmwyntpmSlAl1hToGsVdC2G31uQZ0b8CtdNhMZ7qoK+BmCJTr0D2Hz42+GtPXNR1CmPBX+3qwnq/Bxd7ST0R4LVjKhU12AmrjLPEf9uB2qfcVtLwsvIP3uPawGluFpHUZl/dMx2CVfAJ0jCgq2umsnFOFHH7O35m8vi929HdcJDyU1ALUp7UQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNXPR01MB7289.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 13:21:50 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:21:50 +0000
Message-ID:
 <PN3PR01MB9597323CA0B8E1DEFBB91236B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
References: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 25 Mar 2025 17:57:26 +0000
Subject: [PATCH RESEND v2 3/5] HID: multitouch: take cls->maxcontacts into
 account for Apple Touch Bar even without a HID_DG_CONTACTMAX field
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <bentiss@kernel.org>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::10) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <86365c48ea4884b6c315c49f783d589b5791211d.1745241627.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNXPR01MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: c56d5f24-9cc7-4383-5bf7-08dd80d77981
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|7092599003|461199028|15080799006|5072599009|11091999006|12071999003|21061999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qmtQvz/JNlNMqb3mX0DCcYdGmsVtdi8Tljzc8HLr45l89B5XB4EN90GzyhiZ?=
 =?us-ascii?Q?rNHP9Pd3rWInzTnDCNCN+t79KHJN4acQbyqPL3m+ix3V9EaBJvK35ccy2N2n?=
 =?us-ascii?Q?qYJ3UB6E9ZJFvCdK0lFS+1gwjjmJgs9ylhBeD/knGEJg/bO3irjVfIkkY8Km?=
 =?us-ascii?Q?n2q6WoCTfbG6BuCTqFTVeyEK++GHlBvpGCXusmZwqFOKYV6zdUvpm3og8jFF?=
 =?us-ascii?Q?iY4uMe7IvIgg6DnVSDPPbYxlOyP41grKBSPQIYrjL08WyMSmm09QnHZY56G4?=
 =?us-ascii?Q?bZIRT/KCg6H//MXhACANh5c3chO37sRkGwC/p64+TeZiPrLr69qEPTHiiBwy?=
 =?us-ascii?Q?1SDk5g87Cd9ISzIrxDQMXVQENtO5xamr//HbBbn7ZZyUMI1Zt3SZdM6WY4pT?=
 =?us-ascii?Q?Uj9LzdRNcCghPKY1hZpYimpbMRFyLdI80mpAuzQ5X7ywo6hKtzE/HFreAeJo?=
 =?us-ascii?Q?LBUyKj09Afn8WulEsQEL30vJEQW1pYLU5seHuWsh6IY1bBeUhUiBCv+SBB8I?=
 =?us-ascii?Q?QUjpd8R83u3joNCbtniRVpzeiVCyLjeOgyerDrW9a+WMVsvhlAz7wNYbQjPa?=
 =?us-ascii?Q?nTqt3Mu2pbdzNMJZS2PfJwyuirfi2jAjyQLGqUMnRP4UZ+oCBcwDPiuzR4Ds?=
 =?us-ascii?Q?+XDNKV8VsVwYMfmrMgeoNKTo57i+RlUJtu3ydRjD3bI/NYklvJQ1NULttn51?=
 =?us-ascii?Q?GfnzJt4iM17UvE3JoU0WrTnubHnf6lIN+mtO+HMbryuEcB95ke3RlTk64Mgm?=
 =?us-ascii?Q?33ZhoL/Scrz5Kx56/1ftPHq1wVzzJTc+KRyc9GcdW3XVxdKNYRQIr+ExB1UC?=
 =?us-ascii?Q?iCGi0v/zWRsLjGTl/yakW27jAZ6o4Rv6YNfTZF5/PgtER4S2/ca8EtcGvJsb?=
 =?us-ascii?Q?LAza5Qcj2o2GLxfX7FIsKxycHJs8dzlZdByq+kUKCuPTUytwwgvsb9/fVoYt?=
 =?us-ascii?Q?huEyW/neysxBnHjIXheZmzsSLsRAX2w9UNIu3wZ6JfiWwuhQtd5+cywrnYrh?=
 =?us-ascii?Q?TR7WxXT44lE0+/cDJ6g4hFAhqM5jk/rwqPy81BAPEucDbPzss08eq5UMdOT7?=
 =?us-ascii?Q?ZYvwQ6IH/bs17+DiBjGKCgnstBS+tSBBNnv0xsEL9hsKy6pF0aOJ/6truqLp?=
 =?us-ascii?Q?glKDX8V7itF12/WkybFxkf2+snry5fJ52CdYtRZFecW5JmfLY5FpZFlklLfa?=
 =?us-ascii?Q?TKUHMqDByJ77xb93NY4/km+0NVQVDJBsMwH8wg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aSWUyT8qbk9kDnlNaTHsrfh/DTqHnSatF8JVm1mtGqB7yncJEasLsI91L0az?=
 =?us-ascii?Q?ZSRBppsoMiWa25minxDJ5S7y9yvOSCQTuszyj59naYn5DgAnrOAaIg/bmWIy?=
 =?us-ascii?Q?LKN6b35QVDnaRIOu2aUtT4Vr2BG1hDz78nKs+s0tAqpYzmAhe+onovdG7D1M?=
 =?us-ascii?Q?LyGXdUE0bkXy7fSIVH94RmuNehIk6hRBbUnF2NQmZN/BJnOjgjZvNAlQuqo7?=
 =?us-ascii?Q?66vgNHwhuWBDojR5Xk49iriOdvzLxuWqNfbKHvXsRed/vd4tDs8wz0wMXLEm?=
 =?us-ascii?Q?H2vEsKvdlzTHD5zrYHwn2vW9A8NK7rs0/MmIQKuY0fvll8fQnGbp2kk945M9?=
 =?us-ascii?Q?azBd4s/gchPVjDQXPieCA/ik88bn1a8L7/u3hRqsIP58fLiMkbqzcp8owiW4?=
 =?us-ascii?Q?NDR5I+oknQTCuA4TD0aSxnxe0s+9BFPTN2O5RhG2nvtUyN0jzpmJ+U/20PeF?=
 =?us-ascii?Q?La7leOK0RM2QbP+OI+l/t0HCCuyp1aqsp9RamACNyqvCWtxGctX4sI6DVz7W?=
 =?us-ascii?Q?4NXRCnXp5ybA9uw3bjDcCWNDP5Yvf8cyRyvK8S36LHaDyk4taXOyULsgtpOo?=
 =?us-ascii?Q?8BQV9lxPw60YiFk+oGh4ue6pASNaKtxzCsKg/25/Et1IVMoLKBz6yhYjcI6u?=
 =?us-ascii?Q?zuXKgSFRT9cu59D6niP/M8IY/RODrs6VHwrgX+UNB0HZJTo0MS4dyeL6RLsg?=
 =?us-ascii?Q?aM2ZO7Ktvmx1qxr2SWkYZnDv0BBCHRCEKrLJH7CG9Sl30jjuSKRyfKSZj1UE?=
 =?us-ascii?Q?sgKIdqI6XLyn1TV2h+ngy3Js+48x8ixLdFwyn7goeBa5mbuqrxJNtQ9oy/Er?=
 =?us-ascii?Q?fXPT2kCRbd6Yyk6W0Q34c38tFgH35bRmS9yskd9NwT4i5l2uSaGgssD1Yh2v?=
 =?us-ascii?Q?CeR1NiLygAS5exL1fkUo25q7uAQd1WlWs0I8idWAzheuFBQD4NaG8GtKZsdD?=
 =?us-ascii?Q?4A5U4P6aXMJkaNzIFZBWG+FCK4h/D3ylIhYM7XeXZXVoOhngBKnrvH47q7d0?=
 =?us-ascii?Q?SaVnWgR8nM0lFJ/kuOa05VKgU9cQWuAqbA2n5iZjsa1SdsW3YKCbv1cN7PgC?=
 =?us-ascii?Q?kJGIfsXuXEcRVlpyHsjZHttNLZ/atUZ9aOfkMeeXgyJmPdI7VPA1NbUD3Lxi?=
 =?us-ascii?Q?wM52LZSbOK9SRvZRmYa97EwVQjPpCXjm1/OiI9xKK7gotAL2Nl0L1XkuYZcX?=
 =?us-ascii?Q?12C1VGopF+byIa/kPkscE54vNTXgclUxk3U6ijxc3cqXkgz8SuTY2tPH9v8?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c56d5f24-9cc7-4383-5bf7-08dd80d77981
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:21:50.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7289

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the HID_DG_CONTACTMAX is not present, but the maximum
contact count is still greater than the default. Add quirks for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 70fdd8cf9..f7fe6aab8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1335,6 +1335,13 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	struct input_dev *input = hi->input;
 	int ret;
 
+	/*
+	 * HID_DG_CONTACTMAX field is not present on Apple Touch Bars,
+	 * but the maximum contact count is greater than the default.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR && cls->maxcontacts)
+		td->maxcontacts = cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts = MT_DEFAULT_MAXCONTACT;
 
-- 
2.49.0


