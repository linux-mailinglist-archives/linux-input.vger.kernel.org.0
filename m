Return-Path: <linux-input+bounces-2111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9413E86AC64
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 11:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1E4B1C20D6B
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 10:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22FB127B4B;
	Wed, 28 Feb 2024 10:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZQjkcgd7"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC17E577
	for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709117593; cv=fail; b=jKIBCOBDO4zUoPK2zf3iMKFzD2XeGV6cZflp8GEQsQuHmPbx6EVDFf/QbBslD9iVqBmVeUhib4CNprJHxxt0DL5j5XlWS0nmDLGvzGx3eMBTNZXIOoSXhUo1U6yXEbXjG5BShdHt5IfGWt410hY8DcSp+PWnga1QXIw3PTi6siU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709117593; c=relaxed/simple;
	bh=EUtTCec7RmgSy0Ryafhv6+NkckWFMHCflkmeXE3keQA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S5K8TXkNc2haYB3hfXrRgMhbNTpf34aHtSdfbmENRPZt4L2Slho6Okj68rGk/YsjFZP2tPaghZpOMJ61P+aV0iEHy8rrHJSiGkGX/4BY2hhhQcP9VdYIoLl5YFVa4gxcyBu8pT9N3c2rakkVEIBOQY+J+Z+xMMnWPB3yk3iBU5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZQjkcgd7; arc=fail smtp.client-ip=40.107.100.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1DP/WYx+2sp3rXTnzRazSdGrRxzFTZjEBqPKk47rqD3plx36Zq4439Ul2uD9675hNxgqQ6Yg/tnud4V6pZW38p+cjGLzFQqQ6dNs6wpJ8IhuB9ywATEYdtwHXFBBIwlYs6TO1k36C/Q2rdmNTFKO3tA8KnoRQO12VnIOAeb1j0EbzNFPhe8yvwuoSo7T85uJgONofh1ReM4/rJ1GOjLNLlCG7uzXl60Hax9ci9xBtF1RnzBIY852z1Fq/BR67mLCbm0c0E+iVzWLILXxXRAXxJWiRRCOKD2vBzahV3mWPAo/7VuXZrprMAEidHA2rohTRE/XPWjrlX5+sJQyfLUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NIcUcH2msCK9cf6ykIxYiLnyBhvwJgwftlXu0z1/L4=;
 b=F1GHxM/8HBzMlzL3kjELCzQWJF1gMJotCjPCyd5eFmMLAgd8gdYD3GgeWicWkBT4aBNSRvV+PzlNIE2+kRQ6PtOrMicDMK8yneiOCOYo2vqDm4scavrGMqAYy2HsnlLYvWeKZoCK6eOwiU5LQERez5/I8sX9e26TIsTt6mvDC7tSbP5QHFVcH9hQBh5Kgsg6A8xSXTNjszrWXiJB0FxcGOaZztvYtE9HRqTQNkQ3pkDHFsrGmMWW0+wXGFYvbXLaqIzxBB7FtDSjhKumOgfhHezTsfZBs+ISAhBCZ/5KMbGaswxzfifrtjFZ8x0AnflyScNH8S7BM/EYJUf66+zoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NIcUcH2msCK9cf6ykIxYiLnyBhvwJgwftlXu0z1/L4=;
 b=ZQjkcgd7GiTEvY38LaMu6oz4Gnw77j8ES7h4ZvsPIJ1NMGIfUYQHessbqymPo3I6CzFPrdYSVFp5q5y+euSz2GYkPkp+XZfDcWiy3IP9kuOShiXyqn9BKOtoe94pDKrk6IfDwqZeF1F8fTrnqCzpR2JGNw7FTZSSm2aIZrcqTa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by CH3PR12MB8510.namprd12.prod.outlook.com (2603:10b6:610:15b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 10:53:04 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7316.039; Wed, 28 Feb 2024
 10:53:03 +0000
Message-ID: <22f150f7-b56d-460b-b964-9c873957d5a6@amd.com>
Date: Wed, 28 Feb 2024 16:22:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hid-next] HID: amd_sfh: Fix build error without x86
 kconfig
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20240228075104.3495081-1-Basavaraj.Natikar@amd.com>
 <nycvar.YFH.7.76.2402281003030.21798@cbobk.fhfr.pm>
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <nycvar.YFH.7.76.2402281003030.21798@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CH3PR12MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: e04b6f85-4228-43bc-db29-08dc384b7023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2BsJpogtyCWQdzBJMtkm+MW969DmHooW9tdbkpmipc4L8oP29I882KAqYH4We8qm5e1fZ/gC8TTFyfIdufhqdc/9/mKqI8QXP5deaAtErZV5CiVObAvZdrgBMNVcdEG+RmYj/OcjW4vDmGzrUo+jkYG44Ici6XXCBR3oZUIt4SbcmXChz7VLJofOl8kCkTE/oyFmCcPQ8qnQrIckKwPXwXslIcOhlUC50eN6oDhZaDK0Mskaew7yxb+ExdxvFAb+Eo8Mbf1LSfgH4KzuDc7LbK9MdfkvHv5FV/NPugXvhTePW5zOmXVer6S3exu6iIDoQgcMQ/HkfsYWBP3wjrPaTZ49SQYOjsnkIDdqg7G1fNcavR7mKXBEhhjySELXq5MvjcaJXzrhpahosvGvZs4Hg04MVP3VkBjrFCsVci6UsJQYUmGM9aCY0K4x9K8hmwvaZNS6LYj9JiE16TK7rCKxqlatB0d6J8MaLCQq170OSyIWJ78Axi+AAVGixNG9h1KcUBwuZSFkJ84UXMZzaqS5//5mwxJyHjK3Q1M2KZi4sOMsIv+gMogv/JrXSM6YNwYvbF5HzPIjxm3kBXDw6z7BDktGGm/3gwMsKV+NyeSEgLeAoG4UgXALLAGWh+mAEW8B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWQ5ZGttdCtNVHphVmpUNHI1TEZsc0N1NXMvK0g2Q0huQ3JBQVFRSkZBcWFI?=
 =?utf-8?B?VE1rVC9DR0JMNmlRVFRNUDJ3bXJ2bUJNVncyQWFxd0NWeGRWL3g5cmc3Z2lY?=
 =?utf-8?B?d1pxNjFGdkF2UzVscWcyVDBTV3RmUUJoVUZqZDNDc3FVVzJ0SGlma3BoVTN5?=
 =?utf-8?B?MWZhTWR4dG5CellaaDE2RFBBd0FqWUR0ejlKOEs4NndwdGlTbjZXdjZrYlc0?=
 =?utf-8?B?ZlJ5SXhZSUxJbHpVNjNadXlSY3RYcHRQa2xvOXNLL012TGNXMGhJWVBIRE9O?=
 =?utf-8?B?a2Z2U2YzODlpTHZDQ296K2I2TXJwQ2ZjVUF2ZExhQjVUcTkyWWh5OFl4eGVX?=
 =?utf-8?B?TWpINFplV1REUi8vTjlJR0ZUMGtGd05kVHJOYVJlZFZmVE9wWVl4cEYrazND?=
 =?utf-8?B?RVAwbkQyN0wwRnRmd1lXT2wvOXVMeUFhWDhDS2JHVFFZRTBzbTd3bklFSjJr?=
 =?utf-8?B?SWxmOWh3VkVKcWhDZDMyQzBoNmFObkd3cjVhU0lTZFNIeFBTMkF5ZUZqYW9U?=
 =?utf-8?B?N1JYL0JXaHA5OHZDMVhtSzlmcjdXMWlPVDJvRVhjMURqYUFhZlY0NVN4RWdO?=
 =?utf-8?B?c3lxaGlhYUNEWit1YmdZeEFQU0xzOGE2ZGpSK3lKSDg4YVk3UGIvSG9SRG5D?=
 =?utf-8?B?U3Nwc0E5SU81eGxad3dTNmRqRExCL011RXQ0NGl6UWpJbGM3YUNKYUtzVlFN?=
 =?utf-8?B?bkJIRlI5K05YT3BFSVVETVdGaFR1RUpSZUZ6RU4zTjBEL2E4Kzd3c0FDRGUz?=
 =?utf-8?B?T3RJb1FRZTJJT3RyYmZRcTNzdDBaUmZRTVh3VWU2ZVZ5SVlrTTViK2F3aGx4?=
 =?utf-8?B?WUVuQUphUXdYcXJDVzVDNGp2Zzl5WjB0dGY3YjNCTE1TVFVNV1d2K2ErRzJm?=
 =?utf-8?B?bXpjc3FZckhTUEx0VkU1VEZ1dHR4dEZXbDd5emNIT1VWRXRsWkJGTkFxMlBz?=
 =?utf-8?B?ejZhOS9ESE9udE0yQXhNdG9FVkp6L3Ntc2locUdkbS80TmhHL25TbWM3ZklQ?=
 =?utf-8?B?bW9NQ3g5WDd3UVBaR2ZkL20rUHc2WStvN2lvSDhvNjlSU1pSNUt4Q2k3MkhS?=
 =?utf-8?B?Z2tNSlppUlB4MldUZHBhNkxVT2ZlOGFaZTdkbEd5L2xQUGhhMW1CaXc1ZGVF?=
 =?utf-8?B?cks0MDdpMmNUVy9HWGZ1TkpmaFpNZmZ3TmwxbUEwS1U2dTlGMHhFem53eEcy?=
 =?utf-8?B?bmVHNlhBNTVvb0RqbWlpa1lRS256WE5EL3hNWk1qWFVMeXYvclhvRXc0L3JH?=
 =?utf-8?B?TXFvRVpZTGFPNlU5Z1dmc1lQREVUSjJiWGliVnZiMU1ObDNnd2ZGT2NzbmR1?=
 =?utf-8?B?bjlWcXI2dWhaMGkwVFI2NDJEZ0ZhNkZycmZvVnhZNXRneHEyQ2IwbkJpbHpr?=
 =?utf-8?B?a1VKajVhMUVnMmdHMk9iRmFub2t1YVJ6NDNaZUEzdDg0QVVnajVuOWhoZ0k0?=
 =?utf-8?B?NHNhR2FYZ2VWOUI4eEkrYlhuSEhTY0JQME9VNU9nMXBtNWNhQVBaQ0V3aWFN?=
 =?utf-8?B?RVVOQXZxcWVjSkpIaEJMcnRRMXlLcjJXWFBnUDNuUXhsaS9JK0tienFsMVAv?=
 =?utf-8?B?dlJIdFVhZ1FFdkJXRU93TnRwaUJGRlgyRkxPK1ZZMUpRWlF0eFhDbncwT3ZF?=
 =?utf-8?B?d3VBNW44azliSWZhcUlIczIwTjhPeVAydGlmM2xQeUErQVk5eGc3c01mbkUw?=
 =?utf-8?B?SHVQRU9MNjZIK1RnLzhLcGprVVRIMlhYNE9qTlcyTmJ6OU0wakd6blVlVFpj?=
 =?utf-8?B?WlVlTUlQMTlqMU1KTmZkVVQrTGtHUFprdzhFM2lpRlFyYnoybGhoYlVFZ0NO?=
 =?utf-8?B?S0c2cmtEVU15TkVzWU1rbXA1TUlmaDBPWGJXczU2cW0zMlYrWllUVGpsbENo?=
 =?utf-8?B?VlpLdHNLUEVYeFN4NE5Dek15YTNCWmNKKy9XTTlLekdaLzl1MEZlUmxFeTJX?=
 =?utf-8?B?N2ZwN3AyWXRSeUJGMzgybWhvOFlCb2ZTcXVXYk92YTV5a0FRQk94TlFmNnB2?=
 =?utf-8?B?L1lDZTBRSjludWlySmZheUMzOW10UUlGQTNQV25DM3liekU5bVd3NXZ2ZlBJ?=
 =?utf-8?B?bWNZTVdFbHVvVzhKcDdXYzliVlJKNVRqenVhZFV3UDN6cWQ1WVN0UmpUSjNY?=
 =?utf-8?Q?j/hHDYpTwWE1N5zRpKkD56mEb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e04b6f85-4228-43bc-db29-08dc384b7023
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 10:53:03.8612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cm+H7qVmWvLrOFSka04cybj9Emc8hEpasvU1bmh2FD/Vwzkpy/T/zty5lRGR63V7MQ6CV0jCy4OKc7p7bDdHeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510


On 2/28/2024 2:33 PM, Jiri Kosina wrote:
> On Wed, 28 Feb 2024, Basavaraj Natikar wrote:
>
>> This patch is to fix below build error while using the kconfig without
>> x86.
>>
>> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c: In function 'amd_mp2_pci_probe':
>> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:413:21: error: 'boot_cpu_data'
>> undeclared (first use in this function); did you mean 'boot_cpu_hwid'?
>>   413 |                 if (boot_cpu_data.x86 >= 0x1A)
>>       |                     ^~~~~~~~~~~~~
>>       |                     boot_cpu_hwid
>>
>> Fixes: 6296562f30b1 ("HID: amd_sfh: Extend MP2 register access to SFH")
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Closes: https://lore.kernel.org/all/20240228145648.41c493ec@canb.auug.org.au/
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> index 9e97c26c4482..c815f2f54321 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> @@ -410,8 +410,10 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>>  
>>  	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
>>  	if (privdata->sfh1_1_ops) {
>> +#ifdef CONFIG_X86
>>  		if (boot_cpu_data.x86 >= 0x1A)
>>  			privdata->rver = 1;
>> +#endif
> Does it even make sense to build this driver outside of x86 architecture?

Do you mean to say just add depends on X86 like below ?
"
 config AMD_SFH_HID
        tristate "AMD Sensor Fusion Hub"
        depends on HID
+       depends on X86
        help
          If you say yes to this option, support will be included for the
          AMD Sensor Fusion Hub.
"

Thanks,
--
Basavaraj

>


