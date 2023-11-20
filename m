Return-Path: <linux-input+bounces-131-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B063D7F0BF3
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 07:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30B67B207D1
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 06:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457031FB3;
	Mon, 20 Nov 2023 06:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fHT1o7Za"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F89193;
	Sun, 19 Nov 2023 22:42:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0G9EQaz/AxQIHwlzFp9z/+EzFCq/7INQsVtG5KFtxbdamvLlnlYunPN70+f+K4+ZgqP4WUHEXeFuYpV8hezflr5Z5dOCE852FhFLdqufQ3+pTqaXlTkvuScB5QbduCEgO0ydvoCuXuWZfCKNGScn3YQzR3mFCpDtc3y6P7yMuHp/1eqIIHBzZ4vEsX61oTxmf91OQCgaGzpRATU95JzFf+bvlaD9nLE1Z7g5S6J/VnUmdfPUPeedhN6X1tkllmg6xfGQ58V4OJ/so9utB+LOlUOYSxSFunWRw6mR7D99yz3AuzT5smSXPW+0/g2HcCK8ly96AwwegK/L76/FBWwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojRsnQdtk3qKcA2mfoWVmlSfzkilOJb5HUjmY10Eys8=;
 b=cF5RZDNbmStlEKX9LRLv1gD3yLjPexW9SrDusanoGA60l+Gdu0jZBUH+MYsZMR5dF9UT0tmM7Gh8cmelkTy4fQlnwCAGQjEFkuaEAYjax9PU2Py1oPK306IhebbTA1j1j2oMV0c8UrN2djCFbVPxeL88sXdP0V9zCYqnEit3scQtAGbT+lHREvu2nLPfwzQZG9vVsDmupE0W4RVGVhRtSPmumPc6IhZdNADZmZDwuZlnqgqQ1RTg5hvD4OpoIfJ6hLHYfAh3UpMcvhilMpvUc9M5Z89D74FQg4BDRb3tatvt8YpFZ97uIj8Vhsgx857zHGpBDW0gPuFk8oZrBjOfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojRsnQdtk3qKcA2mfoWVmlSfzkilOJb5HUjmY10Eys8=;
 b=fHT1o7ZaoNHRpEJi4XXeNLBqAKMdAFB5iduoAZNvZxHI12m5TDmWiTP9IWavbWSeqd/5mAWry3X/+32VHKoIv8tOdAOLD8FH44QIaiq6VMedW9zYdErbWs1ywkvuVNzQvheYBtK7HlAl5aTSfJNKcwbjxkPEBvOuyJDRivrdH9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB4054.namprd12.prod.outlook.com (2603:10b6:610:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 06:42:51 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 06:42:51 +0000
Message-ID: <be72e8aa-2a7e-44bc-ab56-9ff27fe479ef@amd.com>
Date: Mon, 20 Nov 2023 12:12:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US
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
 <e4811bf6-2387-42a1-ae8e-7af172d6a97c@amd.com>
 <ebe24400-39d0-44be-8a25-d69f26e64e64@redhat.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ebe24400-39d0-44be-8a25-d69f26e64e64@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH2PR12MB4054:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9eddd5-ee7e-462d-57a2-08dbe993ea86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n5QxF35o2Jq9Ytb01TwmstTkFpxVWiu+pgRUc7eC1SvCPI5iQlH4gXmhQp7TL8/xDNGXgrwcAdXi6UzZcqeFfHA6O8niA2WfCeitDQioY0KqSa1pbychy8SNOQXgC7ROHleD4lIlsfbpVdhOhAyI97vqwnz0FMakub7SEjezR68SXP0BsqjzR/nKWtkiNTuc0uSw2HZuIe8SlvuENTQjwK0Q8sF4K+v4lZ9AL1LfVcFxCK3DJh+VAMkZc3ksN8fIEURhXeRsVvjoP/uJZO80YScMefQnWqVRpXuGMRSu8EMGgoLSZ9VoMkkFhyPwTWYkWnvxzFPPmQpzaRkGjq/+HQBd2DJpxFhnlr6Ye1GY+9g4Xec5Tneucw5npEKG1agTUlNsqzXLc0DhabsEyOMrk77EBIpWBkan2bJ3JDjUOkBnMpTzgej/fLyKSli8gVXIVJ2SbcqXoFuypchZ9SyOIDI6e4PzovNb+3Jm7bL4ulrgPmnwbSifiNFqQMDD6CDWyIAnCg1ClGoMlNcZ7UKMw5/p0z6qOnJZNIE3N9iVTrCu43BD8S92wD0yR7eyMMf1nyfbnZkIktcDHeNciUpQ9naQRta5An+wkQ5IIogcpvG0vObFfLuMqsiOij8fOiDVT6Lk5+z510ZhaSl9i9dNMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(6666004)(478600001)(2616005)(6506007)(53546011)(6486002)(26005)(316002)(31686004)(66946007)(66556008)(66476007)(54906003)(6512007)(38100700002)(8936002)(4326008)(8676002)(31696002)(5660300002)(2906002)(41300700001)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDhCajgwSGNlOHZiRWljVU5QbzExT0VyNmFZaExJMEFQVFZsSXIwTmgzL0xu?=
 =?utf-8?B?THR3VDU5NXYwTFQ1dmFhNE9kZXEwSHRoUEoreEZteEErK1dlZFVSM0huNlcz?=
 =?utf-8?B?Mm9KMkk1KzlBVElKQ0xIMFBoZmpzK1o4bXdZS0RlTGdPbjFSOUZ6WHZwTnFr?=
 =?utf-8?B?SHE5WUdzdXNqbGRWM2kycDhkT0VPQ1dUWU9Fb3JsZFBRU2NseVkxVUdzYnl4?=
 =?utf-8?B?d3lJNzRsOE5zTU9maXZSbFMrNG9tNGd0UkJwdFRyY0tLeTMwSFVkbFFscmFl?=
 =?utf-8?B?TUQvSDZPcHczQWtEOG1FQjhKU2RJQ3AyWjhwdVl6Nkh5aTMwR0FKV2Zha2Mw?=
 =?utf-8?B?Y3FTQ0V6YXJVWnZHK0IrQTFhclN2cXppUU9PaGJPcW5XNTdxWk9nYmZWbnU4?=
 =?utf-8?B?NUFsSjR0UjU2T2ViWEhCVy92THhHUU9yK3VNdHZJZ3B0M3puSzZCUXF5TmZT?=
 =?utf-8?B?TUxjbVZQQUxmNVZQQUZqUlNOWVJIU3VzVDJrV0IwT1pPSEZMZ0lpVUhjQ0lP?=
 =?utf-8?B?RFBxRTVIY29NV0hZS0Vmbk1BK0U0WjEyaTB4NWZJbFRGVFFqMzMrUDFCMko5?=
 =?utf-8?B?SWVCem9Za2dtdU8zRUxZUk11b1E1eS91TXZZU0RBb1VPWWVyeDVhNWpLRG55?=
 =?utf-8?B?bytYV0FxcWliQnFVMXBxZGNYbnVkc2k0OC8yNjZNR2s0NHdHbDc5bDZaU2Nk?=
 =?utf-8?B?ald4U2pJdWpaZTNxSGNTc1F2SlRteTgyMy9kc1l6S2IzbmMrV01sVEhDM2Rt?=
 =?utf-8?B?b0Q3NHFoQ0l0and6eDFiWVJ6bWw1SllWY05EWUplQ3ZEblRxUFVoK1NSY0k1?=
 =?utf-8?B?ZmFVVlRtY0pPYkxsNXdrQVg3WE1ydGIydnZVNE1LanUyTy9Kd1FnemR1aFY1?=
 =?utf-8?B?MlpibGZyM0M0a0VNZXp4SUd6cjYycDZtdndLRytsSDZZV1JHR0piWCtvYXlE?=
 =?utf-8?B?MzNyUDJ5b1MrS3EwYUVJTFBlWHIxQStqSlBNT2NWN3RsZEJtRjNqOVZ0MnpD?=
 =?utf-8?B?TktqM1VMU1o3aVNnTjhTSy9ldFJwczVlWXpxdHRKUmJZdy9tbUtWWlpWZUxo?=
 =?utf-8?B?SGpjUm14b3BoekFPRmN1Y3JVdHM0d3ZuNkZDNlozMVNoWFNIVXc5QkJjSlZJ?=
 =?utf-8?B?dnJDVmQwMHVpMUppUWJKUkNqVENrcWJIU1B0dWpMMWpyV2tsY29rdjZlZ1A5?=
 =?utf-8?B?MFYyMHVGc2ZMOEh5a1NSN1BuWDg2SnRxZ3hTeEMxVUR6OFYzaEhpaDY1TnNU?=
 =?utf-8?B?SlVMTnNwdHhmeUpxQUY4endUelBydG12R1ZLWER1ME1sVnE0UXltNEV0c3BE?=
 =?utf-8?B?bDBsWFNzcHFzZDUwM1ozR3MwUEcxZ1VNYTRsc3VxbExzaVIxOXFWRkRNVGwy?=
 =?utf-8?B?RU83NzN0STdENDAvQmhhUjViV3BoRk5ndjVFSU5aa2FIVWlPK0M2czlFM0Fw?=
 =?utf-8?B?Zks1ZUMwMkJMNzdlZzJrV0doZW9rWlZReFArbG9tQmNmVlhURElMWFB6Tm5T?=
 =?utf-8?B?MUZxcUMyUjg3MlFSY2tBeExWZFk0THkyN3BFcXUvQmRCK2ErQ1J4UGV5MlFy?=
 =?utf-8?B?bmFxUHpPVDBIMXRMOGRJZ2kzck51Y3J3S0pMQVB2UTR5MHoxUTMyNVVBVVQ0?=
 =?utf-8?B?UUFiZUVrb2FmT0lxdTZZZFJnZERjbndLWk5aQnE4WFFUYlo0SE1OTjVIRGto?=
 =?utf-8?B?czM1LzFMdSt4Y2Zja2RlcjBpQml3dG1NaTFPbllzMklNS2taT1B0NjVMZ1lU?=
 =?utf-8?B?eTVjZ1lRV0dEM0FTQXFUSDh3WkhvbW82bDhtWFJRaStpUVMwWWdxQWNlVGww?=
 =?utf-8?B?WTdKMFdra2hYNWNxcHdPVjFJZjR3Uy9NUXN3dloxeFZyVWhPN3k2Z1AxNG9o?=
 =?utf-8?B?UzUvc3AwNzJuNnNtOFQ0RkVqVGZodmdYVzVFelJEckc2M0xhbVUzTm1ic3Z4?=
 =?utf-8?B?K3J0Y204S0tSbTlZd3cyTVlWZWFwbkRWcDRtaFJpYmRRd3J3RFNGakRMQk40?=
 =?utf-8?B?cXBVRUpXR2hkM0xRZFJsbVkxWVA5NFVGVDU2eWptVTV5NUl5WlRTRms4dkZl?=
 =?utf-8?B?dTdUUlFKdVJxbG9ZZU8xbk9vRTN0L1l3RldPVkQwWWxoUTBHSG9FamVUTlJG?=
 =?utf-8?Q?TM0A1FaHKqjExzOrzA3CLCqVO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9eddd5-ee7e-462d-57a2-08dbe993ea86
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 06:42:51.0264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tLWPa/g3b0/qwqQQjGI/RZVgEoa4Dd00hZfqQJ5U2fpLW/TG8wiOyTuz8v1pksgipVbbT3wGQs+GkJR5GOZsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4054

Hi Hans,

On 11/17/2023 5:01 PM, Hans de Goede wrote:
> Hi,
> 
> On 11/17/23 12:08, Shyam Sundar S K wrote:
>> Adding AMDGPU folks (Alex and Christian) - I had to drop them as the
>> changes from amdgpu were moved to PMF driver.
>>
>> Hi Hans,
>>
>>
>> On 11/17/2023 4:18 PM, Hans de Goede wrote:
>>> Hi Shyam,
>>>
>>> On 11/17/23 09:07, Shyam Sundar S K wrote:
>>>> In order to provide GPU inputs to TA for the Smart PC solution to work, we
>>>> need to have interface between the PMF driver and the AMDGPU driver.
>>>>
>>>> Add the initial code path for get interface from AMDGPU.
>>>>
>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> <snip>
> 
>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> index 81b1bd356e83..82ee2b1c627f 100644
>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> @@ -10,6 +10,7 @@
>>>>  
>>>>  #include <linux/debugfs.h>
>>>>  #include <linux/tee_drv.h>
>>>> +#include <linux/thermal.h>
>>>>  #include <linux/uuid.h>
>>>>  #include "pmf.h"
>>>>  
>>>> @@ -422,6 +423,60 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>>>>  	tee_client_close_context(dev->tee_ctx);
>>>>  }
>>>>  
>>>> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
>>>> +				     unsigned long *state)
>>>> +{
>>>> +	struct backlight_device *bd;
>>>> +
>>>> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>>> +		return -ENODEV;
>>>> +
>>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>> +	if (!bd)
>>>> +		return -ENODEV;
>>>> +
>>>> +	*state = backlight_get_brightness(bd);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
>>>> +				     unsigned long *state)
>>>> +{
>>>> +	struct backlight_device *bd;
>>>> +
>>>> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>>> +		return -ENODEV;
>>>> +
>>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>> +	if (!bd)
>>>> +		return -ENODEV;
>>>> +
>>>> +	if (backlight_is_blank(bd))
>>>> +		*state = 0;
>>>> +	else
>>>> +		*state = bd->props.max_brightness;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>>> +	.get_max_state = amd_pmf_gpu_get_max_state,
>>>> +	.get_cur_state = amd_pmf_gpu_get_cur_state,
>>>> +};
>>>
>>> This is still the wrong thing to do. The new PMF code MUST only
>>> be a *consumer* of the thermal_cooling_device API.
>>>
>>> The thermal-cooling device for the backlight itself MUST be
>>> registered by the amdgpu driver.
>>>
>>> I believe that the correct fix for this is to add a new flag to
>>> the backlight_properties struct;
>>> And then make backlight_device_register() register
>>> a thermal_cooling_device for the backlight when this new flag is set.
>>>
>>> This way we get a nice generic way to use backlight class devices
>>> as thermal cooling devices and you can make the amdgpu driver
>>> register the thermal cooling device by simply adding the new flag
>>> to the backlight_properties struct used in the amdgpu driver.
>>
>> Agreed. I am also of the same opinion.
> 
> So the change to the AMDGPU driver here would just be setting
> this one new flag in the backlight_properties struct.
> 
> Alex, Christian, would that be acceptable to you ?
> 
> 
>>>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>>>> +{
>>>> +	struct amd_pmf_dev *dev = data;
>>>> +
>>>> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>>>> +		dev->gfx_data.gpu_dev = pdev;
>>>> +		return 1; /* Stop walking */
>>>> +	}
>>>> +
>>>> +	return 0; /* Continue walking */
>>>> +}
>>>> +
>>>>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>>  {
>>>>  	int ret;
>>>> @@ -433,10 +488,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>>  	amd_pmf_set_dram_addr(dev);
>>>>  	amd_pmf_get_bios_buffer(dev);
>>>> +
>>>>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>>>  	if (!dev->prev_data)
>>>>  		return -ENOMEM;
>>>>  
>>>> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>>>> +	if (dev->gfx_data.gpu_dev) {
>>>> +		dev->drm_dev = pci_get_drvdata(dev->gfx_data.gpu_dev);
>>>> +		if (!dev->drm_dev)
>>>> +			return -EINVAL;
>>>
>>> You cannot just call pci_get_drvdata() on a device for which you
>>> are not the driver. You have no idea of the lifetime of this device,
>>> the driver may unbind and release the memory pci_get_drvdata()
>>> points to, leaving this code with a dangling pointer which will
>>> crash the kernel the first time you try to use it.
>>>
>>> Also since you are not the owner you MUST not assume any specific
>>> type for this memory, you cannot be sure this actually is of
>>> the type drm_device. Basically you MUST not touch another
>>> driver's drvdata *at all*.
>>>
>>> The proper way to fix this would be to add some API to the DRM
>>> subsystem to query the information you are looking for form
>>> the DRM subsystem.
>>>
>>> Poking directly inside other driver's internals is NOT acceptable,
>>> NACK for this patch.
>>>
>>
>> I am inline with your remarks, but I could find a way where the
>> thermal driver registration, handling the backlight without having the
>> changes in the amdgpu driver very tricky.
> 
> As mentioned above I think there should be generic thermal cooling
> device support added to drivers/video/backlight/backlight.c, then
> the amdgpu code just needs to pass a flag when registering
> the backlight to enable this.
> 
>> Like you said, I am also of the same opinion that PMF driver should
>> call the DRM/GPU subsystem APIs (like it does with other subsystems).
>>
>> But Christian had concerns on adding all of these into the GPU driver.
>> So I had to roll back these into the PMF driver, and hence you see a
>> pci_get_drvdata() call.
> 
> Ok, so I can see how this AMD PMF code is all kinda special
> and how the DRM folks don't want to have to add APIs just for
> that. But IMHO calling pci_get_drvdata() on an unowned
> device is completely unacceptable.
> 
> At a minimum we need life-cycle management for the drm_device
> which the PMF code is using, something like:
> 
> struct drm_device *drm_device_find(const void *data,
>    int (*match)(struct drm_device *dev, const void *data));
> 
> which works similar to class_find_device() and returns
> a reference to the drm_device for which match has returned 0
> (which also stops it from looping over devices).
> 
> Combined with a:
> 
> void drm_device_put(struct drm_device *dev);
> 
> for when the PMF code is done with the device.
> 
> This way the PMF code can safely get a reference to drm_device
> and release it when it is done. Rather then just getting
> some random pointer which may or not actually be a drm_device
> and the lifetime of which is not guaranteed in anyway.
> 
> E.g. if the PMF driver loads before amdgpu then
> pci_get_drvdata() will just return NULL.
> 
> And as mentioned if the amdgpu driver gets unbound after
> the PMF code has called  pci_get_drvdata() the PMF driver
> now has a dangling pointer.
> 
> So IMHO adding: drm_device_find() + drm_device_put()
> to the DRM core are minimum which is necessary here.
> 
> If the PMF code then ends up doing things like
> drm_for_each_connector_iter() on the gotten drm_device
> referemce so be it. But we must make sure we have
> a properly lifecycle managed reference first and
> pci_get_drvdata() does not give us that.
> 

Ok I will work on your feedback.

>> For the sake of simplicity, I can drop patches 13/17 and 14/17 from
>> the series and send them separately later.
> 
> Yes I think that dropping the GPU related patches for
> now would be best.
> 

Thank you. Let me wait for feedback from others before I drop the GPU
patches.

Thanks,
Shyam

> Regards,
> 
> Hans
> 
> 
> 
> 

