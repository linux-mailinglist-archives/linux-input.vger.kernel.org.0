Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035B17B03E0
	for <lists+linux-input@lfdr.de>; Wed, 27 Sep 2023 14:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbjI0MUj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Sep 2023 08:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjI0MUi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Sep 2023 08:20:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D518112A;
        Wed, 27 Sep 2023 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695817237; x=1727353237;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Z9BegjDKZAV6DSysUCO/fVGXA4LIFZxHklWEtaMzQnE=;
  b=cK4XYz3Pj6lgdptl1YCuy6r7i7yASTNn0seu1OmL6iOABHrFrZPrFO/b
   fkKU6Oh3mu7mQZwMDg87GDQR9V8rhPst+IxHhM6/Kg5HyzTbvWMQp2gIg
   eCebhWNCbzHIAJ38xYCu2hBXkRcWThCjvj9B7dyLu2DDqjn7uDBE5bnxq
   gtJFFPhTn4G/4aZf3rBkRablgLGCdfQdKYzmIvVKnlJ3mCywSVgFNCzKK
   scG+0m53XhhUa4QKKNW6qb0ZqLHxV2clemCVyWTGwuLvvrcU2iCDLt22w
   g3fx/USd2DzYSDK6TqJUk5SvZidTjjPPe/IrgCCbClxM26DNH/ivtDUCf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381711578"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381711578"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752552141"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="752552141"
Received: from clkuhl-mobl.amr.corp.intel.com ([10.252.53.225])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:19:59 -0700
Date:   Wed, 27 Sep 2023 15:19:56 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 07/15] platform/x86/amd/pmf: Add support update p3t
 limit
In-Reply-To: <20230922175056.244940-8-Shyam-sundar.S-k@amd.com>
Message-ID: <234e7986-1afe-f2e9-38a-e7eccecfb066@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com> <20230922175056.244940-8-Shyam-sundar.S-k@amd.com>
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

> P3T (Peak Package Power Limit) is a metric within the SMU controller
> that can influence the power limits. Add support from the driver
> to update P3T limits accordingly.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    | 3 +++
>  drivers/platform/x86/amd/pmf/tee-if.c | 8 ++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index e64b4d285624..897f61b75e2f 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -46,6 +46,7 @@
>  #define GET_STT_MIN_LIMIT	0x1F
>  #define GET_STT_LIMIT_APU	0x20
>  #define GET_STT_LIMIT_HS2	0x21
> +#define SET_P3T				0x23 /* P3T: Peak Package Power Limit */
>  
>  /* OS slider update notification */
>  #define DC_BEST_PERF		0
> @@ -69,6 +70,7 @@
>  #define PMF_POLICY_STT_MIN					6
>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
> +#define PMF_POLICY_P3T						38
>  
>  /* TA macros */
>  #define PMF_TA_IF_VERSION__MAJOR				1
> @@ -472,6 +474,7 @@ struct pmf_action_table {
>  	unsigned long stt_minlimit; /* in mW */
>  	unsigned long stt_skintemp_apu; /* in C */
>  	unsigned long stt_skintemp_hs2; /* in C */
> +	unsigned long p3t_limit; /* in mW */
>  };
>  
>  /* Input conditions */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index eb25d5ce3a9a..883dd143375a 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -105,6 +105,14 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  				dev->prev_data->stt_skintemp_hs2 = val;
>  			}
>  			break;
> +
> +		case PMF_POLICY_P3T:
> +			if (dev->prev_data->p3t_limit != val) {
> +				amd_pmf_send_cmd(dev, SET_P3T, false, val, NULL);
> +				dev_dbg(dev->dev, "update P3T : %d\n", val);

%d vs u32

> +				dev->prev_data->p3t_limit = val;

unsigned long vs u32 ? (as in the other patch)


-- 
 i.

