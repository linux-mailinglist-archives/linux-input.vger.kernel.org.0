Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBC430301E
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 00:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732714AbhAYX2O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 18:28:14 -0500
Received: from mga11.intel.com ([192.55.52.93]:57993 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732510AbhAYX2K (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 18:28:10 -0500
IronPort-SDR: CCkiBZiM64AcZ5wYmOdLLxreZJwyyn0PyXkGq5FsxUeciq+63VMJYJpziueL7/pzGfUVMY6h1D
 qukkJf/wAlXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="176308486"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="176308486"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:26:52 -0800
IronPort-SDR: zcdQocM0d5uuQ8ZCBJ2A8TZyrnGcZOiZ/vnPNgmx3lwC76dp7uOktOsjr2ra1WzMGyYHyGhDd5
 esrRnU/iNDjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="387584798"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Jan 2021 15:26:51 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4BFy-0000RH-Tj; Mon, 25 Jan 2021 23:26:50 +0000
Date:   Tue, 26 Jan 2021 07:26:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS WITH WARNING
 3bdffa8ffb45c4f217d31a9250e90432ac31b35e
Message-ID: <600f538e.8wFwOCNKUjTl+s1Y%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 3bdffa8ffb45c4f217d31a9250e90432ac31b35e  Input: Add N64 controller driver

Warning reports:

https://lore.kernel.org/linux-input/202101252010.Kygz6WMc-lkp@intel.com

Warning in current branch:

drivers/input/touchscreen/iqs5xx.c:897:6: warning: variable 'error_bl' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- s390-randconfig-r025-20210125
    `-- drivers-input-touchscreen-iqs5xx.c:warning:variable-error_bl-is-used-uninitialized-whenever-if-condition-is-true

elapsed time: 722m

configs tested: 124
configs skipped: 2

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
parisc                           alldefconfig
mips                           jazz_defconfig
powerpc                     taishan_defconfig
xtensa                  audio_kc705_defconfig
arm                         vf610m4_defconfig
arm                        magician_defconfig
arm                             pxa_defconfig
sh                        edosk7760_defconfig
sparc                       sparc64_defconfig
m68k                                defconfig
powerpc                   bluestone_defconfig
arm                  colibri_pxa270_defconfig
mips                         tb0287_defconfig
arm                         palmz72_defconfig
arm                         assabet_defconfig
powerpc                       eiger_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
arm                          pxa3xx_defconfig
arm                          pcm027_defconfig
sh                            shmin_defconfig
powerpc                     mpc512x_defconfig
arm                      integrator_defconfig
h8300                            allyesconfig
powerpc                      cm5200_defconfig
arm                           omap1_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
h8300                       h8s-sim_defconfig
powerpc                      mgcoge_defconfig
arm                       aspeed_g5_defconfig
arm                           h5000_defconfig
sh                     sh7710voipgw_defconfig
arm                          imote2_defconfig
sh                           se7712_defconfig
x86_64                              defconfig
powerpc                      acadia_defconfig
powerpc                      pmac32_defconfig
arm                           viper_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                         hackkit_defconfig
m68k                       m5475evb_defconfig
c6x                        evmc6678_defconfig
ia64                             allyesconfig
powerpc                     tqm8560_defconfig
xtensa                  nommu_kc705_defconfig
mips                  cavium_octeon_defconfig
mips                           ip28_defconfig
arm                     eseries_pxa_defconfig
powerpc                 linkstation_defconfig
powerpc64                        alldefconfig
xtensa                  cadence_csp_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210125
x86_64               randconfig-a002-20210125
x86_64               randconfig-a001-20210125
x86_64               randconfig-a005-20210125
x86_64               randconfig-a006-20210125
x86_64               randconfig-a004-20210125
i386                 randconfig-a001-20210125
i386                 randconfig-a002-20210125
i386                 randconfig-a004-20210125
i386                 randconfig-a006-20210125
i386                 randconfig-a005-20210125
i386                 randconfig-a003-20210125
i386                 randconfig-a013-20210125
i386                 randconfig-a011-20210125
i386                 randconfig-a012-20210125
i386                 randconfig-a015-20210125
i386                 randconfig-a014-20210125
i386                 randconfig-a016-20210125
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20210125
x86_64               randconfig-a012-20210125
x86_64               randconfig-a015-20210125
x86_64               randconfig-a011-20210125
x86_64               randconfig-a013-20210125
x86_64               randconfig-a014-20210125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
