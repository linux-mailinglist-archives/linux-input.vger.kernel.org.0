Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4DA55AF28B
	for <lists+linux-input@lfdr.de>; Tue,  6 Sep 2022 19:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236364AbiIFRaP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Sep 2022 13:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237058AbiIFR3r (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Sep 2022 13:29:47 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092688003E
        for <linux-input@vger.kernel.org>; Tue,  6 Sep 2022 10:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662484956; x=1694020956;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GecpeHRLBGaL1cT3P22KzfndlLbPAXCQJGga95/NsKo=;
  b=faOlSGVAoNfc6YI05X74ZIaUxbzD03ML8cClzlmgpCBGqudNQNUSo5m2
   Q3eJK5cP5mtBrMI/sSbzVntrAxIsxxEuPZNq5vT95ULQzElA/zv4AFKh8
   toboSiIigKYweqKB3t8LCiDTlogZVe3bkYMtnzT3dAZii8h4BNb3aVY+C
   GnM/zw3fwg4hCNcyWvx3xWI2IhmlDbtOY8ugL4rgPWTaRwzxWLaWvBK9q
   s5Q4Ns7YJBBp2gVGAOYfI3PHoyH8MTLdkyEZRD9FM5Qp9wbefREX43PKZ
   x/1xUnPWpi6k9yxTPliNJ48bHMMqCdvBtln7VXDj2YcNBMIXC7ZJLs4XG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="322834321"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="322834321"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 10:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="756447539"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2022 10:22:35 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oVcHT-0005ON-0n;
        Tue, 06 Sep 2022 17:22:35 +0000
Date:   Wed, 07 Sep 2022 01:22:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 94b22e125175e0c57d044c18d122ad5991348ca3
Message-ID: <631781bb.IKmQbjyE96w3cS+0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 94b22e125175e0c57d044c18d122ad5991348ca3  dt-bindings: input: touchscreen: stmpe: Remove node name requirement

elapsed time: 779m

configs tested: 157
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
i386                 randconfig-a003-20220905
i386                 randconfig-a004-20220905
i386                 randconfig-a001-20220905
i386                 randconfig-a002-20220905
m68k                             allmodconfig
i386                 randconfig-a005-20220905
i386                 randconfig-a006-20220905
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a003-20220905
x86_64               randconfig-a002-20220905
x86_64                           rhel-8.3-syz
x86_64               randconfig-a001-20220905
x86_64               randconfig-a004-20220905
x86_64                              defconfig
x86_64               randconfig-a005-20220905
mips                             allyesconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
riscv                randconfig-r042-20220906
arc                  randconfig-r043-20220906
s390                 randconfig-r044-20220906
x86_64                        randconfig-a011
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a015
i386                          randconfig-a014
x86_64                        randconfig-a013
i386                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
powerpc                     tqm8541_defconfig
sh                          polaris_defconfig
powerpc                 linkstation_defconfig
sh                           se7780_defconfig
mips                           xway_defconfig
powerpc                       holly_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arc                        nsim_700_defconfig
powerpc                        warp_defconfig
arm                      footbridge_defconfig
mips                     loongson1b_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
loongarch                           defconfig
loongarch                         allnoconfig
powerpc                         wii_defconfig
arm                            lart_defconfig
sh                               j2_defconfig
powerpc                 mpc85xx_cds_defconfig
sparc64                             defconfig
sh                         apsh4a3a_defconfig
i386                          randconfig-c001
sh                   sh7770_generic_defconfig
ia64                                defconfig
powerpc                    klondike_defconfig
ia64                            zx1_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-c001
arm                  randconfig-c002-20220906
arm                        trizeps4_defconfig
arm                        multi_v7_defconfig
powerpc                    adder875_defconfig
arm                         lpc18xx_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
arm                          pxa3xx_defconfig
microblaze                      mmu_defconfig
sh                          r7785rp_defconfig
sh                     sh7710voipgw_defconfig
openrisc                         alldefconfig
arm                           tegra_defconfig
arm                          gemini_defconfig
sh                         ecovec24_defconfig
xtensa                generic_kc705_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
mips                     decstation_defconfig
powerpc                      ppc40x_defconfig
mips                           ci20_defconfig
arm                              allmodconfig
arm                       aspeed_g5_defconfig
m68k                          multi_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        spear6xx_defconfig
xtensa                    smp_lx200_defconfig
arm                        shmobile_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
parisc                generic-32bit_defconfig
arc                         haps_hs_defconfig
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a013-20220905
i386                 randconfig-a012-20220905
i386                 randconfig-a011-20220905
i386                 randconfig-a014-20220905
i386                 randconfig-a016-20220905
i386                 randconfig-a015-20220905
i386                          randconfig-a013
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
x86_64                        randconfig-a014
i386                          randconfig-a011
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
powerpc                          allyesconfig
mips                          malta_defconfig
arm                        vexpress_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
powerpc                 mpc8313_rdb_defconfig
arm                            mmp2_defconfig
arm                    vt8500_v6_v7_defconfig
mips                  cavium_octeon_defconfig
mips                           ip27_defconfig
arm                         orion5x_defconfig
powerpc                      ppc64e_defconfig
powerpc                    mvme5100_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
