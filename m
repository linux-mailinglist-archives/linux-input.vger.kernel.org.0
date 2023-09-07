Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62CA079754E
	for <lists+linux-input@lfdr.de>; Thu,  7 Sep 2023 17:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbjIGPq7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Sep 2023 11:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244473AbjIGPcD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Sep 2023 11:32:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A095F10E9
        for <linux-input@vger.kernel.org>; Thu,  7 Sep 2023 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694100697; x=1725636697;
  h=date:from:to:cc:subject:message-id;
  bh=vH/C+XmckmvsOJLAjiqtugMWiSLrGhtSxrZ8BSD299s=;
  b=cB5qytai0kpuQ1va6KBI3Onmi/2w74E/iUJ+skw0StRdcsVhx7NnY0j2
   7XndeL1iHrci9ZkTUWa9CBtMijNKrTPLhIfENgLEv779twVGcN56/9bHr
   vc+RXpt57B3n3qvedGUC5ZCo916CXoDykQrEYj/RIC92GFffKsJFAdbEv
   BZOMhZuTHqYW/O+NVF9xiDdOmk9J+rrR4nPK66Fm8qAgp2weMpXLURRdH
   lnvkmHZ6iRlAhI4C+hhKoEJP0Pe/BFeR6GJDO6Ic6oTLcyvC0D8ZhpJpU
   1sdyCbgKBc2rmfQpBREmx0xAlifckrDUowU2Lf46oSZg7SHGOBliqITHi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362365912"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="362365912"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 05:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988751680"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="988751680"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Sep 2023 05:25:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qeE4D-0001DI-0q;
        Thu, 07 Sep 2023 12:25:01 +0000
Date:   Thu, 07 Sep 2023 20:24:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 305dd76455038f3b2338bd0560387cf829c7567c
Message-ID: <202309072039.qYHTVfw3-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 305dd76455038f3b2338bd0560387cf829c7567c  Input: wdt87xx_i2c - use device core to create driver-specific device attributes

elapsed time: 726m

configs tested: 208
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230907   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                  randconfig-r003-20230907   gcc  
arc                  randconfig-r024-20230907   gcc  
arc                  randconfig-r033-20230907   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                      footbridge_defconfig   gcc  
arm                  randconfig-r002-20230907   gcc  
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230907   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230907   gcc  
hexagon              randconfig-r034-20230907   clang
hexagon              randconfig-r035-20230907   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230907   clang
i386         buildonly-randconfig-002-20230907   clang
i386         buildonly-randconfig-003-20230907   clang
i386         buildonly-randconfig-004-20230907   clang
i386         buildonly-randconfig-005-20230907   clang
i386         buildonly-randconfig-006-20230907   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230907   clang
i386                  randconfig-002-20230907   clang
i386                  randconfig-003-20230907   clang
i386                  randconfig-004-20230907   clang
i386                  randconfig-005-20230907   clang
i386                  randconfig-006-20230907   clang
i386                  randconfig-011-20230907   gcc  
i386                  randconfig-012-20230907   gcc  
i386                  randconfig-013-20230907   gcc  
i386                  randconfig-014-20230907   gcc  
i386                  randconfig-015-20230907   gcc  
i386                  randconfig-016-20230907   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230907   gcc  
loongarch            randconfig-r023-20230907   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r004-20230907   gcc  
m68k                 randconfig-r006-20230907   gcc  
m68k                 randconfig-r024-20230907   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r003-20230907   gcc  
microblaze           randconfig-r022-20230907   gcc  
microblaze           randconfig-r023-20230907   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r014-20230907   clang
mips                 randconfig-r036-20230907   gcc  
mips                           xway_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230907   gcc  
nios2                randconfig-r013-20230907   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r004-20230907   gcc  
openrisc             randconfig-r011-20230907   gcc  
openrisc             randconfig-r015-20230907   gcc  
openrisc             randconfig-r031-20230907   gcc  
openrisc             randconfig-r035-20230907   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r032-20230907   gcc  
parisc               randconfig-r033-20230907   gcc  
parisc               randconfig-r034-20230907   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r014-20230907   gcc  
powerpc              randconfig-r026-20230907   gcc  
powerpc                     skiroot_defconfig   clang
powerpc64            randconfig-r005-20230907   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r011-20230907   gcc  
riscv                randconfig-r025-20230907   gcc  
riscv                randconfig-r031-20230907   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230907   gcc  
s390                 randconfig-r002-20230907   clang
s390                 randconfig-r012-20230907   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r001-20230907   gcc  
sh                   randconfig-r022-20230907   gcc  
sh                           se7206_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230907   gcc  
sparc                randconfig-r031-20230907   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r032-20230907   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r005-20230907   gcc  
um                   randconfig-r006-20230907   gcc  
um                   randconfig-r026-20230907   clang
um                   randconfig-r036-20230907   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230907   clang
x86_64       buildonly-randconfig-002-20230907   clang
x86_64       buildonly-randconfig-003-20230907   clang
x86_64       buildonly-randconfig-004-20230907   clang
x86_64       buildonly-randconfig-005-20230907   clang
x86_64       buildonly-randconfig-006-20230907   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230907   gcc  
x86_64                randconfig-002-20230907   gcc  
x86_64                randconfig-003-20230907   gcc  
x86_64                randconfig-004-20230907   gcc  
x86_64                randconfig-005-20230907   gcc  
x86_64                randconfig-006-20230907   gcc  
x86_64                randconfig-011-20230907   clang
x86_64                randconfig-012-20230907   clang
x86_64                randconfig-013-20230907   clang
x86_64                randconfig-014-20230907   clang
x86_64                randconfig-015-20230907   clang
x86_64                randconfig-016-20230907   clang
x86_64                randconfig-071-20230907   clang
x86_64                randconfig-072-20230907   clang
x86_64                randconfig-073-20230907   clang
x86_64                randconfig-074-20230907   clang
x86_64                randconfig-075-20230907   clang
x86_64                randconfig-076-20230907   clang
x86_64               randconfig-r036-20230907   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r013-20230907   gcc  
xtensa               randconfig-r021-20230907   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
