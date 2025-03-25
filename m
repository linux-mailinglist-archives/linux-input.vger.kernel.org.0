Return-Path: <linux-input+bounces-11160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB53A6E7F5
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 02:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BF523A4A43
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 01:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FAC125D6;
	Tue, 25 Mar 2025 01:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qWFsNA3Q"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F7B2F3B;
	Tue, 25 Mar 2025 01:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742866055; cv=fail; b=HeXOH5c7owOnUtEVB2BZGhKDx9/cYpWjsMrzWA/M0O7csSP+rGhVYQ1f5NgYn82dIQnDGZlQc0WnwDQcVS5C4l/dbq+dEAK1zuQUZGIAONZekxleCFTmszTfFCj/+MiVUeo84phuf77SSmQrQUqUhehFyAUk/f4Naxi8/3q2iBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742866055; c=relaxed/simple;
	bh=57FsN4yRqBSw40dPkJeLUhVu+l+4ytwWPPwd0Ri3PSA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L6lg2rH0Pz8JR/oD8Z/ARtXvBGsywWj2hcwdvBEyu2ChqNr/5M5mdyv51dsEaTg55vdYnciGrnMPnteDCUXWDdVAmCNAFr4c4Qy7tBJLLGEgEgOvgrWhw1iL3qUadvBjxW4nIRatjXeKuOH+Imls9HW44J3EQBnfB3IoslTydeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qWFsNA3Q; arc=fail smtp.client-ip=40.107.237.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3h69sEVp2RG3v8JKFT0JjplAXmY/7zNc74Bu3yLArG4mYJ7BURMLl7Yu8VQ66dmmGjBEMU5WHjoESz15RXGlzhhFo4BXcqOLse0+4z1T6JR7oTM1+zFggncYGeHmB9a/g7kWMnOMh3n2WlXFWJTAdwgwHNGHccHj0+ulnkock3CVwHUz1mH3OO1wl1ClXPzAixi3zISYOZ6G452kCJ6SVQuomoiPCClGr8d+vqVVQ0fBSgY2sA1EEbBRycULegAudyhUji+yLJP3VJHRA80MXy9cKm0uakFCkkt15H/M+S44FnuJF+0sk5krrERPXB++ll3C9fjjiQkPGvd67mKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvnRCC4oT55yAZ43aluIMsqKmPH+vEzv/fPBiQ5HfE8=;
 b=gIUwbJGwyEiHLLF358Ff5sHd80JslnQ2slUAnLPpvGa+TqTCRxRKaxkLbD3UK4UvueK+cj0HsXIOjjQF9lghm1fchEcAFCPSDt4zl1xEME4xaHBU+knEtNwNnBg6fASoKJhzvYroNvFCCUEnewOwy/xuR2vLIkkJ9Lgb0hcwBnjPWedmBJCgsz9oBQVfzN33edVJCANrqC2CJ0sHvLEntPL21Xu24nmIUqhLn1y9xRDH029yhzSNSbSgrhgl2Rf+yyGnw4FbY1A9avaWXPngB11bESB6W/L20Fly2JGeVb+psX8ZTFQuS0ukEvwAJxguRpi/qoE+hEVFUGWk1Ie3gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvnRCC4oT55yAZ43aluIMsqKmPH+vEzv/fPBiQ5HfE8=;
 b=qWFsNA3QFGMv+uBaGNd6G/NH79sNdfxS0oKZTxgwCdn5tUoY4gMujcb5qV5iGECbM+SB00E8see9upPxuTBpThp9tO0hrlNQBT4h1NKQXEZJkXK3e6zmEWTwNoZS+vBfZkDMtFzhs5okTVpuBGdcCq6DH6dzUnju/GJwUAmqwzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9021.namprd12.prod.outlook.com (2603:10b6:610:173::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 01:27:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 01:27:31 +0000
Message-ID: <79c013a1-a9df-4feb-871a-203c08ef938c@amd.com>
Date: Mon, 24 Mar 2025 20:27:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] hid-asus: check ROG Ally MCU version and warn
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org, lkml@antheas.dev
References: <20250323023421.78012-1-luke@ljones.dev>
 <20250323023421.78012-2-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250323023421.78012-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5531f4-51ff-4974-fdf5-08dd6b3c368a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFBpemFXcmEzbW1PaU9vaDFicDFNNUVSSkI1RnpvT2hqM1p6c2tIR0JENUJE?=
 =?utf-8?B?aUttclRLYmV2ODJOUzREZG9vNXMyT0piemRqQnd5YzkyWUVvMGxEa2RJN3Rx?=
 =?utf-8?B?QXVOQzM3OXZCbVNSSmNlclVWZkRXaDJZdWpzU3lWanVBTWt6WnlDOEdodHBL?=
 =?utf-8?B?cDUzcjJUU05XVjBRemwwRldMaTBidlFzbStLTkZnek1qaFdkWEpKMDV4d1dK?=
 =?utf-8?B?djA5anc1L09QRE1DbTQ0TzZIQWhZU0p0OFk5NnhvU1ZNWktvYjhqclZJTyth?=
 =?utf-8?B?NmtzM3hlRDhBZkROdklKL1o2T3V1dHpjelE3VkVOWWxKZ1Q5bkgrdmIwQ2ZY?=
 =?utf-8?B?NTJyN2pnUnd3WXA0aERNMENDNjM0NEQ1YVp0aXBMV2NBQmo2bmwzU0I4ckJT?=
 =?utf-8?B?dnJsbVBKQTNqSnVvVHVZUTRVaVNRVlJiYjR3L05MaHpSNHRtaWtsY09YZ0xj?=
 =?utf-8?B?ZVBpcHRhL2Z3ZVl3N2FmSS9BeDRVNVhFaFc2NVpuRWFTeSttREE1SXBKNVh4?=
 =?utf-8?B?cEFNeldZMFkwWXFYdGdwU3BMcU1Zd0NKTXlZVndwM0xSNitKZ0M0akJUTnRk?=
 =?utf-8?B?VStnbmVrZGlRRWU2VmFPMGpSVTczTmxvMDdVL0kxc0VTTkZQd3dtUHJ0UGZE?=
 =?utf-8?B?NzQxSVU2S1p4NXVSbzZ1V0M3cG8wWklmZG9tQTN0ekdnZFRCQ2xXVWR6RFRH?=
 =?utf-8?B?SW80M2hJV01OSXJrdVBjOXFsZzdrbS9Pb2JrVEFLcDQ2TE1SQ0FnaHlYbW1k?=
 =?utf-8?B?bEJKTDY0akJvMUQxZ1RCMkpUem93NTVvQVhmUEVyTWZpWDQ3TkE3YVVuK0VR?=
 =?utf-8?B?YWpEWlExMDFGYThnWEN1MkEraG4xNEw0V2p3VE52NUtqMGNQNkVSNDFDMUxM?=
 =?utf-8?B?VHlGMWdCb1RvRkl3SEdmV1hMTW5MS0IrNGp6blQ1RSthcGZCbVZTS3VwM2tn?=
 =?utf-8?B?REFSK3kzbEJKdDNZb2Y2ZEdRRk03QzBwUWQzVVcxQ25hT2JrK25JbTh2UkJI?=
 =?utf-8?B?M25HOWcwQ0JWcGx4cmxlT1JpR3VLY1dGa2NOQWFpNko4RnFPd1dJV0VVRml2?=
 =?utf-8?B?M3J1TWV6eEJtM2hJZ3JjVGwxNExCQW9FL1hwSG92ajdwOExNTUlHZ0plN2wx?=
 =?utf-8?B?cW1wSVlZWitTVjhTOGpxb0NPU2h3aU1JbnFPWFdnRXlUMDNXaEtKTXhhUGQ0?=
 =?utf-8?B?bVhRUXNZSUhJaWpmUlJ2ckNVcysyOEYzRDdxc0d1MGdBdC9DaEJTMGZZQm9I?=
 =?utf-8?B?TkJJdTcvWUNwdXBLVm5obDNTWmxSeUJySEdpQ1JRckpQYWphcWpPbXVIbkph?=
 =?utf-8?B?UFpvWDV0SHZHMU05WEhHM05XTUorSzM2YXNSV2JBSTQ4MFpzNTgwbzZPUWVx?=
 =?utf-8?B?Kzg3ZzZCbWpYbXhEZ0RGOENJYXR3YWNZNy9MaVJqMm5QNVU2NU1yMXBjaG53?=
 =?utf-8?B?eCtJbEVraitlOE9PK2N2S2tGT0d0d1BnRzEycXhEMm40ajJpVVV3R1FyemIw?=
 =?utf-8?B?VUxWQWdUZ3hvTjVDT1lRRlpwUVF6Wk1vUkxFSkdjc1h2THQveVgrVzNTRUZU?=
 =?utf-8?B?L2l4QnMxMGY1dGJVejFYMWFGZ21RQit1ZXkvR1B6NzgyaFJEdGR6ZytESXgw?=
 =?utf-8?B?L2dhOXM2Q004eDVRd3hxeDhmWnBEd1hmVlFyQ056OS8xbUdWZGt5SWUvY25i?=
 =?utf-8?B?cnZTQmhMZFo1UlY5dVBoRlJ3UWIyZkdBd25mV2l5bW12TWpKNUxYSlpjekJ2?=
 =?utf-8?B?VDhwZTk1aUtVTXlmaXlLaTE3RVFaZzUwdjlKUXJLUmhxMC9kTW51cnlHbnMz?=
 =?utf-8?B?NHZRNWpMK1krUzJnTCtFQUo4VUxyR29CUjZsN3ZpemFjMWU2R3JyT2IzdkFP?=
 =?utf-8?Q?Rc5lRY/4DXw7a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTJxV0pLVmxRSHZQcHk5Q3EwUWZ2QXEvY2RyNjV2TDcwc1VGREJQR1JhMWlp?=
 =?utf-8?B?aXFiS3h5UVFJS0F3VU5MY0YyTnlBVE5RU044OEpxTFVMZDFGNk55dkt6S1FV?=
 =?utf-8?B?UEUwQVBNNGdkSGtidFQ2MzhieHVVZHdvVXFGVjhSNXUveDhKaW9DQ0lJUFBZ?=
 =?utf-8?B?QXlHS1lRQjVpTTBNRU5xcUlucG1FYldtZjFMN2hlTGFrSllDdHZ4LzM5aGJ1?=
 =?utf-8?B?M0FrNTlBSVVyTVdSTEFmMmpOTUZjZitKTE9KQlk1OWFEdXJuZEh2WkZKUWhZ?=
 =?utf-8?B?VFJ1RU9EbGRNUVBRcnJnNkVDWmVxbEYzWnZ1UkhUSkpXMnU2YzVuMXpncml3?=
 =?utf-8?B?SUpXQU1ZK1I0cDNwbVpCVEpSTWExK25sZ1hVRjl2YjlHQXlOTUY2Nm1wQjI5?=
 =?utf-8?B?dE9vSCtQN0ZEZDRldmR1SDJ4b3h6ekxjWVphTWc0enliTVB3Z1g1U2Y4cS95?=
 =?utf-8?B?SEY0S241ekdqcHA0OERwakpVdzNKakV2WENXUy9XNXlWeGR2amxZM2tEYTJ0?=
 =?utf-8?B?L0pWVUZNc1FKNUd6UE1xVTFjRDBVRFMxMWVZeGxCai9TZFROdUV2cEZiU3RI?=
 =?utf-8?B?bjZQNExpZHdEU3FpK0tsek0zN2lIcWd0VWtZNXVCMEpNRUpBNDlRaURaQmMy?=
 =?utf-8?B?akNMSGV4dXJkaldici8wUDdDRDNwK2J5anJNSlM0d3pmSHdMMmxqcWNvSURH?=
 =?utf-8?B?QUFpOWhVQ2ZiTE5kVndXNGw0czRLNTFXTWlXa3lDOGt1OHYrSDNXYk5VY2p4?=
 =?utf-8?B?YVlvU0wzZ0hmd0dYYlJWZ2pIRkJSTkh0Y1hMVnAzUmRpTkVOQXFoR0JUVG9O?=
 =?utf-8?B?QWVpTkdLTitqTmdJM3ZjLzBSbGRvYWcrWTZwYWhPUjB1T0tQZkRPQm00ZFph?=
 =?utf-8?B?cHg5WmU1UnRmTmlwWFNJYzd6WFRSWFVyMTBZM1IzbGpCRytLb1R5UER2cnpo?=
 =?utf-8?B?dzhlc2tqaHZrTEFoSEl4enl1aWVDOE4yRDZvcG9wOUIrNStUcEZpT1hncGdp?=
 =?utf-8?B?NmFCUjZOLzIrcGFicXdXRVdlTCtJbGh5MWc2blVPakZDcEFidnJNUWcvT01G?=
 =?utf-8?B?Q2FNNnppdXhrb2NGSXhhMzNhQldpaHc4SHhpVk5nSW9UMzZjakgwNm9UNHBF?=
 =?utf-8?B?U1l2UVJmUU9ZOGxTUDlHaWJ5dlg0SkhMRjkvcEZFblBvMlNRSklkbjdqaHNO?=
 =?utf-8?B?Rmg2TXdiRS91ck9lMklWVmlnMUx6RlRlbWo3NzBLRE1ua1ZlQ2ZDcmRMV1hR?=
 =?utf-8?B?d2ZRb3FSTkY1SFB4NmQ1WFlObzQ3NWppaWFpbnBJeC9yL2J5MVNaTlN3Nkxo?=
 =?utf-8?B?eVBWRVJTR2lVblowQUVQUk42NW43Mnovc0V2Y1I1U0kxQ0djd3BSVzV4V0tC?=
 =?utf-8?B?UVJ2MXowb0J6bHZwREdvM2p5a1lON0p4aldyakVvWFNPb3d4MzFpUXNjZGN6?=
 =?utf-8?B?RmgvWlNlRW9PUlUzMlhTZ243WnRsL2UvZHZIYzR6VE1GWDRBWUpiSjRJTDNN?=
 =?utf-8?B?clVoZTdmNzRDOHJtQzJ4Yy9EZU5Lb21WNE9mTW11ckdYNzI1Zkt5dmxZU3Jz?=
 =?utf-8?B?ZE5ZUm1hNDY0UEVjd3VkKzZETk1EYWFMcEoyclVpZlI4aGtlUCtpa1RYeEVs?=
 =?utf-8?B?NzZ0Sk9JVFY1eWpOR2ZyYUF0ZlNkN3FuNENaZ0hZVGY4NVk5a0ZpSkZPaVBz?=
 =?utf-8?B?ZXE2S2diSXdTS1VGMFdCV2ZrMzI5NGNUMkwyejFOMEtpNFJpVFFjb2JKckVR?=
 =?utf-8?B?R0g1aDE3QjFMMndqV0lwMXJZTkFiRXRWR2pCczJIRndHb3AyYVlCSmM3c0Ri?=
 =?utf-8?B?d0NEWEJ3czY3ZWxyYUQzOXpOVFIrWExhMVYybUVBeEt6R3BaTk8zcHpyWVVP?=
 =?utf-8?B?S1dEODdXMkVVbEZzc2pkNEl5dlNEQkJOR3h4YVhPb1YydjJMT0Rvd0RVQTNM?=
 =?utf-8?B?N2VCR1kxV1V3aTgyQllmNmhwSURSVkNlRjNQcGFWNGpNMjUweW41QnBuOFR4?=
 =?utf-8?B?TnIvMWN3dGtKUHd3VG1MckplUWJXbm1WdFVET0F6QTgyR2tHa1VGYVFHaEFY?=
 =?utf-8?B?cWRmMzJiUWhMNzVqNWwvU0xWR3YyTUo1RFNXdm5ubWlKOERKZDUvbHdmUnI3?=
 =?utf-8?Q?/uuSCBHb126t8difhrRgOK76V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5531f4-51ff-4974-fdf5-08dd6b3c368a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 01:27:31.5051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zid7ZbR/RKLhWdQ0Gqt1HZaRlRAEImol+ILkNtBaUm7y5a987W82I3imiHmsdIqrWZWwPd4QqObMFNR8YdABVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9021

On 3/22/2025 21:34, Luke Jones wrote:
> From: "Luke D. Jones" <luke@ljones.dev>
> 
> ASUS have fixed suspend issues arising from a flag not being cleared in
> the MCU FW in both the ROG Ally 1 and the ROG Ally X.
> 
> Implement a check and a warning to encourage users to update the FW to
> a minimum supported version.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/hid/hid-asus.c | 107 ++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 105 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 46e3e42f9eb5..599c836507ff 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -52,6 +52,10 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>   #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>   
> +#define ROG_ALLY_REPORT_SIZE 64
> +#define ROG_ALLY_X_MIN_MCU 313
> +#define ROG_ALLY_MIN_MCU 319
> +
>   #define SUPPORT_KBD_BACKLIGHT BIT(0)
>   
>   #define MAX_TOUCH_MAJOR 8
> @@ -84,6 +88,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define QUIRK_MEDION_E1239T		BIT(10)
>   #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>   #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> +#define QUIRK_ROG_ALLY_XPAD		BIT(13)
>   
>   #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>   						 QUIRK_NO_INIT_REPORTS | \
> @@ -534,9 +539,99 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
>   	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
>   }
>   
> +/*
> + * We don't care about any other part of the string except the version section.
> + * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
> + * The bytes "5a 05 03 31 00 1a 13" and possibly more come before the version
> + * string, and there may be additional bytes after the version string such as
> + * "75 00 74 00 65 00" or a postfix such as "_T01"
> + */
> +static int mcu_parse_version_string(const u8 *response, size_t response_size)
> +{
> +	const u8 *end = response + response_size;
> +	const u8 *p = response;
> +	int dots, err, version;
> +	char buf[4];
> +
> +	dots = 0;
> +	while (p < end && dots < 2) {
> +		if (*p++ == '.')
> +			dots++;
> +	}
> +
> +	if (dots != 2 || p >= end || (p + 3) >= end)
> +		return -EINVAL;
> +
> +	memcpy(buf, p, 3);
> +	buf[3] = '\0';
> +
> +	err = kstrtoint(buf, 10, &version);
> +	if (err || version < 0)
> +		return -EINVAL;
> +
> +	return version;
> +}
> +
> +static int mcu_request_version(struct hid_device *hdev)
> +{
> +	u8 *response __free(kfree) = kzalloc(ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
> +	const u8 request[] = { 0x5a, 0x05, 0x03, 0x31, 0x00, 0x20 };
> +	int ret;
> +
> +	if (!response)
> +		return -ENOMEM;
> +
> +	ret = asus_kbd_set_report(hdev, request, sizeof(request));
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = hid_hw_raw_request(hdev, FEATURE_REPORT_ID, response,
> +				ROG_ALLY_REPORT_SIZE, HID_FEATURE_REPORT,
> +				HID_REQ_GET_REPORT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = mcu_parse_version_string(response, ROG_ALLY_REPORT_SIZE);
> +	if (ret < 0) {
> +		pr_err("Failed to parse MCU version: %d\n", ret);
> +		print_hex_dump(KERN_ERR, "MCU: ", DUMP_PREFIX_NONE,
> +			      16, 1, response, ROG_ALLY_REPORT_SIZE, false);
> +	}
> +
> +	return ret;
> +}
> +
> +static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
> +{
> +	int min_version, version;
> +
> +	version = mcu_request_version(hdev);
> +	if (version < 0)
> +		return;
> +
> +	switch (idProduct) {
> +	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY:
> +		min_version = ROG_ALLY_MIN_MCU;
> +		break;
> +	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X:
> +		min_version = ROG_ALLY_X_MIN_MCU;
> +		break;
> +	default:
> +		min_version = 0;
> +	}
> +
> +	if (version < min_version) {
> +		hid_warn(hdev,
> +			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
> +			min_version);
> +	}
> +}
> +
>   static int asus_kbd_register_leds(struct hid_device *hdev)
>   {
>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> +	struct usb_interface *intf;
> +	struct usb_device *udev;
>   	unsigned char kbd_func;
>   	int ret;
>   
> @@ -560,6 +655,14 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>   			if (ret < 0)
>   				return ret;
>   		}
> +
> +		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> +			intf = to_usb_interface(hdev->dev.parent);
> +			udev = interface_to_usbdev(intf);
> +			validate_mcu_fw_version(hdev,
> +				le16_to_cpu(udev->descriptor.idProduct));
> +		}
> +
>   	} else {
>   		/* Initialize keyboard */
>   		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> @@ -1280,10 +1383,10 @@ static const struct hid_device_id asus_devices[] = {
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD},
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
>   	  QUIRK_ROG_CLAYMORE_II_KEYBOARD },


