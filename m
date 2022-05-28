Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C35D7536C9C
	for <lists+linux-input@lfdr.de>; Sat, 28 May 2022 13:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbiE1Lmj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 May 2022 07:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352664AbiE1Lmi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 May 2022 07:42:38 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124F6BE1A
        for <linux-input@vger.kernel.org>; Sat, 28 May 2022 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653738158; x=1685274158;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pOaQK/D4CD191tobltdwXaZVxcmhhuBwnvv3BHZt54E=;
  b=Z4P6NDUhofZIeUbTjBVnJrgiPiEAwNBTKyT4+jhUfLW9+IOpEccoM5+g
   5YCh/BUAzFKs59hQWl8sbFizTaxM5u7yAFK4j99UNGpEETSd3G4eslN2/
   S9mggmRm5x1qTYw2bfiTwJsuZ2lqXD8e5WnIarQ64nSsvlLgBfAYDfQlG
   k6GNYPfu8zpRLGXo0QXWVlAFPHoDRloC0uUFCQ1Oxqh2YYlrNc3oamj+t
   44D1MazXeP70FXIz24H+xItqQORuFv0Ntcyr9S0fDDCUpRJ6ZrebXl6Ww
   vOHvCY7Pv/iP8XH14nD8ZLQRU+KwDQbeIc3LxfPZ9PBSfA3NsJKYp1xZj
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="274390022"
X-IronPort-AV: E=Sophos;i="5.91,258,1647327600"; 
   d="scan'208";a="274390022"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2022 04:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,258,1647327600"; 
   d="scan'208";a="747502619"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 May 2022 04:42:36 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nuuq3-0000BQ-Rf;
        Sat, 28 May 2022 11:42:35 +0000
Date:   Sat, 28 May 2022 19:42:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 1e90e2628cec11c080db3260833f515cc32fc27c
Message-ID: <62920a90.cBfw1aduGdz0giQr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 1e90e2628cec11c080db3260833f515cc32fc27c  Merge branch 'next' into for-linus

elapsed time: 725m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                             allyesconfig
um                           x86_64_defconfig
riscv                            allmodconfig
um                             i386_defconfig
mips                             allmodconfig
riscv                            allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
s390                             allmodconfig
m68k                             allmodconfig
powerpc                          allyesconfig
s390                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
m68k                          sun3x_defconfig
powerpc                      ppc6xx_defconfig
arm                       multi_v4t_defconfig
parisc64                            defconfig
sh                             sh03_defconfig
xtensa                           alldefconfig
arc                     haps_hs_smp_defconfig
powerpc                 mpc8540_ads_defconfig
sh                            hp6xx_defconfig
mips                 decstation_r4k_defconfig
h8300                            alldefconfig
arm                         lpc18xx_defconfig
arc                                 defconfig
powerpc                       maple_defconfig
arm                            mps2_defconfig
arm                        trizeps4_defconfig
arm                            xcep_defconfig
nios2                         3c120_defconfig
sh                         microdev_defconfig
sh                            shmin_defconfig
arm                           u8500_defconfig
sh                           se7712_defconfig
alpha                               defconfig
powerpc                     ep8248e_defconfig
sh                          sdk7786_defconfig
xtensa                  cadence_csp_defconfig
sh                          kfr2r09_defconfig
ia64                                defconfig
powerpc                    adder875_defconfig
sh                          r7780mp_defconfig
m68k                          atari_defconfig
powerpc                      pcm030_defconfig
microblaze                          defconfig
m68k                          multi_defconfig
arm                          pxa910_defconfig
arc                      axs103_smp_defconfig
powerpc64                           defconfig
arm                        shmobile_defconfig
nios2                         10m50_defconfig
powerpc                   currituck_defconfig
arm                          lpd270_defconfig
arm                  randconfig-c002-20220524
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
riscv                             allnoconfig
m68k                                defconfig
nios2                               defconfig
csky                                defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
powerpc                           allnoconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220527
arc                  randconfig-r043-20220526
arc                  randconfig-r043-20220524
s390                 randconfig-r044-20220526
s390                 randconfig-r044-20220524
riscv                randconfig-r042-20220526
riscv                randconfig-r042-20220524
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
arm                  randconfig-c002-20220524
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220524
riscv                randconfig-c006-20220524
mips                 randconfig-c004-20220524
mips                     loongson2k_defconfig
mips                          malta_defconfig
mips                     loongson1c_defconfig
arm                          moxart_defconfig
mips                  cavium_octeon_defconfig
mips                           ip22_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                      pxa255-idp_defconfig
arm                       aspeed_g4_defconfig
mips                     cu1830-neo_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220524
hexagon              randconfig-r041-20220524

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
