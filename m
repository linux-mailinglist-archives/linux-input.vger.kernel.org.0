Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700A71F4BFD
	for <lists+linux-input@lfdr.de>; Wed, 10 Jun 2020 06:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgFJEBp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Jun 2020 00:01:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:21495 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbgFJEBp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Jun 2020 00:01:45 -0400
IronPort-SDR: 1v613VCgp5zAeV5lGv22KuR7MNyqJ+yuJ8mkAnsNkzYeL/FgLL4l2VFwKlGYBIjDskgSERTPZ4
 78BFhFn8EqLQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 21:01:44 -0700
IronPort-SDR: 6dCOsUL/pk9ol8CuMPge/SW7dmKMtPV0cj1rerzMN8IBJx8GYv83hamiDDLShUWL8XSVeL5IXL
 SO1DkInWeLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,494,1583222400"; 
   d="scan'208";a="260014988"
Received: from lkp-server01.sh.intel.com (HELO 19cb45ee048e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Jun 2020 21:01:43 -0700
Received: from kbuild by 19cb45ee048e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jirvq-00001F-JF; Wed, 10 Jun 2020 04:01:42 +0000
Date:   Wed, 10 Jun 2020 12:01:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 751ad34fbad74c3ed4a9ede24764b4253d4faa84
Message-ID: <5ee05b04.8T6k/yEREtbXqWIz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  for-linus
branch HEAD: 751ad34fbad74c3ed4a9ede24764b4253d4faa84  Input: adi - work around module name confict

elapsed time: 480m

configs tested: 136
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
m68k                         amcore_defconfig
mips                       rbtx49xx_defconfig
um                                  defconfig
sh                     magicpanelr2_defconfig
powerpc                  mpc885_ads_defconfig
mips                           xway_defconfig
arm                       cns3420vb_defconfig
m68k                          sun3x_defconfig
sparc                       sparc32_defconfig
riscv                          rv32_defconfig
arm                           h3600_defconfig
sparc                            allyesconfig
powerpc                    mvme5100_defconfig
openrisc                 simple_smp_defconfig
sh                           se7705_defconfig
mips                     decstation_defconfig
nios2                               defconfig
openrisc                            defconfig
sh                           se7619_defconfig
sh                 kfr2r09-romimage_defconfig
arm                          moxart_defconfig
arc                         haps_hs_defconfig
m68k                            mac_defconfig
arm                        oxnas_v6_defconfig
arm                    vt8500_v6_v7_defconfig
mips                         tb0219_defconfig
m68k                        mvme16x_defconfig
mips                          malta_defconfig
arc                          axs101_defconfig
sh                           se7724_defconfig
arm                       aspeed_g5_defconfig
arm                            dove_defconfig
xtensa                           alldefconfig
arm                         shannon_defconfig
arm                         socfpga_defconfig
sh                   sh7724_generic_defconfig
arm                            qcom_defconfig
sh                             espt_defconfig
powerpc                          allmodconfig
powerpc                     mpc512x_defconfig
i386                              allnoconfig
arm                       omap2plus_defconfig
i386                             alldefconfig
s390                              allnoconfig
parisc                generic-32bit_defconfig
arm                          ep93xx_defconfig
s390                                defconfig
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
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200607
i386                 randconfig-a006-20200607
i386                 randconfig-a002-20200607
i386                 randconfig-a005-20200607
i386                 randconfig-a004-20200607
i386                 randconfig-a003-20200607
i386                 randconfig-a001-20200609
i386                 randconfig-a002-20200609
i386                 randconfig-a006-20200609
i386                 randconfig-a005-20200609
i386                 randconfig-a003-20200609
i386                 randconfig-a004-20200609
i386                 randconfig-a014-20200607
i386                 randconfig-a015-20200607
i386                 randconfig-a011-20200607
i386                 randconfig-a016-20200607
i386                 randconfig-a012-20200607
i386                 randconfig-a013-20200607
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                               allyesconfig
um                               allmodconfig
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
