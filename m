Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E66275738A
	for <lists+linux-input@lfdr.de>; Tue, 18 Jul 2023 08:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjGRGES (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jul 2023 02:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjGRGER (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jul 2023 02:04:17 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B937A6
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 23:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689660256; x=1721196256;
  h=date:from:to:cc:subject:message-id;
  bh=nmjFRHfu1g4CRYhvYqRRED2cc2ZyIFYNNEWFwu5ghyo=;
  b=n7S1zdWO6dgY2t1+JenSssLQ3v5Sf30y+3e/f4oxYuTIGgCXoScopV+G
   TbESd6EV3+XiOQbFb08GHR/TSQiW77RaWvoyiOwa7oxM8xURxVENK/QSQ
   R/8X4FrioV7rWIuUYYLrOYVERFN+TIF53FP8kE9RImT7n/9OkAevn6+tx
   qeCBjpQ+VtdHHIUhjgW9llo4P7NB4PH+TrlRbcMotFI3TO+u0c+df9WZa
   P/JJXEoCGKTo3ACFXfuoz8pIYbmVF3We+oqMq81UKuNSP3AoMd7FkSru/
   eGiCjIDSD97+CesfrYwSyLknkKQni45fVjTFLi4fjD4n1AbHar13TxQN/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="345713265"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="345713265"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 23:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="970112788"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="970112788"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 23:04:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLdok-0000Ft-0P;
        Tue, 18 Jul 2023 06:04:14 +0000
Date:   Tue, 18 Jul 2023 14:03:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 904ef2c47d8f3d0f0c7d5c0dd68ecc95908d7360
Message-ID: <202307181428.OvVZDDSg-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 904ef2c47d8f3d0f0c7d5c0dd68ecc95908d7360  Input: gpio-keys - convert to dev_err_probe()

elapsed time: 724m

configs tested: 171
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230718   gcc  
alpha                randconfig-r024-20230717   gcc  
alpha                randconfig-r026-20230717   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r036-20230717   gcc  
arc                  randconfig-r043-20230717   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                  randconfig-r046-20230717   clang
arm                        realview_defconfig   gcc  
arm                         s3c6400_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230717   clang
arm64                randconfig-r002-20230717   clang
arm64                randconfig-r014-20230717   gcc  
arm64                randconfig-r035-20230717   clang
csky                                defconfig   gcc  
csky                 randconfig-r004-20230717   gcc  
csky                 randconfig-r023-20230717   gcc  
hexagon              randconfig-r041-20230717   clang
hexagon              randconfig-r045-20230717   clang
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230717   clang
i386         buildonly-randconfig-r004-20230718   gcc  
i386         buildonly-randconfig-r005-20230717   clang
i386         buildonly-randconfig-r005-20230718   gcc  
i386         buildonly-randconfig-r006-20230717   clang
i386         buildonly-randconfig-r006-20230718   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230717   clang
i386                 randconfig-i002-20230717   clang
i386                 randconfig-i003-20230717   clang
i386                 randconfig-i004-20230717   clang
i386                 randconfig-i005-20230717   clang
i386                 randconfig-i006-20230717   clang
i386                 randconfig-i011-20230717   gcc  
i386                 randconfig-i012-20230717   gcc  
i386                 randconfig-i013-20230717   gcc  
i386                 randconfig-i014-20230717   gcc  
i386                 randconfig-i015-20230717   gcc  
i386                 randconfig-i016-20230717   gcc  
i386                 randconfig-r022-20230717   gcc  
i386                 randconfig-r023-20230717   gcc  
i386                 randconfig-r031-20230717   clang
i386                 randconfig-r034-20230717   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230717   gcc  
loongarch            randconfig-r036-20230717   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                 randconfig-r011-20230717   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze           randconfig-r005-20230718   gcc  
microblaze           randconfig-r006-20230718   gcc  
microblaze           randconfig-r012-20230717   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r013-20230717   clang
mips                 randconfig-r033-20230717   gcc  
mips                          rb532_defconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r005-20230717   gcc  
openrisc             randconfig-r021-20230717   gcc  
openrisc             randconfig-r024-20230717   gcc  
openrisc             randconfig-r025-20230717   gcc  
openrisc             randconfig-r031-20230717   gcc  
openrisc             randconfig-r034-20230717   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r015-20230717   gcc  
parisc               randconfig-r016-20230717   gcc  
parisc               randconfig-r032-20230717   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r026-20230717   gcc  
powerpc                     stx_gp3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230717   gcc  
riscv                randconfig-r042-20230717   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230717   gcc  
s390                 randconfig-r025-20230717   gcc  
s390                 randconfig-r044-20230717   gcc  
sh                               allmodconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r003-20230718   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230717   gcc  
sparc                randconfig-r033-20230717   gcc  
sparc64              randconfig-r003-20230717   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230717   clang
x86_64       buildonly-randconfig-r001-20230718   gcc  
x86_64       buildonly-randconfig-r002-20230717   clang
x86_64       buildonly-randconfig-r002-20230718   gcc  
x86_64       buildonly-randconfig-r003-20230717   clang
x86_64       buildonly-randconfig-r003-20230718   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230717   gcc  
x86_64               randconfig-x002-20230717   gcc  
x86_64               randconfig-x003-20230717   gcc  
x86_64               randconfig-x004-20230717   gcc  
x86_64               randconfig-x005-20230717   gcc  
x86_64               randconfig-x006-20230717   gcc  
x86_64               randconfig-x011-20230717   clang
x86_64               randconfig-x012-20230717   clang
x86_64               randconfig-x013-20230717   clang
x86_64               randconfig-x014-20230717   clang
x86_64               randconfig-x015-20230717   clang
x86_64               randconfig-x016-20230717   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa               randconfig-r001-20230718   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
