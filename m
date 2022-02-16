Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B137E4B947A
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 00:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237546AbiBPX2J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 18:28:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbiBPX2J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 18:28:09 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A545BECCF
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 15:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645054076; x=1676590076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QaGUDV9VuH15z65FHT4iFKnosUpOarSivgJlad9ndOA=;
  b=kgIFBWNDnTSFRtQgjCK01zs9pe1ihOSAJabu5zCdSN0RxvAiBu1AnJJW
   xqIGmf0/e/gXcX8K/6dptgYxMBIP4b1C11VyiJ1qxG3vLmhttEA2mulqu
   baa5lBlx5l5fqodWTuHE22+lmqtYrWgK0p5o49nyt8hG+XUk3StzN7XLV
   OOojxm6MnuSlNepP65d556M3S4h1f6sP5rqVaa8Qby3RxUxgjPqi9QlS4
   t65L/5QkmR8MGa7tx1QGusBLQyvNqzczXfLSi+7LA2Jo+Z4ac4F2ewI2j
   yrjBHPdeh63xsnz48HRNUcWqxL7xHrAe7tR1W8zoUofqMHbOc6GDOOqcr
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="249583056"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="249583056"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 15:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="503249165"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Feb 2022 15:27:54 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nKTiD-000BEa-G6; Wed, 16 Feb 2022 23:27:53 +0000
Date:   Thu, 17 Feb 2022 07:27:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Pawlowski <paul@mrarm.io>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Aun-Ali Zaidi <admin@kodeit.net>,
        Aditya Garg <gargaditya08@live.com>
Subject: [hid:for-5.18/apple 6/8] csky-linux-ld: hid-apple.c:undefined
 reference to `devm_led_classdev_register_ext'
Message-ID: <202202170730.8pPvrRAz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-5.18/apple
head:   c5f09b1b45cbb90147846f82ec0489789c99667e
commit: 9018eacbe623b2c3535da37035e5f22d3d70b6ce [6/8] HID: apple: Add support for keyboard backlight on certain T2 Macs.
config: csky-defconfig (https://download.01.org/0day-ci/archive/20220217/202202170730.8pPvrRAz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=9018eacbe623b2c3535da37035e5f22d3d70b6ce
        git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
        git fetch --no-tags hid for-5.18/apple
        git checkout 9018eacbe623b2c3535da37035e5f22d3d70b6ce
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/hid/hid-apple.o: in function `apple_backlight_init.isra.0':
   hid-apple.c:(.text+0x2e6): undefined reference to `devm_led_classdev_register_ext'
>> csky-linux-ld: hid-apple.c:(.text+0x33c): undefined reference to `devm_led_classdev_register_ext'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
