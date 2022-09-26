Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B74C5EB06B
	for <lists+linux-input@lfdr.de>; Mon, 26 Sep 2022 20:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbiIZSor (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Sep 2022 14:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbiIZSoW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Sep 2022 14:44:22 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2E9915CB
        for <linux-input@vger.kernel.org>; Mon, 26 Sep 2022 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664217790; x=1695753790;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ypa03rUDrXu2qYVHMUGxqg9Hcm/HfPXmmQcBNUJ8L/o=;
  b=D5/Ohjrx1Rw8xxFqGotY2RrjPwKlpzIU1jB4ZP7KiBPTumiwIBGhr8WY
   VUjmJdcf7WJ72h0GF8VyqRf9cJ/84F4Hg5rm2ZSQB6tiAAXN0wWKArrRZ
   MYNHk/j7FGUPgBESihz+PEXhuuZQ/TipHsnzaiJxCrVLODkAbFwkjPFyQ
   +Fj1jFsVoZ2Z3aOfgfE7F0wy02FRv6iMjyWtj1aHqNaPBWSFMiZzSke7u
   mQeYlhOjcF1C7Ywx/egNTjjHQ/IdnMaPCqFM7U/nWILsvHPTlzr5SsfTB
   ImQwf4gddrNMTs3fu3M5NCjdHZruU98DJPohvx2yxvt0oVuyr9J+wdpLU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="299831058"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="299831058"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 11:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="598851704"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="598851704"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 26 Sep 2022 11:43:08 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oct4N-0000AM-2h;
        Mon, 26 Sep 2022 18:43:07 +0000
Date:   Tue, 27 Sep 2022 02:42:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:gpio-of-cleanups] BUILD SUCCESS
 5c6098794cca5ac0a774ee430b72e18b8b98c032
Message-ID: <6331f2a6.TTcU5XVlhJQWPYty%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git gpio-of-cleanups
branch HEAD: 5c6098794cca5ac0a774ee430b72e18b8b98c032  mfd: twl6040: drop twl6040_platform_data and associated definitions

elapsed time: 722m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
i386                                defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
i386                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
s390                             allyesconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
m68k                             allmodconfig
arm                                 defconfig
i386                 randconfig-a001-20220926
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
x86_64                           allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20220926
i386                 randconfig-a002-20220926
powerpc                          allmodconfig
i386                 randconfig-a003-20220926
mips                             allyesconfig
sh                               allmodconfig
arc                  randconfig-r043-20220925
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
riscv                randconfig-r042-20220925
x86_64               randconfig-a003-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
i386                 randconfig-a011-20220926
x86_64               randconfig-a016-20220926
i386                 randconfig-a014-20220926
x86_64               randconfig-a013-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a015-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
i386                 randconfig-a016-20220926
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
