Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB3457F7C8
	for <lists+linux-input@lfdr.de>; Mon, 25 Jul 2022 02:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiGYAUl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jul 2022 20:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiGYAUk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jul 2022 20:20:40 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EB46368
        for <linux-input@vger.kernel.org>; Sun, 24 Jul 2022 17:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658708439; x=1690244439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWuYTSbE64l5sThEDanBRj8mgbkfUuzM1Vd7NquZAzg=;
  b=NwQj1XhkyOpgAn4tC+FRvTrzmzRwuMZCksPjMmjFdYiRRA4KpgYDrYWn
   qDiCk84oZ0cWW33fzPX9MCK7fPb5mrSAX8wa2IMsEgLwQxNYBx8TGLgrQ
   PJl7ZJs40bJ4bgx2W8QSfR6Fy+oCrK1Lm72lk3zQBartET1HyE6xHoUbX
   DyoXSJRXLieTNKOyDOEmJeUQNe63l76ZGkPW48ycCufcW1FulYILJkDsK
   Kd95yCFo+tpbFd6Y98PaEPkUI2LsoXTMSAsHzhfzxJqYGWi0cszOr62xm
   lIuVdiP4INue/4bIrgn8YJXFkU+8f5SNeAhbhfw3DtlC4MiWw4JVtqjxB
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="285130439"
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="285130439"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 17:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="549783826"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jul 2022 17:20:37 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oFlpt-0004QT-0b;
        Mon, 25 Jul 2022 00:20:37 +0000
Date:   Mon, 25 Jul 2022 08:19:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>
Subject: [hid:for-next 11/27]
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9: error: implicit
 declaration of function 'writeq'; did you mean 'writeb'?
Message-ID: <202207250836.cwfTgngV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   9c9914cc509bccd7b134d33594e19b9411c12d4b
commit: 93ce5e0231d79189be4d9e5f9295807b18941419 [11/27] HID: amd_sfh: Implement SFH1.1 functionality
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220725/202207250836.cwfTgngV-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=93ce5e0231d79189be4d9e5f9295807b18941419
        git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
        git fetch --no-tags hid for-next
        git checkout 93ce5e0231d79189be4d9e5f9295807b18941419
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the hid/for-next HEAD 9c9914cc509bccd7b134d33594e19b9411c12d4b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c: In function 'amd_stop_sensor':
>> drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
      48 |         writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
         |         ^~~~~~
         |         writeb
   cc1: some warnings being treated as errors


vim +48 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c

    38	
    39	static void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
    40	{
    41		struct sfh_cmd_base cmd_base;
    42	
    43		cmd_base.ul = 0;
    44		cmd_base.cmd.cmd_id = DISABLE_SENSOR;
    45		cmd_base.cmd.intr_disable = 0;
    46		cmd_base.cmd.sensor_id = sensor_idx;
    47	
  > 48		writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
    49		writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
