Return-Path: <linux-input+bounces-130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A88E57F0BE9
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 07:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC7A51C203BC
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 06:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81AA1FBB;
	Mon, 20 Nov 2023 06:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tVgelmX+"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92992D7;
	Sun, 19 Nov 2023 22:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOdsSD9QQ3cpV/XAV0ireILc9En6bmJmgwvXsCgSjnfyb/gCQHKUQvv+iFEahAhZQmV2adnLZ1KGzLo4tWYLrTDms/svSSCHvg94CgmNjzbO5uqLXjK8aM/c69hAsCqw767GoiaH2pSglca1jAaqvIPqYS1PgcR+f747tn62CvoVk6fG0d96oMO3cfPWVnzVx852py2RhBc7h+wXaW7HbVqeFKrm4Zo/BDHnrxlJGZC1KSKun2BcjhCPmK5u2jJSby71+XZx5Qt6cq/ohFwaBTuK8uWsHy57XgjtPMVs7l0z2vHb0cfK4t8kqI4xyGdla0ccT6KZzLVLnzDgwW7pkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MMr6YXa7THvpqYtBAp8tOSsGd5OFQ7399Hzz5eoyz8=;
 b=kT7LzJ8Zoonu85vByp0AE0Q2m9CCUBp211w9hy9o0xZ5Yec4uxM9rc+puYCQMqS9kYbKJZUs8xk9bSE72Ja7Dd8VNOP/OzaIDlYph83C+Gtj+X4opjlJXO+TNOIm5Y7BAXKX6XnX9UwRb9imeyYAOkdZQjcIwgA6F0y67fkF+AhpHpG7eyfu6ZiwvMvZL2IjgqSk8ZC/2qDqSry9+ic4YlpJHfT1tzm26mq6XvoynwRpSPELTnAZdPDcpwdIcIEhX3AJJDyvhSBnyXPvI4+nO5g8ShITbIh6YyQyJgIdoPpTUXicjF82a4Td1xTlzfdW5FCIymcM8gUxHxePDW+JwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MMr6YXa7THvpqYtBAp8tOSsGd5OFQ7399Hzz5eoyz8=;
 b=tVgelmX+v1uyIrjC4p/udMfiL6p7O2UBgRm2ESVVVjL9M4Q5TswbV/DX6qrISIRfEXMFxf5KHAas7n5vx/srbIo9eYX7OANogQiKxUNj8KoYZZEyjDl3t9TFbzRlHWaxVEW2z9wXUJ6awlZ2anGUI5rZy4WVo5qQTbv7wTG9jMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB4054.namprd12.prod.outlook.com (2603:10b6:610:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 06:39:09 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 06:39:09 +0000
Message-ID: <3dfd31ef-6ad0-407f-b28d-4c4e09dca7ff@amd.com>
Date: Mon, 20 Nov 2023 12:09:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
 <20231117080747.3643990-14-Shyam-sundar.S-k@amd.com>
 <5441440c-a34b-4936-a564-7292713c76c0@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <5441440c-a34b-4936-a564-7292713c76c0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH2PR12MB4054:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdd6149-a874-4a79-862f-08dbe993666d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dr3RVRGsQ4JcO1lJh0yY6wz1h1p8taCM6LjIw+mB1yUNkxCMqHhWQD5XtniahS7K39Nz8Hh2SY/tqCysp5FpiLRE6ImzeYNhu2K7ybrWfMjsNy3zzQ1O4pjZUjWXcF8t8s6Nk0bOtqWU8EmtY9zmxP8Qunfj1vsl9OF+ozpFbRgRsIAohh0W/e9FY7wQLU8dzDoc8i4t0K2KHJHie3HqIzwCYCsYgEa4wUp1gxeMvsRJylRJDsQJJww7C7G0ZAWAvmqnjFpxD8J+WtLl9Y1FYGGHb12iUuzOjMwahmJEa8+Cd4xUYKmcxhFRq+qul5UYQCJc/9/5t4xGv1gRW90+vp4Y+Tfrb0wuMCbjjieDQj2iQw3MdmY/mGRNApYU1JswznaRZs86+xTO9S6Zik5c5Ak2PEIU7CZaICICJcm+7imrF2RLwiEdCSu5gZdJzobJQLfZzrOJ9WU4zDh7mUqbthqJv8NGSXgZ/4ejILgAUpwzp9v3nRKG2d2zmSkxX1664UH/M7hWaBAzjVZC/lriZOMAN7400X4fLzkb9fLBteqlTq2G1fLQvE1mmL4UrSYgHAyYKTnaSv2ZvSJ0tP20jnK7dQNm/g28wOZh8ad5C32tNItSLkI7IFG2JiCzohxqwi2mUivsjNpP9mml61QDNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(6666004)(478600001)(2616005)(6506007)(53546011)(6486002)(26005)(316002)(31686004)(66946007)(66556008)(66476007)(6512007)(38100700002)(8936002)(4326008)(8676002)(31696002)(5660300002)(30864003)(2906002)(41300700001)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUdqa0hWVzZYWlMzQ3B1Rm8zdWFnVFJvemZvN1B5UXk5ZG9WV3BWSURRTS9E?=
 =?utf-8?B?WU9FVDFqMVZlMmJSQWYyZy9pUFkramUwQU95OEhNN2ZYT0dla1RnVlYrYTNH?=
 =?utf-8?B?WmtvNnlZVVZJTjRCWlpROWhpbVIyd1JPbTIxSkJhZ2EyN3ZFV2x0L3NzZFEx?=
 =?utf-8?B?aGlYSE9ycERmelJaU0swRHBTMEhEdjI0YTFnVmo5aDdWTDBFNDJRY3hYck1G?=
 =?utf-8?B?SUlrTGVGK0J2TGpKZGZEc3NTeTVYa0tCSjM0T3dtZklNYWEyaTRBSS9heW9D?=
 =?utf-8?B?eFZCL3MrR0JsTHRvOFNodnNkQUFVNW1ZOFJTc0l2b2pjdzFmclJTOTJSNlhL?=
 =?utf-8?B?ZWpQMGk1VWkxMzI4MWJrWFNkaU5VQTBBcWJTVS9jK1dkR3N4TXhocUNCbWpt?=
 =?utf-8?B?ZHpFYnlGZkk3ZFJLZVVobldRSGduaUxFK20zNnd5NVdVNGVWbzdPK1lZd1RS?=
 =?utf-8?B?SUJPc0I5c1Y1UUZGc1laSTRuYjZnS3JOcS83TGc3RnBaendaRXZuRFp3Vk5n?=
 =?utf-8?B?NzRBTGt4MG9UUDAralBmenNLbi9uUXlJZGhQMm5UVEFhNHI3MGJZQzVJbkt6?=
 =?utf-8?B?OXJBU1BRSSt1OERzNEw5SHFWd0FwSmc4UmhPL2tzOUlqSTlyelIyTVhvMzJm?=
 =?utf-8?B?dUdmT09TN0IvQ213MWl2YlR4RlNzNlpJQmtMaUNoNnJhSURoZzdndEpKRUJX?=
 =?utf-8?B?VnRaaTFSN3YvVk4xMzNOdlptZk5WTkFtcjZLdEtQNkF3MnlVUExobFE2NWQv?=
 =?utf-8?B?Q2VUMTUvclYzUHhnbUl4UWhBTUV5U2RKSENIZFJJVFUwRktxUSt6MlR6aWF6?=
 =?utf-8?B?S0NrbWF3amU3RlR6SU0xOE1KWkh5SktjeUY5N2V4OWN3Y1NVVktTUUJwY0pw?=
 =?utf-8?B?aTU3L0hwRWh4K05JTldBOEh6bExXTFJoSmRxVlMyWENUK0Zkd2JlQUMxMGhw?=
 =?utf-8?B?L0ZBa2M4Wm1SWHh1ODh5YzdoaXJHeEhFejNXNnRwUExiR3RKdW9YWkRnMCtm?=
 =?utf-8?B?VXVQb3grNVdtQ3h4TE96azEwS3FoTFd0TDE0b0dZZ29lUGtHNUJvNE9VaDFw?=
 =?utf-8?B?NWYrcktxYW15Qno1YUViSy9qcDJrWVhmak13UjIwRTBYN1V4eEVXTU4xQ3Fp?=
 =?utf-8?B?bEM0aXZyem1YSWI1YzhMZE13RzhkUnhXR3FmWi9xbXFSWVRzeThPMDNXQ3dx?=
 =?utf-8?B?OXIvOVZyREhlcG90Qy8zMm1haWNDR1IvUjFBNW5PUGMrT2RVUFRrSnM2Nm0v?=
 =?utf-8?B?OUN6bUpmcjB2Tksvdi9rM2RtQ0JPSklBdCtpT3RUM3dJMDU1aG5YaUI3c0Rx?=
 =?utf-8?B?RUhNL0Fwb2Jja1VydVhPajFRU0JtdUpkcjVRUnVnYnZLbVVXaktpNGpSMHI3?=
 =?utf-8?B?UVQ4d3kxKzlYK0J4YjQ2aTF5Nlowc1JKUlQxcitEZ2ZPOEtFcXppWDJSS3hJ?=
 =?utf-8?B?ZFVvNWZHbFE1aU1mOTRZcU84Z1V0MTM1ZzFyR3BuRXpFTVVyaThLR3I1dzNu?=
 =?utf-8?B?U2ZnTHBGaWN1U2hlWDFuTUJhSDR5UGVGb3V3eHFOM3AzU3ZDMkZVVnlYcnhn?=
 =?utf-8?B?UzVaTU1ScVFrNVBUZkpxbmo2cnVkYWtwa1dIK2N6RkNnNFRTRFRUNUs0aGZ0?=
 =?utf-8?B?Ukl0emFyRzd2YmtWSFhBYlNaUGM0R3dBa2MvSi8ySis4WGg3ZDVJRHhtQU8x?=
 =?utf-8?B?QmZmRE9OZ3lDYUd6UEdwVXVtUHBEN001V3czVTZ2Nm5UWTdpMVU2MXA1TXR2?=
 =?utf-8?B?MFVSbVdkbmNRbjlwSzI4K1EyaG1CajUraEZTSGc5OGlCczhKVkRrU3A4MlEr?=
 =?utf-8?B?Qjk4V0FqZ25SYTdtaXl2RnF6N25LNGtQeTh6RzF4UlVQMnJEZ1RTMFh2OVFZ?=
 =?utf-8?B?SGhxMm01QWt3MTIvWDl0OWpVdGhRU2JSaWVwRm5RTllERXEvMVZscUE4NzhJ?=
 =?utf-8?B?Q3VzRlprdW41eDRMbkRRNFI5aUVyWElON0hrbktUb3Jod2gvR3dSanFJb0xX?=
 =?utf-8?B?R0lHTEdGZEhzZUY2T1pqZ3hHakNTUTUveUJ6c29wNGFBZGtYMkpPZTV4YkZ6?=
 =?utf-8?B?V0ZYNHFRNDdIWFRJbU9qeTc4UStXRXh6M2dvWlNCTzRvZlBwSHZMTUhhRUZE?=
 =?utf-8?Q?pyCdMr0SaMtk5MzyFldvcIXtB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdd6149-a874-4a79-862f-08dbe993666d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 06:39:09.4434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6JY6uXzku5K+jxfyvMxrTJEXmNZOqnGfmES6t3szu27pwhs8kUPicZ3PZmOD9AwdBhtTj2yhYGaEDPOsiNZIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4054



On 11/17/2023 11:43 PM, Mario Limonciello wrote:
> On 11/17/2023 02:07, Shyam Sundar S K wrote:
>> In order to provide GPU inputs to TA for the Smart PC solution to
>> work, we
>> need to have interface between the PMF driver and the AMDGPU driver.
>>
>> Add the initial code path for get interface from AMDGPU.
> 
> Make sure you update the commit message when you resumbit v6.
> 
>>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/core.c   |  3 +-
>>   drivers/platform/x86/amd/pmf/pmf.h    | 18 +++++++
>>   drivers/platform/x86/amd/pmf/spc.c    | 41 ++++++++++++++
>>   drivers/platform/x86/amd/pmf/tee-if.c | 77
>> +++++++++++++++++++++++++++
>>   4 files changed, 138 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c
>> b/drivers/platform/x86/amd/pmf/core.c
>> index 4b8156033fa6..9b14a997cd48 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct platform_device
>> *pdev)
>>       }
>>         dev->cpu_id = rdev->device;
>> +    dev->root = rdev;
>>         err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>>       if (err) {
>> @@ -482,4 +483,4 @@ module_platform_driver(amd_pmf_driver);
>>     MODULE_LICENSE("GPL");
>>   MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
>> -MODULE_SOFTDEP("pre: amdtee");
>> +MODULE_SOFTDEP("pre: amdtee amdgpu");
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>> b/drivers/platform/x86/amd/pmf/pmf.h
>> index 8712299ad52b..525308519fa3 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -11,7 +11,11 @@
>>   #ifndef PMF_H
>>   #define PMF_H
>>   +#include <acpi/video.h>
>> +#include <drm/drm_connector.h>
>>   #include <linux/acpi.h>
>> +#include <linux/backlight.h>
>> +#include <linux/pci.h>
>>   #include <linux/platform_profile.h>
>>     #define POLICY_BUF_MAX_SZ        0x4b000
>> @@ -83,6 +87,8 @@
>>   #define TA_OUTPUT_RESERVED_MEM                906
>>   #define MAX_OPERATION_PARAMS                    4
>>   +#define MAX_SUPPORTED_DISPLAY        4
>> +
>>   /* AMD PMF BIOS interfaces */
>>   struct apmf_verify_interface {
>>       u16 size;
>> @@ -194,6 +200,15 @@ enum power_modes {
>>       POWER_MODE_MAX,
>>   };
>>   +struct amd_gpu_pmf_data {
>> +    struct pci_dev *gpu_dev;
>> +    struct backlight_device *raw_bd;
>> +    struct thermal_cooling_device *cooling_dev;
>> +    enum drm_connector_status con_status[MAX_SUPPORTED_DISPLAY];
>> +    int display_count;
>> +    int connector_type[MAX_SUPPORTED_DISPLAY];
>> +};
>> +
>>   struct amd_pmf_dev {
>>       void __iomem *regbase;
>>       void __iomem *smu_virt_addr;
>> @@ -228,9 +243,12 @@ struct amd_pmf_dev {
>>       void *shbuf;
>>       struct delayed_work pb_work;
>>       struct pmf_action_table *prev_data;
>> +    struct amd_gpu_pmf_data gfx_data;
>>       u64 policy_addr;
>>       void *policy_base;
>>       bool smart_pc_enabled;
>> +    struct pci_dev *root;
>> +    struct drm_device *drm_dev;
>>   };
>>     struct apmf_sps_prop_granular {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c
>> b/drivers/platform/x86/amd/pmf/spc.c
>> index 959146fd483f..47ec563088b8 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev
>> *dev, struct ta_pmf_enact_table *
>>       dev_dbg(dev->dev, "Max C0 Residency: %u\n",
>> in->ev_info.max_c0residency);
>>       dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
>>       dev_dbg(dev->dev, "Connected Display Count: %u\n",
>> in->ev_info.monitor_count);
>> +    dev_dbg(dev->dev, "Primary Display Type: %s\n",
>> +        drm_get_connector_type_name(in->ev_info.display_type));
>> +    dev_dbg(dev->dev, "Primary Display State: %s\n",
>> in->ev_info.display_state ?
>> +            "Connected" : "disconnected/unknown");
>>       dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ?
>> "close" : "open");
>>       dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>   }
>> @@ -146,6 +150,41 @@ static int amd_pmf_get_slider_info(struct
>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>       return 0;
>>   }
>>   +static int amd_pmf_get_gfx_data(struct amd_pmf_dev *pmf)
>> +{
>> +    struct drm_connector_list_iter iter;
>> +    struct drm_connector *connector;
>> +    int i = 0;
>> +
>> +    /* Reset the count to zero */
>> +    pmf->gfx_data.display_count = 0;
>> +
>> +    drm_connector_list_iter_begin(pmf->drm_dev, &iter);
>> +    drm_for_each_connector_iter(connector, &iter) {
>> +        if (connector->status == connector_status_connected)
>> +            pmf->gfx_data.display_count++;
>> +        if (connector->status != pmf->gfx_data.con_status[i])
>> +            pmf->gfx_data.con_status[i] = connector->status;
>> +        if (connector->connector_type !=
>> pmf->gfx_data.connector_type[i])
>> +            pmf->gfx_data.connector_type[i] =
>> connector->connector_type;
>> +
>> +        i++;
>> +        if (i >= MAX_SUPPORTED_DISPLAY)
>> +            break;
>> +    }
>> +    drm_connector_list_iter_end(&iter);
>> +
>> +    return 0;
>> +}
>> +
>> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct
>> ta_pmf_enact_table *in)
>> +{
>> +    amd_pmf_get_gfx_data(dev);
>> +    in->ev_info.monitor_count = dev->gfx_data.display_count;
>> +    in->ev_info.display_type = dev->gfx_data.connector_type[0];
>> +    in->ev_info.display_state = dev->gfx_data.con_status[0];
> 
> Can you elaborate on future expansion areas for the TA as it pertains
> to this info?
> 

For now, the planned items are:
- GPU Engine Running Time
- GPU Engine Utilization Percent
- GPU Workload type
- GPU Power

more items are still being worked out from the TA. So definately there
is a need to build the pipe to get information from amdgpu.

> Do you think it's going to need information from more than just the
> first display?

Yes. We are looking at if there is an extended display also. Future,
we can include to see if that behind the dock etc.

But to make it simple, today TA only looks if there is a first display.

> Is monitor count boolean or does it actually care about the count > 1?
> Is it *really* looking at whether the eDP is active (this is what
> would affect power most signifiantly IIUC)?
> 

Not Boolean.

> If this isn't an area that is likely to expand much in the future and
> is really "just about eDP", I wonder if the better answer is a DRM
> helper that is something like:
> 
> bool drm_edp_connected(void);
> 
> If it is likely to expand, it could be a set of multiple helpers.
> 

Ok. Thanks. I will see how it gets shaped up.

>> +}
>> +
>>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct
>> ta_pmf_enact_table *in)
>>   {
>>       /* TA side lid open is 1 and close is 0, hence the ! here */
>> @@ -154,4 +193,6 @@ void amd_pmf_populate_ta_inputs(struct
>> amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>       amd_pmf_get_smu_info(dev, in);
>>       amd_pmf_get_battery_info(dev, in);
>>       amd_pmf_get_slider_info(dev, in);
>> +    if (dev->drm_dev)
>> +        amd_pmf_get_gpu_info(dev, in);
>>   }
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>> b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 81b1bd356e83..82ee2b1c627f 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -10,6 +10,7 @@
>>     #include <linux/debugfs.h>
>>   #include <linux/tee_drv.h>
>> +#include <linux/thermal.h>
>>   #include <linux/uuid.h>
>>   #include "pmf.h"
>>   @@ -422,6 +423,60 @@ static void amd_pmf_tee_deinit(struct
>> amd_pmf_dev *dev)
>>       tee_client_close_context(dev->tee_ctx);
>>   }
>>   +static int amd_pmf_gpu_get_cur_state(struct
>> thermal_cooling_device *cooling_dev,
>> +                     unsigned long *state)
>> +{
>> +    struct backlight_device *bd;
>> +
>> +    if (acpi_video_get_backlight_type() != acpi_backlight_native)
>> +        return -ENODEV;
>> +
>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +    if (!bd)
>> +        return -ENODEV;
>> +
>> +    *state = backlight_get_brightness(bd);
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device
>> *cooling_dev,
>> +                     unsigned long *state)
>> +{
>> +    struct backlight_device *bd;
>> +
>> +    if (acpi_video_get_backlight_type() != acpi_backlight_native)
>> +        return -ENODEV;
>> +
>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +    if (!bd)
>> +        return -ENODEV;
>> +
>> +    if (backlight_is_blank(bd))
>> +        *state = 0;
>> +    else
>> +        *state = bd->props.max_brightness;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>> +    .get_max_state = amd_pmf_gpu_get_max_state,
>> +    .get_cur_state = amd_pmf_gpu_get_cur_state,
>> +};
>> +
>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>> +{
>> +    struct amd_pmf_dev *dev = data;
>> +
>> +    if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>> +        dev->gfx_data.gpu_dev = pdev;
>> +        return 1; /* Stop walking */
>> +    }
>> +
>> +    return 0; /* Continue walking */
>> +}
>> +
>>   int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   {
>>       int ret;
>> @@ -433,10 +488,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev
>> *dev)
>>       INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>       amd_pmf_set_dram_addr(dev);
>>       amd_pmf_get_bios_buffer(dev);
>> +
>>       dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>       if (!dev->prev_data)
>>           return -ENOMEM;
>>   +    pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>> +    if (dev->gfx_data.gpu_dev) {
>> +        dev->drm_dev = pci_get_drvdata(dev->gfx_data.gpu_dev);
> 
> I did see Hans response; but I want to mention that specifically a
> good litmus test whether what you're doing to get the data from GPU
> device side is safe would be to ssh into the machine, stop the GUI and
> then unbind the PCI device from amdgpu driver and make sure nothing
> explodes.
> 
> If it does explode, take PMF out of the picture and see if it was
> caused by what you did or an existing problem.
> 

Ok. I will take a look.

Thanks,
Shyam

> 
>> +        if (!dev->drm_dev)
>> +            return -EINVAL;
>> +
>> +        if (acpi_video_get_backlight_type() != acpi_backlight_native)
>> +            return -ENODEV;
>> +
>> +        dev->gfx_data.raw_bd =
>> backlight_device_get_by_type(BACKLIGHT_RAW);
>> +        if (!dev->gfx_data.raw_bd)
>> +            return -ENODEV;
>> +
>> +        dev->gfx_data.cooling_dev =
>> thermal_cooling_device_register("pmf_gpu_bd",
>> +                                        NULL, &bd_cooling_ops);
>> +        if (IS_ERR(dev->gfx_data.cooling_dev))
>> +            return -ENODEV;
>> +    }
>> +
>>       return dev->smart_pc_enabled;
>>   }
>>   @@ -448,5 +523,7 @@ void amd_pmf_deinit_smart_pc(struct
>> amd_pmf_dev *dev)
>>       kfree(dev->prev_data);
>>       kfree(dev->policy_buf);
>>       cancel_delayed_work_sync(&dev->pb_work);
>> +    if (dev->gfx_data.cooling_dev)
>> +        thermal_cooling_device_unregister(dev->gfx_data.cooling_dev);
>>       amd_pmf_tee_deinit(dev);
>>   }
> 

