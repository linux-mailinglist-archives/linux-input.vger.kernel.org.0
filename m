Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41FC26F458C
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 15:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbjEBNvj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 May 2023 09:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjEBNvi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 May 2023 09:51:38 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C2E170A
        for <linux-input@vger.kernel.org>; Tue,  2 May 2023 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683035487; x=1714571487;
  h=date:from:to:cc:subject:message-id;
  bh=ZFYwo+jIcnwtwBOHm1MaHb3TBRKR1tymJZvM6sO6qXE=;
  b=d4Yczbmk3B8ME5SFHfF7SQ/hjkRHPonbj75GrzLV1ljGwt+qfW9Crl7d
   Nsv7kKO50bHCqN6Ai3j6j/kQOyYHNhsu8TLLyeIQP+rpg2z1xlyYjBv2C
   7eU+7BXNpsGPjGVrGwVbvK1rJFsks2/+HAa+URjCUt/e8KQrDeo62j8bz
   zh4FzjTdSjnPE5gtzId0E2k5tmb12hQ9hzpuOkG3BJHcrBHxRqxx/Gjhj
   ktXG5Hj7DeD9N6+WhCieF+r9M8c/I1EvfWdGVkDeuZsLfLbIiVqLwskAG
   kxR/2pJli6LUlML3iuOnfWingjUzP4hvfWk4HyMtOcwYpkOVoG/gNP5O7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="434716704"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="434716704"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 06:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026079888"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="1026079888"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 May 2023 06:51:26 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ptqPd-00015Q-1e;
        Tue, 02 May 2023 13:51:25 +0000
Date:   Tue, 02 May 2023 21:50:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 529de2f1ca3f0898c0d905b7d355a43dce1de7dc
Message-ID: <20230502135046.4Jyr6%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 529de2f1ca3f0898c0d905b7d355a43dce1de7dc  Input: cyttsp5 - fix array length

elapsed time: 724m

configs tested: 138
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230501   gcc  
alpha                randconfig-r036-20230501   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230501   gcc  
arc                  randconfig-r012-20230430   gcc  
arc                  randconfig-r016-20230502   gcc  
arc                  randconfig-r025-20230430   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r022-20230430   gcc  
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230430   gcc  
arm64                randconfig-r013-20230502   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230501   gcc  
csky                 randconfig-r012-20230502   gcc  
csky                 randconfig-r021-20230430   gcc  
hexagon              randconfig-r031-20230501   clang
hexagon              randconfig-r041-20230430   clang
hexagon              randconfig-r041-20230501   clang
hexagon              randconfig-r045-20230430   clang
hexagon              randconfig-r045-20230501   clang
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
i386                 randconfig-r025-20230501   clang
i386                 randconfig-r026-20230501   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230501   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r023-20230501   gcc  
loongarch            randconfig-r026-20230430   gcc  
loongarch            randconfig-r031-20230430   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230501   gcc  
m68k                 randconfig-r034-20230430   gcc  
microblaze   buildonly-randconfig-r005-20230430   gcc  
microblaze           randconfig-r013-20230430   gcc  
microblaze           randconfig-r016-20230430   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230501   clang
mips                 randconfig-r006-20230501   clang
mips                 randconfig-r014-20230502   clang
nios2        buildonly-randconfig-r002-20230501   gcc  
nios2        buildonly-randconfig-r004-20230430   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230501   gcc  
nios2                randconfig-r032-20230501   gcc  
openrisc     buildonly-randconfig-r006-20230430   gcc  
openrisc             randconfig-r015-20230502   gcc  
openrisc             randconfig-r035-20230430   gcc  
openrisc             randconfig-r036-20230430   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230430   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r033-20230501   gcc  
powerpc              randconfig-r035-20230501   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230430   gcc  
riscv                randconfig-r004-20230430   gcc  
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230501   clang
s390                                defconfig   gcc  
s390                 randconfig-r032-20230430   gcc  
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r011-20230502   gcc  
sh                   randconfig-r021-20230501   gcc  
sh                   randconfig-r024-20230430   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r001-20230430   gcc  
sparc64              randconfig-r002-20230501   gcc  
sparc64              randconfig-r013-20230501   gcc  
sparc64              randconfig-r023-20230430   gcc  
sparc64              randconfig-r033-20230430   gcc  
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
x86_64                        randconfig-k001   clang
x86_64               randconfig-r005-20230501   gcc  
x86_64               randconfig-r012-20230501   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230430   gcc  
xtensa       buildonly-randconfig-r006-20230501   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
