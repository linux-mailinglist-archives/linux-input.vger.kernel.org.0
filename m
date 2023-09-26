Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E552F7AF120
	for <lists+linux-input@lfdr.de>; Tue, 26 Sep 2023 18:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbjIZQs4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Sep 2023 12:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235309AbjIZQsz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Sep 2023 12:48:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDB8DE;
        Tue, 26 Sep 2023 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695746928; x=1727282928;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9+1cTdhwpTLFo2IKCbqmwf+At8IpEJ3jERwHHUF/8GU=;
  b=bSgwTt5OAGukIafQp2cnYxGP9Mp2wBye0hR3nL91TTgQXWYl3+lJIdiK
   e8wEzpFcSFUbtwz+OJWTzhDyLMCWvR/gTX+LVzbURqDQoh2C24RwOS0TA
   NmER5FynRuBcz5cIUHftEaTefDhmukaqxmHBb9DB6FGOPQR5c/avlJO4H
   LEiEztAXCybgti9HGRmNS5Bh6HdhLeZYZ55KequFp3HZY4pkRwSSIXehP
   hOlCxZHKzljd450hDe7B8485QNs9k2+K3oU5qs021hIiAUdHLnKVPTHDn
   PuCs9OgdOsyZBNs7KC5QcQx2ZnPMfrUGgif1M9uXQawAotOIujERpWqJz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385462459"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="385462459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 09:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="225022"
Received: from hhalmen-mobl.ger.corp.intel.com ([10.251.219.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 09:48:14 -0700
Date:   Tue, 26 Sep 2023 19:48:40 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/15] platform/x86/amd/pmf: Add support PMF-TA
 interaction
In-Reply-To: <20230922175056.244940-3-Shyam-sundar.S-k@amd.com>
Message-ID: <96a8196-723e-e884-2fe2-65f1ff342b9d@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com> <20230922175056.244940-3-Shyam-sundar.S-k@amd.com>
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
> index 02460c2a31ea..a9333ff6c0a7 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -59,6 +59,9 @@
>  #define ARG_NONE 0
>  #define AVG_SAMPLE_SIZE 3
>  
> +/* TA macros */
> +#define PMF_TA_IF_VERSION__MAJOR				1

I suppose double _ is not intentional?

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
> +	TA_PMF_COMMAND_POLICY_BUILDER__INITIALIZE,
> +	TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES

Add comma to the second line too.

Did you mean to have double _?

> +};
> +
>  struct ta_pmf_shared_memory {
>  	int command_id;
>  	int resp_id;
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index b48340edbf44..1fce04beacb3 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -13,9 +13,96 @@
>  #include "pmf.h"
>  
>  #define MAX_TEE_PARAM	4
> +
> +/* Policy binary actions sampling frequency (in ms) */
> +static int pb_actions_ms = 1000;
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +module_param(pb_actions_ms, int, 0644);
> +MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
> +#endif
> +
>  static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
>  						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
>  
> +static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
> +				 struct tee_ioctl_invoke_arg *arg,
> +				 struct tee_param *param)
> +{
> +	memset(arg, 0, sizeof(*arg));
> +	memset(param, 0, MAX_TEE_PARAM * sizeof(*param));
> +
> +	arg->func = cmd;
> +	arg->session = dev->session_id;
> +	arg->num_params = MAX_TEE_PARAM;
> +
> +	/* Fill invoke cmd params */
> +	param[0].u.memref.size = sizeof(struct ta_pmf_shared_memory);
> +	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
> +	param[0].u.memref.shm = dev->fw_shm_pool;
> +	param[0].u.memref.shm_offs = 0;
> +}
> +
> +static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
> +{
> +	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct tee_param param[MAX_TEE_PARAM];
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret = 0;
> +
> +	if (!dev->tee_ctx)
> +		return -ENODEV;
> +
> +	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
> +	memset(ta_sm, 0, sizeof(struct ta_pmf_shared_memory));
> +	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES;
> +	ta_sm->if_version = PMF_TA_IF_VERSION__MAJOR;
> +
> +	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES, &arg, param);
> +
> +	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(dev->dev, "%s failed TEE err: %x, ret:%x\n", __func__, arg.ret, ret);

No __func__s please.

> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
> +{
> +	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct tee_param param[MAX_TEE_PARAM];
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret = 0;
> +
> +	if (!dev->tee_ctx) {
> +		dev_err(dev->dev, "%s tee_ctx no context\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
> +	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER__INITIALIZE;
> +	ta_sm->if_version = PMF_TA_IF_VERSION__MAJOR;
> +
> +	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER__INITIALIZE, &arg, param);
> +
> +	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(dev->dev, "%s failed TEE err: %x, ret:%x\n", __func__, arg.ret, ret);
> +		return -EINVAL;
> +	}
> +
> +	return ta_sm->pmf_result;
> +}
> +
> +static void amd_pmf_invoke_cmd(struct work_struct *work)
> +{
> +	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, pb_work.work);
> +
> +	amd_pmf_invoke_cmd_enact(dev);
> +	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
> +}
> +
>  static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>  {
>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> @@ -97,10 +184,18 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>  
>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  {
> -	return amd_pmf_tee_init(dev);
> +	int ret;
> +
> +	ret = amd_pmf_tee_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
> +	return 0;
>  }
>  
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  {
> +	cancel_delayed_work_sync(&dev->pb_work);
>  	amd_pmf_tee_deinit(dev);
>  }
> 

-- 
 i.

