Return-Path: <linux-input+bounces-11055-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C20CA6C0FE
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 18:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F35741741F8
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 17:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9118E22D791;
	Fri, 21 Mar 2025 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4pn5RrOL"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA391EEA42;
	Fri, 21 Mar 2025 17:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577130; cv=fail; b=F/MUDD5QjAuopAaz1cGObmjxVspBXYM5r3YWVNsyheMWIu8ISOqTxC4CbV7aKVgc3ukXmOgOhvGIHRnqKBnBbs+gi81Jf9kv5y4m5/Lg6M1sqgUaCK8X586DLI4TMjUh5pFydf3fb0UszMftwDLfJ74KG8Qir8IO+TdiHm/mwHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577130; c=relaxed/simple;
	bh=LS1iRaC+zIb+gFjGvQlVnF5dqRiQ5PmadoqUAdkNTw4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cxarOCUK2KsZBlOJWwM7Oqlre0nQyihZ4bAqpHyDMXApuPNHaq9zmIdDl1Y2/axWdC1aWlly7YsR7sFKzfkX44I/x7qmS7pcf2TlRoTU48jGlIXRRDm2Qj/n6g88wgAUVYOjvpUz19DwI/rXmfkxnNPM+JEIOn2FRgfJtfYlQYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4pn5RrOL; arc=fail smtp.client-ip=40.107.92.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nU85mhRtm7rmhtEgH5wOmEKRNeqDSvq2wne7y/KJa9NOLGLMAjSHqIpSN78X3QkFlkCe/E4hJyV7pamQINGglm7JISFjY/SNRRmjwt5A0YktBu7awgDkz9MBsLRWNjQvFub+bfCRLXvpuQyWnMX9WmeKrr4xS0+UnDvmBq58kI/U4ycufgZqqzJBtidgqbgQD+8KQOjxyRhX25yuTGMDH6kECRh9qfTMXUBCIvNJmEOcq1ppQK1918ouUhgTr59Pn4laZbRlPv8Q3B34EwPRxiew7NYxJC+NYbaywhuri6B235ijT5UASOQR2PTGVWgrrcglMcisjx3J4qRHPUWeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4fT7ieU5KdltXWcfIWA9ntGdLYzxGXluePqIlCl8Og=;
 b=MG42eX7zPSOll9md0GzUQ13zAXiY7SJvWUH0slbXpSYxVRU+v14BYbdDJhRjjbpDMz3H+hVs2N6D0rai5cykF//8u1t3tsTlY1bQ38xA5sCIYuWuPbGjVIHhVTmwfl7H1UUFC5qmgMnNOirseiLH6r4OCJQXXDHvRDQvJHh3Bq7TQeCLVnXfFVbiFX2UgUY1FDxb/f6xMdO40WUpC7YWQVQr4DGX6+68BCdvpT6WDtCah84Q39C3rRUTFynOV+TplEWTrDKGrj9Ue1nUzDHN/N3zfHuZ+vQA4/V8BxyJE6T0wgs1JrIPOxURxrDG91Vz5ncfZlq2DISUurILjCzxMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4fT7ieU5KdltXWcfIWA9ntGdLYzxGXluePqIlCl8Og=;
 b=4pn5RrOLNhSH0Onir6DfuH7bAKR655JMo+wVcOqaZk/4nNseeyIGoXAKMp5yMugM+hOU50ZDzimeeLeS45EBml3+KkfxF8n22MrWo534uHMCA11q7UI59WOwXn3W6pDglQAkDkc709lRCxMRPUrJyYodcxFG8bS/BmQU/+Ef4Cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB5662.namprd12.prod.outlook.com (2603:10b6:a03:429::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Fri, 21 Mar
 2025 17:12:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 17:12:05 +0000
Message-ID: <c76b71eb-b605-43b7-a3dc-4427a8e79dd6@amd.com>
Date: Fri, 21 Mar 2025 12:12:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/x86: asus-wmi: Refactor Ally
 suspend/resume
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org, lkml@antheas.dev
References: <20250321035106.26752-1-luke@ljones.dev>
 <20250321035106.26752-3-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250321035106.26752-3-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0188.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1f04ff-8d7e-4226-1c67-08dd689b814e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHhwck9LczNNdWpUcy9mNnFYMm52V0ZBdGQvd0JSUUlTOXN6SHJGby94RVQ0?=
 =?utf-8?B?QVd4aW5KUm5COGlqUWUvSjhZWjM4TEx4bXhuZE16OVhvbUpqTE5lN1pKOVJ3?=
 =?utf-8?B?T3pVeUhQeVJjczVNK3dZbXhyV0FvNWpnRlFabXVUS0kzSkdta0Nna05TdzB1?=
 =?utf-8?B?RVAzUHRUVEpSNUtkUXV3L1A4Z25MWVBnUEhpY08wS05FUFZ3QWJZdzhQZGVv?=
 =?utf-8?B?ZERWZHY1SDAyMXRhODZyMHAxV1Rac3BRUG4yUVZYTnlBWDJEVWtrZlgycFJ2?=
 =?utf-8?B?Zkcrc3RTS1NsZ2RVTDBOUVp6SlI0WTZlZ09RdmtKcXg0aE9pbjNoTnR5QVZo?=
 =?utf-8?B?Rk5iQWFONUZmWGJmNnZPd3IwRmJGdXRPaXhWR0FLUWJGN0RsMVhSc2U5Tk01?=
 =?utf-8?B?ZGJOSHdmMUhRQy9VNUd5T0h2UHNoeDBPb3Y1OExxYlY1S0krdVFQdUpXVXA2?=
 =?utf-8?B?bUxFaTkrbXdLVXJlWTlBRmRCZUJSYXh5NXFOemIyNnJvRkpHVjhUcGtnY0c0?=
 =?utf-8?B?ck95ZlU1Zk9LWUxPZmNZd3oxSkJmODl1UG1Lclc1TmxaUVlxOUVpMnFsSTBu?=
 =?utf-8?B?bm4xcTEyM3pmcUNGZy9RK2VxZGlweW5SY3huckFKUHcwRm9qRWZ2Y0lac3pJ?=
 =?utf-8?B?eFFkd21weDY0WjVuVVJaYUhJSWw1TFNzQldTbEJQbzJOeHpnQ1JOQ3V4d28w?=
 =?utf-8?B?VUJJMDQ0N3JmWHU2Z0ptRVpoaTlBYmM4MnorMU53eGc5RDRwbWNURWZRL0d0?=
 =?utf-8?B?bzBMdGVzUFo0Q213ZEY3T25qVkVKd0RXNTlLOHdvSGlKbThZQkU2TGtnaVZ0?=
 =?utf-8?B?cThYdXFEWW0vT2xtVmR5Q1RWMjdIaC9TcjJGNEMxcjVxWlNZNkZjcldwNnFM?=
 =?utf-8?B?UjIrWnhNSVJKZzk3c05jcEtKMm5zLytncWx4UVdCT1ZuWWlyczY4ZzRaRllV?=
 =?utf-8?B?b3pJOXcyL25qN3RYdlRjYWVYRjQ0a3JBVWFpWTIzMlJGYmpjQU91L25lRHNV?=
 =?utf-8?B?N1VRWUk4MnhMWGdDdjNZVmtPY0NhVGh6OWFrM0EwQ1FMbnhza1RIR3B0UWlB?=
 =?utf-8?B?Z3d2VVE5eS9zT0dTcDFvVXNmMnI4V2dUR3VMZWtBQnBKTWQ3a0c4a1IrWHp2?=
 =?utf-8?B?YzBpdGszTzd4ZHBwM0ZDcG4xc0w4R05UQ3lLZTdSRE01V2FGYVFhTTNyRW5t?=
 =?utf-8?B?SnlDQUdHSEJOcEJZdUh1OE5qNCsvTzJCU0Qrd0pLdy9iVFZBQk1GS2d5RDZV?=
 =?utf-8?B?b0wrVVpEOFFoTjZTMmJFMjA5TlA1NWpBTm9kVGZNdUt6M2srVmhiTXc0VStJ?=
 =?utf-8?B?YTd3eFJDNkg5bjluOWlEUExZdTF6bkhTMHgwa3d2d29LMFMzMUgyUGlnRjU1?=
 =?utf-8?B?clRBVXVXaVZXYUZmQk12UnBta29Hdk8zbHVCcHgxMkJYS3dRS3JWYjRMcy9U?=
 =?utf-8?B?bktiSHFLVWVjVUcvV0k2M2w4THhxVVZ6WjRlRGgveWUvbXNwbUN0aTliRkto?=
 =?utf-8?B?dFlCT2FkdzQ1NnMyZkRPWmU5OUU2ekxlbysyMks3bWZMTUxZQ0pjSVlVeUxj?=
 =?utf-8?B?NlB4UTlzVHg5Q3hNMmpKR3FuMXVsNU5LR0RmV0xxeDVBOTA2NE5BYTU3dmhJ?=
 =?utf-8?B?YjU0c3dzNTBjWUlBQXlVVWwraG4xU0pwc0MxY1hBK0R5Y1pQYVB4MUM3MkxL?=
 =?utf-8?B?NUJ6WWhvN0xobVh3citpSnBQSmxsc25oMDVNdENnRkR6K1QwUHZzbzdKdFA1?=
 =?utf-8?B?T2N1Si9jM0dyaUNCWCtqdVU4S2RGQUxKdHFscG8rbGhXU0JCZm5SZ3hZclVU?=
 =?utf-8?B?VFZxRzlLVDA1SlhPd3dHSTlOWWZncHlFSTFubDdIcm16WmV0MGwvT0NzVUN2?=
 =?utf-8?Q?/tgKDUMCFfzx6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S05ZcUU1Q2NYZUdTZkRHa1NndnFxeExBYlA4a1FKdE1DV3U0VnkySTZVWWl6?=
 =?utf-8?B?aHdQenRaUzZVVUp5OGtReE9RVWlnWEdwaS9BTVFxaGNIVzZWdmpvang2QUpw?=
 =?utf-8?B?L292cWVzbkQyZk1LWDNxWWhnVG5KeVQveVBPaTBvbS9leGxZN1l4Q2xlSzJm?=
 =?utf-8?B?emNUcVBnNW9wNWtqT2g3cDhhc0phNFlOLzNkZHFlVVBuM0psV3hiT2QzQnNw?=
 =?utf-8?B?WTdvVjJ0UjNXNEd2eDI4KzcxV1llT285U1hFNGJ3c1NqTnJEK2hydlpLZnUv?=
 =?utf-8?B?TVowNmY0Vlp6ZXFScGpZZEpOa2RuTHc0cmJpTEtKVnRzMXZueHJkaFVHWkdz?=
 =?utf-8?B?NURaeHo4L2dBY3RRQS85Q2dBQjk5dVQ1L3Ryd2pZTS9IWHg2cndmaktFMnF4?=
 =?utf-8?B?dU1nem1TYzd2eHIrRmlJcXBuL0RtMnpNS0IxaG9JeUlpNklmUUJKZDEvTkox?=
 =?utf-8?B?NWVkQmxQNUlsNG9IUGpvYkIwaXNvaXNtWFlRWFNoZDF0bWY2c2FzbXpuZXBm?=
 =?utf-8?B?Z1QzWndSamI3KzYyb2pzQ2toVWg4VzEzT1pVaWZMQkt5Q2VHM2lEdjRkc1Vy?=
 =?utf-8?B?alhzS0lDdkg2Y2h1UkVrR1E2RExBOFVGREZROGQzcHdvL3p2YW56MEVvVHVh?=
 =?utf-8?B?UDNDOFc3aXR0WGFRZEpoa0s0Q1RycFF3K1I1OVJoVlFKZVppM1dxdmJRQmFl?=
 =?utf-8?B?UUVsNGxacldtSkpYa1A5WkpSU2hjQnk0ME5YOWgyRTlUaWVCSTRjNENNOGZ6?=
 =?utf-8?B?bUxqeHJtL205SnVDQWtGZ1VHUWVrZE5hc1BWTDhRVytZalltbTlPSlkwbElY?=
 =?utf-8?B?ZEZWMStaV05QTHFoQWNJd0dhNXB6RnJtK0loVit1Rk5aM3o2a2dCU0FDdHhI?=
 =?utf-8?B?U3p3L3BUZzluQ2hPcXFSY1hETG9scGVXb3ZjcHpzNDBkSjE5NUdZcnlHUlpp?=
 =?utf-8?B?c0hBd200VXEwbC9sWFlxMmJXRWJpeExsbXNudy9yS2VkMFQ0UzdHMlZKdUor?=
 =?utf-8?B?WWVaU1pmclJjM0FzdythM1dMcTdRd2hIbzZoN0cyQTNDd2d6WUVzNVFkTmw5?=
 =?utf-8?B?WmlXL0FSQnY4WnVXbzVUakpXYWZwNFcwMmhnTHc0QjdnbzN0cVpUSUVwR0xD?=
 =?utf-8?B?ZTVyQmp3ZXV6c1U0MG9HbVNXRHkvVTVTdmI1blgvWGZFTlZtNUg5ZW1VbVc1?=
 =?utf-8?B?MFJzRVdjVFdPQTkrdXhwejRNdHowTWNZaXhTZHNQVlM3TG50MzB2WmQ3bWlz?=
 =?utf-8?B?c2d0SlQ0VEY3Z2k1MHMrWmxJd01VdnlBOXRMcDdZNEN0UVU3Vlg3TWt0VXhO?=
 =?utf-8?B?eFhaMGtWWWlCZ28xUEd3dHg3SWVSZFlCdFNTankxazgvM1UzQ3NveFdxUVM0?=
 =?utf-8?B?U1FvTE9wazM0WVp3ZmNHQ1RmK2dZMFpYZnJ6QzB0M3Vydkl3ZTMzZUUwUlZQ?=
 =?utf-8?B?VzJCNUxQOVBaUjJBeXh2L1kxN0xhMFN6K1N5MDBDSnBVWkU3S0VYbW5hUEFG?=
 =?utf-8?B?Z05NR1RodmIxcFhOeHJpMzNJMyt1eW0rL3hsVFlKSms3Mkkrdm0zRE5NdXRL?=
 =?utf-8?B?Zk05b3BnUGE2TmltN3dSenpXMGNhd1h3cW5qNEtSQlJJSTB3TmEwT3BmZXZC?=
 =?utf-8?B?aERoNzRqaStKeG9pUU4xdzJnUERuZHFMclI2cG1xS0puVFpzU3Q5Zkl5SURD?=
 =?utf-8?B?MXdPd2J1dU4ycFRRUG9hR3E2VmJpODJkM2d5K2pQTVZObjJlNnh6OHVKMUdi?=
 =?utf-8?B?ZzZuYmFTOVlmSGJDL0RBSllHYnlwOFh0M014Q1Rlc3JIYUJZM1Azcy9iRG1V?=
 =?utf-8?B?V2djd1p6ZFNiMktaTklyMWx5MTVoUklnekZpLzdCZUp2Y05yMVhINWVCZXVw?=
 =?utf-8?B?MllZeHg1NnVkYmRCZFJCUVordnNJSVNnd1RXY0Y0dkIydmhWRGhZZ1lBTzBt?=
 =?utf-8?B?eVoyemh1OTVJSCtoV3U1QlFYWGx1MFh0RG5QU3VHM2d6RHN2aGRJZUhYNFcw?=
 =?utf-8?B?cllFS2NORitwZjR5S1FNY0ttVXRjcVYxSHJ1STRrYkpXclBEZFRTbGdIcysv?=
 =?utf-8?B?UUtLQkJwdTgwWnVFNWtSWmdGMjh2S3N1Q1pYc3VGYW9ySkcrSmtUcWZpeHZx?=
 =?utf-8?Q?XsXGu1w0vsSL7V4/RQKpyHdYX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1f04ff-8d7e-4226-1c67-08dd689b814e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 17:12:05.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVFMC7sLRKItLLozCNeSCEzFfKCAPxLl1iGufkjn5dckU93nu3nUUdWqXEqewSojNcYOFSuZbaZ1KB5CxT9ibQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5662

On 3/20/2025 22:51, Luke Jones wrote:
> From: "Luke D. Jones" <luke@ljones.dev>
> 
> Adjust how the CSEE direct call hack is used.
> 
> The results of months of testing combined with help from ASUS to
> determine the actual cause of suspend issues has resulted in this
> refactoring which immensely improves the reliability for devices which
> do not have the following minimum MCU FW version:
> - ROG Ally X: 313
> - ROG Ally 1: 319
> 
> For MCU FW versions that match the minimum or above the CSEE hack is
> disabled and mcu_powersave set to on by default as there are no
> negatives beyond a slightly slower device reinitialization due to the
> MCU being powered off.
> 
> As this is set only at module load time, it is still possible for
> mcu_powersave sysfs attributes to change it at runtime if so desired.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/hid/hid-asus.c                     |   4 +
>   drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
>   include/linux/platform_data/x86/asus-wmi.h |  13 +++
>   3 files changed, 108 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 599c836507ff..66bae5cea4f9 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -624,6 +624,9 @@ static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
>   		hid_warn(hdev,
>   			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
>   			min_version);
> +	} else {
> +		set_ally_mcu_hack(false);
> +		set_ally_mcu_powersave(true);
>   	}
>   }
>   
> @@ -1430,4 +1433,5 @@ static struct hid_driver asus_driver = {
>   };
>   module_hid_driver(asus_driver);
>   
> +MODULE_IMPORT_NS("ASUS_WMI");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19..10936a091c42 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -142,16 +142,20 @@ module_param(fnlock_default, bool, 0444);
>   #define ASUS_MINI_LED_2024_STRONG	0x01
>   #define ASUS_MINI_LED_2024_OFF		0x02
>   
> -/* Controls the power state of the USB0 hub on ROG Ally which input is on */
>   #define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
> -/* 300ms so far seems to produce a reliable result on AC and battery */
> -#define ASUS_USB0_PWR_EC0_CSEE_WAIT 1500
> +/*
> + * The period required to wait after screen off/on/s2idle.check in MS.
> + * Time here greatly impacts the wake behaviour. Used in suspend/wake.
> + */
> +#define ASUS_USB0_PWR_EC0_CSEE_WAIT	600
> +#define ASUS_USB0_PWR_EC0_CSEE_OFF	0xB7
> +#define ASUS_USB0_PWR_EC0_CSEE_ON	0xB8
>   
>   static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>   
>   static int throttle_thermal_policy_write(struct asus_wmi *);
>   
> -static const struct dmi_system_id asus_ally_mcu_quirk[] = {
> +static const struct dmi_system_id asus_rog_ally_device[] = {
>   	{
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> @@ -274,9 +278,6 @@ struct asus_wmi {
>   	u32 tablet_switch_dev_id;
>   	bool tablet_switch_inverted;
>   
> -	/* The ROG Ally device requires the MCU USB device be disconnected before suspend */
> -	bool ally_mcu_usb_switch;
> -
>   	enum fan_type fan_type;
>   	enum fan_type gpu_fan_type;
>   	enum fan_type mid_fan_type;
> @@ -335,6 +336,9 @@ struct asus_wmi {
>   	struct asus_wmi_driver *driver;
>   };
>   
> +/* Global to allow setting externally without requiring driver data */
> +static bool use_ally_mcu_hack;
> +
>   /* WMI ************************************************************************/
>   
>   static int asus_wmi_evaluate_method3(u32 method_id,
> @@ -549,7 +553,7 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
>   	return 0;
>   }
>   
> -static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
>   				 u32 *retval)
>   {
>   	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
> @@ -1343,6 +1347,44 @@ static ssize_t nv_temp_target_show(struct device *dev,
>   static DEVICE_ATTR_RW(nv_temp_target);
>   
>   /* Ally MCU Powersave ********************************************************/
> +
> +/*
> + * The HID driver needs to check MCU version and set this to false if the MCU FW
> + * version is >= the minimum requirements. New FW do not need the hacks.
> + */
> +void set_ally_mcu_hack(bool enabled)
> +{
> +	use_ally_mcu_hack = enabled;
> +	pr_debug("%s Ally MCU suspend quirk\n",
> +		 enabled ? "Enabled" : "Disabled");
> +}
> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_hack, "ASUS_WMI");
> +
> +/*
> + * mcu_powersave should be enabled always, as it is fixed in MCU FW versions:
> + * - v313 for Ally X
> + * - v319 for Ally 1
> + * The HID driver checks MCU versions and so should set this if requirements match
> + */
> +void set_ally_mcu_powersave(bool enabled)
> +{
> +	int result, err;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE, enabled, &result);
> +	if (err) {
> +		pr_warn("Failed to set MCU powersave: %d\n", err);
> +		return;
> +	}
> +	if (result > 1) {
> +		pr_warn("Failed to set MCU powersave (result): 0x%x\n", result);
> +		return;
> +	}
> +
> +	pr_debug("%s MCU Powersave\n",
> +		 enabled ? "Enabled" : "Disabled");
> +}
> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
> +
>   static ssize_t mcu_powersave_show(struct device *dev,
>   				   struct device_attribute *attr, char *buf)
>   {
> @@ -4711,6 +4753,18 @@ static int asus_wmi_add(struct platform_device *pdev)
>   	if (err)
>   		goto fail_platform;
>   
> +	use_ally_mcu_hack = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> +				&& dmi_check_system(asus_rog_ally_device);
> +	if (use_ally_mcu_hack && dmi_match(DMI_BOARD_NAME, "RC71")) {
> +		/*
> +		 * These steps ensure the device is in a valid good state, this is
> +		 * especially important for the Ally 1 after a reboot.
> +		 */
> +		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +					   ASUS_USB0_PWR_EC0_CSEE_ON);
> +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
> +
>   	/* ensure defaults for tunables */
>   	asus->ppt_pl2_sppt = 5;
>   	asus->ppt_pl1_spl = 5;
> @@ -4723,8 +4777,6 @@ static int asus_wmi_add(struct platform_device *pdev)
>   	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>   	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
>   	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> -	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> -						&& dmi_check_system(asus_ally_mcu_quirk);
>   
>   	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>   		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> @@ -4910,34 +4962,6 @@ static int asus_hotk_resume(struct device *device)
>   	return 0;
>   }
>   
> -static int asus_hotk_resume_early(struct device *device)
> -{
> -	struct asus_wmi *asus = dev_get_drvdata(device);
> -
> -	if (asus->ally_mcu_usb_switch) {
> -		/* sleep required to prevent USB0 being yanked then reappearing rapidly */
> -		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
> -			dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
> -		else
> -			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> -	}
> -	return 0;
> -}
> -
> -static int asus_hotk_prepare(struct device *device)
> -{
> -	struct asus_wmi *asus = dev_get_drvdata(device);
> -
> -	if (asus->ally_mcu_usb_switch) {
> -		/* sleep required to ensure USB0 is disabled before sleep continues */
> -		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
> -			dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
> -		else
> -			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> -	}
> -	return 0;
> -}
> -
>   static int asus_hotk_restore(struct device *device)
>   {
>   	struct asus_wmi *asus = dev_get_drvdata(device);
> @@ -4978,11 +5002,34 @@ static int asus_hotk_restore(struct device *device)
>   	return 0;
>   }
>   
> +static void asus_ally_s2idle_restore(void)
> +{
> +	if (use_ally_mcu_hack) {
> +		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +					   ASUS_USB0_PWR_EC0_CSEE_ON);
> +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
> +}
> +
> +static int asus_hotk_prepare(struct device *device)
> +{
> +	if (use_ally_mcu_hack) {
> +		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +					   ASUS_USB0_PWR_EC0_CSEE_OFF);
> +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
> +	return 0;
> +}
> +
> +/* Use only for Ally devices due to the wake_on_ac */
> +static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
> +	.restore = asus_ally_s2idle_restore,
> +};
> +
>   static const struct dev_pm_ops asus_pm_ops = {
>   	.thaw = asus_hotk_thaw,
>   	.restore = asus_hotk_restore,
>   	.resume = asus_hotk_resume,
> -	.resume_early = asus_hotk_resume_early,
>   	.prepare = asus_hotk_prepare,
>   };
>   
> @@ -5010,6 +5057,10 @@ static int asus_wmi_probe(struct platform_device *pdev)
>   			return ret;
>   	}
>   
> +	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
> +	if (ret)
> +		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> +
>   	return asus_wmi_add(pdev);
>   }
>   
> @@ -5042,6 +5093,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
>   
>   void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
>   {
> +	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>   	platform_device_unregister(driver->platform_device);
>   	platform_driver_unregister(&driver->platform_driver);
>   	used = false;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 783e2a336861..9ca408480502 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -158,8 +158,21 @@
>   #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
>   
>   #if IS_REACHABLE(CONFIG_ASUS_WMI)
> +void set_ally_mcu_hack(bool enabled);
> +void set_ally_mcu_powersave(bool enabled);
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>   int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>   #else
> +static inline void set_ally_mcu_hack(bool enabled)
> +{
> +}
> +static inline void set_ally_mcu_powersave(bool enabled)
> +{
> +}
> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
> +{
> +	return -ENODEV;
> +}
>   static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>   					   u32 *retval)
>   {


