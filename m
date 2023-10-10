Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D537BFCE6
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 15:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjJJNId (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 09:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjJJNIc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 09:08:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4375B0;
        Tue, 10 Oct 2023 06:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696943310; x=1728479310;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ySyQf6rgVg5IYZAWGy7uT+d1sPeGVBK59rJjjADPH1U=;
  b=as4K52Wfhr7NPUG1NNEcPc3cL4A9j2vgv3ZResehCIhp6emsSjhM7E6q
   b9eCceS1XT9MoMkmWQvz/hHSxLuM9eDf/dQPOrqFqgbmx24sfrp2tC7Z0
   SheWzSjFxjCJO00mvkFHTI/3wagjwdGGuxGQA9xgbZYGrWpxYzaKgcdUu
   FAGxx1yFK47gS714rKmXq1B+RJYrzByqKR9OgSQbUH9wyCDPvfn6bfVgp
   fBZxR0JsKjNAWaq2EHbsW7Hvn/jPQ7JSqbQCas6lLhYnUksbU3YoDOyQy
   0dTbgwAEs8MqJQT4HaYwbik9knsDMPOZLodT+2dJQXvDRpgxpIcEK3yE5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363737077"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="363737077"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788576409"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="788576409"
Received: from jthomasb-mobl1.ger.corp.intel.com ([10.252.42.94])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:08:25 -0700
Date:   Tue, 10 Oct 2023 16:08:23 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 11/16] platform/x86/amd/pmf: dump policy binary data
In-Reply-To: <20231010125917.138225-12-Shyam-sundar.S-k@amd.com>
Message-ID: <1f3e39fc-2c2f-72d5-ce61-16e7e5d257be@linux.intel.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com> <20231010125917.138225-12-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 10 Oct 2023, Shyam Sundar S K wrote:

> Sometimes policy binary retrieved from the BIOS maybe incorrect that can
> end up in failing to enable the Smart PC solution feature.
> 
> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
> debug the issues related to the binary even before sending that to TA.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 994daf945795..e4386f503ad0 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -275,6 +275,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  }
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
> +{
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +}
> +

You forgot to add the empty version of amd_pmf_hex_dump_pb function into 
#else part (so the compile fails if CONFIG_AMD_PMF_DEBUG is not set).

>  static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  				   size_t length, loff_t *pos)
>  {
> @@ -289,6 +295,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>  		return -EFAULT;
>  
> +	amd_pmf_hex_dump_pb(dev);
>  	ret = amd_pmf_start_policy_engine(dev);
>  	if (ret)
>  		return -EINVAL;
> @@ -327,6 +334,7 @@ static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
>  }
>  
>  static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
>  #endif
>  
>  static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> @@ -341,6 +349,7 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>  
> +	amd_pmf_hex_dump_pb(dev);
>  	if (pb_side_load)
>  		amd_pmf_open_pb(dev, dev->dbgfs_dir);
>  
> 

-- 
 i.

