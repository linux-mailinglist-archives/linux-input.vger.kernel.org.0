Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD164DA327
	for <lists+linux-input@lfdr.de>; Tue, 15 Mar 2022 20:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237169AbiCOTRD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Mar 2022 15:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbiCOTRD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Mar 2022 15:17:03 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A6DF31
        for <linux-input@vger.kernel.org>; Tue, 15 Mar 2022 12:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647371751; x=1678907751;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nqg7o+Zr2gqMdCWXYez6bvEGSU/OAJi7FMoQbnnjGao=;
  b=QjOk+xQMrkJ1uF1NUX9Mh9q3f9QhmYzbEaz8clpZGNYTu7hvypOPNSND
   xO0yxQh0Iz+wwxBCSGRUPGZY99aNAfmR15cTVcUF3tMbn5t4kLJe/jwfW
   KfqT2Wnjp/GKexmx5rsyAQa7KkI2oF0BDj+msTPJS6GcyisaHffJvyjb3
   VOIWgVqGEcb5NmpcomYuKsxsXGH3dHSn4zy//oC6aUaSj9zzIA7xTb2gc
   YsrXXRD4UrFb6TGNBwHb6N96MmLFoND3b/EbFlDwf++Y+j5ShozBWKRuw
   fPZkVnD99mOx81pkHVXjL0zZ0KKaxai352KNt1O7f9Vnq1s0c38CJEng/
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="243856886"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="243856886"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 12:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="540577526"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Mar 2022 12:15:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nUCdz-000BOm-56; Tue, 15 Mar 2022 19:15:43 +0000
Date:   Wed, 16 Mar 2022 03:14:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 5600f6986628dde8881734090588474f54a540a8
Message-ID: <6230e59d.N7ykxLx6tdmTjSv2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 5600f6986628dde8881734090588474f54a540a8  Input: aiptek - properly check endpoint type

elapsed time: 724m

configs tested: 158
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220314
mips                 randconfig-c004-20220314
powerpc              randconfig-c003-20220313
i386                          randconfig-c001
riscv                            allyesconfig
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
mips                             allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
parisc                           allyesconfig
xtensa                           allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
powerpc                      pasemi_defconfig
arm                       imx_v6_v7_defconfig
x86_64                              defconfig
xtensa                              defconfig
arm                         nhk8815_defconfig
powerpc                 mpc834x_itx_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
mips                        vocore2_defconfig
arm                             pxa_defconfig
sh                             espt_defconfig
powerpc64                        alldefconfig
sh                         apsh4a3a_defconfig
sh                           se7780_defconfig
arc                          axs101_defconfig
openrisc                  or1klitex_defconfig
arm                            xcep_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            migor_defconfig
powerpc                       ppc64_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7705_defconfig
powerpc                      bamboo_defconfig
csky                             alldefconfig
parisc                generic-32bit_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                  storcenter_defconfig
arm                         vf610m4_defconfig
s390                       zfcpdump_defconfig
sh                          r7780mp_defconfig
powerpc                     tqm8548_defconfig
um                               alldefconfig
mips                           jazz_defconfig
sh                   secureedge5410_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
arm                        shmobile_defconfig
arm                          pxa910_defconfig
arm                        spear6xx_defconfig
m68k                        mvme147_defconfig
sh                             shx3_defconfig
parisc64                            defconfig
sh                         microdev_defconfig
sh                     sh7710voipgw_defconfig
arm                           stm32_defconfig
arm                            mps2_defconfig
sh                          lboxre2_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                  decstation_64_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                               defconfig
nds32                             allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a006-20220314
x86_64               randconfig-a001-20220314
arc                  randconfig-r043-20220313
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
arc                  randconfig-r043-20220314
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20220313
arm                  randconfig-c002-20220313
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220313
riscv                randconfig-c006-20220313
mips                 randconfig-c004-20220313
i386                          randconfig-c001
mips                           mtx1_defconfig
powerpc                          allyesconfig
powerpc               mpc834x_itxgp_defconfig
mips                     cu1000-neo_defconfig
arm                           omap1_defconfig
mips                          ath25_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
