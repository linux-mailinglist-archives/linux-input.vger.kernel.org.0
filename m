Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12B94FA959
	for <lists+linux-input@lfdr.de>; Sat,  9 Apr 2022 17:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236426AbiDIPsU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Apr 2022 11:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiDIPsT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Apr 2022 11:48:19 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5371B7
        for <linux-input@vger.kernel.org>; Sat,  9 Apr 2022 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649519172; x=1681055172;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=joxv3j+Y75tvpb7PbDJYi1oZ6aQvHujdiujz3rl+OP4=;
  b=aMXTlsMAJocLHiWmV6Az8ZoCGaxyu/WEiMSS0BxcOU2MRSiDgl1IPkPD
   ZQroYGvqP7jVwCQr8JoohxV8WUuK9pETAlObv7gfO5n3oTaGbUDLdBDzN
   xU07LpCPDODIjmdNAawTC7uKYB8sXEaWWAZObUOXwNNKug0U91q7J4VWb
   YY10BVz21UI6EFkApwGYhpKAPF05ovNI40cCpiRfhlgwm1NaS3TqtSlRy
   7rBWlREPvbM1c2Q7ppx7BnsbqqBy4V5N4uoWKjFtB+lvPZUnzveLZwlIn
   PJT7FvelqXcSb1dhqk+/ah4C/3d2GpSvpiKUhMtI+6GxG8pHOjcD3yW5z
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10312"; a="348253366"
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; 
   d="scan'208";a="348253366"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2022 08:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; 
   d="scan'208";a="852603961"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2022 08:46:11 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ndDHu-0000Ab-MO;
        Sat, 09 Apr 2022 15:46:10 +0000
Date:   Sat, 09 Apr 2022 23:45:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 fd0a4b39870d49ff15f6966470185409e261f20f
Message-ID: <6251aa2e.XUY8iAQNOcLDGO7/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: fd0a4b39870d49ff15f6966470185409e261f20f  Input: cypress-sf - register a callback to disable the regulators

elapsed time: 721m

configs tested: 118
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
x86_64                           allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
ia64                             allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
m68k                             allmodconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
i386                          randconfig-c001
alpha                            allyesconfig
nios2                            allyesconfig
arc                              allyesconfig
mips                           jazz_defconfig
powerpc                       eiger_defconfig
ia64                      gensparse_defconfig
mips                 decstation_r4k_defconfig
sh                        sh7785lcr_defconfig
sh                            hp6xx_defconfig
arm                        mvebu_v7_defconfig
x86_64                              defconfig
powerpc                 mpc837x_rdb_defconfig
arm64                            alldefconfig
nios2                         10m50_defconfig
mips                    maltaup_xpa_defconfig
sh                            migor_defconfig
sh                           se7206_defconfig
arc                         haps_hs_defconfig
xtensa                    smp_lx200_defconfig
arm                             ezx_defconfig
mips                     decstation_defconfig
ia64                             alldefconfig
sh                        sh7763rdp_defconfig
m68k                        mvme147_defconfig
arm                  randconfig-c002-20220408
x86_64                        randconfig-c001
ia64                                defconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
arc                                 defconfig
parisc                              defconfig
parisc64                            defconfig
s390                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
nios2                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20220408
arc                  randconfig-r043-20220408
s390                 randconfig-r044-20220408
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220408
mips                 randconfig-c004-20220408
arm                  randconfig-c002-20220408
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20220408
riscv                randconfig-c006-20220408
s390                             alldefconfig
mips                        omega2p_defconfig
hexagon                             defconfig
powerpc                    socrates_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220408
hexagon              randconfig-r041-20220408
hexagon              randconfig-r045-20220409
riscv                randconfig-r042-20220409
hexagon              randconfig-r041-20220409

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
