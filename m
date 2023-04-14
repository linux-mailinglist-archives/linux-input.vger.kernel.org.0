Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F696E2ADB
	for <lists+linux-input@lfdr.de>; Fri, 14 Apr 2023 21:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjDNT7A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Apr 2023 15:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjDNT67 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Apr 2023 15:58:59 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A7E5FEE
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681502328; x=1713038328;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7wZGVXkqRMTr6peeWtFGHnzVmuTGKSXs0rpky0knI3Q=;
  b=aOiMLhzCu0W/U7qdXGusWEx8IQf8Ut+Rk04PEnYifl1LzOcqC/Bbb9AE
   jgCn0Ak1XO2M7vc3i6vs79txiOe7kjgxlgWUD7Aq+TLq486kNzu4VWbYo
   /rGakgSoo9PR+BrGAaL90NrdUrMyYBh8lLHLRz3uo5IWV+aAY/WXhZD2P
   pN6ta31ASVtOreTMyyzESN9wdrWZCyDkGJO+fSvA2l/v/ogOgFi3DQVSL
   JxtBmFGARXedaS7hznrq0UA/d4lW6FSvRK3tCdydf+ACXGj0XegRII5D6
   DKw8BXZZURyqayEo32iCXSQr9rz7EymI+qv2SFlo/aVsVv3ped+y9KHiX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="347283629"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="347283629"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 12:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="801323536"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="801323536"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2023 12:58:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pnPZG-000Zt3-0I;
        Fri, 14 Apr 2023 19:58:46 +0000
Date:   Sat, 15 Apr 2023 03:57:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 5dc63e56a9cf8df0b59c234a505a1653f1bdf885
Message-ID: <6439b03b.eaUl/yGqbFTpdh8C%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 5dc63e56a9cf8df0b59c234a505a1653f1bdf885  Input: cyttsp5 - fix sensing configuration data structure

elapsed time: 723m

configs tested: 142
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230410   gcc  
alpha                randconfig-r034-20230412   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r026-20230409   gcc  
arc                  randconfig-r031-20230410   gcc  
arc                  randconfig-r032-20230410   gcc  
arc                  randconfig-r033-20230409   gcc  
arc                  randconfig-r036-20230413   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arc                  randconfig-r043-20230412   gcc  
arc                  randconfig-r043-20230413   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r025-20230409   clang
arm                  randconfig-r033-20230412   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm                  randconfig-r046-20230412   clang
arm                  randconfig-r046-20230413   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230409   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230409   gcc  
csky                 randconfig-r034-20230414   gcc  
hexagon              randconfig-r033-20230414   clang
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
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r034-20230410   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230409   gcc  
loongarch            randconfig-r026-20230410   gcc  
loongarch            randconfig-r032-20230414   gcc  
loongarch            randconfig-r034-20230410   gcc  
loongarch            randconfig-r035-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r022-20230410   gcc  
m68k                 randconfig-r036-20230409   gcc  
microblaze           randconfig-r023-20230409   gcc  
microblaze           randconfig-r036-20230410   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r032-20230413   clang
mips                 randconfig-r034-20230409   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r034-20230413   gcc  
nios2                randconfig-r035-20230409   gcc  
openrisc             randconfig-r036-20230414   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230412   gcc  
parisc               randconfig-r032-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    mvme5100_defconfig   clang
powerpc              randconfig-r021-20230410   gcc  
powerpc              randconfig-r033-20230413   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r024-20230410   gcc  
riscv                randconfig-r035-20230410   clang
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                randconfig-r042-20230412   gcc  
riscv                randconfig-r042-20230413   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230409   gcc  
s390                 randconfig-r035-20230414   clang
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
s390                 randconfig-r044-20230412   gcc  
s390                 randconfig-r044-20230413   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r032-20230412   gcc  
sh                   randconfig-r035-20230413   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230409   gcc  
sparc64              randconfig-r032-20230409   gcc  
sparc64              randconfig-r033-20230409   gcc  
sparc64              randconfig-r036-20230409   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r031-20230413   gcc  
xtensa               randconfig-r031-20230414   gcc  
xtensa               randconfig-r033-20230410   gcc  
xtensa               randconfig-r035-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
