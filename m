Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B87D7B7EF9
	for <lists+linux-input@lfdr.de>; Wed,  4 Oct 2023 14:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbjJDMX3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Oct 2023 08:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbjJDMX2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Oct 2023 08:23:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4889A93;
        Wed,  4 Oct 2023 05:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696422205; x=1727958205;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=q510avIETzCzx0UwcTwKxfmx1rOStfQU47IXRifeHpw=;
  b=JJyrmDQ+vEBCZhB/W5fwioOCChDHwZtc5PE47eYaB0wz/EOvLWnjcPT9
   YoTI7sBJZkh+EYAFpvXesLG6N3er3hIqPyk5D0pt9abEoKPh/VILCC1S7
   Ap9yJufGiB2/29kZ33OkcIlOSxrAOmnIY9uUFzv6bLkx+xuG/Li5a08vG
   LXsY6KN1yC7nzIWGJ29jidOGqRPfMIWzBUnI8JtiAd1BpeSQ5Wwz1nK1f
   Y/9Ms9sNXj0TEM2aVDssGJR2jjyy6yZ/NXpikmUjwMAi954B06FU2Cby2
   aMD69jEL54yn9TzbNCNpom4cgSMz6cMDoE0BqCka/VDITWOzjPidP7uVQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="414067306"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="414067306"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 05:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="817066912"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="817066912"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 05:23:20 -0700
Date:   Wed, 4 Oct 2023 15:23:17 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 08/16] platform/x86/amd/pmf: Add support to update
 system state
In-Reply-To: <20230930083715.2050863-9-Shyam-sundar.S-k@amd.com>
Message-ID: <b827b663-871-5437-247-1c6c502d596d@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com> <20230930083715.2050863-9-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 30 Sep 2023, Shyam Sundar S K wrote:

> PMF driver based on the output actions from the TA can request to update
> the system states like entering s0i3, lock screen etc. by generating
> an uevent. Based on the udev rules set in the userspace the event id
> matching the uevent shall get updated accordingly using the systemctl.
> 
> Sample udev rules under Documentation/admin-guide/pmf.rst.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309260515.5XbR6N0g-lkp@intel.com/

Please don't put lkp tags for patches that are still under development 
(even if the email you get misleadingly instructs you to). Only use them 
when you fix code that's already in tree based on LKP's report.

> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  Documentation/admin-guide/index.rst   |  1 +
>  Documentation/admin-guide/pmf.rst     | 25 ++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h    |  9 ++++++
>  drivers/platform/x86/amd/pmf/tee-if.c | 41 ++++++++++++++++++++++++++-
>  4 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/admin-guide/pmf.rst
> 
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index 43ea35613dfc..fb40a1f6f79e 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -119,6 +119,7 @@ configure specific aspects of kernel behavior to your liking.
>     parport
>     perf-security
>     pm/index
> +   pmf
>     pnp
>     rapidio
>     ras
> diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
> new file mode 100644
> index 000000000000..90072add511e
> --- /dev/null
> +++ b/Documentation/admin-guide/pmf.rst
> @@ -0,0 +1,25 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Set udev rules for PMF Smart PC Builder
> +---------------------------------------
> +
> +AMD PMF(Platform Management Framework) Smart PC Solution builder has to set the system states
> +like S0i3, Screen lock, hibernate etc, based on the output actions provided by the PMF
> +TA (Trusted Application).
> +
> +In order for this to work the PMF driver generates a uevent for userspace to react to. Below are
> +sample udev rules that can facilitate this experience when a machine has PMF Smart PC solution builder
> +enabled.
> +
> +Please add the following line(s) to
> +``/etc/udev/rules.d/99-local.rules``::
> +
> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl suspend"
> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/usr/bin/systemctl hibernate"
> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="3", RUN+="/bin/loginctl lock-sessions"
> +
> +EVENT_ID values:
> +1= Put the system to S0i3/S2Idle
> +2= Put the system to hibernate
> +3= Lock the screen
> +
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index d5e410c41e81..34778192432e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -73,6 +73,7 @@
>  #define PMF_POLICY_STT_MIN					6
>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
> +#define PMF_POLICY_SYSTEM_STATE					9
>  #define PMF_POLICY_P3T						38
>  
>  /* TA macros */
> @@ -439,6 +440,13 @@ struct apmf_dyn_slider_output {
>  } __packed;
>  
>  /* Smart PC - TA internals */
> +enum system_state {
> +	SYSTEM_STATE__S0i3 = 1,
> +	SYSTEM_STATE__S4,
> +	SYSTEM_STATE__SCREEN_LOCK,
> +	SYSTEM_STATE__MAX
> +};
> +
>  enum ta_slider {
>  	TA_BEST_BATTERY, /* Best Battery */
>  	TA_BETTER_BATTERY, /* Better Battery */
> @@ -470,6 +478,7 @@ enum ta_pmf_error_type {
>  };
>  
>  struct pmf_action_table {
> +	enum system_state system_state;
>  	unsigned long spl; /* in mW */
>  	unsigned long sppt; /* in mW */
>  	unsigned long sppt_apuonly; /* in mW */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 315e3d2eacdf..961011530c1b 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -24,6 +24,20 @@ MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (defau
>  static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
>  						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
>  
> +static const char *amd_pmf_uevent_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case SYSTEM_STATE__S0i3:
> +		return "S0i3";
> +	case SYSTEM_STATE__S4:
> +		return "S4";
> +	case SYSTEM_STATE__SCREEN_LOCK:
> +		return "SCREEN_LOCK";
> +	default:
> +		return "Unknown Smart PC event";
> +	}
> +}
> +
>  static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>  				 struct tee_ioctl_invoke_arg *arg,
>  				 struct tee_param *param)
> @@ -42,9 +56,23 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>  	param[0].u.memref.shm_offs = 0;
>  }
>  
> +static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
> +{
> +	char *envp[2] = {};
> +
> +	envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
> +	if (!envp[0])
> +		return -EINVAL;
> +
> +	kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
> +
> +	kfree(envp[0]);
> +	return 0;
> +}
> +
>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>  {
> -	unsigned long val;
> +	unsigned long val, event = 0;
>  	int idx;
>  
>  	for (idx = 0; idx < out->actions_count; idx++) {
> @@ -113,6 +141,17 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  				dev->prev_data->p3t_limit = val;
>  			}
>  			break;
> +
> +		case PMF_POLICY_SYSTEM_STATE:
> +			event = val + 1;
> +			if (dev->prev_data->system_state != event) {
> +				amd_pmf_update_uevents(dev, event);
> +				dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
> +					amd_pmf_uevent_as_str(event));
> +				/* reset the previous recorded state to zero */
> +				dev->prev_data->system_state = 0;

No, a comment won't help you here. As is, system_state is constant 0 so 
it's entirely unnecessary to keep that value at all. In fact, the comment 
is wrong because there never was "previously recorder state" in 
->system_state to begin with since it's either initialized to zero on 
alloc or reset to zero by this line.

So what are you trying to achieve here with this ->system_state variable?

-- 
 i.

