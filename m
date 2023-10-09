Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B917BD88D
	for <lists+linux-input@lfdr.de>; Mon,  9 Oct 2023 12:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345785AbjJIKaM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Oct 2023 06:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345805AbjJIKaK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Oct 2023 06:30:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D77F7;
        Mon,  9 Oct 2023 03:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696847407; x=1728383407;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EvUfiKvTpGuDhmjZNlNMVv9+EPOWDzoJPMiXe5aWZO0=;
  b=iOGe2R5j6g1w3JwJqHE5Ulb0bXR1nLP6sYkgIDfXpvHLrYNrNE3HFUH7
   INKMZ4M5UThZS4vDdAngOHdAY8vXO7/j7qjM2IJoszHbb6fuZgLshamII
   V7IJ1poKYMRcPNT46IZERYASA/jfDRqwfO9EqPicLHdfuj6eZCmo/PV1c
   TuCOfl+74soX9/SGoCA4BRTrENDxDbTYEAurJg17CGU8djdEZW/aW+trM
   KC9WlOiQLcVxRo/9v+0iWAfDOrHTu9Yw3LlHV0v9f8Obe8A3rTyizAnGB
   Fdg/32V1yeo8Zrhkaf7Ey7D05EIcysMt+eBaYPSQi4z1kgFPzxMfl0lPp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="363468129"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="363468129"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 03:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="926718257"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="926718257"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 03:30:02 -0700
Date:   Mon, 9 Oct 2023 13:29:59 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 01/16] platform/x86/amd/pmf: Add PMF TEE interface
In-Reply-To: <01eef1b0-8695-4284-8a4a-973826f2c3cc@amd.com>
Message-ID: <f19e6ae-9a60-41d1-8f77-3794948f167a@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com> <20230930083715.2050863-2-Shyam-sundar.S-k@amd.com> <584aebd-5c89-d085-275-bb79f93429f@linux.intel.com> <01eef1b0-8695-4284-8a4a-973826f2c3cc@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-509712714-1696847406=:1721"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-509712714-1696847406=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:

> 
> 
> On 10/4/2023 4:20 PM, Ilpo Järvinen wrote:
> > On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
> > 
> >> AMD PMF driver loads the PMF TA (Trusted Application) into the AMD
> >> ASP's (AMD Security Processor) TEE (Trusted Execution Environment).
> >>
> >> PMF Trusted Application is a secured firmware placed under
> >> /lib/firmware/amdtee gets loaded only when the TEE environment is
> >> initialized. Add the initial code path to build these pipes.
> >>
> >> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/Makefile |   3 +-
> >>  drivers/platform/x86/amd/pmf/core.c   |  11 ++-
> >>  drivers/platform/x86/amd/pmf/pmf.h    |  16 ++++
> >>  drivers/platform/x86/amd/pmf/tee-if.c | 112 ++++++++++++++++++++++++++
> >>  4 files changed, 138 insertions(+), 4 deletions(-)
> >>  create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> >> index fdededf54392..d2746ee7369f 100644
> >> --- a/drivers/platform/x86/amd/pmf/Makefile
> >> +++ b/drivers/platform/x86/amd/pmf/Makefile
> >> @@ -6,4 +6,5 @@
> >>  
> >>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
> >>  amd-pmf-objs := core.o acpi.o sps.o \
> >> -		auto-mode.o cnqf.o
> >> +		auto-mode.o cnqf.o \
> >> +		tee-if.o
> >> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> >> index 78ed3ee22555..68f1389dda3e 100644
> >> --- a/drivers/platform/x86/amd/pmf/core.c
> >> +++ b/drivers/platform/x86/amd/pmf/core.c
> >> @@ -309,8 +309,11 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
> >>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
> >>  	}
> >>  
> >> -	/* Enable Auto Mode */
> >> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> >> +	if (amd_pmf_init_smart_pc(dev)) {
> >> +		/* Enable Smart PC Solution builder */
> >> +		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> >> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> >> +		/* Enable Auto Mode */
> > 
> > I'm pretty certain neither of these two comments add any information to 
> > what's readily visible from the code itself so they can be dropped.
> > 
> >>  		amd_pmf_init_auto_mode(dev);
> >>  		dev_dbg(dev->dev, "Auto Mode Init done\n");
> >>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> >> @@ -330,7 +333,9 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
> >>  		amd_pmf_deinit_sps(dev);
> >>  	}
> >>  
> >> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> >> +	if (dev->smart_pc_enabled) {
> >> +		amd_pmf_deinit_smart_pc(dev);
> >> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> >>  		amd_pmf_deinit_auto_mode(dev);
> >>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> >>  			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> >> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> >> index deba88e6e4c8..02460c2a31ea 100644
> >> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >> @@ -179,6 +179,12 @@ struct amd_pmf_dev {
> >>  	bool cnqf_enabled;
> >>  	bool cnqf_supported;
> >>  	struct notifier_block pwr_src_notifier;
> >> +	/* Smart PC solution builder */
> >> +	struct tee_context *tee_ctx;
> >> +	struct tee_shm *fw_shm_pool;
> >> +	u32 session_id;
> >> +	void *shbuf;
> >> +	bool smart_pc_enabled;
> >>  };
> >>  
> >>  struct apmf_sps_prop_granular {
> >> @@ -389,6 +395,13 @@ struct apmf_dyn_slider_output {
> >>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
> >>  } __packed;
> >>  
> >> +struct ta_pmf_shared_memory {
> >> +	int command_id;
> >> +	int resp_id;
> >> +	u32 pmf_result;
> >> +	u32 if_version;
> >> +};
> >> +
> >>  /* Core Layer */
> >>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
> >>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
> >> @@ -433,4 +446,7 @@ void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
> >>  int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
> >>  extern const struct attribute_group cnqf_feature_attribute_group;
> >>  
> >> +/* Smart PC builder Layer*/
> > 
> > Missing space.
> > 
> >> +int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
> >> +void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
> >>  #endif /* PMF_H */
> >> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> >> new file mode 100644
> >> index 000000000000..4db80ca59a11
> >> --- /dev/null
> >> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> >> @@ -0,0 +1,112 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * AMD Platform Management Framework Driver - TEE Interface
> >> + *
> >> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> >> + * All Rights Reserved.
> >> + *
> >> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> + */
> >> +
> >> +#include <linux/tee_drv.h>
> >> +#include <linux/uuid.h>
> >> +#include "pmf.h"
> >> +
> >> +#define MAX_TEE_PARAM	4
> >> +static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
> >> +						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
> >> +
> >> +static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
> >> +{
> >> +	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> >> +}
> >> +
> >> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
> >> +{
> >> +	struct tee_ioctl_open_session_arg sess_arg = {};
> >> +	int rc;
> >> +
> >> +	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
> >> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
> >> +	sess_arg.num_params = 0;
> >> +
> >> +	rc = tee_client_open_session(ctx, &sess_arg, NULL);
> >> +	if (rc < 0 || sess_arg.ret != 0) {
> >> +		pr_err("Failed to open TEE session err:%#x, ret:%#x\n", sess_arg.ret, rc);
> > 
> > Print normal -Exx error codes as %d, not %x (rc). I don't know what would 
> > be best to do with sess_arg.ret, TEEC_ERROR_* look like errnos (negative 
> > values) manually converted into u32.
> 
> in drivers/tee/amdtee/amdtee_private.h, all the TEEC_* are hex. So
> sess_arg.ret can remain %x?

Sure, you can leave it to %x.

-- 
 i.

--8323329-509712714-1696847406=:1721--
