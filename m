Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6031D470783
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 18:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241876AbhLJRly (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Dec 2021 12:41:54 -0500
Received: from mga14.intel.com ([192.55.52.115]:6343 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244691AbhLJRlv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Dec 2021 12:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639157896; x=1670693896;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yuRYuxoASft0ytduOZa91j19alJhfjqeMaD9ETgOI0c=;
  b=DUu4oqWxlIsJxR9Onk0yFtTbnRa2URcGBv1o+xzm+BHD2jnk6Sb2qfIh
   iyeRF3Y3i85OJ3FchgcM4kX9rwi41JPsFmpEoTg3OLOJCBxAtFAmXorSE
   2ZJZMdjxxvjhvjHkQZ+ugIeOTJLkL4A6liuINfudDWc7jqYrphzvS6PDv
   alUyuHBHq8TaHeBNoZGDt0+xq/9Npr24tdmS4+Gb4NYKQLnnj6wCcvvUW
   1fepoIW6gCh7uJAJwfQ9a2IH7baS2rltc1Q5hvfk7PY0la3jeWAPYYTH5
   wyF5DiUYUStw4bXAmzctzeDYMO1visVCZtJRoThHeoN/pnkQadow7P7Sj
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238620974"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="238620974"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 09:38:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="504012120"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Dec 2021 09:38:13 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mvjqW-0003S2-G1; Fri, 10 Dec 2021 17:38:12 +0000
Date:   Sat, 11 Dec 2021 01:37:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 3fd6e12a401ead0345e4b7e6a73e117f0713e0c1
Message-ID: <61b3904d.sbZhuhCMXTduCe/V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 3fd6e12a401ead0345e4b7e6a73e117f0713e0c1  Input: goodix - fix memory leak in goodix_firmware_upload

elapsed time: 720m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211210
sparc                            allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arm                     davinci_all_defconfig
arc                        vdk_hs38_defconfig
powerpc                     stx_gp3_defconfig
arm                           sunxi_defconfig
sh                          rsk7269_defconfig
arm                         lubbock_defconfig
powerpc                         wii_defconfig
sh                          lboxre2_defconfig
powerpc                      chrp32_defconfig
powerpc                     pq2fads_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           u8500_defconfig
xtensa                  cadence_csp_defconfig
parisc                           alldefconfig
sh                   secureedge5410_defconfig
sh                          polaris_defconfig
arm                           corgi_defconfig
arm                         assabet_defconfig
sh                        sh7785lcr_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                       h8s-sim_defconfig
i386                             alldefconfig
arc                    vdk_hs38_smp_defconfig
mips                    maltaup_xpa_defconfig
mips                         cobalt_defconfig
mips                        bcm63xx_defconfig
sh                         ap325rxa_defconfig
powerpc                   microwatt_defconfig
arm                      integrator_defconfig
arm                         orion5x_defconfig
x86_64                           alldefconfig
powerpc                      ppc6xx_defconfig
xtensa                  audio_kc705_defconfig
ia64                         bigsur_defconfig
sh                           se7712_defconfig
arm                             rpc_defconfig
sparc                       sparc32_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     mpc5200_defconfig
sh                          rsk7203_defconfig
arm                             ezx_defconfig
arm                  colibri_pxa270_defconfig
m68k                        m5272c3_defconfig
sh                          rsk7201_defconfig
powerpc                      pcm030_defconfig
arm                        keystone_defconfig
powerpc                 canyonlands_defconfig
xtensa                              defconfig
powerpc                     ppa8548_defconfig
alpha                            alldefconfig
sh                             sh03_defconfig
sparc                               defconfig
sh                               j2_defconfig
powerpc                 mpc8560_ads_defconfig
um                             i386_defconfig
h8300                            alldefconfig
m68k                        stmark2_defconfig
powerpc                  iss476-smp_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     ksi8560_defconfig
mips                         db1xxx_defconfig
powerpc                     taishan_defconfig
mips                         mpc30x_defconfig
sh                             shx3_defconfig
sh                             espt_defconfig
xtensa                    smp_lx200_defconfig
arc                        nsim_700_defconfig
h8300                               defconfig
powerpc                     tqm8541_defconfig
arm                          pxa3xx_defconfig
powerpc                    mvme5100_defconfig
riscv                            alldefconfig
m68k                       m5275evb_defconfig
xtensa                          iss_defconfig
powerpc                   currituck_defconfig
arm                          badge4_defconfig
parisc                           allyesconfig
arm                  randconfig-c002-20211210
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211210
x86_64               randconfig-a005-20211210
x86_64               randconfig-a001-20211210
x86_64               randconfig-a002-20211210
x86_64               randconfig-a003-20211210
x86_64               randconfig-a004-20211210
i386                 randconfig-a001-20211210
i386                 randconfig-a002-20211210
i386                 randconfig-a005-20211210
i386                 randconfig-a003-20211210
i386                 randconfig-a006-20211210
i386                 randconfig-a004-20211210
arc                  randconfig-r043-20211210
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211210
x86_64               randconfig-c007-20211210
riscv                randconfig-c006-20211210
mips                 randconfig-c004-20211210
i386                 randconfig-c001-20211210
s390                 randconfig-c005-20211210
powerpc              randconfig-c003-20211210
x86_64               randconfig-a011-20211210
x86_64               randconfig-a012-20211210
x86_64               randconfig-a014-20211210
x86_64               randconfig-a013-20211210
x86_64               randconfig-a016-20211210
x86_64               randconfig-a015-20211210
i386                 randconfig-a013-20211210
i386                 randconfig-a011-20211210
i386                 randconfig-a016-20211210
i386                 randconfig-a014-20211210
i386                 randconfig-a015-20211210
i386                 randconfig-a012-20211210
hexagon              randconfig-r045-20211210
riscv                randconfig-r042-20211210
s390                 randconfig-r044-20211210
hexagon              randconfig-r041-20211210

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
