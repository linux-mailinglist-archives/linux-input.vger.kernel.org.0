Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0688D5B8184
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 08:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiINGdu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 02:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiINGdt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 02:33:49 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555666171F
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 23:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663137228; x=1694673228;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/s880EnXBpKY6wOVYWsR6auE0YdYjh5L2AxeLKodp4U=;
  b=UnfiQeP75Nart6jslg1RcE43nxZoVOQAZY6UHkw9fMBvYX1+Yex95H9n
   VnAQ80SdZlRghcnvErsqyGYP7Pxtk1vW0u4aGff4cRjLrADRxAtJl5z1F
   CFW2U+j63YD0i+L5qNBVFJ+lZLyeT0xOLjr4Ome6//9UzNeMn6C0BhBSE
   mHSTP8w4q/okzj8jy3tuq+1omVn0jvUoxCY7yUk6WBZpFiQFqcYBBMTEb
   fJwYQfJo+ZUeEMmz8InQ8M/Niev0j3MEsd3eclc84jaSUgc7peCjUu+3G
   3eXVXxaVNN8Jqd9YNuYUrWbV3LT9U081EXB3SVFU1HGiv0rJPLa2/GwfT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="278079265"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="278079265"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 23:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="567889480"
Received: from lkp-server01.sh.intel.com (HELO f00d1ee8958c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2022 23:33:46 -0700
Received: from kbuild by f00d1ee8958c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYLxx-00002o-30;
        Wed, 14 Sep 2022 06:33:45 +0000
Date:   Wed, 14 Sep 2022 14:33:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:gpio-test] BUILD SUCCESS
 584572bcd1aab71a159c7156b92d03d927eaa423
Message-ID: <632175b1.2FW8OwndfmFkYSJw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git gpio-test
branch HEAD: 584572bcd1aab71a159c7156b92d03d927eaa423  media: i2c: s5k6a3: switch to using gpiod API

elapsed time: 730m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
i386                 randconfig-a005-20220912
i386                 randconfig-a001-20220912
i386                 randconfig-a002-20220912
i386                 randconfig-a004-20220912
i386                 randconfig-a003-20220912
i386                 randconfig-a006-20220912
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                                defconfig
x86_64                              defconfig
sh                               allmodconfig
arm                                 defconfig
m68k                             allmodconfig
riscv                randconfig-r042-20220911
x86_64                               rhel-8.3
m68k                             allyesconfig
arc                  randconfig-r043-20220912
x86_64               randconfig-a001-20220912
arm                              allyesconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64               randconfig-a006-20220912
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
x86_64               randconfig-a004-20220912
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20220911
arm64                            allyesconfig
x86_64                           rhel-8.3-syz
s390                 randconfig-r044-20220911
x86_64               randconfig-a002-20220912
x86_64               randconfig-a005-20220912
x86_64               randconfig-a003-20220912
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a013-20220912
i386                 randconfig-a011-20220912
i386                 randconfig-a012-20220912
i386                 randconfig-a014-20220912
i386                 randconfig-a015-20220912
i386                 randconfig-a016-20220912
x86_64               randconfig-a011-20220912
riscv                randconfig-r042-20220912
hexagon              randconfig-r041-20220912
x86_64               randconfig-a012-20220912
hexagon              randconfig-r045-20220911
x86_64               randconfig-a015-20220912
x86_64               randconfig-a016-20220912
x86_64               randconfig-a013-20220912
hexagon              randconfig-r041-20220911
x86_64               randconfig-a014-20220912
hexagon              randconfig-r045-20220912
s390                 randconfig-r044-20220912

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
