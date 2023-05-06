Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2943A6F8FC6
	for <lists+linux-input@lfdr.de>; Sat,  6 May 2023 09:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjEFHQO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 May 2023 03:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjEFHQN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 May 2023 03:16:13 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8786811617
        for <linux-input@vger.kernel.org>; Sat,  6 May 2023 00:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683357366; x=1714893366;
  h=date:from:to:cc:subject:message-id;
  bh=sb2TejaDpPmpGK1iPvcOMGR438W/YFH1zUUWiZG04fo=;
  b=X8nk7Ce3Le/vIkCvkODxTF1yOJeooiYV2JsmYBOs+vgtI7oH+rmlUp1T
   hT0TfjXGayfOF4eJZtSdzVmuMMV/5SAOx6KLiHHUBGFZ2Rr+BKlVO8cVS
   Qp6uzEud5EOWA3AEvsVxbWzlqLkV541SgcbA0oT/s4oFK5cLr6ZoPnh4Z
   iunxTaSJtKcyzkOEtzih/061WFMn8VKeeBXBUxLJs4+G7wVLEJeY2qZKM
   Q2NwVUQgfOYhYpvDX0Vg/ewtmOTKrb81wxp6QjlIFJ45n9Z61if9470BB
   z/TT0K/mFqulYbNAoTm30d4yXIjbv+2TFEETFpIvFmayjNJpZmvaxfPz3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="435675953"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="435675953"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 00:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="944195911"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="944195911"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 May 2023 00:16:05 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pvC9E-00001d-1r;
        Sat, 06 May 2023 07:16:04 +0000
Date:   Sat, 06 May 2023 15:15:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 978134c4b192ed04ecf699be3e1b4d23b5d20457
Message-ID: <20230506071517.WZha8%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 978134c4b192ed04ecf699be3e1b4d23b5d20457  Input: fix open count when closing inhibited device

elapsed time: 721m

configs tested: 150
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230502   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230501   gcc  
alpha                randconfig-r003-20230505   gcc  
alpha                randconfig-r012-20230501   gcc  
alpha                randconfig-r013-20230502   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230502   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230430   gcc  
arc                  randconfig-r012-20230505   gcc  
arc                  randconfig-r024-20230506   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arc                  randconfig-r043-20230505   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230430   clang
arm                  randconfig-r002-20230501   clang
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm                  randconfig-r046-20230505   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230501   gcc  
arm64                randconfig-r015-20230430   clang
arm64                randconfig-r015-20230501   clang
csky         buildonly-randconfig-r001-20230505   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230502   gcc  
csky                 randconfig-r025-20230506   gcc  
csky                 randconfig-r026-20230506   gcc  
csky                 randconfig-r036-20230430   gcc  
hexagon              randconfig-r001-20230430   clang
hexagon              randconfig-r005-20230502   clang
hexagon              randconfig-r006-20230501   clang
hexagon              randconfig-r016-20230501   clang
hexagon              randconfig-r041-20230430   clang
hexagon              randconfig-r041-20230501   clang
hexagon              randconfig-r041-20230505   clang
hexagon              randconfig-r045-20230430   clang
hexagon              randconfig-r045-20230501   clang
hexagon              randconfig-r045-20230505   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230501   gcc  
i386                 randconfig-a002-20230501   gcc  
i386                 randconfig-a003-20230501   gcc  
i386                 randconfig-a004-20230501   gcc  
i386                 randconfig-a005-20230501   gcc  
i386                 randconfig-a006-20230501   gcc  
i386                 randconfig-a011-20230501   clang
i386                 randconfig-a012-20230501   clang
i386                 randconfig-a013-20230501   clang
i386                 randconfig-a014-20230501   clang
i386                 randconfig-a015-20230501   clang
i386                 randconfig-a016-20230501   clang
i386                 randconfig-r032-20230501   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r015-20230502   gcc  
ia64                 randconfig-r016-20230430   gcc  
ia64                 randconfig-r023-20230506   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r014-20230505   gcc  
loongarch            randconfig-r021-20230506   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230430   gcc  
microblaze   buildonly-randconfig-r003-20230505   gcc  
microblaze           randconfig-r034-20230430   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230502   gcc  
mips                 randconfig-r011-20230505   gcc  
mips                 randconfig-r036-20230501   clang
nios2                               defconfig   gcc  
nios2                randconfig-r006-20230505   gcc  
nios2                randconfig-r013-20230501   gcc  
nios2                randconfig-r022-20230506   gcc  
nios2                randconfig-r031-20230430   gcc  
openrisc             randconfig-r014-20230501   gcc  
openrisc             randconfig-r033-20230430   gcc  
openrisc             randconfig-r035-20230430   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230502   gcc  
parisc               randconfig-r005-20230430   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r012-20230430   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230505   clang
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230502   gcc  
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                randconfig-r042-20230505   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230502   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r032-20230430   gcc  
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
s390                 randconfig-r044-20230505   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230505   gcc  
sh                   randconfig-r004-20230430   gcc  
sh                   randconfig-r005-20230505   gcc  
sh                   randconfig-r015-20230505   gcc  
sh                   randconfig-r016-20230505   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230430   gcc  
sparc                randconfig-r003-20230502   gcc  
sparc                randconfig-r012-20230502   gcc  
sparc                randconfig-r014-20230430   gcc  
sparc64              randconfig-r005-20230501   gcc  
sparc64              randconfig-r013-20230430   gcc  
sparc64              randconfig-r013-20230505   gcc  
sparc64              randconfig-r031-20230501   gcc  
sparc64              randconfig-r035-20230501   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r014-20230502   gcc  
xtensa               randconfig-r033-20230501   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
