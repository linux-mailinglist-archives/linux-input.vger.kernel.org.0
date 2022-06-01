Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2646E53AADE
	for <lists+linux-input@lfdr.de>; Wed,  1 Jun 2022 18:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240224AbiFAQUR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 12:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356067AbiFAQUL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 12:20:11 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C010E79387
        for <linux-input@vger.kernel.org>; Wed,  1 Jun 2022 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654100410; x=1685636410;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x1m3VVcvUDGKJZzEzhtda0G7yFRux6b5kfQkqjKC04M=;
  b=kODzdK4PdXVnNcfYERM+CLETqplCiMIeMvW27vQ2tstDWNbP2mXsLsWT
   hlly/O3THad67KNooXs03HjOpUfQcR3bhe+HOnxYiK8tnWFuTnazq/Yef
   cGfpvBoyDLxnHI1XLYa8jwqgjCsaUrFtv5JmZYsTRg2GhLZ5JOmtET605
   utisZ3F5lg3JeupbTXJl6BWQGpVLyPnX72B5sgHMkWabV4ZWv5EBXuP+h
   B2w7Sofnppa1s5TP3OhuIKGtRHwZMOB8Vc02SSBFzLwslYw9mN0oMDXzt
   X9oT4c6ASW5B9LNS2yIVHDu2KBDwHN5a0ThwjsrNTwk0Kr1TjZT6SAqDt
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="336299488"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="336299488"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 09:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="552383876"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Jun 2022 09:20:08 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nwR4q-0004AI-2n;
        Wed, 01 Jun 2022 16:20:08 +0000
Date:   Thu, 02 Jun 2022 00:19:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 5f92df8ddacb4b97f6865a3bf687f240072f4f68
Message-ID: <62979192.EBrIujjrXn6lAt6Z%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 5f92df8ddacb4b97f6865a3bf687f240072f4f68  Input: raspberrypi-ts - add missing HAS_IOMEM dependency

elapsed time: 720m

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
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220531
s390                 randconfig-r044-20220531
riscv                randconfig-r042-20220531
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
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
