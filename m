Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2536C2161
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 20:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjCTT3e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Mar 2023 15:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjCTT3J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Mar 2023 15:29:09 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA6F303D9
        for <linux-input@vger.kernel.org>; Mon, 20 Mar 2023 12:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679340064; x=1710876064;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3XC6AiZmgPbtl6YVoiHkJXMC6m4bA3yy95YxRSb7yaQ=;
  b=lMqOM4KTHTujxRkAPve9WHuHVNeGe74yJ+x6lMiO+r3bwqoNh/bq7PPK
   JkFj1yPHPzVRlc9o3N3ntyR9H/gNwbJ4AXP6CGuYqyTVBMnVDA1fxDinx
   lWEYQwfyEx0ARPXYi/EZiM3ntcluL+/8/QqdI/elZPkeb1320Uhev+AU3
   3UYl+VmBpQyHK9s/AlVIrURb36iczm9k1fjttR80NkmH37qqPmQb5JATY
   yaYEzGU23xlKc+CTAEhG80PvirDi0DojUaZPpekj+fNcXDkiTmXRFsR3u
   p6oTE1trit+zLBFUZm+qqqiu19i//6r0K0VT7fb0Rm6sbJYrY5p3MKH8H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338783370"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="338783370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 12:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="713667694"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="713667694"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Mar 2023 12:20:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peL3u-000BFm-15;
        Mon, 20 Mar 2023 19:20:54 +0000
Date:   Tue, 21 Mar 2023 03:20:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 754ff5060daf5a1cf4474eff9b4edeb6c17ef7ab
Message-ID: <6418b20f.AoCrLkb02cGi7D0V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 754ff5060daf5a1cf4474eff9b4edeb6c17ef7ab  Input: alps - fix compatibility with -funsigned-char

elapsed time: 725m

configs tested: 296
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230320   gcc  
alpha        buildonly-randconfig-r004-20230320   gcc  
alpha        buildonly-randconfig-r005-20230319   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230320   gcc  
alpha                randconfig-r013-20230320   gcc  
alpha                randconfig-r023-20230319   gcc  
alpha                randconfig-r024-20230320   gcc  
alpha                randconfig-r033-20230319   gcc  
alpha                randconfig-r036-20230319   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230313   gcc  
arc          buildonly-randconfig-r004-20230313   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r003-20230320   gcc  
arc                  randconfig-r006-20230319   gcc  
arc                  randconfig-r015-20230320   gcc  
arc                  randconfig-r016-20230320   gcc  
arc                  randconfig-r024-20230319   gcc  
arc                  randconfig-r043-20230319   gcc  
arc                  randconfig-r043-20230320   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                  randconfig-r003-20230319   clang
arm                  randconfig-r012-20230319   gcc  
arm                  randconfig-r025-20230319   gcc  
arm                  randconfig-r046-20230319   gcc  
arm                  randconfig-r046-20230320   clang
arm                           stm32_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230319   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230320   clang
csky                             alldefconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230319   gcc  
csky                 randconfig-r002-20230320   gcc  
csky                 randconfig-r003-20230319   gcc  
csky                 randconfig-r006-20230319   gcc  
csky                 randconfig-r012-20230319   gcc  
csky                 randconfig-r014-20230319   gcc  
csky                 randconfig-r022-20230319   gcc  
csky                 randconfig-r026-20230319   gcc  
csky                 randconfig-r031-20230319   gcc  
csky                 randconfig-r035-20230320   gcc  
hexagon      buildonly-randconfig-r001-20230319   clang
hexagon      buildonly-randconfig-r003-20230319   clang
hexagon              randconfig-r004-20230320   clang
hexagon              randconfig-r016-20230319   clang
hexagon              randconfig-r032-20230319   clang
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r041-20230320   clang
hexagon              randconfig-r045-20230319   clang
hexagon              randconfig-r045-20230320   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230313   gcc  
i386                         debian-10.3-func   gcc  
i386                   debian-10.3-kselftests   gcc  
i386                        debian-10.3-kunit   gcc  
i386                          debian-10.3-kvm   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230320   clang
i386                 randconfig-a002-20230320   clang
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230320   clang
i386                 randconfig-a004-20230320   clang
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230320   clang
i386                 randconfig-a006-20230320   clang
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230320   gcc  
i386                          randconfig-a011   clang
i386                 randconfig-a012-20230320   gcc  
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230320   gcc  
i386                          randconfig-a013   clang
i386                 randconfig-a014-20230320   gcc  
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230320   gcc  
i386                          randconfig-a015   clang
i386                 randconfig-a016-20230320   gcc  
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230319   gcc  
ia64         buildonly-randconfig-r006-20230312   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230319   gcc  
ia64                 randconfig-r021-20230319   gcc  
ia64                 randconfig-r024-20230319   gcc  
ia64                 randconfig-r033-20230319   gcc  
ia64                 randconfig-r036-20230320   gcc  
ia64                          tiger_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230320   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230319   gcc  
loongarch            randconfig-r005-20230319   gcc  
loongarch            randconfig-r006-20230319   gcc  
loongarch            randconfig-r013-20230319   gcc  
loongarch            randconfig-r015-20230319   gcc  
loongarch            randconfig-r015-20230320   gcc  
loongarch            randconfig-r021-20230320   gcc  
loongarch            randconfig-r022-20230319   gcc  
loongarch            randconfig-r025-20230320   gcc  
loongarch            randconfig-r026-20230320   gcc  
loongarch            randconfig-r032-20230319   gcc  
m68k                             allmodconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230319   gcc  
m68k                 randconfig-r012-20230320   gcc  
m68k                 randconfig-r014-20230319   gcc  
m68k                 randconfig-r026-20230319   gcc  
m68k                 randconfig-r031-20230319   gcc  
m68k                           virt_defconfig   gcc  
microblaze   buildonly-randconfig-r006-20230319   gcc  
microblaze           randconfig-r003-20230319   gcc  
microblaze           randconfig-r014-20230319   gcc  
microblaze           randconfig-r026-20230319   gcc  
microblaze           randconfig-r032-20230319   gcc  
microblaze           randconfig-r034-20230319   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230320   gcc  
mips         buildonly-randconfig-r004-20230312   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                 randconfig-r005-20230319   clang
mips                 randconfig-r005-20230320   gcc  
mips                 randconfig-r011-20230320   clang
mips                 randconfig-r013-20230319   gcc  
mips                 randconfig-r014-20230320   clang
mips                 randconfig-r026-20230319   gcc  
mips                 randconfig-r034-20230320   gcc  
mips                 randconfig-r036-20230319   clang
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230319   gcc  
nios2                randconfig-r003-20230319   gcc  
nios2                randconfig-r023-20230320   gcc  
nios2                randconfig-r025-20230319   gcc  
nios2                randconfig-r034-20230319   gcc  
nios2                randconfig-r036-20230319   gcc  
openrisc             randconfig-r001-20230319   gcc  
openrisc             randconfig-r021-20230319   gcc  
openrisc             randconfig-r022-20230319   gcc  
openrisc             randconfig-r023-20230319   gcc  
openrisc             randconfig-r024-20230319   gcc  
openrisc             randconfig-r025-20230319   gcc  
openrisc             randconfig-r034-20230319   gcc  
openrisc             randconfig-r035-20230319   gcc  
parisc       buildonly-randconfig-r005-20230313   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230319   gcc  
parisc               randconfig-r011-20230319   gcc  
parisc               randconfig-r015-20230319   gcc  
parisc               randconfig-r022-20230319   gcc  
parisc               randconfig-r025-20230319   gcc  
parisc               randconfig-r025-20230320   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230319   clang
powerpc      buildonly-randconfig-r004-20230319   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                        icon_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
powerpc                 mpc834x_mds_defconfig   gcc  
powerpc                 mpc85xx_cds_defconfig   gcc  
powerpc              randconfig-r002-20230319   gcc  
powerpc              randconfig-r005-20230319   gcc  
powerpc              randconfig-r006-20230319   gcc  
powerpc              randconfig-r013-20230320   gcc  
powerpc              randconfig-r021-20230320   gcc  
powerpc              randconfig-r033-20230319   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230312   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r001-20230320   clang
riscv                randconfig-r002-20230319   gcc  
riscv                randconfig-r004-20230319   gcc  
riscv                randconfig-r005-20230319   gcc  
riscv                randconfig-r006-20230319   gcc  
riscv                randconfig-r016-20230319   clang
riscv                randconfig-r016-20230320   gcc  
riscv                randconfig-r023-20230319   clang
riscv                randconfig-r032-20230319   gcc  
riscv                randconfig-r036-20230319   gcc  
riscv                randconfig-r042-20230319   clang
riscv                randconfig-r042-20230320   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230319   clang
s390                                defconfig   gcc  
s390                 randconfig-r004-20230320   clang
s390                 randconfig-r006-20230320   clang
s390                 randconfig-r014-20230319   clang
s390                 randconfig-r021-20230319   clang
s390                 randconfig-r044-20230319   clang
s390                 randconfig-r044-20230320   gcc  
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh           buildonly-randconfig-r004-20230319   gcc  
sh           buildonly-randconfig-r005-20230312   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r005-20230320   gcc  
sh                   randconfig-r011-20230319   gcc  
sh                   randconfig-r023-20230319   gcc  
sh                   randconfig-r032-20230319   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230319   gcc  
sparc                randconfig-r002-20230319   gcc  
sparc                randconfig-r002-20230320   gcc  
sparc                randconfig-r004-20230319   gcc  
sparc                randconfig-r012-20230319   gcc  
sparc                randconfig-r015-20230319   gcc  
sparc                randconfig-r016-20230319   gcc  
sparc                randconfig-r021-20230319   gcc  
sparc                randconfig-r024-20230320   gcc  
sparc                randconfig-r031-20230319   gcc  
sparc                randconfig-r035-20230319   gcc  
sparc64      buildonly-randconfig-r005-20230319   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r001-20230320   gcc  
sparc64              randconfig-r011-20230319   gcc  
sparc64              randconfig-r026-20230320   gcc  
sparc64              randconfig-r033-20230319   gcc  
sparc64              randconfig-r035-20230319   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230320   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230320   clang
x86_64                        randconfig-a002   gcc  
x86_64               randconfig-a003-20230320   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230320   clang
x86_64                        randconfig-a004   gcc  
x86_64               randconfig-a005-20230320   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230320   clang
x86_64                        randconfig-a006   gcc  
x86_64               randconfig-a011-20230320   gcc  
x86_64                        randconfig-a011   gcc  
x86_64               randconfig-a012-20230320   gcc  
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230320   gcc  
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230320   gcc  
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230320   gcc  
x86_64                        randconfig-a015   gcc  
x86_64               randconfig-a016-20230320   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r006-20230320   clang
x86_64               randconfig-r022-20230320   gcc  
x86_64               randconfig-r023-20230320   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                              defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r001-20230319   gcc  
xtensa               randconfig-r003-20230319   gcc  
xtensa               randconfig-r004-20230319   gcc  
xtensa               randconfig-r011-20230320   gcc  
xtensa               randconfig-r013-20230319   gcc  
xtensa               randconfig-r031-20230319   gcc  
xtensa               randconfig-r033-20230320   gcc  
xtensa               randconfig-r034-20230319   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
