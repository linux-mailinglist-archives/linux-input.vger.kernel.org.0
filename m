Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCD470E21B
	for <lists+linux-input@lfdr.de>; Tue, 23 May 2023 18:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237262AbjEWQgK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 12:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjEWQgK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 12:36:10 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BAB192
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684859757; x=1716395757;
  h=date:from:to:cc:subject:message-id;
  bh=WxqZ+hFJ0pqxwoD0fA/NbnQpOZtzHfH5Ef2vCWYbP+o=;
  b=QWtib9TG6rppZRTmNJ/trukohcC6qu964oxdjMdglUZjVtnNTN9C7WwP
   Zm+qgTqGT5lws16xKtWEH4W8LS7tfihHhQzc+GWUL1AKHp7htigEKzAjf
   O3yLO7q9hOP6mDfPAo05NcQhKUmfkZT2TPv6rs/muK2hvccpnK6GS+b7P
   dzbqBPNaMhra8TMV7LcoWfJCL03doa6O69csIV2SUv/0lQzxlDgsX6Yus
   RhBnZfrqKNkxi0CYXOdNVCQRr+dRwvrkkwnihZG1KA0mEwxKtMulmA1bf
   02mU9DHBVJ+tzLd6VUM6X9rhQ8a3I3q+sO736frFxgKHfMk2eyzQMbvrH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="337874844"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="337874844"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 09:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="828181082"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="828181082"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 May 2023 09:34:20 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1Uxp-000DvR-0k;
        Tue, 23 May 2023 16:34:21 +0000
Date:   Wed, 24 May 2023 00:33:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 9284d3b9a3609db30a528947ec4e5178055cd268
Message-ID: <20230523163341.exAWC%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230524001904/lkp-src/repo/*/dtor-input
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 9284d3b9a3609db30a528947ec4e5178055cd268  Input: xpad - spelling fixes for "Xbox"

elapsed time: 918m

configs tested: 277
configs skipped: 35

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230522   gcc  
alpha        buildonly-randconfig-r006-20230521   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230521   gcc  
alpha                randconfig-r022-20230521   gcc  
alpha                randconfig-r023-20230521   gcc  
alpha                randconfig-r023-20230523   gcc  
alpha                randconfig-r024-20230521   gcc  
alpha                randconfig-r025-20230521   gcc  
alpha                randconfig-r026-20230522   gcc  
alpha                randconfig-r026-20230523   gcc  
alpha                randconfig-r033-20230522   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230522   gcc  
arc          buildonly-randconfig-r004-20230521   gcc  
arc          buildonly-randconfig-r004-20230522   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230523   gcc  
arc                  randconfig-r013-20230521   gcc  
arc                  randconfig-r015-20230523   gcc  
arc                  randconfig-r016-20230522   gcc  
arc                  randconfig-r023-20230521   gcc  
arc                  randconfig-r023-20230522   gcc  
arc                  randconfig-r024-20230523   gcc  
arc                  randconfig-r034-20230522   gcc  
arc                  randconfig-r035-20230521   gcc  
arc                  randconfig-r036-20230521   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r015-20230521   clang
arm                  randconfig-r035-20230521   gcc  
arm                  randconfig-r036-20230521   gcc  
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230521   clang
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230522   gcc  
arm64                randconfig-r006-20230522   gcc  
arm64                randconfig-r034-20230522   gcc  
csky         buildonly-randconfig-r004-20230522   gcc  
csky         buildonly-randconfig-r006-20230522   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230521   gcc  
csky                 randconfig-r011-20230522   gcc  
csky                 randconfig-r015-20230521   gcc  
csky                 randconfig-r022-20230522   gcc  
csky                 randconfig-r024-20230522   gcc  
csky                 randconfig-r026-20230521   gcc  
hexagon              randconfig-r001-20230522   clang
hexagon              randconfig-r003-20230521   clang
hexagon              randconfig-r011-20230523   clang
hexagon              randconfig-r016-20230522   clang
hexagon              randconfig-r041-20230521   clang
hexagon              randconfig-r041-20230522   clang
hexagon              randconfig-r045-20230521   clang
hexagon              randconfig-r045-20230522   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230522   gcc  
i386                 randconfig-a002-20230522   gcc  
i386                 randconfig-a003-20230522   gcc  
i386                 randconfig-a004-20230522   gcc  
i386                 randconfig-a005-20230522   gcc  
i386                 randconfig-a006-20230522   gcc  
i386                 randconfig-a011-20230522   clang
i386                 randconfig-a012-20230522   clang
i386                 randconfig-a013-20230522   clang
i386                 randconfig-a014-20230522   clang
i386                 randconfig-a015-20230522   clang
i386                 randconfig-a016-20230522   clang
i386                 randconfig-i051-20230523   clang
i386                 randconfig-i052-20230523   clang
i386                 randconfig-i053-20230523   clang
i386                 randconfig-i054-20230523   clang
i386                 randconfig-i055-20230523   clang
i386                 randconfig-i056-20230523   clang
i386                 randconfig-i061-20230523   clang
i386                 randconfig-i062-20230523   clang
i386                 randconfig-i063-20230523   clang
i386                 randconfig-i064-20230523   clang
i386                 randconfig-i065-20230523   clang
i386                 randconfig-i066-20230523   clang
i386                 randconfig-r001-20230522   gcc  
i386                 randconfig-r011-20230522   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                        generic_defconfig   gcc  
ia64                 randconfig-r003-20230522   gcc  
ia64                 randconfig-r006-20230521   gcc  
ia64                 randconfig-r015-20230522   gcc  
ia64                 randconfig-r022-20230523   gcc  
ia64                 randconfig-r023-20230521   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230521   gcc  
loongarch    buildonly-randconfig-r005-20230522   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230521   gcc  
loongarch            randconfig-r003-20230521   gcc  
loongarch            randconfig-r004-20230521   gcc  
loongarch            randconfig-r014-20230522   gcc  
loongarch            randconfig-r022-20230521   gcc  
loongarch            randconfig-r032-20230521   gcc  
loongarch            randconfig-r033-20230522   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230522   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                 randconfig-r013-20230522   gcc  
m68k                 randconfig-r024-20230522   gcc  
m68k                 randconfig-r034-20230521   gcc  
microblaze   buildonly-randconfig-r001-20230521   gcc  
microblaze   buildonly-randconfig-r006-20230522   gcc  
microblaze           randconfig-r004-20230522   gcc  
microblaze           randconfig-r013-20230522   gcc  
microblaze           randconfig-r035-20230521   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230521   gcc  
mips                  decstation_64_defconfig   gcc  
mips                 randconfig-r001-20230521   gcc  
mips                 randconfig-r006-20230521   gcc  
mips                 randconfig-r012-20230521   clang
mips                 randconfig-r013-20230521   clang
mips                 randconfig-r016-20230521   clang
mips                 randconfig-r023-20230523   clang
nios2        buildonly-randconfig-r004-20230521   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230521   gcc  
nios2                randconfig-r004-20230523   gcc  
nios2                randconfig-r005-20230521   gcc  
nios2                randconfig-r005-20230522   gcc  
nios2                randconfig-r012-20230523   gcc  
nios2                randconfig-r015-20230521   gcc  
nios2                randconfig-r025-20230521   gcc  
nios2                randconfig-r031-20230522   gcc  
nios2                randconfig-r032-20230521   gcc  
nios2                randconfig-r033-20230521   gcc  
nios2                randconfig-r035-20230522   gcc  
openrisc     buildonly-randconfig-r001-20230522   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r021-20230523   gcc  
openrisc             randconfig-r031-20230522   gcc  
openrisc             randconfig-r034-20230521   gcc  
parisc       buildonly-randconfig-r001-20230522   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230522   gcc  
parisc               randconfig-r015-20230522   gcc  
parisc               randconfig-r016-20230523   gcc  
parisc               randconfig-r024-20230523   gcc  
parisc               randconfig-r026-20230521   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230521   gcc  
powerpc      buildonly-randconfig-r002-20230522   clang
powerpc              randconfig-r001-20230522   gcc  
powerpc              randconfig-r006-20230521   clang
powerpc              randconfig-r011-20230521   gcc  
powerpc              randconfig-r013-20230522   clang
powerpc              randconfig-r021-20230521   gcc  
powerpc              randconfig-r033-20230521   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230523   clang
riscv                randconfig-r013-20230522   clang
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230521   gcc  
s390         buildonly-randconfig-r006-20230521   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230522   gcc  
s390                 randconfig-r014-20230522   clang
s390                 randconfig-r016-20230521   gcc  
s390                 randconfig-r021-20230522   clang
s390                 randconfig-r024-20230521   gcc  
s390                 randconfig-r025-20230523   gcc  
s390                 randconfig-r026-20230521   gcc  
s390                 randconfig-r034-20230522   gcc  
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230521   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r002-20230521   gcc  
sh                   randconfig-r002-20230522   gcc  
sh                   randconfig-r025-20230522   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc        buildonly-randconfig-r005-20230522   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230522   gcc  
sparc                randconfig-r014-20230521   gcc  
sparc                randconfig-r016-20230522   gcc  
sparc                randconfig-r022-20230521   gcc  
sparc                randconfig-r023-20230522   gcc  
sparc                randconfig-r026-20230522   gcc  
sparc                randconfig-r035-20230522   gcc  
sparc                randconfig-r036-20230522   gcc  
sparc64      buildonly-randconfig-r003-20230522   gcc  
sparc64      buildonly-randconfig-r005-20230521   gcc  
sparc64              randconfig-r002-20230522   gcc  
sparc64              randconfig-r005-20230521   gcc  
sparc64              randconfig-r005-20230522   gcc  
sparc64              randconfig-r011-20230521   gcc  
sparc64              randconfig-r016-20230521   gcc  
sparc64              randconfig-r031-20230521   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r005-20230522   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230522   gcc  
x86_64               randconfig-a002-20230522   gcc  
x86_64               randconfig-a003-20230522   gcc  
x86_64               randconfig-a004-20230522   gcc  
x86_64               randconfig-a005-20230522   gcc  
x86_64               randconfig-a006-20230522   gcc  
x86_64               randconfig-a011-20230522   clang
x86_64               randconfig-a012-20230522   clang
x86_64               randconfig-a013-20230522   clang
x86_64               randconfig-a014-20230522   clang
x86_64               randconfig-a015-20230522   clang
x86_64               randconfig-a016-20230522   clang
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64               randconfig-x061-20230522   clang
x86_64               randconfig-x062-20230522   clang
x86_64               randconfig-x063-20230522   clang
x86_64               randconfig-x064-20230522   clang
x86_64               randconfig-x065-20230522   clang
x86_64               randconfig-x066-20230522   clang
x86_64               randconfig-x071-20230522   gcc  
x86_64               randconfig-x072-20230522   gcc  
x86_64               randconfig-x073-20230522   gcc  
x86_64               randconfig-x074-20230522   gcc  
x86_64               randconfig-x075-20230522   gcc  
x86_64               randconfig-x076-20230522   gcc  
x86_64               randconfig-x081-20230522   gcc  
x86_64               randconfig-x082-20230522   gcc  
x86_64               randconfig-x083-20230522   gcc  
x86_64               randconfig-x084-20230522   gcc  
x86_64               randconfig-x085-20230522   gcc  
x86_64               randconfig-x086-20230522   gcc  
x86_64               randconfig-x091-20230523   gcc  
x86_64               randconfig-x092-20230523   gcc  
x86_64               randconfig-x093-20230523   gcc  
x86_64               randconfig-x094-20230523   gcc  
x86_64               randconfig-x095-20230523   gcc  
x86_64               randconfig-x096-20230523   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230522   gcc  
xtensa               randconfig-r003-20230522   gcc  
xtensa               randconfig-r004-20230521   gcc  
xtensa               randconfig-r004-20230522   gcc  
xtensa               randconfig-r012-20230522   gcc  
xtensa               randconfig-r014-20230521   gcc  
xtensa               randconfig-r025-20230523   gcc  
xtensa               randconfig-r026-20230523   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
