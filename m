Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6762FF908
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 00:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbhAUXoe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 18:44:34 -0500
Received: from mga05.intel.com ([192.55.52.43]:49870 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbhAUXod (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 18:44:33 -0500
IronPort-SDR: 5oDW5Q3UEMeMHsgRRpXtyhCyZ6cH4g1qPJ/MhRwQpk2aZH9DFIZOaAcH31mDZ8nAAp/qKc6u8A
 64ShLVgkQmRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="264182882"
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; 
   d="scan'208";a="264182882"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 15:43:51 -0800
IronPort-SDR: U0S42Wx07yl1sWc9vsJ/CEA6XyLHHDekux8m8GOcroEn+Km93J83HC7OxbfE39hBSGEVdduHOY
 hqg8dJmyr+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; 
   d="scan'208";a="570901783"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2021 15:43:49 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l2jcC-0006mM-Of; Thu, 21 Jan 2021 23:43:48 +0000
Date:   Fri, 22 Jan 2021 07:43:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 6965eece2a89c3f1d00881c6052ee1e987870c08
Message-ID: <600a1199.n84/9kv7ySzlsgel%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 6965eece2a89c3f1d00881c6052ee1e987870c08  Input: ads7846 - convert to one message

elapsed time: 730m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
openrisc                         alldefconfig
arm                            lart_defconfig
arm                            pleb_defconfig
arm                         assabet_defconfig
sh                           se7619_defconfig
arm                        trizeps4_defconfig
arm                       aspeed_g5_defconfig
powerpc                       holly_defconfig
powerpc                 mpc836x_mds_defconfig
h8300                     edosk2674_defconfig
arc                        vdk_hs38_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        keystone_defconfig
ia64                         bigsur_defconfig
arc                          axs101_defconfig
x86_64                           alldefconfig
mips                          ath79_defconfig
sh                          lboxre2_defconfig
powerpc                       maple_defconfig
mips                           xway_defconfig
arc                            hsdk_defconfig
sh                             shx3_defconfig
h8300                               defconfig
arm                           corgi_defconfig
powerpc                    adder875_defconfig
powerpc                     powernv_defconfig
powerpc                  storcenter_defconfig
arm                           sunxi_defconfig
arm                         cm_x300_defconfig
mips                           ip27_defconfig
m68k                         amcore_defconfig
powerpc                     sequoia_defconfig
mips                          ath25_defconfig
arm                         orion5x_defconfig
sh                          rsk7264_defconfig
powerpc                      pasemi_defconfig
sh                          kfr2r09_defconfig
powerpc                    socrates_defconfig
sh                          r7785rp_defconfig
arm                         socfpga_defconfig
m68k                       m5208evb_defconfig
parisc                generic-32bit_defconfig
arm                          pxa910_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                        edosk7760_defconfig
m68k                          atari_defconfig
arm                        cerfcube_defconfig
arm                          ixp4xx_defconfig
powerpc                     kmeter1_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                             allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210121
x86_64               randconfig-a003-20210121
x86_64               randconfig-a001-20210121
x86_64               randconfig-a005-20210121
x86_64               randconfig-a006-20210121
x86_64               randconfig-a004-20210121
i386                 randconfig-a001-20210121
i386                 randconfig-a002-20210121
i386                 randconfig-a004-20210121
i386                 randconfig-a003-20210121
i386                 randconfig-a006-20210121
i386                 randconfig-a005-20210121
i386                 randconfig-a013-20210121
i386                 randconfig-a011-20210121
i386                 randconfig-a012-20210121
i386                 randconfig-a014-20210121
i386                 randconfig-a015-20210121
i386                 randconfig-a016-20210121
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
