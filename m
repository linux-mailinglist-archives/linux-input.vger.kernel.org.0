Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C64347B0591
	for <lists+linux-input@lfdr.de>; Wed, 27 Sep 2023 15:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjI0Ngq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Sep 2023 09:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbjI0Ngq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Sep 2023 09:36:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9B2FC;
        Wed, 27 Sep 2023 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695821804; x=1727357804;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fdvcNS8sPUuvoomLIhYt1Lp4qOK7EMXglT6h/GgFXOg=;
  b=RzeMKcEwXr4ONCR715rKA4ZCEHBibPLK6cyoMCE8oP9Bve/f8GhHJdAa
   0HAcFbnMR0/kGyA6bP45p1w3jfZkLr1pgTqG2C9gluCkyNMpqdRQfOvlJ
   Nd02g8SnCaetxy6Q7XnYp4CFhnImaDi2wfGNUKpHgKeCZJmyVXNeWnZ0o
   3vhuWLKtirrhZrHBG29P6PgtE3GBTNkFB5d7pd4WecckKeQCpS6x1GdQW
   ApFrEvII4W43vUR+oNLgP7t7GDi5MX3qEu8B6MV/HiIuqq43TzYjYSflp
   iTtS8RPTx4peQ0ukAxHkiDYAUa5ymhcweFiENDNug/+JJjB9s8pUrF0TF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384614744"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="384614744"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996157205"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="996157205"
Received: from clkuhl-mobl.amr.corp.intel.com (HELO idecesar-mobl.ger.corp.intel.com) ([10.252.53.225])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:36:39 -0700
Date:   Wed, 27 Sep 2023 16:36:37 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set
 interface
In-Reply-To: <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
Message-ID: <2a5b242b-b074-7fdb-fcdb-683d52b9da3@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com> <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> For the Smart PC Solution to fully work, it has to enact to the actions
> coming from TA. Add the initial code path for set interface to AMDGPU.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>  drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>  include/linux/amd-pmf-io.h              |  1 +
>  4 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> index 232d11833ddc..5c567bff0548 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
> +
> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
> +{
> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
> +	struct backlight_device *bd;
> +
> +	if (!(adev->flags & AMD_IS_APU)) {
> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
> +		return -ENODEV;
> +	}
> +
> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!bd)
> +		return -ENODEV;
> +
> +	backlight_device_set_brightness(bd, pmf->brightness);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 9032df4ba48a..ce89cc0daa5a 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -73,6 +73,7 @@
>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
>  #define PMF_POLICY_SYSTEM_STATE					9
> +#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
>  #define PMF_POLICY_P3T						38
>  
>  /* TA macros */
> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>  };
>  
>  struct pmf_action_table {
> +	unsigned long display_brightness;
>  	enum system_state system_state;
>  	unsigned long spl; /* in mW */
>  	unsigned long sppt; /* in mW */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 1608996654e8..eefffff83a4c 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>  	return 0;
>  }
>  
> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)

Changing return type but no caller is changed to handle the error??

>  {
>  	u32 val, event = 0;
> -	int idx;
> +	int idx, ret;
>  
>  	for (idx = 0; idx < out->actions_count; idx++) {
>  		val = out->actions_list[idx].value;
> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  				dev->prev_data->system_state = 0;
>  			}
>  			break;
> +
> +		case PMF_POLICY_DISPLAY_BRIGHTNESS:
> +			ret = amd_pmf_get_gfx_data(&dev->gfx_data);
> +			if (ret)
> +				return ret;
> +
> +			dev->prev_data->display_brightness = dev->gfx_data.brightness;
> +			if (dev->prev_data->display_brightness != val) {
> +				dev->gfx_data.brightness = val;
> +				amd_pmf_set_gfx_data(&dev->gfx_data);
> +				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
> +			}
> +			break;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index a2d4af231362..ecae387ddaa6 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>  };
>  
>  int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>  #endif
> 

-- 
 i.

