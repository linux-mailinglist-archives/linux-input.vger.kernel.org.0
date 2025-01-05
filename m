Return-Path: <linux-input+bounces-8893-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C4FA01B63
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 242757A177E
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 18:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59CF14A4FB;
	Sun,  5 Jan 2025 18:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="ExiVQt/u"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2101.outbound.protection.outlook.com [40.107.102.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FDF12BF24
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 18:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736103426; cv=fail; b=sghGMsHcqTSu0da+VUqVK8iDjy4SnZPS2FDAaEL6QFzuFNtu6UCb9/tYiUxF+Y6k+xvPqC6w9q6pAblrqg2yl4sq6ycZhyW8rmRgG/xgV2f8ASpqVue8rDDgA5AoC3gs5RPRPzRkAGnUk90hpFLxlUMw4DbmpyfpevcH1uibdxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736103426; c=relaxed/simple;
	bh=49N3ngaODK2tAvS8ZZMqdEFVoWJxH+5oXd3AoYxnMto=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qHXnBjwTQlj0FNS/9diHHAMe/Q8mdx88ZjZRIDTVH9g1ERc0yuEGC80+zjLOFwkh+cixYpf4D0TyjbdIbB2tjhUIVCiXSekRuU1VB/8ges08iMsDyeMjXefSiBgVEIwdD1DhgH92Z/A5ZZkIvPGwSZVRG8A1KySTY4XtD/HblWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=ExiVQt/u; arc=fail smtp.client-ip=40.107.102.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhrRqgcU5MN10djwCkDdx4Vp721DHNNBEozB7UtGC2HSboobSs386SVoghBVkd4CBmZwxUci+GoMYzkqAWF1N2wLRcTUOI+hawhEGpH75BMqiCpm7PW23yw8p6o7Ji19xZQ2sHHKDktuAjuJy7h9nNaIZyw0tCP30G+ZVz5nwGp1rCdAsoC28ew6wenZTKipsCv2LCkMm0jO6ox0u3/UbkoZwwq+WY8dhSGaOUGuO+ABZRhPsvgxRz+ZiLFBgv1g2lQNgL0NPKLiTcWVmgaPMRpjAh9W5ofJrohW3NBAUHbNb9xPn6H7XLKuYKYM/GeCXT0GGlv1M9/+Nu4Otp0w9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVb5SIzTM/33JQqo71S4HUKl5NOojoVOy3sDnjiVmjA=;
 b=XNdxBZ/BZNWeb7/cCpHTcHaBqJA3MvXVLphKTx9BtuhzcCOIxOjAlJGl2bC+Ee3yxw6R0rwREUnscGVCvVksqtbxTnUz4FqRCz6wklFvl9MqxmblQnvbfHG3+8qudxnJnOim792rEr0yN94V0zXRPlx03sPI6vrkedrgadZd1L4zNjOMZW0k61uZIsZa/lSpKsYkKu6sHGmp/kGy2DTUWq4HZwnixAEOZzM/JUfxqfe8Wy+HZKDp099CWE728ROUKgzou74vJE+sy+Q94A4XG0lsevJ2MdZWYfJZNoN1HVKvx086NuIfBDwC89TX5xQ6AIp89M4Ynug3Jbyxm+D6rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVb5SIzTM/33JQqo71S4HUKl5NOojoVOy3sDnjiVmjA=;
 b=ExiVQt/ujVSylyVaV14DfWhyUeMhZpmsYWN8hOJIFpiODD6MAMr8uvFXaojemLFBcPgmZS5G0AY2wL5pbXnuiNIgkTw8RAVx295WqFhfRn0Hx07U+56HAHF+j8foJ72k/CMrHv84/t7/LoJPLugHe44ibD4HC0kmW0S6+rLtCiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MWHPR08MB10302.namprd08.prod.outlook.com (2603:10b6:303:283::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Sun, 5 Jan
 2025 18:56:54 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.8314.015; Sun, 5 Jan 2025
 18:56:53 +0000
Date: Sun, 5 Jan 2025 12:56:48 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH v2] Input: iqs626a - replace snprintf() with scnprintf()
Message-ID: <Z3rV8GTHxLyjBQ5I@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA9P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::6) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MWHPR08MB10302:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c4eef4-31d8-4de0-fb4a-08dd2dbab82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wzIUfMmHtnmwYycwNnfwR6N7QTKPsD0AYQwI/neT9elLdylvup2LpEsmtQkX?=
 =?us-ascii?Q?5WSSMdv4TjGpnCwuOVUSdmWXKw0bbqf4S8R86bmGtDHlFZMK2dGFbCY57PfQ?=
 =?us-ascii?Q?V648X821IM4TpJtcLilrgNLY+hHmMPBVdwc0KPmHP9RyTBk9PcOv4mU6pNi3?=
 =?us-ascii?Q?T2JN4TNvDayl9rWwhQOrQJItyTQZUQlcOXeHt9JQeEWtTeSh2HmogWveI3pS?=
 =?us-ascii?Q?jboyv5FqVPSqgVh64PuHgUcKy2IPMO3lVVmseT+546qTOnIlh0faRPVZSjLo?=
 =?us-ascii?Q?SCn4CN4f3MX31D5IcsJQYYUw7MXd/gJ0ILxERJNnTbKpsgSdMHlMngj9x8sw?=
 =?us-ascii?Q?a8tuwHAofWMeHTgMBdp6D6ms2bWqx++D1CtS2ob61igmRY6a///ZNFocZHSf?=
 =?us-ascii?Q?CrSqQDIMi7oh890d/EN7ZiHWP+SZ56sEpBOkdasnEIoVJS0+puU0lUq+KBSz?=
 =?us-ascii?Q?62lG3dQWMs7D5EC67pImLGB91jTzN4GvyCTLJBl0GKRPleYnsmH3LOisg9ea?=
 =?us-ascii?Q?cQ5x+Qv/OC4Vtygv3wF+iSvKMFyK2PmgljOJuEjA9yll4a/xnspsk2keFWBe?=
 =?us-ascii?Q?Dr95qDlNF31qXZ1q5n2O8L25lX0NhZunIrOZB43wsyWg0pz3bF0BduBdwHzt?=
 =?us-ascii?Q?H+b0LZv1eyN/lLlgof1YH3cglvP/K5HpJd+m2hxJiE0APs1LNk9hsCQLR/3Y?=
 =?us-ascii?Q?nWlGj8SrYg99Wz+8FxVmvdFyZu1gyb2xaVvBjrGre367boxat14+2sQcMdeY?=
 =?us-ascii?Q?nT+z2nPGFdong9t8Voiv/3PBxeqgnP9K6LaDPKa/hheq85zvmVwYlcQxDzDa?=
 =?us-ascii?Q?cbXL80p9XLaFlN2Z05NTK7QUsFg/mW9MR7nYwx8oEZlQeLlJzEAoBkNlClib?=
 =?us-ascii?Q?TSisxfqqo2QYOSrDJlv/Em6wXyq+LMCQ1ftMcGxk5opIZhEcE1cROGmN1CNY?=
 =?us-ascii?Q?/HoUCXDzAq8ZrkyBWNaQf+wbYfpSKamNmlXnORNFYzcyT9yJaS1ZYYKM2A2M?=
 =?us-ascii?Q?QC5Kk1SM3paQfLwb3pEhDPEBlI7R/4RoIHuLJmo/NSPn87vr+I6dN8DjovgO?=
 =?us-ascii?Q?GbY1nTZOrBCTTJMkOpWUNqjn+2IMJq4Mm4zA6uAEMYPkGM0ydvhiJSn3BB59?=
 =?us-ascii?Q?5LWf46rLFQHq2fPQ7RO0x4IMhICOqDn4O04z/umDDZ2fZ7insl+Pll9lkS7S?=
 =?us-ascii?Q?AaKjH5H4WjNLykfz2lAUbsiuAOF4FKW7kkn3PxnJLMhZAETaUjO4L02GdMrI?=
 =?us-ascii?Q?/ys9QBde/7EAjB+dU/7U3QJadEQSs11JrAfKYwf6fCauV9tXGpQtV7bfOVAl?=
 =?us-ascii?Q?YIFtEgzBncrpN8i4TLPlvDTutWpcJFTlAemrEjiQ3efBSS+MUCJFfg040zJz?=
 =?us-ascii?Q?dYctnpf6qdMaKcbrQz5VxzeoJrVD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yRboOPIN8hitp4ZUONhPM3snyP44rMq3DLtuyieqI/3IObuyeWHFrKyfOJzi?=
 =?us-ascii?Q?i00LxONZKSEmj5HUv4hZoOcbzQ38afv7EQTSiXh9weF4fRiza/+xL1T8lF9D?=
 =?us-ascii?Q?9dyv37pJHhzBSu/Y5luXLdzhYQkStTQmWrsfIvChx7Zo7Umn+e2ThgME8jFd?=
 =?us-ascii?Q?Y9Ion30Mq+/x1uAFQHTmhnnWxou4T3SW3rRBGSehDrS1jVvg/5gag/CQtJKb?=
 =?us-ascii?Q?xSKUMgVvOruf+jd8tSUHOsHHSiM64VPgggiov2IJCvsYjPrs8SYwDYXjEpg8?=
 =?us-ascii?Q?mHbGRb9HERadJk03t/Tmblrv34t/BsExh12GnJLqJ5+0rERssPwZxLKs/sKi?=
 =?us-ascii?Q?2d+N7xE0AKIccVJ8QBQiLRmfYUYeSOj/BS8g2dXtAv0hNdoBw5BzGIIn32nz?=
 =?us-ascii?Q?1YInjKW0zLfJnMmPgPMt1OJk1rkVRJWhBolpChetcEc87j7j9tPrdbowySGR?=
 =?us-ascii?Q?2dyXzt+sI8wN6yIJ4AlrhCw5DYI1fo7ooKIFSwxEPzY5DEaiZHhBdJGAx7Ep?=
 =?us-ascii?Q?894DRt8209CiVp5ZFUHiXXLB0KdKuw+of1qc3S4CgpTQMZZfJZQl9Y+ijg4/?=
 =?us-ascii?Q?yZ3p52TC5e4VB7KWENYIaHGUEPhnjV88ZfN6AdBxAl3A8sbehtvQgXhWZb4N?=
 =?us-ascii?Q?w/IcekaLre0xlK9iFZsjM/yqTbjlgmNNa8cQq8OgY8w6abWv1uMbC8vR3pqm?=
 =?us-ascii?Q?DJ0byK3CfUZkeECTP8jQkSPF8e+vI4ForMFkaD5jDum47Zdug+4RTyoFVxIX?=
 =?us-ascii?Q?+42QK++mowEq3pi0aFngBcvVpArPR7bVKceF0r9UrVIrGokxG5Vx28QjIgkN?=
 =?us-ascii?Q?tmSSU5UZ33xzIiJbfyH5KkKgoboK2XQuO+Yf+I/H+F00NwnOSPAYhRuL8eDW?=
 =?us-ascii?Q?EmpP6xFIR7O4aMisFLD5LupVCExcxyH3A9mMimWdl23m3w6HogNxkJ9ssg+K?=
 =?us-ascii?Q?F1Nj/l/R1v2YY1frRsom+LRtqvolP6A7DGx4hkJzdPgcJdlYpnaiIpbRWuVH?=
 =?us-ascii?Q?8zX2y3QxzJagt6OLGp9s20KzjyKpjkErkU/KU3kY/GWjQFY9JedD1VJbcl+w?=
 =?us-ascii?Q?BKRIoq+7e5XOFSJ0FD2yHEVVQ5M1X2ozOiGx0hsxWDw7tP54Ie0hhwASBoR/?=
 =?us-ascii?Q?7FbDUWKxUMvNL9VGxStsE5NBgyTb+ePkZqb55zW2JR1woVwZ6eSYs0ampjiv?=
 =?us-ascii?Q?Xh49cyJ/2Sh3XDmX1HiVoaCSU05bTWC1/Ymp4Z8s0mN33Gb4U2eM1/XyT47U?=
 =?us-ascii?Q?I8sDChmbgrtF1grxch3kcESKV9UNwMeRtXf3ctCEk3HZG7a5+7mb/vH+ZyiQ?=
 =?us-ascii?Q?QZBcXOCWrk6Zw5jshIcClDC6kNV38xyi0CMAKZEzmnuhR8Mu/NaD/h0cREXo?=
 =?us-ascii?Q?1V9xbfAq/8NI/KwsUeHDPKU/ThotNBl8E7qbqBx8nzdon4YP0L2tNy95YFaW?=
 =?us-ascii?Q?mV2DE6hr3BwvCGKhVEu+iWWaCVTQqQpVqDpSTIxt6JNoVLhEkweHxhT+O5/Y?=
 =?us-ascii?Q?SqSESdrIoZ09N+Og+fX8QZuSu4zrRGb18F+UTswz2tVWBVJF5acA2g4J2Yhq?=
 =?us-ascii?Q?dgtuEt4lv/k1/L10DqTaJ0Bk4VuaVWM9E0Qk4H0r?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c4eef4-31d8-4de0-fb4a-08dd2dbab82e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 18:56:53.5190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8U5GedRQawBMihmUjQzhOOdmYghIOcXMV85P+HuN3gHiqHkWAPz1h6F4w73uO8/KglSqtPQupMJnP98WEEu8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB10302

W=1 builds warn that the data written to 'tc_name' is truncated for
theoretical strings such as "channel-2147483646".

Solve this problem by replacing snprintf() with scnprintf() so that
the return value corresponds to what was actually written.

In practice, the largest string that will be written is "channel-8",
and the return value is not actually evaluated. Instead, this patch
ultimately removes the warning without unnecessarily increasing the
size of 'tc_name' from 10 bytes.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412221136.0S4kRoCC-lkp@intel.com/
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Fixed commit message ("channel-9" -> "channel-8")

 drivers/input/misc/iqs626a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
index 7a6e6927f331..7fba4a8edceb 100644
--- a/drivers/input/misc/iqs626a.c
+++ b/drivers/input/misc/iqs626a.c
@@ -771,7 +771,7 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
 		u8 *thresh = &sys_reg->tp_grp_reg.ch_reg_tp[i].thresh;
 		char tc_name[10];
 
-		snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
+		scnprintf(tc_name, sizeof(tc_name), "channel-%d", i);
 
 		struct fwnode_handle *tc_node __free(fwnode_handle) =
 				fwnode_get_named_child_node(ch_node, tc_name);
-- 
2.34.1


