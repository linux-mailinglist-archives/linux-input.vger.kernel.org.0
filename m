Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791F847B5D8
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 23:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhLTWV1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 17:21:27 -0500
Received: from mga06.intel.com ([134.134.136.31]:44608 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230394AbhLTWV1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 17:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640038887; x=1671574887;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=05dL2nSr+cLrBHqoNQSTvOWK+4xnMlVhwoHNGOt5rNw=;
  b=g3PQ+hMxqqKNqbfQtoyODWAzBiDx75LcvdDqd2zg2pRAUs8ASHdCKp4U
   r/uBqaJftTXkQrIDgX7KLVYcW047W8OPdH2+hvRGMG+6wR0QpVKWqNPzY
   gxCeq+D8p8k9HpT61sLRrelQbMDo03V6QQY7qvxHlWi40SpBVnaH1GFx5
   nx0TJuU6P7QjgrKXQqfAGrCwh/2fphog8XOOVcegSpRbcUn9SbL51CpKi
   3ObPaTedqo0NfhKzcUeuCaZKqRGMi25MgUfcSwCOftRz+OeSY8nb4ppII
   k6WJPwOWCLSbWdGGRT2tquiVY53/NJPhmzpaBe6eCEah01VkmG1UER9PY
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="301049273"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="301049273"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 14:21:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="586458278"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Dec 2021 14:21:25 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzR24-0008Jw-SO; Mon, 20 Dec 2021 22:21:24 +0000
Date:   Tue, 21 Dec 2021 06:20:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 4ebfee2bbc1a9c343dd50565ba5ae249fac32267
Message-ID: <61c101b3.YXqHzMWBGki0mvzo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 4ebfee2bbc1a9c343dd50565ba5ae249fac32267  Input: elants_i2c - do not check Remark ID on eKTH3900/eKTH5312

elapsed time: 724m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
m68k                       m5208evb_defconfig
mips                         bigsur_defconfig
arm                        magician_defconfig
powerpc                mpc7448_hpc2_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                       maple_defconfig
arm                       imx_v4_v5_defconfig
sh                           se7712_defconfig
arm                        vexpress_defconfig
mips                       bmips_be_defconfig
mips                             allmodconfig
powerpc                      chrp32_defconfig
arm                         axm55xx_defconfig
arm                         lubbock_defconfig
arm                           tegra_defconfig
sh                            hp6xx_defconfig
openrisc                  or1klitex_defconfig
powerpc                     tqm5200_defconfig
arm                           omap1_defconfig
arm                         hackkit_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                             sh03_defconfig
parisc                generic-64bit_defconfig
powerpc                       eiger_defconfig
mips                      fuloong2e_defconfig
mips                     cu1000-neo_defconfig
arm                        mvebu_v5_defconfig
powerpc                        warp_defconfig
sh                           se7206_defconfig
sh                          landisk_defconfig
arm                        clps711x_defconfig
powerpc                   lite5200b_defconfig
sh                         ecovec24_defconfig
powerpc                      makalu_defconfig
sparc                       sparc32_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a006-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a002-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a015-20211219
x86_64               randconfig-a005-20211220
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig

clang tested configs:
x86_64               randconfig-a013-20211220
x86_64               randconfig-a015-20211220
x86_64               randconfig-a014-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a016-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a014-20211220
i386                 randconfig-a016-20211220
i386                 randconfig-a015-20211220
i386                 randconfig-a013-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220
s390                 randconfig-r044-20211220
hexagon              randconfig-r041-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
