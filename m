Return-Path: <linux-input+bounces-117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 884567EF764
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 19:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3467A2811AB
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 18:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDF1374C5;
	Fri, 17 Nov 2023 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y+mDTlJ2"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF9DAA;
	Fri, 17 Nov 2023 10:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqwTg5RLZ36QYnIH/6Pk2QP38ZsHGBi9dReMYHcWxt26OkcUosJOcNihD2UzD/m203LcWQYa4ONmJloo/Li/8633z/3nuZdRUNJBxRl9HeFlcX47UWQhXbh9lPdBsRIVKiwKSlZOvtI/EYi0aJ0BkBeltm9aUfsxnujSezMKSBW1GydW92Q/A5K/Q7gBHA73VboU0iCSEm2Wa6Xik66Ua65Hshcsu8UBidsUjzocorHMxIUzIrlAH32TqD57Cf1gy3Bx7bS8Tp5+13Ur7o8wphwA86YGlCaj7XZcL5ArQHF3zDjok0PuumVKd+/DLQNzQ0Qg/HhcCcG0GH5XtOmEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4PerPXLQejxK5RYs3xgZvcDMNkDEIDIjVUz+uVwBMM=;
 b=VIGF+EIRkQduoxbASqfMsQj3pSk7R3ZBzTpp12sg45caG0Mi2dcX4ApVyoo3e6l0EUKMH+9Y/rtqv59pRMZLhJu2OZXPUAaIeHAwoJNt8JixM4luKI0KNiQgBsChqrX5kPSSzN110D0e+IlajZJo7bi7eae+/nUG8uCEyCgLHES7Oo5TSFqZboUjpI8lHjGLOBiKpSSdhP3VI8RXSkZ5GhKaQLCvONY7VS258G3iU4ESs/xGI/Ct8tMrZtPF/OXH/kUVofKhj2QmsyYMJSbxE5iLNRolFgf2Ep2AwgH3+o8BPTUj5/gt354nSVRcMsCaa992+iPHQFGq3k4P82BdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4PerPXLQejxK5RYs3xgZvcDMNkDEIDIjVUz+uVwBMM=;
 b=y+mDTlJ2CmI78+5hdb2TGeghygFuhahMiBuoK0F86DN8gq3gdVfK41d1Xl3eDgZH4oZg6vc4kkGVLPUTuWa3RAo//DOPCadl+D+k0Urvn6cWGRTU9vNR2GG9CpdTAl4VOnM+WDeZsKqNAGH5tnPAbhk0/wuK2zgW2ATCmmdiaN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV8PR12MB9264.namprd12.prod.outlook.com (2603:10b6:408:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 17 Nov
 2023 18:18:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7002.019; Fri, 17 Nov 2023
 18:18:09 +0000
Message-ID: <fddfbc8a-1848-4c19-93ec-ced5c0f9ca0b@amd.com>
Date: Fri, 17 Nov 2023 12:18:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/17] platform/x86/amd/pmf: Add PMF-AMDSFH interface
 for HPD
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
 <20231117080747.3643990-17-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231117080747.3643990-17-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV8PR12MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 7495693f-4876-4523-8d33-08dbe7998d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nJabtHJyU5gnQLcOPf/Q3TcV/ufS9U9vxf54HzSySPDxHmASqGYWa3s1QSE4M8D273aIJQ5drDh7VyPtM11hrbviwtGxUwzwNGj4HSHil9vEY0DcvBCZAe0jen7PlzEowSam4Q0D1A2613zP7LOOEPom2D5jPxTIK1MfMsCI1gYCkYehfdK0d7LmIPqKV6ApZZaqlUKVB5ZyJjJNeXF0q1tuQ6rNac5igWIYdL+OzPPnnmQxEjw5ZhYUIhnIQIPMaEZ17/I0o6PNM2lQSBVOLk8sLFXE0M2GgBrkT0RvM7SAVqzFWk0r7hfY2xIyhXZZg9GZ1t+T9ZggqXA+UeTVwOI1W7VrNcod/UeAdJ8eSnMm3MPjHMal+mYthFUH8YzUlfxiWIYtPD71EgBsNIJtx+31FJcLV2espNcZbmCmFt3f+WmtbeZQF37rZCmk77/7nCEt+cCyZ6T4Ky1no/aJbSOcbBaurSjflc/nRESLqyyYcvTnjj9SN85TgBswO9tAXUbT9Wcd/V+Y0UdzrwlCfEjtn8btylbQGDkiGJiPVaHUci6t39KaGfQxRJFamU5Qben0QmkWprKmTbgmdFscFVKNDfOFY7LCw7qBG73kEvghWWFZmIAublStKbwK9TdZL9J2TkV5R0pRrMKFHQky5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6486002)(6506007)(53546011)(66556008)(44832011)(2616005)(5660300002)(2906002)(41300700001)(26005)(8936002)(6666004)(8676002)(316002)(4326008)(86362001)(66476007)(31696002)(83380400001)(36756003)(478600001)(6512007)(38100700002)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJ2Q1F0WEFRRTZGZ0JNTXFWUEllY21oWUowSDdLeFJWYXJZWmpkQWV2dnYy?=
 =?utf-8?B?QThvQUgvQnoyUXk4SlVNOGxIMjhQcmN5UlhHMFZQb21pQTA0T3gybzYrU1pZ?=
 =?utf-8?B?cy9YVUJISXVLbHlzYm10SXdSQjdXekphdG1nd29uU3JORUlXbnZCdXR2eEJB?=
 =?utf-8?B?WTBNN3NBbit3U3A0cVR6VEk0d0NGV1RYblZrWEM2Yms1MExIUzBrOERGelQ2?=
 =?utf-8?B?UHloSW5Gd0hYd3p1aVdGQnh2V1BvSFA4NnhYRHFaTko1U0NOS2RpVW5uVDk2?=
 =?utf-8?B?UGxPSjhWZjNVbHlwaWdrMGNSNzFPcHhUQ1U1eU4wK2FTRnRaYnV3OHpqTWd3?=
 =?utf-8?B?ek1wMzRWNGQ2SHk5TlhlMnNIN3F6NGI5MWVTT0xqanpDVXM5RkwrTC9VWlRq?=
 =?utf-8?B?Z29SbUEzdzhab29JTWVmcHhIeU40eFB2NFlsOFl6QlNWSnBnTWhlU1JlYm5r?=
 =?utf-8?B?dEF0eVdpQnZFZ2pSS3BkUTNhTC9CTTZEaUVaQmdSQ3dqbmhpWnA1bkZha0pV?=
 =?utf-8?B?aWNxUEMzdWlvNUFmSkU1Rk5IdTliaWdVVDV3Ly9MVVloVGxGcXBjMlZ6YmY2?=
 =?utf-8?B?WkdUQ0F5azJNanV5TUhCeUN1VnRYcmlkeHRtN0lvNVJJa25sbTNkekxLNzZR?=
 =?utf-8?B?Q0JucFA5NkMxYnhBY3F5Zks2bmVtdWdONGdJL3RLVGwyWmZWbFZUR1dqWjVC?=
 =?utf-8?B?SUtFK21jNFREb1NHeVdHMDVlNDJrYTROOWVUZzByUEMyKzdFdG5kV1Jlb0ZV?=
 =?utf-8?B?czg2MW5XelNCZ1ZxYk9nUUU0ckFkcktKUTdjcWpCMHl3VDZwMnRVZlpJMXpl?=
 =?utf-8?B?UGR5dTRqYzcrUmdBREU0cmQ4ZGJIT2FvQW9zZmp6WmpVY3dETnVDZEpJQS9P?=
 =?utf-8?B?RFF4YlBmaUhmS2lKdG15RzZWMlkwQXhjMFpDVUdoSHlJY0QzQ25RYkVQdVdF?=
 =?utf-8?B?bVBXRXRxc0xGK2laWkVLYnRzdzAvNE5rdTZKVmI0eVE5R1NaaGR5cTBabkJw?=
 =?utf-8?B?UTFYM0E0WDZHN2dCUkcya2FkWWlNY29kajhLK2dMVzV0TVNmdjMxN1B2MEt6?=
 =?utf-8?B?UlhsU09YK3gycmQwTjhTWjNtMlh6V1QxOXlwdzVxQ3NpVTlLckNsMkJBU0Vn?=
 =?utf-8?B?VlZ4UjFHY2xnS2pOVDFTYzB1cmlHVWtrTWduYUtjdkNDUFBlWFR0V3BWQmt3?=
 =?utf-8?B?cUprQjlBVmJYZ2VhRC8vaWM1cDFoK1QzSDUzTUNrLzQ5emFsSGcrdFozTFNS?=
 =?utf-8?B?RWo1V2pPOURRdEw2NlNyekRqNnQ0Um9UeEJOa3k1NVM0ZnRDTXhaekpPQ2ZN?=
 =?utf-8?B?OGphTFltZk1FVENid3pKY2p6dGR6VFNUaER1SXFVV2J5OExBS1JRcWQ1RFkw?=
 =?utf-8?B?UFd3V3FCVkVZVEt6N3ViOXB0RUN4SnBaS1hXV2hTVTh2U00zc3RNblN6TzUr?=
 =?utf-8?B?TVp0S0JBT0V2N2xKSEUreURUdTU0dkRTQ2hiZFFxRitYVmdhNnl0RXlhaGdY?=
 =?utf-8?B?OTIycU55NUdVUnBJYU1xdDhNcWdOck1VRDV2WE5VOEQ0VTVnREY1bDZxOHMv?=
 =?utf-8?B?QW5HMWozYnV2bFZMM0F0b1hYZ2FRUzZaUmZmd2VoN2Q4TUQxZEtBVmt4WVpz?=
 =?utf-8?B?enVWQVVqa1VVRlBpbzl2WFpCZVArOEJpYXlFT2JTSlJrU3VJQmVsL0JJWUYw?=
 =?utf-8?B?QUJjMzdlN3B0SHRZcktkSXRyTHlQZmRmMm05elkyZE1DNWZoMjBJQlZRVy9y?=
 =?utf-8?B?Rk04bHRwSkVrZVlJMVArVzE4a0xFQ2djOVMzM3FUN1ZnSzNodXZJVFpoRGpu?=
 =?utf-8?B?b01iMEF6eDQ5emRqeTJtVEdJODlhbU05V1pmanRUTUEyWFRvRDJIQVJQby9m?=
 =?utf-8?B?UHRHU3AyTXRKcXVaVEtEVmZyV2RXS3JralhNckk4aFVEYnMwY1h1OWVZZnlh?=
 =?utf-8?B?bkhCblMwRkFaZ3NybCtHTDdGZ1JQd2cvVnNadXFqMVpiM1hZR0xRaFpZajR6?=
 =?utf-8?B?ZnE1UGd0dE5uTnc2b2ZNZjdHQWlQemNiSFBVRStJRGJlcVl5ZFRFYWN5NUYv?=
 =?utf-8?B?RHdHaGtZU2hoTUZPNEhDaW8wODBWRG5Nb2xkQWh1WDIrYXBuSUFDRnA0eWw4?=
 =?utf-8?Q?/5D9PC1yHUp+ZyAJ+jGw4Z+bJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7495693f-4876-4523-8d33-08dbe7998d3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 18:18:09.0212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYZXIf3IVjNoVI2fYpqngIeIVsUHErKNB7Ywvc9RvbUfwtDpkc2BGXpe/AqEd7OKBXo56NCA+BdNYSbdw9Wzuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9264

On 11/17/2023 02:07, Shyam Sundar S K wrote:
> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the User presence information via the Human
> Presence Detection (HPD) sensor which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 11 +++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 28 +++++++++++
>   drivers/platform/x86/amd/pmf/Kconfig          |  1 +
>   drivers/platform/x86/amd/pmf/spc.c            | 22 +++++++++
>   include/linux/amd-pmf-io.h                    | 46 +++++++++++++++++++
>   6 files changed, 113 insertions(+)
>   create mode 100644 include/linux/amd-pmf-io.h
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> index 2643bb14fee2..cd57037bf217 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> @@ -37,6 +37,10 @@ struct amd_mp2_sensor_info {
>   	dma_addr_t dma_address;
>   };
>   
> +struct sfh_dev_status {
> +	bool is_hpd_present;
> +};
> +
>   struct amd_mp2_dev {
>   	struct pci_dev *pdev;
>   	struct amdtp_cl_data *cl_data;
> @@ -47,6 +51,7 @@ struct amd_mp2_dev {
>   	struct amd_input_data in_data;
>   	/* mp2 active control status */
>   	u32 mp2_acs;
> +	struct sfh_dev_status dev_en;
>   };
>   
>   struct amd_mp2_ops {
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index e9c6413af24a..3dc652d41d7d 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -73,6 +73,12 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
>   	int i, status;
>   
>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
> +		switch (cl_data->sensor_idx[i]) {
> +		case HPD_IDX:
> +			privdata->dev_en.is_hpd_present = false;
> +			break;
> +		}
> +
>   		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>   			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
>   			status = amd_sfh_wait_for_response
> @@ -178,6 +184,11 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>   			rc = amdtp_hid_probe(i, cl_data);
>   			if (rc)
>   				goto cleanup;
> +			switch (cl_data->sensor_idx[i]) {
> +			case HPD_IDX:
> +				privdata->dev_en.is_hpd_present = true;
> +				break;
> +			}
>   		}
>   		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
>   			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 4f81ef2d4f56..c0f31efe4927 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -7,11 +7,14 @@
>    *
>    * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>    */
> +#include <linux/amd-pmf-io.h>
>   #include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/iopoll.h>
>   
>   #include "amd_sfh_interface.h"
>   
> +static struct amd_mp2_dev *emp2;
> +
>   static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
>   {
>   	struct sfh_cmd_response cmd_resp;
> @@ -76,4 +79,29 @@ static struct amd_mp2_ops amd_sfh_ops = {
>   void sfh_interface_init(struct amd_mp2_dev *mp2)
>   {
>   	mp2->mp2_ops = &amd_sfh_ops;
> +	emp2 = mp2;

How about when SFH is destroyed?  I think you want to explicitly set 
emp2 to NULL;

> +}
> +
> +static int amd_sfh_hpd_info(u8 *user_present)
> +{
> +	struct hpd_status hpdstatus;
> +
> +	if (!emp2 || !emp2->dev_en.is_hpd_present)
> +		return -ENODEV;
> +
> +	hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
> +	*user_present = hpdstatus.shpd.presence;
> +	return 0;
> +}
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
> +{
> +	if (sfh_info) {
> +		switch (op) {
> +		case MT_HPD:
> +			return amd_sfh_hpd_info(&sfh_info->user_present);
> +		}
> +	}
> +	return -EINVAL;
>   }
> +EXPORT_SYMBOL_GPL(amd_get_sfh_info);
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index f246252bddd8..f4fa8bd8bda8 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -10,6 +10,7 @@ config AMD_PMF
>   	depends on AMD_NB
>   	select ACPI_PLATFORM_PROFILE
>   	depends on TEE && AMDTEE
> +	depends on AMD_SFH_HID
>   	help
>   	  This driver provides support for the AMD Platform Management Framework.
>   	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 47ec563088b8..7f63973ab40e 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <acpi/button.h>
> +#include <linux/amd-pmf-io.h>
>   #include <linux/power_supply.h>
>   #include <linux/units.h>
>   #include "pmf.h"
> @@ -49,6 +50,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   	dev_dbg(dev->dev, "Primary Display State: %s\n", in->ev_info.display_state ?
>   			"Connected" : "disconnected/unknown");
>   	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
> +	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
>   #else
> @@ -185,6 +187,25 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
>   	in->ev_info.display_state = dev->gfx_data.con_status[0];
>   }
>   
> +static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	struct amd_sfh_info sfh_info;
> +
> +	/* get HPD data */
> +	amd_get_sfh_info(&sfh_info, MT_HPD);
> +	switch (sfh_info.user_present) {
> +	case SFH_NOT_DETECTED:
> +		in->ev_info.user_present = 0xff; /* assume no sensors connected */
> +		break;
> +	case SFH_USER_PRESENT:
> +		in->ev_info.user_present = 1;
> +		break;
> +	case SFH_USER_AWAY:
> +		in->ev_info.user_present = 0;
> +		break;
> +	}
> +}
> +
>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>   {
>   	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -195,4 +216,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>   	amd_pmf_get_slider_info(dev, in);
>   	if (dev->drm_dev)
>   		amd_pmf_get_gpu_info(dev, in);
> +	amd_pmf_get_sensor_info(dev, in);
>   }
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> new file mode 100644
> index 000000000000..5b6d29d36922
> --- /dev/null
> +++ b/include/linux/amd-pmf-io.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD Platform Management Framework Interface
> + *
> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *          Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> + */
> +
> +#ifndef AMD_PMF_IO_H
> +#define AMD_PMF_IO_H
> +
> +#include <linux/types.h>
> +
> +/**
> + * enum sfh_message_type - Query the SFH message type
> + * @MT_HPD: Message ID to know the Human presence info from MP2 FW
> + */
> +enum sfh_message_type {
> +	MT_HPD,
> +};
> +
> +/**
> + * enum sfh_hpd_info - Query the Human presence information
> + * @SFH_NOT_DETECTED: Check the HPD connection information from MP2 FW
> + * @SFH_USER_PRESENT: Check if the user is present from HPD sensor
> + * @SFH_USER_AWAY: Check if the user is away from HPD sensor
> + */
> +enum sfh_hpd_info {
> +	SFH_NOT_DETECTED,
> +	SFH_USER_PRESENT,
> +	SFH_USER_AWAY,
> +};
> +
> +/**
> + * struct amd_sfh_info - get HPD sensor info from MP2 FW
> + * @user_present: Populates the user presence information
> + */
> +struct amd_sfh_info {
> +	u8 user_present;
> +};
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> +#endif


