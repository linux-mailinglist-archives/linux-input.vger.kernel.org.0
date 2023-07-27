Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D367645F0
	for <lists+linux-input@lfdr.de>; Thu, 27 Jul 2023 07:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbjG0Fnz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jul 2023 01:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjG0Fmw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jul 2023 01:42:52 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DBC46B9
        for <linux-input@vger.kernel.org>; Wed, 26 Jul 2023 22:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436485; x=1721972485;
  h=date:from:to:cc:subject:message-id;
  bh=WKrZFfmLiozW4o5UNnadecBpX8QLsjABU7yi7ae5KKw=;
  b=X2qke92U/+GPM/Vc4ANMQfA4rQWRwbVUEEjgT4OCTWK7Rx1eQE99vo0P
   7LU/Erngg84ISurggQNvRPhCHYOGDL4r0n/jeDbVzvMELj0a4bmg5225q
   EIxwYKhuWvgzO88xUdr+sWs5Cy9rAT29JgJcbaN93f0kOHZFw1t0Br0zg
   ihkcFo9V7yOYFyPS4VF4T/oqBGbH9QnrddOx3bBK9oZ2Lk5xgK7NVkfO1
   radmFe2TFw4ErWZyx4CVcRGrFY4LDRw30tU7mGw1zH46ZR5oU9kmxhOZJ
   5Eqs3Y8BiRoMAeV2LezmL1ZzJ68US4pBEerL1K/KYvc40HsPScBOeSQtw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365671953"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="365671953"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816978986"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="816978986"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 22:40:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOtik-0001yh-2Q;
        Thu, 27 Jul 2023 05:39:56 +0000
Date:   Thu, 27 Jul 2023 13:38:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 92e24e0e57f72e06c2df87116557331fd2d4dda2
Message-ID: <202307271356.1guKe1hA-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 92e24e0e57f72e06c2df87116557331fd2d4dda2  Input: psmouse - add delay when deactivating for SMBus mode

elapsed time: 1444m

configs tested: 235
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230726   gcc  
alpha                randconfig-r004-20230726   gcc  
alpha                randconfig-r011-20230726   gcc  
alpha                randconfig-r013-20230726   gcc  
alpha                randconfig-r024-20230726   gcc  
alpha                randconfig-r032-20230726   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                  randconfig-r003-20230726   gcc  
arc                  randconfig-r006-20230726   gcc  
arc                  randconfig-r022-20230726   gcc  
arc                  randconfig-r034-20230726   gcc  
arc                  randconfig-r035-20230726   gcc  
arc                  randconfig-r043-20230726   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                  randconfig-r004-20230726   clang
arm                  randconfig-r014-20230726   gcc  
arm                  randconfig-r032-20230726   clang
arm                  randconfig-r046-20230726   gcc  
arm                         s5pv210_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230726   gcc  
arm64                randconfig-r011-20230726   clang
arm64                randconfig-r013-20230726   clang
arm64                randconfig-r026-20230726   clang
csky                                defconfig   gcc  
csky                 randconfig-r026-20230726   gcc  
csky                 randconfig-r033-20230726   gcc  
hexagon              randconfig-r014-20230726   clang
hexagon              randconfig-r022-20230726   clang
hexagon              randconfig-r023-20230726   clang
hexagon              randconfig-r034-20230726   clang
hexagon              randconfig-r036-20230726   clang
hexagon              randconfig-r041-20230726   clang
hexagon              randconfig-r045-20230726   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230726   gcc  
i386         buildonly-randconfig-r005-20230726   gcc  
i386         buildonly-randconfig-r006-20230726   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230726   gcc  
i386                 randconfig-i002-20230726   gcc  
i386                 randconfig-i003-20230726   gcc  
i386                 randconfig-i004-20230726   gcc  
i386                 randconfig-i005-20230726   gcc  
i386                 randconfig-i006-20230726   gcc  
i386                 randconfig-i011-20230726   clang
i386                 randconfig-i011-20230727   gcc  
i386                 randconfig-i012-20230726   clang
i386                 randconfig-i012-20230727   gcc  
i386                 randconfig-i013-20230726   clang
i386                 randconfig-i013-20230727   gcc  
i386                 randconfig-i014-20230726   clang
i386                 randconfig-i014-20230727   gcc  
i386                 randconfig-i015-20230726   clang
i386                 randconfig-i015-20230727   gcc  
i386                 randconfig-i016-20230726   clang
i386                 randconfig-i016-20230727   gcc  
i386                 randconfig-r006-20230726   gcc  
i386                 randconfig-r011-20230726   clang
i386                 randconfig-r013-20230726   clang
i386                 randconfig-r014-20230726   clang
i386                 randconfig-r016-20230726   clang
i386                 randconfig-r026-20230726   clang
i386                 randconfig-r034-20230726   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230726   gcc  
loongarch            randconfig-r003-20230726   gcc  
loongarch            randconfig-r004-20230726   gcc  
loongarch            randconfig-r005-20230726   gcc  
loongarch            randconfig-r006-20230726   gcc  
loongarch            randconfig-r015-20230726   gcc  
loongarch            randconfig-r016-20230726   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r001-20230726   gcc  
m68k                 randconfig-r002-20230726   gcc  
m68k                 randconfig-r012-20230726   gcc  
m68k                 randconfig-r024-20230726   gcc  
m68k                 randconfig-r036-20230726   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r001-20230726   gcc  
microblaze           randconfig-r006-20230726   gcc  
microblaze           randconfig-r012-20230726   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                     loongson2k_defconfig   clang
mips                malta_qemu_32r6_defconfig   clang
mips                 randconfig-r001-20230726   clang
mips                 randconfig-r012-20230726   gcc  
mips                 randconfig-r023-20230726   gcc  
mips                 randconfig-r032-20230726   clang
mips                 randconfig-r035-20230726   clang
mips                          rb532_defconfig   gcc  
mips                       rbtx49xx_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230726   gcc  
nios2                randconfig-r003-20230726   gcc  
nios2                randconfig-r004-20230726   gcc  
nios2                randconfig-r005-20230726   gcc  
nios2                randconfig-r014-20230726   gcc  
nios2                randconfig-r015-20230726   gcc  
nios2                randconfig-r022-20230726   gcc  
nios2                randconfig-r024-20230726   gcc  
nios2                randconfig-r025-20230726   gcc  
nios2                randconfig-r033-20230726   gcc  
openrisc             randconfig-r005-20230726   gcc  
openrisc             randconfig-r022-20230726   gcc  
openrisc             randconfig-r025-20230726   gcc  
openrisc             randconfig-r026-20230726   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r002-20230726   gcc  
parisc               randconfig-r006-20230726   gcc  
parisc               randconfig-r011-20230726   gcc  
parisc               randconfig-r014-20230726   gcc  
parisc               randconfig-r025-20230726   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                    ge_imp3a_defconfig   clang
powerpc                     powernv_defconfig   clang
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r005-20230726   gcc  
powerpc              randconfig-r006-20230726   gcc  
powerpc              randconfig-r013-20230726   clang
powerpc              randconfig-r025-20230726   clang
powerpc              randconfig-r032-20230726   gcc  
powerpc              randconfig-r036-20230726   gcc  
powerpc                  storcenter_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230726   gcc  
riscv                randconfig-r005-20230726   gcc  
riscv                randconfig-r015-20230726   clang
riscv                randconfig-r016-20230726   clang
riscv                randconfig-r022-20230726   clang
riscv                randconfig-r025-20230726   clang
riscv                randconfig-r032-20230726   gcc  
riscv                randconfig-r035-20230726   gcc  
riscv                randconfig-r036-20230726   gcc  
riscv                randconfig-r042-20230726   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230726   gcc  
s390                 randconfig-r005-20230726   gcc  
s390                 randconfig-r014-20230726   clang
s390                 randconfig-r032-20230726   gcc  
s390                 randconfig-r034-20230726   gcc  
s390                 randconfig-r044-20230726   clang
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                   randconfig-r001-20230726   gcc  
sh                   randconfig-r033-20230726   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230726   gcc  
sparc                randconfig-r016-20230726   gcc  
sparc                randconfig-r024-20230726   gcc  
sparc                randconfig-r026-20230726   gcc  
sparc                randconfig-r033-20230726   gcc  
sparc64              randconfig-r013-20230726   gcc  
sparc64              randconfig-r025-20230726   gcc  
sparc64              randconfig-r031-20230726   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230726   clang
um                   randconfig-r021-20230726   gcc  
um                   randconfig-r035-20230726   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230726   gcc  
x86_64       buildonly-randconfig-r002-20230726   gcc  
x86_64       buildonly-randconfig-r003-20230726   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r005-20230726   gcc  
x86_64               randconfig-r014-20230726   clang
x86_64               randconfig-x001-20230726   clang
x86_64               randconfig-x002-20230726   clang
x86_64               randconfig-x003-20230726   clang
x86_64               randconfig-x004-20230726   clang
x86_64               randconfig-x005-20230726   clang
x86_64               randconfig-x006-20230726   clang
x86_64               randconfig-x011-20230726   gcc  
x86_64               randconfig-x012-20230726   gcc  
x86_64               randconfig-x013-20230726   gcc  
x86_64               randconfig-x014-20230726   gcc  
x86_64               randconfig-x015-20230726   gcc  
x86_64               randconfig-x016-20230726   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230726   gcc  
xtensa               randconfig-r006-20230726   gcc  
xtensa               randconfig-r015-20230726   gcc  
xtensa               randconfig-r023-20230726   gcc  
xtensa               randconfig-r025-20230726   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
