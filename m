Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D2C4E2F92
	for <lists+linux-input@lfdr.de>; Mon, 21 Mar 2022 19:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240075AbiCUSFs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 14:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351960AbiCUSFr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 14:05:47 -0400
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD112AE0D
        for <linux-input@vger.kernel.org>; Mon, 21 Mar 2022 11:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647885860; x=1679421860;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yvTW9em6oTqQSzM9/o8Pw9oRWm1fbJxOjGqXbc70+3U=;
  b=ldwXfGy28Pv94Zvs1hRxdBt4e2iZJcFlWUHy3NqinVcBvfdSF+i1M7gn
   kQGd+1/caL9+E9baOPiGwnsVwlwX55yBzz31FdRIxeLdhD2RYYARofngg
   h0Ij7TU0PGhVgVjdqAX7GFJ/tvUc2tTvVr5pZPtdrw04dRo3yDWOdyRIh
   65KnvqIuZxUoa1v16DfTxzCqvnCMbXBB9XnvBPGew+TxKC9MkLrssuOU3
   JVLVa+eyFAMHm41X4CIHsJfTbFI+BkcZGD/vOD7Ga4HbsaiYVfE0Q+W7/
   xcya+kwEpk44WgAzchd4oEOstOqIwdEm1LwT4yEa9V/nUWV2tXMbVsxI6
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="318327736"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="318327736"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 11:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="648658036"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Mar 2022 11:04:18 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWMOA-000I2z-6w; Mon, 21 Mar 2022 18:04:18 +0000
Date:   Tue, 22 Mar 2022 02:03:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 a949087c2285c8de4f0f204cab2d4eece9d929a2
Message-ID: <6238bdfd.90sroQbGaXRQu4Jw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: a949087c2285c8de4f0f204cab2d4eece9d929a2  Input: adi - remove redundant variable z

elapsed time: 727m

configs tested: 170
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220321
mips                 randconfig-c004-20220320
i386                          randconfig-c001
arc                 nsimosci_hs_smp_defconfig
mips                           ip32_defconfig
arm                        trizeps4_defconfig
xtensa                  cadence_csp_defconfig
arc                         haps_hs_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                            migor_defconfig
arm                           corgi_defconfig
s390                             allmodconfig
powerpc                        cell_defconfig
arm                        oxnas_v6_defconfig
h8300                     edosk2674_defconfig
mips                           xway_defconfig
parisc64                         alldefconfig
powerpc                 mpc834x_mds_defconfig
arm                          pxa3xx_defconfig
sh                                  defconfig
powerpc                     ep8248e_defconfig
mips                       bmips_be_defconfig
sh                           se7712_defconfig
sh                        dreamcast_defconfig
microblaze                      mmu_defconfig
arm                           sunxi_defconfig
arm                            qcom_defconfig
powerpc                    amigaone_defconfig
powerpc                        warp_defconfig
powerpc                      pcm030_defconfig
powerpc                    sam440ep_defconfig
arm                             pxa_defconfig
nios2                         10m50_defconfig
sh                          rsk7269_defconfig
powerpc64                           defconfig
ia64                                defconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                             allmodconfig
arm                         vf610m4_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
arc                          axs103_defconfig
arc                                 defconfig
m68k                            q40_defconfig
arc                           tb10x_defconfig
sh                          urquell_defconfig
csky                             alldefconfig
arm64                            alldefconfig
xtensa                          iss_defconfig
powerpc                       ppc64_defconfig
arm                            mps2_defconfig
arc                            hsdk_defconfig
m68k                         amcore_defconfig
powerpc                     tqm8548_defconfig
sh                          sdk7780_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                  randconfig-c002-20220321
arm                  randconfig-c002-20220320
ia64                             allmodconfig
ia64                             allyesconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
x86_64               randconfig-a016-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a013-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a015-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a014-20220321
arc                  randconfig-r043-20220320
riscv                randconfig-r042-20220321
s390                 randconfig-r044-20220321
arc                  randconfig-r043-20220321
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220320
arm                  randconfig-c002-20220320
powerpc              randconfig-c003-20220320
riscv                randconfig-c006-20220320
i386                          randconfig-c001
powerpc                      ppc64e_defconfig
mips                      malta_kvm_defconfig
powerpc                          allyesconfig
mips                malta_qemu_32r6_defconfig
mips                     cu1000-neo_defconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
arm                          collie_defconfig
powerpc                  mpc866_ads_defconfig
mips                       rbtx49xx_defconfig
mips                         tb0287_defconfig
arm                       netwinder_defconfig
arm                       cns3420vb_defconfig
riscv                          rv32_defconfig
arm                  colibri_pxa270_defconfig
powerpc               mpc834x_itxgp_defconfig
riscv                             allnoconfig
powerpc                     pseries_defconfig
arm                          imote2_defconfig
arm                          pxa168_defconfig
mips                       lemote2f_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                       ebony_defconfig
arm                      tct_hammer_defconfig
x86_64               randconfig-a006-20220321
x86_64               randconfig-a001-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a002-20220321
i386                 randconfig-a003-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a002-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a006-20220321
riscv                randconfig-r042-20220320
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220321
hexagon              randconfig-r041-20220320
s390                 randconfig-r044-20220320

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
