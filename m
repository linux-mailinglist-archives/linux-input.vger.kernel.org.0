Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005E33ADFBF
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 19:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhFTSB2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Jun 2021 14:01:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:51475 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229694AbhFTSB2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Jun 2021 14:01:28 -0400
IronPort-SDR: E+tHfd/5DGs0N3n+h+/oxv5b/lVoko6RAf5jRbEQhXtFd5OL9iOJXYE07E04x9/qLs9FsE4Wvj
 ppYhmy5Zf1fw==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="193873008"
X-IronPort-AV: E=Sophos;i="5.83,287,1616482800"; 
   d="scan'208";a="193873008"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2021 10:59:14 -0700
IronPort-SDR: 8JXg4YYuXQ+AF5MgMSsoWVUHx60DXZtsOlT0MCWrXmh9npyIFJHRi8Tt/NF/qiT6gi5bW7ueRu
 Lm4NoPVKZ/1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,287,1616482800"; 
   d="scan'208";a="453662771"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2021 10:59:13 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lv1iy-0004F7-CA; Sun, 20 Jun 2021 17:59:12 +0000
Date:   Mon, 21 Jun 2021 01:58:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 cac7100d4c51c04979dacdfe6c9a5e400d3f0a27
Message-ID: <60cf81df.lwGqE9EgBwk/FXkR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: cac7100d4c51c04979dacdfe6c9a5e400d3f0a27  Input: hideep - fix the uninitialized use in hideep_nvm_unlock()

elapsed time: 722m

configs tested: 116
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                         apsh4a3a_defconfig
sparc                       sparc64_defconfig
arm                         mv78xx0_defconfig
sh                            migor_defconfig
powerpc                     akebono_defconfig
powerpc                    klondike_defconfig
arm                        neponset_defconfig
powerpc                        icon_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         at91_dt_defconfig
x86_64                            allnoconfig
sh                              ul2_defconfig
arm                           sunxi_defconfig
arm                          imote2_defconfig
arm                             pxa_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        keystone_defconfig
arm                        trizeps4_defconfig
sh                           se7206_defconfig
arm                            pleb_defconfig
arm                        magician_defconfig
ia64                             allyesconfig
m68k                        stmark2_defconfig
arm                     davinci_all_defconfig
arc                         haps_hs_defconfig
sh                   secureedge5410_defconfig
arm                        mvebu_v5_defconfig
sparc64                          alldefconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     redwood_defconfig
arm                       imx_v6_v7_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc834x_mds_defconfig
mips                        nlm_xlp_defconfig
mips                         db1xxx_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
mips                        nlm_xlr_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210620
i386                 randconfig-a002-20210620
i386                 randconfig-a003-20210620
i386                 randconfig-a006-20210620
i386                 randconfig-a005-20210620
i386                 randconfig-a004-20210620
x86_64               randconfig-a012-20210620
x86_64               randconfig-a016-20210620
x86_64               randconfig-a015-20210620
x86_64               randconfig-a014-20210620
x86_64               randconfig-a013-20210620
x86_64               randconfig-a011-20210620
i386                 randconfig-a011-20210620
i386                 randconfig-a014-20210620
i386                 randconfig-a013-20210620
i386                 randconfig-a015-20210620
i386                 randconfig-a012-20210620
i386                 randconfig-a016-20210620
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210620
x86_64               randconfig-a002-20210620
x86_64               randconfig-a001-20210620
x86_64               randconfig-a005-20210620
x86_64               randconfig-a003-20210620
x86_64               randconfig-a004-20210620
x86_64               randconfig-a006-20210620

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
