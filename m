Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA9957B0583
	for <lists+linux-input@lfdr.de>; Wed, 27 Sep 2023 15:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjI0Ndk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Sep 2023 09:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbjI0Ndj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Sep 2023 09:33:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B12126;
        Wed, 27 Sep 2023 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695821618; x=1727357618;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tNXbaP84V7x0l1RiSAeJ57A/0sV133PxSVSNBCacOvs=;
  b=C3c4dTvThl1wHZZbniRrd6VWmO8Su4lxN0vtkEVXk0dheb8dF9kV+0Zh
   4x4ZaWj9dr+oP3+3H11rqKaPR72uOZFdxQeltc+sAlZO2doRm9NLjAkCM
   qpaw+PJTM/xmCztfKPV2QxG1I62Nla9+aAAGz0/AkY671l4K2W+Hx+7Oe
   si9u8JSrfE6eELmCWQ0OmH6tKt1HC3A67MIASNxSR1O1G0M3k6ku0PmIq
   71ckB2ZNq99diBiyjM3BRvCqsvgrSKA/RQTw3xrh9OJcrpCvcLB4ctV/4
   1MvOT0HNt8lqSxPvozJ+9fHMifQXuaRr3z/SO0lcve9BQ6dh7bKnHnOuZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="385685315"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="385685315"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="872881847"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="872881847"
Received: from clkuhl-mobl.amr.corp.intel.com (HELO idecesar-mobl.ger.corp.intel.com) ([10.252.53.225])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:33:33 -0700
Date:   Wed, 27 Sep 2023 16:33:30 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        Basavaraj Natikar <basavaraj.natikar@amd.com>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
        Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 15/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface
 for ALS
In-Reply-To: <20230922175056.244940-16-Shyam-sundar.S-k@amd.com>
Message-ID: <4f542b88-5c8d-4177-50d0-50b0daeaa3a4@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com> <20230922175056.244940-16-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the Ambient light via the Ambient
> Light Sensor (ALS) which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 20 +++++++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c            |  5 +++++
>  include/linux/amd-pmf-io.h                    |  2 ++
>  5 files changed, 34 insertions(+)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> index cd57037bf217..a1950bc6e6ce 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> @@ -39,6 +39,7 @@ struct amd_mp2_sensor_info {
>  
>  struct sfh_dev_status {
>  	bool is_hpd_present;
> +	bool is_als_present;
>  };
>  
>  struct amd_mp2_dev {
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index 9c623456ee12..d8dad39d68b5 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -77,6 +77,9 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
>  		case HPD_IDX:
>  			privdata->dev_en.is_hpd_present = false;
>  			break;
> +		case ALS_IDX:
> +			privdata->dev_en.is_als_present = false;
> +			break;
>  		}
>  
>  		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
> @@ -188,6 +191,9 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>  			case HPD_IDX:
>  			privdata->dev_en.is_hpd_present = true;
>  				break;
> +			case ALS_IDX:
> +			privdata->dev_en.is_als_present = true;
> +				break;
>  			}
>  		}
>  		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 63a5bbca5a09..2f8200fc3062 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -94,12 +94,32 @@ static int amd_sfh_hpd_info(u8 *user_present)
>  	return  -ENODEV;
>  }
>  
> +static int amd_sfh_als_info(u32 *ambient_light)
> +{
> +	if (emp2 && emp2->dev_en.is_als_present) {
> +		struct sfh_als_data als_data;
> +		void __iomem *sensoraddr;
> +
> +		sensoraddr = emp2->vsbase +
> +			(ALS_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
> +			OFFSET_SENSOR_DATA_DEFAULT;
> +		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
> +		*ambient_light = float_to_int(als_data.lux);
> +
> +		return 0;
> +	}
> +
> +	return -ENODEV;
> +}
> +
>  int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
>  {
>  	if (sfh_info) {
>  		switch (op) {
>  		case MT_HPD:
>  			return amd_sfh_hpd_info(&sfh_info->user_present);
> +		case MT_ALS:
> +			return amd_sfh_als_info(&sfh_info->ambient_light);
>  		}
>  	}
>  	return -1;
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 97293ae25cf5..8e19b351e76f 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -49,6 +49,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  			"Connected" : "disconnected/unknown");
>  	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
>  	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
> +	dev_dbg(dev->dev, "Ambient Light : %d\n", in->ev_info.ambient_light);

%d vs u32

>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
>  #else
> @@ -161,6 +162,10 @@ static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact
>  {
>  	struct amd_sfh_info sfh_info;
>  
> +	/* get ALS data */
> +	amd_get_sfh_info(&sfh_info, MT_ALS);
> +	in->ev_info.ambient_light = sfh_info.ambient_light;
> +
>  	/* get HPD data */
>  	amd_get_sfh_info(&sfh_info, MT_HPD);
>  	switch (sfh_info.user_present) {
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 4f82973f6ad2..dac0af573a16 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -31,6 +31,7 @@ int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>  /* amd-sfh */
>  enum sfh_message_type {
>  	MT_HPD,
> +	MT_ALS,
>  };
>  
>  enum hpd_info {
> @@ -40,6 +41,7 @@ enum hpd_info {
>  };
>  
>  struct amd_sfh_info {
> +	u32 ambient_light;
>  	u8 user_present;
>  	/* add future caps below */
>  };
> 

-- 
 i.

