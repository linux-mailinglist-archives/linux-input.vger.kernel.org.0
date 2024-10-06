Return-Path: <linux-input+bounces-7105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA72C991E42
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 14:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9645EB2092F
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 12:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21BC173355;
	Sun,  6 Oct 2024 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G2KajWk8"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449F54F95
	for <linux-input@vger.kernel.org>; Sun,  6 Oct 2024 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728218427; cv=fail; b=hjZ61OWe2UuWTix0tggBdg5qpiQPdQQ59I3NNXVwXL7DdcBn/3/SNQ1TcpSM7Bhir2ro3AGTOYTlznME4HK4waaqIVhYN92vUGJs1o/Dr14Kv7kmN9yaHu39uFEj1M8qvmGjM1YC6AacaQdAFH7ph/DmKIhMelg3iJD0vieWstA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728218427; c=relaxed/simple;
	bh=wHgz/e+nADWyLCloyGFK+9tBDzs7n5jXCeIMTi3eIC8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KE7FyiQ9QJNUm6RRaQpAPX4DOcwUheGXSbdK21yICun9to0QLPN6eiEGEaJp/tbwluTlWAg97Dwd4XeKCZDS+FqkAuAbg15iANNianYvLmpUYxRFdbM5byKP4oeXsncXlFrU8s9ZTflAN9GmBpZysCUZGToB5SCvrJSc0msoHr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G2KajWk8; arc=fail smtp.client-ip=40.107.220.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hsbx78HLIu9UjQMsxYPS+uZ3a27JKCmHgC1rrjvzrWHx6ZDoR13uFqoqTx6WEGY1CFuCYsrjwlUe8EAniHT6XYciVTHI/tA3z+Didks+WSMT8s5qk7s2nGHaqYCNLQz+DOhuhfEH1Xu9YlBod7mRQXeCshlLkdo5HdVRLE56Gu5p7ri+yz9IdKR2tpfks/FmAMtnLdE4PQHHsynP6kNRcNq4AQZ2MptOo2dS1Ggnx4+/voG8WwUbs/4z/+1MqG264b5kT9GYVb+ApX0vLjENVg9YhMB/g4EC74cI8Vudjyk9XHKLRIfhDWsf6BNBIPSumtKdj7dNMM4/QcQ+4gIliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJumcfFRewvORL8YnitBTma7KXhj+lfyGu1egkvLTUA=;
 b=WEk0EuwgcnfmvzzhDww9wo5sTTQ3s+DETi4Xcw02yls6FlkqfRXfYvl/bKBDbbPJjeCuNqqlOA+x/gyLZB7t1F663drZHKW19ysytU/2uv3ZSkcNJ3djeXNWEtbaNEWLpVdEkg2SXLhAFq73LeyJODRXvfdOmDBEAm/3BI8r62mGyQ4bgfg5I5GkddsOw/rAfFlehc2ko5Y6fwh9rQGpvx2tP3Lzdqij9m1r3bk05GYx4w3P0M0B/jGihrdbRPIBFrWWHzcIGWSjiAg3/RTO0s/nyMx+YKfG+gpsg5qeQuekcTEZVvpLy4m5rPs6zfL1g0w0T+whVm9uaRw/Yc+kjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJumcfFRewvORL8YnitBTma7KXhj+lfyGu1egkvLTUA=;
 b=G2KajWk8v6piGpZa8Z7m2Ft9qAYPV1/HwHkposmcLrAaEeR4vd9QlLsCDxiWywPS6OGH01Oo4DbAp9wbFJn/XWY6fVGd0ORN76ghb0CFY82K7sAxMG/hw03bv68Ox67gN4wj/p0qtuLJbxDid/TNljo6LrRSDHhrO3d/ElDM+Ak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by IA0PR12MB8983.namprd12.prod.outlook.com (2603:10b6:208:490::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sun, 6 Oct
 2024 12:40:22 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%6]) with mapi id 15.20.8026.020; Sun, 6 Oct 2024
 12:40:22 +0000
Message-ID: <763d1d87-754a-3e2b-f8c1-74e4fb4a18e5@amd.com>
Date: Sun, 6 Oct 2024 18:10:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] HID: amd_sfh: Return immediately if no sensor is found
To: Benjamin Tissoires <bentiss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, jikos@kernel.org,
 linux-input@vger.kernel.org, Chris Hixon <linux-kernel-bugs@hixontech.com>,
 Skyler <skpu@pm.me>, Richard <hobbes1069@gmail.com>
References: <20241003160454.3017229-1-Basavaraj.Natikar@amd.com>
 <a3fb27a2-5167-4880-9102-eaf0f47df398@leemhuis.info>
 <uupvw2jw6j5wkwtfwljipmpx4kynv6k3wqgy6sg3crw5r27rtm@mudhwifihmtw>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <uupvw2jw6j5wkwtfwljipmpx4kynv6k3wqgy6sg3crw5r27rtm@mudhwifihmtw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::28) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|IA0PR12MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cb23d5-0c6b-4626-c11c-08dce6040af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0NSYkVubDg0SnZyWVdSckR1U1BkZDVjcGk5dEdrd2Z6SWc1dUV6bnUxZlVr?=
 =?utf-8?B?b0x3SWVqNS95M0NyVUFpdnczdHg4VlYwZ0pvODZwcytpUHpralZmcGQxUGdM?=
 =?utf-8?B?RVcvdlFOZU91OGxtTVdsbkNMaEtNb1BnYU9iZ1BmYitZajBNakxvaWRRdXQ4?=
 =?utf-8?B?eEhhdDRZcW5lWEdoTFRZNzd5bDRjb01LcDBmSjlOUml0b1pLM1UyWDNqazI3?=
 =?utf-8?B?VWYza3J2bnlKWEcvaFdubzREVlU4N09uemhCdHd6OE9RRUdTNWhaNE5XaENR?=
 =?utf-8?B?TUI5ZUt2VlJLZXpUVElqTjVKQnc2OFJUNStkdWY4dDd1MmhyMmx5Q0lvMG9k?=
 =?utf-8?B?RUhzZFNEd2I0WTNWNVI2dS9uRlZYa25YNHFPNkszSUJuVzdpN0pxYXFiOUZu?=
 =?utf-8?B?YTE2dTFmUWcrM2NwZVM2M3JKMXFLbVgvandyNFpvK2MyWlJaZDNFMXBsRkVY?=
 =?utf-8?B?bi9JcmpXZFVIaS9YTHg4ZVNsVmd5dWNkaDVtWnJ6TXpZSmhFUTdpSFNZRFZW?=
 =?utf-8?B?d2RhVDBXRFQxOG9kUmtQeFBiTHpjdldpWnB2MTFBaXJRcVZlYUV3M2xYYWJ2?=
 =?utf-8?B?TnZDSFE4YTd4Z2NzYjlsamdLL1NqUkJLNGExbG5VcVZpT3JZUEh1ZEhOazlT?=
 =?utf-8?B?Vzc3T2tYQ211RFBWRGZibWwxdG12VzB3eU5wTEtnZkY2OGM4NXhBNm5uenBa?=
 =?utf-8?B?Z3RCMzNtQzgvamwxOUFIUmdMOG5JTU1jVGV1ZDIxWUg0aU5ZWHZKSjRIdzdJ?=
 =?utf-8?B?Zy9nT25ic2M5UnRIME85ZFFYTGtDRktHR0pWZndRREtzS3ZFOTNhWm9RQ1Mw?=
 =?utf-8?B?a3UrcGpzVDByUWRxeHg4bzRjenlwaEptUFBaQ1BObTJnS1NNaXN3WHhoRkV5?=
 =?utf-8?B?M3JJM2dzNDRKNFdvZWFEN0dBK2lJcHVFeXRkaTE3NCtHS3FGb0NuQUJocEdF?=
 =?utf-8?B?WjFQcWFkcTN5bmdKeFJLYVJkdjkxaFp1OUJIZXgwdFRMSFBqQkl6VlR0V0Qw?=
 =?utf-8?B?aUo4UTFqczJ5TmNQSE1hY3AzcTlVYVA0SnNtdnFJalo5UFhjakpDQ21nSEdu?=
 =?utf-8?B?RTVQRUJ0YU5GdE03WUp1cFF3K09RdldJZ2pWS0RtTFNlM3NRODFTYjNZZjBW?=
 =?utf-8?B?bXNsVnZCd2pTdUkzcEVGbnNPcExQUEwwSytzY0tLU2EyRzlZNzZIczFNN1BX?=
 =?utf-8?B?dzV5NzQwMzgvQ1ZZcFV5TWEwZnlFWXl5d2JweXhZNlk3UUszQVlMMnQzRnFY?=
 =?utf-8?B?V0xQUjZvdUx5d09CN1V1VXB5VWtrZVBoL1dkWC9Hb0R4UnNPcnd1SHh0K0JG?=
 =?utf-8?B?YW1ROU1LcUwyZGh5Y1BMOEFUU1VkWFJ3VkxNN0lEd0NwcDRIOTJDZ1ovNWdU?=
 =?utf-8?B?Q0lnQkJPRDN3ZXJHeG5IU1BNNkM3dHN4YkEwT05aMCs2RW1TS1VHTGM2MC9H?=
 =?utf-8?B?aUE1K2tWOHc5SGRwVjRpdDJhT0pGd0pyaG5hM2JUVzVZTVk5a2M0N21PY1VK?=
 =?utf-8?B?VDhkR1lCaUhJM2VrT3l0YVhaTFlJa2NNQUJpeXRIMkFLVUhyUWRZSlh4Y2dR?=
 =?utf-8?B?bENqSEtMb1cycVRSRHFMMHFKckppbFBQanUzUHRjK2Fwa25ocjQ0Q2RJcW5V?=
 =?utf-8?B?L3pNT2xjdngyOHpqU05QQnpzbTI0SkJ4MTB2SzR6NUZtZ2VZb1g0dk1IR0Jl?=
 =?utf-8?B?MUpBZ2l2T1lrMTdpWWk1Wk9hRi9zZTRVdXIvc3Fpa0E2NzZxeHY3NEpsakNK?=
 =?utf-8?Q?qKjBcIKIWWbtK6M8GM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG5lbkNsVi9QWk9PdFl4QTdXbCtoNHF4bHZIeFVOQW1PQ1dyMEZTbnFnQVp5?=
 =?utf-8?B?SXJ0SmloS203NEcvaTFQRHVsbC9WSUErUENEY0ZxeGVNVUNpekMweldwQTF2?=
 =?utf-8?B?cTRaK2YyanNwOUNRVTlva2xxakxhTjNUWEJYNWhZUTFLZEpwMisyNnByaUdQ?=
 =?utf-8?B?RnNZSTc5bU5qZU40UnFQL2xKTGlWRXpwM0tYWWMvS1VNeFByMk9GM01iZzRF?=
 =?utf-8?B?ZjVIN0pVU2l3R2h5dG9kQ0kwY2RqYVhIc0p3a2plcm9NN05iKy94cFBvcWhE?=
 =?utf-8?B?ZzlUK091NXU0bnF1Z25OYVlqdHpISEJNV01acjJGZytQc2lZcFlCKzAzU3ly?=
 =?utf-8?B?VHJMejJ2VGdZbjU1VTNRWTl0TWduamh5Sy9WMnQveWkxRHJEQXVmTzBaay9I?=
 =?utf-8?B?ZEV1L042VTRBY1pueUErcnBJVmI3RWpZemdnUWhMUTdsNUZkVjhGWFlkVEpU?=
 =?utf-8?B?a2d0c1J4OG9IR0ZHaWRmNEFybS92eXRYTjRyWmRvYTBqTWo5MTVPK0gxWFkx?=
 =?utf-8?B?RDNOTUtRY0lid2VzU1Ztd3pMRVVnajBLY3NxMmt6VVBBZ25sdW1lTTR1aDgz?=
 =?utf-8?B?NWVZTTcxMmFxQStxcGQwcXBURFJGWEovYjJKcXVQekhlOFdTUWg3RVBwbUlH?=
 =?utf-8?B?NngwRlZxZHljRUx0c2VSMExVNHY2K2ttRllLTUUwUEJjWTYwQTU4a3JZeDFV?=
 =?utf-8?B?ek5rQnduZVl1UGVzTHFiZm1Ra3I1T2gzQUtaUkxNdXF4OHdjQ0RyQ0hRd2x4?=
 =?utf-8?B?UWlmLzhNVHZNWTBJejB1d29nSFZGYldZbjUyd0VuWEs0eEljRldJY0NWVWw5?=
 =?utf-8?B?TXY1LzU4Nkx3MFVpOTFDTkZkNEhEalZURG5HQThLV3JDODZ1YnZRenExWlln?=
 =?utf-8?B?ZXRSVjhDZEk5ZjlVNXZxWU1JY2JNNlJndlpWVWxqNUtDWHhEaHovTHhKRnZl?=
 =?utf-8?B?RGkvWnpkVncxRmtKR1pQUElMMi84NEpGaWc4dnVETjJQZGdYR0l5Q2N4Z0ly?=
 =?utf-8?B?YWRoUS91TWtycVNWQ0VYTWRpam1LYWNZMmZMK2tTbWNXUUUzeEtnV2FrenBR?=
 =?utf-8?B?OE9TdE5pR0tybzQ1YkkwTTVIbjRGZlk0bXFsYXdXbHFqMmdXUVdiSzNaL1VN?=
 =?utf-8?B?cGxKNkVOQTd2SUNKNzZJL2xpUmJGUzc1RXpQQ09mRHRHNWlkV1AwNU9UdmpR?=
 =?utf-8?B?cC9vcDIzOWVzQTZKQWFzOFZNVUFpL3FFUTJ5UGZaL2ZhcGZ0VnVSdUxuRUtu?=
 =?utf-8?B?THRGVjZtNkx5R0grV2pac09tOHRhclZrL3F1aGZUc05NWTY3U25DL3YvbmYv?=
 =?utf-8?B?b2ZubjBrZ0huS3VONmlCKzFaVUhNSnVQbm14SG94bS9rM2orWG9nS3JyczBl?=
 =?utf-8?B?UElqOWJIa0ZDRlRQbGZqSG45bmNUWmV2NVNES0lLVlpFQU44Zit0d21JUnho?=
 =?utf-8?B?M3g2dnpCK001cHJmenNpSW9xWVNkVXZJSGRlanNGeGNqVVF2UUJaTWZGN3Ni?=
 =?utf-8?B?emRXUEtsSEdMQkRDYkdKV1RTVzVGTng2UW9USWg0YUVYNkQyWms0ci9ramlo?=
 =?utf-8?B?Z2VNWUdmMC8vaGtldDZESHVoZTZyTEhld0NIeW9LWVNLRFNPdFcvdWxWZ1kv?=
 =?utf-8?B?emQyR1YxbS9ncmk1L1ZneXE3VVZVNDAxWjh3RXVYbHg1RFl5WnhEelZjWTNV?=
 =?utf-8?B?bXl2Y29IbjJ4VXMvVXB5UDN0dHVpVm9YdEVnUk1YeTJLajRwQUVRVGRXTVND?=
 =?utf-8?B?UlBISlV3OHVOc1dTRmZoeU9XWkhhQ0orV3RUYzBmakRFOGdBNURiODFDeXUz?=
 =?utf-8?B?eDdrb2dMenh5MS9idlV1VWtheloyVlNuejNSVUlWZmc3VkRoTHJzZUNseFZ1?=
 =?utf-8?B?WlFDMmd2K0VEMnExUE9Qb3c2Kyt6Rm04cmwrMk5PUXpHYW5tdkY1VzZBMVNw?=
 =?utf-8?B?VDl0N2c1bTB1VzBWc3huc25VeXdTZk5uSnpoSnJkaUg3Rjg3b1o1ZXdXenlw?=
 =?utf-8?B?bFcxenpzY3ZhRzBwellIeXFkV0VQQXh6TFJraTZNcGpBck5yR2czTUtLY1lL?=
 =?utf-8?B?VjUxWHU4cDBKQ2RiNTRxYW0zeEFKL25hK09IRkNwUjRjNFF1WUV2RkpoZXZZ?=
 =?utf-8?Q?w+H0Oxu5PPPeeSLhB9/vfOKIS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cb23d5-0c6b-4626-c11c-08dce6040af5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2024 12:40:22.1366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTQIdVB3bdQBGd/WbCxA2TiUn3p61jKLcjyKjdgvEmZrPMJ+DD+26SU6xLs4kUBbMVkkU/KZemQxJD2rOePbJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8983


On 10/4/2024 2:42 PM, Benjamin Tissoires wrote:
> On Oct 04 2024, Linux regression tracking (Thorsten Leemhuis) wrote:
>> [CCing the three reporters and the regressions list]
>>
>> On 03.10.24 18:04, Basavaraj Natikar wrote:
>>> There is no need for additional cleanup, as all resources are managed.
>>> Additionally, if no sensor is found, there will be no initialization of
>>> HID devices. Therefore, return immediately if no sensor is detected.
>> I'm not a reviewer, so feel free to ignore the follow comment:
>>
>> I think the patch description should mentioned that this bug caused
>> Memory Errors / Page Faults / btrfs going read-only / btrfs disk
>> corruption, as that is a crucial detail for later and downstreams that
>> need to consider when deciding about backporting.
>>
>>> Fixes: 8031b001da70 ("HID: amd_sfh: Move sensor discovery before HID device initialization")
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219331
>> Some reported-by tags IMHO would be appropriate to give credit; all
>> three reporters already agreed to use their email address in public.
>>
>> There meanwhile is also one comment in the bugzilla ticket that could be
>> read as a tested-by tag.
>>
>> Maybe a Link: to
>> https://lore.kernel.org/all/90f6ee64-df5e-43b2-ad04-fa3a35efc1d5@leemhuis.info/
>> might be appropriate as well.
>>
>> Ohh, and participation in stable is optional, but given the severeness
>> on the problem: would you maybe be willing to add a stable tag to the
>> commit to ensure this is backported to affected stable series quickly?
> Fully agree here. It would definitely help if the submitter of the patch
> keeps track of all of these instead of relying on the maintainers or
> Thorsten to do the tedious work.
>
> I was about to apply the patch, but I still have one remark on the fix
> itself.
>
>
>> Ciao, Thorsten
>>
>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>> ---
>>>   drivers/hid/amd-sfh-hid/amd_sfh_client.c | 3 +--
>>>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 4 +++-
>>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>> index 4b59687ff5d8..3fcb971d5fda 100644
>>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>> @@ -297,8 +297,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
>>>   	    (mp2_ops->discovery_status && mp2_ops->discovery_status(privdata) == 0)) {
>>>   		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n",
>>>   			 cl_data->is_any_sensor_enabled);
>>> -		rc = -EOPNOTSUPP;
>>> -		goto cleanup;
>>> +		return -EOPNOTSUPP;
> so cleanup is doing:
> cleanup:
> 	amd_sfh_hid_client_deinit(privdata);
> 	for (i = 0; i < cl_data->num_hid_devices; i++) {
> 		devm_kfree(dev, cl_data->feature_report[i]);
> 		devm_kfree(dev, in_data->input_report[i]);
> 		devm_kfree(dev, cl_data->report_descr[i]);
> 	}
> 	return rc;
>
> Would that means that the memory corruption appears during
> amd_sfh_hid_client_deinit(), or...
>
>>>   	}
>>>   
>>>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
>>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>> index 0c28ca349bcd..1300f122b524 100644
>>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>> @@ -351,7 +351,9 @@ static void sfh_init_work(struct work_struct *work)
>>>   
>>>   	rc = amd_sfh_hid_client_init(mp2);
>>>   	if (rc) {
>>> -		amd_sfh_clear_intr(mp2);
>>> +		if (rc != -EOPNOTSUPP)
>>> +			amd_sfh_clear_intr(mp2);
> ... or during amd_sfh_clear_intr()?
>
> This very much looks like a band-aid (I know it is because you can not
> reproduce, not blaming anyone), but I'd like to know a little bit more
> if the bug is not appearing anywhere else in the normal processing of
> the driver itself.
>
> Also a comment explaining why this is the only case where
> amd_sfh_clear_intr() should not be called would be appreciated.
>
> So all in all, I have a feeling one of these 2 functions is not making a
> proper check and I would rather fix the root cause, not the symptoms.

Sure Benjamin, I have added the latest cleanup patch in the bug ID to see
if that helps resolve the issue and to find the root cause analysis.

Thanks
--
Basavaraj
  


