Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E916A22A248
	for <lists+linux-input@lfdr.de>; Thu, 23 Jul 2020 00:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgGVWSP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jul 2020 18:18:15 -0400
Received: from mga05.intel.com ([192.55.52.43]:27347 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726447AbgGVWSP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jul 2020 18:18:15 -0400
IronPort-SDR: SK6Tg6oheoViNc5AKY5YXbPIP6W5ryKrpF4FVTDbiVtrldIaTLLUxTmSXZ8ummAEXrWl4zVojp
 hihcsYEkLUhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="235303001"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="235303001"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 15:18:14 -0700
IronPort-SDR: KnKm+WTPEdFK+qQ+6phXewcaF+f10Q5NHPhUUs/NgHwDgH4Sjt3EB1rZhWYipXlyORL+5PS3Nq
 Ej7m7DmbbrNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="462619623"
Received: from lkp-server01.sh.intel.com (HELO 7a9a14fb1d52) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Jul 2020 15:18:13 -0700
Received: from kbuild by 7a9a14fb1d52 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jyN40-000083-G1; Wed, 22 Jul 2020 22:18:12 +0000
Date:   Thu, 23 Jul 2020 06:17:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 37bd9e803daea816f2dc2c8f6dc264097eb3ebd2
Message-ID: <5f18baed.rBFVGUsqBw/bi2m4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 37bd9e803daea816f2dc2c8f6dc264097eb3ebd2  Input: ati_remote2 - add missing newlines when printing module parameters

elapsed time: 993m

configs tested: 110
configs skipped: 3

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
sh                               alldefconfig
mips                         bigsur_defconfig
arm                           sama5_defconfig
arm                           omap1_defconfig
mips                            e55_defconfig
c6x                         dsk6455_defconfig
m68k                         amcore_defconfig
arm                          simpad_defconfig
openrisc                         allyesconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
arm                      footbridge_defconfig
s390                             alldefconfig
c6x                               allnoconfig
powerpc                       ppc64_defconfig
s390                          debug_defconfig
arm                          pxa3xx_defconfig
m68k                        m5407c3_defconfig
sh                          sdk7780_defconfig
arm                           h5000_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
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
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200719
i386                 randconfig-a006-20200719
i386                 randconfig-a002-20200719
i386                 randconfig-a005-20200719
i386                 randconfig-a003-20200719
i386                 randconfig-a004-20200719
i386                 randconfig-a015-20200719
i386                 randconfig-a011-20200719
i386                 randconfig-a016-20200719
i386                 randconfig-a012-20200719
i386                 randconfig-a013-20200719
i386                 randconfig-a014-20200719
x86_64               randconfig-a005-20200719
x86_64               randconfig-a002-20200719
x86_64               randconfig-a006-20200719
x86_64               randconfig-a001-20200719
x86_64               randconfig-a003-20200719
x86_64               randconfig-a004-20200719
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
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
