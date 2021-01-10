Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC472F0910
	for <lists+linux-input@lfdr.de>; Sun, 10 Jan 2021 19:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbhAJSfi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Jan 2021 13:35:38 -0500
Received: from mga11.intel.com ([192.55.52.93]:26414 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726447AbhAJSfh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Jan 2021 13:35:37 -0500
IronPort-SDR: 85pt9s4taAiBMoiJdbcmYEfFIpzwC0wyVbGCS94xyn/nvUwmMg3bKJUzW+67SDCkw0hP1J1vmZ
 EB9Y6kz58XiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="174265233"
X-IronPort-AV: E=Sophos;i="5.79,336,1602572400"; 
   d="scan'208";a="174265233"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2021 10:34:57 -0800
IronPort-SDR: K5jaMLlLppw+D7usCv9Ju8webaZa7f0LfyXE1sN2wG9k9WI4JTNB8OxUgdXE1dattBZ8fTusFM
 c7NB1QxBBSTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,336,1602572400"; 
   d="scan'208";a="463934601"
Received: from lkp-server01.sh.intel.com (HELO 412602b27703) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jan 2021 10:34:56 -0800
Received: from kbuild by 412602b27703 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kyfYF-0001dy-L3; Sun, 10 Jan 2021 18:34:55 +0000
Date:   Mon, 11 Jan 2021 02:34:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 2dce6db70c77bbe639f5cd9cc796fb8f2694a7d0
Message-ID: <5ffb4899.dY+6pcqLFUGxPFIQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  for-linus
branch HEAD: 2dce6db70c77bbe639f5cd9cc796fb8f2694a7d0  Input: goodix - add support for Goodix GT9286 chip

elapsed time: 724m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     mpc5200_defconfig
mips                malta_kvm_guest_defconfig
i386                             alldefconfig
arm                            lart_defconfig
x86_64                              defconfig
m68k                          multi_defconfig
um                           x86_64_defconfig
sh                         apsh4a3a_defconfig
mips                        qi_lb60_defconfig
arm                   milbeaut_m10v_defconfig
powerpc64                        alldefconfig
c6x                        evmc6457_defconfig
mips                      bmips_stb_defconfig
m68k                         amcore_defconfig
arm                          ixp4xx_defconfig
arm                          collie_defconfig
mips                           ip28_defconfig
mips                      pic32mzda_defconfig
sh                            titan_defconfig
powerpc                   lite5200b_defconfig
arm                          tango4_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
h8300                            allyesconfig
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
i386                 randconfig-a002-20210110
i386                 randconfig-a005-20210110
i386                 randconfig-a006-20210110
i386                 randconfig-a001-20210110
i386                 randconfig-a003-20210110
i386                 randconfig-a004-20210110
x86_64               randconfig-a015-20210110
x86_64               randconfig-a012-20210110
x86_64               randconfig-a013-20210110
x86_64               randconfig-a016-20210110
x86_64               randconfig-a014-20210110
x86_64               randconfig-a011-20210110
i386                 randconfig-a012-20210110
i386                 randconfig-a011-20210110
i386                 randconfig-a016-20210110
i386                 randconfig-a015-20210110
i386                 randconfig-a013-20210110
i386                 randconfig-a014-20210110
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
x86_64               randconfig-a004-20210110
x86_64               randconfig-a006-20210110
x86_64               randconfig-a001-20210110
x86_64               randconfig-a003-20210110
x86_64               randconfig-a005-20210110
x86_64               randconfig-a002-20210110

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
