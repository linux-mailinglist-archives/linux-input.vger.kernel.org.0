Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB2E6C8046
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 15:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbjCXOtK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Mar 2023 10:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbjCXOtG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Mar 2023 10:49:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B02170D
        for <linux-input@vger.kernel.org>; Fri, 24 Mar 2023 07:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679669331; x=1711205331;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KGm1ncnyUPWzG1oqbSuiN2kkNLflFG9ssy7DyjYbnC0=;
  b=QVQoW3ZRGMHbjzztVap5G51oX2HQvpqYj11Sbv0vseSluRIfAKQJ8wBj
   0ynER4OatlI7venkUGc2AgJAzAmc0ilrHL0qXYhvBXKZuD9HrHl4an08E
   uuBK4KrvhFIympVtL8phbx16bp1UzneS2J7OVFW2srYaxXtRN8GgcsxeM
   KOJlRx6VPOfAz2/S0OTJV/1gRpFx2Td6COGugbNZORmbCWHcGzOcZHm5m
   JdSPAzJKZtEDfL3Ki/Q/fj1FSpa+gclGcm3ZzZqGX2pIEBOnrAl8XVr2A
   qFw/m6C96cG+M4fYYaOPwPOIiozNSz9ziJD5fq+xDScfpcdUMTePmsiwQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="341358663"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="341358663"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 07:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="682730655"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="682730655"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Mar 2023 07:48:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfiiI-000FNk-0r;
        Fri, 24 Mar 2023 14:48:18 +0000
Date:   Fri, 24 Mar 2023 22:47:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 77987b872fcfeaf36b4760fe5d77a0cf9ac7fdbe
Message-ID: <641db810.3Ij2mBqyoSRZt4Rd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 77987b872fcfeaf36b4760fe5d77a0cf9ac7fdbe  dt-bindings: input: Drop unneeded quotes

elapsed time: 726m

configs tested: 152
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230322   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230322   gcc  
arc                  randconfig-r021-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230322   gcc  
arm                  randconfig-r011-20230322   clang
arm                  randconfig-r014-20230323   gcc  
arm                  randconfig-r023-20230322   clang
arm                  randconfig-r025-20230322   clang
arm                  randconfig-r032-20230322   gcc  
arm                  randconfig-r036-20230324   gcc  
arm                  randconfig-r046-20230322   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230322   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r024-20230322   gcc  
csky                 randconfig-r026-20230322   gcc  
hexagon              randconfig-r003-20230322   clang
hexagon              randconfig-r031-20230322   clang
hexagon              randconfig-r033-20230324   clang
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
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
ia64         buildonly-randconfig-r005-20230322   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r015-20230322   gcc  
ia64                 randconfig-r025-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230322   gcc  
loongarch    buildonly-randconfig-r003-20230322   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r032-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230322   gcc  
m68k         buildonly-randconfig-r002-20230322   gcc  
m68k         buildonly-randconfig-r006-20230322   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230322   gcc  
m68k                 randconfig-r026-20230322   gcc  
m68k                 randconfig-r034-20230322   gcc  
microblaze   buildonly-randconfig-r004-20230322   gcc  
microblaze   buildonly-randconfig-r006-20230322   gcc  
microblaze           randconfig-r021-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                 randconfig-r004-20230322   gcc  
mips                 randconfig-r005-20230322   gcc  
mips                 randconfig-r012-20230323   gcc  
mips                 randconfig-r021-20230322   clang
nios2        buildonly-randconfig-r005-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230322   gcc  
nios2                randconfig-r016-20230322   gcc  
nios2                randconfig-r016-20230323   gcc  
nios2                randconfig-r033-20230322   gcc  
nios2                randconfig-r036-20230322   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r014-20230322   gcc  
openrisc             randconfig-r023-20230322   gcc  
parisc       buildonly-randconfig-r005-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230323   gcc  
parisc               randconfig-r024-20230322   gcc  
parisc               randconfig-r025-20230322   gcc  
parisc               randconfig-r034-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230322   gcc  
powerpc              randconfig-r011-20230323   clang
powerpc              randconfig-r013-20230322   gcc  
powerpc              randconfig-r015-20230322   gcc  
powerpc              randconfig-r015-20230323   clang
powerpc              randconfig-r035-20230322   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230322   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230322   clang
riscv                randconfig-r003-20230322   clang
riscv                randconfig-r021-20230322   gcc  
riscv                randconfig-r022-20230322   gcc  
riscv                randconfig-r034-20230324   clang
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230322   gcc  
s390                 randconfig-r022-20230322   gcc  
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230322   gcc  
sparc        buildonly-randconfig-r001-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230322   gcc  
sparc                randconfig-r016-20230322   gcc  
sparc64      buildonly-randconfig-r002-20230322   gcc  
sparc64              randconfig-r001-20230322   gcc  
sparc64              randconfig-r022-20230322   gcc  
sparc64              randconfig-r031-20230322   gcc  
sparc64              randconfig-r035-20230324   gcc  
sparc64              randconfig-r036-20230322   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230322   gcc  
xtensa               randconfig-r012-20230322   gcc  
xtensa               randconfig-r013-20230322   gcc  
xtensa               randconfig-r032-20230324   gcc  
xtensa               randconfig-r035-20230322   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
