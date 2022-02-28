Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5F894C7792
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 19:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240584AbiB1SYg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 13:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240495AbiB1SYU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 13:24:20 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE9E60CD1
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 10:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646071458; x=1677607458;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PvgykQx1KIqKH5MZv6dUyQYmlrl2X1X7viCwbRZmVY4=;
  b=ZklmPgc+WBl5lR844j4P7l+bEDwVM9UWMmBQulFNWDcGIdoQ36yj6lMi
   zknHtlQUzA6muDZOSKgLgaDNa50QuunIthvIkQXQdJkpxVhjScsuupSwq
   6whahquUOD6BdJF6zwnXSTbaUpyvWGyUF/Z+W8PVEjHLKBXOkFsFC/LBr
   S5cs3/W7BtbYK6HqXdCGX2thmn9WPGcT3j/hFrqteTvgxoecqbTWNzdlQ
   9lHUCaQlWJAQhGNe091yoUfxcTEbdbv/Fiscz8K26gwf97f/by8N9zTJP
   +4mUYg0CVyWV5NGoOCcmYoGMC5SZrSHZfzRmiDvUsGxlQjUmSZFmvfkj6
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="313666864"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="313666864"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 10:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="510184695"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Feb 2022 10:04:16 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOkNb-0007f6-Ji; Mon, 28 Feb 2022 18:04:15 +0000
Date:   Tue, 01 Mar 2022 02:03:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 ba115adf61b36b8c167126425a62b0efc23f72c0
Message-ID: <621d0e81.+RwIJA0i2sMUJS7t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: ba115adf61b36b8c167126425a62b0efc23f72c0  Input: samsung-keypad - properly state IOMEM dependency

elapsed time: 727m

configs tested: 202
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220228
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
mips                             allyesconfig
sparc                            allyesconfig
arm                            lart_defconfig
arm                         assabet_defconfig
arm                          simpad_defconfig
sh                           se7780_defconfig
powerpc                    sam440ep_defconfig
mips                           xway_defconfig
sh                        sh7785lcr_defconfig
arm                          lpd270_defconfig
sh                         ecovec24_defconfig
arm                        keystone_defconfig
powerpc                      bamboo_defconfig
parisc                generic-32bit_defconfig
powerpc                      pcm030_defconfig
m68k                       m5208evb_defconfig
openrisc                    or1ksim_defconfig
arm                        trizeps4_defconfig
arc                         haps_hs_defconfig
powerpc                      cm5200_defconfig
arc                        nsim_700_defconfig
xtensa                           alldefconfig
arm                       aspeed_g5_defconfig
sparc                       sparc64_defconfig
powerpc                    amigaone_defconfig
powerpc                     sequoia_defconfig
alpha                               defconfig
sh                          rsk7264_defconfig
openrisc                 simple_smp_defconfig
arc                     haps_hs_smp_defconfig
arm                         lpc18xx_defconfig
sh                           sh2007_defconfig
arc                     nsimosci_hs_defconfig
riscv                    nommu_k210_defconfig
openrisc                         alldefconfig
sh                   rts7751r2dplus_defconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
arm                        clps711x_defconfig
sh                 kfr2r09-romimage_defconfig
um                                  defconfig
powerpc                       maple_defconfig
powerpc                   currituck_defconfig
m68k                             allyesconfig
mips                      fuloong2e_defconfig
mips                           ci20_defconfig
powerpc                    adder875_defconfig
sh                          lboxre2_defconfig
sh                         microdev_defconfig
xtensa                          iss_defconfig
arm                      integrator_defconfig
m68k                                defconfig
powerpc                   motionpro_defconfig
sh                               alldefconfig
sh                      rts7751r2d1_defconfig
sh                          polaris_defconfig
sh                             sh03_defconfig
xtensa                    smp_lx200_defconfig
mips                            ar7_defconfig
sh                             espt_defconfig
sh                           se7705_defconfig
arm                           h3600_defconfig
m68k                       m5249evb_defconfig
sh                           se7206_defconfig
arc                        vdk_hs38_defconfig
nds32                               defconfig
arm                             ezx_defconfig
s390                       zfcpdump_defconfig
powerpc                      mgcoge_defconfig
arm                            pleb_defconfig
arm                        multi_v7_defconfig
powerpc                         ps3_defconfig
arm                        realview_defconfig
arm                          iop32x_defconfig
arc                          axs101_defconfig
powerpc                      chrp32_defconfig
m68k                         amcore_defconfig
powerpc                     taishan_defconfig
sh                     sh7710voipgw_defconfig
sh                          urquell_defconfig
m68k                        mvme16x_defconfig
powerpc                     rainier_defconfig
arm                          pxa910_defconfig
arm                  randconfig-c002-20220228
arm                  randconfig-c002-20220227
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a011-20220228
x86_64               randconfig-a015-20220228
x86_64               randconfig-a014-20220228
x86_64               randconfig-a013-20220228
x86_64               randconfig-a016-20220228
x86_64               randconfig-a012-20220228
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                 randconfig-a016-20220228
i386                 randconfig-a012-20220228
i386                 randconfig-a015-20220228
i386                 randconfig-a011-20220228
i386                 randconfig-a013-20220228
i386                 randconfig-a014-20220228
s390                 randconfig-r044-20220228
arc                  randconfig-r043-20220228
arc                  randconfig-r043-20220227
riscv                randconfig-r042-20220228
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220227
x86_64                        randconfig-c007
arm                  randconfig-c002-20220227
mips                 randconfig-c004-20220227
s390                 randconfig-c005-20220227
i386                          randconfig-c001
riscv                randconfig-c006-20220227
arm                          imote2_defconfig
riscv                            alldefconfig
mips                        qi_lb60_defconfig
mips                          rm200_defconfig
hexagon                          alldefconfig
mips                   sb1250_swarm_defconfig
mips                      bmips_stb_defconfig
arm                        magician_defconfig
powerpc                       ebony_defconfig
powerpc                      ppc44x_defconfig
riscv                    nommu_virt_defconfig
powerpc                     ksi8560_defconfig
powerpc                        icon_defconfig
powerpc                   lite5200b_defconfig
x86_64               randconfig-a003-20220228
x86_64               randconfig-a005-20220228
x86_64               randconfig-a002-20220228
x86_64               randconfig-a006-20220228
x86_64               randconfig-a001-20220228
x86_64               randconfig-a004-20220228
i386                 randconfig-a002-20220228
i386                 randconfig-a001-20220228
i386                 randconfig-a005-20220228
i386                 randconfig-a003-20220228
i386                 randconfig-a006-20220228
i386                 randconfig-a004-20220228
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220228
hexagon              randconfig-r041-20220228
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
riscv                randconfig-r042-20220227
s390                 randconfig-r044-20220227

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
