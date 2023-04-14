Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9E26E2ADC
	for <lists+linux-input@lfdr.de>; Fri, 14 Apr 2023 21:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjDNT7B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Apr 2023 15:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjDNT7A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Apr 2023 15:59:00 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A08A558B
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 12:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681502334; x=1713038334;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ccgxi+JHz0RK+1uWKyZ75jA+OkkfxYKvJ5rLDVSYcZc=;
  b=YRjWaO/qLUbapd06C+4EJeDcrUKiisSJTY9IP+GzYGihJio/VDpeB83x
   2cU5+8kll6wIrVevSqPkWhMOODaz/HQOxtb7MhGQdS/o/5PU3/8OtL6TW
   78GkJ4X+Gpcykk85d1cMHXaRSu7lSHAqGs4vHO3ZojsL8dBaaUCGMOI9t
   Oc/g0QB6xNf7i0WkqUUfICi6kytqPQaDTMMk7RwqFP3c9vcTE8Dei5lnK
   U2wwyHcUY5FtyN6kYxWYj6gOAHq+6ROrk78dkt8egHWAope+BdAR2LAUy
   XSHdtKq+FDU8cJBcSiFCljpjZo6m1gu1cNos64tbrHl3ad4R5DTB8aJRf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344555984"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="344555984"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 12:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="683445006"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="683445006"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Apr 2023 12:58:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pnPZG-000Zt1-0B;
        Fri, 14 Apr 2023 19:58:46 +0000
Date:   Sat, 15 Apr 2023 03:57:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 c55d84fb2bd89fe2ad56768ead90eb1050581d29
Message-ID: <6439b044.QdshrFJDvB3uyzav%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
branch HEAD: c55d84fb2bd89fe2ad56768ead90eb1050581d29  dt-bindings: input: pwm-beeper: convert to dt schema

elapsed time: 722m

configs tested: 231
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230414   gcc  
alpha                randconfig-r023-20230414   gcc  
alpha                randconfig-r026-20230414   gcc  
alpha                randconfig-r034-20230412   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230409   gcc  
arc                  randconfig-r013-20230410   gcc  
arc                  randconfig-r025-20230414   gcc  
arc                  randconfig-r032-20230410   gcc  
arc                  randconfig-r033-20230409   gcc  
arc                  randconfig-r034-20230413   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arc                  randconfig-r043-20230412   gcc  
arc                  randconfig-r043-20230413   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230410   clang
arm                                 defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                  randconfig-r021-20230413   gcc  
arm                  randconfig-r022-20230414   clang
arm                  randconfig-r031-20230413   clang
arm                  randconfig-r033-20230412   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm                  randconfig-r046-20230412   clang
arm                  randconfig-r046-20230413   gcc  
arm                             rpc_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230409   clang
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230410   clang
arm64                randconfig-r004-20230414   clang
arm64                randconfig-r035-20230409   clang
arm64                randconfig-r036-20230410   clang
csky         buildonly-randconfig-r002-20230409   gcc  
csky         buildonly-randconfig-r006-20230409   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230414   gcc  
csky                 randconfig-r005-20230414   gcc  
csky                 randconfig-r026-20230413   gcc  
csky                 randconfig-r031-20230409   gcc  
hexagon      buildonly-randconfig-r003-20230413   clang
hexagon      buildonly-randconfig-r004-20230413   clang
hexagon              randconfig-r002-20230414   clang
hexagon              randconfig-r011-20230410   clang
hexagon              randconfig-r033-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r041-20230412   clang
hexagon              randconfig-r041-20230413   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
hexagon              randconfig-r045-20230412   clang
hexagon              randconfig-r045-20230413   clang
i386                              allnoconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230410   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                 randconfig-r036-20230410   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230410   gcc  
ia64                 randconfig-r015-20230410   gcc  
ia64                 randconfig-r024-20230410   gcc  
ia64                 randconfig-r025-20230409   gcc  
ia64                 randconfig-r031-20230409   gcc  
ia64                 randconfig-r034-20230410   gcc  
ia64                 randconfig-r036-20230413   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230413   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230409   gcc  
loongarch            randconfig-r016-20230410   gcc  
loongarch            randconfig-r021-20230410   gcc  
loongarch            randconfig-r032-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230413   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230409   gcc  
m68k                 randconfig-r005-20230414   gcc  
m68k                 randconfig-r021-20230410   gcc  
m68k                 randconfig-r024-20230409   gcc  
m68k                 randconfig-r036-20230409   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze           randconfig-r002-20230413   gcc  
microblaze           randconfig-r005-20230410   gcc  
microblaze           randconfig-r023-20230410   gcc  
microblaze           randconfig-r024-20230414   gcc  
microblaze           randconfig-r025-20230413   gcc  
microblaze           randconfig-r032-20230410   gcc  
microblaze           randconfig-r034-20230409   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   clang
mips                        omega2p_defconfig   clang
mips                 randconfig-r023-20230409   clang
mips                 randconfig-r024-20230413   gcc  
mips                 randconfig-r035-20230410   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230414   gcc  
nios2                randconfig-r006-20230413   gcc  
nios2                randconfig-r011-20230409   gcc  
nios2                randconfig-r022-20230413   gcc  
nios2                randconfig-r033-20230413   gcc  
nios2                randconfig-r035-20230409   gcc  
openrisc     buildonly-randconfig-r002-20230410   gcc  
openrisc     buildonly-randconfig-r004-20230410   gcc  
openrisc             randconfig-r003-20230409   gcc  
openrisc             randconfig-r003-20230413   gcc  
openrisc             randconfig-r006-20230410   gcc  
openrisc             randconfig-r023-20230413   gcc  
openrisc             randconfig-r024-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230413   gcc  
parisc               randconfig-r012-20230409   gcc  
parisc               randconfig-r022-20230409   gcc  
parisc               randconfig-r031-20230412   gcc  
parisc               randconfig-r032-20230409   gcc  
parisc               randconfig-r033-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     kilauea_defconfig   clang
powerpc                      makalu_defconfig   gcc  
powerpc                mpc7448_hpc2_defconfig   gcc  
powerpc                    mvme5100_defconfig   clang
powerpc                      ppc44x_defconfig   clang
powerpc              randconfig-r003-20230410   clang
powerpc              randconfig-r026-20230410   gcc  
powerpc              randconfig-r034-20230409   clang
powerpc              randconfig-r035-20230413   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230409   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230410   gcc  
riscv                randconfig-r031-20230410   clang
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                randconfig-r042-20230412   gcc  
riscv                randconfig-r042-20230413   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230409   clang
s390                 randconfig-r003-20230414   clang
s390                 randconfig-r004-20230410   clang
s390                 randconfig-r004-20230414   clang
s390                 randconfig-r005-20230413   gcc  
s390                 randconfig-r023-20230409   gcc  
s390                 randconfig-r033-20230410   clang
s390                 randconfig-r035-20230410   clang
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
s390                 randconfig-r044-20230412   gcc  
s390                 randconfig-r044-20230413   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230410   gcc  
sh           buildonly-randconfig-r005-20230413   gcc  
sh                   randconfig-r003-20230414   gcc  
sh                   randconfig-r006-20230414   gcc  
sh                   randconfig-r012-20230410   gcc  
sh                   randconfig-r014-20230409   gcc  
sh                   randconfig-r015-20230409   gcc  
sh                   randconfig-r023-20230410   gcc  
sh                   randconfig-r026-20230409   gcc  
sh                   randconfig-r032-20230410   gcc  
sh                   randconfig-r032-20230412   gcc  
sh                   randconfig-r034-20230410   gcc  
sh                           se7722_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230409   gcc  
sparc                randconfig-r035-20230409   gcc  
sparc                randconfig-r036-20230409   gcc  
sparc64      buildonly-randconfig-r001-20230409   gcc  
sparc64      buildonly-randconfig-r002-20230413   gcc  
sparc64              randconfig-r006-20230409   gcc  
sparc64              randconfig-r021-20230409   gcc  
sparc64              randconfig-r022-20230410   gcc  
sparc64              randconfig-r031-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64               randconfig-r025-20230410   gcc  
x86_64               randconfig-r034-20230410   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230410   gcc  
xtensa               randconfig-r033-20230410   gcc  
xtensa               randconfig-r035-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
