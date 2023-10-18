Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD027CD75C
	for <lists+linux-input@lfdr.de>; Wed, 18 Oct 2023 11:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjJRJAz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Oct 2023 05:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbjJRJAy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Oct 2023 05:00:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB51FF;
        Wed, 18 Oct 2023 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697619652; x=1729155652;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Bz4RQKoB2bOF4jPSwqa+tusF8wmGmJ55+wiIyaWo9o4=;
  b=nhLrEBhP4+tC6gV4GCIjcP2BoFoiUt3QgEgmIll1b4u+P4Wl45P3yR6y
   Ic3+Mx1/VQxsgBcuEPHTyh6IvNpqj0qUUfNsFTNCdK2XIrXpRX5IQpFCP
   VCsGf4Dej8qYm8dEOaGpLGPFxC+IHL3EgHschAKBR84bMzgqvOERKY26I
   Y0dths7mnSUIUoWzk8YfRUxX4QFGk+AozRIAJOOjq8lfKJMKpNFdDSQOQ
   oF0hm3h0WK5rJ5ylBNfzHCs+0VERtbn+HMc9E3H9jrhMVKRQOzqEUp0O9
   PPAkzVvBF/l4dmxUmuT8FDRnfrl+maHBNKE4YrmGasF4oXwx9advudG6/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384852895"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="384852895"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 02:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="760147861"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="760147861"
Received: from gruberda-mobl1.ger.corp.intel.com ([10.252.62.52])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 02:00:46 -0700
Date:   Wed, 18 Oct 2023 12:00:44 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 10/17] platform/x86/amd/pmf: Add facility to dump TA
 inputs
In-Reply-To: <20231018070241.2041529-11-Shyam-sundar.S-k@amd.com>
Message-ID: <ef47873-9c61-65c4-4b4f-deef1959de71@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com> <20231018070241.2041529-11-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 18 Oct 2023, Shyam Sundar S K wrote:

> PMF driver sends constant inputs to TA which its gets via the other
> subsystems in the kernel. To debug certain TA issues knowing what inputs
> being sent to TA becomes critical. Add debug facility to the driver which
> can isolate Smart PC and TA related issues.
> 
> Also, make source_as_str() as non-static function as this helper is
> required outside of sps.c file.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  3 +++
>  drivers/platform/x86/amd/pmf/spc.c    | 37 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/tee-if.c |  1 +
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 216a9f795436..593930519039 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -602,6 +602,7 @@ bool is_pprof_balanced(struct amd_pmf_dev *pmf);
>  int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
>  const char *amd_pmf_source_as_str(unsigned int state);
>  
> +const char *amd_pmf_source_as_str(unsigned int state);
>  
>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
>  int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
> @@ -632,4 +633,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>  
>  /* Smart PC - TA interfaces */
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index bd5061fdfdbe..512e0c66efdc 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -14,6 +14,43 @@
>  #include <linux/units.h>
>  #include "pmf.h"
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static const char *ta_slider_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case TA_BEST_PERFORMANCE:
> +		return "PERFORMANCE";
> +	case TA_BETTER_PERFORMANCE:
> +		return "BALANCED";
> +	case TA_BEST_BATTERY:
> +		return "POWER_SAVER";
> +	default:
> +		return "Unknown TA Slider State";
> +	}
> +}
> +
> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	dev_dbg(dev->dev, "==== TA inputs START ====\n");
> +	dev_dbg(dev->dev, "Slider State : %s\n", ta_slider_as_str(in->ev_info.power_slider));
> +	dev_dbg(dev->dev, "Power Source : %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
> +	dev_dbg(dev->dev, "Battery Percentage : %u\n", in->ev_info.bat_percentage);
> +	dev_dbg(dev->dev, "Designed Battery Capacity : %u\n", in->ev_info.bat_design);
> +	dev_dbg(dev->dev, "Fully Charged Capacity : %u\n", in->ev_info.full_charge_capacity);
> +	dev_dbg(dev->dev, "Drain Rate : %d\n", in->ev_info.drain_rate);
> +	dev_dbg(dev->dev, "Socket Power : %u\n", in->ev_info.socket_power);
> +	dev_dbg(dev->dev, "Skin Temperature : %u\n", in->ev_info.skin_temperature);
> +	dev_dbg(dev->dev, "Avg C0 Residency : %u\n", in->ev_info.avg_c0residency);
> +	dev_dbg(dev->dev, "Max C0 Residency : %u\n", in->ev_info.max_c0residency);
> +	dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
> +	dev_dbg(dev->dev, "Connected Display Count : %u\n", in->ev_info.monitor_count);
> +	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");

"open" / "closed" is generic enough that I think it would warrant adding
include/linux/string_choices.h helper for it (it should be lowercase 
there but that difference probably is not an issue for these debug 
prints).

I'd also remove that extra space before :.

-- 
 i.

> +	dev_dbg(dev->dev, "==== TA inputs END ====\n");
> +}
> +#else
> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
> +#endif
> +
>  static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	u16 max, avg = 0;
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index d48f980fb1db..0eba258f4040 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -182,6 +182,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  	}
>  
>  	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
> +		amd_pmf_dump_ta_inputs(dev, in);
>  		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
>  			ta_sm->pmf_result);
>  		amd_pmf_apply_policies(dev, out);
> 
