Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF7A53AAE7
	for <lists+linux-input@lfdr.de>; Wed,  1 Jun 2022 18:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245451AbiFAQVg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 12:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356076AbiFAQVf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 12:21:35 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A902279396
        for <linux-input@vger.kernel.org>; Wed,  1 Jun 2022 09:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654100494; x=1685636494;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KjPHIv8kxWB0dw4ZPXF4ZNn/24V26fs+mkTg0D1WRZg=;
  b=hehSj8VzbNINVRfZxJZ8suIhSDLKXkT7WRQ7HhdWfCUNLUXa9bH+RF0i
   ywolvmneaiSAsf406fm+wn+Dq88VmJ6A9LVpyBSP0hL471z7R0D8VyEsL
   MYwQxf5KJZ7H8tt7h5vJlCXJnpsebVfDIW/dNx2hAY5iQ64Af+a1e3XLc
   3Y+KA+jgqtsdMdEiecZ0b+pddpzKDeAvLw/1yxKJTbwRZXFiaLL2laStn
   ZV4N/Tl6AtEdFBJuOjbP/qD6dX34lmM9/iVP2BoZVRRQWylha7OoqSEs0
   IxdmsfKmB08eCMIUs3BqGhe+TaRd3Ht/5P+DstZFCLdMXuSXEF8cl/gxZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="274446786"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="274446786"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 09:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="667502404"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Jun 2022 09:21:08 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nwR5o-0004AY-6q;
        Wed, 01 Jun 2022 16:21:08 +0000
Date:   Thu, 02 Jun 2022 00:21:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 69cf890d8b283c8d3a77d28dbd3024f58ae236a9
Message-ID: <629791ed.9kaLwnerrPlD4g4R%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 69cf890d8b283c8d3a77d28dbd3024f58ae236a9  Input: mtk-pmic-keys - move long press debounce mask to mtk_pmic_regs

elapsed time: 721m

configs tested: 130
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                  sh7785lcr_32bit_defconfig
arm64                            alldefconfig
sh                   sh7770_generic_defconfig
sh                          lboxre2_defconfig
arm                         cm_x300_defconfig
arc                      axs103_smp_defconfig
m68k                           sun3_defconfig
powerpc                     tqm8555_defconfig
powerpc                     pq2fads_defconfig
openrisc                 simple_smp_defconfig
mips                       capcella_defconfig
arm                           tegra_defconfig
arm                        shmobile_defconfig
sh                          rsk7201_defconfig
xtensa                  nommu_kc705_defconfig
arm                            zeus_defconfig
alpha                            alldefconfig
ia64                         bigsur_defconfig
sh                        dreamcast_defconfig
parisc                generic-64bit_defconfig
xtensa                         virt_defconfig
ia64                          tiger_defconfig
xtensa                              defconfig
sh                               alldefconfig
sh                          kfr2r09_defconfig
arm                        realview_defconfig
powerpc                      mgcoge_defconfig
sh                          r7780mp_defconfig
mips                         bigsur_defconfig
arm                        cerfcube_defconfig
parisc64                            defconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220531
s390                 randconfig-r044-20220531
riscv                randconfig-r042-20220531
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                 randconfig-c004-20220531
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20220531
arm                  randconfig-c002-20220531
powerpc              randconfig-c003-20220531
riscv                randconfig-c006-20220531
arm                     am200epdkit_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                     tqm5200_defconfig
arm                                 defconfig
powerpc                      acadia_defconfig
powerpc                     kmeter1_defconfig
mips                  cavium_octeon_defconfig
arm                           sama7_defconfig
arm                         shannon_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     skiroot_defconfig
powerpc                    ge_imp3a_defconfig
mips                         tb0287_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220531
hexagon              randconfig-r045-20220531

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
