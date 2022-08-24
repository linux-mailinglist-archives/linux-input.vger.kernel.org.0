Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A263B59FD6F
	for <lists+linux-input@lfdr.de>; Wed, 24 Aug 2022 16:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237648AbiHXOlT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Aug 2022 10:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238163AbiHXOlS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Aug 2022 10:41:18 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8696B8C7
        for <linux-input@vger.kernel.org>; Wed, 24 Aug 2022 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661352077; x=1692888077;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sc4+5AT4fj42kCR4lP4f+bYvhxwyo1ge8NWhrckk0i0=;
  b=MmqMHgUB+4i0yIDJjiMbiiRTzZBJLflTssUxMhQiAlWidG3cP2MQwfcY
   2DX7FiWF2ksHpzaGG+RcaFFewLJi4G9iMxQ2ZixdLieb424nAhaexbHF7
   hgUpffJeTa5Hm47AJ4L3mdEAawaef9d/z5dCg4R7SEL2APczZoknUvpUe
   nv5m3jO2r4w19jSRS2Jj4JuaAYP/WBzsunfOY8gTWrIDYpFX5XEceVfJC
   3TF8RoCPO+VH3/K+gk/oFEHNvODFzL3qB5fcr0E2rcngOynmArPbLSrn5
   n7NFOdbkPfkNsvxQptJXsMC9veL9UNCzdo+PWQpKkCOClwlFHbJL+mWsC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="320046473"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="320046473"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 07:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="670528144"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Aug 2022 07:41:15 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQrZD-0000ct-0a;
        Wed, 24 Aug 2022 14:41:15 +0000
Date:   Wed, 24 Aug 2022 22:40:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 a9da7251ac8bcc2f2358513868f1903ac2809b3d
Message-ID: <63063878.LTgEheZsZdgLI7JP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: a9da7251ac8bcc2f2358513868f1903ac2809b3d  Input: gameport - move from strlcpy with unused retval to strscpy

elapsed time: 2039m

configs tested: 179
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                                defconfig
sh                               allmodconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
mips                             allyesconfig
i386                 randconfig-a013-20220822
m68k                             allmodconfig
arm                                 defconfig
arc                              allyesconfig
i386                 randconfig-a011-20220822
x86_64                           allyesconfig
arc                               allnoconfig
x86_64               randconfig-a014-20220822
alpha                             allnoconfig
i386                 randconfig-a012-20220822
x86_64               randconfig-a012-20220822
riscv                             allnoconfig
x86_64               randconfig-a013-20220822
alpha                            allyesconfig
x86_64               randconfig-a011-20220822
i386                 randconfig-a016-20220822
csky                              allnoconfig
m68k                             allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
i386                 randconfig-a015-20220822
x86_64               randconfig-a015-20220822
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20220821
x86_64               randconfig-a016-20220822
arm                              allyesconfig
i386                 randconfig-a014-20220822
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20220822
riscv                randconfig-r042-20220822
x86_64                           rhel-8.3-kvm
s390                 randconfig-r044-20220822
ia64                             allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220823
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
loongarch                           defconfig
loongarch                         allnoconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
arm                            hisi_defconfig
um                                  defconfig
sh                     sh7710voipgw_defconfig
parisc64                         alldefconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arm                       omap2plus_defconfig
arc                          axs101_defconfig
arc                         haps_hs_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
ia64                         bigsur_defconfig
m68k                        m5272c3_defconfig
parisc                           alldefconfig
powerpc                     tqm8555_defconfig
sh                        sh7763rdp_defconfig
m68k                          multi_defconfig
arc                      axs103_smp_defconfig
m68k                            mac_defconfig
sh                               j2_defconfig
sh                           se7721_defconfig
m68k                          amiga_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
sh                             shx3_defconfig
powerpc                      tqm8xx_defconfig
ia64                                defconfig
m68k                        stmark2_defconfig
i386                          randconfig-c001
m68k                            q40_defconfig
ia64                        generic_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7724_defconfig
arm                         lubbock_defconfig
powerpc                   currituck_defconfig
arc                        nsim_700_defconfig
sh                   sh7770_generic_defconfig
arm                          gemini_defconfig
m68k                          atari_defconfig
sh                          sdk7786_defconfig
powerpc                    klondike_defconfig
sparc                             allnoconfig
microblaze                          defconfig
m68k                        mvme16x_defconfig
sh                          kfr2r09_defconfig
xtensa                          iss_defconfig
arm                           h5000_defconfig
m68k                         apollo_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                              allmodconfig
m68k                                defconfig
mips                             allmodconfig

clang tested configs:
x86_64               randconfig-a005-20220822
x86_64               randconfig-a006-20220822
x86_64               randconfig-a002-20220822
x86_64               randconfig-a003-20220822
x86_64               randconfig-a001-20220822
x86_64               randconfig-a004-20220822
i386                 randconfig-a001-20220822
i386                 randconfig-a006-20220822
i386                 randconfig-a004-20220822
i386                 randconfig-a005-20220822
i386                 randconfig-a002-20220822
i386                 randconfig-a003-20220822
hexagon              randconfig-r041-20220822
hexagon              randconfig-r045-20220822
riscv                randconfig-r042-20220821
hexagon              randconfig-r045-20220821
hexagon              randconfig-r041-20220821
s390                 randconfig-r044-20220821
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220823
hexagon              randconfig-r045-20220823
riscv                randconfig-r042-20220823
s390                 randconfig-r044-20220823
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
mips                     cu1000-neo_defconfig
powerpc                    gamecube_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
arm                            mmp2_defconfig
powerpc                     powernv_defconfig
x86_64                        randconfig-k001
mips                     loongson1c_defconfig
powerpc                     ppa8548_defconfig
powerpc                  mpc866_ads_defconfig
hexagon              randconfig-r045-20220824
hexagon              randconfig-r041-20220824
mips                        omega2p_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                        neponset_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                          g5_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
