Return-Path: <linux-input+bounces-12808-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD05AD5302
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 13:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CD027A1EF9
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 11:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D01D283FC3;
	Wed, 11 Jun 2025 10:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FqBOezFk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QtFj/7+Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28463283FC5
	for <linux-input@vger.kernel.org>; Wed, 11 Jun 2025 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639208; cv=fail; b=DMstq+Wm3klBuPGS8vJkQg53BJVxM7XWnzi/2EvYCW6OW0xFlgq/YyhAAGZLazJYhejtDeh4Ebn7pO55/W+EsroHsFz06t2Zn6ZHNBBbK+mGEPd6C73O/ExjrgCk96Xbfwph0Icri9eG8xGY1A/ANQJgFxHFpzRXk2OQf4f6yjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639208; c=relaxed/simple;
	bh=iRe3JjiALvrfkenOeA4jGriTSzf4tRKKTSmKh0zGaAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsgz1W4Vhf5L5ntkRcMZ8FK60V0Xde3Y8MrZZw/DPw+n2QEMq+3/gJc8Er6+OHKWojLTFjKIDybMwz95Ed2mwEmZmkApSluoqvkxkZt5K8N8ETW2GmyDu8uy4XkMYN40F74ScwLRwx34PwQPSwG5p2F3i5kB//tXza1O2iDu5Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FqBOezFk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QtFj/7+Q; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B3cQxd022863;
	Wed, 11 Jun 2025 05:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=zXHFbRU98EtYxWuKtN
	MyuXiAQZ4m8cOebT8ZGUmWMq0=; b=FqBOezFk+SGJYJyNlYcbwrLIhV6nN9J5Nw
	8rMCl5UZhM1RKo3qBip08/0ftrcGRWpcoyxHfdtiN7At3YCSJ2fgP8FukNWgpxFb
	8OAJqbNxFAijzVxHghcNHMA9SQh2Y/IkDuHy+3Y13lrLwS6K2rA9mV6UJg9vj/m7
	O3YgfhSylhLqCpUCkmg6t+wxjLq4ihsJ+49Aqhehh58skJUhLsHaarRZ3X5RURDt
	s7Wg7WPkoU1GPepxYPdy0S0RcgQAhP5rYit9dovzgpQLTIxnsNACG/yQuLk1JOHn
	XpYIVFf7KIKFbq4XBWP6McKp8zlWgCRH+oRw+iWFXi2z5GspxCOw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2115.outbound.protection.outlook.com [40.107.100.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4760mwu97h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 05:53:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPJYk+lIBcUNROj7wILjoqIcY6B0Jp/UhXD4sMkMESE0fvILCz/t3zKCP1VutY7RfDUUbV4JWeSYFo+mqEbXnGZHVszutq3kNbTlnb/eEBP8+tw3xILC82JK1puqzn5OENijCXtk1Nu+Lc6WfKLNsOPaTFoQASq4T3UGhnYOG3KpWWSChXx+vqWMSYbktoP77fUODXvpaWfS/fkvPijbF0lTHq3/cSuwi7xExCUutvOqppjtPeLVaXl4dWZrnCSN/38xoSe8QD6/M50hzV68vDTSwumq/7xOd/9m1BxincF2mzUUadybkZ+N1X3l15Y0MuSK53YG4RL8QcV2sbAjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXHFbRU98EtYxWuKtNMyuXiAQZ4m8cOebT8ZGUmWMq0=;
 b=VsTHxG+4wGr4BB8n1F5VWOpXwAZeElBgrouhzzOh7Yn31pwR3HY3IgyHOTno1w+A7seLitFOrW94G7faMrx+9vMuez65iGla4ugwNpd0YTBGa0snt2UM13WFoOqVWIqKf6wiS/OcJhfBxyGzaauEDAMaWig9Amp3NOWpIGqK99BMMJ6ViYm7Xk36jVeg0Be7wUyu4MH7UoE3SCCxRiUrDm+9vPKOXEgFgnHkM3GQhjgzyDRVR5VqrvRgjT3VIGRjSwh5m1kWUP3xtq094Q8tYav5hllCb6W3fEpbYW1x3/ZD2Rr6+rS84GLuPbXPBiKphbJknOrc8xiRr9fxuykG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXHFbRU98EtYxWuKtNMyuXiAQZ4m8cOebT8ZGUmWMq0=;
 b=QtFj/7+Qng2PPOqIhTLQCaQ7vyiwuJcadVtign/Mq84bA3NqO2hUwGDbHQJPs237pvSnFGkgCZnamMdOuFPlWJnxpHkJDHCsbTmpXIigBXRlJHD/JdBzy38hpqmY0ImSY4IcjvJXjhMx7u8XZ6RqnxHmQdO2MXlj7j1WFB4EENs=
Received: from CH0PR13CA0010.namprd13.prod.outlook.com (2603:10b6:610:b1::15)
 by SA1PR19MB5022.namprd19.prod.outlook.com (2603:10b6:806:186::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 10:53:08 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::a4) by CH0PR13CA0010.outlook.office365.com
 (2603:10b6:610:b1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 10:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 10:53:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 98415406540;
	Wed, 11 Jun 2025 10:53:05 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 77DE382024A;
	Wed, 11 Jun 2025 10:53:05 +0000 (UTC)
Date: Wed, 11 Jun 2025 11:53:04 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: jikos@kernel.org, bentiss@kernel.org, broonie@kernel.org,
        linux-input@vger.kernel.org, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com, bard.liao@intel.com
Subject: Re: [PATCH 2/3] HID: core: Add bus define for SoundWire bus
Message-ID: <aElgELnTZgWEF7vh@opensource.cirrus.com>
References: <20250611102650.563137-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611102650.563137-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|SA1PR19MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: d9956c8b-f183-40a6-aaef-08dda8d625d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|7416014|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VfcolaAsT7/ADV+pbA7vUFfsZzxYvlF+Iilgda9dLVBSFXuROOodEc9tfGNa?=
 =?us-ascii?Q?U7k8cnG04TO6D20/qoHpmxz5FWT6H6przC60eVufx7G3zRg5VyLm2ZJ6Vfxk?=
 =?us-ascii?Q?kgkjJrs+L6ssLCgJiFZ9aTIsWG77o8EPr4fLulEohdZlvHI4qNdQ5dcUIres?=
 =?us-ascii?Q?cpsH0/Fwz8FYnO/fco1h1pA4JhVOI0VuhAnciAKwffrATyGyP82ToU86+UY7?=
 =?us-ascii?Q?SMG3nvJovZySrlCwyy0NPjqzeHidAZL1UhfegFwOGyG9wtbLH613F+wpbY7Q?=
 =?us-ascii?Q?pDDRpPLnsIObsJnbrOe8CIRU6nIjmIpZ0Vq06biqh4p4Uy2rPdfGGtf+QqW+?=
 =?us-ascii?Q?ZsNcGhgLQA+BYOGKGCNsDLWITrkQy9JqcZft2GGMdC34nPxi1ql6Eo/mpt7y?=
 =?us-ascii?Q?xx/CFLCdqioXdPHgx8VpiQJ9+z2FJP3ySmwbna57xL0+hLQlivi4gZPkdOgF?=
 =?us-ascii?Q?vLZ+kJtQciz0xhKLpIyv3R0qz+IaAtH3VXC9WI7DX2hhKSpaco7BYyAvZhMW?=
 =?us-ascii?Q?nTf3LloP2btTaZujHAsKz/0JNkDEKaucLuvisnsSYohNu1DDpUVbarrv7tFI?=
 =?us-ascii?Q?youi/QPHY7bNbRvOVJ4jYnWirJRgK5/xmssK1yFaI3B3Y0Fj+LcgnjJenpsC?=
 =?us-ascii?Q?xu9oAzJG+AvAKYgM8R6euRNlype8Bsv2YiVvUyDq08a0iHa55pUj64aXTNEn?=
 =?us-ascii?Q?4W8MIROPQOG8g0182M09TDQkGXM9ovsou+f30KjDIKeS2iR1Or9ZbCrcIMRW?=
 =?us-ascii?Q?7BjBGddDvxvackXrhXOwpGGm3QrGB+Oa/CKZy0hXbC52OYQirrDh9KrpNHSR?=
 =?us-ascii?Q?qanjilY2JE5rJ15hriuWjgzDt3keSGxwYMx2KvFmEhr3vmEMHTrr+L02PkSR?=
 =?us-ascii?Q?iIN0WnXBDuUxaoaVTU49fVH74b22hS/UJ5AWUT8jObwB3Jnav2KvnSv2dXF1?=
 =?us-ascii?Q?WwpmEZGeEgyojcyrYhshkCfWGJn3hiMVEJs5kFFA9hF2g48PL6XpUSXF1FDn?=
 =?us-ascii?Q?4nAHLGCgYVHe28L7IJdTUFVjc3Iz7EKIA8hTzikClobXw7uaC9SSuOIUIqmd?=
 =?us-ascii?Q?E3BMRtOO6W1I7jcYOlvax+3pxpyIyl3qWEgkpGr/xNRDerjQNDz/xfmJfb/V?=
 =?us-ascii?Q?gjlupy4kiiMxfNxbLJ9rY5XBeKUvpaNUwXyIP/RDQEHSXTTnMxTQwYTq4rwc?=
 =?us-ascii?Q?LaFzaCmX1PHMRASqLNx0xxkISKRga4hErLF2hWnQFBR88sOKh6nrXA60eXyi?=
 =?us-ascii?Q?9CpeBYwPAn13PLEuQYCE+Rm+Hq1x+kZcOndBjbYIc8RUFSjXzpDD9j2942Zp?=
 =?us-ascii?Q?qFqB0GrzbK+5xlhi8OXe7S0CwK3/zBnbO+leeqav2thQNlXNK+6U6Vbv2luA?=
 =?us-ascii?Q?/aMKx9JrMqI8OsqNuGkKJ3uhVW8J6c06hMC0FH4sJbdjSlBWlMjx3sDDzEda?=
 =?us-ascii?Q?gKVsvFh7X3FLnOPeaDa5vjWZrNIMEMaamWCLoITPhgzvAlYLes6LIw7OQfBR?=
 =?us-ascii?Q?7l/CSmIMWD7cU7gLJtsi26Fg6Q4fugXCxdW5?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(7416014)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:53:06.5390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9956c8b-f183-40a6-aaef-08dda8d625d6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5022
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5MyBTYWx0ZWRfX7oGTTeEI3fQX yRGa/YzFEFwBVSIml5CGfzgEqdaupf6AYPJ+A28ZXuHVvG3KhHaGcXhceAZFvVUmpIpvk9UOm/w F+tmcZ1Y+e9I/5zoXBCcqLoDHFEpwOkGe2NtMTdIo4rSlTXEql30SJwTrozsDolgmUBYetWchAW
 PJzi0svGOHpWchufBQsnHGBgc9+QTkMFaw1umPBO90JoV0AkSb5RmHqgTWVysl9XpCuiB9shyEQ vUUTUfc06Wax827m86V+m+rgy7ygalAQIPPeH5JC9mCMaOAcGfnA4PxElN9gRZK4M5PF8RiKKSa ZzMM/93lBLyKBSb6p/6QSPBwG53PgJEDmJNFAkFp/+wcCcCC//oqSs4Oq+FZo9uY2KqZKbTWW7E
 r6pAuUhWgXyEF4Uwf8tSrYp//EqdfFj2+KlG/pcg+wowgiQYJfTndXUEhB6Oh4YuAIiokNLk
X-Authority-Analysis: v=2.4 cv=coCbk04i c=1 sm=1 tr=0 ts=68496018 cx=c_pps a=C2T4mGIkrcyYKUZHu5KyOA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=zZIDwQACAhbmWHR2kecA:9 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: xM3FOKfl6hgEEfOV_K4OMZqSu5qb0APr
X-Proofpoint-GUID: xM3FOKfl6hgEEfOV_K4OMZqSu5qb0APr
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 11, 2025 at 06:26:50PM +0800, shumingf@realtek.com wrote:
> From: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> SDCA (SoundWire Device Class for Audio) uses HID to convey
> input events from peripheral devices. Add a bus define for the
> SoundWire bus to prepare support for this.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

You should add your own signed-off here as well as you are
sending the patch.

Thanks,
Charles

