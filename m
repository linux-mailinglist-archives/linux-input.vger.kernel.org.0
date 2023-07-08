Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3546174BFE9
	for <lists+linux-input@lfdr.de>; Sun,  9 Jul 2023 01:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjGHXHj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 8 Jul 2023 19:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGHXHi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 8 Jul 2023 19:07:38 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD80FF
        for <linux-input@vger.kernel.org>; Sat,  8 Jul 2023 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688857657; x=1720393657;
  h=date:from:to:cc:subject:message-id;
  bh=VR6ZzOt82ONlWLu3AMZg+Gq1ksBxjZN8PGO1OmZqLAg=;
  b=DbXQYK93VjuEdAg6QmRTC/iMeHJyMy/k3BtyTQFhxg5J+TSckPy32oAt
   uXTpTmHxTCnuhu9DYfLKJnVu7H2cdcihbaq0xrhLnIEVDd6Osn/TzkQGD
   0OojeT+GD9S5eF40IA2jyyR2YK86RttWJb/DHxP9Q0GFREB9nq4WP8x79
   vQw5pIOM5STPCV/gtwaaOzST84TW6bW/JxRgyPlp2XPT6kOkjtdfEttz5
   cOZlgr2P8qlevQaR8YRTkbEMCqhsl6woT1gj+hM/2NHa2klR6f36ePSaQ
   jKyVwcWGxi8nxpZ5dQE0BEiZpmNAaTtn09ra+PugMkL4mHorsYnfRntBm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="364149341"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="364149341"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 16:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="749920555"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="749920555"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Jul 2023 16:07:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qIH1a-0002vw-35;
        Sat, 08 Jul 2023 23:07:34 +0000
Date:   Sun, 09 Jul 2023 07:07:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 685b37704ce68924fa823d1cc37e512555526e06
Message-ID: <202307090724.BAA3DPkr-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 685b37704ce68924fa823d1cc37e512555526e06  dt-bindings: input: touchscreen: edt-ft5x06: Add 'threshold' property

elapsed time: 1306m

configs tested: 168
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r036-20230708   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r021-20230708   gcc  
arc                  randconfig-r043-20230708   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                        mvebu_v7_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r021-20230708   clang
arm                  randconfig-r023-20230708   clang
arm                  randconfig-r034-20230708   gcc  
arm                  randconfig-r035-20230708   gcc  
arm                  randconfig-r046-20230708   clang
arm                        spear6xx_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230708   gcc  
csky                 randconfig-r012-20230708   gcc  
hexagon              randconfig-r003-20230708   clang
hexagon              randconfig-r022-20230708   clang
hexagon              randconfig-r041-20230708   clang
hexagon              randconfig-r045-20230708   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230708   clang
i386         buildonly-randconfig-r005-20230708   clang
i386         buildonly-randconfig-r006-20230708   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230708   clang
i386                 randconfig-i002-20230708   clang
i386                 randconfig-i003-20230708   clang
i386                 randconfig-i004-20230708   clang
i386                 randconfig-i005-20230708   clang
i386                 randconfig-i006-20230708   clang
i386                 randconfig-i011-20230708   gcc  
i386                 randconfig-i012-20230708   gcc  
i386                 randconfig-i013-20230708   gcc  
i386                 randconfig-i014-20230708   gcc  
i386                 randconfig-i015-20230708   gcc  
i386                 randconfig-i016-20230708   gcc  
i386                 randconfig-r016-20230708   gcc  
i386                 randconfig-r033-20230708   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230708   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                 randconfig-r001-20230708   gcc  
m68k                 randconfig-r025-20230708   gcc  
microblaze           randconfig-r004-20230708   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                        maltaup_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230708   gcc  
nios2                randconfig-r014-20230708   gcc  
openrisc             randconfig-r012-20230708   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r024-20230708   gcc  
parisc               randconfig-r031-20230708   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                     kmeter1_defconfig   clang
powerpc                   microwatt_defconfig   clang
powerpc                     mpc512x_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                    mvme5100_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                       ppc64_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r011-20230708   gcc  
powerpc              randconfig-r025-20230708   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8540_defconfig   clang
powerpc                     tqm8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230708   clang
riscv                randconfig-r004-20230708   clang
riscv                randconfig-r013-20230708   gcc  
riscv                randconfig-r026-20230708   gcc  
riscv                randconfig-r042-20230708   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230708   clang
s390                 randconfig-r024-20230708   gcc  
s390                 randconfig-r032-20230708   clang
s390                 randconfig-r044-20230708   gcc  
sh                               allmodconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                   randconfig-r002-20230708   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230708   gcc  
sparc                randconfig-r031-20230708   gcc  
sparc64              randconfig-r026-20230708   gcc  
sparc64              randconfig-r034-20230708   gcc  
sparc64              randconfig-r035-20230708   gcc  
sparc64              randconfig-r036-20230708   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230708   clang
x86_64       buildonly-randconfig-r002-20230708   clang
x86_64       buildonly-randconfig-r003-20230708   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r002-20230708   clang
x86_64               randconfig-r014-20230708   gcc  
x86_64               randconfig-x001-20230708   gcc  
x86_64               randconfig-x002-20230708   gcc  
x86_64               randconfig-x003-20230708   gcc  
x86_64               randconfig-x004-20230708   gcc  
x86_64               randconfig-x005-20230708   gcc  
x86_64               randconfig-x006-20230708   gcc  
x86_64               randconfig-x011-20230708   clang
x86_64               randconfig-x012-20230708   clang
x86_64               randconfig-x013-20230708   clang
x86_64               randconfig-x014-20230708   clang
x86_64               randconfig-x015-20230708   clang
x86_64               randconfig-x016-20230708   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r005-20230708   gcc  
xtensa               randconfig-r023-20230708   gcc  
xtensa               randconfig-r032-20230708   gcc  
xtensa               randconfig-r033-20230708   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
