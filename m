Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6DF7BD925
	for <lists+linux-input@lfdr.de>; Mon,  9 Oct 2023 13:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbjJILCi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Oct 2023 07:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbjJILCh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Oct 2023 07:02:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924A2A6;
        Mon,  9 Oct 2023 04:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696849356; x=1728385356;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MmMf258M2aynXUKykT7A9ZJ1flv5Ehw3wMtnyNA2/MI=;
  b=IjJ+lrU3JNBxnCihEaQdvJyDzzLptyeTS2T0XASGOyatAb6FsQ3eI+7h
   NhOQC2BWafHhniFHPL4yECM5vX6Os6qMZpbhY9N+tzhGeoRBvbUIaI6Uq
   xAPBWaOrOmqoe/t3s3F6VzD/9pY+gAhDYtiLO/yUOxXEy0tmUoHjZr5Th
   0YdGEvh7F3txQg+JJuTR5zOyycu/nJKWCg8cy5pTB55Bi9XX2tcsylc/W
   UAGszQufF7GxTWqhdeHxoKtCKH98/Mm6ZBjuhbjYYMcFXgiwPuhSIVhrp
   VX/kYaWcH4aZ72wwVcu2EUYMYcIx+hdjgn7PWJwWvf8wLYzRDYVQoWLYv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="382993238"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="382993238"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="788124493"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="788124493"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:02:31 -0700
Date:   Mon, 9 Oct 2023 14:02:29 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 12/16] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
In-Reply-To: <c5834d5e-af71-4d96-88ae-c2acd5f6604b@amd.com>
Message-ID: <38f6ad4d-fbbe-2b43-61e-7c676e3dbac6@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com> <20230930083715.2050863-13-Shyam-sundar.S-k@amd.com> <e7b33961-23bb-cb8-2941-ced3f0cf2620@linux.intel.com> <c5834d5e-af71-4d96-88ae-c2acd5f6604b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1989512445-1696849355=:1721"
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

--8323329-1989512445-1696849355=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> On 10/4/2023 6:19 PM, Ilpo Järvinen wrote:
> > On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
> > 
> >> In order to provide GPU inputs to TA for the Smart PC solution to work, we
> >> need to have interface between the PMF driver and the AMDGPU driver.
> >>
> >> Add the initial code path for get interface from AMDGPU.
> >>
> >> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > 
> >> @@ -355,6 +356,21 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> >>  	return amd_pmf_start_policy_engine(dev);
> >>  }
> >>  
> >> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
> >> +{
> >> +	struct amd_pmf_dev *dev = data;
> >> +
> >> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
> >> +		/* get the amdgpu handle from the pci root after walking through the pci bus */
> > 
> > I can see from the code that you assign to amdgpu handle so this comment 
> > added no information.
> > 
> > It doesn't really answer at all why you're doing this second step. Based 
> > on the give parameters to pci_get_device(), it looks as if you're asking 
> > for the same device you already have in pdev to be searched to you.
> 
> Not sure if I understand you remark completely.
> 
> amd_pmf_get_gpu_handle() is a callback function for pci_walk_bus
> (which is done below).
> 
> What I am trying to do here is to get the PCI handle for the GPU
> device by walking the PCI bus.
> 
> I think the 'pdev' here refers to the pci root, using that root we
> walk the entire tree and only stop walking when we find a handle to
> GPU device.

Not exactly what happens, in amd_pmf_get_gpu_handle() pdev changes on each 
call so I don't know why you stated it is refering to the "pci root".

> Do you want me to change the "pdev" parameter to be renamed as "root" ?

No, please don't do that, it would be misleading.

> Am I missing something?

I meant that at some point of the walk through the PCI devices, you have 
a PCI device pdev with ->vendor PCI_VENDOR_ID_AMD when that if condition 
above matched. Please explain why you need to do another lookup with 
pci_get_device() at that point (with the same ->vendor and ->device as 
shown below)?

> >> +		dev->gfx_data.gpu_dev = pci_get_device(pdev->vendor, pdev->device, NULL);
> >> +		if (dev->gfx_data.gpu_dev) {
> >> +			pci_dev_put(pdev);
> >> +			return 1; /* stop walking */
> >> +		}
> >> +	}
> >> +	return 0; /* continue walking */


-- 
 i.

--8323329-1989512445-1696849355=:1721--
