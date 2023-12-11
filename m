Return-Path: <linux-input+bounces-680-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D8A80CF43
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 16:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 158D31F21790
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 15:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8564A9BA;
	Mon, 11 Dec 2023 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HIL4+85U"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769ACDC;
	Mon, 11 Dec 2023 07:15:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed3MDdFvWtfkkpEHcvH0LMtljIivTV48AWK9FPEGeMxUS67PKx7M1BWTd9Uat4H1dFkO6Rvr1uQB35kYYyyvkiumH6JJhSO7VIB2H7EHRDu49mfcpvpqH/Nl52ZUAqILG18UrPlE/zJD7XfEGWbpxJCURY2vYqhz5QBe5CGJMy3G3d8hyYyiYRv2wb2tqF32/LI9V3zoIi400ZIhU+W+6ZdEL51CjVFBjImjcLbGuDx6KL4Hfk/Nfcnvja0J8Oyyg1XFxPd4fXLofyHTKdO2/mm+wAvll45y8eSGny3EUss1LRm4tFJYJuv4vhdqPheh9UF8yDYHXHeDd6zveYUOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRSQTAjvldGjpyYg4ydAjbGgjhThsbuW/PedlZFU9Uc=;
 b=OxL10vxyWhvTlP+2IdAosP5zVZRmXag+25xNqXj/DN6JkYfhe8gwG6PIh04HJnDeOxLeWGRAZAeNwaQsUmxYe+2mvJRNdGESi2kVVbrPb5Dbzq2+EY2arV71sfNUT5/cnXPZPwUb+qDMH1ZUsTSpFMyfREz8Y9fsv5VzwLz2SMSBdDGZmz0Z5kxGCeufIAnyyLzMy7Yu8nD90yOlDkhYYo2dSz5Lt6jvluomyb/O11vGwZ2UqU3PD3buD8vQFhfwcGbImZz2QlSjBuGBBJaTD0IosbnGyKgOSWejmPpAu0163MC7jW+BiKK2V8awFMgCbG9M0fVkAWMT3jsu6ADT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRSQTAjvldGjpyYg4ydAjbGgjhThsbuW/PedlZFU9Uc=;
 b=HIL4+85UqrOdkYW3rpSbqruTG2D9XKYwuOfOUjvNX39DS2LwXhbSlFGpgfT39JpuD3O3BwEu+1/oFx0ir2ZuaO5l/oQhTpumm72eKK9bw7phzFew/4S5jwDfcnf6wMfUUonfDvR7mjvvei7qQgVg4gw17YZKn5fUkz1Hk4GSyPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH0PR12MB8505.namprd12.prod.outlook.com (2603:10b6:610:193::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 15:15:56 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 15:15:55 +0000
Message-ID: <4af63850-0cb5-4deb-8dad-39dbb425916b@amd.com>
Date: Mon, 11 Dec 2023 20:45:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/15] platform/x86/amd/pmf: Change return type of
 amd_pmf_set_dram_addr()
To: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-4-Shyam-sundar.S-k@amd.com>
 <bae8cbbb-47d9-4e03-9445-8ca9b50576af@redhat.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <bae8cbbb-47d9-4e03-9445-8ca9b50576af@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::23) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH0PR12MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a52e3f-ae12-49a8-0ae7-08dbfa5c123b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PoH7WrW5t+RsRaf8RJRoNeKOfW3Ockesme/Hu9TeptptwgCZLkxaMWFwFjyELe/jxzh3fte5u7kdXTpqT8DdL9IHzMefK9MmOT1OtykVNd8VK4r2iA+18kVQiZ8YF4sl0JEHPZNodpdIoc0bguz0NkMjQMXe1z3R6Uy6G68wp9SPlxTUKLnbbtTJAwps81fq1mylIe9bEy88H07DKzE62AiF/u9C+HAmGq8WDkW5PPdo2rp7kvvkr5nNx/rn4sgl1o9ZlWqIzBRuFvZE68W1zdooMScmKjA2UjukGgJv4ccLXHTSUouoKHKPiDE4uK2GSGDcwdarzROgatj9S8m1QPrVgNFbgkCRfS33niLulGN4mvcIrI36PHTPrJGatwwtz6+aG4VFoa3zGqRuiZQNBzA4MbKLgh7mdMTEKxVgF0g6YoX3Cd1nSjt3L18cihFAwdFz+Cdu1Dw7A8pGRIiV6AB8mEeZf+4Q3ZlRl88NHBvvEpt+hNdtkYDpuL3QRkpB+EnBCGmKRTZHKbGrIy80q4H2URqDsYg5geoM+1WaEATpKAcIGgsxj4efkDd46o3xVmPJGGL9VFgfFaKJPUAlmqXDr81DcrvGpWPJadsLNiAjub25ZMUfWCw7f1NGGu9oW8a8R9o49ii5b5rLQN54Xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2616005)(6506007)(53546011)(31686004)(6512007)(6486002)(36756003)(6666004)(478600001)(316002)(66556008)(66476007)(66946007)(31696002)(8676002)(86362001)(4326008)(38100700002)(8936002)(26005)(83380400001)(5660300002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFVoK2tlYXdrK1dSbDQrekhXWkF1WmJIdDl3L0cyRGZPNXJMSWVBVkNRam9H?=
 =?utf-8?B?aHRCbStBRkNmZzJ6MTVrMmZQZjh2eXJDZWlSaHdUbXRKR2lKSS85OUhkY1Q5?=
 =?utf-8?B?N1k1ZjhNbmR6Y2lSaXdWWmdJZFRGM1NJNk1DVWJiVERld3czejdNcmdDLy81?=
 =?utf-8?B?ZnMvYWNJb1laMEpRbXpDQWZZVnRBZ21QQ3dvWFBXTkgzdmJYenV4bVVOYUJi?=
 =?utf-8?B?c0xITTdMbzJjMmJRbE52N2Y3T3Irb3NhckpmM2JMQjFBeVhLWEtoZlZScDFX?=
 =?utf-8?B?UldLM0U1WGlPeUxBaVZpZDh0K0tLKzM5WVF5c3RHL25YSVo3d2NlSDhOb3BP?=
 =?utf-8?B?QjQ1NDUxaVJBcFZ1UFdPa1QybGM5cXB1djBCZlBLUnNsSWVLNnN5eG9GdFlx?=
 =?utf-8?B?WEt1czQzTmJwajJmOUxodnR2Z3VRdzJBVDZSc09qbTREOG1IZW5RN3NLRHNG?=
 =?utf-8?B?ZUNtbGZFdUo3SjgyV2tRT1Vpb040MFVPaFp6d3Jtb002NVJia202VTU5RjJm?=
 =?utf-8?B?UjhCSzdSUDkxeGp3NFJBWjFPY2k2enJRRFJRem05T1NkSTVvMnV3dHNVVk1M?=
 =?utf-8?B?T3h4R1pUQjlyMlYwZGlmM0ZxMTRKTUh0TjJocjJrd3YxdmVrWnhSWlJVV0NY?=
 =?utf-8?B?b1B3OXVBRkxVejMreGpad1Y3RVlCa0VYdkwzM25HNk45dGdDUnlLbWhmSnk2?=
 =?utf-8?B?T2IzZmdZSmx6ekU1RkYyTnovTWsxbDJib1IxYXB3d3VmK1VOenltQ2lJY0dj?=
 =?utf-8?B?alU1S3FRMzJFWkVVSzNtWVlFMGpIMExkcnpHZFB1cC9kcVpDODhxOUtYT2hq?=
 =?utf-8?B?dWdlOW1sNVlQanZFR3Y4WVNiZlVhemRFRFU1VFNacGlYSk1zejJYMkMvcndw?=
 =?utf-8?B?YVNrU09UcEJWMDF6SWx4aXp5Nm0wQlJ4ZlE5ZXlGSVVadVN1eDV3RWJSVld0?=
 =?utf-8?B?Y2ZtdmI5VytEdmxUeE12eHVaRlFnMXRjc09uY05RQmxrSDRUY2VGMTVQWkFE?=
 =?utf-8?B?OGNMWmdTOG5aR2dCejRUenZCMmh4WlBORWl5UUEzZ3B5a0JOenZhZTl5dEpt?=
 =?utf-8?B?cVBTcDU1V1pOUEd4OVorUGJKcTFqRFZHRGFSMVhTSkZhdFpEenZoNFRxdHp5?=
 =?utf-8?B?dFBobXBiaFVvem9yRXNLSXJpL21BNGtta251M2puYUx2V3NiM2x6OTVwcXlz?=
 =?utf-8?B?d0tGRVRzK2RrSUJwTmRyb1N1VTFISDJTM2x5OVNySXpocUk1U1dIeHpUZXo2?=
 =?utf-8?B?UVQ2YjFmdUIzTkVIZ3NQMFpCbjRmOGV2SUlFOVJCUjJoeWhUeE5rNDBYNUg1?=
 =?utf-8?B?QW1lT1lVVFlHajFta0s5UUJHU2FudmdHVU84dnhDcyt6Z0x1YXY5alkyQVVq?=
 =?utf-8?B?NXR6aTNBZy9vWHU3NmtYZGdmZElRZ0tKdW16aGZDeklRd0VjL1oxc3NISDZ1?=
 =?utf-8?B?OVBvNzVkMnZPaXZJdGtCU3hEU3FvN0VvTE9CWkdxaGdGc0VhZVZUcFRWSHlN?=
 =?utf-8?B?UERCMFRST29odlhlWEZqRThFMGZNSzVNVnhodEhyQ3lqZEJYMnhEWlVOc1Q3?=
 =?utf-8?B?enBpMldKWGVlQks5ZllMY0FZMXVKVGZxVHduaHdDRGc0b2RReTRCMEhmL1d1?=
 =?utf-8?B?VEJuaUJzMERBU2pYeFpVYnQ0WVU5ODlMWjFRaXM1NWliYlB0ci9oaFhmaDFQ?=
 =?utf-8?B?akNraXAycFRKZUdmSko3bmRyMk1UeWh0N21jL3o0SzluTzcvSUE4TnI4S1N3?=
 =?utf-8?B?NG8rRzlDZU05cWVBenFaMkdPcU8vdUVpZy93QWNTamRQbFRHS0JGRm0xYzRD?=
 =?utf-8?B?SGowRFc1aXFaaERMZWpXbzArREJhcW8wZjVQNDA0VTdQRXR3RmptWDJ5OEtF?=
 =?utf-8?B?dk5Ja2cvZFkrYkdxbGRkcHNWeWM0K25aK3ZxdmYyNUt5amJNaERHYnZTWUpN?=
 =?utf-8?B?UGhwaFduN1JNSHRrTnRockpDT2lrTjJ3QWJSUzNMcU1kSHluZ2d4ZlNlTTF1?=
 =?utf-8?B?KzM1RXlEZ0tUME9pSlF5Zlg0ZVFnalZ0ZzF4S09sWk5GVXJ5REhKTlM2alpW?=
 =?utf-8?B?ZUZmcmVndTFmODg0eFBKSks1MXBEYmhkaEdoRnpvdkFyUGRMOUZpMURnYmF5?=
 =?utf-8?Q?D0j6JGf488tX+SWKlEEftHk7F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a52e3f-ae12-49a8-0ae7-08dbfa5c123b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 15:15:55.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Isrfk6yipZCaESVp3lK9gL5jAG0EoK3/ukcXjKKk7IJHxyD8XwcyHJZRJI1BENzbj4FF7DIISwdIU1csnNdAww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8505

Hi Hans,

On 12/11/2023 2:10 PM, Hans de Goede wrote:
> Hi,
> 
> On 12/4/23 11:15, Shyam Sundar S K wrote:
>> In the current code, the metrics table information was required only
>> for auto-mode or CnQF at a given time. Hence keeping the return type
>> of amd_pmf_set_dram_addr() as static made sense.
>>
>> But with the addition of Smart PC builder feature, the metrics table
>> information has to be shared by the Smart PC also and this feature
>> resides outside of core.c.
>>
>> To make amd_pmf_set_dram_addr() visible outside of core.c make it
>> as a non-static function and move the allocation of memory for
>> metrics table from amd_pmf_init_metrics_table() to amd_pmf_set_dram_addr()
>> as amd_pmf_set_dram_addr() is the common function to set the DRAM
>> address.
>>
>> Add a suspend handler that can free up the allocated memory for getting
>> the metrics table information.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/core.c | 42 ++++++++++++++++++++++-------
>>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>>  2 files changed, 34 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index ec92d1cc0dac..f50b7ec9a625 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -251,29 +251,35 @@ static const struct pci_device_id pmf_pci_ids[] = {
>>  	{ }
>>  };
>>  
>> -static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>>  {
>>  	u64 phys_addr;
>>  	u32 hi, low;
>>  
>> +	/* Get Metrics Table Address */
>> +	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
>> +	if (!dev->buf)
>> +		return -ENOMEM;
>> +
>>  	phys_addr = virt_to_phys(dev->buf);
>>  	hi = phys_addr >> 32;
>>  	low = phys_addr & GENMASK(31, 0);
>>  
>>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
>>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
>> +
>> +	return 0;
>>  }
>>  
>>  int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>>  {
>> -	/* Get Metrics Table Address */
>> -	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
>> -	if (!dev->buf)
>> -		return -ENOMEM;
>> +	int ret;
>>  
>>  	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
>>  
>> -	amd_pmf_set_dram_addr(dev);
>> +	ret = amd_pmf_set_dram_addr(dev);
>> +	if (ret)
>> +		return ret;
>>  
>>  	/*
>>  	 * Start collecting the metrics data after a small delay
>> @@ -284,17 +290,35 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>>  	return 0;
>>  }
>>  
>> +static int amd_pmf_suspend_handler(struct device *dev)
>> +{
>> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> +
>> +	/*
>> +	 * Free the buffer allocated for storing the metrics table
>> +	 * information, as will have to allocate it freshly after
>> +	 * resume.
>> +	 */
>> +	kfree(pdev->buf);
> 
> This seems quite risky. You are freeing the memory here,
> but the SET_DRAM_ADDR_HIGH and SET_DRAM_ADDR_LO registers
> still point to it, so the hw may still access it.
> 
> IMHO it would be better to add a "bool alloc_buffer"
> parameter to amd_pmf_set_dram_addr() and set that
> to true on init and false on resume.
> 

Ok. I have made this change.

> Also I guess that this DRAM buffer is used by the new
> smartpc mode and specifically by the command send by
> amd_pmf_invoke_cmd() work. In that case you really
> need to make sure to cancel the work before
> freeing the buffer and then re-submit the work
> on resume.

With some sanity tests, I don't think so this is required. pdev->buf
is only used to get the metrics table info. So, I am keeping only the
freeing part + alloc_buffer thing and not cancel/resubmit in the
suspend/resume.

If there are issues in the future because of not including
cancel/resubmit thing, can we work that as a bug fix later? Would that
be OK for you?

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
>> +
>> +	return 0;
>> +}
>> +
>>  static int amd_pmf_resume_handler(struct device *dev)
>>  {
>>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> +	int ret;
>>  
>> -	if (pdev->buf)
>> -		amd_pmf_set_dram_addr(pdev);
>> +	if (pdev->buf) {
>> +		ret = amd_pmf_set_dram_addr(pdev);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	return 0;
>>  }
>>  
>> -static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, NULL, amd_pmf_resume_handler);
>> +static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, amd_pmf_suspend_handler, amd_pmf_resume_handler);
>>  
>>  static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>  {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index a24e34e42032..6a0e4c446dd3 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -421,6 +421,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>>  int amd_pmf_get_power_source(void);
>>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
>>  int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
>> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev);
>>  
>>  /* SPS Layer */
>>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> 

