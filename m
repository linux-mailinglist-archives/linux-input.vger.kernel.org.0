Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF767B03F3
	for <lists+linux-input@lfdr.de>; Wed, 27 Sep 2023 14:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjI0M0D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Sep 2023 08:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjI0M0C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Sep 2023 08:26:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE4DE6;
        Wed, 27 Sep 2023 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695817561; x=1727353561;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=w7Z7GAGvbkE0au25RJJjN4TJdomnd2iP3p/t+pD5fTU=;
  b=hxP4Y4sljT/4VAT0ao4DLdnm74xOXgqyc1r9YXPXZgnAXP7TZbvY94xR
   JsBWXj/pA1kuubGdH2vBT5d0bCjtYW6ZFGRfJBvD5L1SXitTVqAA22qQd
   PPFQAmgq5qxPzc7ExggdIP0tfWOEqvibFpkfC7NA6B47AUc9ZcTQt4Sgi
   k2TCkmmqTwscdnNROvcLoXdIOzfjvRENZ9rTCi91OxeISJeSy3LrADyrc
   TcyDp7l8IYy+z369Fyc0il4qHQNbLVxbpoF5waV3LQAulAXD1qdRrLApM
   DIJ+1WhjkRv/w0GM0JtqoVh+a+BEMCero1BigcIYtR8tdTV4mozeWG8Jc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381712704"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381712704"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778523583"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="778523583"
Received: from clkuhl-mobl.amr.corp.intel.com (HELO idecesar-mobl.ger.corp.intel.com) ([10.252.53.225])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:25:54 -0700
Date:   Wed, 27 Sep 2023 15:25:47 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 09/15] platform/x86/amd/pmf: Add facility to dump TA
 inputs
In-Reply-To: <20230922175056.244940-10-Shyam-sundar.S-k@amd.com>
Message-ID: <3c1893f2-cf72-c423-5de8-1423b2113a9e@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com> <20230922175056.244940-10-Shyam-sundar.S-k@amd.com>
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

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> PMF driver sends constant inputs to TA which its gets via the other
> subsystems in the kernel. To debug certain TA issues knowing what inputs
> being sent to TA becomes critical. Add debug facility to the driver which
> can isolate Smart PC and TA related issues.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  3 +++
>  drivers/platform/x86/amd/pmf/spc.c    | 37 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/sps.c    |  2 +-
>  drivers/platform/x86/amd/pmf/tee-if.c |  1 +
>  4 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index c5334f1177a4..61a0f3225b62 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -592,6 +592,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>  bool is_pprof_balanced(struct amd_pmf_dev *pmf);
>  int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
>  
> +const char *source_as_str(unsigned int state);
>  
>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
>  int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
> @@ -622,4 +623,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>  
>  /* Smart PC - TA interfaces */
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 08159cd5f853..5c6745f56ed1 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -13,6 +13,43 @@
>  #include <linux/power_supply.h>
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
> +	dev_dbg(dev->dev, "Power Source : %s\n", source_as_str(in->ev_info.power_source));
> +	dev_dbg(dev->dev, "Battery Percentage : %d\n", in->ev_info.bat_percentage);
> +	dev_dbg(dev->dev, "Designed Battery Capacity : %d\n", in->ev_info.bat_design);
> +	dev_dbg(dev->dev, "Fully Charged Capacity : %d\n", in->ev_info.full_charge_capacity);
> +	dev_dbg(dev->dev, "Drain Rate : %d\n", in->ev_info.drain_rate);
> +	dev_dbg(dev->dev, "Socket Power : %d\n", in->ev_info.socket_power);
> +	dev_dbg(dev->dev, "Skin Temperature : %d\n", in->ev_info.skin_temperature);
> +	dev_dbg(dev->dev, "Avg C0 Residency : %d\n", in->ev_info.avg_c0residency);
> +	dev_dbg(dev->dev, "Max C0 Residency : %d\n", in->ev_info.max_c0residency);
> +	dev_dbg(dev->dev, "GFX Busy : %d\n", in->ev_info.gfx_busy);
> +	dev_dbg(dev->dev, "Connected Display Count : %d\n", in->ev_info.monitor_count);
> +	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
> +	dev_dbg(dev->dev, "==== TA inputs END ====\n");

Again, the printf format specifiers are wrong, shouldn't the compiler warn 
about them?

> +}
> +#else
> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
> +#endif
> +
>  static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	u16 max, avg = 0;
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index a70e67749be3..13e36b52dfe8 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -27,7 +27,7 @@ static const char *slider_as_str(unsigned int state)
>  	}
>  }
>  
> -static const char *source_as_str(unsigned int state)
> +const char *source_as_str(unsigned int state)
>  {
>  	switch (state) {
>  	case POWER_SOURCE_AC:
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 1629856c20b4..4844782d93c7 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -186,6 +186,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  	}
>  
>  	if (ta_sm->pmf_result == TA_PMF_TYPE__SUCCESS && out->actions_count) {
> +		amd_pmf_dump_ta_inputs(dev, in);
>  		dev_dbg(dev->dev, "action count:%d result:%x\n", out->actions_count,
>  			ta_sm->pmf_result);
>  		amd_pmf_apply_policies(dev, out);
> 

-- 
 i.

