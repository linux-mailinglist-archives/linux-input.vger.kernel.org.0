Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D6B7AE0E5
	for <lists+linux-input@lfdr.de>; Mon, 25 Sep 2023 23:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbjIYVnF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Sep 2023 17:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233471AbjIYVnE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Sep 2023 17:43:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3C7101;
        Mon, 25 Sep 2023 14:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695678177; x=1727214177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=snNq+RshksgPyasRZ5b0PQsm78eS6KzqCuWRL3ih9JA=;
  b=TvKxBLM2KkwbLN/IozG53gr8mldqYGwSmKogLkC5bfeCq+zCNyX1BwPQ
   mHpIz3bxJqeEZa8+4HeA403Lycd8WWUV5Jd5fupTkZSWFmt5dCT1rPKr+
   ocYd/uIwOyH/nbn3Y1uZ7H7AHV79Q5DlV/0htJ/lL1k02qr8LeQFcatfZ
   FRkwD6SzQYKz47DnDPx07j2D7QVS4wVv72xWXAd2tWW3kV7K7D0zZOZF3
   eZt0aUPoD3RFvzPo4+ERwgq8uIpLq3lzlME20SCGmkrx7qsORmhOCDj/h
   q92Krk6erXw73FtrKOv120AnjnrMYEZHYg/xnJGasFxufpRuKQKTE4oNc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380273459"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="380273459"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 14:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838725559"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="838725559"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2023 14:42:53 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qktLv-00022n-1Q;
        Mon, 25 Sep 2023 21:42:51 +0000
Date:   Tue, 26 Sep 2023 05:42:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     oe-kbuild-all@lists.linux.dev,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Patil.Reddy@amd.com,
        linux-input@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH 08/15] platform/x86/amd/pmf: Add support to update system
 state
Message-ID: <202309260515.5XbR6N0g-lkp@intel.com>
References: <20230922175056.244940-9-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175056.244940-9-Shyam-sundar.S-k@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.6-rc3 next-20230925]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/platform-x86-amd-pmf-Add-PMF-TEE-interface/20230923-015418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20230922175056.244940-9-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 08/15] platform/x86/amd/pmf: Add support to update system state
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309260515.5XbR6N0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260515.5XbR6N0g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pmf.rst:16: WARNING: Unexpected indentation.
>> Documentation/admin-guide/pmf.rst: WARNING: document isn't included in any toctree

vim +16 Documentation/admin-guide/pmf.rst

    13	
    14	Please add the following line(s) to
    15	``/etc/udev/rules.d/99-local.rules``::
  > 16	        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl suspend"
    17	        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/usr/bin/systemctl hibernate"
    18	        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="3", RUN+="/bin/loginctl lock-sessions"
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
