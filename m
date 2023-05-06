Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E706F8FC8
	for <lists+linux-input@lfdr.de>; Sat,  6 May 2023 09:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjEFHRK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 May 2023 03:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjEFHRJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 May 2023 03:17:09 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171A7618C
        for <linux-input@vger.kernel.org>; Sat,  6 May 2023 00:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683357427; x=1714893427;
  h=date:from:to:cc:subject:message-id;
  bh=BlRGPb/b+7Viw3u+/FC6ec5iCVpRpj96I/0SmFh1KGI=;
  b=FMpYknusUa6o7C9FsQ5Cv8Yy49f1njI2eAjV39NVtmgLXkGbtBXK4eAP
   EQ7fdPm+IV3ieYf6PIwm0fJIXHt8H4l5Txldm/d9hM1ta2MSzHIFgZ9xj
   ti5S/loNzJcvvXbmsX1Oj5h27wEfaBkY69LWR/uMd24CjZ1V5QNbgvyrl
   zXFaD9VYgI42xqrZ/HYy6u0uFLHut8jkcHXfF7a5tm8uW/tJ3sxPWuDtq
   Ac6IfYDeRGBSd/ffLFNUGbqw/ZYfoBX27PtrPhG1nsF16bBp6qlq6xV0h
   e6ckQ/TOH19PF0AU+oAOF2Rd7AXVafGYVyL+CmeZJmDR9ByyCKJT8+py+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="351508847"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="351508847"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 00:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="767420686"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="767420686"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 May 2023 00:17:05 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pvCAC-000020-2N;
        Sat, 06 May 2023 07:17:04 +0000
Date:   Sat, 06 May 2023 15:16:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 5672bd308ef23b81eb40dd2963f925fd671a66c2
Message-ID: <20230506071630.fVNW2%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 5672bd308ef23b81eb40dd2963f925fd671a66c2  Input: edt-ft5x06 - add delay after waking up

elapsed time: 722m

configs tested: 237
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230502   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230430   gcc  
alpha                randconfig-r003-20230504   gcc  
alpha                randconfig-r033-20230430   gcc  
alpha                randconfig-r035-20230505   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230502   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230504   gcc  
arc                  randconfig-r006-20230501   gcc  
arc                  randconfig-r024-20230506   gcc  
arc                  randconfig-r033-20230501   gcc  
arc                  randconfig-r034-20230501   gcc  
arc                  randconfig-r035-20230501   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arc                  randconfig-r043-20230502   gcc  
arc                  randconfig-r043-20230503   gcc  
arc                  randconfig-r043-20230504   gcc  
arc                  randconfig-r043-20230505   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230501   gcc  
arm                  randconfig-r015-20230430   gcc  
arm                  randconfig-r023-20230430   gcc  
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm                  randconfig-r046-20230502   clang
arm                  randconfig-r046-20230503   gcc  
arm                  randconfig-r046-20230504   clang
arm                  randconfig-r046-20230505   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230505   gcc  
arm64                randconfig-r004-20230504   clang
csky         buildonly-randconfig-r001-20230505   gcc  
csky         buildonly-randconfig-r005-20230505   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230502   gcc  
csky                 randconfig-r025-20230506   gcc  
csky                 randconfig-r026-20230506   gcc  
csky                 randconfig-r031-20230430   gcc  
csky                 randconfig-r031-20230501   gcc  
csky                 randconfig-r035-20230430   gcc  
csky                 randconfig-r036-20230505   gcc  
hexagon              randconfig-r002-20230504   clang
hexagon              randconfig-r005-20230504   clang
hexagon              randconfig-r016-20230430   clang
hexagon              randconfig-r035-20230430   clang
hexagon              randconfig-r041-20230430   clang
hexagon              randconfig-r041-20230501   clang
hexagon              randconfig-r041-20230502   clang
hexagon              randconfig-r041-20230503   clang
hexagon              randconfig-r041-20230504   clang
hexagon              randconfig-r041-20230505   clang
hexagon              randconfig-r045-20230430   clang
hexagon              randconfig-r045-20230501   clang
hexagon              randconfig-r045-20230502   clang
hexagon              randconfig-r045-20230503   clang
hexagon              randconfig-r045-20230504   clang
hexagon              randconfig-r045-20230505   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230501   gcc  
i386                          randconfig-a001   gcc  
i386                 randconfig-a002-20230501   gcc  
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230501   gcc  
i386                          randconfig-a003   gcc  
i386                 randconfig-a004-20230501   gcc  
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230501   gcc  
i386                          randconfig-a005   gcc  
i386                 randconfig-a006-20230501   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230501   clang
i386                 randconfig-a012-20230501   clang
i386                 randconfig-a013-20230501   clang
i386                 randconfig-a014-20230501   clang
i386                 randconfig-a015-20230501   clang
i386                 randconfig-a016-20230501   clang
i386                 randconfig-r013-20230501   clang
i386                 randconfig-r016-20230501   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230501   gcc  
ia64                 randconfig-r004-20230505   gcc  
ia64                 randconfig-r011-20230430   gcc  
ia64                 randconfig-r021-20230501   gcc  
ia64                 randconfig-r023-20230506   gcc  
ia64                 randconfig-r025-20230430   gcc  
ia64                 randconfig-r032-20230501   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230501   gcc  
loongarch            randconfig-r012-20230502   gcc  
loongarch            randconfig-r021-20230506   gcc  
loongarch            randconfig-r022-20230501   gcc  
loongarch            randconfig-r025-20230501   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230505   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230502   gcc  
m68k                 randconfig-r011-20230501   gcc  
m68k                 randconfig-r014-20230430   gcc  
m68k                 randconfig-r026-20230430   gcc  
m68k                 randconfig-r034-20230430   gcc  
microblaze   buildonly-randconfig-r003-20230505   gcc  
microblaze           randconfig-r006-20230430   gcc  
microblaze           randconfig-r013-20230430   gcc  
microblaze           randconfig-r022-20230430   gcc  
microblaze           randconfig-r031-20230501   gcc  
microblaze           randconfig-r033-20230505   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230505   clang
mips                 randconfig-r005-20230501   clang
mips                 randconfig-r012-20230430   gcc  
mips                 randconfig-r012-20230505   gcc  
mips                 randconfig-r014-20230505   gcc  
mips                 randconfig-r016-20230505   gcc  
mips                 randconfig-r023-20230501   gcc  
mips                 randconfig-r032-20230430   clang
mips                 randconfig-r033-20230505   clang
mips                 randconfig-r034-20230430   clang
mips                 randconfig-r035-20230505   clang
nios2        buildonly-randconfig-r002-20230505   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230430   gcc  
nios2                randconfig-r004-20230501   gcc  
nios2                randconfig-r014-20230502   gcc  
nios2                randconfig-r015-20230502   gcc  
nios2                randconfig-r021-20230430   gcc  
nios2                randconfig-r022-20230506   gcc  
nios2                randconfig-r032-20230501   gcc  
nios2                randconfig-r032-20230505   gcc  
nios2                randconfig-r035-20230501   gcc  
openrisc             randconfig-r016-20230501   gcc  
openrisc             randconfig-r032-20230505   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230430   gcc  
parisc               randconfig-r034-20230501   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r001-20230505   gcc  
powerpc              randconfig-r002-20230502   clang
powerpc              randconfig-r006-20230505   gcc  
powerpc              randconfig-r024-20230501   clang
powerpc              randconfig-r031-20230430   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230505   clang
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230502   clang
riscv                randconfig-r004-20230430   gcc  
riscv                randconfig-r012-20230502   gcc  
riscv                randconfig-r015-20230501   clang
riscv                randconfig-r016-20230502   gcc  
riscv                randconfig-r036-20230430   gcc  
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                randconfig-r042-20230502   gcc  
riscv                randconfig-r042-20230503   clang
riscv                randconfig-r042-20230504   gcc  
riscv                randconfig-r042-20230505   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230502   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230505   gcc  
s390                 randconfig-r011-20230430   clang
s390                 randconfig-r011-20230502   gcc  
s390                 randconfig-r014-20230502   gcc  
s390                 randconfig-r031-20230505   gcc  
s390                 randconfig-r033-20230430   gcc  
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
s390                 randconfig-r044-20230502   gcc  
s390                 randconfig-r044-20230503   clang
s390                 randconfig-r044-20230504   gcc  
s390                 randconfig-r044-20230505   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230505   gcc  
sh                   randconfig-r012-20230430   gcc  
sh                   randconfig-r014-20230501   gcc  
sh                   randconfig-r015-20230501   gcc  
sh                   randconfig-r026-20230501   gcc  
sh                   randconfig-r033-20230501   gcc  
sh                   randconfig-r036-20230430   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230430   gcc  
sparc                randconfig-r004-20230502   gcc  
sparc                randconfig-r013-20230502   gcc  
sparc                randconfig-r015-20230505   gcc  
sparc64              randconfig-r001-20230502   gcc  
sparc64              randconfig-r005-20230430   gcc  
sparc64              randconfig-r005-20230502   gcc  
sparc64              randconfig-r013-20230505   gcc  
sparc64              randconfig-r031-20230505   gcc  
sparc64              randconfig-r034-20230505   gcc  
sparc64              randconfig-r036-20230501   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230501   gcc  
x86_64               randconfig-a002-20230501   gcc  
x86_64               randconfig-a003-20230501   gcc  
x86_64               randconfig-a004-20230501   gcc  
x86_64               randconfig-a005-20230501   gcc  
x86_64               randconfig-a006-20230501   gcc  
x86_64               randconfig-a011-20230501   clang
x86_64               randconfig-a012-20230501   clang
x86_64               randconfig-a013-20230501   clang
x86_64               randconfig-a014-20230501   clang
x86_64               randconfig-a015-20230501   clang
x86_64               randconfig-a016-20230501   clang
x86_64               randconfig-r036-20230501   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230501   gcc  
xtensa               randconfig-r002-20230501   gcc  
xtensa               randconfig-r006-20230504   gcc  
xtensa               randconfig-r011-20230505   gcc  
xtensa               randconfig-r014-20230430   gcc  
xtensa               randconfig-r015-20230430   gcc  
xtensa               randconfig-r015-20230502   gcc  
xtensa               randconfig-r032-20230430   gcc  
xtensa               randconfig-r034-20230505   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
