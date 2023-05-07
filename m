Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFE86F973C
	for <lists+linux-input@lfdr.de>; Sun,  7 May 2023 08:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjEGG5e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 May 2023 02:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjEGG5d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 May 2023 02:57:33 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51FB11616
        for <linux-input@vger.kernel.org>; Sat,  6 May 2023 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683442651; x=1714978651;
  h=date:from:to:cc:subject:message-id;
  bh=AtIFQ53TVVSQmCDy+/S2iQp5aShAWVLscv/svcq10Xs=;
  b=PBScE3FS0t5KDARSzawUMOoVOEaqn9S2szX/8CS81ICy0/qqjoPcgRww
   6HFW1+iN4WSdx/gyrHMBJFlDJnUM4TZlT3ipqaWaxkWeT77SZRcTKLe5/
   kAdZxudZEs/KCmTeMZKksno2soooMnni/UhwbmXJUuQkcAF8TqId+IYiG
   vN89fJ1QcbN9c5o+pYQ36RSq0Pd3UCNTacf33sdd7pzHwwc0MmCmPKKVz
   QTeLTOujAG1u9NKyms/UaVL+OAMh6RMFjtEOCZd+mruyGimKn9oSi59Pm
   GVePzhulK5WKsHGebbK/SSULmeKs9OLoetxVcajTaGNhsY8q68a4IaUYz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="412712534"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="412712534"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 23:57:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="701044565"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="701044565"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 May 2023 23:57:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pvYKn-0000fM-0W;
        Sun, 07 May 2023 06:57:29 +0000
Date:   Sun, 07 May 2023 14:56:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 e1141b0c625e495006c814edc3ffc58ef9ee86b5
Message-ID: <20230507065637.yFRaa%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: e1141b0c625e495006c814edc3ffc58ef9ee86b5  Input: ili210x - probe even if no resolution information

elapsed time: 725m

configs tested: 159
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r034-20230507   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230507   gcc  
arc                  randconfig-r025-20230507   gcc  
arc                  randconfig-r043-20230507   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                          ep93xx_defconfig   clang
arm                          exynos_defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                        mvebu_v7_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r036-20230507   clang
arm                  randconfig-r046-20230507   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230507   clang
arm64                randconfig-r016-20230507   clang
csky         buildonly-randconfig-r006-20230507   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r026-20230507   gcc  
hexagon              randconfig-r003-20230507   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r045-20230507   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230507   gcc  
ia64                 randconfig-r016-20230507   gcc  
ia64                 randconfig-r034-20230507   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230507   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r001-20230507   gcc  
loongarch            randconfig-r005-20230507   gcc  
loongarch            randconfig-r022-20230507   gcc  
loongarch            randconfig-r035-20230507   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230507   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r004-20230507   gcc  
m68k                           sun3_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze   buildonly-randconfig-r001-20230507   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r001-20230507   gcc  
microblaze           randconfig-r005-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230507   clang
mips                     loongson1b_defconfig   gcc  
mips                 randconfig-r022-20230507   gcc  
mips                 randconfig-r035-20230507   clang
mips                   sb1250_swarm_defconfig   clang
nios2        buildonly-randconfig-r002-20230507   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230507   gcc  
nios2                randconfig-r021-20230507   gcc  
openrisc             randconfig-r032-20230507   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230507   gcc  
parisc               randconfig-r014-20230507   gcc  
parisc               randconfig-r023-20230507   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc      buildonly-randconfig-r005-20230507   clang
powerpc                          g5_defconfig   clang
powerpc                      makalu_defconfig   gcc  
powerpc              randconfig-r003-20230507   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230507   clang
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230507   gcc  
riscv                randconfig-r014-20230507   clang
riscv                randconfig-r042-20230507   clang
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r004-20230507   clang
s390                                defconfig   gcc  
s390                 randconfig-r004-20230507   gcc  
s390                 randconfig-r011-20230507   clang
s390                 randconfig-r044-20230507   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r006-20230507   gcc  
sh                   randconfig-r012-20230507   gcc  
sh                   randconfig-r033-20230507   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230507   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64      buildonly-randconfig-r005-20230507   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r006-20230507   gcc  
sparc64              randconfig-r021-20230507   gcc  
sparc64              randconfig-r024-20230507   gcc  
sparc64              randconfig-r026-20230507   gcc  
sparc64              randconfig-r033-20230507   gcc  
sparc64              randconfig-r036-20230507   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r031-20230507   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
