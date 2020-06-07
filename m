Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78BB1F094D
	for <lists+linux-input@lfdr.de>; Sun,  7 Jun 2020 04:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgFGCEa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Jun 2020 22:04:30 -0400
Received: from mga01.intel.com ([192.55.52.88]:22189 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728887AbgFGCEa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 6 Jun 2020 22:04:30 -0400
IronPort-SDR: jnTXz7aSji6mrlZcbycn/XMRFNhseDJcT03+bZwDL4NHe67eBVSx8/QdWs+kZLsIU0+O65NciZ
 yauEyVI2tVWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2020 19:04:29 -0700
IronPort-SDR: vDdyLWXX7V6LxTG6Tgkmio4faZvlvWEuRmaMhj30VDzSKxnVHGYEF1b7yR4cahL1rwaE/nyrHm
 Fg93wjHf0wtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,482,1583222400"; 
   d="scan'208";a="348829583"
Received: from lkp-server01.sh.intel.com (HELO 3b764b36c89c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jun 2020 19:04:28 -0700
Received: from kbuild by 3b764b36c89c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jhkfj-00008T-EL; Sun, 07 Jun 2020 02:04:27 +0000
Date:   Sun, 07 Jun 2020 10:03:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 8dd06ef34b6e2f41b29fbf5fc1663780f2524285
Message-ID: <5edc4af4.gopV6rFylwS14P4K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  for-linus
branch HEAD: 8dd06ef34b6e2f41b29fbf5fc1663780f2524285  Merge branch 'next' into for-linus

elapsed time: 486m

configs tested: 105
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
sh                 kfr2r09-romimage_defconfig
arm                       spear13xx_defconfig
arm                        multi_v7_defconfig
mips                   sb1250_swarm_defconfig
sh                      rts7751r2d1_defconfig
arm                          pxa3xx_defconfig
m68k                        mvme147_defconfig
arm                            mps2_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200607
i386                 randconfig-a006-20200607
i386                 randconfig-a002-20200607
i386                 randconfig-a005-20200607
i386                 randconfig-a004-20200607
i386                 randconfig-a003-20200607
i386                 randconfig-a014-20200607
i386                 randconfig-a015-20200607
i386                 randconfig-a011-20200607
i386                 randconfig-a016-20200607
i386                 randconfig-a012-20200607
i386                 randconfig-a013-20200607
x86_64               randconfig-a002-20200607
x86_64               randconfig-a001-20200607
x86_64               randconfig-a006-20200607
x86_64               randconfig-a003-20200607
x86_64               randconfig-a004-20200607
x86_64               randconfig-a005-20200607
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
