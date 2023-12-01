Return-Path: <linux-input+bounces-367-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCBB800833
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 11:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68592281332
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 10:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FA320B1A;
	Fri,  1 Dec 2023 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gltoQouJ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EABEDC;
	Fri,  1 Dec 2023 02:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMR3wugNdfM0uGBwqba6EBDVW/Vhv2mWrDV4h8j3mmVhUXscgjxw7LdW/S5oRfD4bYhRZ33RTnjB3Q8mlrvMeNtPjuRUdH/u1WXO8RITAwupjok8DZ2Xq6cnCApwZo9x31jUswIBnnCiNZp8H7E3immEdrSbQDRbHTZy97Aw6/8J2gqVmyoaIpzV18h8n4ZNUTEgwLIkcBE2yf6vw7QmICXq4q3ht1uo//9UpxPlM5Gdacpq5+9Fp8hyWsMHQ7jYj6S4eS6kHHaITSLP2AtCrT/ywbOyZ1uPrbVcxGtudlScZNAl4hZd1nTYA43wSeGh78/4Au5ftVT76UCLpFY1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsMbW2o/uBKqHvt7LJIwuxQ1jdRCHc10ngvoXZI63tI=;
 b=c48ZcmhWZ21tkRlSlEOCFdzTgoUCn4Wbz0QT00thCaYfAsWpKYiltfkBwNpHaFyHgPKkdGegxAH+0CN3xJVuGJJtmPfCZl5QY3ZRa2pykPawXZXnebT9BZqQ4XUeThunBH3g+uiEpMXbmnkQzZk4Yekc7TvSsIwlZaQrCXPokgNZE+moKMGZ6jR+nF17OanKlnxoC7aFNEM5lpBkt3PfMs7oxP4mAo9Eiqx/I7A9DDWhmN2AgayYiAgstu6hjfzvxCa7h3iewgTUnni8558mRvp0yc31lDiuflfR5PP/jNCqJRXTXO8hH/ou98aSfZWJw/n0rK6gPV6RsoJ6skh7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsMbW2o/uBKqHvt7LJIwuxQ1jdRCHc10ngvoXZI63tI=;
 b=gltoQouJGOoPTKWj/yfvWle3ASXiqVd4J2Hhu4ReSMGQgSFT6QdENkiy+cao/ewXVALffa59fvpq9r1f7RncRRLACtpZcyqqJbNzIlNGZEKtqIN9X8hjqsAjEMh3rmpSxRgnEMPb7sIa2/IWcddg83pR2eaW55uefx8DYre8cKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5078.namprd12.prod.outlook.com (2603:10b6:208:313::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 10:29:18 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 10:29:18 +0000
Message-ID: <850bc703-9109-4e2d-b36a-3dfb80318c64@amd.com>
Date: Fri, 1 Dec 2023 15:59:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] platform/x86/amd/pmf: Add capability to sideload
 of policy binary
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
 <20231117080747.3643990-12-Shyam-sundar.S-k@amd.com>
 <58ccd66-7229-4c83-fa86-ea7d7ff96068@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <58ccd66-7229-4c83-fa86-ea7d7ff96068@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::23) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BL1PR12MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a0588b-41d6-4d0c-2761-08dbf2585f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8oUWQ67efERrLAEEm2TCtsDGBdF8d26FK7h/5q5NrO+SLlQA1uWC6jGttiki9elAF2IOJNwpY/WdkLBj+2W1GQ/YHeKUbgTqGh1yXOoYIxtqg7XfUQJNZlF/wfTnM6y++hF1LsvwFOJGj4VpNNxP0jQqOG7fhkvh/3JupG0xRQze8KgX2a37ac+NmSPx3ZPOk7RUsTZVUwoKq27eaJr0YsEOwsI2ovA9FhS2OjzJu3UAOFnAZ2Ve8eP/JMAO81H9wyFpYUpKvyKZQG5+Xam2HDAnLtsZiznEOzEIW1pfd4UPFpLZU73+xG2IZCF3hk5ephpOpD/7hiwNc9xWc2MFGowLAQJLxGs9BdBdr+lQYKoH81RszdTaFseEbtH9N1mFQeLaGKQhYdewlh6txXYTwWrthf45YN6QOUgbYPXaaMXQDg3Q4DwiVYuIyXhTChu7Ljpym2gjNrhgmzaXEH+4Olfa9lNYH8KFDH21XXd6cFomEwuZWMFNSSb7hqvYlhEN1J4Lx6h4DeGdzrJYPO3gxf2m8R1hJ3l04ldCFSPS8g+U1AeDkcwuKvPZYAyspBkjiai+7TlXcgzcJL6cAkm+FaJlkrzbnlZ52MwqTZ5QOvmT7RNMP+zoth+qFqcfPM78D+c4zBjv3C4z11/XylTBJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(66574015)(83380400001)(26005)(6486002)(478600001)(6666004)(53546011)(2616005)(6512007)(6506007)(8936002)(66556008)(66946007)(66476007)(4326008)(316002)(6916009)(8676002)(38100700002)(31686004)(31696002)(5660300002)(2906002)(86362001)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVVOMXBRMHg4bWtDSUdwcDNRNnRWR081QkZJZHVLYW14Z1daN1ZDbGxtcEdn?=
 =?utf-8?B?Z2h0dm1vQXBPMk00cjcwWE1hZWZNTHJKeFVHMlpYbHZtQ1FQUVpmaHYxbE9I?=
 =?utf-8?B?VzlrSnlmdG5abWR4WW9sSHZPcVNpOVQySnhQVjhFZ08zU1NGVy9nVkNYM2Jl?=
 =?utf-8?B?c2hCTzc2eWN5ZGJhQ2tGZTlMTkJDazA0emQ1SmdVRmc3LzBTblhtN3dhZHZI?=
 =?utf-8?B?WjArWE1WYkpqUm5BTUM4MDZIaWFLaTRrN0Qya0NwR0VGWms1TTZWQnZ6M05B?=
 =?utf-8?B?Qy9PSEltdnJuc0N1ekV2TmZCMVBDMEZiZURxc1Z5MkhoTmovMHZYb1BLYmpG?=
 =?utf-8?B?bUxFNjJEKzF3TDJFWmRmVGdycWNGWHNCZ2o4MmwrZlMxWTdsZlk4RTR5dXI0?=
 =?utf-8?B?RDdGUW04ZStoQy9WaTB0SFNEd3NQaktDeWlyd05ES2M1WFJLQWxTT0p3bEdj?=
 =?utf-8?B?dEIvUWRDV2p3UXh6MTUwWUV2amIyeDZWS0k3ME1OcHlsN3lXMWNTdkpGckQz?=
 =?utf-8?B?S0tVbTl0djZCK21EMWlxMWlLZFo2d3dWSWw5cy9CYkRMcGsvWS90RnJ4NmRH?=
 =?utf-8?B?LzlHVWwyRnUxaytpRC8rYXNwcm56RUFUUjhVUzk1eW9tOWZ1RjJLWEJkK0d0?=
 =?utf-8?B?RDhYeHJ2Sm5JL3J2aUtWU0tTV1IvSEU2WCtZQndlRHN2T0xpaTZMOTRqSW5a?=
 =?utf-8?B?d0lXKzdEdEQzY0lHZFlVOXRHUTEyc09McS94bUpwKy9aTXIrclcxK0JsNTVW?=
 =?utf-8?B?UlJkTW5aSlA4VGgycW9aUUowalZEL2NYT1E2NGw4UHJGRndqNmk5Q05hdklr?=
 =?utf-8?B?RUg1MjFUc2s3WlF1L0Z3aEhEUmplazVhMEdWdnlpeHFpYTJUQ2FvZ1hGUGcw?=
 =?utf-8?B?cXc1RFJ1cGY4MzBXSU1qU24vSFg0Ky9NUXlwOTFlSlNOcDdyWVZCeEthc1Nm?=
 =?utf-8?B?UHdkcHRPWkxxdUowQXlLMjFLdWU4cDNjU2kvT1A5OTNUVEh6UnNMU2lvSjg0?=
 =?utf-8?B?VGZySC95cXd3Ni9sUnY0dUhDTTlNU1cyQXlHbjdmc0hGUzBjL0ViRy9WZVBy?=
 =?utf-8?B?R080WnNsNkJ1V3FwZTdZbEdwR2FPNGxaajNkNmFJZUwyOXBzUkMyUFlTSmZL?=
 =?utf-8?B?SThXQjNLYU90RHJ3djg2SGxpZ0V5TzFXWG05MXVncERhSHJCNjZITDREc2NW?=
 =?utf-8?B?eGkzY3FwYlZ4TEttZ3M1RGJNRERnU3lySXVKRFQ4dTR1Tjg3TGdvVzh0Yllx?=
 =?utf-8?B?bXVQOGtudVpwYzhtMWVFUW9TU0IyTFpMYXpKS2pydjZpOHgxR2Y2SlBlK21k?=
 =?utf-8?B?YVNCTWxtM3dMYXlPNm9EeS95d2lMNWVJcTFjOURocXNqNnpqWVJ2WWRNbm1k?=
 =?utf-8?B?aS8yTUpXQkpKK0kyVXoyN0wrNEFCNDBoditWbkh0bG5jelJabG11RXZndVRL?=
 =?utf-8?B?ZEZlemJuV2NGeEFYNWV6Zm8yWFpIc1daYStvTzhwTEx0VENzYi9vd084UW9Q?=
 =?utf-8?B?bVFZaHJUMlJPa2JicHNJWjdGdUd5bHQ1SnA5a0ZEQk9aMUFZTEFuME0rc1hL?=
 =?utf-8?B?NC92U3A5Rm1HMDl2VHYxaFptejMrVWk0MmpMU29hV3NwdllhOFNYV2pHUzgv?=
 =?utf-8?B?NzBWOXZWSm9iMTVDRkhpdXdFaHk2WDVOUjFlTzd1S1VnV3V0a2xYYzQ0OVVp?=
 =?utf-8?B?bm1jRnF0YmFaN0lZTHV5V2Q4cTZwNUVFQnFHV012VjlzakhodmRiVmw2RUtl?=
 =?utf-8?B?clhheWV2Z3VhZ3pZSlFQOTJ1NldEK1UwckpnTmhQdllqQlFzaGdPWk9ZeDBS?=
 =?utf-8?B?djVsM2gzUHRuVWNwdUY2bStMOVBadCtMRjR6Zm81WUtBdDVWT3pMNmRBdS9N?=
 =?utf-8?B?SWtzL0JmZHFyZ05hdi9OR0NiUWI5YVQ3ZXlWMk1hWGJNbDB6QWhwS0pvZHR5?=
 =?utf-8?B?OWpSRDVRNURydWlBWW9WTUpCcmFoSEp6QzU4NjlUWldSVHNkVEVxOTFPaU12?=
 =?utf-8?B?cmpNTVg5MTkremNWS2tZM3h0WENFY1RaeHdsVE5kdVAyNlVrczFnS3FZbEZL?=
 =?utf-8?B?cUdqWmU2dGRVellVaWcwR0oxOSt6Rk14QkxnSnpUd2xwY0tJNW5MNk5PSG1P?=
 =?utf-8?Q?qpm/NYKBIXTwk8XK9fqL8xFMd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a0588b-41d6-4d0c-2761-08dbf2585f9e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 10:29:18.3406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtZwN5l6odad1bMqrxp0cFEI1RYAf7MFtDbqw9Vcf9QXI4TzxzT+3wqWCdSYE3vYxPZKJYnolxi45bsW3tI7dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5078

Hi Ilpo,

On 11/21/2023 5:47 PM, Ilpo Järvinen wrote:
> On Fri, 17 Nov 2023, Shyam Sundar S K wrote:
> 
>> A policy binary is OS agnostic, and the same policies are expected to work
>> across the OSes.  At times it becomes difficult to debug when the policies
>> inside the policy binaries starts to misbehave. Add a way to sideload such
>> policies independently to debug them via a debugfs entry.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
> 
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 5f10e5c6335e..f73663c629fe 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> 
>> +#ifdef CONFIG_AMD_PMF_DEBUG
>> +static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>> +				   size_t length, loff_t *pos)
>> +{
>> +	struct amd_pmf_dev *dev = filp->private_data;
>> +	int ret;
>> +
>> +	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
>> +	if (length > POLICY_BUF_MAX_SZ || length == 0)
>> +		return -EINVAL;
>> +
>> +	dev->policy_sz = length;
>> +	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>> +		return -EFAULT;
>> +
>> +	ret = amd_pmf_start_policy_engine(dev);
> 
> Is this call safe against concurrent invocations from two racing writes?
> 
> Other than that, this change looked fine.


This path gets enabled only when CONFIG_AMD_PMF_DEBUG option is
enabled. Also when enabled, did not observe anything really unusual
(like races). So I have retained the same code in v6.

Kindly take a look.

Thanks,
Shyam

> 
>> +	if (ret)
>> +		return -EINVAL;
>> +
>> +	return length;
>> +}
> 
> 

