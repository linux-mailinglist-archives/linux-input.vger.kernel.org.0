Return-Path: <linux-input+bounces-11054-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD8A6C0FA
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 18:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B50E81741F8
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 17:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A700C22D792;
	Fri, 21 Mar 2025 17:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EEByzqBN"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64901D6DC8;
	Fri, 21 Mar 2025 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577059; cv=fail; b=Qk4FuFS53Z4X593qlBUrA/fcw8XUet1CrRMhbKdNlJPQRzNGLxehxwPykbC/VOZO2CxG1VB3IHlg6u7VIPD8bNiZnxC5qFeTHs5rBP2yPneAVUpLyNHFW8/cq9foDP2jJnIim6eJ+pH3k47rnfrQwJTR+q8Djx7zgt8DuTMi8h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577059; c=relaxed/simple;
	bh=ISwNHPIbOvbvxqSENq+3CmnHDmfDTk0UinKlC/jb7gY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wx7j9X2xuMuY0pIQD76ttkpOkC6CKBAjKyThny30DCeDBKG0oXDibvzpyrdjFeBvSbb+OjlHNKijFhHRNDmxNTeBU1BgMfZau1lmgbXFlevLkomE2OY8Zag5Xwnk364n2Tjsdzd1iV52kwzzgdx3XI2k55qF6T7OHx3Fb2I896I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EEByzqBN; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRiaeraGe8kkmV2LWtZfBFIo6k7vlhm9y4V1O+RBAfyXiMBImYM1GNK9x2nT/zsbUP/SY/dt7A8kAmdeMnahCpwh2P9+nxnqAk+nWp5RRHEc1j8f+moYipllgnfKt4zYlB2ObloQoT4lJzGLrnn+ErTlgHGSrcC8IbJSMl10kmtd3cMaltfpratVUdUeSjlFR46SW328zG5IbcpnsQN5uPSm4Ci1AgIHUJtbu1S9HMp7m4nQVXGMcxSHbkQBZv+AW3uaGTZ6sYfPn7sipz65amfpln18iMend5Hp3IsKLR6/hE+JQgCaj/K4mPugQ9xi002UMXFs8yCH8gNY2lHd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlJjDtdhh9arbFZKX2iUxYlGD/7WM+qgwIm7ANdSqWE=;
 b=hoA93DayAfWXwIghOfyC75ZPfz+UNWDLfu5VOhZlPllAE0+DCNRvBFE7pXMhzijapG0VVru9bkz6QelhSjLt9BSh3ulEqChjPFc9Xqs8yM+o7NGR91TOD1rgyVAEd14aJXTehzGRuUuR0zkNZ50gJbGV+wDtv/EUMevvmXAA8P+rDL5GnYFLm8R3g6gPJTILXTFH4RZOW7+C/aSK62lms3kOx+WdahpeIsUiAOkgyhen7BNnBVhQ0kmO15GWg8sYJnmQFRWmPfxv7pfLr2YRAbs4fQ0vLDho+puVxgAoxXYkhJmmIdhnRSjoDsuzzkQKrWFjB/uRcMXCu8xWMDtGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlJjDtdhh9arbFZKX2iUxYlGD/7WM+qgwIm7ANdSqWE=;
 b=EEByzqBN4qitauDB4TeKlemreEMb5v8+vGUJZsEXMs7pRQ3eMzKGvjeLkzMBxHkaBRFz9CyYYNkW+H5hl+8ywapDuadJ+b5eokrhgJSb/Ip9kGqh/NioCi0URXba8zle1DyWJS2IE1CzjZyjC6JCFkt/3kJGjMww3fvb+Q0IkHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB5662.namprd12.prod.outlook.com (2603:10b6:a03:429::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Fri, 21 Mar
 2025 17:10:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 17:10:51 +0000
Message-ID: <1da04bc6-a916-43dc-b46a-4485b90ffe6c@amd.com>
Date: Fri, 21 Mar 2025 12:10:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] hid-asus: check ROG Ally MCU version and warn
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org, lkml@antheas.dev
References: <20250321035106.26752-1-luke@ljones.dev>
 <20250321035106.26752-2-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250321035106.26752-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:806:127::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8d0269-eb3c-42cf-cfa2-08dd689b54f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmJXYnVvdXR0SldnUHRiL2dsMnlVV2VuZGRxK1U1Q0xLdW5wMi9Jdi9MK3cw?=
 =?utf-8?B?TVorQkVnSEp1QmQ3S3QzWm52NEhHUXdNdEdHajBkMFhqRER3YXI2YWY3QXJX?=
 =?utf-8?B?dzk0MHlSZml4d01IOGFuWjhyK1lEcGdrZkxUWWRybFlIR2NhRVZMNFEyK3N1?=
 =?utf-8?B?NW5aOEFpYS9XcHNyREFoYUdGVXllM2s2VFo4bkVadTFsbXBLSXlnaDAyMnhv?=
 =?utf-8?B?TUpCc2JyZ2ZFdjJWLzF6bmU3N3JEOEkySTQ1c0FqSlFLQmN1MkJNNkhVQ3Av?=
 =?utf-8?B?NFlvcUszYkRQeE5HaDM1cmVMKzFFUmFNMTQxbHNwQ3Z4VVYrZkI5M1p4N1c3?=
 =?utf-8?B?bVBBNnlFQkFxZXd2a2t2QlNhY01SL2VHUWczVlllaVo1ekRkVDUxWkRzYjdV?=
 =?utf-8?B?cFhJUjc5djExSlUvQ1lGcC9oQllCQTNVa0s4MGN6ZkVtVjRHc0x1YTZBaW52?=
 =?utf-8?B?SGtnK21zdEh1OERRdXg4ZFU1TU5kWENVbjNTWGg5MzZSY2lIbm5nVXhsTnR5?=
 =?utf-8?B?ZWZhODQrVDNhRVIvMEs4ZWFyVkEzaWJTZnZ1MllHM0Z5ekJYVVVneElyUUR2?=
 =?utf-8?B?RjgweEM4dGk1WDVQUUcxU1hBRDdvWUx5Y3BFS0FVMlduTlBJN2lNejN6U1Za?=
 =?utf-8?B?L1JHNXpTUzJ0a3h5c2xkdTVzSVE0L0tGL1pISGljS0tBOW8wS21aazZUTUNx?=
 =?utf-8?B?dVdveTdqTU9WSFljRnlZRWVoNWxlSnNWajhVeDc2bkRYQUFBUkQ5SzRWaVZE?=
 =?utf-8?B?Q0V3b3hOTlVxQmZRVFcybjhFK3JEaUQ5RGZONEpDbWRFVjRGK0NjQVVTQVNO?=
 =?utf-8?B?Qm5YY0VXaExjRDFFakR1SE4xYnlxQ3JSNDFycWRMU2swdjR1aXRZUlRlbndl?=
 =?utf-8?B?cTF0QThqUkVpU0RUZys5YlJJem14MW1pL2sxdFc1eGRsbnV0UDlRMlFMV0dM?=
 =?utf-8?B?Y3hhemZkVFBlMGMzWFcwMjZCRGp5aWNPckZNV3lmNXhhdThwQnBaK2YxQTAz?=
 =?utf-8?B?TjVjOTZ0MndOalNSNzJUK2JjN0VGQ3pNZzdBVk9MSGo4ZzJvUlZKK0dEMGV0?=
 =?utf-8?B?WEJvZnJraFcvdVhGVWQweFpBTlQ1MjVmNld6MWd2b0w3eWZ4OTMvOXBrNWRR?=
 =?utf-8?B?VlpsalZKYktSUDA4L0NHbUU4WVZKUVJETDFxUWgvK2JOQlJ1MkFOUDBoOWtv?=
 =?utf-8?B?dkRvN3I4OVRHUjhsTW9jT2ZHajg1czk4ZHBJNm04L1MxVzhSMkRwaklhVHF4?=
 =?utf-8?B?ZzFhYi8xeXZSM2d3bXpjdnRIRkhKMTRNam1DVjR2emdlbzB0UTZxTWw0MElS?=
 =?utf-8?B?Y3NkcXB6bWZCTm5hYkZkdkZieGprcXdCYUgvb1VIY0s2eW1tdEptNVM3OCtS?=
 =?utf-8?B?c2NvMHIwWjZ0ZGxUdXpUci9lbFIrL0twS3d4S21aM20zVlM4OVVNSUlGYXhP?=
 =?utf-8?B?bW5HbkJ1M1RLZWsrZnJ3dXIrSUVQWW9FbG43Q1JzbDF2UlI3L0gvc21DS0FX?=
 =?utf-8?B?TUVZTzI1Vm5lck1iTFJ6Q0ZKcEVwSzVBYlRxa3VoTDNqa0pUYmh4MWk1S3d2?=
 =?utf-8?B?OS9hY0dRTy9LeVNlWGdHOWE0M2dIOGFOWDFIRDdIU3U2Q0tXb0wybUxDQTgv?=
 =?utf-8?B?QTdwRkdYeTdJNEZ2M2U3UENJTDdzSHRRZjNyZm5MWXJnNkhIclEwQ2NOT0Zt?=
 =?utf-8?B?SjZlektaNzBVelhPOUdNOUVXcFR5VzlMYWEvUWRWSWxySmF1YmlsS0huUVdu?=
 =?utf-8?B?dUpsSTZSc29mNzRmQ1dhV3JHNlhzN3JxZHJBY2xodVFOTWxhV1d3Nmt0Rmcr?=
 =?utf-8?B?Q2RDL08xNEpJbUg2M3NxVnlsUGxvY0locVJEZ052TGN2Z2ZkakVMdG95RDYy?=
 =?utf-8?Q?NlECE2yqip57u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dndyMVJtdWN5WDllbE94QUhuSGMrWkhIWDQvTnZ6QjB2M0M4dGNPTThwS3p3?=
 =?utf-8?B?QXE2UkgyZmV0a1FqZDl1RGc2TlVIWGRvUFdBWkZod0M3UzcxWmtnR1BlOUxa?=
 =?utf-8?B?OHpSc2c4K1dET0xUZ3FSclp2eEN1amNzaTJXL3BCbVprb3VXQmVpNE5Yb1ov?=
 =?utf-8?B?UWxvc2dpY0JRMWk1UUtyVE81MTB2Sm50S3Y0Sk9kWlFObVQ5S3MzSDlMQzIy?=
 =?utf-8?B?Skc2b0lQeStIY0IrNlZPcURPWXFMNDIyOHVINEwzU0MyeTNwdmhJZElvRzhN?=
 =?utf-8?B?NFkrVHNHdWhENTVTVUpqSi9pVnA1QzNVS21xNkpwa1VCUkFxOXFjdzY5TzNh?=
 =?utf-8?B?ck9JZytJaEdiVk9MWHVZWUdoZ1dtUHVTOVdzUnFtMTZ2NTVDM0h2UVRGQWVK?=
 =?utf-8?B?VzF0SzNGUTNwZGJuYnRkaS83cHRCMUFLbWFmczhkL0NWOVF6dnhUU21nVFNG?=
 =?utf-8?B?TVEycDJ3WXVLK0ttL3FCb25pUjFNaXBJL1ZGLzZMM3c2VzYxTlVjMGp5M05D?=
 =?utf-8?B?SmF1eXYxek5nQjlWMjVkU3NGNlM0eE40RDBlR2ttS1BsOHA1bEE3ak1MbjN1?=
 =?utf-8?B?WjYrdGlHb0Jhd3ErVFV0bmE4Z3J0bEVxRlNkMlc0UzgwVG1MaFhTZFlTbDJi?=
 =?utf-8?B?SmlPSE82M3MyR0ZQcUpoTkxreHZ4TlV2Smx4UHR6R0dua3ZRL3doY2xjcmV1?=
 =?utf-8?B?bG1OVmJtVVBVcEZtRFBpTnZ1U3VRblp1VHhPUStmejhTMWRwQmhiMk53amlV?=
 =?utf-8?B?cjVFbkw4SU1rVlFvMGV4cHI5Q3RMOEVRMDd4RS9YTEVhOEt3a0JpS3dnZFJ1?=
 =?utf-8?B?anZVMFJaRllRYnFaYUJuUzl4em5UaEpuTldBSmJiMUtBL1VCQTFiSW5RZ1Fh?=
 =?utf-8?B?Y3NBV2E0cVI3bVFOQ0FBSVNnNTJsQjRyS3VOam5Nb0o3b2pJaW1QZXBNOHJa?=
 =?utf-8?B?Y3RDZnJRTndIMnJVblRpV05LaGNnZjRkL2w3U1E4bWpGOUMxMUJKbndBdytk?=
 =?utf-8?B?bVJXeVlTeUVDY0pnMFR6U1g3NWFFMGRTZmU1TitKOG9LdStpQmh6ZWkvU3k3?=
 =?utf-8?B?VmEvMUQ1Z2l3cXp3WjcyRGFPR3E3azlCSWxNeUNpTVVBLzFIanIwSVpkZXdj?=
 =?utf-8?B?Qng2QnVzMDhTUEJsZ1U4dE8zVkprRGxnK1ZHOXVBR2Z6bGhieCtuQjFFcWNC?=
 =?utf-8?B?VVN6WDVEL1VJNENSOWw3aEpGdU1XSjlaaHRDMWl6Y05pditjcXZyWGN6WUJk?=
 =?utf-8?B?aTB3cWhtMGZwdllaWm1RWXFTbFpiZ2dEemN4NGRqQTVQRWZydnBNbDBsNHFO?=
 =?utf-8?B?ZXFWeUh2YndyM0xpenFCeVBXZmRoK1I4dzVMKzdsWHlWL1MwQ3lIRy9aajI0?=
 =?utf-8?B?dGZBckgrNkQzVFBHNDVmeWExT3NKbC91M2gyUzdiMFZmeUZsWkdRRGYwZmxm?=
 =?utf-8?B?WkFVcW5iMFg4aWF2b1pNTnp2cjZOU1EzaE5tT1VEenlJckJya3Qvbjl2bWgr?=
 =?utf-8?B?aHRLY2c0NHRyaDlNeFV2amxzZndwM0RRTXZGNy8rMVJrOHZiQnExV2RDeDBk?=
 =?utf-8?B?QnRRc01KWUdhRnIyZkdBYzJuUHhLKzhDYVgyajZCVmNFcDQ4UXhXMFlpeVk2?=
 =?utf-8?B?aWtrTlBCSGxVcFNOS2dPTzRCSlcxc1puRDd1ZjhaRHlMSzUzSlF5cDh2WUpJ?=
 =?utf-8?B?R1dOVTNVRHhQQ0JoZ2RJOW5IQUdJaThrUldLUzdDRG40bVJJRllNd3NheWlY?=
 =?utf-8?B?UUN5VWI5YzYvMUVJVSt5cENhTHF5ZFRWWVJSMlJoS0xncTN2dnVzSy9mLzM0?=
 =?utf-8?B?eVVPb3hrT2I5NmhqZzhwWDZDUHNZVCtmYytWVWR0Q29INmtqQzlCVWFUaDht?=
 =?utf-8?B?TFd6NHNXMW16UXhSRUt6dklnd3NmUFo0ai9qZVB6YjNRcVpDNExwMm9vaTN0?=
 =?utf-8?B?RzdxdTZsUXlrK0ZBbkpTaXlHV01KUWhnMWJjZVd0L1E5T1hnQTBwelJzbDVm?=
 =?utf-8?B?ZmFoUSsxT3cwQlpuTHYzQktiWDV1bTJ3ZTRpUnUwZ3pPdDMyMmZKVlhLTGtr?=
 =?utf-8?B?c25uUjFBM0tpY0cwdVNSRW92Ukc4NEFGaGNIR1ZXdHFpazcvb05oYTBUM1Jj?=
 =?utf-8?Q?ZYqWOlmxwQwVWPKKuoEcAPaj5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8d0269-eb3c-42cf-cfa2-08dd689b54f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 17:10:51.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQbnmadsEvG52x9iSg0rNAIVMmfUD8pP9wD3Z0HygBcEqpSGOsE+Bq6F0TZ+zx664UZiqh92a4kfsMYGwL1bFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5662

On 3/20/2025 22:51, Luke Jones wrote:
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


