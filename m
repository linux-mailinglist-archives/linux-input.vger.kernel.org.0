Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7F276CDE0
	for <lists+linux-input@lfdr.de>; Wed,  2 Aug 2023 15:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjHBNHS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Aug 2023 09:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbjHBNHR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Aug 2023 09:07:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE2A268D
        for <linux-input@vger.kernel.org>; Wed,  2 Aug 2023 06:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690981635; x=1722517635;
  h=date:from:to:cc:subject:message-id;
  bh=Yn2cyvUxiNJFeHRf1tCYOZBqMlNkAsK21Z3nT4c8RSc=;
  b=WrJ9s4JlqeyB+S4RfdcIJryk3vNDXvWktDZQkhI5MrSH9Ce9ECVSevKT
   nT6Kjo1lvTk4wWLRicpRbGOJWZ30LBpLdh69fxIBFbeUckNWj7vkFfqwJ
   ALmhgdCMV1cGYuv619Mj3ZrGfJQeEN19LT9AOw4uF2njDW6xHVaZ5R3lc
   LWCW9Otg2vRfAZkHpVs56Wxmz2XLoGW0re7qgD2UjRdlzkzVWgWbtNdw7
   5UYhqL1CvGQOCd+79AX9zJV94RbjRMxlIAnWAkoMIlI49nm3TM++BpCeo
   v8E/sNmvKBTjA+LOQFyeWwRa7q+A1QrbvLzAlWqWZl+Kdnz1crx6NTg0f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368484545"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="368484545"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:07:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="843128643"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="843128643"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2023 06:07:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qRBZ8-0001DA-2G;
        Wed, 02 Aug 2023 13:07:02 +0000
Date:   Wed, 02 Aug 2023 21:06:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 54116d442e001e1b6bd482122043b1870998a1f3
Message-ID: <202308022112.R9zAxzbZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 54116d442e001e1b6bd482122043b1870998a1f3  Input: rpckbd - fix the return value handle for platform_get_irq()

elapsed time: 726m

configs tested: 146
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230731   gcc  
alpha                randconfig-r032-20230731   gcc  
alpha                randconfig-r036-20230731   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r026-20230731   gcc  
arc                  randconfig-r043-20230731   gcc  
arc                  randconfig-r043-20230801   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230801   clang
arm                  randconfig-r024-20230731   gcc  
arm                  randconfig-r033-20230731   clang
arm                  randconfig-r034-20230731   clang
arm                  randconfig-r046-20230731   gcc  
arm                  randconfig-r046-20230801   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230731   gcc  
arm64                randconfig-r033-20230731   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230801   gcc  
csky                 randconfig-r031-20230731   gcc  
hexagon              randconfig-r003-20230731   clang
hexagon              randconfig-r012-20230731   clang
hexagon              randconfig-r015-20230731   clang
hexagon              randconfig-r016-20230801   clang
hexagon              randconfig-r021-20230731   clang
hexagon              randconfig-r041-20230731   clang
hexagon              randconfig-r041-20230801   clang
hexagon              randconfig-r045-20230731   clang
hexagon              randconfig-r045-20230801   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r004-20230802   clang
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r005-20230802   clang
i386         buildonly-randconfig-r006-20230731   gcc  
i386         buildonly-randconfig-r006-20230802   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230731   gcc  
i386                 randconfig-i002-20230731   gcc  
i386                 randconfig-i003-20230731   gcc  
i386                 randconfig-i004-20230731   gcc  
i386                 randconfig-i005-20230731   gcc  
i386                 randconfig-i006-20230731   gcc  
i386                 randconfig-i011-20230801   clang
i386                 randconfig-i012-20230801   clang
i386                 randconfig-i013-20230801   clang
i386                 randconfig-i014-20230801   clang
i386                 randconfig-i015-20230801   clang
i386                 randconfig-i016-20230801   clang
i386                 randconfig-r014-20230731   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r005-20230801   gcc  
microblaze           randconfig-r013-20230801   gcc  
microblaze           randconfig-r025-20230731   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r011-20230801   gcc  
mips                 randconfig-r022-20230731   gcc  
mips                 randconfig-r036-20230731   clang
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230801   gcc  
nios2                randconfig-r011-20230731   gcc  
openrisc             randconfig-r003-20230731   gcc  
openrisc             randconfig-r032-20230731   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230731   gcc  
parisc               randconfig-r024-20230731   gcc  
parisc               randconfig-r036-20230731   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r004-20230731   gcc  
powerpc              randconfig-r014-20230801   clang
powerpc              randconfig-r035-20230731   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230731   gcc  
riscv                randconfig-r021-20230731   clang
riscv                randconfig-r031-20230731   gcc  
riscv                randconfig-r042-20230731   clang
riscv                randconfig-r042-20230801   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230801   clang
s390                 randconfig-r031-20230731   gcc  
s390                 randconfig-r044-20230731   clang
s390                 randconfig-r044-20230801   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230731   gcc  
sh                   randconfig-r006-20230801   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230731   gcc  
sparc                randconfig-r003-20230801   gcc  
sparc64              randconfig-r001-20230731   gcc  
sparc64              randconfig-r013-20230731   gcc  
sparc64              randconfig-r016-20230731   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230731   gcc  
x86_64       buildonly-randconfig-r001-20230802   clang
x86_64       buildonly-randconfig-r002-20230731   gcc  
x86_64       buildonly-randconfig-r002-20230802   clang
x86_64       buildonly-randconfig-r003-20230731   gcc  
x86_64       buildonly-randconfig-r003-20230802   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230731   clang
x86_64               randconfig-x002-20230731   clang
x86_64               randconfig-x003-20230731   clang
x86_64               randconfig-x004-20230731   clang
x86_64               randconfig-x005-20230731   clang
x86_64               randconfig-x006-20230731   clang
x86_64               randconfig-x011-20230731   gcc  
x86_64               randconfig-x012-20230731   gcc  
x86_64               randconfig-x013-20230731   gcc  
x86_64               randconfig-x014-20230731   gcc  
x86_64               randconfig-x015-20230731   gcc  
x86_64               randconfig-x016-20230731   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r022-20230731   gcc  
xtensa               randconfig-r034-20230731   gcc  
xtensa               randconfig-r035-20230731   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
