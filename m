Return-Path: <linux-input+bounces-481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8E803E05
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 20:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423E21F210A5
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 19:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931E630F84;
	Mon,  4 Dec 2023 19:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t0gTEmd2"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6A4CA;
	Mon,  4 Dec 2023 11:03:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYNevkQ+hJZmjO70kugyz/YmOrnib/sqo/14LNNAsqIORh1qxiZs4j/PVr0mg3f4gG+KXN6tyM1FMdLjiQXrjo6CjSmqLFIruCHI0h0gJn4pFz7AauYobBIU2k1+1vQydLdFky7zbFnwUr40ZgRhOaqb8cU4YO4FKvom4WSVpjMyN9AL8gO1aeMpzF5IdMsdLUn6KDfqFzRXDR8ofh/p2gIIUAgpXleNbMjr07AOzSGD8O0hqpHEwHe6FFF9tLE4c5v8ivibdfN1R+iLHrmmA3hXqeZasKksqUhs94ZwWx0nV8DCoLnCPcta+jP3PqnS1S8lxqPkX4xvgS6EnkXVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IymmwATEKSjB33wUXUOan2Uo42j06LGw76qFV2QqQIc=;
 b=W9jA8/1Ibr5TZ6ASoFf3apUqUuAHS7pfxBB+sfIRkObzU0nic2C6HcLodpzwmLv5Vl1hwgHA5PjwhAr/XlnDbYJ2Nc3sk6/hgEV6QnvTg2LHTBUvYazU9krdU9pON6PAUmr1YKey9cZDO9DM1bMZ8IKZdWwVdcGFzM0kxuo1MBHvsj7vRSi4yLu54ZAqfwof+lwt8eZQPSyVCi8C+KeNuMxqZ2HWuDgeB+AEZCTQc53fXgSSVheBhN9IxeWZt49+aLY2DYnF+KYgszdRxV9WowUqQvgEzAxiiKFJw1OTZfg0VLiu2riPJRyd6dlbfOnvyhf4u/aUNXz3MRTwTXrKXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IymmwATEKSjB33wUXUOan2Uo42j06LGw76qFV2QqQIc=;
 b=t0gTEmd2xi1fIzjfrEkhpLewYKaT7ApKbYKO9vQlbzSYVZCfFBIkGxA28SMvX2YtTY2GKF1WMUzTHVTJP34ErVOVLfhuf1cLyznKp7uGzkjuOwsIsX165Sa/on7zbgdR6bz8kzP+SsC5VGqWJQLJerHfXNyrv7YQiXRS6KbKLRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 19:03:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7046.034; Mon, 4 Dec 2023
 19:03:51 +0000
Message-ID: <666fba72-b9bc-452e-948a-76e146f14997@amd.com>
Date: Mon, 4 Dec 2023 13:03:49 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/15] platform/x86/amd/pmf: Add support to get inputs
 from other subsystems
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-7-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231204101548.1458499-7-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba4cf54-ba5b-4ec6-207f-08dbf4fbc0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J8ebSyoNw5HqlQ/cEBtkrH3JcKYBqZOFA9aLBbgNVcIFdrKBZo8qHdrQKLUdQzsBRLQsZe5veqbVnt90ODbuSTc5jlfKVV9eKy5e+zuUruCx5JQq5RkKV3+LVuVrUyH4vfPYQYxS/vkJYUp6f4Q4+OUS3+8q/IQ72TJTaIK4id+w1CXH9sYWwvmRQhZ+RC5ALC++M7gsyLp9C57o/XvK6p8ImV3IGVr1uxA3TlOzXsbp7l/8enq1W/QJT2/CWBgAi/vr/TqCNM0MXumGyr073lhM+Og0DbU9Sx6gnejT3MlLKY/zsxYepJmD+HtvdGvBg0/4kJIN482NFk1ImHITnKD+airq8v6sfUlI83dj93yaNcRuNBeI3ARGGRZelM9uiwS0xA6o4sEQKFL+yVvgq4yEzak5aO5rdibaP/tfPal2CXTA7oe1MtdAoqjYty7A/2AAzhfDqOY9XWlFXYrDxDfVp+9qayy7JSp/0VoyoSvhGwpCqOXOzGctmprnpTyuwUE1hevqNGL5TZeJTpbe/FBtIY1g35P1InY9wuFKXnGaLsJIi5LdlNLktVoKY6itSRupUWCTNvC5DIWZjgs7bSMqdZqHRxvCeVXIlo4EdnoBDCKvv/8bR631LNKDAP2KbQb6vKJ8pmWJZjqXfDHnOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(8936002)(316002)(86362001)(8676002)(44832011)(31696002)(4326008)(66556008)(6486002)(478600001)(66946007)(41300700001)(36756003)(2906002)(5660300002)(26005)(2616005)(6506007)(6512007)(53546011)(83380400001)(66574015)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU5XSVJzSGhOdmI2OUxDdldlUXBGaU9aVkRIZStjWlRXSXFyTWpBVnMxMmlt?=
 =?utf-8?B?a0JOSjA5VDBjbStIQVNWajRicHNlS3cxc0pOQ1dhNmFNZ2h3Wkl1bk1CYXg4?=
 =?utf-8?B?U3R0K0hRc0t5dmVYOURKbG56ZG9Mbk03TENhRUhkaXJ5WjVaREl1b3VTeFhv?=
 =?utf-8?B?eWxFY2xLU201d3Q0STh5S1Z3Z3F2UUx3SWMrQUJMS2NVemZzNTlnekNVd0Vi?=
 =?utf-8?B?Y1QrOFdSS2g0MUluck56eC8vK0tGLzFtbG4xVDNjRytlWldOaEZwTkU1RmN1?=
 =?utf-8?B?aUVTZ09XYnNFelVhQTVDUW1Ga3ZzVXc3TDMxNTdqR1RoczJZOUVYV09HUFc5?=
 =?utf-8?B?b0g4Z2VhcVpZK01QOHNWYU94b1piNldsdE43YUxqK0tScmdESGwvcisyeVpk?=
 =?utf-8?B?YlR3VERLWUxDc3ozRmt0dk5iNURrbjN4a2lQTHdXVmh6cUlJRHN2ZGhadEVR?=
 =?utf-8?B?TFdQS1RnZVhzN3plRGtWMlNKWlZFSTEwVis5bXRDNEVrNWk2SE9CUXVnQzlO?=
 =?utf-8?B?REFzZU5kN28yUzZ2Y0RhVW0zVXY2eE90L0tpVFNGcDljbVNmQ2RtZHlFMDVV?=
 =?utf-8?B?ZTFIaEhiNWZ4RVlod0V0R0hwSkphQlpNd2pWSGtPZjlzZUNzUzhqbElldnNB?=
 =?utf-8?B?RVVrcFlTTlRQbUJaYTVDN3prUG02eDRYWXRKcW00d1I2Q2YxcmpKUnVoNEFB?=
 =?utf-8?B?Q2hLUG9Pb2lPMDYzMHk1d2VIaDkwSU54a3d2YVFxWXJqN3hrWFBSeTJnbytG?=
 =?utf-8?B?MUdRbVJFWjdRVFhtdWdIZEhpbmt4aThDK1dqamJXQkt4NCtZM2VzNGZUMk91?=
 =?utf-8?B?OFRuQ2NFVFdPZlR2Ryt0UUxrSk5pbVpQdmdFM0srRS9kK1RYak1qQWVGdUxZ?=
 =?utf-8?B?dVJ5MUlBaEVGd090Mm01ZjFJMStWMzRGR3Rma0RRSUtFcFlRSERpbHpzcUtY?=
 =?utf-8?B?WXYyMm5qYUw2QnA5RUNKL2IzUzRXSFh5MkJjVW1SUmg5T3B6dHFHOUJWWXRD?=
 =?utf-8?B?SGJjdEtFbmRIdXVrTjRseW9lWkhMT3VqWDhxZHVrQTB1dHozVDFXYmZHZ05Y?=
 =?utf-8?B?UFZMUUM1SStVUHJKaGk0MjlZU21qK2Vtc3EzWXhDZW1YQ0RueFBXRHpaMXIx?=
 =?utf-8?B?a0x5YnZBY09NRnNkemV1YmJ6a3dZVkhhb2lOV3ZJbzRwelNoU0ZJMTJ5Y0h3?=
 =?utf-8?B?Y1pOUzRlSjY2MGo4VEwvdzh6VkxKbzNMVEU3azJDMmVuRlV2dDRJUFlpeWJE?=
 =?utf-8?B?TzlxNEV1UFg1cnUzSjBKVUpxMS9vQy9NQjM5U1kwNVJVWWR4RjM2cldWVTNi?=
 =?utf-8?B?NWN1MDF3QURMR3pPSXhCMmhoZ3RadWtOV0pmWVBPeUJVNW5FNElITEd1ZkpL?=
 =?utf-8?B?YnZYRW8zWVFiRXFMWlJVV2ZvN2h6cEpZdTY2QzZkVUJIbElXTitsdnN1Z20v?=
 =?utf-8?B?cUc4RFd5Y2tlc05hcGNXaXpHTk1Oa09CUWM0M1dJV0xiY2V1QWQveFBrQjkw?=
 =?utf-8?B?MGkydk5pUW9sbzhQdGRsdzhKSFJ0cGduTmxZbCtIdGVHZ3kvdzNiWXArTVpr?=
 =?utf-8?B?ckgyNFAvSFZxakZrYVNrVTFBZmFmT0tvMUhuR0ZlaE15alMyZjg0ZldXZGc5?=
 =?utf-8?B?ck5iam4wVTlCTytjUjhlb3lCTTRwUktTbVBBdEtIUG5DSm1QR2I2V0NmWEo0?=
 =?utf-8?B?NURySkVnUmN0elArblF6eUppSXQ5R2NFNGxDYzhLdjBscEY3ajdVWEs5TXRp?=
 =?utf-8?B?bUs4VVJBMkJ2djdCeWxRd2lBdUhjeDg2aUZlcDhRdG9tOERvck0zdmU1eXNJ?=
 =?utf-8?B?bGRBb3ZKU0JNMjdRdlpFZWd5RHFSTlUxQXgzZDE0OUNncEdGUG40WWpaL01y?=
 =?utf-8?B?djVzeFpMKytxaDIwdjdKNCtkYzRSWXpNdVZiOUN2NG9KNTRkVWp5QnFEbUF1?=
 =?utf-8?B?ZUhoRWgxeGJ1NzJ0UC9FM2FjK2RTbkc5eVcvQWhhMm8yT2lNdHExQ0JGcUli?=
 =?utf-8?B?a1NOR2o5bVRmVmV0VFFoaS9EMW1wZFhwRnFKTzZ3THVFeFBDNFRYRXo5V2t4?=
 =?utf-8?B?aGlCZ2RBeG1WdVMzSGF6OTdXM0t3QlBLeUxwTXk1RHpUNXNONFlyMmZha3k5?=
 =?utf-8?Q?anI437m6HcBq8RwSlAxe39+6M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba4cf54-ba5b-4ec6-207f-08dbf4fbc0f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 19:03:51.6845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLtYwj+NmO4s3Q81yrAJVgO1zaafz+YE6eGfTpYDUc3b5p43PLYqZCKzOK7HzPSY1Dj/gZq6fxlrcxRPMxrIRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586

On 12/4/2023 04:15, Shyam Sundar S K wrote:
> PMF driver sends changing inputs from each subystem to TA for evaluating
> the conditions in the policy binary.
> 
> Add initial support of plumbing in the PMF driver for Smart PC to get
> information from other subsystems in the kernel.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/Makefile |   2 +-
>   drivers/platform/x86/amd/pmf/pmf.h    |  18 ++++
>   drivers/platform/x86/amd/pmf/spc.c    | 122 ++++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/tee-if.c |   3 +
>   4 files changed, 144 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/platform/x86/amd/pmf/spc.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index d2746ee7369f..6b26e48ce8ad 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -7,4 +7,4 @@
>   obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>   amd-pmf-objs := core.o acpi.o sps.o \
>   		auto-mode.o cnqf.o \
> -		tee-if.o
> +		tee-if.o spc.o
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 092be501d4d3..a4a73b845c09 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -150,6 +150,21 @@ struct smu_pmf_metrics {
>   	u16 infra_gfx_maxfreq; /* in MHz */
>   	u16 skin_temp; /* in centi-Celsius */
>   	u16 device_state;
> +	u16 curtemp; /* in centi-Celsius */
> +	u16 filter_alpha_value;
> +	u16 avg_gfx_clkfrequency;
> +	u16 avg_fclk_frequency;
> +	u16 avg_gfx_activity;
> +	u16 avg_socclk_frequency;
> +	u16 avg_vclk_frequency;
> +	u16 avg_vcn_activity;
> +	u16 avg_dram_reads;
> +	u16 avg_dram_writes;
> +	u16 avg_socket_power;
> +	u16 avg_core_power[2];
> +	u16 avg_core_c0residency[16];
> +	u16 spare1;
> +	u32 metrics_counter;
>   } __packed;
>   
>   enum amd_stt_skin_temp {
> @@ -601,4 +616,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>   int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>   void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>   int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
> +
> +/* Smart PC - TA interfaces */
> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>   #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> new file mode 100644
> index 000000000000..351efcbe83c4
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Platform Management Framework Driver - Smart PC Capabilities
> + *
> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *          Patil Rajesh Reddy <Patil.Reddy@amd.com>
> + */
> +
> +#include <acpi/button.h>
> +#include <linux/power_supply.h>
> +#include <linux/units.h>
> +#include "pmf.h"
> +
> +static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	u16 max, avg = 0;
> +	int i;
> +
> +	memset(dev->buf, 0, sizeof(dev->m_table));
> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> +
> +	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> +	in->ev_info.skin_temperature = dev->m_table.skin_temp;
> +
> +	/* Get the avg and max C0 residency of all the cores */
> +	max = dev->m_table.avg_core_c0residency[0];
> +	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
> +		avg += dev->m_table.avg_core_c0residency[i];
> +		if (dev->m_table.avg_core_c0residency[i] > max)
> +			max = dev->m_table.avg_core_c0residency[i];
> +	}
> +
> +	avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
> +	in->ev_info.avg_c0residency = avg;
> +	in->ev_info.max_c0residency = max;
> +	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
> +}
> +
> +static const char * const pmf_battery_supply_name[] = {
> +	"BATT",
> +	"BAT0",
> +};
> +
> +static int amd_pmf_get_battery_prop(enum power_supply_property prop)
> +{
> +	union power_supply_propval value;
> +	struct power_supply *psy;
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(pmf_battery_supply_name); i++) {
> +		psy = power_supply_get_by_name(pmf_battery_supply_name[i]);
> +		if (!psy)
> +			continue;
> +
> +		ret = power_supply_get_property(psy, prop, &value);
> +		if (ret) {
> +			power_supply_put(psy);
> +			return ret;
> +		}
> +	}
> +
> +	return value.intval;
> +}
> +
> +static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	int val;
> +
> +	val = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
> +	if (val < 0)
> +		return val;
> +	if (val != 1)
> +		return -ENODEV;
> +
> +	in->ev_info.bat_percentage = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
> +	/* all values in mWh metrics */
> +	in->ev_info.bat_design = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) /
> +		MILLIWATT_PER_WATT;
> +	in->ev_info.full_charge_capacity = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) /
> +		MILLIWATT_PER_WATT;
> +	in->ev_info.drain_rate = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) /
> +		MILLIWATT_PER_WATT;
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	int val;
> +
> +	switch (dev->current_profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		val = TA_BEST_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		val = TA_BETTER_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		val = TA_BEST_BATTERY;
> +		break;
> +	default:
> +		dev_err(dev->dev, "Unknown Platform Profile.\n");
> +		return -EOPNOTSUPP;
> +	}
> +	in->ev_info.power_slider = val;
> +
> +	return 0;
> +}
> +
> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	/* TA side lid open is 1 and close is 0, hence the ! here */
> +	in->ev_info.lid_state = !acpi_lid_open();
> +	in->ev_info.power_source = amd_pmf_get_power_source();
> +	amd_pmf_get_smu_info(dev, in);
> +	amd_pmf_get_battery_info(dev, in);
> +	amd_pmf_get_slider_info(dev, in);
> +}
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 468f3797a848..e3f17852d532 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -113,6 +113,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>   {
>   	struct ta_pmf_shared_memory *ta_sm = NULL;
>   	struct ta_pmf_enact_result *out = NULL;
> +	struct ta_pmf_enact_table *in = NULL;
>   	struct tee_param param[MAX_TEE_PARAM];
>   	struct tee_ioctl_invoke_arg arg;
>   	int ret = 0;
> @@ -123,11 +124,13 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>   	memset(dev->shbuf, 0, dev->policy_sz);
>   	ta_sm = dev->shbuf;
>   	out = &ta_sm->pmf_output.policy_apply_table;
> +	in = &ta_sm->pmf_input.enact_table;
>   
>   	memset(ta_sm, 0, sizeof(*ta_sm));
>   	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
>   	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
>   
> +	amd_pmf_populate_ta_inputs(dev, in);
>   	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
>   
>   	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);


