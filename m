Return-Path: <linux-input+bounces-116-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8967EF755
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 19:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E3E4B20A39
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 18:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B8A4315D;
	Fri, 17 Nov 2023 18:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z31r/M9e"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07181D5B;
	Fri, 17 Nov 2023 10:13:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMzR0DGe47mM9ycjFggctCrAb82sXOWdyYpdiWSsScqXe9sBfD7WCqet+znG0uxwMNnIZJoUi1Zn5mcbvduT/LCT23/PtCQg1hpT2irbc3YkBRI+tfZ/nOgoYJDkpkwCee4hNGVRpp/ff7sOTKm9rua5L9pfSewLqEzSbcJlvSulF+iB4a9TBkIH5EZ77c3yIsldEG2hpRuCxwaFvC2kJKsiPkQsoElXc/cQi/RgaJqfr5K8LPjwIvk6EzuC3a6GDxV1F1F9GS/Rd9xMb/PhQPRAJd3GXTNJ7IeLYuj9Kece8NYAuyQP2/ddGJUGCYVtDnERhATcYtAjDFD6jFSsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXvn/u4WUx8ixngvg1AHLpXrreeeTYpHW6LAd9cVmLI=;
 b=kxg6i1PmK18NZpu9P7No0uhdJt28rcc+M6TCz68FFtVf+ppG7fGWl2ZBIotdJy6dF1B50QCR2jW5X98uzOnUR3RszlpLzu9haayUAQNFzt8V9nfxXa05RDdSMqWvymFpkOQY8Kxr3OvI06dmPv99ZIBJVi//VXCZ+YyUsEtPESsWlvgewaZKMNib6BUqmKrLrV96YnBbDCcs8xa/WzxTybIZ0wwz3QKMM33vjdzi5emlFNA/vqjnXexHXV0wp7n3xWYHqAAGSrJ5q+85FD2jT0EBkTDRTWT9QdR6hEW8H3emtwSFVo9NCvnsS7LRjSIfPZuBaRxz4mgQ67g7kv1v8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXvn/u4WUx8ixngvg1AHLpXrreeeTYpHW6LAd9cVmLI=;
 b=Z31r/M9etD80PhimflKKxsDNzk+eCNCbTEkaS8rB+6rSmc1b9GY5cbdXrkFQmJ7NeZxOrd8sSOJODMzIPlnCB3/P6tC0WOMyI8y4fkVmaWTexQLewo73uGUG4JLPrt6vZbOmMWMJwdaxFkJgb5F090o/1RW4OWvpVEzz/49yWGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 18:13:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7002.019; Fri, 17 Nov 2023
 18:13:10 +0000
Message-ID: <5441440c-a34b-4936-a564-7292713c76c0@amd.com>
Date: Fri, 17 Nov 2023 12:13:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
 <20231117080747.3643990-14-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231117080747.3643990-14-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0037.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a98f20-a9dd-47a4-e77c-08dbe798dafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0/G3W78kJVAGkKzM4l8yOTgYSH0TbLv9BLEfuGupbYtjrsoc40QCvCKWKmAAtDgIjkknmaodnpTl2HclBLX+CM0ELF3fkAe7ZWXu7R/qSugm9wzhrcLM52Cgur5+VmJGKE3wrykG4uJc17nEZsZ2zI4dcnvmNfU1R/PNG7tW2dCR9v/+hyJGDoamzYXiIItNsmzwXDC8vEJFXJuILDJNRWuWyy97OwlRdH5yd+RbuVQfSwvJFpx0zRV3QO33oFTPVd9gmgjnwyOa11dOHHDh5vNzN6mVt8RskZmo2vd84hr1ITD84Len0CdJKXoSlmxvAoIQ3sKw0vTPur7znuxx6PbS6qLttEeYuW3FpvRfZ9Qvk+BsUTZKqv8YvNEW91Qht594z0cPmDkTPzATf32iKvVm57uEDV4Jjc4WsFGn+MC0r8+JP3aydkfUbmMS+GImo4nhB7wDQtebYV6n09AxI4hzapS83nMp/rgtMLIZwGwl73bqiLfN2mLZZzeMwadfwDE/ObJ0/qCtslbh8NQ0Q1b2wfp2z96cNnrGU45wVxR3jTkXOxcVu3glhhgxdHAwXM9AJZSg+iR9VxnpyKaAMDnvMdnJD7OrxeJ6Xi4pm6DUIxxClEBcMLRfH6VcXRb9M8HZJrUxzgjUmpLHdc6ShQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(136003)(396003)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(44832011)(8676002)(8936002)(316002)(66946007)(66556008)(66476007)(36756003)(41300700001)(31696002)(86362001)(2906002)(38100700002)(5660300002)(4326008)(31686004)(53546011)(478600001)(26005)(2616005)(6512007)(6666004)(6506007)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVdVQXdKSXdUZTJJeHNOZFVIS1hWUXBYS3pwNFNFLzcrNVpwOXNnUDYyWG42?=
 =?utf-8?B?TzEva3kzK01IV3Q5ZDA5aUc4cno2bHhZRlR6alRON3FMUjNIMllDTVNxK1Uw?=
 =?utf-8?B?OWxtMy9BWW96WUFtZkw2MUZDTjdkNzZ0QXlpYlRtZ3dWc253WjFYL2E5WGd2?=
 =?utf-8?B?MU5RbXZjOUk0TXFmM3Z1TUVPaE9VbDNRb3ZhbHBuaW5zNjcvajBWUDlIY3Fv?=
 =?utf-8?B?TGduZ1I1bENYdWJFZ0liT1MyZ0RzdWc1d3ZuQ3B1WU82NlFITUtHNmx2NFIv?=
 =?utf-8?B?SkxxRmRwWmltQkNGNVRDZWJMMkFSc211OUtQNW1tMHFSbk4xN29jVnB0RDZs?=
 =?utf-8?B?SWR0OWZ3QWg2NDUrQ25wRTMvTkRQV3VzUGh2dGRCVGJwMzlOS1hWdXNhV0dM?=
 =?utf-8?B?cFJ5UDlzZ29zUHM2M2dCekVkR2UyellwUUtsWnlma3dUYjlBWUxhaFBweXE0?=
 =?utf-8?B?UnBHWUVMTllKV2l5Wi96L1REUDdyM0xLT1I0cDZxb0NRQmFMSHZZYXVsVDZt?=
 =?utf-8?B?Z3dJaWdOQlB0S1IwTWwvTUk2Q0VDRC9KL0VwQkEzUmZGeU1zQW9iRjVlSEFU?=
 =?utf-8?B?dnBDOTJ3ZlBVcGw2ODBrRDZjNUZ6dWw5cGgzbSt6bW51VlF1OXpqUjlwTGxo?=
 =?utf-8?B?cjRTT2R5SVpwYUxucmVob1VWVXpvdVhNM2FVQW9PQUZHL201cjVtZWpURzhC?=
 =?utf-8?B?OWJwVGovR2dtRFROVWt0YXhaSktnTk9DcXNhdVhacXFkVnNGK05tK1ZFcEV5?=
 =?utf-8?B?QUwxT0tqYm43ZVR6TzdrRU51SnpZSEEwVmxvSE5WeUx6SlJMUDBiSGEvS3dr?=
 =?utf-8?B?c3B6bHpuMU5lSHJMcGVhOVB4Ti9MQmtYcW9XcFFtM1VKVDhjM25DK2lsRm8y?=
 =?utf-8?B?TERFT2hQeHp5WVhjcnRSclBKOHJaaDE5aEljcXduTmRXcmVuL2NVMkhNWm55?=
 =?utf-8?B?d0p5QldxMHB2ZWJQNXpRTmNHbnk1aVdTTlFJK1p6MDF4T3VSczJlSFhLWnd5?=
 =?utf-8?B?TUlqMmNsdWltdTFNQS9xSDZ4TEtYTGFwdnlvSGpDZUlNcE8yaHpTeGlPZjlF?=
 =?utf-8?B?QjByWlozNk9vTDJFdlVBNWFyNkpGaHVadnRBZldMUklGSFdZRzRqUGhXVm9S?=
 =?utf-8?B?Z0lBWklGdE8rT3JPQnF4OEt2VUpJZ0ZVNkN1Y2dTS2kyNkpBU3FMUFovb3JV?=
 =?utf-8?B?T3IrM241QlcrQ3dRYzd0NkhDNWFsYXF6c1VPYkVZVFVwZ3NvVG1WY3dVU294?=
 =?utf-8?B?djE2dklHYmxtSnlxamd0Q2ZLNmdBWWZJK296d3lEVy9IL1FYaWtnTUluczFZ?=
 =?utf-8?B?dDlWc3R5MGR3elVIbjY0Q0h1T1hIZDFmdlFUN0xSSVlNS3hET3dQWXBnK1ZF?=
 =?utf-8?B?NzdGclpLZFZJdUIwUmkrQ0tNQjFBcDlVMEFONmxrQTA1RmVpQmZKRzZ4ZTVZ?=
 =?utf-8?B?bCtHcWJ1WnhnMkQ0OHRzTHRySWltcHFBZmhjbkNKMys0d1RvZTd3ZndBcmFV?=
 =?utf-8?B?dUxNS3BmTFBOeE1iZHFhVktNQWh1SzRnb1pDWDdDbGp3cDVuVEZPTGF0NjVp?=
 =?utf-8?B?T09BYVJtS3lJQ240TW0vYVg5TDdtWE5PeWNaS2JMZGNJTjZSb3pjVzdjYjNu?=
 =?utf-8?B?T1ZnNnR6QkJoNm9tUWtxd0RaRk1BZkJKNUk4bUdTVjcwMVZXTjFVM1pQOUNy?=
 =?utf-8?B?VjZ3N3RndXdlTVNXQVgwSFQ5dElOUmtMV25pZ0tnTmt6OUxCc3dsSjl6Wnpi?=
 =?utf-8?B?ZFBKcmNxUGRxenIyMTlOSzRtRGRqY1p3QUVXZ0wza1o3WnFBZUZFRzNiQmdG?=
 =?utf-8?B?QzRyTTE0WjJ0dEEyMFY3SXY5QzFHNlRKTFpBS2poYmF1NUEvYnJkVVhSdTVx?=
 =?utf-8?B?dEFUZ0xNVG5PaWFDYk03T3E2ZEl4dXlCVkRKY09NeXBEU3hCTDJ6VmcwZzlz?=
 =?utf-8?B?VEJhbUVreXhya3VRaU9VTEtYQnhxUEt4STgzUUVUeUk1NEtJQ0Q2MllxeVdr?=
 =?utf-8?B?L2dsQ3duaDFJcFFUNWtyeVg2c3V5TGorMDVndTc1SllHa3lmMmxYQkRkd1Iw?=
 =?utf-8?B?TGc5ditjSTV2V2NVdE1KWGc4ZWtYOExweGwxUWNJSGNab3lUUFpQU2xlbi9t?=
 =?utf-8?Q?TjGzvpHFYKW5TTueHdLBXygFK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a98f20-a9dd-47a4-e77c-08dbe798dafe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 18:13:10.0073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FU4cC0t6B39lefKiBx/+gObnSS5rtAWz0X0WpgEpGbjHA2X/LojU3MV1CD2Ay/rDXWqy8yGDgHBDlpnkBQKpBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523

On 11/17/2023 02:07, Shyam Sundar S K wrote:
> In order to provide GPU inputs to TA for the Smart PC solution to work, we
> need to have interface between the PMF driver and the AMDGPU driver.
> 
> Add the initial code path for get interface from AMDGPU.

Make sure you update the commit message when you resumbit v6.

> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/core.c   |  3 +-
>   drivers/platform/x86/amd/pmf/pmf.h    | 18 +++++++
>   drivers/platform/x86/amd/pmf/spc.c    | 41 ++++++++++++++
>   drivers/platform/x86/amd/pmf/tee-if.c | 77 +++++++++++++++++++++++++++
>   4 files changed, 138 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 4b8156033fa6..9b14a997cd48 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	}
>   
>   	dev->cpu_id = rdev->device;
> +	dev->root = rdev;
>   
>   	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>   	if (err) {
> @@ -482,4 +483,4 @@ module_platform_driver(amd_pmf_driver);
>   
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
> -MODULE_SOFTDEP("pre: amdtee");
> +MODULE_SOFTDEP("pre: amdtee amdgpu");
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 8712299ad52b..525308519fa3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -11,7 +11,11 @@
>   #ifndef PMF_H
>   #define PMF_H
>   
> +#include <acpi/video.h>
> +#include <drm/drm_connector.h>
>   #include <linux/acpi.h>
> +#include <linux/backlight.h>
> +#include <linux/pci.h>
>   #include <linux/platform_profile.h>
>   
>   #define POLICY_BUF_MAX_SZ		0x4b000
> @@ -83,6 +87,8 @@
>   #define TA_OUTPUT_RESERVED_MEM				906
>   #define MAX_OPERATION_PARAMS					4
>   
> +#define MAX_SUPPORTED_DISPLAY		4
> +
>   /* AMD PMF BIOS interfaces */
>   struct apmf_verify_interface {
>   	u16 size;
> @@ -194,6 +200,15 @@ enum power_modes {
>   	POWER_MODE_MAX,
>   };
>   
> +struct amd_gpu_pmf_data {
> +	struct pci_dev *gpu_dev;
> +	struct backlight_device *raw_bd;
> +	struct thermal_cooling_device *cooling_dev;
> +	enum drm_connector_status con_status[MAX_SUPPORTED_DISPLAY];
> +	int display_count;
> +	int connector_type[MAX_SUPPORTED_DISPLAY];
> +};
> +
>   struct amd_pmf_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;
> @@ -228,9 +243,12 @@ struct amd_pmf_dev {
>   	void *shbuf;
>   	struct delayed_work pb_work;
>   	struct pmf_action_table *prev_data;
> +	struct amd_gpu_pmf_data gfx_data;
>   	u64 policy_addr;
>   	void *policy_base;
>   	bool smart_pc_enabled;
> +	struct pci_dev *root;
> +	struct drm_device *drm_dev;
>   };
>   
>   struct apmf_sps_prop_granular {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 959146fd483f..47ec563088b8 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
>   	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
>   	dev_dbg(dev->dev, "Connected Display Count: %u\n", in->ev_info.monitor_count);
> +	dev_dbg(dev->dev, "Primary Display Type: %s\n",
> +		drm_get_connector_type_name(in->ev_info.display_type));
> +	dev_dbg(dev->dev, "Primary Display State: %s\n", in->ev_info.display_state ?
> +			"Connected" : "disconnected/unknown");
>   	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
> @@ -146,6 +150,41 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>   	return 0;
>   }
>   
> +static int amd_pmf_get_gfx_data(struct amd_pmf_dev *pmf)
> +{
> +	struct drm_connector_list_iter iter;
> +	struct drm_connector *connector;
> +	int i = 0;
> +
> +	/* Reset the count to zero */
> +	pmf->gfx_data.display_count = 0;
> +
> +	drm_connector_list_iter_begin(pmf->drm_dev, &iter);
> +	drm_for_each_connector_iter(connector, &iter) {
> +		if (connector->status == connector_status_connected)
> +			pmf->gfx_data.display_count++;
> +		if (connector->status != pmf->gfx_data.con_status[i])
> +			pmf->gfx_data.con_status[i] = connector->status;
> +		if (connector->connector_type != pmf->gfx_data.connector_type[i])
> +			pmf->gfx_data.connector_type[i] = connector->connector_type;
> +
> +		i++;
> +		if (i >= MAX_SUPPORTED_DISPLAY)
> +			break;
> +	}
> +	drm_connector_list_iter_end(&iter);
> +
> +	return 0;
> +}
> +
> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	amd_pmf_get_gfx_data(dev);
> +	in->ev_info.monitor_count = dev->gfx_data.display_count;
> +	in->ev_info.display_type = dev->gfx_data.connector_type[0];
> +	in->ev_info.display_state = dev->gfx_data.con_status[0];

Can you elaborate on future expansion areas for the TA as it pertains to 
this info?

Do you think it's going to need information from more than just the 
first display?
Is monitor count boolean or does it actually care about the count > 1?
Is it *really* looking at whether the eDP is active (this is what would 
affect power most signifiantly IIUC)?

If this isn't an area that is likely to expand much in the future and is 
really "just about eDP", I wonder if the better answer is a DRM helper 
that is something like:

bool drm_edp_connected(void);

If it is likely to expand, it could be a set of multiple helpers.

> +}
> +
>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>   {
>   	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -154,4 +193,6 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>   	amd_pmf_get_smu_info(dev, in);
>   	amd_pmf_get_battery_info(dev, in);
>   	amd_pmf_get_slider_info(dev, in);
> +	if (dev->drm_dev)
> +		amd_pmf_get_gpu_info(dev, in);
>   }
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 81b1bd356e83..82ee2b1c627f 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -10,6 +10,7 @@
>   
>   #include <linux/debugfs.h>
>   #include <linux/tee_drv.h>
> +#include <linux/thermal.h>
>   #include <linux/uuid.h>
>   #include "pmf.h"
>   
> @@ -422,6 +423,60 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>   	tee_client_close_context(dev->tee_ctx);
>   }
>   
> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
> +				     unsigned long *state)
> +{
> +	struct backlight_device *bd;
> +
> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
> +		return -ENODEV;
> +
> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!bd)
> +		return -ENODEV;
> +
> +	*state = backlight_get_brightness(bd);
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
> +				     unsigned long *state)
> +{
> +	struct backlight_device *bd;
> +
> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
> +		return -ENODEV;
> +
> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!bd)
> +		return -ENODEV;
> +
> +	if (backlight_is_blank(bd))
> +		*state = 0;
> +	else
> +		*state = bd->props.max_brightness;
> +
> +	return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
> +	.get_max_state = amd_pmf_gpu_get_max_state,
> +	.get_cur_state = amd_pmf_gpu_get_cur_state,
> +};
> +
> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
> +{
> +	struct amd_pmf_dev *dev = data;
> +
> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
> +		dev->gfx_data.gpu_dev = pdev;
> +		return 1; /* Stop walking */
> +	}
> +
> +	return 0; /* Continue walking */
> +}
> +
>   int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   {
>   	int ret;
> @@ -433,10 +488,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>   	amd_pmf_set_dram_addr(dev);
>   	amd_pmf_get_bios_buffer(dev);
> +
>   	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>   	if (!dev->prev_data)
>   		return -ENOMEM;
>   
> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
> +	if (dev->gfx_data.gpu_dev) {
> +		dev->drm_dev = pci_get_drvdata(dev->gfx_data.gpu_dev);

I did see Hans response; but I want to mention that specifically a good 
litmus test whether what you're doing to get the data from GPU device 
side is safe would be to ssh into the machine, stop the GUI and then 
unbind the PCI device from amdgpu driver and make sure nothing explodes.

If it does explode, take PMF out of the picture and see if it was caused 
by what you did or an existing problem.


> +		if (!dev->drm_dev)
> +			return -EINVAL;
> +
> +		if (acpi_video_get_backlight_type() != acpi_backlight_native)
> +			return -ENODEV;
> +
> +		dev->gfx_data.raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +		if (!dev->gfx_data.raw_bd)
> +			return -ENODEV;
> +
> +		dev->gfx_data.cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
> +									    NULL, &bd_cooling_ops);
> +		if (IS_ERR(dev->gfx_data.cooling_dev))
> +			return -ENODEV;
> +	}
> +
>   	return dev->smart_pc_enabled;
>   }
>   
> @@ -448,5 +523,7 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>   	kfree(dev->prev_data);
>   	kfree(dev->policy_buf);
>   	cancel_delayed_work_sync(&dev->pb_work);
> +	if (dev->gfx_data.cooling_dev)
> +		thermal_cooling_device_unregister(dev->gfx_data.cooling_dev);
>   	amd_pmf_tee_deinit(dev);
>   }


