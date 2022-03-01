Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43ED4C9743
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 21:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235669AbiCAUrS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 15:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238368AbiCAUrR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 15:47:17 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B438723E7
        for <linux-input@vger.kernel.org>; Tue,  1 Mar 2022 12:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646167592; x=1677703592;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+BZy6vpYIRKgqHPI+ZwkgvhJSm5xExOPhjePmn4EcR4=;
  b=PUaqwMN7gO57vwlH1xydEyQ0QD8lY1UeBNggSc5/I/eMCDUPCFo3fTi+
   uIKnXa0fl9BPGD+Rk9+ckEvGxiyGuyGHJvbLCQzwU9DuekQGORghfBnan
   DMUfc4oysTBc89WrSvTCqzPjcsCMSQ6ATDTwOpFpP6DJhJziS5857mrRi
   UVX0j9il7Wyj/suBB5bOvw1RUofu7urB03QL1G4j/LhkIeMZ33JKz8IRI
   W7AZOHaGk68sj0D6xO9inzh0+ZdXT6PtNWAOF2rrCDDWN5NZYveFOrocC
   AjAB5lTy2TLLKkVN+u3l8SMqOKunDofD+BDuwQ3EK0kW1+hBxsBxmnJUq
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="277909867"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="277909867"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 12:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="535058018"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Mar 2022 12:46:24 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nP9O3-000106-Ew; Tue, 01 Mar 2022 20:46:23 +0000
Date:   Wed, 02 Mar 2022 04:45:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 d982992669733dd75520000c6057d8ee0725a363
Message-ID: <621e85f9.UiyHVErXXxTjeglJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: d982992669733dd75520000c6057d8ee0725a363  Input: goodix - workaround Cherry Trail devices with a bogus ACPI Interrupt() resource

elapsed time: 721m

configs tested: 163
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
arc                        vdk_hs38_defconfig
powerpc                      pasemi_defconfig
m68k                       m5249evb_defconfig
sh                          kfr2r09_defconfig
mips                     loongson1b_defconfig
powerpc                 mpc837x_mds_defconfig
sh                     magicpanelr2_defconfig
arc                 nsimosci_hs_smp_defconfig
parisc                              defconfig
h8300                       h8s-sim_defconfig
nios2                         10m50_defconfig
mips                           jazz_defconfig
nds32                               defconfig
powerpc                     tqm8548_defconfig
openrisc                 simple_smp_defconfig
sh                        sh7757lcr_defconfig
powerpc                         ps3_defconfig
arm                       multi_v4t_defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
m68k                       m5475evb_defconfig
sparc                       sparc64_defconfig
ia64                             alldefconfig
arm                          iop32x_defconfig
arm                     eseries_pxa_defconfig
powerpc                      mgcoge_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        vocore2_defconfig
mips                  maltasmvp_eva_defconfig
m68k                         amcore_defconfig
parisc64                         alldefconfig
sh                           se7722_defconfig
sh                               alldefconfig
powerpc                     ep8248e_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
arm                        oxnas_v6_defconfig
arc                           tb10x_defconfig
arm                           h5000_defconfig
xtensa                       common_defconfig
powerpc                     redwood_defconfig
parisc                generic-64bit_defconfig
mips                          rb532_defconfig
um                               alldefconfig
sh                        edosk7705_defconfig
mips                            ar7_defconfig
powerpc                      arches_defconfig
powerpc                        warp_defconfig
mips                           ip32_defconfig
sh                            hp6xx_defconfig
arm                            zeus_defconfig
arm                         assabet_defconfig
sh                           se7343_defconfig
mips                  decstation_64_defconfig
sh                            migor_defconfig
m68k                        stmark2_defconfig
mips                       bmips_be_defconfig
ia64                        generic_defconfig
csky                             alldefconfig
sh                          lboxre2_defconfig
riscv                    nommu_k210_defconfig
arm                         axm55xx_defconfig
sh                         ecovec24_defconfig
sh                           se7780_defconfig
arm                  randconfig-c002-20220301
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220301
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220301
riscv                randconfig-c006-20220301
i386                          randconfig-c001
arm                  randconfig-c002-20220301
mips                 randconfig-c004-20220301
arm                                 defconfig
powerpc                  mpc866_ads_defconfig
arm                          imote2_defconfig
powerpc                      walnut_defconfig
riscv                    nommu_virt_defconfig
arm                         bcm2835_defconfig
arm                         palmz72_defconfig
arm                         orion5x_defconfig
arm                        neponset_defconfig
powerpc                        fsp2_defconfig
arm                           spitz_defconfig
arm                        spear3xx_defconfig
mips                     loongson2k_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220301
hexagon              randconfig-r041-20220301
riscv                randconfig-r042-20220301
s390                 randconfig-r044-20220301

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
