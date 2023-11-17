Return-Path: <linux-input+bounces-112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC567EF16A
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 12:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39D01B2098E
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 11:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA691199D6;
	Fri, 17 Nov 2023 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZXE5I0eF"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E89EB3;
	Fri, 17 Nov 2023 03:08:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAyWbYI1wQY9qi6YGbng7rfJEtxCKvToXaCmijYlYvMT2ZzJxd4JB0t4upo6fnTk4cvQ2Zj5QnAftitgJg89tZ9c9vkl/0jl4/Zz3ufwTD14WXwerfo5SMW1sPEVwl+Qs7Dku0aKuj7bS/aQKQklWWhzWA66nJQByvmWtyItYLDVgs2sk3Xh1qgduMzYY4S5cE611vQ40PB6V7ttrgMW6YczrpxQ0dkIa34P7MhNErrq6H39e19Rr5uWPd7jGjHL72OfmMtUTPQ4hDzsjNB/5dH4GVdnVWOWIPo/qEJGmnQYetzWyK4FNqj0II2Gx5nmF4XRs2ZJchUOjSmyKj+8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbFiOHMBjVNI15ynr7Bx55PxF9bWxvHqhLfnuw0zNyk=;
 b=mqvwfWew8q6JnAsxtZQ9D7bUJN1WEq1SQnds+tVY+nHbB0TKznMke3A66houwDkn0tI1xJJ4u+RHwM2TRlkcw2emKw6tbaYskwPeoLxN1qJloVcpt9el/0adnl3scZ79qKvpOqY0h4o4R3euXrTJItxyGydZooF/Pyq8sYh3W8fZPBizsxg9AmWqYuYN1AYWllQ6HcZiC1NmJ5l4l4syKiVZvgAAhozKDpqiRRgGFO0fjK7yVAfOtifIFbGJz/2f7X3UmBgfeT/VgZXvs/BuN8a8TgIUlD/SUutuCkT214SWoL33WZYliF5HUBDVD2gGorr4spivuEApT8ozrOiJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbFiOHMBjVNI15ynr7Bx55PxF9bWxvHqhLfnuw0zNyk=;
 b=ZXE5I0eFybSs2bphGz2VqSSoaplSO8fQfgA2O5Q58cOZsz1E+TsnD4ahPpoZF7I4LzPIExbUkfy3uIqFPYPU9/Eq1VCSyKFm0DHD7Xwxrc3+a3SXOI8mBoDpiTWlf9RSrocGg/DLytgEe4dMoaaNlSybpTwfGYr+0EqraOdV6yU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Fri, 17 Nov
 2023 11:08:38 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 11:08:38 +0000
Message-ID: <e4811bf6-2387-42a1-ae8e-7af172d6a97c@amd.com>
Date: Fri, 17 Nov 2023 16:38:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
To: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
 <20231117080747.3643990-14-Shyam-sundar.S-k@amd.com>
 <80b8c5fe-e81b-4e05-bf21-19351c51d767@redhat.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <80b8c5fe-e81b-4e05-bf21-19351c51d767@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM6PR12MB4156:EE_
X-MS-Office365-Filtering-Correlation-Id: afb2bdf3-8341-4b2b-f7bd-08dbe75d8cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/d9S2a9QZieyxmoInAHWXzi+1aJW2LxTHvbzvfuRc4RLq0I+dYC/MNnAtnAG+szmxaAH6qNF++KcWwDod83FCovLp9qzebnWLQAsNFSWw4rxwtBTUYs+lbfEawhX+US3rrhZ0dCg6UsS+0+vXHSaN3sYybiTKLsDHwfzVF+7G0IxF9SKHPQZFbyAbcKF4rz5J2STZ08A5MsSmFa3p4ot5muuiUEM3NbV+GxYMR5AEmf2OC7UM9tek5JHY4QUy98Z8eoJpaHq6K9Jxc2hZFAAO2OEMWn1Sjb3LvAfMO3h5Y/q81oZNT+79j1R8VFy6hjnCZsEiZbCWefMpcp4hhLT0rJNC7GDYqtldP64e/R1uv4/aRlYXEE1X5xvRHPB2IdnNqyuFXDk41ZYFxG1+T/RZ/HFg6uDfWz6lTtVDJi4UVkjkWUlPMVysUBPyYOc6TUsfH9y5OT/Evxqjh+gykkM+epU2aUxR5xMjKRKgiYQgMVbD5t8x4Nso3E7x/VPI3gbmkphHZkR139DuyGJF/R6a9E4Tp2iVsaK2IQP/BT8P7aQTkGLnitzxwHBIl4hvOYHt80xu9jXmhJcKKJeCnymqMA9pq3KPeexM1EidOuj/jzwBp2ieLO/qaaF2TqcddJ+hckm0SRHsUXSXcShGYVyeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6512007)(26005)(66556008)(6486002)(2616005)(478600001)(66946007)(36756003)(8936002)(31696002)(8676002)(41300700001)(86362001)(5660300002)(2906002)(30864003)(66476007)(4326008)(316002)(54906003)(6506007)(6666004)(53546011)(38100700002)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wmhmem42WnZMZFlqN2N2MktHY3VGOHNMaHdRK2NnellYOTN1VGhEOFcwQTBQ?=
 =?utf-8?B?WnFhQ21kVWZLUFBwcytNUHBBZERUSXl3ejlKMTJlMnFBdEd6UllMV1dWMEZw?=
 =?utf-8?B?NzU3cDJpZFB1YlJITjlWKzJPc09UNWxEaTRtalpUZGR1SjcwNUVpL29teHVF?=
 =?utf-8?B?c0pBbWo3ZjBLblhSMjEwclQyYkpSdEdjWkxjSGZhazN4S1hVeEZIdjRVSzlu?=
 =?utf-8?B?VUdSMFo4clQ1S3p5amZUclFsRU0zQWsxREZVRWN3cHh5blZWRGtWZngvS0hz?=
 =?utf-8?B?aExiQ2tSdUhsN1puMDBNRHV6b3Nna3RLVW1MZGVYYlFYTVhHdXVhU3BUdWtH?=
 =?utf-8?B?UlZ6SUFyTEtPNnJqTERsaUhvTmk0Y0h0REVla0dOOWNDZkkxbEZmUnZRaE1V?=
 =?utf-8?B?TmIvdmt0VHpxLzk5dXZUalBQVmxGZm4rMUw1UzE5dGRxOE9GUkZQVUhSNWdk?=
 =?utf-8?B?MGttd2lSelVyVm4yUmJ3QmNFbUNrbCtZUTNJelRvWkNadUFQS3dpblJ5K2RW?=
 =?utf-8?B?WXl5UWRLRS9YT1RobGY5WWZLaVZONm5HTmgybkVZYTRCUk1lRHVKK3JVUExB?=
 =?utf-8?B?K2F1ZmJzRHZ0WTFxcHhGUEgxa3pTNWl1ZVRqRHRmalNWOUxQcCtJcHZrMGZQ?=
 =?utf-8?B?bCtpbmRKNTlmajk0T1ZPSUg2ZDVIVkdXWjE2WjZQc2xZTDJleGxSNmd5MS9w?=
 =?utf-8?B?TlNDazJra3FlMW9LRlpzRnpRNG9NYkQ2UzJMeFR4UHVWWmU3MjU4Z1lGTkQ3?=
 =?utf-8?B?cnpRWnMxb1Y3RUVneVo1TWY5NWZFS0JWeDJ4a0VCa1BHOHpVcjFRbFpvMGxC?=
 =?utf-8?B?RVhGcHUxZlJ5Q2w2dGJ3MmN5RDFwT2dDM1g0QU1RZ240WVZLNG5vS094OGFP?=
 =?utf-8?B?UktMWVhCSHd4WjVQQzZJZHgrZ1czZEFsU3BxYVBwa053d3VhV1cxNkhrSjJF?=
 =?utf-8?B?bU0yc2hQZmlKR3YvN1dqUklsb3l2YXYySXZwS2dKTkZlSlozU1M1UytKUFc2?=
 =?utf-8?B?SS96T0wyZDkyOEYyRGovMjNFZFFsYWp0WHk2emdNeTZ4U2FuUTZlc0kzMmFK?=
 =?utf-8?B?OTJzWDYxSytUSVNOYmZrMWFYcUtzZnZubTFnbC9ZVnN2L1FVWjN5VUExNFF5?=
 =?utf-8?B?aVJET0pNL2JyU1VYaStKaE5zRnpEOUtaLzlVbHNKK3JHUTVveXYyV011c2lM?=
 =?utf-8?B?V1ZiVTh4R0ZpZVhleGhXRjgwb1VXOVN6OHRmZUdTeGVJcDAzbVp3S1pjMm85?=
 =?utf-8?B?T3NIV2E3bjUraG5OekFCT3lUaE5qcVduemVwQ2c4cHNxR2xXR2hVVTU3SldS?=
 =?utf-8?B?REpWcUtuRDRZSXVGNXEybUkxcUQ4VlpvbEFsTnNDQlNXb2FvZVcxbHUxVVZV?=
 =?utf-8?B?d3U4R1hZaG01UzIxd1Fia0lWTFMxOXBEYjFrbmt3V1RacVAxaEVNUkRmUnVC?=
 =?utf-8?B?M1RUT1NhWS9EYTFXNFdBZkRkMjJ0NllpZllYL1YzUkJqR3hWYnpQb1Vnai9U?=
 =?utf-8?B?UXRaOCt3YmRLcnltVkppTlZka3RGenMxRmoraFNLS2FFdkZzbldPdmNkTGk4?=
 =?utf-8?B?dFdOdW1nbVo0MmJpYTdKd3Y3VmhBUlIydjV5cnVNM1lBRlhDQmxYNklHOVhL?=
 =?utf-8?B?SW82Z1NsY0g0TFc5cUdseDg3K1VUMkN5blJsdFZLdEh3VisxVkl3UXFiMlJK?=
 =?utf-8?B?ZVRoTE4wNUtsdi9pNVEwakRXeGwzbmkyaHpPcndGa210TUhmcS9ZcXFXdHlG?=
 =?utf-8?B?RDFKT3AxbmxUV1NLVjhhMHRZREQ5ajdQWTZWM0M2bC9EcTk4V2NsVGxGNFh2?=
 =?utf-8?B?N3N6Y3BDc1pQbVBvbXdPUm1GWHRhTVd3OUhZMmhVU3lrQngyajdUVWM0Tkc1?=
 =?utf-8?B?RGVJbEE0Mzg4Smh4SzN6Q21KdEJuSjkreEhwR3BIejNjZXo3RmhhcUNoaHhM?=
 =?utf-8?B?RTF5Q3lGSC9mY2hoSzdtWXhDZjdDK3g0eTVMb3UxcUxRenZYbDAwY3dUNUtF?=
 =?utf-8?B?bVkwbm9JRytCYUVQZ3JOTTE3bE9SNGJFaWpqdmR4SWp4ZVd0UGlXZ010N0sw?=
 =?utf-8?B?N29UV083ZVl2aWlobmxDRy9nY2wvM3MxdjFsZHRqWkNJVjhYVjloTzJUZjMr?=
 =?utf-8?Q?NnBzE/q/rPbxgEK/Q9QR27okb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb2bdf3-8341-4b2b-f7bd-08dbe75d8cdb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 11:08:38.7653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGv6/WGgqDZ4g9cY1b1bPMT3nVbQ30Lo9PeF4uF6zUWud3UjXRuEmmVBysG8M3t5znVVaYiEc0B3Id1sjILOBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156

Adding AMDGPU folks (Alex and Christian) - I had to drop them as the
changes from amdgpu were moved to PMF driver.

Hi Hans,


On 11/17/2023 4:18 PM, Hans de Goede wrote:
> Hi Shyam,
> 
> On 11/17/23 09:07, Shyam Sundar S K wrote:
>> In order to provide GPU inputs to TA for the Smart PC solution to work, we
>> need to have interface between the PMF driver and the AMDGPU driver.
>>
>> Add the initial code path for get interface from AMDGPU.
>>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/core.c   |  3 +-
>>  drivers/platform/x86/amd/pmf/pmf.h    | 18 +++++++
>>  drivers/platform/x86/amd/pmf/spc.c    | 41 ++++++++++++++
>>  drivers/platform/x86/amd/pmf/tee-if.c | 77 +++++++++++++++++++++++++++
>>  4 files changed, 138 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 4b8156033fa6..9b14a997cd48 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	dev->cpu_id = rdev->device;
>> +	dev->root = rdev;
>>  
>>  	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>>  	if (err) {
>> @@ -482,4 +483,4 @@ module_platform_driver(amd_pmf_driver);
>>  
>>  MODULE_LICENSE("GPL");
>>  MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
>> -MODULE_SOFTDEP("pre: amdtee");
>> +MODULE_SOFTDEP("pre: amdtee amdgpu");
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 8712299ad52b..525308519fa3 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -11,7 +11,11 @@
>>  #ifndef PMF_H
>>  #define PMF_H
>>  
>> +#include <acpi/video.h>
>> +#include <drm/drm_connector.h>
>>  #include <linux/acpi.h>
>> +#include <linux/backlight.h>
>> +#include <linux/pci.h>
>>  #include <linux/platform_profile.h>
>>  
>>  #define POLICY_BUF_MAX_SZ		0x4b000
>> @@ -83,6 +87,8 @@
>>  #define TA_OUTPUT_RESERVED_MEM				906
>>  #define MAX_OPERATION_PARAMS					4
>>  
>> +#define MAX_SUPPORTED_DISPLAY		4
>> +
>>  /* AMD PMF BIOS interfaces */
>>  struct apmf_verify_interface {
>>  	u16 size;
>> @@ -194,6 +200,15 @@ enum power_modes {
>>  	POWER_MODE_MAX,
>>  };
>>  
>> +struct amd_gpu_pmf_data {
>> +	struct pci_dev *gpu_dev;
>> +	struct backlight_device *raw_bd;
>> +	struct thermal_cooling_device *cooling_dev;
>> +	enum drm_connector_status con_status[MAX_SUPPORTED_DISPLAY];
>> +	int display_count;
>> +	int connector_type[MAX_SUPPORTED_DISPLAY];
>> +};
>> +
>>  struct amd_pmf_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -228,9 +243,12 @@ struct amd_pmf_dev {
>>  	void *shbuf;
>>  	struct delayed_work pb_work;
>>  	struct pmf_action_table *prev_data;
>> +	struct amd_gpu_pmf_data gfx_data;
>>  	u64 policy_addr;
>>  	void *policy_base;
>>  	bool smart_pc_enabled;
>> +	struct pci_dev *root;
>> +	struct drm_device *drm_dev;
>>  };
>>  
>>  struct apmf_sps_prop_granular {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 959146fd483f..47ec563088b8 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>  	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
>>  	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
>>  	dev_dbg(dev->dev, "Connected Display Count: %u\n", in->ev_info.monitor_count);
>> +	dev_dbg(dev->dev, "Primary Display Type: %s\n",
>> +		drm_get_connector_type_name(in->ev_info.display_type));
>> +	dev_dbg(dev->dev, "Primary Display State: %s\n", in->ev_info.display_state ?
>> +			"Connected" : "disconnected/unknown");
>>  	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
>>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>  }
>> @@ -146,6 +150,41 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  	return 0;
>>  }
>>  
>> +static int amd_pmf_get_gfx_data(struct amd_pmf_dev *pmf)
>> +{
>> +	struct drm_connector_list_iter iter;
>> +	struct drm_connector *connector;
>> +	int i = 0;
>> +
>> +	/* Reset the count to zero */
>> +	pmf->gfx_data.display_count = 0;
>> +
>> +	drm_connector_list_iter_begin(pmf->drm_dev, &iter);
>> +	drm_for_each_connector_iter(connector, &iter) {
>> +		if (connector->status == connector_status_connected)
>> +			pmf->gfx_data.display_count++;
>> +		if (connector->status != pmf->gfx_data.con_status[i])
>> +			pmf->gfx_data.con_status[i] = connector->status;
>> +		if (connector->connector_type != pmf->gfx_data.connector_type[i])
>> +			pmf->gfx_data.connector_type[i] = connector->connector_type;
>> +
>> +		i++;
>> +		if (i >= MAX_SUPPORTED_DISPLAY)
>> +			break;
>> +	}
>> +	drm_connector_list_iter_end(&iter);
>> +
>> +	return 0;
>> +}
>> +
>> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +{
>> +	amd_pmf_get_gfx_data(dev);
>> +	in->ev_info.monitor_count = dev->gfx_data.display_count;
>> +	in->ev_info.display_type = dev->gfx_data.connector_type[0];
>> +	in->ev_info.display_state = dev->gfx_data.con_status[0];
>> +}
>> +
>>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>>  {
>>  	/* TA side lid open is 1 and close is 0, hence the ! here */
>> @@ -154,4 +193,6 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>  	amd_pmf_get_smu_info(dev, in);
>>  	amd_pmf_get_battery_info(dev, in);
>>  	amd_pmf_get_slider_info(dev, in);
>> +	if (dev->drm_dev)
>> +		amd_pmf_get_gpu_info(dev, in);
>>  }
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 81b1bd356e83..82ee2b1c627f 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -10,6 +10,7 @@
>>  
>>  #include <linux/debugfs.h>
>>  #include <linux/tee_drv.h>
>> +#include <linux/thermal.h>
>>  #include <linux/uuid.h>
>>  #include "pmf.h"
>>  
>> @@ -422,6 +423,60 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>>  	tee_client_close_context(dev->tee_ctx);
>>  }
>>  
>> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
>> +				     unsigned long *state)
>> +{
>> +	struct backlight_device *bd;
>> +
>> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
>> +		return -ENODEV;
>> +
>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +	if (!bd)
>> +		return -ENODEV;
>> +
>> +	*state = backlight_get_brightness(bd);
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
>> +				     unsigned long *state)
>> +{
>> +	struct backlight_device *bd;
>> +
>> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
>> +		return -ENODEV;
>> +
>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +	if (!bd)
>> +		return -ENODEV;
>> +
>> +	if (backlight_is_blank(bd))
>> +		*state = 0;
>> +	else
>> +		*state = bd->props.max_brightness;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>> +	.get_max_state = amd_pmf_gpu_get_max_state,
>> +	.get_cur_state = amd_pmf_gpu_get_cur_state,
>> +};
> 
> This is still the wrong thing to do. The new PMF code MUST only
> be a *consumer* of the thermal_cooling_device API.
> 
> The thermal-cooling device for the backlight itself MUST be
> registered by the amdgpu driver.
> 
> I believe that the correct fix for this is to add a new flag to
> the backlight_properties struct;
> And then make backlight_device_register() register
> a thermal_cooling_device for the backlight when this new flag is set.
> 
> This way we get a nice generic way to use backlight class devices
> as thermal cooling devices and you can make the amdgpu driver
> register the thermal cooling device by simply adding the new flag
> to the backlight_properties struct used in the amdgpu driver.

Agreed. I am also of the same opinion.

> 
>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>> +{
>> +	struct amd_pmf_dev *dev = data;
>> +
>> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>> +		dev->gfx_data.gpu_dev = pdev;
>> +		return 1; /* Stop walking */
>> +	}
>> +
>> +	return 0; /* Continue walking */
>> +}
>> +
>>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  {
>>  	int ret;
>> @@ -433,10 +488,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>  	amd_pmf_set_dram_addr(dev);
>>  	amd_pmf_get_bios_buffer(dev);
>> +
>>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>  	if (!dev->prev_data)
>>  		return -ENOMEM;
>>  
>> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>> +	if (dev->gfx_data.gpu_dev) {
>> +		dev->drm_dev = pci_get_drvdata(dev->gfx_data.gpu_dev);
>> +		if (!dev->drm_dev)
>> +			return -EINVAL;
> 
> You cannot just call pci_get_drvdata() on a device for which you
> are not the driver. You have no idea of the lifetime of this device,
> the driver may unbind and release the memory pci_get_drvdata()
> points to, leaving this code with a dangling pointer which will
> crash the kernel the first time you try to use it.
> 
> Also since you are not the owner you MUST not assume any specific
> type for this memory, you cannot be sure this actually is of
> the type drm_device. Basically you MUST not touch another
> driver's drvdata *at all*.
> 
> The proper way to fix this would be to add some API to the DRM
> subsystem to query the information you are looking for form
> the DRM subsystem.
> 
> Poking directly inside other driver's internals is NOT acceptable,
> NACK for this patch.
> 

I am inline with your remarks, but I could find a way where the
thermal driver registration, handling the backlight without having the
changes in the amdgpu driver very tricky.

Like you said, I am also of the same opinion that PMF driver should
call the DRM/GPU subsystem APIs (like it does with other subsystems).

But Christian had concerns on adding all of these into the GPU driver.
So I had to roll back these into the PMF driver, and hence you see a
pci_get_drvdata() call.

I can add the thermal device registration into the amdgpu driver and
then call the DRM APIs from the PMF driver.

Christian, do you have any feedback here please?

For the sake of simplicity, I can drop patches 13/17 and 14/17 from
the series and send them separately later.

Thanks,
Shyam

> Regards,
> 
> Hans
> 
> 
>> +
>> +		if (acpi_video_get_backlight_type() != acpi_backlight_native)
>> +			return -ENODEV;
>> +
>> +		dev->gfx_data.raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +		if (!dev->gfx_data.raw_bd)
>> +			return -ENODEV;
>> +
>> +		dev->gfx_data.cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
>> +									    NULL, &bd_cooling_ops);
>> +		if (IS_ERR(dev->gfx_data.cooling_dev))
>> +			return -ENODEV;
>> +	}
>> +
>>  	return dev->smart_pc_enabled;
>>  }
>>  
>> @@ -448,5 +523,7 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>>  	kfree(dev->prev_data);
>>  	kfree(dev->policy_buf);
>>  	cancel_delayed_work_sync(&dev->pb_work);
>> +	if (dev->gfx_data.cooling_dev)
>> +		thermal_cooling_device_unregister(dev->gfx_data.cooling_dev);
>>  	amd_pmf_tee_deinit(dev);
>>  }
> 
> 

