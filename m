Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F22986FF774
	for <lists+linux-input@lfdr.de>; Thu, 11 May 2023 18:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238660AbjEKQfb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 May 2023 12:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238606AbjEKQf3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 May 2023 12:35:29 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20715255
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683822913; x=1715358913;
  h=date:from:to:cc:subject:message-id;
  bh=FTqamAasay3ph2oEKcFBoEtNLGFscCTYOBGLPzPLB2U=;
  b=WrlPpgHXseHX5R1Sd6lPcR3S8DgrlzdlDkNWKqc5kUM0VXJZHLmAZUtJ
   RqvUaxhj1F3/+ALuXvk05Yo3oUehkUN7vI66QzFSJ6jrcvhA6JMhUhYfP
   c7EEH8XKxkghwkKuSSSxqHbBN9LXzTn7doVyL4Gm/9hk31lgCndyCHO/6
   eOgcHBYFxpHDnYRIUPxrRUhxI5SqiKGYM0wroJJ7rivEc+mWVe59kBXdJ
   PpUSSvPa/lglJsKoIO69x/3re7oKNZYXL0l6NlA9TABkzLr2bi8Ma0prN
   5wfNX2sK+P8NzuAKTVKW44btL5u0CVLrCM3qCnT940NrDGjDs/OzrFPqr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="349393364"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="349393364"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 09:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="764811572"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="764811572"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 May 2023 09:32:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1px9Dh-000479-2m;
        Thu, 11 May 2023 16:32:45 +0000
Date:   Fri, 12 May 2023 00:32:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 e96220bce5176ed2309f77f061dcc0430b82b25e
Message-ID: <20230511163229.gLd7s%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: e96220bce5176ed2309f77f061dcc0430b82b25e  Input: adxl34x - do not hardcode interrupt trigger type

elapsed time: 741m

configs tested: 259
configs skipped: 28

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230509   gcc  
alpha        buildonly-randconfig-r002-20230511   gcc  
alpha        buildonly-randconfig-r005-20230509   gcc  
alpha        buildonly-randconfig-r005-20230511   gcc  
alpha        buildonly-randconfig-r006-20230510   gcc  
alpha        buildonly-randconfig-r006-20230511   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230509   gcc  
alpha                randconfig-r014-20230510   gcc  
alpha                randconfig-r015-20230510   gcc  
alpha                randconfig-r015-20230511   gcc  
alpha                randconfig-r016-20230509   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230511   gcc  
arc          buildonly-randconfig-r002-20230510   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230509   gcc  
arc                  randconfig-r022-20230509   gcc  
arc                  randconfig-r023-20230509   gcc  
arc                  randconfig-r025-20230509   gcc  
arc                  randconfig-r031-20230511   gcc  
arc                  randconfig-r036-20230511   gcc  
arc                  randconfig-r043-20230509   gcc  
arc                  randconfig-r043-20230510   gcc  
arc                  randconfig-r043-20230511   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230509   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230510   gcc  
arm                  randconfig-r013-20230511   clang
arm                  randconfig-r015-20230511   clang
arm                  randconfig-r024-20230511   clang
arm                  randconfig-r035-20230511   gcc  
arm                  randconfig-r046-20230509   gcc  
arm                  randconfig-r046-20230510   gcc  
arm                  randconfig-r046-20230511   clang
arm                             rpc_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230511   clang
arm64        buildonly-randconfig-r006-20230509   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230509   gcc  
arm64                randconfig-r034-20230509   gcc  
csky         buildonly-randconfig-r001-20230509   gcc  
csky         buildonly-randconfig-r002-20230509   gcc  
csky         buildonly-randconfig-r003-20230509   gcc  
csky         buildonly-randconfig-r003-20230510   gcc  
csky         buildonly-randconfig-r006-20230511   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230511   gcc  
csky                 randconfig-r006-20230509   gcc  
csky                 randconfig-r011-20230509   gcc  
csky                 randconfig-r033-20230509   gcc  
csky                 randconfig-r034-20230510   gcc  
csky                 randconfig-r034-20230511   gcc  
hexagon      buildonly-randconfig-r002-20230511   clang
hexagon              randconfig-r024-20230509   clang
hexagon              randconfig-r024-20230511   clang
hexagon              randconfig-r026-20230511   clang
hexagon              randconfig-r041-20230509   clang
hexagon              randconfig-r041-20230510   clang
hexagon              randconfig-r041-20230511   clang
hexagon              randconfig-r045-20230509   clang
hexagon              randconfig-r045-20230510   clang
hexagon              randconfig-r045-20230511   clang
i386                              allnoconfig   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                        generic_defconfig   gcc  
ia64                 randconfig-r002-20230511   gcc  
ia64                 randconfig-r006-20230511   gcc  
ia64                 randconfig-r023-20230511   gcc  
ia64                 randconfig-r033-20230509   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230510   gcc  
loongarch    buildonly-randconfig-r005-20230509   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230511   gcc  
loongarch            randconfig-r014-20230509   gcc  
loongarch            randconfig-r021-20230509   gcc  
loongarch            randconfig-r021-20230511   gcc  
loongarch            randconfig-r024-20230511   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230511   gcc  
m68k                 randconfig-r003-20230511   gcc  
m68k                 randconfig-r004-20230509   gcc  
m68k                 randconfig-r013-20230509   gcc  
m68k                 randconfig-r014-20230511   gcc  
m68k                 randconfig-r025-20230509   gcc  
m68k                 randconfig-r025-20230511   gcc  
m68k                 randconfig-r032-20230510   gcc  
microblaze   buildonly-randconfig-r001-20230511   gcc  
microblaze   buildonly-randconfig-r002-20230509   gcc  
microblaze   buildonly-randconfig-r004-20230511   gcc  
microblaze   buildonly-randconfig-r006-20230511   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r003-20230511   gcc  
microblaze           randconfig-r004-20230509   gcc  
microblaze           randconfig-r005-20230511   gcc  
microblaze           randconfig-r014-20230511   gcc  
microblaze           randconfig-r015-20230509   gcc  
microblaze           randconfig-r021-20230509   gcc  
microblaze           randconfig-r034-20230511   gcc  
microblaze           randconfig-r035-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230511   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                 randconfig-r011-20230511   clang
mips                 randconfig-r024-20230509   gcc  
mips                 randconfig-r031-20230510   clang
mips                 randconfig-r036-20230511   gcc  
nios2        buildonly-randconfig-r001-20230509   gcc  
nios2        buildonly-randconfig-r006-20230511   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230509   gcc  
nios2                randconfig-r005-20230511   gcc  
nios2                randconfig-r016-20230511   gcc  
nios2                randconfig-r022-20230511   gcc  
nios2                randconfig-r031-20230509   gcc  
nios2                randconfig-r032-20230509   gcc  
nios2                randconfig-r036-20230511   gcc  
openrisc     buildonly-randconfig-r002-20230509   gcc  
openrisc     buildonly-randconfig-r003-20230511   gcc  
openrisc     buildonly-randconfig-r006-20230509   gcc  
openrisc             randconfig-r001-20230509   gcc  
openrisc             randconfig-r005-20230511   gcc  
openrisc             randconfig-r022-20230511   gcc  
openrisc             randconfig-r025-20230511   gcc  
openrisc             randconfig-r032-20230511   gcc  
openrisc             randconfig-r033-20230511   gcc  
openrisc             randconfig-r036-20230509   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230511   gcc  
parisc               randconfig-r013-20230509   gcc  
parisc               randconfig-r025-20230511   gcc  
parisc               randconfig-r026-20230511   gcc  
parisc               randconfig-r031-20230511   gcc  
parisc               randconfig-r034-20230511   gcc  
parisc               randconfig-r035-20230509   gcc  
parisc               randconfig-r035-20230511   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230511   gcc  
powerpc      buildonly-randconfig-r002-20230511   gcc  
powerpc      buildonly-randconfig-r003-20230511   gcc  
powerpc      buildonly-randconfig-r004-20230509   clang
powerpc      buildonly-randconfig-r004-20230511   gcc  
powerpc      buildonly-randconfig-r005-20230511   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc              randconfig-r001-20230511   clang
powerpc              randconfig-r003-20230509   gcc  
powerpc              randconfig-r014-20230511   gcc  
powerpc              randconfig-r023-20230509   clang
powerpc              randconfig-r023-20230511   gcc  
powerpc              randconfig-r024-20230509   clang
powerpc              randconfig-r026-20230509   clang
powerpc              randconfig-r026-20230511   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230509   clang
riscv        buildonly-randconfig-r005-20230511   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230511   clang
riscv                randconfig-r004-20230511   clang
riscv                randconfig-r006-20230511   clang
riscv                randconfig-r012-20230511   gcc  
riscv                randconfig-r013-20230511   gcc  
riscv                randconfig-r026-20230509   clang
riscv                randconfig-r035-20230511   clang
riscv                randconfig-r042-20230509   clang
riscv                randconfig-r042-20230510   clang
riscv                randconfig-r042-20230511   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230511   gcc  
s390         buildonly-randconfig-r005-20230509   clang
s390                                defconfig   gcc  
s390                 randconfig-r013-20230509   clang
s390                 randconfig-r013-20230511   gcc  
s390                 randconfig-r033-20230511   clang
s390                 randconfig-r044-20230509   clang
s390                 randconfig-r044-20230510   clang
s390                 randconfig-r044-20230511   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230509   gcc  
sh           buildonly-randconfig-r004-20230511   gcc  
sh           buildonly-randconfig-r005-20230511   gcc  
sh                   randconfig-r003-20230509   gcc  
sh                   randconfig-r015-20230509   gcc  
sh                   randconfig-r015-20230511   gcc  
sh                   randconfig-r022-20230509   gcc  
sh                   randconfig-r023-20230511   gcc  
sh                   randconfig-r036-20230510   gcc  
sh                          sdk7786_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc        buildonly-randconfig-r003-20230511   gcc  
sparc        buildonly-randconfig-r004-20230509   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230511   gcc  
sparc                randconfig-r012-20230511   gcc  
sparc                randconfig-r016-20230510   gcc  
sparc                randconfig-r021-20230511   gcc  
sparc                randconfig-r022-20230509   gcc  
sparc                randconfig-r036-20230509   gcc  
sparc64      buildonly-randconfig-r003-20230509   gcc  
sparc64              randconfig-r005-20230509   gcc  
sparc64              randconfig-r011-20230510   gcc  
sparc64              randconfig-r012-20230510   gcc  
sparc64              randconfig-r032-20230509   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230509   gcc  
xtensa       buildonly-randconfig-r005-20230510   gcc  
xtensa                       common_defconfig   gcc  
xtensa               randconfig-r002-20230509   gcc  
xtensa               randconfig-r004-20230509   gcc  
xtensa               randconfig-r032-20230511   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
