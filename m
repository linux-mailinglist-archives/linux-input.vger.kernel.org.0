Return-Path: <linux-input+bounces-3765-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A128CBC97
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 10:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9340A1C20CEF
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 08:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BBA76C61;
	Wed, 22 May 2024 08:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="NfvYh5q8"
X-Original-To: linux-input@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2054.outbound.protection.outlook.com [40.107.215.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381C182DB;
	Wed, 22 May 2024 08:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716365025; cv=fail; b=Swh4+pJm9kZvk6Fl3sNBBysYLFJ9kb+OWMZBpS8c+PuQLHj53YKezvwspp6/bjwyxk1MbVwb+OyJMGhl1K2k7w0GS8Gydu2G1CGV41ePA/yv/lpDhXQf0/xXFhzfR36iZoH1AFDQcP84djb6jWekZndLXYd3ajXx754gm88sQiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716365025; c=relaxed/simple;
	bh=yoigr1/MC5nnbO9XSX/vhm/KOOk0l47lxTe7xXHMmEY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aA7NsP8m2o2+fbO5QDUi0kFmxls+rKXf2kb1b3EhPqN9Jhl+A2bP5J3D9W2OFFV/Ic4MnRHgnvmL29NRfBXnOIt06URMUkmN3kL3gRFhvU3OCmvy0Fd45jZoBSl7qiW1YLnyDqXRpqRdx7kylbRHmuvIKGvUg/pM8EtW5MFxkwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=NfvYh5q8; arc=fail smtp.client-ip=40.107.215.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4jUMtjPEWp2n2651H1p8JI1mZlW2ue/+kpGuik4f2xSCgC2m+OeO4rOnoQmvCHmuQHBX5giktLJBXY9aYCpnUFgyNHb+qJOUA+pgkWneICl9s0ADQ34kKHYHdzikYhZ3GYsJhMmC8/C4cOy0y/X1EC54Bv0HphWND5cEfH2Bz5hxS39sS5zApOiiXUKCRkVz2/9KVtqMsmHzWX3Gr4tfZqkQ5cLl0mx/msZqr+NrvDkl50cShTvkOzKtuX0vub/eEmsJRuJbbjuHNDIqVfHFT0Zla2XVG0d6VluSWDgA6eBxTsMqcW9NMQph8P4hVKEZhzKiShfPk1pXMVkrqYQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfy8WbN+Z/NvctB8XDIe85GtPV/m2ua5Ff/Alcwp9lk=;
 b=Js53ZLnuUmSi3rnVhNn1CpA/pTlzT03cGlaXF11cYORBhherTeQVCWTAsb3jENm+xxXR/RwEcFl+9f1/3To7kSWjhTVeVh8AyNYmS47WPKANEh7bIcV2Ntn+vWxQKXw9GwMXZKV149HQAD82pXBi8hUrXTkzmuELnjmX1EALG63h1h+jcSw2/5/YeGKRjkGtlknfEZwex6ykq/KtHfR68PSlE4MjTA8FIxrGlfarc/8HJ5FHCgWAhFPzaSpPcWkrT2sCcGsHzCDKjuzBsKUKc5qQBEXgf9BZnqqvR1AoHdZNhxZkhxDE6QYrtGh4hQvmeFQIgsLsCJuKo97CoegPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfy8WbN+Z/NvctB8XDIe85GtPV/m2ua5Ff/Alcwp9lk=;
 b=NfvYh5q8Dp3iE16qU2SqmWtrW5HWsG6Zwvgmhow3pAT44gTWa1AztbxIHmKhPC70391l1DAUPOxNgMKGU18Nx6k1UxCkljk/Ti28CuBV9S4dF0aEqLu3DeVlNcP3dZsjAv/g5t0M+I5U82KlaKn/YFSQvk4EaM1rW6Gy0EqWGSk=
Received: from SI2PR06CA0012.apcprd06.prod.outlook.com (2603:1096:4:186::13)
 by TYSPR02MB6469.apcprd02.prod.outlook.com (2603:1096:400:42c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 08:03:39 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:4:186:cafe::6f) by SI2PR06CA0012.outlook.office365.com
 (2603:1096:4:186::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Wed, 22 May 2024 08:03:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 08:03:38 +0000
Received: from PH80250894.adc.com (172.16.40.118) by mailappw31.adc.com
 (172.16.56.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 May
 2024 16:03:37 +0800
From: <hailong.liu@oppo.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<21cnbao@gmail.com>, Hailong.Liu <hailong.liu@oppo.com>
Subject: [PATCH] HID: Use kvzalloc instead of kzalloc in hid_register_field()
Date: Wed, 22 May 2024 16:03:28 +0800
Message-ID: <20240522080328.12317-1-hailong.liu@oppo.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|TYSPR02MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a75064-c9ec-4a33-c612-08dc7a35b059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnZwVGpvN2ttaWZTV2NkRGEyOEl4SytsMWxHWkJEaDE1V1NsT3JuMzJ2aWh0?=
 =?utf-8?B?WjlwY3pjQjVtZWptcEdYNGdZKzlXTkxZanZmdE80OGdNVVhnNS84ckJXUldZ?=
 =?utf-8?B?QWJVcXQ2S2ZNakhNeUMveTRPQmdFeTZzWmgwMnhtVHZmQnlnZHc2S2pxWVU3?=
 =?utf-8?B?VVB4TGFjUnJmQ1IwVVFYNlNCYjJKYWpTTXFYYnpaODJLbEhkclkyMTNjQU9o?=
 =?utf-8?B?U2dLaG9iV1l1NEZicFZYbDhkaGVyQThxVWYwWGt0Tlg4SDJtR21QTFpGSHE1?=
 =?utf-8?B?ckwybFE3Q2tBUUhyc0thRlZHK0MyVVY0VTdpQ3NUSm9DNldWRHNEYWVabkYw?=
 =?utf-8?B?WTlZQVJrSGtkOHhDbHlJQ0FFMWs3eWg3ZGR6dHdiWnBDNTQrbEJoQk94Y09r?=
 =?utf-8?B?bm56M3ZITFpBT2wycnVPRlJOQzdzR3hrQWNCZVlyemFnVWpsS2dEdnNPR2Mr?=
 =?utf-8?B?cHFXOWxlakhBY2ZHOWtmVkFHYWpGZ1VRSGVXMmdGbmJqeUhiMDNNRGJYN1Fk?=
 =?utf-8?B?V1ZnMW5uY0tXbFpwNktHMUR2SXhFMmRrVk1jOUhPdU1PSnZCWEpVTkczbUw0?=
 =?utf-8?B?NlphRXgwcEJ2Qm1vbmwyUVkwdkt3RTJhc3hhSTJDWW4vczRtZWhMOFZBSDdw?=
 =?utf-8?B?VmlaZEVwU3FMVlRWRDd2eVFzWDE0aUNBT2lxbFc3MWFuM1lJSEJhbHBMUVVr?=
 =?utf-8?B?UFZjdUdaRmhZeElaYkEySE1OWEdMeXk0aDZvWEFiYUs3THBNQncyWnYyemt3?=
 =?utf-8?B?aEpLT1RVa0E5VjFiVVNSeDZnTjNNaHI5R1FFM3FVaXVpRDAzOVM0aVJFTjNC?=
 =?utf-8?B?T3R2cWhNM3orbG13RklEQ2VpTHVQVjYwc2lMZWlJVVpjZUtCWWlsL0UwZlNu?=
 =?utf-8?B?bHhCR2V4Vk4rTVp4WEU5VGpzTVZVVzFuNjJsK1FoY1grNFh5SGxWZWY1SHV5?=
 =?utf-8?B?VzVFM09RRzc3clUxb1dIUWlBT0xkNWNPMU82M2JqbEw2SEVzaXJabDVSckFX?=
 =?utf-8?B?Mm52Nnpza1RWbXlZUzA5dThMazhIT0JUSGpPRDFaYnE4U212MFdtaUtGU1hH?=
 =?utf-8?B?MktJODdKQUthZ0oyZVFPcVRNQUdCejh0RHU1bFB0ZGViZHFsMTdvaG1ndkdh?=
 =?utf-8?B?OGRjN2lramxIWUg3Q1lXaGJTOTM0cllOWVUrSWV2YnpsKzRJbG5ZVkZHRzhq?=
 =?utf-8?B?Q0RzQVUvTWdOSXp3L3U3SFZ2T2JQM1QvVjFsTk5DaVZqUGVwV0ZDOHVqelNL?=
 =?utf-8?B?dEVENHZYeFZjVnVRd3VHWWtzN1lMZFB3V1JGVi9ISmlUcFRUWTdDaXR1T3Va?=
 =?utf-8?B?NmZGK3Y1akppcDRZM0NrZVNwWTV6TVB2Q2N1bmlFOGRHY05mZkppczQrVWx2?=
 =?utf-8?B?U21LN3NITzBBeHRHVm9UWEhvUmEreDBiQUFlbDRtQk91L3k3V3BLSzEwdUxF?=
 =?utf-8?B?ZnpWdWtwVzhvQyt6SjUyUG9TWERRZldoTjNWZlZ5YkY3OExRaUphaEVjYURx?=
 =?utf-8?B?YWQ2NmVwUUo4WllOZFJrZlRKSDliNTJsVTUrZkU3RmNkZjdFVlRBb2RBenVp?=
 =?utf-8?B?ZXloU0hwR2oxaDFMUDFrY0gzV0JMcjNGdEdSNHIzSEEzSC92MEQyM2RrWnBm?=
 =?utf-8?B?cXNRVGY0ZktidGtscmYzZHRpakxRajdzQVJJTnYxUjllSnY5NEpXdjVrSEM4?=
 =?utf-8?B?WjVXbUNLQ3lCV1ZBK1FRZWNDeFV5RGs0QlRrSzkxMEVaZlg2ZDQxL240V0Vy?=
 =?utf-8?B?QnU5cU9US2grMXRCbjlnUHI2KzhoeC9WWmNRR1UrOGFpd1Bqc1BnTitpOUJx?=
 =?utf-8?B?dlRrcG9NQjRQZVZLaE1BS3NrRno1T0s4TGFYcy9GSGtsQS9abm84Rkp2RWRJ?=
 =?utf-8?Q?vMmi2Jm61YMHk?=
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 08:03:38.8734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a75064-c9ec-4a33-c612-08dc7a35b059
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB6469

From: "Hailong.Liu" <hailong.liu@oppo.com>

The function hid_register_field() might allocate more than 32k, which
would use order-4 contiguous memory if the parameter usage exceeds
1024. However, after the system runs for a while, the memory can
become heavily fragmented. This increases the likelihood of order-4 page
allocation failure. Here’s the relevant log.

[71553.093623]kworker/1: 0: page allocation failure: order:4, mode:0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), nodemask=(null),cpuset=/,mems_allowed=0
[71553.093669]Workqueue: events uhid_device_add_worker
[71553.093683]Call trace:
[71553.093687]: dump_backtrace+0xf4/0x118
[71553.093696]: show_stack+0x18/0x24
[71553.093702]: dump_stack_lvl+0x60/0x7c
[71553.093710]: dump_stack+0x18/0x3c
[71553.093717]: warn_alloc+0xf4/0x174
[71553.093725]: __alloc_pages_slowpath+0x1ba0/0x1cac
[71553.093732]: __alloc_pages+0x460/0x560
[71553.093738]: __kmalloc_large_node+0xbc/0x1f8
[71553.093746]: __kmalloc+0x144/0x254
[71553.093752]: hid_add_field+0x13c/0x308
[71553.093758]: hid_parser_main+0x250/0x298
[71553.093765]: hid_open_report+0x214/0x30c
[71553.093771]: mt_probe+0x130/0x258
[71553.093778]: hid_device_probe+0x11c/0x1e4
[71553.093784]: really_probe+0xe4/0x388
[71553.093791]: __driver_probe_device+0xa0/0x12c
[71553.093798]: driver_probe_device+0x44/0x214
[71553.093804]: __device_attach_driver+0xdc/0x124
[71553.093812]: bus_for_each_drv+0x88/0xec
[71553.093818]: __device_attach+0x84/0x170
[71553.093824]: device_initial_probe+0x14/0x20
[71553.093831]: bus_probe_device+0x48/0xd0
[71553.093836]: device_add+0x248/0x928
[71553.093844]: hid_add_device+0xf8/0x1a4
[71553.093850]: uhid_device_add_worker+0x24/0x144
[71553.093857]: process_one_work+0x158/0x804
[71553.093865]: worker_thread+0x15c/0x494
[71553.093872]: kthread+0xf4/0x1e4
[71553.093880]: ret_from_fork+0x10/0x20

To fix the allocation failure, use kvzalloc() instead of kzalloc().

Signed-off-by: Hailong.Liu <hailong.liu@oppo.com>
---
 drivers/hid/hid-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index de7a477d6665..574ec4873f41 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -95,9 +95,9 @@ static struct hid_field *hid_register_field(struct hid_report *report, unsigned
 		return NULL;
 	}

-	field = kzalloc((sizeof(struct hid_field) +
-			 usages * sizeof(struct hid_usage) +
-			 3 * usages * sizeof(unsigned int)), GFP_KERNEL);
+	field = kvzalloc((sizeof(struct hid_field) +
+			  usages * sizeof(struct hid_usage) +
+			  3 * usages * sizeof(unsigned int)), GFP_KERNEL);
 	if (!field)
 		return NULL;

@@ -661,7 +661,7 @@ static void hid_free_report(struct hid_report *report)
 	kfree(report->field_entries);

 	for (n = 0; n < report->maxfield; n++)
-		kfree(report->field[n]);
+		kvfree(report->field[n]);
 	kfree(report);
 }

--
2.34.1


