Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 952C4516556
	for <lists+linux-input@lfdr.de>; Sun,  1 May 2022 18:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349710AbiEAQoM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 May 2022 12:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349686AbiEAQoL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 May 2022 12:44:11 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169291CFD2
        for <linux-input@vger.kernel.org>; Sun,  1 May 2022 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651423245; x=1682959245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=75k9pMqhIGJlRMaE12pLUdeNC+RSd/xB6yB40stJnaA=;
  b=eKveKpmXfWia6dM0R/T4jPTFf/f9oRKvCWYxSKql2yeZfBCr2DaWv4ky
   azCskTjmoB5zdfTTGuLoRG88CGzvVX9s8lEXQeE3LV4CyDSd0ipxO5SAb
   oaUyhuddtElkW6qUja/w9NhUiNmD50u9nFvg422uqWi82TvCjSso7Rr4/
   Z6GnHHIvw/ZvlZGU+8wVbxrZ0C1C3viQNIBC7KRN9Gk6/2xOgJH+vxITJ
   AJWvqSCXIEHFjx70w3XCvzeWjEe5SqkTLoRFYarlL0GrNSa35yeuSAg3q
   9z7R6zEEFcJByRtHH8jRCqPZ0EALP7c1x7IcuYWUTnSiiDOHiygMr1dfy
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="266605064"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="266605064"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 09:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="885358615"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 May 2022 09:40:43 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nlCck-0008tV-DX;
        Sun, 01 May 2022 16:40:42 +0000
Date:   Mon, 2 May 2022 00:40:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [dtor-input:next 34/37]
 drivers/input/keyboard/mtk-pmic-keys.c:93:36: error: 'MT6359_TOPSTATUS'
 undeclared here (not in a function); did you mean 'MT6358_TOPSTATUS'?
Message-ID: <202205020026.xdvsARvi-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   75e97ccaf557d09c5e176d137fde6fcedc35a150
commit: 0f97adf6431456cd8155cf6fa803ed5bf441444c [34/37] Input: mtk-pmic-keys - add support for MT6359
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20220502/202205020026.xdvsARvi-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?id=0f97adf6431456cd8155cf6fa803ed5bf441444c
        git remote add dtor-input https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
        git fetch --no-tags dtor-input next
        git checkout 0f97adf6431456cd8155cf6fa803ed5bf441444c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/input/keyboard/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/input/keyboard/mtk-pmic-keys.c:93:36: error: 'MT6359_TOPSTATUS' undeclared here (not in a function); did you mean 'MT6358_TOPSTATUS'?
      93 |                 MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
         |                                    ^~~~~~~~~~~~~~~~
   drivers/input/keyboard/mtk-pmic-keys.c:48:35: note: in definition of macro 'MTK_PMIC_KEYS_REGS'
      48 |         .deb_reg                = _deb_reg,             \
         |                                   ^~~~~~~~
>> drivers/input/keyboard/mtk-pmic-keys.c:98:25: error: 'MT6359_TOP_RST_MISC' undeclared here (not in a function); did you mean 'MT6358_TOP_RST_MISC'?
      98 |         .pmic_rst_reg = MT6359_TOP_RST_MISC,
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         MT6358_TOP_RST_MISC


vim +93 drivers/input/keyboard/mtk-pmic-keys.c

    90	
    91	static const struct mtk_pmic_keys_pdata mt6359_pdata = {
    92		.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
  > 93			MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
    94			0x2, MT6359_PSC_TOP_INT_CON0, 0x5),
    95		.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
    96			MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
    97			0x8, MT6359_PSC_TOP_INT_CON0, 0xa),
  > 98		.pmic_rst_reg = MT6359_TOP_RST_MISC,
    99		.has_key_release_irqs = true,
   100	};
   101	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
