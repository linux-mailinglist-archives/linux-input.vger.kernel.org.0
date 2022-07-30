Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C799585C81
	for <lists+linux-input@lfdr.de>; Sun, 31 Jul 2022 00:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbiG3WVw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Jul 2022 18:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiG3WVv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Jul 2022 18:21:51 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B1913E08
        for <linux-input@vger.kernel.org>; Sat, 30 Jul 2022 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659219710; x=1690755710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lmZwGBC6mWku02MktmD17iV3sA5j0PaSdMhZK/mMpc=;
  b=fUuwS943SCY5ab6nSNlmJAFxwkiIUgkmycKdxw2WSGRkSEadPpWeQM/V
   V78yIaoWDC0bmxVtfPOTJAtWcjrzuQ/SOzOFWxUsL3KuFOEYNXMzNZRDk
   J4MMkhhXCo2kkKe86da5UcvLjIi06VRTpJPeO1eVseWKQPuomMZjoyh27
   b4im7kh3WUewXamnriBe53ocnfHG+jhJpz1UJo9PGYsh9sZPGo7djMU+0
   UWqsuPHLm6eWJtnH4Q395RgsqrGotKcgNMP+VfhPw9+ydk0N/ukM4ScX/
   PI7JXHMxVLHhXzoAMTQj92rrLj441Xq4Lz8QN2Hz/0GY7dHzjTzsG+9y1
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="375253225"
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; 
   d="scan'208";a="375253225"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 15:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; 
   d="scan'208";a="929125897"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2022 15:21:49 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oHuqC-000DOZ-36;
        Sat, 30 Jul 2022 22:21:48 +0000
Date:   Sun, 31 Jul 2022 06:21:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jiri Kosina <jkosina@suse.cz>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org
Subject: [hid:for-next 22/28] drivers/hid/hid-nintendo.c:1514:29: error:
 redefinition of 'JC_RUMBLE_ZERO_AMP_PKT_CNT'
Message-ID: <202207310604.IJTM9Qx3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   7af32d156ad75cd88699b28a617857c74c933721
commit: 0f0606ababb185afe1461ebd9abb95d797a5b952 [22/28] Merge branch 'for-5.20/nintendo' into for-next
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220731/202207310604.IJTM9Qx3-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=0f0606ababb185afe1461ebd9abb95d797a5b952
        git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
        git fetch --no-tags hid for-next
        git checkout 0f0606ababb185afe1461ebd9abb95d797a5b952
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hid/hid-nintendo.c:1514:29: error: redefinition of 'JC_RUMBLE_ZERO_AMP_PKT_CNT'
   static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
                               ^
   drivers/hid/hid-nintendo.c:295:29: note: previous definition is here
   static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
                               ^
   1 error generated.


vim +/JC_RUMBLE_ZERO_AMP_PKT_CNT +1514 drivers/hid/hid-nintendo.c

c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1513  
669abca7b767f0 Aashish Sharma      2022-07-20 @1514  static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
669abca7b767f0 Aashish Sharma      2022-07-20  1515  

:::::: The code at line 1514 was first introduced by commit
:::::: 669abca7b767f0daa34f6b965a415f7a9045703e HID: nintendo: Fix unused-const-variable compiler warning

:::::: TO: Aashish Sharma <shraash@google.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
