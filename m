Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 092297B7E97
	for <lists+linux-input@lfdr.de>; Wed,  4 Oct 2023 14:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbjJDMDK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Oct 2023 08:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbjJDMDJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Oct 2023 08:03:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09442A1;
        Wed,  4 Oct 2023 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696420986; x=1727956986;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=COkxRDA3NTjhwUlXdXz6fmnuuZh/DzTb7V6k+Dxbo2E=;
  b=jxKvVY/YyBXpGdqKBgbhT8DoLMH8kER6G+h0aGwaNwUOEn+hVnaB8Ebk
   JtTukbFgn8DrpVT/y0M9y1zdqMGaCuWmyH9lPsrIJM6YjkTq9OzYG5fhN
   U0OvBHC3gqKS17fmxvZd6IcT/txS4G6Gj2rrwsXuAMh9RlG1g/c70uNJ1
   99ILrcUKJimcretPCmkDVA3CDdHEJ7/8lRkDnlAZ1r1rx+t06qCHB9UWO
   SEzwWgRN8bFtEzeWQmUo9nkdcxAlTC4Hb9L94k03LEX+GcCxc4PjPlhyj
   I1wQcSIH4E7v+nNQfFRYacvhcpr1C93MhrUd9rrQirqOTcicxX0Zs4B9l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382012542"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="382012542"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 05:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="727978775"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="727978775"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 05:03:00 -0700
Date:   Wed, 4 Oct 2023 15:02:58 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 02/16] platform/x86/amd/pmf: Add support PMF-TA
 interaction
In-Reply-To: <20230930083715.2050863-3-Shyam-sundar.S-k@amd.com>
Message-ID: <454df7c3-b796-952b-a4d3-a79b6d55433@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com> <20230930083715.2050863-3-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 30 Sep 2023, Shyam Sundar S K wrote:

> PMF TA (Trusted Application) loads via the TEE environment into the
> AMD ASP.
> 
> PMF-TA supports two commands:
> 1) Init: Initialize the TA with the PMF Smart PC policy binary and
> start the policy engine. A policy is a combination of inputs and
> outputs, where;
>  - the inputs are the changing dynamics of the system like the user
>    behaviour, system heuristics etc.
>  - the outputs, which are the actions to be set on the system which
>    lead to better power management and enhanced user experience.
> 
> PMF driver acts as a central manager in this case to supply the
> inputs required to the TA (either by getting the information from
> the other kernel subsystems or from userland)
> 
> 2) Enact: Enact the output actions from the TA. The action could be
> applying a new thermal limit to boost/throttle the power limits or
> change system behavior.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    | 10 +++
>  drivers/platform/x86/amd/pmf/tee-if.c | 97 ++++++++++++++++++++++++++-
>  2 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 02460c2a31ea..e0837799f521 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -59,6 +59,9 @@
>  #define ARG_NONE 0
>  #define AVG_SAMPLE_SIZE 3
>  
> +/* TA macros */
> +#define PMF_TA_IF_VERSION_MAJOR				1
> +
>  /* AMD PMF BIOS interfaces */
>  struct apmf_verify_interface {
>  	u16 size;
> @@ -184,6 +187,7 @@ struct amd_pmf_dev {
>  	struct tee_shm *fw_shm_pool;
>  	u32 session_id;
>  	void *shbuf;
> +	struct delayed_work pb_work;
>  	bool smart_pc_enabled;
>  };
>  
> @@ -395,6 +399,12 @@ struct apmf_dyn_slider_output {
>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>  } __packed;
>  
> +/* cmd ids for TA communication */
> +enum ta_pmf_command {
> +	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
> +	TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
> +};
> +
>  struct ta_pmf_shared_memory {
>  	int command_id;
>  	int resp_id;
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 4db80ca59a11..1b3985cd7c08 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -13,9 +13,96 @@
>  #include "pmf.h"
>  
>  #define MAX_TEE_PARAM	4
> +
> +/* Policy binary actions sampling frequency (in ms) */
> +static int pb_actions_ms = 1000;

MSEC_PER_SEC (from #include <linux/time.h>, don't include the vdso one).

> +#ifdef CONFIG_AMD_PMF_DEBUG
> +module_param(pb_actions_ms, int, 0644);
> +MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
> +#endif

-- 
 i.

