Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCBC16D4E51
	for <lists+linux-input@lfdr.de>; Mon,  3 Apr 2023 18:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbjDCQsc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Apr 2023 12:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbjDCQsb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Apr 2023 12:48:31 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541492132
        for <linux-input@vger.kernel.org>; Mon,  3 Apr 2023 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680540508; x=1712076508;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0IaWyzHRiZmq9d9Y+J8p4k1/9Cel2Oqdh4sThicP9+w=;
  b=luR+UE2yl6ZjkMA7IX0sEx8Tlq4tpdfeYO0qaAd5I/AWdrv9SIbFeHk4
   GZiBueUck9x2d95iq1+sWiW4nWsHbQCHkpVs4hYRcaSxlxnfFXjdmjQRl
   89AQR40MXVqSb4DnaX7Wg5CDJRduSP/OJrwybZfHeIdHfinzt1DqxMOAe
   wmmakF6BF5ptSOjX1r6mAflIIwZdJW1m76sIKxQsgZTIsAc9pBwpdbjVy
   8vRPY3LWVFFJgpZoZJm5AXbt3rF59rN2vi+kOP5iqHD8E/efra+yU/3N/
   Bm4rv/KHkEdLqRBhCcZig9RInBmKiho9VVcI7BsXtnrFz3zvJItV0CIEW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339447951"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="339447951"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 09:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="1015784445"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="1015784445"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2023 09:48:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pjNM0-000OWj-1V;
        Mon, 03 Apr 2023 16:48:24 +0000
Date:   Tue, 04 Apr 2023 00:48:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 0df28e7166e803028c380c59dda530ffada0503c
Message-ID: <642b0351.04jQOcohBplYJRwq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 0df28e7166e803028c380c59dda530ffada0503c  Input: edt-ft5x06 - calculate points data length only once

elapsed time: 722m

configs tested: 187
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230402   gcc  
alpha        buildonly-randconfig-r005-20230402   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230403   gcc  
alpha                randconfig-r003-20230402   gcc  
alpha                randconfig-r012-20230402   gcc  
alpha                randconfig-r025-20230402   gcc  
alpha                randconfig-r025-20230403   gcc  
alpha                randconfig-r032-20230402   gcc  
alpha                randconfig-r032-20230403   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230402   gcc  
arc          buildonly-randconfig-r006-20230402   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230403   gcc  
arc                  randconfig-r011-20230402   gcc  
arc                  randconfig-r015-20230403   gcc  
arc                  randconfig-r016-20230403   gcc  
arc                  randconfig-r033-20230402   gcc  
arc                  randconfig-r043-20230402   gcc  
arc                  randconfig-r043-20230403   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230403   clang
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230402   clang
arm                  randconfig-r005-20230403   gcc  
arm                  randconfig-r011-20230403   clang
arm                  randconfig-r033-20230403   gcc  
arm                  randconfig-r036-20230403   gcc  
arm                  randconfig-r046-20230402   gcc  
arm                  randconfig-r046-20230403   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230403   clang
arm64        buildonly-randconfig-r004-20230402   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230402   clang
arm64                randconfig-r014-20230403   gcc  
arm64                randconfig-r021-20230403   gcc  
arm64                randconfig-r022-20230403   gcc  
arm64                randconfig-r023-20230402   clang
arm64                randconfig-r026-20230403   gcc  
csky         buildonly-randconfig-r003-20230402   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230403   gcc  
csky                 randconfig-r015-20230403   gcc  
csky                 randconfig-r035-20230403   gcc  
hexagon      buildonly-randconfig-r004-20230403   clang
hexagon              randconfig-r023-20230402   clang
hexagon              randconfig-r025-20230402   clang
hexagon              randconfig-r026-20230402   clang
hexagon              randconfig-r032-20230402   clang
hexagon              randconfig-r041-20230402   clang
hexagon              randconfig-r041-20230403   clang
hexagon              randconfig-r045-20230402   clang
hexagon              randconfig-r045-20230403   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r005-20230403   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230403   clang
i386                 randconfig-a002-20230403   clang
i386                 randconfig-a003-20230403   clang
i386                 randconfig-a004-20230403   clang
i386                 randconfig-a005-20230403   clang
i386                 randconfig-a006-20230403   clang
i386                 randconfig-a011-20230403   gcc  
i386                 randconfig-a012-20230403   gcc  
i386                 randconfig-a013-20230403   gcc  
i386                 randconfig-a014-20230403   gcc  
i386                 randconfig-a015-20230403   gcc  
i386                 randconfig-a016-20230403   gcc  
i386                 randconfig-r003-20230403   clang
i386                 randconfig-r032-20230403   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230402   gcc  
ia64                 randconfig-r005-20230402   gcc  
ia64                 randconfig-r023-20230403   gcc  
ia64                 randconfig-r024-20230403   gcc  
ia64                 randconfig-r031-20230402   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230402   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230403   gcc  
loongarch            randconfig-r014-20230402   gcc  
loongarch            randconfig-r015-20230402   gcc  
loongarch            randconfig-r024-20230403   gcc  
loongarch            randconfig-r031-20230403   gcc  
loongarch            randconfig-r033-20230403   gcc  
loongarch            randconfig-r034-20230402   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230403   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230402   gcc  
m68k                 randconfig-r003-20230403   gcc  
m68k                 randconfig-r033-20230402   gcc  
microblaze   buildonly-randconfig-r002-20230402   gcc  
microblaze           randconfig-r004-20230403   gcc  
microblaze           randconfig-r021-20230402   gcc  
microblaze           randconfig-r035-20230402   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r012-20230403   clang
mips                 randconfig-r036-20230402   clang
mips                 randconfig-r036-20230403   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230402   gcc  
nios2                randconfig-r013-20230403   gcc  
openrisc     buildonly-randconfig-r004-20230402   gcc  
openrisc             randconfig-r001-20230402   gcc  
openrisc             randconfig-r001-20230403   gcc  
openrisc             randconfig-r014-20230403   gcc  
openrisc             randconfig-r034-20230402   gcc  
parisc       buildonly-randconfig-r003-20230403   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230402   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r006-20230403   gcc  
powerpc              randconfig-r001-20230402   gcc  
powerpc              randconfig-r002-20230402   gcc  
powerpc              randconfig-r006-20230403   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230403   gcc  
riscv        buildonly-randconfig-r004-20230403   gcc  
riscv        buildonly-randconfig-r006-20230402   clang
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230402   gcc  
riscv                randconfig-r022-20230402   clang
riscv                randconfig-r022-20230403   gcc  
riscv                randconfig-r024-20230402   clang
riscv                randconfig-r026-20230403   gcc  
riscv                randconfig-r036-20230402   gcc  
riscv                randconfig-r042-20230402   clang
riscv                randconfig-r042-20230403   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230402   gcc  
s390                 randconfig-r011-20230403   gcc  
s390                 randconfig-r013-20230403   gcc  
s390                 randconfig-r025-20230403   gcc  
s390                 randconfig-r034-20230403   clang
s390                 randconfig-r035-20230403   clang
s390                 randconfig-r044-20230402   clang
s390                 randconfig-r044-20230403   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r022-20230402   gcc  
sparc        buildonly-randconfig-r005-20230403   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230403   gcc  
sparc                randconfig-r021-20230403   gcc  
sparc                randconfig-r024-20230402   gcc  
sparc64      buildonly-randconfig-r003-20230402   gcc  
sparc64              randconfig-r015-20230402   gcc  
sparc64              randconfig-r031-20230403   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230403   clang
x86_64               randconfig-a002-20230403   clang
x86_64               randconfig-a003-20230403   clang
x86_64               randconfig-a004-20230403   clang
x86_64               randconfig-a005-20230403   clang
x86_64               randconfig-a006-20230403   clang
x86_64               randconfig-a011-20230403   gcc  
x86_64               randconfig-a012-20230403   gcc  
x86_64               randconfig-a013-20230403   gcc  
x86_64               randconfig-a014-20230403   gcc  
x86_64               randconfig-a015-20230403   gcc  
x86_64               randconfig-a016-20230403   gcc  
x86_64               randconfig-r005-20230403   clang
x86_64               randconfig-r012-20230403   gcc  
x86_64               randconfig-r034-20230403   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230402   gcc  
xtensa               randconfig-r004-20230402   gcc  
xtensa               randconfig-r016-20230402   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
