Return-Path: <linux-input+bounces-482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB3803E0D
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 20:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 670D81C20925
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 19:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFEE30F90;
	Mon,  4 Dec 2023 19:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k8AmsDve"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18BAD5;
	Mon,  4 Dec 2023 11:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6/7mAbFylAueLwnJF07SBz2k129917dxVSXwGmtgWSiLZtLaaS595+sJeZz4pgRIS1XTAfStx7/HI7W8n3wmClMnO8CpY/7Jyt+AkQF6Uw1G0haqS6OKCj7yR0gr0+UyUpSrWyF4qzuTgUzlmF/4aw61DEMv60kRqvWVZFnaQY7Dz7tytXQcDZUg8ghwMtcKRQRb2045FLJarVKpaR2dz9UhJgop30Pek7vb6mccj9QKbU5soIASXbyN90t82L6hJA6vHdyO/VWFnzO40yzv0kx/2q9L6IOmYQs8WEgXU3DDNftGJhp8j5H/+UzoREZEyoLriGIrbswJ83TrQ8DBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMKSllGswmR4oIQ3JSIvhbt/7UCNwkqo8jRV6ZBJTpE=;
 b=AV8K9x8nIvz39XGOHzVupYE5iWS4knfSwFLxz2F3sYitHZDTLJ6efk+Or5g4ET0VD9v/bUW68JhzS4fGRxUHkVU7mRm4wZdYf9Kdng9glGdkK/+q8AUuICyUrouN8oeQxLc98KXty4EhGM6RMSeCjoThLbhpidTU+0jd+MLF/5QnE5Xgm5ZTPyMo8v69j1UxsI9zOm6R7GzL0y+MDnRinyvffzd9PCrLbpV0PsmTNjJCStI8rzzpzTDj4W7JBzVNMfZ/bbpwo0MzH7gSByhsqdv2PNH5bac9bWz+C8olsREvb+yALcoQHnRUdzdofX7w2j64tLuMtcwns2CSrc9Igg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMKSllGswmR4oIQ3JSIvhbt/7UCNwkqo8jRV6ZBJTpE=;
 b=k8AmsDveHU4DPq4zFHr6C1TE0a8EoivXnXfTcqx6RprR2k/BvvJm7dnkAx1YGDsLdkliI3Kyh37dGSgUrGh7EXITVEvGrn70vKYl9Bha2Q38CHeiafXPpha3q5yeG82erqsaZKs99Zq8+qhPJ4GfqLlcguc5mDAcGDtAvhqDg6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 19:05:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7046.034; Mon, 4 Dec 2023
 19:05:59 +0000
Message-ID: <59cb0555-e612-4157-99ce-a0b62146a2a5@amd.com>
Date: Mon, 4 Dec 2023 13:05:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/15] platform/x86/amd/pmf: Add support for PMF Policy
 Binary
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-5-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231204101548.1458499-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: ed22a2d5-6118-4ead-0c7d-08dbf4fc0d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GJHgJ1ivScTPH7Jhp7oeKpHdGoddOEKqfdMYjr0xWAQgB9cmR1mT+kRYt7c6ELSWu6Yt5/iCarTf0Xq1aNjD+zYtujVUsaiBZv9PaaD+rh3t735ULO4jd681fM+76y4h8i1RtccVMt5myIseWxm3kkvfUnFAax8E1O+4pDojyFNBPnjh0v+4oQ5/N3RzASOr3TjhV+pPl6703uDr/2tPkUHxJycPJiGGPs2JwsNv182LtoNsPBtPuflxvdB3U8PXhOJ0thebKhignDlg9Tp+S5b3B6oSNUjH7V1h9cKnyuPzqqOj4qhG8CF/0D+g9UzYpRcbBS2PgFhlJWc7sXSan+qVNeKhws8fMdPNmn+sS42U1B2yo7AEFW39VZ6Kc2I4uZUTewHuQb/wT2WFgV8pg5RJlHM1sQVzigurPMK5vAQXcY08pSSr6Dm9zoYpkaLlZHmZO57GaXf+ovTsfHbvwl9bLTTHDiwe/twJ5QJz1DTHtnjGoUVfo5Lbv0StKn1gqXMqleNDn62y06WDNk+lK7f3B9J92ULgOm2R+8c5lN1x7hk6ADNegUQtQ6xKAgGvJ7GE0XZ5JEweXL3hmPZaSD0CGkO1iElj8NiIdwhH09ZTlcCahVJGpUZ9E8nzdmQTBoiT16cBC4gdNuXozU0q+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(38100700002)(31686004)(30864003)(2906002)(5660300002)(83380400001)(6512007)(53546011)(6666004)(26005)(6506007)(2616005)(478600001)(6486002)(36756003)(41300700001)(66946007)(66476007)(66556008)(31696002)(4326008)(86362001)(8936002)(316002)(44832011)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3V4dGdCQU9GWkxLc0RCR01id2daZWhodzZNWXN5cVlWYzlOem9OdEEvN09F?=
 =?utf-8?B?R2JLSGVxZFEySWlsZDRZZW9FdlVZK0NYRWptTWEwdmpCZGVlbWtpN1VGejNP?=
 =?utf-8?B?RU4rY3JmRmZhcnczQm5Sb0RXdlNPdkprUGJiT04vaEpJbElUTXdMUnQ1TWRh?=
 =?utf-8?B?M2hRTmQ3Rkpib3g3RlAwZFVGWXA3aW5NY05TREVVVDJkNUJ5cEk3T1F6V0RX?=
 =?utf-8?B?RW9qOWpqSHMvNnZVQ2QySjJkTXVKSFphdi8xYmh4YnNBb0k3VHJTNzVpMUJ6?=
 =?utf-8?B?M2Q4MlRxRGVGM25EaTZUZDBteDBDbVErNjl4THZ3aUlmTWdxRE9idS85YjA5?=
 =?utf-8?B?eHA4c0dtWDVBc3lsTGI2T3ZoWTcwcEs0dHYwaHkvd2pXOE83WXNuZDBweFRR?=
 =?utf-8?B?K1BxMktHeklUWUtMY0dJZzVENy8vMGh1WjhSdC9oK1Z2Zk4zVXFMdkFqVDBh?=
 =?utf-8?B?WnRudk8wdzJBZjlocnpWajRUeHpCNVdiMWpZR0Q3TDhPd0ZLelJNb3owaldi?=
 =?utf-8?B?SkpCVGE4c2M1ZTgxWCtUZWJ2ZGdrMjBkZzY5RXBsV2IyUnVTMU1KMGowZ2M5?=
 =?utf-8?B?VmlGeFM5bzl6amhETHFWS1hwV1BweW55WmF0RW1CR055dWp4ejZXeEUvb3pq?=
 =?utf-8?B?bHRFU0lOWS94SHc3Sk1BYnV4OGlvTGxaSUtJc3luL0lTaDFvck5qckcreW5Z?=
 =?utf-8?B?WEk0NnBVS3dUY0JOL2FhMnh5ZEhZRFh5Sy9LNnZSZjZ1MzZiSDVVa0szUVRj?=
 =?utf-8?B?T1FOZUdjcmZRd0JoYTJPNm1vbHZ4WFdrYm5DZnAvS09WQ21vOTFCVFNoQ3Jh?=
 =?utf-8?B?blFUdnkrMXM2ekFPWkxJSkJJaC81MHNwdjd0T1gyRlRvSHBrNkY2WW85WG9U?=
 =?utf-8?B?TWk4UTBwaytYN1pyUjJUdVkycXpYL0N5RDl5Wm82OW5sWURRbmFMOFdjOW1r?=
 =?utf-8?B?d0NUejE4dFc5VktOQ3VHejM3QWUvWCsxRFZXQWcxOWNkOGVmZ25kU2VHVmIr?=
 =?utf-8?B?YUF0TmtXNkRUQ05ZM3dSYWVMSVh6dnZOM2lUejRJWS9nckdOQ3FFR1BpcHVR?=
 =?utf-8?B?bGhZYzBLM0ZmZGlMekFIckd4Q0dPWTNRZ2tGbGJSMjAwNGgvVTJtUzBqN3Y5?=
 =?utf-8?B?c24xbWkxOHcxNDRwZEcvN0hJNHpicFhNampNT1RtZlRmdU9lWWw3SjFFVTVq?=
 =?utf-8?B?ZzFUaGMzL3htNHkyRk5ML2pFaTZ0QVFzaDJRTHRCYnBSdU9kU1R5UC9EVHlu?=
 =?utf-8?B?YTU3R2Uvd09uSExNZXV4MXM5OElaNWRicEdsMnNSbmlIUE5JcGt5N0FIb09k?=
 =?utf-8?B?d0FzNjFYMVE3Wk9jTzB3WVgwRmhlYU1TaXRzTmxzSWpGb2tOSGNCYTdybEtC?=
 =?utf-8?B?VGF5TjBadHRIeDlrZEVGRTVlVmJDUDBmMk9JTzhpbTRvYndVWWxrR0RLSzE2?=
 =?utf-8?B?bDRFSEoyQmdGTFdwQ290d1IzQUhRcWh2VjRhdzZMQXR0QVZPTS9kUXFJMWJV?=
 =?utf-8?B?SkF0ZkRQM0pJbVBDaE9SODlUN3h5OGN2RytnbDBpY0d5YnNSYTJNaWRnbkdv?=
 =?utf-8?B?T1BqYktGaEx2dU5uSldoU1R3RE4yYWFnK2MyblRtRGJxSlJCSUhNN281KzVp?=
 =?utf-8?B?bG1aV2VtVnZLbVpYVTJjbjFqTlJvNkE0VytPTnJYYWNCMXprTGszb1RhUW9S?=
 =?utf-8?B?bldVRUExaCtTRGxPeUJydW92bGVmM241SlZybEsvck9XbTU3S3F3aXRWTndm?=
 =?utf-8?B?ZVFsYjVISy9xOGdZdWdLZ0JqVkR6QmxkSlFzUmsyOGtNb3dxUThQU2hqTUx5?=
 =?utf-8?B?enVVTTI0SHBVWjRPUVcwb0Z3TVBWN1cvTzZmNG5xTEhrSWdEekF0Qk1KdXRV?=
 =?utf-8?B?cUdxbDgrQ1ExWTFXYTdjR0pOMEE3cnErY1pSWUdtK2loQUxOWElmSWlCZE9Q?=
 =?utf-8?B?VmxlYlZjaldYVXk2aEM1U2FMRFUyL3RwWldGNEZoQzJIZUtUbTBucUQ0dkNz?=
 =?utf-8?B?Y05BUTRSLzBDTDhpa3AxQllYc1ZQVzlKYmRGaHozSnRRNkgvNVdSSHAwZ0pk?=
 =?utf-8?B?UWlHWUxabHVpM0VlejBkLy91NUJHUVlrWVluV1JKVGlFaXVuZEVJSUhlb0VS?=
 =?utf-8?Q?6zXhCGbCL+CfKku+VYsaUJEW5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed22a2d5-6118-4ead-0c7d-08dbf4fc0d66
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 19:05:59.8725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jhH3tW2TBnhH5o+Axd4SCRZAoh8QoPNGFoy5T4HWgfFoZzT72AuPLkJFgnbT34pJxLvywt23kTlXBeBOvRjXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586

On 12/4/2023 04:15, Shyam Sundar S K wrote:
> PMF Policy binary is a encrypted and signed binary that will be part
> of the BIOS. PMF driver via the ACPI interface checks the existence
> of Smart PC bit. If the advertised bit is found, PMF driver walks
> the acpi namespace to find out the policy binary size and the address
> which has to be passed to the TA during the TA init sequence.
> 
> The policy binary is comprised of inputs (or the events) and outputs
> (or the actions). With the PMF ecosystem, OEMs generate the policy
> binary (or could be multiple binaries) that contains a supported set
> of inputs and outputs which could be specifically carved out for each
> usage segment (or for each user also) that could influence the system
> behavior either by enriching the user experience or/and boost/throttle
> power limits.
> 
> Once the TA init command succeeds, the PMF driver sends the changing
> events in the current environment to the TA for a constant sampling
> frequency time (the event here could be a lid close or open) and
> if the policy binary has corresponding action built within it, the
> TA sends the action for it in the subsequent enact command.
> 
> If the inputs sent to the TA has no output defined in the policy
> binary generated by OEMs, there will be no action to be performed
> by the PMF driver.
> 
> Example policies:
> 
> 1) if slider is performance ; set the SPL to 40W
> Here PMF driver registers with the platform profile interface and
> when the slider position is changed, PMF driver lets the TA know
> about this. TA sends back an action to update the Sustained
> Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.
> 
> 2) if user_away ; then lock the system
> Here PMF driver hooks to the AMD SFH driver to know the user presence
> and send the inputs to TA and if the condition is met, the TA sends
> the action of locking the system. PMF driver generates a uevent and
> based on the udev rule in the userland the system gets locked with
> systemctl.
> 
> The intent here is to provide the OEM's to make a policy to lock the
> system when the user is away ; but the userland can make a choice to
> ignore it.
> 
> and so on.

I think you can drop the 'and so on'.

> 
> The OEMs will have an utility to create numerous such policies and
> the policies shall be reviewed by AMD before signing and encrypting
> them. Policies are shared between operating systems to have seemless user
> experience.
> 
> Since all this action has to happen via the "amdtee" driver, currently
> there is no caller for it in the kernel which can load the amdtee driver.
> Without amdtee driver loading onto the system the "tee" calls shall fail
> from the PMF driver. Hence an explicit MODULE_SOFTDEP has been added
> to address this.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/amd/pmf/Kconfig  |   2 +-
>   drivers/platform/x86/amd/pmf/acpi.c   |  37 +++++++
>   drivers/platform/x86/amd/pmf/core.c   |   9 ++
>   drivers/platform/x86/amd/pmf/pmf.h    | 141 ++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/tee-if.c | 147 +++++++++++++++++++++++++-
>   5 files changed, 333 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 32a029e8db80..f246252bddd8 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -9,7 +9,7 @@ config AMD_PMF
>   	depends on POWER_SUPPLY
>   	depends on AMD_NB
>   	select ACPI_PLATFORM_PROFILE
> -	depends on TEE
> +	depends on TEE && AMDTEE
>   	help
>   	  This driver provides support for the AMD Platform Management Framework.
>   	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 3fc5e4547d9f..4ec7957eb707 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -286,6 +286,43 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>   	return 0;
>   }
>   
> +static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
> +{
> +	struct amd_pmf_dev *dev = data;
> +
> +	switch (res->type) {
> +	case ACPI_RESOURCE_TYPE_ADDRESS64:
> +		dev->policy_addr = res->data.address64.address.minimum;
> +		dev->policy_sz = res->data.address64.address.address_length;
> +		break;
> +	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +		dev->policy_addr = res->data.fixed_memory32.address;
> +		dev->policy_sz = res->data.fixed_memory32.address_length;
> +		break;
> +	}
> +
> +	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
> +		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
> +		return AE_ERROR;
> +	}
> +
> +	return AE_OK;
> +}
> +
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
> +{
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> +	acpi_status status;
> +
> +	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>   {
>   	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index f50b7ec9a625..c8f6ec4c2e2c 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -395,6 +395,14 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	dev->dev = &pdev->dev;
> +	err = apmf_check_smart_pc(dev);
> +	if (err)
> +		/*
> +		 * Lets not return from here if Smart PC bit is not advertised in
> +		 * the BIOS. This way, there will be some amount of power savings
> +		 * to the user with static slider (if enabled).
> +		 */
> +		pr_err("PMF Smart PC not advertised in BIOS!:%d\n", err);
>   
>   	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>   	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
> @@ -474,3 +482,4 @@ module_platform_driver(amd_pmf_driver);
>   
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
> +MODULE_SOFTDEP("pre: amdtee");
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 6a0e4c446dd3..092be501d4d3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -14,6 +14,11 @@
>   #include <linux/acpi.h>
>   #include <linux/platform_profile.h>
>   
> +#define POLICY_BUF_MAX_SZ		0x4b000
> +#define POLICY_SIGN_COOKIE		0x31535024
> +#define POLICY_COOKIE_OFFSET		0x10
> +#define POLICY_COOKIE_LEN		0x14
> +
>   /* APMF Functions */
>   #define APMF_FUNC_VERIFY_INTERFACE			0
>   #define APMF_FUNC_GET_SYS_PARAMS			1
> @@ -59,8 +64,21 @@
>   #define ARG_NONE 0
>   #define AVG_SAMPLE_SIZE 3
>   
> +/* Policy Actions */
> +#define PMF_POLICY_SPL						2
> +#define PMF_POLICY_SPPT						3
> +#define PMF_POLICY_FPPT						4
> +#define PMF_POLICY_SPPT_APU_ONLY				5
> +#define PMF_POLICY_STT_MIN					6
> +#define PMF_POLICY_STT_SKINTEMP_APU				7
> +#define PMF_POLICY_STT_SKINTEMP_HS2				8
> +
>   /* TA macros */
>   #define PMF_TA_IF_VERSION_MAJOR				1
> +#define TA_PMF_ACTION_MAX					32
> +#define TA_PMF_UNDO_MAX						8
> +#define TA_OUTPUT_RESERVED_MEM				906
> +#define MAX_OPERATION_PARAMS					4
>   
>   /* AMD PMF BIOS interfaces */
>   struct apmf_verify_interface {
> @@ -183,11 +201,16 @@ struct amd_pmf_dev {
>   	bool cnqf_supported;
>   	struct notifier_block pwr_src_notifier;
>   	/* Smart PC solution builder */
> +	unsigned char *policy_buf;
> +	u32 policy_sz;
>   	struct tee_context *tee_ctx;
>   	struct tee_shm *fw_shm_pool;
>   	u32 session_id;
>   	void *shbuf;
>   	struct delayed_work pb_work;
> +	struct pmf_action_table *prev_data;
> +	u64 policy_addr;
> +	void *policy_base;
>   	bool smart_pc_enabled;
>   };
>   
> @@ -399,17 +422,134 @@ struct apmf_dyn_slider_output {
>   	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>   } __packed;
>   
> +enum smart_pc_status {
> +	PMF_SMART_PC_ENABLED,
> +	PMF_SMART_PC_DISABLED,
> +};
> +
> +/* Smart PC - TA internals */
> +enum ta_slider {
> +	TA_BEST_BATTERY,
> +	TA_BETTER_BATTERY,
> +	TA_BETTER_PERFORMANCE,
> +	TA_BEST_PERFORMANCE,
> +	TA_MAX,
> +};
> +
>   /* Command ids for TA communication */
>   enum ta_pmf_command {
>   	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
>   	TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
>   };
>   
> +enum ta_pmf_error_type {
> +	TA_PMF_TYPE_SUCCESS,
> +	TA_PMF_ERROR_TYPE_GENERIC,
> +	TA_PMF_ERROR_TYPE_CRYPTO,
> +	TA_PMF_ERROR_TYPE_CRYPTO_VALIDATE,
> +	TA_PMF_ERROR_TYPE_CRYPTO_VERIFY_OEM,
> +	TA_PMF_ERROR_TYPE_POLICY_BUILDER,
> +	TA_PMF_ERROR_TYPE_PB_CONVERT,
> +	TA_PMF_ERROR_TYPE_PB_SETUP,
> +	TA_PMF_ERROR_TYPE_PB_ENACT,
> +	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_INFO,
> +	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_PCIE_INFO,
> +	TA_PMF_ERROR_TYPE_SYS_DRV_FW_VALIDATION,
> +	TA_PMF_ERROR_TYPE_MAX,
> +};
> +
> +struct pmf_action_table {
> +	u32 spl;		/* in mW */
> +	u32 sppt;		/* in mW */
> +	u32 sppt_apuonly;	/* in mW */
> +	u32 fppt;		/* in mW */
> +	u32 stt_minlimit;	/* in mW */
> +	u32 stt_skintemp_apu;	/* in C */
> +	u32 stt_skintemp_hs2;	/* in C */
> +};
> +
> +/* Input conditions */
> +struct ta_pmf_condition_info {
> +	u32 power_source;
> +	u32 bat_percentage;
> +	u32 power_slider;
> +	u32 lid_state;
> +	bool user_present;
> +	u32 rsvd1[2];
> +	u32 monitor_count;
> +	u32 rsvd2[2];
> +	u32 bat_design;
> +	u32 full_charge_capacity;
> +	int drain_rate;
> +	bool user_engaged;
> +	u32 device_state;
> +	u32 socket_power;
> +	u32 skin_temperature;
> +	u32 rsvd3[5];
> +	u32 ambient_light;
> +	u32 length;
> +	u32 avg_c0residency;
> +	u32 max_c0residency;
> +	u32 s0i3_entry;
> +	u32 gfx_busy;
> +	u32 rsvd4[7];
> +	bool camera_state;
> +	u32 workload_type;
> +	u32 display_type;
> +	u32 display_state;
> +	u32 rsvd5[150];
> +};
> +
> +struct ta_pmf_load_policy_table {
> +	u32 table_size;
> +	u8 table[POLICY_BUF_MAX_SZ];
> +};
> +
> +/* TA initialization params */
> +struct ta_pmf_init_table {
> +	u32 frequency; /* SMU sampling frequency */
> +	bool validate;
> +	bool sku_check;
> +	bool metadata_macrocheck;
> +	struct ta_pmf_load_policy_table policies_table;
> +};
> +
> +/* Everything the TA needs to Enact Policies */
> +struct ta_pmf_enact_table {
> +	struct ta_pmf_condition_info ev_info;
> +	u32 name;
> +};
> +
> +struct ta_pmf_action {
> +	u32 action_index;
> +	u32 value;
> +};
> +
> +/* Output actions from TA */
> +struct ta_pmf_enact_result {
> +	u32 actions_count;
> +	struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX];
> +	u32 undo_count;
> +	struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX];
> +};
> +
> +union ta_pmf_input {
> +	struct ta_pmf_enact_table enact_table;
> +	struct ta_pmf_init_table init_table;
> +};
> +
> +union ta_pmf_output {
> +	struct ta_pmf_enact_result policy_apply_table;
> +	u32 rsvd[TA_OUTPUT_RESERVED_MEM];
> +};
> +
>   struct ta_pmf_shared_memory {
>   	int command_id;
>   	int resp_id;
>   	u32 pmf_result;
>   	u32 if_version;
> +	union ta_pmf_output pmf_output;
> +	union ta_pmf_input pmf_input;
>   };
>   
>   /* Core Layer */
> @@ -460,4 +600,5 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>   /* Smart PC builder Layer */
>   int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>   void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>   #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 4036f435f1e2..468f3797a848 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -42,9 +42,77 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>   	param[0].u.memref.shm_offs = 0;
>   }
>   
> +static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> +{
> +	u32 val;
> +	int idx;
> +
> +	for (idx = 0; idx < out->actions_count; idx++) {
> +		val = out->actions_list[idx].value;
> +		switch (out->actions_list[idx].action_index) {
> +		case PMF_POLICY_SPL:
> +			if (dev->prev_data->spl != val) {
> +				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPL: %u\n", val);
> +				dev->prev_data->spl = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT:
> +			if (dev->prev_data->sppt != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT: %u\n", val);
> +				dev->prev_data->sppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_FPPT:
> +			if (dev->prev_data->fppt != val) {
> +				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update FPPT: %u\n", val);
> +				dev->prev_data->fppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT_APU_ONLY:
> +			if (dev->prev_data->sppt_apuonly != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
> +				dev->prev_data->sppt_apuonly = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_MIN:
> +			if (dev->prev_data->stt_minlimit != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
> +				dev->prev_data->stt_minlimit = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_APU:
> +			if (dev->prev_data->stt_skintemp_apu != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_APU: %u\n", val);
> +				dev->prev_data->stt_skintemp_apu = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_HS2:
> +			if (dev->prev_data->stt_skintemp_hs2 != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2: %u\n", val);
> +				dev->prev_data->stt_skintemp_hs2 = val;
> +			}
> +			break;
> +		}
> +	}
> +}
> +
>   static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>   {
>   	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_result *out = NULL;
>   	struct tee_param param[MAX_TEE_PARAM];
>   	struct tee_ioctl_invoke_arg arg;
>   	int ret = 0;
> @@ -52,7 +120,10 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>   	if (!dev->tee_ctx)
>   		return -ENODEV;
>   
> +	memset(dev->shbuf, 0, dev->policy_sz);
>   	ta_sm = dev->shbuf;
> +	out = &ta_sm->pmf_output.policy_apply_table;
> +
>   	memset(ta_sm, 0, sizeof(*ta_sm));
>   	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
>   	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
> @@ -65,6 +136,12 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>   		return ret;
>   	}
>   
> +	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
> +		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
> +			ta_sm->pmf_result);
> +		amd_pmf_apply_policies(dev, out);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -72,6 +149,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>   {
>   	struct ta_pmf_shared_memory *ta_sm = NULL;
>   	struct tee_param param[MAX_TEE_PARAM];
> +	struct ta_pmf_init_table *in = NULL;
>   	struct tee_ioctl_invoke_arg arg;
>   	int ret = 0;
>   
> @@ -80,10 +158,21 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>   		return -ENODEV;
>   	}
>   
> +	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
> +	memset(dev->shbuf, 0, dev->policy_sz);
>   	ta_sm = dev->shbuf;
> +	in = &ta_sm->pmf_input.init_table;
> +
>   	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
>   	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
>   
> +	in->metadata_macrocheck = false;
> +	in->sku_check = false;
> +	in->validate = true;
> +	in->frequency = pb_actions_ms;
> +	in->policies_table.table_size = dev->policy_sz;
> +
> +	memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
>   	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
>   
>   	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> @@ -103,6 +192,52 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
>   	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
>   }
>   
> +static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
> +{
> +	u32 cookie, length;
> +	int res;
> +
> +	cookie = readl(dev->policy_buf + POLICY_COOKIE_OFFSET);
> +	length = readl(dev->policy_buf + POLICY_COOKIE_LEN);
> +
> +	if (cookie != POLICY_SIGN_COOKIE || !length)
> +		return -EINVAL;
> +
> +	/* Update the actual length */
> +	dev->policy_sz = length + 512;
> +	res = amd_pmf_invoke_cmd_init(dev);
> +	if (res == TA_PMF_TYPE_SUCCESS) {
> +		/* Now its safe to announce that smart pc is enabled */
> +		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
> +		/*
> +		 * Start collecting the data from TA FW after a small delay
> +		 * or else, we might end up getting stale values.
> +		 */
> +		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
> +	} else {
> +		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> +		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
> +		return res;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> +{
> +	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> +	if (!dev->policy_buf)
> +		return -ENOMEM;
> +
> +	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
> +	if (!dev->policy_base)
> +		return -ENOMEM;
> +
> +	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
> +
> +	return amd_pmf_start_policy_engine(dev);
> +}
> +
>   static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>   {
>   	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> @@ -146,7 +281,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>   		goto out_ctx;
>   	}
>   
> -	size = sizeof(struct ta_pmf_shared_memory);
> +	size = sizeof(struct ta_pmf_shared_memory) + dev->policy_sz;
>   	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
>   	if (IS_ERR(dev->fw_shm_pool)) {
>   		dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
> @@ -190,11 +325,19 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   		return ret;
>   
>   	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
> -	return 0;
> +	amd_pmf_set_dram_addr(dev);
> +	amd_pmf_get_bios_buffer(dev);
> +	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
> +	if (!dev->prev_data)
> +		return -ENOMEM;
> +
> +	return dev->smart_pc_enabled;
>   }
>   
>   void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>   {
> +	kfree(dev->prev_data);
> +	kfree(dev->policy_buf);
>   	cancel_delayed_work_sync(&dev->pb_work);
>   	amd_pmf_tee_deinit(dev);
>   }


