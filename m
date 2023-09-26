Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 244F07AF158
	for <lists+linux-input@lfdr.de>; Tue, 26 Sep 2023 18:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235524AbjIZQyJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Sep 2023 12:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbjIZQyG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Sep 2023 12:54:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D85E126;
        Tue, 26 Sep 2023 09:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695747233; x=1727283233;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rXxZNbSX5Euwqp+xJs2N68raD/m0MepPtJTP7gxanB8=;
  b=dI2/DAm7JXxxkhp+g+plUuMx+7V7ZaCFusC3n9oe8Foo3UNsEQGRlbw3
   j4tVpY7duPdYCIMLsVv4HLnt/mIy/ytmp0REEPaaUOJaQChCIRr4IbbPj
   ntgP0AFEkeGbuaZ8OP1M+Wbywm/iZHp3h49x7LHgb9dAXVsmgN3v+Yo1e
   OFDes2Fq2IB9r0gjfW/K/bcLBFijWUgtAJdx31Z45o7oqPYLLruPmcZkK
   xIie1ghL4LxxxTzsLw0Qn9N8seqI5dmM2IA8a9FpDPlkl2243SfT2N0Rg
   6wB4jcZ1KVhLR7Ghts0GrA4kLGTdjGR48Bge3azE8OQwrWD9krqI7ZU4R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412530674"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="412530674"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 09:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="698538069"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="698538069"
Received: from hhalmen-mobl.ger.corp.intel.com ([10.251.219.207])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 09:53:25 -0700
Date:   Tue, 26 Sep 2023 19:53:22 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 05/15] platform/x86/amd/pmf: change debugfs init
 sequence
In-Reply-To: <20230922175056.244940-6-Shyam-sundar.S-k@amd.com>
Message-ID: <ed71c8b3-b1cd-2efa-1369-8b55ce75eb7f@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com> <20230922175056.244940-6-Shyam-sundar.S-k@amd.com>
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

> amd_pmf_dbgfs_register() needs to be called before amd_pmf_init_features().

Please answer to why? question too here.

> Hence change the sequence.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 6f36c43e081e..dbfe7c1d6fc4 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -427,9 +427,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
> +	amd_pmf_dbgfs_register(dev);
>  	amd_pmf_init_features(dev);
>  	apmf_install_handler(dev);
> -	amd_pmf_dbgfs_register(dev);
>  
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
> 

-- 
 i.

