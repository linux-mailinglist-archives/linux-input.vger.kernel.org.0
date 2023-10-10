Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B9B7BFEBA
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 16:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjJJOG0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 10:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbjJJOGY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 10:06:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62337A7;
        Tue, 10 Oct 2023 07:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696946781; x=1728482781;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Tq2++7DJ1Qgh4FcFssSJwZYTvol7Vg9iuX28gFZTuao=;
  b=lsDYctY1N648sD8P7wZpIQ6eTBV1n/nsVsMUmPwY+OgjQZTsHVsO/X1G
   8YvAM68twbbwzHQ7pHAOA7EBjvAnlFr22ATGZUg8X5lRsTSgV2Fsgm3uf
   tjEWjXKzayGucGFBZwhC4x/ZXwBrRjX09UP/veSSsoUOB1NXlcfpoEZW5
   Wwy6G2jb9Xef39htbeV9lITsi3LQXv05XvFpIsAxwSWHAphcMmjkSIeoC
   0EmgAlBLzvjPTOCU79i6Yh6cetwFFOq80UT8gL+FnDuB1wPJsr4PMfUST
   7586yptoeE5JUnJo1z0S85aBPvpZSDp7SRKWbKzPc63BZsZQ1M2rRliyp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363754215"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="363754215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="782890211"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="782890211"
Received: from jthomasb-mobl1.ger.corp.intel.com ([10.252.42.94])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:03:29 -0700
Date:   Tue, 10 Oct 2023 17:03:27 +0300 (EEST)
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
In-Reply-To: <c9d53b05-68d0-4244-86cb-cb110c2c4af7@amd.com>
Message-ID: <7118d392-f29b-a8b-6b46-a32bd1fc56c@linux.intel.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com> <20231010125917.138225-12-Shyam-sundar.S-k@amd.com> <1f3e39fc-2c2f-72d5-ce61-16e7e5d257be@linux.intel.com> <c9d53b05-68d0-4244-86cb-cb110c2c4af7@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-927937933-1696946613=:10675"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-927937933-1696946613=:10675
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 10 Oct 2023, Shyam Sundar S K wrote:
> On 10/10/2023 6:38 PM, Ilpo Järvinen wrote:
> > On Tue, 10 Oct 2023, Shyam Sundar S K wrote:
> > 
> >> Sometimes policy binary retrieved from the BIOS maybe incorrect that can
> >> end up in failing to enable the Smart PC solution feature.
> >>
> >> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
> >> debug the issues related to the binary even before sending that to TA.
> >>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> >> index 994daf945795..e4386f503ad0 100644
> >> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> >> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> >> @@ -275,6 +275,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
> >>  }
> >>  
> >>  #ifdef CONFIG_AMD_PMF_DEBUG
> >> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
> >> +{
> >> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> >> +			     dev->policy_sz, false);
> >> +}
> >> +
> > 
> > You forgot to add the empty version of amd_pmf_hex_dump_pb function into 
> > #else part (so the compile fails if CONFIG_AMD_PMF_DEBUG is not set).
> > 
> 
> It's there (see below). I have just grouped the functions that come
> under #ifdef CONFIG_AMD_PMF_DEBUG and #else so that's more readable.
> 
> >>  static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
> >>  				   size_t length, loff_t *pos)
> >>  {
> >> @@ -289,6 +295,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
> >>  	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
> >>  		return -EFAULT;
> >>  
> >> +	amd_pmf_hex_dump_pb(dev);
> >>  	ret = amd_pmf_start_policy_engine(dev);
> >>  	if (ret)
> >>  		return -EINVAL;
> >> @@ -327,6 +334,7 @@ static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
> >>  }
> >>  
> >>  static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
> >> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
> 
> Here is the empty amd_pmf_hex_dump_pb().

Ah, sorry. I was confused by the intermediate change.

-- 
 i.

--8323329-927937933-1696946613=:10675--
