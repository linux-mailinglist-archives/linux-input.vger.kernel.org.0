Return-Path: <linux-input+bounces-10673-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDA9A58A0E
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 02:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60C643AC987
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 01:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFE211CBA;
	Mon, 10 Mar 2025 01:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="hsk3kJn4"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2111.outbound.protection.outlook.com [40.107.101.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24071C6B4
	for <linux-input@vger.kernel.org>; Mon, 10 Mar 2025 01:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741570214; cv=fail; b=WW6OjldsQowL8uIqGvjFKviUk17kgCT7HPYzRYrTrwsuBxcUU3D14AyxXPEn8b91lrkoPC2Jt6HVc0o8K+KEa6mQcpn4IIoBV4K0S2liEcMhmq7xmttP3m4b6gP0GK11u+nnQtXnGmiDOAL5ULNwDZ2FtCMf9xNFxl7YZiULpu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741570214; c=relaxed/simple;
	bh=DLSXFjP3aL4Ul+uGjBpa2DTHBW744uYxOiC0JJUmyus=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=o363/bpip641zYIjVdOwLeScrhkWq9zS7Sep1EPAZ6SRvi2neab4G4aLExEw7TsfET0+JJILPV0+0hjkr8SRcN8++GunRjIUAEtEthYZh+phi76U5Nh1yNHmk+a/fSlWkDsmZ24S6NEXOGHperjk0jrRzgfjvE8x1YWfTMjfEvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=hsk3kJn4; arc=fail smtp.client-ip=40.107.101.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nctdjvKWpWz286LHdAqHS9yJWpZjmZk4flzPSYewjFs7dcSzt4zZ1WrbFxIoiI7eC4nSsU4nI1WeprY3lzv4AdE7EqWLLF2NYTbBZhxz9mI6f51V6kARxQD+Qb8CZ+tMMbfaiRQRsI3Kk4SAOoCbJ4oI5jQnA+VTT1l2Zu1Y1YVOB8cc1gmQyJA++X2vBXRbML+axQBwaD3YqFV8c9VvgA7m6ekfdkbZ5MmWT+8C9TcpLwStoxOYWehJBgFkfv1LcryS2KGZamSpZFoSwtGdZSu2ciq2mGPD0JPR6TGlyAjSqGhIxIQ2ZTJWvsoaV45/tX3jwTFztFS+IjVfWjrzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1Rt75sl7dwlr4UKQRCjkvdw7+Z+5nS2eQ7lul0KHXA=;
 b=Em81XrOVndzNI1nLyqmvK7KCD+/jLi6adzAzDBYdpFx2d3PoNNEah0Zc8U674eDxefnPhnvmEhi9jxny4irf8cIRwi0iGysNa/ICGydxc+hdEdPWGMXI8e+SeKIPkTVFL1PFRzqTn3pi3gJjJtePOF0QxOyV6/Ckae8lof8sxYpqxWEl3P8H2ZUwOzUlUnJsBGPe74cTR7nsCkwfhIEed5mioPenAesT7f8BnzQUuGlRC22LRWqC7iTkfcX8DDTAEx3pGWoxY1xBbf89sxJloLR/Qv09q/PhArsT745Hnk7cmZeZdUsCJI0B6AsfylIpNIQ8loqrJDSl0pb/cNqj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1Rt75sl7dwlr4UKQRCjkvdw7+Z+5nS2eQ7lul0KHXA=;
 b=hsk3kJn4uPKsDQaWAcWbco5MQV6935ouhaILrvUQPB8OW8a06i5Lfw1vP4MyFC/evs/kmeudwPA0tjONoZsBWcWqpJw2VSnJdl4MOIrYf9zXh9hQEa2epKeYIsKK4RtJmTNQ4JI7gtKZFgqMRTGVdUAEWkzraM3yWchkM+uKffQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CO1PR08MB6721.namprd08.prod.outlook.com (2603:10b6:303:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 01:30:08 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 01:30:07 +0000
Date: Sun, 9 Mar 2025 20:29:59 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH] Input: iqs7222 - preserve system status register
Message-ID: <Z85Alw+d9EHKXx2e@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA9PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:806:20::9) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CO1PR08MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 12de899a-67bc-40cd-9afc-08dd5f731751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QifhbbWM5GIeAYAhvpSBz5v/2OQNBFEwFRMmMLvKhP/y7MulREvAdOun69Sl?=
 =?us-ascii?Q?UTldrJsH1tRgtqe1TnA3mr9SO6W+B0uxbpbQl0KVeb+DXq9Z4LJ4wvJ1xMMf?=
 =?us-ascii?Q?iC8buZbTPSIFwzBOXfMBsqReM7e+nLqynmrt+uutJEBSxopUhLsHpJgouxn/?=
 =?us-ascii?Q?LsjVtn1lJfYobTpwnj5jvcL8mD95qcnlJ1vV1uSXPmEpr89r5vP7HLV9v7H2?=
 =?us-ascii?Q?j96dpxI4G06YY6CRkTykVopI5iqgG4JgKzzUsPdZErocu1POOtnDGvx5F5i7?=
 =?us-ascii?Q?ft0eve/nXXMfF00KwPhy9IQw6wothKg94Cy2IFKeiBkoQvtF/OSA6T88LQ6R?=
 =?us-ascii?Q?dQxuBYX/DARuNYeYX8ZMNuyzT2Pu1KDSKVOpfX8vOisEuS3flV2yP8XpjFNJ?=
 =?us-ascii?Q?bxUObBPowRrnP5CjVveno5xWLC4Asxl3M2TvZmi2gsurf614AArHuYcRpXng?=
 =?us-ascii?Q?LSklIty0tN8nIZBLp94FyytCSZ97OpoArYZybUWUeZhoR4JwG1YWBLFlF3+b?=
 =?us-ascii?Q?952KjVXoXtkZ1slGxwL8b9ppTALCwvP0N3e0ZTZP4wv8PwUD2N0kFZsPsWEV?=
 =?us-ascii?Q?0UDNPTszQWNZg+KPUOdpFpSOnI5CWQw6qtv77/Qtj27WdNJNJR7jbxPrKQUa?=
 =?us-ascii?Q?fFk2mIXXE4s/cEAkqUd9+5xuotUnrEZQS8G+s/nYmLQpM4WoY9z91YE6r9YU?=
 =?us-ascii?Q?QPODJXofs549cryx1Wb61Sqs7cPG7ZUFRkyvoXM0N8nlTQG5g85ChUgo/jiK?=
 =?us-ascii?Q?+0qQ3tBQ7pGA4rtizU51cOjadDVoW3+FhTogJ+caKfqiURc2RMtH5z7qCTpT?=
 =?us-ascii?Q?jL/dWxB5iBCv7P+a1bnobetYY/dVhAXVY749kCdN+ZGsty8Nidu2AcyBcu+7?=
 =?us-ascii?Q?8Zv8YMgNHYQ3hQw/JqipB63yhOLVCQugfA7Eo5+VB3f8agEccNS9VYQSpO6r?=
 =?us-ascii?Q?93MSMio5CO5Rlv1B3WAra32uFMJcbnoQ5qUCK9PecX4TYJ28SeTsGVHdxnDt?=
 =?us-ascii?Q?vDlg+JocS5Yg6ZHAH3BRH7Gwg/n8WC2qK9eyJkxSWV8bG/6MZenaLvpLPsN5?=
 =?us-ascii?Q?R0TvLdVuNlq9Zdqn7adMPuWU9HuKkPYtxXPy2nSGMYPD6YO1g/mkBJWpgKsE?=
 =?us-ascii?Q?b1MUzLtxGOdUW2cIyST7D9IvfGEYI/cMsEp5tAg0rku7d/Buj+wpNdUuySqZ?=
 =?us-ascii?Q?XQPHQ33JESqr0QHB+TdyhbFHiGg8wXd4GPWtcJl1qTFKViEgxpbun1e06ooI?=
 =?us-ascii?Q?SPJdBawG9kEumv1hLMdxLgkM/iNegGW2mr/xkndKSieXZ7QZjlhLXyLbW93B?=
 =?us-ascii?Q?o0WIRiimtan1sUF0Lghz2NHPjdH64uEAIfyQZEvYRmecop2/g7zEHKwwEdGb?=
 =?us-ascii?Q?32hch2T7nXwnnW3ikUTecnCiCuUP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l8RErYosAF33CC8pLiLlZAfiMmtVy1uMv7YMOhGC34/79HimzbPT0jndCh4U?=
 =?us-ascii?Q?kEgMc2rzjxVzSLKltuwbW1nOQEBJg9CDOQcmRyUuTw87FoU5PMNzZbqCfYyM?=
 =?us-ascii?Q?xJkq7xyn1trWzWR+qyQaVsufxnJ7CCZEJu2geHRKhh5sfEcHkkReTWs2YdA9?=
 =?us-ascii?Q?rJSGBVsN4YYvv1wLX34XILNLRlKxv2l/msCdNULITWTXUPCWuqCOl0W9D3sx?=
 =?us-ascii?Q?KNT6XpB+Cqmg1+X8Xqrnq//LV/WxFhjguKh4g/vfBXIW7KTrgK2PRVXwIBSk?=
 =?us-ascii?Q?bKvH/CGqNM/zsaRDREazbA+Xg8J7hLyWzWCuhfby5VUThzSKg+tUqZxyOUPv?=
 =?us-ascii?Q?0Yi4L5sDNhb/K8cDeLy5XeOC6IWaZpEyRWOlDAz5Y3BQUYjxX0VH7zTQq4Ac?=
 =?us-ascii?Q?i5wuOGn/MhmYh1JxQaTR6D9n3IBR7/F/zU81zZ/Kx8DreWydkmBLhEAh0Lg+?=
 =?us-ascii?Q?hDICbUfyJjfGwcDN6gvCrVtgH48ars9PDNu0HDLYFeVc4MNb7KGwTmSzlcwc?=
 =?us-ascii?Q?kAigjnjk8sZhfCznxNQngsnNmhkpRTAvOT2JURvi647YQMWcHnbvfWoJJRwf?=
 =?us-ascii?Q?K7iG/42OEq4W9C500KLZhHla5MoccuuU8KBWTfmPkdzn/4dWZ15FVo4w6JLZ?=
 =?us-ascii?Q?70qtgJ1qpagW4za14qyZSU3B7SHPR/UgKkwNaFNePshKLHAHSw3aGg08MBup?=
 =?us-ascii?Q?K0c72rjkjuLcx0mFaGXb6LG6LoInMHLv4S1wmSHs7iwxA+fHRSrhYoCUOlyA?=
 =?us-ascii?Q?GUUXH09oovlKE59tQySRTUVt4Rz5k6Riy1AXue3YdlJu7A32XJlfBVD4boMl?=
 =?us-ascii?Q?ayGVUSjU0670K3Ss61zS3d65jEXPE6LUVtBaJ9uX1BIZnURNc6t1N9wyMnwA?=
 =?us-ascii?Q?j553FSqrFEvkoLnAzdT0RZYXe6fNEPSnHUflHeFqBe6j9/P7jqAh7xMC6y+X?=
 =?us-ascii?Q?VH5P0aAeY8SadHHSumYr1YefYLPK62MrJ7elViAwT+rAlP8BVAC6flRZ3kDT?=
 =?us-ascii?Q?/OotbksGTGIKPx8XDl8Dt4jA2gLW/z7cUSzHFAh3PNDDFZrknj9sIVWbNbd+?=
 =?us-ascii?Q?VvHh0/+YYJC4KkXei9bOeh13T9AhwXDrrA9uwLeZiwYeAmIw7cMXB2bsqHjs?=
 =?us-ascii?Q?4pPcoFEF+X4CFiUpMVmHYyNOG7O/OZgjgJSptXBbclOkUkL/em7mL2bh/GEV?=
 =?us-ascii?Q?e0UYZ3ZFP6a7/21CgN9BCJCzicX0en2PIp8MwtpzcV2LjwKXZiexT7y2azgl?=
 =?us-ascii?Q?TqnXsnDMXnlRzj9f753Hyz2twtLY8OIqydJu9V/cq++ZVtrkMVnI96ZtDdD2?=
 =?us-ascii?Q?vooK6jAwObxH03axf8Si8mV1lqnOiCL5uRXmjBQ5p3uYipQ5PMnDoAmMZOKn?=
 =?us-ascii?Q?0ch0KJQX6jKyspGDs+nWXJuX25kObg+Qk7MeuowVGaAWJd+VSA3dXWnY5n95?=
 =?us-ascii?Q?JDsyA6vZLVNFWZ4B4A9m2fAf0Gze+jYniAnDxqOXpDKXS5skSyFPMUVHqpcl?=
 =?us-ascii?Q?zpLmXCpe4uD2AKPFwEdlEBiSd+c2yErRgIIHMbe1pv+U4s4N1XLaHUij33h5?=
 =?us-ascii?Q?u1G20dqafLxBq6l2rHso1FqQ0GpQK0fCzP/BwJX+?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12de899a-67bc-40cd-9afc-08dd5f731751
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 01:30:07.6556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsqLJYU/lk3X1FQ3njSftX5zjWsRdyX2nZHuOIhF/eRmjLrmCVtaeqT9FokHMb14CddiIKWhaEFoSYVRGmOf5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6721

Some register groups reserve a byte at the end of their continuous
address space. Depending on the variant of silicon, this field may
share the same memory space as the lower byte of the system status
register (0x10).

In these cases, caching the reserved byte and writing it later may
effectively reset the device depending on what happened in between
the read and write operations.

Solve this problem by avoiding any access to this last byte within
offending register groups. This method replaces a workaround which
attempted to write the reserved byte with up-to-date contents, but
left a small window in which updates by the device could have been
clobbered.

Now that the driver does not touch these reserved bytes, the order
in which the device's registers are written no longer matters, and
they can be written in their natural order. The new method is also
much more generic, and can be more easily extended to new variants
of silicon with different register maps.

As part of this change, the register read and write functions must
be gently updated to support byte access instead of word access.

Fixes: 2e70ef525b73 ("Input: iqs7222 - acknowledge reset before writing registers")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 50 ++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 22022d11470d..80b917944b51 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -100,11 +100,11 @@ enum iqs7222_reg_key_id {
 
 enum iqs7222_reg_grp_id {
 	IQS7222_REG_GRP_STAT,
-	IQS7222_REG_GRP_FILT,
 	IQS7222_REG_GRP_CYCLE,
 	IQS7222_REG_GRP_GLBL,
 	IQS7222_REG_GRP_BTN,
 	IQS7222_REG_GRP_CHAN,
+	IQS7222_REG_GRP_FILT,
 	IQS7222_REG_GRP_SLDR,
 	IQS7222_REG_GRP_TPAD,
 	IQS7222_REG_GRP_GPIO,
@@ -286,6 +286,7 @@ static const struct iqs7222_event_desc iqs7222_tp_events[] = {
 
 struct iqs7222_reg_grp_desc {
 	u16 base;
+	u16 val_len;
 	int num_row;
 	int num_col;
 };
@@ -342,6 +343,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 			[IQS7222_REG_GRP_FILT] = {
 				.base = 0xAC00,
+				.val_len = 3,
 				.num_row = 1,
 				.num_col = 2,
 			},
@@ -400,6 +402,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 			[IQS7222_REG_GRP_FILT] = {
 				.base = 0xAC00,
+				.val_len = 3,
 				.num_row = 1,
 				.num_col = 2,
 			},
@@ -454,6 +457,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 			[IQS7222_REG_GRP_FILT] = {
 				.base = 0xC400,
+				.val_len = 3,
 				.num_row = 1,
 				.num_col = 2,
 			},
@@ -496,6 +500,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 			[IQS7222_REG_GRP_FILT] = {
 				.base = 0xC400,
+				.val_len = 3,
 				.num_row = 1,
 				.num_col = 2,
 			},
@@ -543,6 +548,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 			[IQS7222_REG_GRP_FILT] = {
 				.base = 0xAA00,
+				.val_len = 3,
 				.num_row = 1,
 				.num_col = 2,
 			},
@@ -600,6 +606,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 			[IQS7222_REG_GRP_FILT] = {
 				.base = 0xAA00,
+				.val_len = 3,
 				.num_row = 1,
 				.num_col = 2,
 			},
@@ -656,6 +663,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 			[IQS7222_REG_GRP_FILT] = {
 				.base = 0xAE00,
+				.val_len = 3,
 				.num_row = 1,
 				.num_col = 2,
 			},
@@ -712,6 +720,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 			[IQS7222_REG_GRP_FILT] = {
 				.base = 0xAE00,
+				.val_len = 3,
 				.num_row = 1,
 				.num_col = 2,
 			},
@@ -768,6 +777,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 			[IQS7222_REG_GRP_FILT] = {
 				.base = 0xAE00,
+				.val_len = 3,
 				.num_row = 1,
 				.num_col = 2,
 			},
@@ -1604,7 +1614,7 @@ static int iqs7222_force_comms(struct iqs7222_private *iqs7222)
 }
 
 static int iqs7222_read_burst(struct iqs7222_private *iqs7222,
-			      u16 reg, void *val, u16 num_val)
+			      u16 reg, void *val, u16 val_len)
 {
 	u8 reg_buf[sizeof(__be16)];
 	int ret, i;
@@ -1619,7 +1629,7 @@ static int iqs7222_read_burst(struct iqs7222_private *iqs7222,
 		{
 			.addr = client->addr,
 			.flags = I2C_M_RD,
-			.len = num_val * sizeof(__le16),
+			.len = val_len,
 			.buf = (u8 *)val,
 		},
 	};
@@ -1675,7 +1685,7 @@ static int iqs7222_read_word(struct iqs7222_private *iqs7222, u16 reg, u16 *val)
 	__le16 val_buf;
 	int error;
 
-	error = iqs7222_read_burst(iqs7222, reg, &val_buf, 1);
+	error = iqs7222_read_burst(iqs7222, reg, &val_buf, sizeof(val_buf));
 	if (error)
 		return error;
 
@@ -1685,10 +1695,9 @@ static int iqs7222_read_word(struct iqs7222_private *iqs7222, u16 reg, u16 *val)
 }
 
 static int iqs7222_write_burst(struct iqs7222_private *iqs7222,
-			       u16 reg, const void *val, u16 num_val)
+			       u16 reg, const void *val, u16 val_len)
 {
 	int reg_len = reg > U8_MAX ? sizeof(reg) : sizeof(u8);
-	int val_len = num_val * sizeof(__le16);
 	int msg_len = reg_len + val_len;
 	int ret, i;
 	struct i2c_client *client = iqs7222->client;
@@ -1747,7 +1756,7 @@ static int iqs7222_write_word(struct iqs7222_private *iqs7222, u16 reg, u16 val)
 {
 	__le16 val_buf = cpu_to_le16(val);
 
-	return iqs7222_write_burst(iqs7222, reg, &val_buf, 1);
+	return iqs7222_write_burst(iqs7222, reg, &val_buf, sizeof(val_buf));
 }
 
 static int iqs7222_ati_trigger(struct iqs7222_private *iqs7222)
@@ -1831,30 +1840,14 @@ static int iqs7222_dev_init(struct iqs7222_private *iqs7222, int dir)
 
 	/*
 	 * Acknowledge reset before writing any registers in case the device
-	 * suffers a spurious reset during initialization. Because this step
-	 * may change the reserved fields of the second filter beta register,
-	 * its cache must be updated.
-	 *
-	 * Writing the second filter beta register, in turn, may clobber the
-	 * system status register. As such, the filter beta register pair is
-	 * written first to protect against this hazard.
+	 * suffers a spurious reset during initialization.
 	 */
 	if (dir == WRITE) {
-		u16 reg = dev_desc->reg_grps[IQS7222_REG_GRP_FILT].base + 1;
-		u16 filt_setup;
-
 		error = iqs7222_write_word(iqs7222, IQS7222_SYS_SETUP,
 					   iqs7222->sys_setup[0] |
 					   IQS7222_SYS_SETUP_ACK_RESET);
 		if (error)
 			return error;
-
-		error = iqs7222_read_word(iqs7222, reg, &filt_setup);
-		if (error)
-			return error;
-
-		iqs7222->filt_setup[1] &= GENMASK(7, 0);
-		iqs7222->filt_setup[1] |= (filt_setup & ~GENMASK(7, 0));
 	}
 
 	/*
@@ -1883,6 +1876,7 @@ static int iqs7222_dev_init(struct iqs7222_private *iqs7222, int dir)
 		int num_col = dev_desc->reg_grps[i].num_col;
 		u16 reg = dev_desc->reg_grps[i].base;
 		__le16 *val_buf;
+		u16 val_len = dev_desc->reg_grps[i].val_len ? : num_col * sizeof(*val_buf);
 		u16 *val;
 
 		if (!num_col)
@@ -1900,7 +1894,7 @@ static int iqs7222_dev_init(struct iqs7222_private *iqs7222, int dir)
 			switch (dir) {
 			case READ:
 				error = iqs7222_read_burst(iqs7222, reg,
-							   val_buf, num_col);
+							   val_buf, val_len);
 				for (k = 0; k < num_col; k++)
 					val[k] = le16_to_cpu(val_buf[k]);
 				break;
@@ -1909,7 +1903,7 @@ static int iqs7222_dev_init(struct iqs7222_private *iqs7222, int dir)
 				for (k = 0; k < num_col; k++)
 					val_buf[k] = cpu_to_le16(val[k]);
 				error = iqs7222_write_burst(iqs7222, reg,
-							    val_buf, num_col);
+							    val_buf, val_len);
 				break;
 
 			default:
@@ -1962,7 +1956,7 @@ static int iqs7222_dev_info(struct iqs7222_private *iqs7222)
 	int error, i;
 
 	error = iqs7222_read_burst(iqs7222, IQS7222_PROD_NUM, dev_id,
-				   ARRAY_SIZE(dev_id));
+				   sizeof(dev_id));
 	if (error)
 		return error;
 
@@ -2915,7 +2909,7 @@ static int iqs7222_report(struct iqs7222_private *iqs7222)
 	__le16 status[IQS7222_MAX_COLS_STAT];
 
 	error = iqs7222_read_burst(iqs7222, IQS7222_SYS_STATUS, status,
-				   num_stat);
+				   num_stat * sizeof(*status));
 	if (error)
 		return error;
 
-- 
2.34.1


