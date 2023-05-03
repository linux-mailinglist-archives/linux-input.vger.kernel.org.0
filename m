Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794076F537F
	for <lists+linux-input@lfdr.de>; Wed,  3 May 2023 10:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbjECIkZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 May 2023 04:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjECIj6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 May 2023 04:39:58 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B50558D
        for <linux-input@vger.kernel.org>; Wed,  3 May 2023 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683103161; x=1714639161;
  h=date:from:to:cc:subject:message-id;
  bh=z8pjqc7fi+MCRTw9ADbbMsychLIthHHESzEIvnST2bk=;
  b=F9CpCjIUoxvjYw9l02+BTLkQwcTkyQK6QBprCzRCCPJ7w71sV+8hXU9M
   3wvb4FLKKX/50PzMiLsRD3FxV42hMyKXCpVY7RZolSjadQN0toZPRO/2h
   Md43BWqeKLT8oVBLPSpLglsda1SRZVppjJ5GdWiXkbZ1V2YsNTqcImw0l
   4BQs8JddLGs6ldlMODGtXMv+YeSwfK7R2jjkM5FxWdfwkLIJdzpd9YM2P
   IDF2DmqpzfO0W47q6oI/qDSU4xLnqsmYp9LAG3EZnDaPPMzECzUsoFi6Z
   Oh+mhajw8Dnb2cRnL+LllD/ofYegUUyXTf3zkPpvBmX1QPZIalI7zr6RO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="376664381"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="376664381"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 01:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="646835493"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="646835493"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 May 2023 01:39:03 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pu80t-0001ii-0g;
        Wed, 03 May 2023 08:39:03 +0000
Date:   Wed, 03 May 2023 16:38:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 3516fa162a01f6611c3c129ce9529bdc720d36b7
Message-ID: <20230503083840.G8fKw%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 3516fa162a01f6611c3c129ce9529bdc720d36b7  Input: avoid calling input_set_abs_val() in the event handling core

elapsed time: 725m

configs tested: 217
configs skipped: 24

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230501   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r034-20230430   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230430   gcc  
arc          buildonly-randconfig-r002-20230430   gcc  
arc          buildonly-randconfig-r003-20230430   gcc  
arc          buildonly-randconfig-r004-20230430   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230502   gcc  
arc                  randconfig-r004-20230501   gcc  
arc                  randconfig-r011-20230430   gcc  
arc                  randconfig-r022-20230502   gcc  
arc                  randconfig-r032-20230501   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arc                  randconfig-r043-20230502   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230430   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r016-20230501   gcc  
arm                  randconfig-r023-20230430   gcc  
arm                  randconfig-r031-20230501   clang
arm                  randconfig-r033-20230430   clang
arm                  randconfig-r035-20230502   gcc  
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm                  randconfig-r046-20230502   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230430   gcc  
arm64        buildonly-randconfig-r004-20230430   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230430   gcc  
arm64                randconfig-r011-20230501   clang
arm64                randconfig-r032-20230430   gcc  
csky         buildonly-randconfig-r004-20230502   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230501   gcc  
csky                 randconfig-r006-20230502   gcc  
csky                 randconfig-r016-20230430   gcc  
csky                 randconfig-r034-20230502   gcc  
hexagon      buildonly-randconfig-r006-20230430   clang
hexagon              randconfig-r023-20230502   clang
hexagon              randconfig-r031-20230502   clang
hexagon              randconfig-r032-20230502   clang
hexagon              randconfig-r041-20230430   clang
hexagon              randconfig-r041-20230501   clang
hexagon              randconfig-r041-20230502   clang
hexagon              randconfig-r045-20230430   clang
hexagon              randconfig-r045-20230501   clang
hexagon              randconfig-r045-20230502   clang
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
i386                 randconfig-r034-20230501   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230501   gcc  
ia64         buildonly-randconfig-r003-20230501   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r015-20230430   gcc  
ia64                 randconfig-r021-20230501   gcc  
ia64                 randconfig-r023-20230430   gcc  
ia64                 randconfig-r025-20230430   gcc  
ia64                 randconfig-r036-20230501   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230501   gcc  
loongarch    buildonly-randconfig-r006-20230501   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230430   gcc  
loongarch            randconfig-r014-20230430   gcc  
loongarch            randconfig-r016-20230502   gcc  
loongarch            randconfig-r022-20230501   gcc  
loongarch            randconfig-r024-20230430   gcc  
loongarch            randconfig-r025-20230430   gcc  
loongarch            randconfig-r025-20230501   gcc  
loongarch            randconfig-r032-20230501   gcc  
loongarch            randconfig-r036-20230502   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230502   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230501   gcc  
m68k                 randconfig-r001-20230502   gcc  
m68k                 randconfig-r006-20230502   gcc  
m68k                 randconfig-r026-20230430   gcc  
m68k                 randconfig-r031-20230501   gcc  
m68k                 randconfig-r032-20230430   gcc  
m68k                 randconfig-r033-20230501   gcc  
m68k                 randconfig-r033-20230502   gcc  
m68k                 randconfig-r036-20230430   gcc  
microblaze   buildonly-randconfig-r005-20230501   gcc  
microblaze   buildonly-randconfig-r006-20230501   gcc  
microblaze   buildonly-randconfig-r006-20230502   gcc  
microblaze           randconfig-r022-20230430   gcc  
microblaze           randconfig-r036-20230502   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230502   gcc  
mips                 randconfig-r006-20230501   clang
mips                 randconfig-r023-20230501   gcc  
mips                 randconfig-r036-20230430   clang
nios2        buildonly-randconfig-r005-20230430   gcc  
nios2        buildonly-randconfig-r006-20230430   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230501   gcc  
nios2                randconfig-r021-20230430   gcc  
nios2                randconfig-r022-20230501   gcc  
nios2                randconfig-r031-20230430   gcc  
openrisc     buildonly-randconfig-r005-20230430   gcc  
openrisc             randconfig-r004-20230502   gcc  
openrisc             randconfig-r013-20230501   gcc  
openrisc             randconfig-r014-20230502   gcc  
openrisc             randconfig-r024-20230502   gcc  
openrisc             randconfig-r035-20230502   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230430   gcc  
parisc               randconfig-r003-20230502   gcc  
parisc               randconfig-r015-20230430   gcc  
parisc               randconfig-r015-20230502   gcc  
parisc               randconfig-r024-20230501   gcc  
parisc               randconfig-r035-20230430   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230501   clang
powerpc              randconfig-r012-20230502   gcc  
powerpc              randconfig-r014-20230501   clang
powerpc              randconfig-r024-20230501   clang
powerpc              randconfig-r026-20230501   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230502   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230430   gcc  
riscv                randconfig-r002-20230502   clang
riscv                randconfig-r004-20230430   gcc  
riscv                randconfig-r004-20230502   clang
riscv                randconfig-r011-20230502   gcc  
riscv                randconfig-r025-20230501   clang
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                randconfig-r042-20230502   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r004-20230501   clang
s390                                defconfig   gcc  
s390                 randconfig-r011-20230430   clang
s390                 randconfig-r015-20230502   gcc  
s390                 randconfig-r016-20230430   clang
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
s390                 randconfig-r044-20230502   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230502   gcc  
sh                   randconfig-r013-20230502   gcc  
sh                   randconfig-r014-20230502   gcc  
sh                   randconfig-r022-20230430   gcc  
sh                   randconfig-r026-20230501   gcc  
sh                   randconfig-r035-20230501   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230430   gcc  
sparc                randconfig-r012-20230502   gcc  
sparc                randconfig-r016-20230501   gcc  
sparc                randconfig-r032-20230502   gcc  
sparc                randconfig-r034-20230501   gcc  
sparc64              randconfig-r001-20230430   gcc  
sparc64              randconfig-r002-20230501   gcc  
sparc64              randconfig-r005-20230502   gcc  
sparc64              randconfig-r011-20230501   gcc  
sparc64              randconfig-r013-20230501   gcc  
sparc64              randconfig-r014-20230430   gcc  
sparc64              randconfig-r014-20230501   gcc  
sparc64              randconfig-r021-20230430   gcc  
sparc64              randconfig-r021-20230501   gcc  
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
x86_64               randconfig-r005-20230501   gcc  
x86_64               randconfig-r012-20230501   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r011-20230502   gcc  
xtensa               randconfig-r012-20230501   gcc  
xtensa               randconfig-r021-20230502   gcc  
xtensa               randconfig-r033-20230430   gcc  
xtensa               randconfig-r033-20230502   gcc  
xtensa               randconfig-r034-20230430   gcc  
xtensa               randconfig-r035-20230501   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
