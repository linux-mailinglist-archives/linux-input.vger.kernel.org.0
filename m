Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D58C7AF153
	for <lists+linux-input@lfdr.de>; Tue, 26 Sep 2023 18:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbjIZQwo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Sep 2023 12:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235487AbjIZQwe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Sep 2023 12:52:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75011136;
        Tue, 26 Sep 2023 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695747146; x=1727283146;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JtwXZBfCANqoHC0STBQiKuC44epDLfMf+Y7x5BnA8kQ=;
  b=W0zrflzzHB6qaAU64P1PtkBDtpvIetUiiRzYpx7ee1KoVVRcVUyJNEkM
   8aWbC1Sd1Ovo3gP7Cs1VlTg7wPtIL6kI7/Kp5i8EUoSA3cKihcXpXXsHB
   pClnHPwnSSFvHgI17t1gGqN/oBHSVNtJ7P+0u1EO9YD+SjVmCAY0k5xos
   QGcAsC3vm0YQ7XdcdIOTsf+cPixcgiRJOhL4tT1K+HS6ZxzOfil0Fn0jJ
   wZQgxf8mxnUigiLRGnIPFuh0/gFxtW/InkJpm7Gu8tw3ZqMmScpkTTkv2
   lcyi7icjAlnwT344DaCsaQNRG4OAqPM1eQ3TZQvQaEykjakMWXuw3j2i5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378893526"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="378893526"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 09:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778196364"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="778196364"
Received: from hhalmen-mobl.ger.corp.intel.com ([10.251.219.207])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 09:52:21 -0700
Date:   Tue, 26 Sep 2023 19:52:18 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 03/15] platform/x86/amd/pmf: Change signature of
 amd_pmf_set_dram_addr
In-Reply-To: <20230922175056.244940-4-Shyam-sundar.S-k@amd.com>
Message-ID: <3b914165-ea96-b180-3fca-86b196e3638@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com> <20230922175056.244940-4-Shyam-sundar.S-k@amd.com>
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

Add () to the function name in the shortlog. "Change signature" is quite 
vague, perhaps you could come up something more descriptive.

> Make amd_pmf_set_dram_addr() as non-static so that same function
> can be used across files.

This says nothing about the move of allocation.

> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 14 ++++++++------
>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 68f1389dda3e..5fb03ed614ff 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -251,26 +251,28 @@ static const struct pci_device_id pmf_pci_ids[] = {
>  	{ }
>  };
>  
> -static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>  {
>  	u64 phys_addr;
>  	u32 hi, low;
>  
> +	/* Get Metrics Table Address */
> +	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> +	if (!dev->buf)
> +		return -ENOMEM;
> +
>  	phys_addr = virt_to_phys(dev->buf);
>  	hi = phys_addr >> 32;
>  	low = phys_addr & GENMASK(31, 0);
>  
>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
> +
> +	return 0;
>  }
>  
>  int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  {
> -	/* Get Metrics Table Address */
> -	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> -	if (!dev->buf)
> -		return -ENOMEM;
> -
>  	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
>  
>  	amd_pmf_set_dram_addr(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index a9333ff6c0a7..ea15ce547d24 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -421,6 +421,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
>  int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> 

Why are not amd_pmf_set_dram_addr() callers made to handle/pass on 
errors???

-- 
 i.

