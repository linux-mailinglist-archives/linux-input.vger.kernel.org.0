Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15639231FEC
	for <lists+linux-input@lfdr.de>; Wed, 29 Jul 2020 16:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgG2OHu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jul 2020 10:07:50 -0400
Received: from mga01.intel.com ([192.55.52.88]:26804 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgG2OHt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jul 2020 10:07:49 -0400
IronPort-SDR: b0kFp1NNSTbPFCQomgV0V1geHc+Eo7juJeQoZP1UvrR0vMOwXsgjWp544/hmcBkY7YUdKX7ePT
 LsvgnBJ2UVlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="169534402"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="169534402"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 07:07:49 -0700
IronPort-SDR: fo+BzV+biiAkEI28Ki0Ths/d4BlxDeSNNFQ23i3XlkDivMjsthw31aHXAr5b/5/Nb0iLW8dtBj
 5ii0dqLxafyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="328665000"
Received: from lkp-server02.sh.intel.com (HELO 1bde1f275adc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2020 07:07:47 -0700
Received: from kbuild by 1bde1f275adc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k0mkE-00006x-Me; Wed, 29 Jul 2020 14:07:46 +0000
Date:   Wed, 29 Jul 2020 22:06:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 74d905d2d38ad00246e1f22c6ccad7ebb5731839
Message-ID: <5f21827c.PdiGSjISB80ZNGIU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 74d905d2d38ad00246e1f22c6ccad7ebb5731839  Input: atmel_mxt_ts - only read messages in mxt_acquire_irq() when necessary

elapsed time: 722m

configs tested: 79
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
s390                          debug_defconfig
mips                     cu1000-neo_defconfig
mips                        bcm47xx_defconfig
arm                       omap2plus_defconfig
arc                        vdk_hs38_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     mpc512x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
arc                              allyesconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a003-20200728
i386                 randconfig-a004-20200728
i386                 randconfig-a005-20200728
i386                 randconfig-a002-20200728
i386                 randconfig-a006-20200728
i386                 randconfig-a001-20200728
i386                 randconfig-a003-20200729
i386                 randconfig-a004-20200729
i386                 randconfig-a005-20200729
i386                 randconfig-a002-20200729
i386                 randconfig-a006-20200729
i386                 randconfig-a001-20200729
x86_64               randconfig-a014-20200728
x86_64               randconfig-a012-20200728
x86_64               randconfig-a015-20200728
x86_64               randconfig-a016-20200728
x86_64               randconfig-a013-20200728
x86_64               randconfig-a011-20200728
i386                 randconfig-a016-20200728
i386                 randconfig-a012-20200728
i386                 randconfig-a013-20200728
i386                 randconfig-a014-20200728
i386                 randconfig-a011-20200728
i386                 randconfig-a015-20200728
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
