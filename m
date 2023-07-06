Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268A6749DEA
	for <lists+linux-input@lfdr.de>; Thu,  6 Jul 2023 15:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbjGFNir (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jul 2023 09:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232468AbjGFNiq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jul 2023 09:38:46 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7DC19A0
        for <linux-input@vger.kernel.org>; Thu,  6 Jul 2023 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688650710; x=1720186710;
  h=date:from:to:cc:subject:message-id;
  bh=snjTVtquLQJrpYWeiwOOrT1Yd9lEQGivTiiOe5aMmm4=;
  b=IruZwt0jSQMDys3rc0r8ARBzyRv4UIIFHnNhvySWgMiwIQ8jzNmHG27J
   4U7XvY4ZZdZAKvlGKvQZufLAAXRt5Nn2NDBVNjN1hTbc5t+OvEw7Zb7iH
   TIrGqPPmIi7ZKootQrtNTnfqWmTebMv4XcUBiMo8mk+jgf4Z5712aOlZl
   gZYCKIFb0iFumMrJTAsNmQSrtm513Vu4VKaVDPZV+N55DtwHOuFKdj1Oh
   a0pZ0l4q7NfRyJsL8HNT96RD/UEOwyd6EB3Sf8AKv4gZWiH5KcreM4AT8
   PTy8ye/rLnZoxe/jQZgBfbDhP+49RYnylgy+F9+Q/lUaZGlf2jZD+ylFy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="353442661"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="353442661"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 06:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="696849165"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="696849165"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jul 2023 06:38:26 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qHPBh-0001Li-1p;
        Thu, 06 Jul 2023 13:38:25 +0000
Date:   Thu, 06 Jul 2023 21:37:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 650cda2ce25f08e8fae391b3ba6be27e7296c6a5
Message-ID: <202307062154.uzrBdlLY-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 650cda2ce25f08e8fae391b3ba6be27e7296c6a5  Input: gameport - add ISA and HAS_IOPORT dependencies

elapsed time: 725m

configs tested: 163
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230706   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                         lpc18xx_defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                  randconfig-r002-20230706   gcc  
arm                  randconfig-r014-20230706   clang
arm                  randconfig-r046-20230706   clang
arm                         s5pv210_defconfig   clang
arm                           sama7_defconfig   clang
arm                         socfpga_defconfig   clang
arm                           tegra_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230706   clang
arm64                randconfig-r024-20230706   gcc  
arm64                randconfig-r032-20230706   clang
csky                                defconfig   gcc  
csky                 randconfig-r033-20230706   gcc  
hexagon                          alldefconfig   clang
hexagon              randconfig-r031-20230706   clang
hexagon              randconfig-r041-20230706   clang
hexagon              randconfig-r045-20230706   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230706   clang
i386         buildonly-randconfig-r005-20230706   clang
i386         buildonly-randconfig-r006-20230706   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230706   clang
i386                 randconfig-i002-20230706   clang
i386                 randconfig-i003-20230706   clang
i386                 randconfig-i004-20230706   clang
i386                 randconfig-i005-20230706   clang
i386                 randconfig-i006-20230706   clang
i386                 randconfig-i011-20230706   gcc  
i386                 randconfig-i012-20230706   gcc  
i386                 randconfig-i013-20230706   gcc  
i386                 randconfig-i014-20230706   gcc  
i386                 randconfig-i015-20230706   gcc  
i386                 randconfig-i016-20230706   gcc  
i386                 randconfig-r005-20230706   clang
i386                 randconfig-r031-20230706   clang
i386                 randconfig-r035-20230706   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230706   gcc  
loongarch            randconfig-r025-20230706   gcc  
loongarch            randconfig-r034-20230706   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                 randconfig-r023-20230706   gcc  
m68k                           sun3_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          malta_defconfig   clang
mips                 randconfig-r012-20230706   clang
mips                 randconfig-r032-20230706   gcc  
mips                           rs90_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r035-20230706   gcc  
openrisc             randconfig-r022-20230706   gcc  
openrisc             randconfig-r024-20230706   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230706   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                      ppc64e_defconfig   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                randconfig-r016-20230706   gcc  
riscv                randconfig-r021-20230706   gcc  
riscv                randconfig-r023-20230706   gcc  
riscv                randconfig-r036-20230706   clang
riscv                randconfig-r042-20230706   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230706   gcc  
sh                               allmodconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                   randconfig-r001-20230706   gcc  
sh                   randconfig-r026-20230706   gcc  
sh                           se7751_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230706   gcc  
sparc                randconfig-r016-20230706   gcc  
sparc64              randconfig-r011-20230706   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r002-20230706   gcc  
um                   randconfig-r025-20230706   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230706   clang
x86_64       buildonly-randconfig-r002-20230706   clang
x86_64       buildonly-randconfig-r003-20230706   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r026-20230706   gcc  
x86_64               randconfig-r033-20230706   clang
x86_64               randconfig-r034-20230706   clang
x86_64               randconfig-r036-20230706   clang
x86_64               randconfig-x001-20230706   gcc  
x86_64               randconfig-x002-20230706   gcc  
x86_64               randconfig-x003-20230706   gcc  
x86_64               randconfig-x004-20230706   gcc  
x86_64               randconfig-x005-20230706   gcc  
x86_64               randconfig-x006-20230706   gcc  
x86_64               randconfig-x011-20230706   clang
x86_64               randconfig-x012-20230706   clang
x86_64               randconfig-x013-20230706   clang
x86_64               randconfig-x014-20230706   clang
x86_64               randconfig-x015-20230706   clang
x86_64               randconfig-x016-20230706   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r004-20230706   gcc  
xtensa               randconfig-r015-20230706   gcc  
xtensa               randconfig-r022-20230706   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
