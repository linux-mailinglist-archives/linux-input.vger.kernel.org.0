Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764CF615BC4
	for <lists+linux-input@lfdr.de>; Wed,  2 Nov 2022 06:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiKBFWr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Nov 2022 01:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiKBFWq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Nov 2022 01:22:46 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FCF2409F
        for <linux-input@vger.kernel.org>; Tue,  1 Nov 2022 22:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667366565; x=1698902565;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v4zFI+SZAhWH1hFNeobMBbcQku9WVbWmzvz/f/c77Q0=;
  b=dXPw9KSpmJvYGBqv7ozw+DhaOQ108Ti8EI5MG0ae/U/Fg0ZYqd36ebSV
   xXS6JQ2ef55CkoZ8hxyR/3RhwO5HYvKnyZlPDCbGxyPmMHnOEc0Wyc/H1
   RNuw2TzQiZ1GcrD6Y54EPKZDOMqHmPXzCGVF6MgPm3lvCYyxuC1oVF4Y2
   eg8y+c3ZIO7WJKTgmSc/PnS6x4PjDGKGuKj/+Az4OV1zO+vyIYpf30Nv2
   5BRpM2valbFnLvNK3MZalLtK8bYupvDhyWhJ+7S5S+6Gweo0ZlgvN5nR3
   V1WZ3JwJ6rnzb4jjAnarGCs62BFqyAv3LXqi7YDLvuoWVutW3vKcYVaXI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="292627671"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="292627671"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 22:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612104693"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="612104693"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Nov 2022 22:22:43 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oq6D4-000ESj-31;
        Wed, 02 Nov 2022 05:22:42 +0000
Date:   Wed, 02 Nov 2022 13:22:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 5b0c03e24a061f9c9e8b28fa157b80990c559a37
Message-ID: <6361fe91.yPEoqvdqUqTq9O6N%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 5b0c03e24a061f9c9e8b28fa157b80990c559a37  Input: Add driver for Cypress Generation 5 touchscreen

elapsed time: 843m

configs tested: 139
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a015
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
x86_64                               rhel-8.3
arc                                 defconfig
x86_64                              defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
arc                  randconfig-r043-20221101
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
i386                                defconfig
i386                          randconfig-a016
arm                                 defconfig
x86_64               randconfig-k001-20221031
ia64                             allmodconfig
x86_64                        randconfig-a004
i386                          randconfig-a014
i386                             allyesconfig
x86_64                        randconfig-a002
i386                          randconfig-a012
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a006
arm64                            allyesconfig
arm                              allyesconfig
s390                 randconfig-r044-20221031
riscv                randconfig-r042-20221031
arc                  randconfig-r043-20221031
i386                 randconfig-c001-20221031
mips                 randconfig-c004-20221031
m68k                             allyesconfig
i386                 randconfig-a016-20221031
i386                 randconfig-a012-20221031
i386                 randconfig-a015-20221031
i386                 randconfig-a013-20221031
i386                 randconfig-a014-20221031
i386                 randconfig-a011-20221031
m68k                             allmodconfig
powerpc                 linkstation_defconfig
openrisc                            defconfig
mips                    maltaup_xpa_defconfig
arc                      axs103_smp_defconfig
arm                       omap2plus_defconfig
arm                          iop32x_defconfig
riscv                    nommu_k210_defconfig
sh                        sh7757lcr_defconfig
openrisc                    or1ksim_defconfig
powerpc                     stx_gp3_defconfig
ia64                        generic_defconfig
sh                          rsk7203_defconfig
sh                      rts7751r2d1_defconfig
x86_64               randconfig-a016-20221031
x86_64               randconfig-a011-20221031
x86_64               randconfig-a013-20221031
x86_64               randconfig-a012-20221031
x86_64               randconfig-a014-20221031
x86_64               randconfig-a015-20221031
arm                             ezx_defconfig
arm                           sama5_defconfig
ia64                            zx1_defconfig
sparc                             allnoconfig
xtensa                    smp_lx200_defconfig
arm                          gemini_defconfig
sh                 kfr2r09-romimage_defconfig
xtensa                       common_defconfig
mips                         db1xxx_defconfig
mips                            ar7_defconfig
sh                     sh7710voipgw_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm64                            alldefconfig
m68k                        stmark2_defconfig
arm                            mps2_defconfig
i386                          randconfig-c001
m68k                        m5272c3_defconfig
sh                          r7780mp_defconfig
sh                          r7785rp_defconfig
sparc64                          alldefconfig
arm                      footbridge_defconfig
powerpc                     taishan_defconfig
sh                  sh7785lcr_32bit_defconfig
alpha                             allnoconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64               randconfig-c001-20221031
arm                  randconfig-c002-20221031
sparc                       sparc64_defconfig
sh                          lboxre2_defconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221101
riscv                randconfig-r042-20221101
hexagon              randconfig-r045-20221101
s390                 randconfig-r044-20221101
i386                          randconfig-a015
x86_64               randconfig-a004-20221031
i386                          randconfig-a013
x86_64               randconfig-a005-20221031
x86_64               randconfig-a003-20221031
x86_64               randconfig-a002-20221031
i386                          randconfig-a011
x86_64               randconfig-a001-20221031
x86_64               randconfig-a006-20221031
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a003
mips                        qi_lb60_defconfig
arm                        vexpress_defconfig
powerpc                       ebony_defconfig
powerpc                      obs600_defconfig
arm                       spear13xx_defconfig
riscv                             allnoconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
arm64                            allyesconfig
arm                          ep93xx_defconfig
arm                        mvebu_v5_defconfig
powerpc                   microwatt_defconfig
arm                         bcm2835_defconfig
mips                           ip28_defconfig
arm                      pxa255-idp_defconfig
mips                      bmips_stb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
