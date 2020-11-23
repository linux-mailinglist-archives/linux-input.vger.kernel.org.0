Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96252C1337
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 19:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730345AbgKWSci (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 13:32:38 -0500
Received: from mga09.intel.com ([134.134.136.24]:52322 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730117AbgKWSci (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 13:32:38 -0500
IronPort-SDR: EDdLvQze2h13gN76ap+6L5ckOuj7G/Dj3NA3pjz/l7IYeaNQT9nKDvoNAxIikJtPpM6C9YWLSY
 LSaWMVYTnysA==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="171976650"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="171976650"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 10:32:36 -0800
IronPort-SDR: CjyIWrmdRJdC9AtlOd9BLSsOy+XYfOK/l6rm/fUX/RB216AR9q+QmAhwiJVeNJNCJCB1/NDPGP
 FBe+SOGPLDbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="312977978"
Received: from lkp-server01.sh.intel.com (HELO 1138cb5768e3) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2020 10:32:35 -0800
Received: from kbuild by 1138cb5768e3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1khGde-00009V-R2; Mon, 23 Nov 2020 18:32:34 +0000
Date:   Tue, 24 Nov 2020 02:31:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 f7bda6662fd4f39113b4dee00f7ded44f846b7f4
Message-ID: <5fbc0010.6Yi13Kb2aqU0wkUE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: f7bda6662fd4f39113b4dee00f7ded44f846b7f4  Input: libps2 - fix fall-through warnings for Clang

elapsed time: 722m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                         virt_defconfig
sh                          r7780mp_defconfig
arm                       netwinder_defconfig
xtensa                              defconfig
arm                            u300_defconfig
arm                         nhk8815_defconfig
sh                        apsh4ad0a_defconfig
xtensa                          iss_defconfig
powerpc                     skiroot_defconfig
powerpc                      makalu_defconfig
powerpc                        icon_defconfig
x86_64                           allyesconfig
arm                         cm_x300_defconfig
arm64                            alldefconfig
mips                         tb0226_defconfig
powerpc                  iss476-smp_defconfig
c6x                        evmc6457_defconfig
sh                          kfr2r09_defconfig
um                             i386_defconfig
arc                            hsdk_defconfig
sh                           se7724_defconfig
csky                             alldefconfig
arm                            dove_defconfig
m68k                           sun3_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      ep88xc_defconfig
mips                         bigsur_defconfig
powerpc                     pseries_defconfig
arm                           tegra_defconfig
powerpc                     kmeter1_defconfig
mips                 decstation_r4k_defconfig
c6x                         dsk6455_defconfig
mips                        qi_lb60_defconfig
arc                     nsimosci_hs_defconfig
riscv                            allmodconfig
sh                 kfr2r09-romimage_defconfig
riscv                            alldefconfig
m68k                          sun3x_defconfig
mips                          rb532_defconfig
arm                         s3c2410_defconfig
arm                       mainstone_defconfig
sparc64                          alldefconfig
arm                         assabet_defconfig
arm                  colibri_pxa270_defconfig
powerpc                   motionpro_defconfig
powerpc                      chrp32_defconfig
sh                          rsk7269_defconfig
mips                malta_qemu_32r6_defconfig
arm                             rpc_defconfig
powerpc                      arches_defconfig
powerpc                   currituck_defconfig
arm                          pxa168_defconfig
mips                        vocore2_defconfig
powerpc                     pq2fads_defconfig
powerpc                    socrates_defconfig
mips                         db1xxx_defconfig
arc                              alldefconfig
arm                            zeus_defconfig
i386                             alldefconfig
sh                          rsk7264_defconfig
csky                                defconfig
m68k                        m5272c3_defconfig
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
i386                 randconfig-a004-20201123
i386                 randconfig-a003-20201123
i386                 randconfig-a002-20201123
i386                 randconfig-a001-20201123
i386                 randconfig-a005-20201123
i386                 randconfig-a006-20201123
x86_64               randconfig-a015-20201123
x86_64               randconfig-a011-20201123
x86_64               randconfig-a014-20201123
x86_64               randconfig-a016-20201123
x86_64               randconfig-a012-20201123
x86_64               randconfig-a013-20201123
i386                 randconfig-a016-20201123
i386                 randconfig-a014-20201123
i386                 randconfig-a015-20201123
i386                 randconfig-a012-20201123
i386                 randconfig-a013-20201123
i386                 randconfig-a011-20201123
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201123
x86_64               randconfig-a004-20201123
x86_64               randconfig-a002-20201123
x86_64               randconfig-a001-20201123
x86_64               randconfig-a006-20201123
x86_64               randconfig-a005-20201123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
