Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB3A4B9369
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 22:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235716AbiBPWAG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 17:00:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiBPWAG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 17:00:06 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAD2299249
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 13:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645048793; x=1676584793;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7rcdsBljgqY69PBQCpqYCglUCe5QDohcN9s9oHSfQOw=;
  b=Ej9C/Mg9yemXLndpuEmVhrU03Ye9yNsPFGwy4K5gI6yM+94wKd9PbO70
   m3ZexUkngh5VohlWBGjRz9EIF9r8j3wcFm5ynsjHwovy2a2JQ3mBaJKWB
   6cYOdrC7UqIgIazHPnCleUe+pb2ICy2EIVt+s7fRrJx6H7LY1K6AmvfpB
   vbERcy6GzUhWoJDk84zYKrpKf7e5QQFuzGhgxq217EEpfTtprA5C8a/x3
   I/p2kjjg6SLIyMMpiFK00PuFiAjiYzvh9XZJle7Fl2yWu5yxYO/AHAaYi
   derccwimRbq/liaZb6M6PreSVCHY9nIEOKzrX/rHG85q69Ld2pHNJqiM/
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234266410"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="234266410"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 13:59:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="487449547"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Feb 2022 13:59:51 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nKSL0-000B9v-GG; Wed, 16 Feb 2022 21:59:50 +0000
Date:   Thu, 17 Feb 2022 05:59:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 e511fc58071ab9b72d25667e5957cf895eb53cdf
Message-ID: <620d73ac.9t41SEiUwC4JQaTy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: e511fc58071ab9b72d25667e5957cf895eb53cdf  Input: tsc200x - add axis inversion and swapping support

elapsed time: 900m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
powerpc                 mpc8540_ads_defconfig
m68k                       m5208evb_defconfig
sparc                       sparc32_defconfig
mips                            gpr_defconfig
arm                           corgi_defconfig
arc                      axs103_smp_defconfig
xtensa                           alldefconfig
microblaze                      mmu_defconfig
m68k                        m5307c3_defconfig
h8300                    h8300h-sim_defconfig
m68k                        stmark2_defconfig
mips                             allyesconfig
sh                        sh7785lcr_defconfig
arm                      jornada720_defconfig
m68k                       m5475evb_defconfig
arc                         haps_hs_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                      makalu_defconfig
sh                           se7206_defconfig
sh                          kfr2r09_defconfig
mips                           jazz_defconfig
powerpc                       holly_defconfig
mips                           gcw0_defconfig
sh                          sdk7786_defconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                    sam440ep_defconfig
sparc64                          alldefconfig
sh                                  defconfig
m68k                             alldefconfig
arm                       aspeed_g5_defconfig
xtensa                  nommu_kc705_defconfig
openrisc                  or1klitex_defconfig
arm                        keystone_defconfig
powerpc                        cell_defconfig
powerpc                        warp_defconfig
powerpc                    adder875_defconfig
arm                       multi_v4t_defconfig
powerpc                 mpc837x_rdb_defconfig
s390                             allyesconfig
openrisc                 simple_smp_defconfig
arm                          gemini_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 canyonlands_defconfig
powerpc64                           defconfig
arm                  randconfig-c002-20220216
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
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
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220216
arc                  randconfig-r043-20220216
s390                 randconfig-r044-20220216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                         shannon_defconfig
powerpc                     tqm8560_defconfig
mips                           ip27_defconfig
riscv                          rv32_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220216
hexagon              randconfig-r041-20220216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
