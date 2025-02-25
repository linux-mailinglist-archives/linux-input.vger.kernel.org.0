Return-Path: <linux-input+bounces-10347-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC272A44432
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 16:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51B77173E90
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 15:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACA326B08D;
	Tue, 25 Feb 2025 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z8/bQpQq"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640CB42A92;
	Tue, 25 Feb 2025 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740496738; cv=fail; b=bSK3jOwwNUDkKg7SZiFAa+TTiV602Rib2RSnvqvcK58umObKrKT7rxy8yoRsMZTzWeprNmgCWiPalm/EBhH/yctdBdi6iqcx/rzfO3/i2Hvcb3dox9D5zZKmRqzZvA2hs5o66aoqdY/kOdYzxxEO96L0vPTPkX3IsiOl4brKDDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740496738; c=relaxed/simple;
	bh=xTTM2iSMT8k0//mLo+YX9p9/DUaXwOqZVplXVqeWwUU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kJW8ogjqjYa1Ev9F9zOpXgkGBBjr6n26pE9yiDoglgg/HkY6hiexlzEccR/6I1wFzBcJA2eb9bqZyb1AJlP7+W2JcGQl9s47ehHYl0vBq7A4lmP17+sjJ1hZLMAiAgbjFUFzO94z9UP2vFlb0cI6pBgxlV23UAaZsdPHrdsPazM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z8/bQpQq; arc=fail smtp.client-ip=40.107.92.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKNrt4rNy12HzYiOIE3mz72G027vwOJai9rV1yDYea5/1V+WPOgT+wNAFP1tvSEyhdYubo/jGuUqFjk8gVlHbFV6ovgqNbwiMUyeADNcHcKMloPT/04It+1UhMSCfgJSheMQk3lr0wl3KMVNpDb6D99pUIoq8b5gOKEUuWRNuD+e63/7vlrJ5yWUl2LQdeNu8YskjZ7VYf1jjaaPWzBYHYc0gTmSo9q6PMAfiSJEk/5EO+asODKbMvltt+WXtkwsQCjOs1Ghbcw+9f/NReQg9rcX3uUhVtgW04RiEsgy0ZMNK/ubsfNfMZwr7jOP95PBHb/ZaJKauqZkWUY7+ecOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2fMkPZpvjH2yKfGZy0X1zHGKRmdm65QHoJBBXCigG8=;
 b=gcftUKH57lsuY3ywB60wPbJBN6WQYMJqn9YKrc3EE6HP8AAJWzjjQy3hQwhnTXQYEtsjuNPHJAUsTJLNxYmaAwoj7rDktY5VQ1b/DKTWUz9rPWckP+Wg+kqiOJkQFsCGKsIHoPuVqxbrxIozqX3NJhq+DE3QJtl84MXEt4ZctF968KVU47Cgi8XRFoV4odPlk4nMxup/+uC5Hv+H9u0Dj54/KLRAxL5GUIBszeB9+LxzoB8q6ZJoJBh/FdhxX+cn/FKsjtJmzMuvsYdaasF2MKrI8AD+TFY/gKPCvE22nNUsBB9pM2SW3ILHLiLmP8QXl1LNZM0gnnKS8ZoJnEKnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2fMkPZpvjH2yKfGZy0X1zHGKRmdm65QHoJBBXCigG8=;
 b=z8/bQpQqKiaMvGW7uRrLx/AVrOtQgSKT5Hw/f25Q/QVE9o8E++4m+mRHCYT0vS7jBVuLdeq8hJ/w5xiHxnO3QiQuJ/MDF569hTLE+luhi1Y67+kyBmHOvcVxXABJnMttzTNNLOHM9IizOCvCfP5/L/RZm9Z12V1wyyPhXNavNbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 DM4PR12MB6038.namprd12.prod.outlook.com (2603:10b6:8:ab::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Tue, 25 Feb 2025 15:18:54 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:18:54 +0000
Message-ID: <323ade14-4d11-49b4-9657-a7f1900ec334@amd.com>
Date: Tue, 25 Feb 2025 07:18:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org
References: <20250225081744.92841-1-luke@ljones.dev>
 <20250225081744.92841-3-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250225081744.92841-3-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|DM4PR12MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aafb456-614c-4b54-1512-08dd55afb734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXNpWFFtWnplc3NnNDVBQzFnd3pqdjFldnhBaVZsNjY0SlFUNkoxaStRSDhI?=
 =?utf-8?B?c0VtRSt3b0YrUVBROUhGWlFWekYwNEpIZjhHUkc3bUNLdXp4dUJxQjlhOFpp?=
 =?utf-8?B?WTltSlVYRDhYSzY0SzkxTG5HN3pueUNkUVBhYUE2b2lLVEk5WDdHdUQyaENQ?=
 =?utf-8?B?c3YwQ1EvSXg3M1k5cXhIWDNqVjJtRjZpdFdqWk5CMnFSQ2doOFhSaFFPL0FN?=
 =?utf-8?B?NHhEZ3l0QUdEV2tnZjczdExFZFNpT3pXVFl4dXdLT0VIYTZtU0ppTmwwYnJO?=
 =?utf-8?B?akF5Q3JMd0JmTk5nRitoV1VzdnNvSWNHQmdHM2c5bHBienI1MVJpblpuUisr?=
 =?utf-8?B?UFZIeUhnQS9VRzhpalBPeFRFa215WmxxWUI5aVBINWJtdHFiUFJaQXcwY2l3?=
 =?utf-8?B?NDBPYmVMYk04U21pMkdIMXN2YlFRMmUwd3ZGWVZQVjBZOGRsN2M1S1dGdUF1?=
 =?utf-8?B?MlF1QW9ZczFleFd4YzhiL0R0S3NtemkwRU1Ia0IxNjRZejZTb0tYNXh6VWRi?=
 =?utf-8?B?bVZqVnBvMWI0cyttK1lMdG1mTE41UldJWU5wZ0J6NFptUGw5TEowQW9rQ1FM?=
 =?utf-8?B?NlAvSEliZ2w3YXlpVUN5TzlBNmt1TDBsbUlFaDhRNDRPRXJOYjBZeVd4QWtI?=
 =?utf-8?B?Y0oxMjdzSDEvK09rUkxxclA1cUJub2VoS2hkQUgyQ2RpMnI3dFR4c1dkbXdv?=
 =?utf-8?B?cElFMXJBWU9uOUpNdEZqOTZXaDEwVkt1d0lRSnh4dU1Dait3NGVGa0FreVpS?=
 =?utf-8?B?dEpsTGtoRGRKOEJQdXhWVkwyanV2T0VLVHpLNk1lckRiY01nVi9VRE96RnVW?=
 =?utf-8?B?R3ROdjZQTG5VY28rdHhMQnJac1dUZG9FcmZMWkJocVZBdXFlTXhlSk5rQ3U2?=
 =?utf-8?B?ZWpHdVZKWVlEKzhwY25qMExnQWVpbnRhN3o3aElCNTNrQWZsa1ZLTlh3RG9C?=
 =?utf-8?B?RW5FSVQ0Qnh1OHJ4OCtRWDlQRisxMTVuZ0pZYWJraUtGZHVaeEYrSWEwd25H?=
 =?utf-8?B?bllkSktjWkRqWkdiZ2ZwVGxGSUh0ZHVTSjhqbHdOOHJ0Q09aV28wNi9wcFFJ?=
 =?utf-8?B?SU1FSDhnNkpkbXJMQ3JldHBwYTRRdFE2VlVjeGo2am5mdGtndHNoTHRrczZy?=
 =?utf-8?B?aFhjZS9qSSt2VnlkenFZekthQmxRVzg5YzZ2Rkd1eGdmRVlwOEZQTnplbGtZ?=
 =?utf-8?B?M2t5Z1AyZnVBSnFTUXlPM2tJenBQM3FyMjRIWWdza0w0cytha0lPL1VnV1Aw?=
 =?utf-8?B?WDM2MHZVSzNRRThzZEFFOUtldDU2b3VOWlNSQzBXTTg1akdPaUVNU0Y2MFd3?=
 =?utf-8?B?UDRRNDRYVU4wUG9PM3hQdHQrODNvRzJQOFZmVWRKcCtHZSswcjJ2U0tLWmNr?=
 =?utf-8?B?NFdaSXlnWW5KcVIxR2U5eTNQL0xleU50b2hJMTMwZVBLOE1vdUg4Zmx2bXJG?=
 =?utf-8?B?cmw4OGlwWHhVZWJFUnVkTXdCMjlzUG10eklrWGc2N0lWMTluQjNOT3I0Wkl3?=
 =?utf-8?B?WGRTaGcxTjdPNWRIbUJzRW5xVmVXN0FDV3dLSXNHNDRHQ1RTMTZRQTlRR0JL?=
 =?utf-8?B?b2FObjJwbERHY1B4blNqM1plb2N3Q050UE1WalFvWnhjcWlFUmhYVFhya3pK?=
 =?utf-8?B?Y2kzYkh1ZEZqTmJHcFF1ZjhacXp2UzUxeVRQVk9qc21VKzc4Q2F0NURKOStm?=
 =?utf-8?B?MU9kbWhVY0RjMEZ3US9wTzJtd0tIdDlHU0JCTWs2d3RmanFmQm94Sk9kQlVX?=
 =?utf-8?B?QUZCYnlMTVdsSWg1WHRra1dtSDVTUTVnaGVnK3RLcHJJWDNieEpMd0p3RGpH?=
 =?utf-8?B?UlAveldtWW13YlNIT0ZHb3RPMmQyNncvbWZ0bGYyeW9RTjFMRU1qQnZYMlBE?=
 =?utf-8?Q?/Hp5mmIApNo1t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ZxWlNDWWZnaHM5d1AzS096WWZKbVFrYzlYS0I5QXdKNjRxWHE1dTluWVk2?=
 =?utf-8?B?MGVHL2E2VkRVVWgyb0tqdG9pcW5OVU5nUnVUQ1cwUlp4RFluUnRmUDhnbkpm?=
 =?utf-8?B?ZVdMOGJQcWpuUGNwcTY4Nm82Y2JHYkZYWGF3cFpua0N5SnA0M2JiNERDblRR?=
 =?utf-8?B?ZmtqaEk3MjZNdlRRc3hnMXBqQUhJaUN5WXJuTHlIenZvYjQ2SGFSUEFuSm9r?=
 =?utf-8?B?MHFkeGtnOWpzUUdMMG4ra0pTbTc1b0huelpEM0ZOT0lGMkRUbE8rMjVod1Bq?=
 =?utf-8?B?WVRqSEdybWpNd3Yva0RCcHZwUjViT3cwOFRaZ0t6NGdCSGptOHEzTmJ6a21I?=
 =?utf-8?B?NllhODZyVUkyUm1UdXZCNVlVNVIzWktaUVF5WVBSRjI4bWo5ZFhjRVYzOThn?=
 =?utf-8?B?QjFEZ0gxTVQ2SWxoY0paZnYycFFBQ1pROGZNeENDU09JQjArNTlTUXVMcitV?=
 =?utf-8?B?UDRvUk5iNW02NDZhZVRkMjcwSktPRUZRWFBKNXRnQkR4VXJFMW4yMlpCa0xv?=
 =?utf-8?B?S21iZ2lxaU83dFZzcEVUeS9qaE5IZW01elRHUWZjY1FMYTNCbmdnWmRlYXgz?=
 =?utf-8?B?c1loalhzMXp0ZEpmWWVvUUZkT01lYXF3UURUa3A4QTBxcWRPY1B4QndjNTdo?=
 =?utf-8?B?akNhR1R5UUNac1BJbXdVd1VDYXlBUUsxVS9nNGVSeDNJTjJ0aUtIbXdCRmps?=
 =?utf-8?B?Y3JuV1BUVmtncHY2aVhQamRqVm5PNWRQU2JUZzVFZU5WcUdnYy9jSFBidFVM?=
 =?utf-8?B?Vi9uM0pNVEI3QXZ1RSswSWFMS1pTUFF0V0JmWEY0MklZYlRoejhmTXVTQk5w?=
 =?utf-8?B?Wm9xdDB6dUV4SGpIbEJNbTJpaVUzMStFK081VVQ2Y3c5R1JTa1RzQ1p1VXVX?=
 =?utf-8?B?eWJQclFINndlOWRuMnRpa0NwM1RDNVpYU3BQM0hjT2dkN1RnM2h4VXJJUWVl?=
 =?utf-8?B?VDhPVlBCSWVDZDFPekcybE5ldEFZSFplM2l2Mm85UFd2by9LU01BU0taK0VH?=
 =?utf-8?B?aXIvVXh0d3F5YUs3YmdkdXd5OWhYVmNLa2VSTXRhNlNwQ1NsSVdzWlQwOW5j?=
 =?utf-8?B?LzN2a1RaekZ1d2JaY2NnS21scWJVTmtmR2RmQUdyV1A4ZHk3SnJmbjFQTkpK?=
 =?utf-8?B?aCt4emR5bU5BVldHWVVzU3gyZ1hvZm53KzRNbDEzbE5LWDBXU3dzeDhuakdG?=
 =?utf-8?B?Z1p0em5BSklXbEFFdXZrT0FFMG1VbTVhMjYwVGN4alA1akRiSDZiaGRMUnUw?=
 =?utf-8?B?MFVsbmRwZ2hUTjRpSVBxellPdzhtRU9SWUJGczFvbk5qQ2hMbnEyWTcvVkF5?=
 =?utf-8?B?aVNBOHpJakxGRUtGR1g0S3VyMWRERlVFbGE3M21USDNJc0VHb0sxRFBrK3RJ?=
 =?utf-8?B?cUtKYTl6aWg3YW03WklZOTBoRi8wcDZVeXRJVzB6Y1hlRy9waFVoeDZtMXl0?=
 =?utf-8?B?bmwvMVIzbkgzVVRDelBkYndyUGNCSDVYUWFwY0oxTERMRjFFSDhkUTFEM3Vt?=
 =?utf-8?B?SStwZnhSWHZlbGRZc3pESXlEc1ROMUtPWXpNY2l3RkdkemhEMHhEeVBmandM?=
 =?utf-8?B?ZnA3djFNNGNGaGhsdk5GZ0ZPVDVSQ0hwQnBweUhQZ1BWRGZZU3lmSldTWDQ4?=
 =?utf-8?B?YVVselh3NktIV2pTN084YURpUmN6bmhhWFBuUzdvVUFGVXgxeTQzWUk3Sk1C?=
 =?utf-8?B?LzNuTU43RDRISVlUS1hiK3lGa3ZzYTlldXlNaTVJY3krRmhTTFRWUGc4b3Zx?=
 =?utf-8?B?Wk53RjltaHVpQTF0QkFMWG9SbFVNT2ZxU0pRczRjU0cyelh6UnY0MThGQVJh?=
 =?utf-8?B?K3pBa08xTWEyOWlqWStmOEtSTktwUm85OWZQNmhMZWY5emF6Qzh6clpyWTFN?=
 =?utf-8?B?MjdnQWZHQ2IrOFlJSjFVWWk5T0JKeUhvVTU1NkZwTSttbldFVlRqUWZZemRw?=
 =?utf-8?B?bXVPVXlUL29MbW1tRnNaRzFRSFRLVEh1Q2VzTE1IT3BnMHR6YzBUUk50cGp4?=
 =?utf-8?B?MHBNRGdZclROdHE3dldKc2lZTnBtRDY1TmZlaWh2R2V1eXQ5Q2tUUW1XMHZO?=
 =?utf-8?B?eGRpTWljUnFMcFhRajFpOTlsY0hxeDNxQm81aGhjOEZZUk9qMzlqd0FCeSt1?=
 =?utf-8?Q?sLUuvvhHN09QAU0UUQFvOgLHR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aafb456-614c-4b54-1512-08dd55afb734
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 15:18:53.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNl/LPUMABl+2aUpCBPmsz+7Iawn5T7dkIHxt8xyZnWCce8XqcHl9nx+XAofnlrw6TMG+kwlrKBFckhfZ1FY6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6038

On 2/25/2025 00:17, Luke Jones wrote:
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
> ---
>   drivers/hid/hid-asus.c                     |   4 +
>   drivers/platform/x86/asus-wmi.c            | 124 ++++++++++++++-------
>   include/linux/platform_data/x86/asus-wmi.h |  15 +++
>   3 files changed, 104 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index e1e60b80115a..58794c9024cf 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -614,6 +614,9 @@ static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
>   			 "The MCU firmware version must be %d or greater\n"
>   			 "Please update your MCU with official ASUS firmware release\n",
>   			 min_version);
> +	} else {
> +		set_ally_mcu_hack(false);

Rather than calling this to set a global, how about just unregistering 
the s2idle devops?

> +		set_ally_mcu_powersave(true);
>   	}
>   }
>   
> @@ -1420,4 +1423,5 @@ static struct hid_driver asus_driver = {
>   };
>   module_hid_driver(asus_driver);
>   
> +MODULE_IMPORT_NS("ASUS_WMI");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19..9dba88a29e2c 100644
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
> @@ -1343,6 +1347,38 @@ static ssize_t nv_temp_target_show(struct device *dev,
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
> +	pr_info("Disabled Ally MCU suspend quirks");
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
> +	if (err)
> +		pr_warn("Failed to set MCU powersave: %d\n", err);
> +	if (result > 1)
> +		pr_warn("Failed to set MCU powersave (result): 0x%x\n", result);
> +
> +	pr_info("Set mcu_powersave to enabled");
> +}
> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
> +
>   static ssize_t mcu_powersave_show(struct device *dev,
>   				   struct device_attribute *attr, char *buf)
>   {
> @@ -4711,6 +4747,18 @@ static int asus_wmi_add(struct platform_device *pdev)
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
> @@ -4723,8 +4771,6 @@ static int asus_wmi_add(struct platform_device *pdev)
>   	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>   	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
>   	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> -	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> -						&& dmi_check_system(asus_ally_mcu_quirk);
>   
>   	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>   		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> @@ -4910,34 +4956,6 @@ static int asus_hotk_resume(struct device *device)
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
> @@ -4978,11 +4996,34 @@ static int asus_hotk_restore(struct device *device)
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
> @@ -5010,6 +5051,10 @@ static int asus_wmi_probe(struct platform_device *pdev)
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
> @@ -5042,6 +5087,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
>   
>   void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
>   {
> +	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>   	platform_device_unregister(driver->platform_device);
>   	platform_driver_unregister(&driver->platform_driver);
>   	used = false;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 783e2a336861..a32cb8865b2f 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -158,8 +158,23 @@
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
> +	return -ENODEV;
> +}
> +static inline void set_ally_mcu_powersave(bool enabled)
> +{
> +	return -ENODEV;
> +}
> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
> +{
> +	return -ENODEV;
> +}
>   static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>   					   u32 *retval)
>   {


