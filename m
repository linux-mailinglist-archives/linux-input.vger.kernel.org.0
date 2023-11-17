Return-Path: <linux-input+bounces-123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B58017EFBA0
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 23:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEDADB20B08
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 22:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33414655C;
	Fri, 17 Nov 2023 22:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JERJC2uS"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC196D5B;
	Fri, 17 Nov 2023 14:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GigUaw4OTwcYQIvvP0WCN/akFjvyzIsLX6o8rITLhWZLNwR7H1AO6w/y4ithhpzWde28rtMP2RvTAC0p/jdDdEekwAZTl3KgxKRkJhtcU1/5lFrKJVxgvCxSvCX+X4jzadOyMPS2MmhayvzdA7M0PNUaNEGJxIqRnpN99EmnTxqEuIs7jt29suht6mqIm7TIPf6Wjmu5/5gS6rGnRmZHXzjZy+F+xh641KP+ZFFQwFDPE4/+KJybL06+O68iTQC7Bt/L7V0a2ehIP75v2EzrArB05eQHGFJXom/nxsSVGCIaim9KWUZDsbJmwLiCWIEE4UJA7uxgCJT43E04w+k2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tHXnvzwOq0+C/yCrkza35aoWIvaEYhjTXlAYk60smY=;
 b=k5A/pBC5qaM9e6ZJcegmncH9sZ6rvHx+OFuYddTPDUA2D1EA332VN0fwSNk+6KFXGpuzmxntphOOfL4Ue70Mx5EiOhXYnd9IDhO2C87Lfs+2gOQ8/AgRaxN6P5YRjrPZPpWcnyptUouBOlvk0i4YpB63GdkZf6Dq0V4Pl61nnaEOJrhmZeIC5sHXOfUzdvpn6DXyQkYHTNiGNN91ZQpgyqKcwIgSH2N0IgXBzFTQA/PKCBAw6A1eSeXEn9L6omLFYra/9KsPHeYVczeeDNgG1MnADqtchK1jSn0zROXfzvvTwriYehwU5MmsQPWW2RX1YV5utUXTiVIBb2DwTI9AYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tHXnvzwOq0+C/yCrkza35aoWIvaEYhjTXlAYk60smY=;
 b=JERJC2uSKNvD++zfFyfFNYBQFd76LS+AIxYMrAhrxIppiHm5GZzHIsBDvxSMNWj0QqUFoRSvQG/zAcLgYvHV2rRAEHy6cqG/8Eb59sdhlUAjG4cnAXJ4jJLah2Bnx9l+IgoNiicPcv+3ykCnBQS83XYmdGd3kCQ3hQZOYcScqPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 22:52:39 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7002.019; Fri, 17 Nov 2023
 22:52:39 +0000
Message-ID: <1503b02e-ca3f-4dc6-86f7-90b9136e73bb@amd.com>
Date: Fri, 17 Nov 2023 16:52:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/17] platform/x86/amd/pmf: Make source_as_str() as
 non-static
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
 <20231117080747.3643990-10-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231117080747.3643990-10-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7f4862-56af-4352-6e4e-08dbe7bfe619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7OLtWCxpBMYWbp84Ku5E0NUmwCT3BPLGTjY03xid8GZuSiER6LaUu5fiOP4XDqL9CsxkDoa+Wt1jQZnYrT4odMLzZw1Ejj2CgOBQF0IvR7vLVEys2n/VWBakvd41JjMHwHQHm+LvUWDgvvYW1q0Uf6P1VsVhPd3tVl5BQequouYME9RpSwV5bQaV8wdW2Om7z8oKGRGp4hlSJgZg00hp/e1Qnw1AD+ZkN0XGvhLl+ObdmMu+iBe3CJTDuY4yr/VvMqBGNiXbOqj6sZOgUAfKqmulOPWhNcu/REtL921r94uDG27aU+1Y6Q0obt/US1ipFNZscNW3drg6c0bQqbUeziyPhHHsZ+8sVkjJKbbRV764FDmSAKD8AdwrRCGArCQhBRsvfSCXbeemBfD0+Y2LHo8F10NCkrg8WKyGXbAygzdGJKgBe2wnkZ0ZTnXpCIVWoasesZsnL+OMgRyZ4J/vFDuHoqOVm5ql0ZyZ/6KzpULSpVd5Va2F9izdeWfKsZfqXv6Uu67WlZShHmssj95/sVFIrRuemCd6xzmd5lKW3ExqzbL9Z1BEiNlawWl5kb+yFgGrXXN9/91/JrofgtzyF0m/Zdwnkn69ZLa8u5rwTh/d2Jpr5qWp9Ccz0UxUqbe4b02U9+wCAOZhBvnAcvZ5vQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(8936002)(31686004)(8676002)(4326008)(5660300002)(66556008)(66476007)(44832011)(66946007)(316002)(478600001)(6486002)(83380400001)(31696002)(86362001)(2906002)(26005)(6506007)(53546011)(2616005)(41300700001)(36756003)(6512007)(38100700002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ai9tdENvZVFtV29Rd1ZtYm10RjYydzcveDZWVnE3QmJwZU9CdjNQdTN6U2Jv?=
 =?utf-8?B?encyNmhxOHo4cVBrMWh4VGdWUG1OY0dCYjNhVmQwNWZtK0lWa1ZrUks5Wkxi?=
 =?utf-8?B?VC9mRVhzSW5NeS9jS3Y4dEtDR2pMcXU4YVVxQ29aT0pmQi9xRWlnNytCNFpk?=
 =?utf-8?B?VmY0ZEZHeHNrU3ZINGk4elkxVjBqZ3RvazR0bUhGbDZkMHVYNDNsZGpma3B1?=
 =?utf-8?B?aEpzWXoxM3V4bGFKN0JWbGtuRkVKaXE1Qi9Zd0FkN0tiQVdheWJhS0V6Z2hG?=
 =?utf-8?B?b09zM0NteGZOUytMTFVrRlBmdDFuZjB0K0FxQlhwWGFXbGJXVTBhUVgwRkhk?=
 =?utf-8?B?UlBReW80MjY4eVdKcnBsRVhsU2NubHEzZ1ZETXlPRDJBOVdoN0FOdEFHNlpV?=
 =?utf-8?B?aVppcUtqV2FTV29hSzJKYUdqaTMzdTdiOGFOVk5vcUcwa2JaTnJSY0dzUUdY?=
 =?utf-8?B?OUNTOUhJcmg0bXdmWHhKQjlPYXBnWG5qRWdJb2ZmQU5zUTBzNTc5TW1hbk9G?=
 =?utf-8?B?TFRjRmtVazFUVFNMUzBla0xBdkM3cWFYVmtFam5SbXN4L2JJZitFZHJSSHhN?=
 =?utf-8?B?RDltdU5YakxLb0VOeHBDRExJaWQ4VzJtVEtiZGZWZEdWWlIxcW9ObjQvdFhw?=
 =?utf-8?B?Z0I1SDFLK2NUN3BKem9LZEhGSG1IZW5pbHhGTHp6VzRaUStlTXh2S05CdFRR?=
 =?utf-8?B?VHVPaWNKM1hBRk95N2VTR2pXZHZlNEVoOVo2SlFkYjA2UStFMmI2Y3FCb2Ux?=
 =?utf-8?B?L0U4RUM4Q3A4NFlyUTZLS0Z2V3NkQ2FjSjI5aG02Q3dyQks3QWNZckZ5YVg1?=
 =?utf-8?B?ZW5hMEpGTlFvb0VaL2Ryd3VMdWpwOGN1R01RdlNFNit5ZVpaU1d1OEJUR1Zt?=
 =?utf-8?B?ZGRGMFdpVVB3bmRSbVNQbXMrMHg3Z1N1WUk4bk9uSFRLVXlyVnhzTXNkT0U1?=
 =?utf-8?B?TWplNGVYUTNhU3FiSUJTcWhHbFBWcCs3Rldna0lzNnRuZzdHWi9vcUZlM0Zt?=
 =?utf-8?B?MXp1cmJjbXE5NVhjUldxaERzSjA1VVNzbjJ1Q1pYTjVVWkxtb3Erd2VCcTU2?=
 =?utf-8?B?R0xnRkNTTW1qZGNYZGw3WVRlS2V5bGpkT3F6aTR6TUFNVEFSSWE0NlFkQTds?=
 =?utf-8?B?L0NGN1N4d3VsZUhsWEFENGxQZVhhejFwTlI3ZFFGdzFBdTVTRmlLWjltOW5S?=
 =?utf-8?B?aFRZSWE4MnFNNmtqb3gxZUR0ZSszMmRCN0hvQWN5SnBkdy9QSHMwa2xEd0o4?=
 =?utf-8?B?VG1JZUR4dHRBdWUzU1QwTXNLcnEzR0lxYmZ4WDR0c1dwdkhiNGhjVTVTaEhS?=
 =?utf-8?B?UTF3NlYzeFFUMW03RnNIUHVENVhmVmpSWGRKNkVYa3pVM244eFJPaHJlb1hz?=
 =?utf-8?B?OERPTWFNUmVqaEI4TCtjd1haU2YzRGY2QVFId1JCRkcvcGNOWElRa3FPSENK?=
 =?utf-8?B?cHhqTFdrWUo0NVZwVUxxL3lnOGgvSW1uclRFeHhSVy9RV2FRUnNNeVNSZXZq?=
 =?utf-8?B?QWlhSUdyWWFRVkNCWDBib0wrbTFKTThDUGx2d2VvMDlLd1ZURmhtT2VVMzZM?=
 =?utf-8?B?dDI4R1JnTTRCNWtERzJLbmJwdzJVWTZBWjlRSWVhQ0RuUTZOcW9iNnJ6dlFC?=
 =?utf-8?B?UVNCU0F5bzFFaUtZN204M3NwUE9ndFlySDRqdGN4MnNhZXBHM0MrSlBHdjRU?=
 =?utf-8?B?bmVWY3ZucDVNcGVLMVdhckNHSjZnZUlUeVZrTXF2emtMUWh6OXM0QzJQYzN6?=
 =?utf-8?B?QzBPd3FlZE5KQWVVSWx2NXNUUHZCNXJ6TVJhSkRZNmlkenp0eGVBY2N0Slgz?=
 =?utf-8?B?SVpHUis0NU1PclpxUTluQUJiT2pqWFBKTTVNa1R0YjZIY2FBSm5YRW5YY3dM?=
 =?utf-8?B?RTUrQmF2OUJRZnlkM0lTUVdRVk9KOXBXWFhJUURxOVBkSjcrOUVhTU1paGlL?=
 =?utf-8?B?NjJIL1JEcStFbitJZ1dYcHRIOTBubzRtWFRtclQzTDFkVis2dnlic0kxZDVX?=
 =?utf-8?B?UVVXeEN1cEJ3L0wyRFd1WHI4SURmVnZwWG5yK3dJVURkbmxWUVNCSDZTaDI1?=
 =?utf-8?B?dHZoSi9CYUFyK0x1R3hnVTFPMk1TaTlnTjNKQTZETE92eWg3bm1IU25zUlhW?=
 =?utf-8?Q?HcEzjzAkT2JIbyl6DCehXfkKv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7f4862-56af-4352-6e4e-08dbe7bfe619
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 22:52:38.9926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmGTPcy/P4P+3H/YoYc0XSCSnxQbWk8yVJUJjZQYAdiBkrYKIUBYv5r9jce4lrLs3j6JJCHqcGfSScKA6ishow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189

On 11/17/2023 02:07, Shyam Sundar S K wrote:
> Add amd_pmf prefix to source_as_str() function, so that the function name
> does not look generic. As this is a helper function make it as non-static
> so that it can be reused across multiple PMF features.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/amd/pmf/pmf.h | 1 +
>   drivers/platform/x86/amd/pmf/sps.c | 5 +++--
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index fb9ce2593236..216a9f795436 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -600,6 +600,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>   				    struct apmf_static_slider_granular_output *output);
>   bool is_pprof_balanced(struct amd_pmf_dev *pmf);
>   int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
> +const char *amd_pmf_source_as_str(unsigned int state);
>   
>   
>   int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index a70e67749be3..33e23e25c8b1 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -27,7 +27,7 @@ static const char *slider_as_str(unsigned int state)
>   	}
>   }
>   
> -static const char *source_as_str(unsigned int state)
> +const char *amd_pmf_source_as_str(unsigned int state)
>   {
>   	switch (state) {
>   	case POWER_SOURCE_AC:
> @@ -47,7 +47,8 @@ static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *dat
>   
>   	for (i = 0; i < POWER_SOURCE_MAX; i++) {
>   		for (j = 0; j < POWER_MODE_MAX; j++) {
> -			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
> +			pr_debug("--- Source:%s Mode:%s ---\n", amd_pmf_source_as_str(i),
> +				 slider_as_str(j));
>   			pr_debug("SPL: %u mW\n", data->prop[i][j].spl);
>   			pr_debug("SPPT: %u mW\n", data->prop[i][j].sppt);
>   			pr_debug("SPPT_ApuOnly: %u mW\n", data->prop[i][j].sppt_apu_only);


