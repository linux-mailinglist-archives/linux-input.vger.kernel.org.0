Return-Path: <linux-input+bounces-2113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E9C86AC69
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 11:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D8F5289059
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 10:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5557127B4B;
	Wed, 28 Feb 2024 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IrD4eTzC"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD87E57F
	for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709117985; cv=fail; b=soTuNlFXdPC9D3I5PwQFB/2Gi8Zy752UwMnPH6d8yDzQXDJqelRhLDneIO+poKSZLT3jhvf8TVVkY2e64PGbs7VbAzt3sWXMegopqfTPXESAvXC0B8UrPaB1iWEUoe5cGKGL3CvLeON+8qHpGwfO7dh97WFe1pMI5PZbbU0N4IY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709117985; c=relaxed/simple;
	bh=l28sNkJbHWmBa16Si+g0aeJsfSS3C0li5MHnWj44cV8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ksbN6Jk/jo49n3y7VzKoShPcOKqioXuf9q3sEMK2ta2GcULUDG2QfknbJlPtpL4rm29JLGi3xS0wQY42LxiiCP6fIgnRTDxWGcIudFlw8oZQ2iHtA0rEJNbUxuiuglo1DBJSl3s0XXQyQ7+ETS8bQb6xTtaE3bL6+Ze+88axZdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IrD4eTzC; arc=fail smtp.client-ip=40.107.95.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uv6HLxAZpyvrWHolQZqNfpeU0Qi7+OZNfeJTZ2HcgA6vlx6hwxqUJJuppsoCkHkDYU72hmWKgQfL7tn3JFdFT+60aas9EmyYdZPkSifO5X/uB0ULqtguDwKqKmByQLQV3oBogd/ZZ+SaRy+rocA3CQQe5bXa3fVtMmGZ3wzBFkP4yLZ5YrEIK14p2nqOdRK1b2n8k+lpeUgsYZFmryn7/DT9F/X7xr/mbVXbPoyfzh6x2GcZvut2dm5uL5MI9pP8hwHxj0drn7TBeUVoAd04ttegHCG4y8Ka0gc3DpkX/Cxv8Xot6CRtHjJCXe++AtHbSFii6Iq85KJAUl9uCH+Xnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gs3xAgk7eswj8cBklfa7DQmOn1uvg68DGKjCZYCH/rY=;
 b=F0qyDnPy7hHtQ9jkRSnfaEMFnCAUyeClr9p6dxeQUZbLcKB48eS8ioP2KZX1bKhN2prqIcuVZDVOW+R7AV48Dg2XcCh5y2F3d+bhwm9G9Gd+9Uc0XisCfZy2s7NiHZpd48VliYTzaF6gJTaWcdysV1woUDF0xoHGQIKQtV2FBpzsbHNr5A4dz50Loe07/BhRY+dT3/YY8hgc+qbnjhn7mvOanIQdz+/uiBSbDegNwdS/QiIm4NJ8qVcW5B0MJT0n7Nzz3Hvz4cK7ckxS7u44zqrN+xOnJ9ohHMHqhdgp4lD4BOne4wkJ09z9J8ABJ2dO+TEVG/1/RgReGqqn7wh1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gs3xAgk7eswj8cBklfa7DQmOn1uvg68DGKjCZYCH/rY=;
 b=IrD4eTzCJNzVg47g9ZBhu8IP52LtTZgvr6bvDQpN6IoMZe4bAzUl6/h40u2+vjsEzu+aqTHKI5g1BT5zAvRSYEeReXNUW4wTYhV00IKt0VkOc24JiSUgua0acwfg2nm6ZKbDoJKfaIY2ZZ7uxb7BIoTOUXEJ5mD9dOzXGClRKyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DS0PR12MB7557.namprd12.prod.outlook.com (2603:10b6:8:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Wed, 28 Feb
 2024 10:59:41 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7316.039; Wed, 28 Feb 2024
 10:59:41 +0000
Message-ID: <085813e1-3001-49cc-b9fd-6a09961a0797@amd.com>
Date: Wed, 28 Feb 2024 16:29:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hid-next] HID: amd_sfh: Fix build error without x86
 kconfig
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20240228075104.3495081-1-Basavaraj.Natikar@amd.com>
 <nycvar.YFH.7.76.2402281003030.21798@cbobk.fhfr.pm>
 <22f150f7-b56d-460b-b964-9c873957d5a6@amd.com>
 <nycvar.YFH.7.76.2402281156370.21798@cbobk.fhfr.pm>
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <nycvar.YFH.7.76.2402281156370.21798@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::10) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DS0PR12MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 00701f27-3b7d-4654-d09b-08dc384c5cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HiwVyU5vC1tCDBJR3rj8ir8RH6kti7jlQsayLAOIvYbGC2XeNbAUMAeB/A9Sqx4/9ztYMNbCko+X3Hb21K9Ih9ZpCw19hfFEgdIO9qFxoFwqEvQgIPIoWZ7qVoGfNu4bf0IHVKnGnYOz24u8WtU+DsNW3ac9rHMJyysiM20XLfqcZIv5Ue5RkHspjLC1hTyf/5yf6PpPvAHSpcmB7AMl/ywyc6pDE3pHpbK2ILc2uSPlcgxJ9Y20YA6uovfS1nytOzbgV8xSyX/J2+oxZZoTR+xIUYWGU7NBevWb17ceiCyVo2Gl2th7oJ1HVyllWl+IZgjyWDGy9LCvAcWjxMo7DkgNSB1AVxaxcUadZipvTkmwc7wL3xeEntU6NMiQDTOXlx4bpVIEeV8MZzT5qOdJO9s5WLrAiV0mm1MFwD0jU1czKXhTMZZL7LGE0jsBiYvdnSuzPuFK1w5U3RMT/KcsiYx+/vNdF7fEvFCUQBRT/H4EOiFDndsgnqFEsuz/kGqhh6ZdJiI2dR5V/hBxlGUFHaLd4V3CuZ2uAe8RmD1WqFGOybhjvu4uub7rnSE43mDKTSLP2zX5Stpzh2+d1iW95xlkh/B5h7fkC4cnmH7PMeCOS8pOJW8CFs4ABh/jY+Uya6or7sQquDMRsWyPLXMqDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm9xb0dRUGVEemlMbWh5YkJ5L0phUGcwbmVEcHl6eWhTMUFjS3Yxamw5OXp5?=
 =?utf-8?B?bzB2aExmbHRQdE5oWkdtREtXU1Aza09Ld21VYVJGMWdVK2pMK054KzIxZXlO?=
 =?utf-8?B?N1hFZVRybDZCQzAzbFNkTDhRSWZGY3hHc2czNDBGT2oyaWVwZWNkcEdvVldX?=
 =?utf-8?B?ZEJ5WDl5Zk94V3NTbi9BV2pldzg0TlRhcytMS2JINjNtYzN5eC9GT3NvY3NW?=
 =?utf-8?B?Q0dPNTFqNUxSTE51aGFzalJEUUlpMnJpbWJDWStBeG00NE13S3NlVllteUVv?=
 =?utf-8?B?UFN6TDlPb2J6L0cra1ZQMnJiZ3pXb1lDZlhxVHpYQ0hiSGo0cStkS2xFWCtP?=
 =?utf-8?B?QkhqOUs2RWNUWjNUV0FkTWFuZTFWditxdjNULzU3cnVHUVkwSGNJbDlpYkFB?=
 =?utf-8?B?Yy9mTXBUQ0VvcW5STmFnbGJHemc0Yi9zRzhjV2llSjhQeXA4RWl2c2JLKzUz?=
 =?utf-8?B?cmV5R1BCbkFNejFPSEtHek5adjEvMWpadmEzWC82aTJEeHcvMUdReTlDRWRy?=
 =?utf-8?B?emxKaVh5QlpXUFR0S0ZzNDYxcHAzVmhNdlljeXRwL21jZjZJZ24wdkRablhH?=
 =?utf-8?B?R2tqNFRyVHRsL1pKTDYzRHN4eFpNR1pvYXNxRnorQ0RvcmpHZDh4czJVYnM4?=
 =?utf-8?B?TFFpNFZHQ1oyWTJLenIzK3JlSllLQndWYkdpZUZsOXhxQXpoMzlEanczRW1a?=
 =?utf-8?B?U1dYTlJiamNheHl5VWVVYUgwdkt3ZHZPRHNiL2FnQWJBclNsWWZ0bnNZUDZD?=
 =?utf-8?B?SGxOemZaSXNDNHNiWGdYOXV1UzlZZndzYnhFTXpHR2hCd3JtT1JZem9kdG5a?=
 =?utf-8?B?bnZmQjhzbU5rdzRRV2ErbUkvNTBEazdqSGw4aEFCTVg5ZXZzYlhQbk05by9X?=
 =?utf-8?B?OEd5bktnTDlQNE1OeDRYMTlvOHhRdGJGWWVWWnhCTkttbDJjb1FUQ0RWQjht?=
 =?utf-8?B?VDBsUlRDMUt3UkN2K1djbUlYRnI3Q2tOVmI5Y01DRUdtTGlBR3Mzd3VZYzY4?=
 =?utf-8?B?NFl3amYzaHBYWS9WZDlGcXlpbmFyVlVvaEMwc1pEblpFZmF1NGRwazFnQ2Fi?=
 =?utf-8?B?T0x6bFRCZnp2NEdUVURhV1NoMHppUXh2dytZcmdGZ3FNdnNPQUFOYmJNNERT?=
 =?utf-8?B?c0VuaFdvaUU0MitkK1M1enhMZVVWbWxWQUZPY3ltNlZ2a3ZFNXdKaFZOR2pt?=
 =?utf-8?B?VVFJbFlDOStTeEhsVXlGZ1dwNHFQQk40UkZMeER4K3h1N3lUcTZvcFhTZVpC?=
 =?utf-8?B?M1MrbG96dFpOVzFseFNvVmV3Vi94VHN4Z21ncmdlYktDa0VlMnpjdktDMWky?=
 =?utf-8?B?VmVRV0MvR0hxaE1kNVNQL24zMFRLRUc1aGwzUWdoQjdWOHNvWHJ0YmhEL1ha?=
 =?utf-8?B?d2NIcXR0Smx6TjdvRCt1Z0tESWs2Z21nUVF2VXBxeFVvUlFxQTY3czcrM3R4?=
 =?utf-8?B?K3oxUTM5WFFGdWJrVzFnMFllakJ0RmpJM0hsMkFLWnViS1RYRjFZRXB1ZStW?=
 =?utf-8?B?NWQ4ZVZTS08wenhMWVRFK2o0aldaRXdnYjdtVlZTczZxaUdJQzYyaVIwQ0tx?=
 =?utf-8?B?ak11QlY0b2RpQmpXWGNVOTRuRm5FdVdIcFhWS1RsSUNsT2tTbk5KQlN6Y1gw?=
 =?utf-8?B?OFF2aGZnT2d1a21CM0FkZm1EUm9oTnhvQStJaWgzR1pFN0t2Qk9tQTg3ckNU?=
 =?utf-8?B?VEZyWGJmRkZ4MzZtRG1rM3ZnMnhTY3RGTnJMNEF2ajhmeUE2NEo5OE85T3Zi?=
 =?utf-8?B?ajJISTIydjlTV3JQNk9sajhJc05IaXBDcW43dC9CU280ZWUrSEx6eERoSURB?=
 =?utf-8?B?NjEvWmJYQnVQdUNqN0NYZndmQzVYZm1CREFNU0xPZG5UVG1NdDIrUDNMSklS?=
 =?utf-8?B?WkdhSks0VnJzdC9GWUM1ZTEwY3VKeEtjb1dRZFlVU256a2wzcXNVYjNLZHd0?=
 =?utf-8?B?SVp1cWJGZk1PMEYwbnNQWTluRlNGeHR3a1pyQWFwM1FkaE80MTdOa2lsWDEr?=
 =?utf-8?B?N0NqZW1MUjQ2RDFuQ3ZaZFRxVkUrN0JidXgySS9YZGxvakc4cGk4cTVwSTVq?=
 =?utf-8?B?eW9aT3NpK3puQ0FCcnZrL2NZVWdGdGNHbmpZeWM5SkJEaTJtTmRPQWVBaVZH?=
 =?utf-8?Q?77myaOTyCMBimGdoHITKvbfrg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00701f27-3b7d-4654-d09b-08dc384c5cda
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 10:59:40.9690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyeINO5YDTuT9VXiIByLypQuh4NFR6tLwkJp3GNC0KZdtyEBFDCPL3qWI3j1GtxTdBvd4thfxmz34UXbehkqog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7557


On 2/28/2024 4:27 PM, Jiri Kosina wrote:
> On Wed, 28 Feb 2024, Basavaraj Natikar wrote:
>
>>>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>>> index 9e97c26c4482..c815f2f54321 100644
>>>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>>> @@ -410,8 +410,10 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>>>>  
>>>>  	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
>>>>  	if (privdata->sfh1_1_ops) {
>>>> +#ifdef CONFIG_X86
>>>>  		if (boot_cpu_data.x86 >= 0x1A)
>>>>  			privdata->rver = 1;
>>>> +#endif
>>> Does it even make sense to build this driver outside of x86 architecture?
>> Do you mean to say just add depends on X86 like below ?
>> "
>>  config AMD_SFH_HID
>>         tristate "AMD Sensor Fusion Hub"
>>         depends on HID
>> +       depends on X86
>>         help
>>           If you say yes to this option, support will be included for the
>>           AMD Sensor Fusion Hub.
>> "
> Yeah, that was my idea; as far as I understand, there is no way this 
> driver would ever have any use outside of x86 architecture, right?

Yes that correct this driver is only for x86, I will send V2 with this change.

Thanks,
--
BAsavaraj

>
> Thanks,
>


