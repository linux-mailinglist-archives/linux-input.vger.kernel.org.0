Return-Path: <linux-input+bounces-683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C240680D1F8
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 17:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2697AB20E52
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 16:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E78FC04;
	Mon, 11 Dec 2023 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b9JL/vq1"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC3C8E;
	Mon, 11 Dec 2023 08:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv5yOjJB2mb5VpxpAVjxkR7GGfZG/f1TxaKFfDplNWNOGunJsK+wY7eGEHZfLMppq86P7pDMPgsrFarbx4YsSn8RLcrHlpbS//lpmC9no86twJ9iuq/zKVZNzo+xcB8aWaYzcMYdD7gpiFr/PtIs/Ii3ZJ64vsWVq3/wf+qqpoI72EUl/qFjHb6iBueCWGtimgUB7qVU/4oMVUadEfsnspA/XWkQlHUUm8HljfmSJRjlD7krvyE83uHom1fYwRGPSqzfkWGb0mqh/lAKmaYtd4/sBuGONSKOBZV/vHHj/QhUOhtej03GRzmojSEotYLcooL+NQziKM2o9xm2xLRn4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DhwXba12XcAYhVrChOiwYkihlYJB4hsKlIwvWjL6gg=;
 b=G/kBLaxWL3AQz7mPFqlvIDZvzBePFEu5Ww3WcLlAbR1Tf1vb4McCpGLNzRDHsVRLV0O612+5Jk+8DHpAspjkLjsdHNEvCX5vIhkqCvPVe1JnEo/bnYJ2muoMY/XDIzWNQVEAUegQFLxrlxhfPeyzqzdHYGziMwM5TQYjUx28zw8N9Yh6DjdlaAHK8UWO1hG7pXs3QqPkMSYhY4UJP5unYNUAac/QRkROzA8uS6uqmdochWFbH/6UP37GRo18EnaTTcwVzkeDOieHdhciS4rWQnP1SArMHtQHKjJaTL0tMuUw/uRUoAepigqSK6m0/FOEeIBg0awEFxdTkjdWdQ2EuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DhwXba12XcAYhVrChOiwYkihlYJB4hsKlIwvWjL6gg=;
 b=b9JL/vq183MSZF0r3zT/+SS/fGYQKiNgYIkjISoVDRSINkfLN3tNvAw83/vJGUuvIqHSwvumTSxuJbwpJJkAAg+gc8D6v5LKEOwDi+h4ixxEsqAvheOAzfA7aRGUQDFBi0V70CuIkqB/1jyHWe6rHwg7GAFIbgeHWKajMTTGWMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BN9PR12MB5353.namprd12.prod.outlook.com (2603:10b6:408:102::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 16:35:51 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 16:35:50 +0000
Message-ID: <6f4a8f94-0a4a-4234-b8c5-84b96c2f5c96@amd.com>
Date: Mon, 11 Dec 2023 22:05:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/15] platform/x86/amd/pmf: Change return type of
 amd_pmf_set_dram_addr()
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-4-Shyam-sundar.S-k@amd.com>
 <bae8cbbb-47d9-4e03-9445-8ca9b50576af@redhat.com>
 <4af63850-0cb5-4deb-8dad-39dbb425916b@amd.com>
 <c3a46dec-0f55-4abb-a5c1-39ba467a3108@redhat.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <c3a46dec-0f55-4abb-a5c1-39ba467a3108@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0233.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::12) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BN9PR12MB5353:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c013a8-bae8-4e01-9e41-08dbfa673c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lZNtTjezBm4PycxYTPHNEMN1m0EykN3SohtAHtVXs0PP+Q0v/H698mRoGhEBctBRRiw+LGzrqgot9o90Z6OiXQ2rQ2SWEBz299nvJ4FtxkbAHedbzpD6zhyETJ1RHf6NY5qlRLNhgBInCrKqNKBHJhM8enTPWON/x3iq9IYlebgDw2GEgLhHGwN2+7FgwoFZ7pFqwvWw85e/63Owq0LLzBM6hvsO6sOIINcIxWNOU0yPNC/BT7TyR9jKYkBR+VBm+imameGb1DtDOlyYcubH15xcc9WB2TG1relVhG1EdPCJ+nVSbe2jwff000vkrOrDnSbkeWFDIf9emR3RLN7RAhCf8LiSlBrNAsKxig6u+c4cyEWM/pvYrvHu57PdAdJrPP/oSNQeJFunAcS18A4pQ4/P3dlNmPNP9IpDzt1BElyb5uUioFjTZ8vFQrYTMW4mPxLpuJs3LD86lzyzj/mndB6c0Nme00J7otdot986l5xf7yAsy5JxkDZzt9SihZTZXTYsayRwCWtPr7DUaWzEIa+DnuvYsS9RT2KRd1erryMe92J7c890FwTwVZppmwRmXellbnvgv9N0tMhM2xrmXEZL77oxgOI8MRmhw55Zm1lYaySPhuhjIY71jJxu8Gpw5+GlCSPOa62abcCxyfFtFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(41300700001)(38100700002)(31696002)(36756003)(86362001)(2616005)(6512007)(26005)(6666004)(478600001)(53546011)(6486002)(83380400001)(6506007)(4326008)(5660300002)(316002)(66556008)(66476007)(66946007)(8676002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUNqeVJoZldIVE5xdSsvd2RVUzVLNDRmN3ZneUNWRWV5K0dRR3lvbk9ySTVK?=
 =?utf-8?B?N3pJUkp5OVpTV2ZyaDg2OGN2bUNRNGNiSGEzb1htcTdqaU1rNGk1TVVlaEpJ?=
 =?utf-8?B?b2dKdTlQeFN3WC8wWnhpN3dzNWh1ck16ZHZnOXpaZUxRbjhLM1ZJLyt6eHor?=
 =?utf-8?B?YjM2MC9FcEUwYTB1Uk9teFpyaEFOa2d1OEJTUVA1ZXBKcm12SGtlVm03UDA3?=
 =?utf-8?B?MlJXc2EvTEd0dk5UTnp3NGlFNkN1Vmw5aFR1NjhDSEJkdTNNY29kMlNmbU9t?=
 =?utf-8?B?UmJWKzRxelU5bWhBYkErWDR4RkpSQUpCVjIrWHY1K25IaklqS0pCTi95WDFJ?=
 =?utf-8?B?eDA0dVRKV1E2emxCTCtkLzhPQlZxdE5rNUNyWUxQTEVQSHo2WER2cCt0SndE?=
 =?utf-8?B?WWlxYTFtYWN3SXZqYUpXcVBzd21WZjZyanFHVWh4MGhTMmdrZUxCMzJsSU5X?=
 =?utf-8?B?ME5kMDBRUEEwenNvMjNCc2djcTErT2ROTmoxMUVUVWxuYWtzb204SEJ0VCtT?=
 =?utf-8?B?U2VvQlpjYzRvdm14cUNNUFdGSDF0d20rV3diNDkra0lBWXBTS1dMQXFFZjZ5?=
 =?utf-8?B?cDcyUTB4eGEzeDFNOWF0ZmpoUzJ1TkJaMWdySy91K2NOUDkyNHF4SUpkYnY3?=
 =?utf-8?B?ZU9LeHU0bG12eHQ0QmVKbjBzWld2WEw4VzROaHJoaGh2QmIyOUw4SE5qYmZs?=
 =?utf-8?B?SWJubGRDMUtQaUNKMS9RdzJ4ZUMrZk5EUWFRL1lqTHhSUjhIYWFXTGVNQW5Y?=
 =?utf-8?B?emhYYUhvNHlPUm5HdTBMV0o4NWY2bGNYVjkwVzI2SXpyNENFUW1zUEJ3bzhW?=
 =?utf-8?B?WTdKY2cvR2k5OE1NUFhBaTZOcW1LSHdXakFQelZ6RTVVSFJRT3FnK20rSFZs?=
 =?utf-8?B?eXY2V2FsUUlLaytib1BrenNNQkdFVWJ2dGtXQy9yOG5JVUg1UUFoOEtsY3Z0?=
 =?utf-8?B?L3ZGQTZwakRTRHVncjgyVkFKenNmSTBKYk5CdkVxZGNzZ1g4QmlrOG5kV1JD?=
 =?utf-8?B?bUJBRUgxS0tkUXFBVnl2enhtZ2YvVDBOT1g0ZU5LZ25MaGtTdEJpWllFb3N4?=
 =?utf-8?B?UWQvUkxrVERIUTg1M0RKUUg4MzJkd2prZllLemMzRGdKSEcwVnl4REpBTURQ?=
 =?utf-8?B?ZzJyOUhOak01NkNpWk9SYVBkRUpqYWQ3SU9lczhscFNhWHZ4czBnOW9kMFpN?=
 =?utf-8?B?aUcxTkhqdlIwT0dBQXdlWDdJa0JRdjJ6d0swR2NPcEJDcTYzOWVGSmI1S0pQ?=
 =?utf-8?B?RzhRUDczWktXK3BINXBXaXVHZWhjRUNHOXZCTlptQ1dHMEViV1UrSThFVm13?=
 =?utf-8?B?TzFNblZ4QzZmZlZVOVREaVkxQWlUREE4TTIvY0VFUDJIcWtoWHlLeDB1M1BX?=
 =?utf-8?B?NlVLSFdTTXJlNlJuYXZhbmxjQS93MzV6OEU2MFRyRVB1VHF0UFZ4NkpuQlcx?=
 =?utf-8?B?eWF1b0J5aFFZcEhtaFRiRGNCWUNnNWJMeU9jMngxVG1aSFNoeGtpM0oxSkgw?=
 =?utf-8?B?ZEszY1RjTFJyOXY3R0ZnNkVGcnJyMzA4R3lXbm5vYk5uRjlZTVlNdFBrOG5H?=
 =?utf-8?B?MGIwbjdqK296QzljcXBPUXcxdW9YTWpXMzJMRkFERkRlUXZvejBLSzdwU0xW?=
 =?utf-8?B?RTlRam1DSnBaUUphUi9oWUhmRENlZXVXYllXS1JzQUxCSUlYOUlXeisrNHI0?=
 =?utf-8?B?enliSkl1QWVjeFU0ZHdkaWYvQ3Q2WHZETG5VdHBVYTBuSk9JcVN5VVZBWnpJ?=
 =?utf-8?B?OWRaR3h3a0xYQUpGdHpITjhpUDI1OWc2MVBxeVVCanc5MW5OZmtsTkRXQkFT?=
 =?utf-8?B?SmFDQW9nMldqMHNmL0QyRXdPbXp4SE1SVmZtOEZrNlhlR0x2dVZJYUFzUWc3?=
 =?utf-8?B?OHFxSGprb2c5UDVlekZFOTdybytNOTRReWo2TGp6TTN5YVlzRXM3VVdKbUta?=
 =?utf-8?B?TW1YSUpnQlZZQnlWOUpyd2tOSzM0SFA3SUxzVmUwR3hsVWU1dW1QQTFQQnlW?=
 =?utf-8?B?QUJ4UkhiLytwZENLUkRxdFpPQWwrWFZ0SzJPRjEyNldsamtza3phYnZLeXRh?=
 =?utf-8?B?WlBTMFF4Vkh2VU9UM01sTnBGd0YvWUlJYWVEVTZMOWE3SmhWbVh0ai9wYnMr?=
 =?utf-8?Q?2ps9z4IjdL+jlkFWMJBiVXm2v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c013a8-bae8-4e01-9e41-08dbfa673c65
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 16:35:50.8262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HITQ7/OA6omN6UYLNw2n4WTnn0ujg4wFkv1jFZXEGAu3+J4JfCwHwCnaFVH/nAeeGiasUoATresiVq35jCdIJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5353

Hi Hans,

On 12/11/2023 9:25 PM, Hans de Goede wrote:
> Hi Shyam,
> 
> On 12/11/23 16:15, Shyam Sundar S K wrote:
>> Hi Hans,
>>
>> On 12/11/2023 2:10 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 12/4/23 11:15, Shyam Sundar S K wrote:
>>>> In the current code, the metrics table information was required only
>>>> for auto-mode or CnQF at a given time. Hence keeping the return type
>>>> of amd_pmf_set_dram_addr() as static made sense.
>>>>
>>>> But with the addition of Smart PC builder feature, the metrics table
>>>> information has to be shared by the Smart PC also and this feature
>>>> resides outside of core.c.
>>>>
>>>> To make amd_pmf_set_dram_addr() visible outside of core.c make it
>>>> as a non-static function and move the allocation of memory for
>>>> metrics table from amd_pmf_init_metrics_table() to amd_pmf_set_dram_addr()
>>>> as amd_pmf_set_dram_addr() is the common function to set the DRAM
>>>> address.
>>>>
>>>> Add a suspend handler that can free up the allocated memory for getting
>>>> the metrics table information.
>>>>
>>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>  drivers/platform/x86/amd/pmf/core.c | 42 ++++++++++++++++++++++-------
>>>>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>>>>  2 files changed, 34 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>>>> index ec92d1cc0dac..f50b7ec9a625 100644
>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>> @@ -251,29 +251,35 @@ static const struct pci_device_id pmf_pci_ids[] = {
>>>>  	{ }
>>>>  };
>>>>  
>>>> -static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>>>> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>>>>  {
>>>>  	u64 phys_addr;
>>>>  	u32 hi, low;
>>>>  
>>>> +	/* Get Metrics Table Address */
>>>> +	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
>>>> +	if (!dev->buf)
>>>> +		return -ENOMEM;
>>>> +
>>>>  	phys_addr = virt_to_phys(dev->buf);
>>>>  	hi = phys_addr >> 32;
>>>>  	low = phys_addr & GENMASK(31, 0);
>>>>  
>>>>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
>>>>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
>>>> +
>>>> +	return 0;
>>>>  }
>>>>  
>>>>  int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>>>>  {
>>>> -	/* Get Metrics Table Address */
>>>> -	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
>>>> -	if (!dev->buf)
>>>> -		return -ENOMEM;
>>>> +	int ret;
>>>>  
>>>>  	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
>>>>  
>>>> -	amd_pmf_set_dram_addr(dev);
>>>> +	ret = amd_pmf_set_dram_addr(dev);
>>>> +	if (ret)
>>>> +		return ret;
>>>>  
>>>>  	/*
>>>>  	 * Start collecting the metrics data after a small delay
>>>> @@ -284,17 +290,35 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int amd_pmf_suspend_handler(struct device *dev)
>>>> +{
>>>> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>>>> +
>>>> +	/*
>>>> +	 * Free the buffer allocated for storing the metrics table
>>>> +	 * information, as will have to allocate it freshly after
>>>> +	 * resume.
>>>> +	 */
>>>> +	kfree(pdev->buf);
>>>
>>> This seems quite risky. You are freeing the memory here,
>>> but the SET_DRAM_ADDR_HIGH and SET_DRAM_ADDR_LO registers
>>> still point to it, so the hw may still access it.
>>>
>>> IMHO it would be better to add a "bool alloc_buffer"
>>> parameter to amd_pmf_set_dram_addr() and set that
>>> to true on init and false on resume.
>>>
>>
>> Ok. I have made this change.
>>
>>> Also I guess that this DRAM buffer is used by the new
>>> smartpc mode and specifically by the command send by
>>> amd_pmf_invoke_cmd() work. In that case you really
>>> need to make sure to cancel the work before
>>> freeing the buffer and then re-submit the work
>>> on resume.
>>
>> With some sanity tests, I don't think so this is required. pdev->buf
>> is only used to get the metrics table info. So, I am keeping only the
>> freeing part + alloc_buffer thing and not cancel/resubmit in the
>> suspend/resume.
>>
>> If there are issues in the future because of not including
>> cancel/resubmit thing, can we work that as a bug fix later? Would that
>> be OK for you?
> 
> If you are sure that it is safe to keep the work running
> after your suspend-handler has run and on resume to
> have it running before your resume handler has run
> then yes that is ok.
> 
> This seems unwise though, adding a sync kill of the
> work + requeue is only a couple of lines of code.
> 
> And what about accessing other subsystems like the
> AMD HID sensors, I guess the work item may do that
> too? That esp. seems unwise to do after your
> suspend-handler has run.
> 
> Even if you stop the work from your suspend handler
> you may need to add some dev-links to ensure
> that the PMF linux-device is suspended before
> e.g. the AMD HID sensors. That can be done in
> a follow up patch though.
> 

Sure, thank you. Will address them separately as a followup patch later.

Thanks,
Shyam

> Regards,
> 
> Hans
> 
> 
> 

