Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A407002FD
	for <lists+linux-input@lfdr.de>; Fri, 12 May 2023 10:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjELIxr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 May 2023 04:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjELIxq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 May 2023 04:53:46 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77003E43
        for <linux-input@vger.kernel.org>; Fri, 12 May 2023 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683881625; x=1715417625;
  h=date:from:to:cc:subject:message-id;
  bh=5Vq7cQcDNmY+d74US9CFDQhHlFhLvTpK2xl6xDq4Pyw=;
  b=B58857K5K56qACjxh/rAYnpwhox6otJWAV5oxAkLdZLuOQuSSTz+BeFz
   8iabXxvvqiPTzCX5O0BaHZ/DSJwBn7VEwTsMCSPFENHh/cvx28I8aLyS5
   mkHXbq4hMgQCCLIFP/rK+WYNmbNy4amOWNSkxLnBB88l0uIxyS0Kifom9
   MTh0aGJ3qc7pvTdi+3By5lM2E3y3IPzFWLXlZ7HaugSP/7+EwEqzid5QF
   B6wFKtT/yJdwmDz97Mh8TxIjGnlypZMECo/y2NEzHbvt8oJa3evIdzr2e
   knuKSRadc6Cka3qgBhMMVaexA7OyOhNQAeUKTdyylDYJn/YF6sXr6r74L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416371573"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="416371573"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 01:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677596712"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="677596712"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 May 2023 01:53:43 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pxOX1-0004j7-0y;
        Fri, 12 May 2023 08:53:43 +0000
Date:   Fri, 12 May 2023 16:53:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 17caa38a988e8f73e392f1f5ec2afb854552edcc
Message-ID: <20230512085317.drRdV%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 17caa38a988e8f73e392f1f5ec2afb854552edcc  dt-bindings: input: cypress,cyapa: convert to dtschema

elapsed time: 785m

configs tested: 181
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r004-20230511   gcc  
alpha        buildonly-randconfig-r005-20230509   gcc  
alpha        buildonly-randconfig-r006-20230511   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230511   gcc  
alpha                randconfig-r005-20230509   gcc  
alpha                randconfig-r006-20230511   gcc  
alpha                randconfig-r026-20230511   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230511   gcc  
arc                  randconfig-r011-20230509   gcc  
arc                  randconfig-r014-20230509   gcc  
arc                  randconfig-r016-20230511   gcc  
arc                  randconfig-r024-20230511   gcc  
arc                  randconfig-r026-20230512   gcc  
arc                  randconfig-r031-20230509   gcc  
arc                  randconfig-r043-20230509   gcc  
arc                  randconfig-r043-20230511   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                  randconfig-r002-20230509   clang
arm                  randconfig-r024-20230509   gcc  
arm                  randconfig-r033-20230509   clang
arm                  randconfig-r046-20230509   gcc  
arm                  randconfig-r046-20230511   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230511   clang
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230509   gcc  
arm64                randconfig-r004-20230509   gcc  
arm64                randconfig-r014-20230511   gcc  
arm64                randconfig-r024-20230509   clang
arm64                randconfig-r032-20230511   clang
arm64                randconfig-r035-20230511   clang
csky                                defconfig   gcc  
csky                 randconfig-r004-20230511   gcc  
csky                 randconfig-r022-20230511   gcc  
csky                 randconfig-r025-20230511   gcc  
csky                 randconfig-r032-20230509   gcc  
hexagon              randconfig-r001-20230509   clang
hexagon              randconfig-r001-20230511   clang
hexagon              randconfig-r002-20230509   clang
hexagon              randconfig-r011-20230511   clang
hexagon              randconfig-r015-20230511   clang
hexagon              randconfig-r022-20230512   clang
hexagon              randconfig-r031-20230509   clang
hexagon              randconfig-r041-20230509   clang
hexagon              randconfig-r041-20230511   clang
hexagon              randconfig-r045-20230509   clang
hexagon              randconfig-r045-20230511   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230511   gcc  
ia64                 randconfig-r021-20230512   gcc  
ia64                 randconfig-r023-20230511   gcc  
ia64                 randconfig-r035-20230509   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230511   gcc  
loongarch            randconfig-r013-20230509   gcc  
loongarch            randconfig-r014-20230511   gcc  
loongarch            randconfig-r021-20230509   gcc  
loongarch            randconfig-r021-20230511   gcc  
loongarch            randconfig-r034-20230511   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230509   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                 randconfig-r012-20230511   gcc  
m68k                 randconfig-r014-20230509   gcc  
m68k                 randconfig-r025-20230512   gcc  
microblaze   buildonly-randconfig-r002-20230509   gcc  
microblaze           randconfig-r001-20230509   gcc  
microblaze           randconfig-r005-20230511   gcc  
microblaze           randconfig-r022-20230511   gcc  
microblaze           randconfig-r036-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230509   clang
mips         buildonly-randconfig-r004-20230511   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip22_defconfig   clang
mips                      pic32mzda_defconfig   clang
mips                 randconfig-r006-20230509   clang
mips                 randconfig-r011-20230511   clang
mips                 randconfig-r021-20230511   clang
mips                 randconfig-r023-20230511   clang
nios2                         10m50_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230509   gcc  
nios2                randconfig-r023-20230512   gcc  
nios2                randconfig-r024-20230511   gcc  
nios2                randconfig-r024-20230512   gcc  
nios2                randconfig-r026-20230509   gcc  
nios2                randconfig-r036-20230509   gcc  
openrisc     buildonly-randconfig-r002-20230511   gcc  
openrisc     buildonly-randconfig-r006-20230511   gcc  
openrisc             randconfig-r002-20230511   gcc  
openrisc             randconfig-r025-20230509   gcc  
openrisc             randconfig-r026-20230509   gcc  
openrisc             randconfig-r031-20230511   gcc  
openrisc             randconfig-r033-20230511   gcc  
openrisc             randconfig-r035-20230511   gcc  
openrisc             randconfig-r036-20230511   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230511   gcc  
parisc               randconfig-r022-20230509   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230511   gcc  
powerpc      buildonly-randconfig-r004-20230509   clang
powerpc                      cm5200_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                     powernv_defconfig   clang
powerpc              randconfig-r005-20230509   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            alldefconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230509   clang
riscv        buildonly-randconfig-r004-20230509   clang
riscv        buildonly-randconfig-r005-20230511   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230509   clang
riscv                randconfig-r022-20230509   clang
riscv                randconfig-r025-20230511   gcc  
riscv                randconfig-r034-20230509   gcc  
riscv                randconfig-r034-20230511   clang
riscv                randconfig-r042-20230509   clang
riscv                randconfig-r042-20230511   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230511   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230509   clang
s390                 randconfig-r013-20230511   gcc  
s390                 randconfig-r023-20230509   clang
s390                 randconfig-r033-20230509   gcc  
s390                 randconfig-r033-20230511   clang
s390                 randconfig-r034-20230509   gcc  
s390                 randconfig-r044-20230509   clang
s390                 randconfig-r044-20230511   gcc  
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                   randconfig-r003-20230511   gcc  
sh                   randconfig-r004-20230511   gcc  
sh                   randconfig-r015-20230511   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc        buildonly-randconfig-r003-20230511   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230509   gcc  
sparc                randconfig-r016-20230509   gcc  
sparc64      buildonly-randconfig-r005-20230511   gcc  
sparc64              randconfig-r006-20230509   gcc  
sparc64              randconfig-r016-20230511   gcc  
sparc64              randconfig-r032-20230509   gcc  
sparc64              randconfig-r032-20230511   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230509   gcc  
xtensa       buildonly-randconfig-r006-20230509   gcc  
xtensa               randconfig-r001-20230511   gcc  
xtensa               randconfig-r004-20230509   gcc  
xtensa               randconfig-r035-20230509   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
