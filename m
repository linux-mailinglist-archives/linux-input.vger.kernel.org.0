Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0797B7F2C
	for <lists+linux-input@lfdr.de>; Wed,  4 Oct 2023 14:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbjJDMdH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Oct 2023 08:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233238AbjJDMdH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Oct 2023 08:33:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462F4A9;
        Wed,  4 Oct 2023 05:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696422784; x=1727958784;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rqMIzkzF+oU8U8LUCSr0Mr0DAEsLqNHVkwrxAHSfYCs=;
  b=FpFJQ9JJ6alfKhO1TGBbr8JjiQjO5irpZDE6tka5nYWT1uXGKVr6IMSG
   PfZxK+aVgk9qDzX+5x4rwABfnIe1aSaIV/WdmqB7COUatKkRp2wrphO2z
   wcoiw+VyHrxsbhxqW6aeYTe+Rt0GlMXIMKqpsv1sZF2hrPnexgY7K+wmn
   0db0vjUzVN1Tgx7aqnGA6+EVhwfpZRryG/iyrHPbg2XbuSIRWzS+TrEOj
   6dcFrtt0/GIHodSPJoJ5AN6LqgB25v9mNULRYT6Lkxuv1i03FLiQG4SB5
   lA5nDwfHXZQuLs/1KrOH4S0t6UTg6nqiM1evXChabIUmGLdERiZqI+xSj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="385977936"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="385977936"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 05:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="780763444"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="780763444"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 05:32:58 -0700
Date:   Wed, 4 Oct 2023 15:32:56 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 11/16] platform/x86/amd/pmf: dump policy binary data
In-Reply-To: <20230930083715.2050863-12-Shyam-sundar.S-k@amd.com>
Message-ID: <826ae56e-76c6-aaaf-153-30fa3be96d69@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com> <20230930083715.2050863-12-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 30 Sep 2023, Shyam Sundar S K wrote:

> Sometimes policy binary retrieved from the BIOS maybe incorrect that can
> end up in failing to enable the Smart PC solution feature.
> 
> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
> debug the issues related to the binary even before sending that to TA.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 01f974b55a6a..d16bdecfd43a 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -290,6 +290,9 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>  		return -EFAULT;
>  
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +
>  	ret = amd_pmf_start_policy_engine(dev);
>  	if (ret)
>  		return -EINVAL;
> @@ -341,6 +344,10 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  		return -ENOMEM;
>  
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +#endif

Create a wrapper for print_hex_dump_debug into #ifdef and #else blocks for 
this too so you don't need the ifdef here.

-- 
 i.

