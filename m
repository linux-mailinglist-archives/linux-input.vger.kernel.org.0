Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB027CD911
	for <lists+linux-input@lfdr.de>; Wed, 18 Oct 2023 12:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjJRKWH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Oct 2023 06:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjJRKWG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Oct 2023 06:22:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230E3B0;
        Wed, 18 Oct 2023 03:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697624525; x=1729160525;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xDWK7EvYYMm8tp0hVJ/TwEDbQjIuQxVbahjC4hZ+APw=;
  b=KBDOMq7d77KX2Ivh8kwfgbKr5HLzuw7ANk2C42KrfelnP5AAcZ+esRQ1
   Pzb3RQ3OXr3EADBiH/ROzPRD996OVYc94sdrO9R5XligQu4mEuLNWe+rC
   ejU/Ag3y26uWV2r/+YLZhFjt4+o778P9KhmCweKALMIYe5StEYhuthBmu
   QYR9mPFYZj/TCoDloP9WTtxs+Moc/Oh3iny55aTYDQvzWhT97jKd7md9/
   ppHYAmHU4nPmfoZXVtbV+NTv9CbdNLSh2rcVGLU9bC8AaAJON3ZIxb8ij
   Ynd98PdOg5NICIm5c3X00/vh5mI1++46vOXAC2/kHyOS7rB5aVD1Xhki0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384865058"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="384865058"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 03:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756537906"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="756537906"
Received: from gruberda-mobl1.ger.corp.intel.com ([10.252.62.52])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 03:21:59 -0700
Date:   Wed, 18 Oct 2023 13:21:57 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 11/17] platform/x86/amd/pmf: Add capability to sideload
 of policy binary
In-Reply-To: <20231018070241.2041529-12-Shyam-sundar.S-k@amd.com>
Message-ID: <c6be6d40-f8d7-a4f-91c6-967ff920a44@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com> <20231018070241.2041529-12-Shyam-sundar.S-k@amd.com>
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

> A policy binary is OS agnostic, and the same policies are expected to work
> across the OSes.  At times it becomes difficult to debug when the policies
> inside the policy binaries starts to misbehave. Add a way to sideload such
> policies independently to debug them via a debugfs entry.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  1 +
>  drivers/platform/x86/amd/pmf/tee-if.c | 67 +++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 593930519039..8712299ad52b 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -219,6 +219,7 @@ struct amd_pmf_dev {
>  	bool cnqf_supported;
>  	struct notifier_block pwr_src_notifier;
>  	/* Smart PC solution builder */
> +	struct dentry *esbin;
>  	unsigned char *policy_buf;
>  	u32 policy_sz;
>  	struct tee_context *tee_ctx;
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 0eba258f4040..6c4ce22ba518 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -8,6 +8,7 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/tee_drv.h>
>  #include <linux/uuid.h>
>  #include "pmf.h"
> @@ -16,9 +17,14 @@
>  
>  /* Policy binary actions sampling frequency (in ms) */
>  static int pb_actions_ms = MSEC_PER_SEC;
> +/* Sideload policy binaries to debug policy failures */
> +static bool pb_side_load;
> +
>  #ifdef CONFIG_AMD_PMF_DEBUG
>  module_param(pb_actions_ms, int, 0644);
>  MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
> +module_param(pb_side_load, bool, 0444);
> +MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
>  #endif
>  
>  static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
> @@ -269,6 +275,61 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
> +				   size_t length, loff_t *pos)
> +{
> +	struct amd_pmf_dev *dev = filp->private_data;
> +	int ret;
> +
> +	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
> +	if (length > POLICY_BUF_MAX_SZ || length == 0)
> +		return -EINVAL;
> +
> +	dev->policy_sz = length;
> +	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
> +		return -EFAULT;
> +
> +	ret = amd_pmf_start_policy_engine(dev);
> +	if (ret)
> +		return -EINVAL;
> +
> +	return length;
> +}
> +
> +static const struct file_operations pb_fops = {
> +	.write = amd_pmf_get_pb_data,
> +	.open = simple_open,
> +};
> +
> +static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
> +{
> +	struct dentry *file = NULL;
> +
> +	dev->esbin = debugfs_create_dir("pb", debugfs_root);
> +	if (IS_ERR(dev->esbin))
> +		return -EINVAL;
> +
> +	file = debugfs_create_file("update_policy", 0644, dev->esbin, dev, &pb_fops);
> +	if (!file)

debugfs_create_file() returns ERR_PTR() on errors. I don't actually know 
if NULL even needs to be checked or if it'd return errno in that case 
because the usually custom is to just ignore debugfs_create_file() 
return value.

Why is this function returning int anyway? It's not checked by the caller 
so why bother when all it does is deal with debugfs for which the normal 
approach is to ignore the errors.

-- 
 i.


> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void amd_pmf_remove_pb(struct amd_pmf_dev *dev)
> +{
> +	debugfs_remove_recursive(dev->esbin);
> +}
> +#else
> +static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
> +{
> +	return 0;
> +}
> +
> +static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
> +#endif
> +
>  static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  {
>  	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> @@ -281,6 +342,9 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>  
> +	if (pb_side_load)
> +		amd_pmf_open_pb(dev, dev->dbgfs_dir);
> +
>  	return amd_pmf_start_policy_engine(dev);
>  }
>  
> @@ -382,6 +446,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  {
> +	if (pb_side_load)
> +		amd_pmf_remove_pb(dev);
> +
>  	kfree(dev->prev_data);
>  	kfree(dev->policy_buf);
>  	cancel_delayed_work_sync(&dev->pb_work);
> 
