Return-Path: <linux-input+bounces-10388-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AD2A4564D
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 08:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01EAB1891037
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 07:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFAB26A0A4;
	Wed, 26 Feb 2025 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a4/E51KP"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E6269AE6;
	Wed, 26 Feb 2025 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740553517; cv=fail; b=TAwqx0aZrHNfzVGtxsfDakFZXN58AulfhIdEzMysREFZlW0k00OqobYW+iMLRSRZHk6hWFsHzvTzJzBEN00lVbIlpHdUJ/iqeKeJTPOw5TJ489qXer0xPZZ2FEJHf7TdEsQCbPK/yigIl8aa/hquBA7BOS3l6Syb8Mt5dDuotxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740553517; c=relaxed/simple;
	bh=b7PBei3C/rFJEzs0smajdUo5t1Ttea0eqC8+0LtpPHI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bS9DtRnLEYnn/jdR+lxgHbWGkswZX+TltfH0tXXRe45UkdA5Z4DiXg5j0v67s9iA5tJc64DgcwdE53s/YXX54pFPrqFP6VsKCB/lUOR20MPVFRoTwNzw1mCwI5yqX7CFDU3D4PTg8aBT6s5uV6Qf8H1Tt5qbKrDihHVbaytSZn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a4/E51KP; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgvQ21D6/QHDYtctWNv5nybCbE1TooEPQ9RGjlPFOcHARERyMKMJ/IPcRj7UeSpXKQgMjSS3hrkZ9iHzGvFoLtbvGZtJSBYMo8Fx6AGQCxEz2AweuemQndRWTKvXsvyylhznGLr+hNCvu894VG7Cz4RQAhmSTP1eiTMI55efeUoY946K6F8Mp5Dz67IxGAT1FynJgDCdBwNeq28PBtjm39KJxGex2x4AqI6Z1mA2Cd8AeBsDJLZCj5bBgtSJ/aTQVrBt49HPCUQpHFUxC69EjQhlbnLC4wcXczo1c0AE1TS0qc3FfxR2po4BLLJ8Jw9tQNSoNKXlegI6uesxXW7Jpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BiCKljSJ4xXD/llQkxQ06xSSMxmTtxCvWgznE4EDc8=;
 b=Q6xTgUKEGjnm6i3XsQUjcmI762C9Oag+oGuJFZm9CXKu1WjPsbt08T54FlDSkwcpI3sIYyOhVI9aQOw7opyQHd4QpdLN2WEUeyOcbZ4/PB2RhMsIQ0eNgsz599PjswkRK9aah7qsa1RILKMomwqvAWuWkDEf7+2e08dqk2huH9nJtmrv6NZt43hDNNAM1yOUXbI+j27BjYa/naCGh/w2uLXF9fAWfEVtFMAZRnlEMzGkdl7VTV6Jz0E0SOL8nrCiJPGOnxUn5l/sCqQ/jjn9UtH4I2DaDvif+0Nq5GQ4+x7mbqzLggq0/hReyU3BEG3RjS3sIUtn7to9+jaipXz+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BiCKljSJ4xXD/llQkxQ06xSSMxmTtxCvWgznE4EDc8=;
 b=a4/E51KPaDDF4Bi/jmaLk+QfWGZx2tkaYZoRsK6ektYd5N2UUPTcVv0AZyisS2/f5XjVeMarlxFOiGvHYRZCIXCmEzsDJ/gnnlBqo7+0bmtErU6kNu0gxkh5dANjobMThfGUCwJkpKQq0oimAfhMebgaWZ40sTB8TllAe5Hg6YI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 07:05:12 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 07:05:12 +0000
Message-ID: <2b233149-030f-4440-a2d7-478415d73ec9@amd.com>
Date: Tue, 25 Feb 2025 23:05:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: asus-wmi: Refactor Ally
 suspend/resume
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org
References: <20250226010129.32043-1-luke@ljones.dev>
 <20250226010129.32043-3-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250226010129.32043-3-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: df66ffa1-b413-45c2-680d-08dd5633e9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmhTc0ptTUlNdGthL2lwaElJZElTYWhYSXJjenYxa1dyNHFPbThhdDFmUTh6?=
 =?utf-8?B?SDhWL21SVXFmcEMrQjJSbkYzMmxaT1FIWlgwbk9wUWpIV1NvQ3hKOHpBVVQr?=
 =?utf-8?B?SGE4NTNqazBrRHFmYzJZa1dyVVZnUHpBTjJ6c2lkemVJUllqZk1PS2wxVmZy?=
 =?utf-8?B?ODNJZlA0SFo0QU9hcURWWEJ1c2o0SXphbWtNc1F2ZThoRkRBL09lQmhUbnp5?=
 =?utf-8?B?OWZROWtnN1JKTldoMEJ6VW1zMDQ0by8raWlyYzVaRmtiV2tPdWhHMUsvd0Ro?=
 =?utf-8?B?RnZvUlZLVW5JNGk0VjdDTWdQaktVbXJPQmI5NFk5WGZTZnFFbHE4TUMvdFlO?=
 =?utf-8?B?ak5rQTBud3FuWUNGdDRXVDF0ZUhlUU4wcGY4WnhyVnFiZ2Iyck5DelJERGlm?=
 =?utf-8?B?Y01ENC92UzBxTURQUm1OT0J3d1drTXFkckw2eDlaZllka1hWcEVPV1A4UU1M?=
 =?utf-8?B?L2c3b2F2VmcyTFFQbndKcHBYRGdXdW00dXYrOThqRjBFVmZRL3I0T1ovVWw5?=
 =?utf-8?B?SklDckVSek14KzEvMjl3anl0TU5iWlNYNlJvNzlxUlkvMytpV0tUZEtubDhp?=
 =?utf-8?B?SzZISWZEajFHYjliRlBqQnN2amJ5YVlVeU8vc0hOemJBSmtGMnI2TktHNDBV?=
 =?utf-8?B?ei9CRmxyQTFaQW9GM2UxalNzVlFkbEU4UVpBeEJGd1prS2lOMWRjZG5jYnhk?=
 =?utf-8?B?aWNoQ1o0dUQ4NUZSVGhKdlBvbTRPRlhPVTFQMFpuU1ovRHk2Y0tzMjFESVF5?=
 =?utf-8?B?RVZJbUJaUlBQRW5wS1hFU0NrdERObU8vZU12bkRJUEJ1YWhwQko5YWFqd2tO?=
 =?utf-8?B?VldYRm1GcjFBSkt1NG9qT3kydkNDakNDeWlvenhzSEZmTUgxOTQweDY4Z2pu?=
 =?utf-8?B?aGtPeVp3YmY0dEZpb0RaQnEwM3JQRlp1T2FBUUdtR3Z2NlJrVTRBalJ4bEZG?=
 =?utf-8?B?TXNSNHI3cmREL21YZDFTdWtGR0tvbFlpNFpxUGttV04zbkNhK3JDQW5XdGNk?=
 =?utf-8?B?T3NIdWFCb2hXN0RETWRtSzlYNDk2bUl4VzJiM2ZMazBVNStoUDlqWXdrOU9Q?=
 =?utf-8?B?OXdjWTNuRDRBYk9QZ0tVTGhJcWZ0Qk1zYkl2Wm1OaHQ3bEkwVFQrd2lBNkdP?=
 =?utf-8?B?MlVrbFZQRG9nNVVaL0RuUzkxQUFveHVIYjU5ZGVteWh1c3pISzlJQjQ5MVdh?=
 =?utf-8?B?cnVvK3NnRTYxMjNrNXhPTnMrS2JuWmxLbEhBS3VEYlY3L0N0RjY0TktzZjFJ?=
 =?utf-8?B?ck9adVdzRkk2TERxUE13WUN1QXYvdzE4c0kvU0J0TWtPbmVQT2RsK2FPcU82?=
 =?utf-8?B?a01EckluZk9aZzZzMkE3UXE1cmRsTml1NGR1WHM2Tmx1aHZFMndiaHAwODdL?=
 =?utf-8?B?K0NlQ2ZMVTZWN3VYazRLS2ZudWxGa2NsMzdxYkRDZW1QUzk2eVREanNzVFBZ?=
 =?utf-8?B?anpjRU9GNzZsdHVjODZUdzVGMVZ6Mm8xMTF5RUVxZXE3WnVzM2ExZENRTGFQ?=
 =?utf-8?B?d0dYMnJRcXhFMytGMVhzUmQ5R25jM0NhWDVOaEJiaEFYMnRjWTZkNXlxUW9p?=
 =?utf-8?B?QXpFdDlFUFpZdTJ5TEo2U2VkaURxQVFiVVJxQTNSeGJNcjV6K3lKQkFJWWJV?=
 =?utf-8?B?anYwMGQ0ZnllU2pJM1JreWZPbGdiWXY2UnhNczhxd0VlZkV2b1VTbkNucGl2?=
 =?utf-8?B?MjVFb0NIZ053ZmVxNHNvdEtsZ2tJRmZXL0dMUk5TVWRobFh0SmhvM0xTUW9Z?=
 =?utf-8?B?TElTWmVheHN2YnF5NGRIakhSL2M4T2wxMU1JU0xNTUozSEJzdWZoa0N0dDBQ?=
 =?utf-8?B?ODZIZ0NXL0dVcTh0MXBXZzZSSjlSeFB4ME5RU21iazRtMmZMbjhMYXVyZEJJ?=
 =?utf-8?Q?NunPHeAR124WF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MC9ZcFJyTVZOZnBDU2piZTJlMVE5dzVwYXJiUytEUzQzbjRsWnF1OTB4b2dl?=
 =?utf-8?B?aW5BQjNMZzJ4Q0QyT0ZaUU5mTHJZUkxSQUcyNThzK3orUndvZzVBdUxnd1cw?=
 =?utf-8?B?RjVHemxhdHpyd0IrN3NsM0NRNTZRalZoTVpiM0w1M2tWRXJMb0o4RlJkZnZ3?=
 =?utf-8?B?Z1ZvbHJ2aXV2QWxBVnQvVGxiZHV1ak5vOE9BUm9qZXpKZUN3RkVlQ0dWOHF2?=
 =?utf-8?B?ZzB4Y2N0aXl1SytzazZNNkoyd2xZdHdHN1dzMFBDSlNiR0ZKL1lzcXFxZk5R?=
 =?utf-8?B?WkQ4NUhKYXgrVzFVNnBuQ2tSaVFFbGZ0WVFwNDdEVXNXdDNlai92em54SXZD?=
 =?utf-8?B?VGNrNDFYbm1kUTJONVRCcXRoWkFZdHNQeHc5ZzhFSElQM1BJK2pTbVN1bmV5?=
 =?utf-8?B?SFZPRCtBdm95YlhDUnNPZUl5eUFWQ2RMa3dxaFZ6TmZ3dGlVY1ArWHQ1aDRm?=
 =?utf-8?B?amtRT1NCaW5ZWWJEdTk2MmFXVkxwNEJUQUQxaUVMVm1WSGljTkd5WTJBRTNG?=
 =?utf-8?B?cyt3MUZsVVcxWUFwSmR1UlZKQXBueEtxQ3ZPbkhzVUc3cDdWQk1nNHRxckk2?=
 =?utf-8?B?YWhTcEd2NVJseWV4em9FSnNUWEtsbGVIQ1FiemhHTDd1WjdtaW1sMW8rNjdR?=
 =?utf-8?B?QmkxV1JyeXRCdlY2V3BCVC9IWlduR2h1Ym9FY3dma1JLZnpKakx3bUlNUGEz?=
 =?utf-8?B?RURlRmdIdVlibGUvYWoxVEpuZ2JoVGVwc2duN1NvdFhLekFtdTRwUjgwUDZq?=
 =?utf-8?B?dHI2Y0pjRUh6b3l6cDA5TGluYTloSzM3cUR0Ym96ZjRiaTlNT0NRK1ZFSE5T?=
 =?utf-8?B?OVpWQW52b1VXMEN5TTBKOTl0emZMKzdDYlR6RHJjdFlXTTNXc3BvbmkwaW1E?=
 =?utf-8?B?UmtCbTRUQjhhQlVGZm1ENXpPWUlpRUUrU2JvUUluNHJDVVg0WkEzOXZDaWZJ?=
 =?utf-8?B?R2t1emNqWTFpVkVZQXZxOUJodUJNR2RNS3NWbFlVdmE2ODhMMWtRazF2MU1k?=
 =?utf-8?B?OTZlcGR5SllWeDRVOE1Fck5wK2dpd0pyUEttbzB2Q2ZzR2dnTkcyb0VJb1lq?=
 =?utf-8?B?TEdYMlV4ckU3WU1HaE52S3VrQThhdXNwUVJ2MlJ4VnYxRW9BSnRJS3RkeWxr?=
 =?utf-8?B?K3ljQ3Focm0rUjFCbXI3dm1KajljOWtCcUlzNk9oVzJMR3R5RFkvbStIZDc4?=
 =?utf-8?B?UHppdDd2YSt5QXMwWklWSjBEMTJJUUJVbmEyUmJKWjF4YlRqdWt4bUoxN3gz?=
 =?utf-8?B?dEZrMTN5WVRQWVRuekU1T0s5TXJLdWg2NTVFUU1udUc2c2hTVU9YK2YrNzhB?=
 =?utf-8?B?NVFMYzB1SXFwbVRuSHRGUS81WnZZOEFNY3hONEdKNW82UTNoamFWTDhQR0k4?=
 =?utf-8?B?WSsxb0pvZ1FIUktsT0c1UW1yei8xTUxYT2xWeFl4cVJ5Mmd3N0VpUXJKY0Rq?=
 =?utf-8?B?M0g3TzIyQjNNcmpKOXJOcXQwczZtZmZmakZybHlySC9OY2N0OHJ1cFNXNklW?=
 =?utf-8?B?ZmlUZEZkTGdMc3NCQXgyUjNMUTdoUjBwWkNjZjJudFlqcVY1RmNJalRLODJC?=
 =?utf-8?B?Unc4d3lzcFJPSWVvV0ZpS1RNRkUvNStTOG5SQ0hoMDlkcW9lNEJOUVVnczFk?=
 =?utf-8?B?b0tmWWk5RVVFWEFQaXVaUXlKMXF0OVYzN1R0V0JKT1NlaWZ2ekszWk1GQ2Yr?=
 =?utf-8?B?eElCS3lpektyVFlBc0lycjhmOE1IM1pwb0ZoZUdFUWwrc0cxSUNNRCtjZ0dW?=
 =?utf-8?B?WmhGeGoyQW1wSVJISlZPZGcwVDNXTGMyZzErVGxvSFhCLzJOZ1NjU0lPYzhY?=
 =?utf-8?B?NVZMY0wrSCtSa2dkOFVyaXBROEhKcFpIb1B6OUdJNWdjVDNteHNYUWpKVVgv?=
 =?utf-8?B?cU03SDBTSmNYLzlLL1I4MVZYd2xPYjdFUy9vSnlOZTJhQ05SOTUrODNUelJO?=
 =?utf-8?B?WkNnWitzR05UMGlkNTFSVWFIcjl6MjhPalIvaHZYc3JYYWsvWHZNd0R2VHNN?=
 =?utf-8?B?cjc1Y0dzNTJ1MWVpTW8vZWFGQXJVS1lPcEdUbUVDdnFtQ2dLTDArTFE3aElu?=
 =?utf-8?B?S04reUhnd21KNjdrNkhoMU9GRmx6Mmo4eVdtUm5zNGJBdkpmanM0K1JmcmFl?=
 =?utf-8?Q?y/BCXaAlzEAiGLR768W7IvsSR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df66ffa1-b413-45c2-680d-08dd5633e9ae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 07:05:12.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qgAlZZwbseCGiHO/qlQEEGnG6DaYWLFgzGw01p+JvMENCtRsm43vIwqMjhtrMUIRWs0R/clYHIj+ZCjcQNXug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283

On 2/25/2025 17:01, Luke Jones wrote:
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
> index 3cec622b6e68..c6b94f3d0fd9 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -620,6 +620,9 @@ static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
>   		hid_warn(hdev,
>   			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
>   			min_version);
> +	} else {
> +		set_ally_mcu_hack(false);
> +		set_ally_mcu_powersave(true);
>   	}
>   }
>   
> @@ -1426,4 +1429,5 @@ static struct hid_driver asus_driver = {
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

Shouldn't this message change when set_ally_mcu_hack() is called with 
different values?  Also is pr_info() the right level?  Or should be this 
be pr_debug()?

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

Don't you want to add some return statements for these two blocks? 
Otherwise you're goign to have pr_warn() saying it didn't work followed 
by pr_info() saying it did leading to confusion.

> +
> +	pr_info("Set mcu_powersave to enabled");

This is a bit noisy, no?  Is this better for pr_debug()?

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


