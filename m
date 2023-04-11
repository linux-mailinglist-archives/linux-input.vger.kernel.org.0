Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31FB66DDBB6
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 15:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjDKNF5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 09:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjDKNFY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 09:05:24 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B2849D6
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681218315; x=1712754315;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vUaYXkPHH/Ws4kLps9xXe2WFiJeYIuhigM/6oIjZ2rA=;
  b=hNlPEG2fprvq9nkVj5Bl81eIs7AAa74FUpzer08H+fFxNCCqSjGM4Gdl
   33qg8QrrmWTSImb+m2iX2bwE7fA7YOLRqZx2ef21oTsyeSfEXh1JU+5W/
   WAG+Q4XTt1Ft/gl+mS0vrf0fHFIlVNPO0gEoaiB6O2Xymzkg3ezRrxqhn
   Ym7mpuB4fEgGehe8+KMCp3RQ6eZko4QCU94eIw0QmoQRxaOTXf2kKasPQ
   2Zvaj925dWNSm9oRdkkk1kLAPtvORlhNd7BtYeMvsc05J/P5ATSDrKYBu
   mFvQssdVQN/e0pomw8NddU+L33+WTNTIkBsh+70bkqPeDn+pEsccnal7M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="371459610"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="371459610"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 06:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018362171"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="1018362171"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 06:05:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pmDgM-000WJh-0z;
        Tue, 11 Apr 2023 13:05:10 +0000
Date:   Tue, 11 Apr 2023 21:04:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 483a14418661878d89216be0f02918892227833b
Message-ID: <64355aca.11PdjqCGVXAg+xNq%lkp@intel.com>
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
branch HEAD: 483a14418661878d89216be0f02918892227833b  Input: edt-ft5x06 - select REGMAP_I2C

elapsed time: 723m

configs tested: 163
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230409   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230409   gcc  
alpha                randconfig-r015-20230410   gcc  
alpha                randconfig-r023-20230410   gcc  
alpha                randconfig-r026-20230410   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230409   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230409   gcc  
arc                  randconfig-r012-20230410   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230409   clang
arm          buildonly-randconfig-r005-20230410   clang
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230411   clang
arm                  randconfig-r014-20230409   clang
arm                  randconfig-r016-20230409   clang
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230410   gcc  
arm64                randconfig-r036-20230410   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230411   gcc  
csky                 randconfig-r021-20230410   gcc  
hexagon      buildonly-randconfig-r001-20230409   clang
hexagon      buildonly-randconfig-r003-20230409   clang
hexagon              randconfig-r001-20230411   clang
hexagon              randconfig-r015-20230409   clang
hexagon              randconfig-r026-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
hexagon              randconfig-r045-20230411   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230410   clang
i386         buildonly-randconfig-r004-20230410   clang
i386         buildonly-randconfig-r006-20230410   clang
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
i386                 randconfig-r015-20230410   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230409   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r005-20230411   gcc  
ia64                 randconfig-r011-20230409   gcc  
ia64                 randconfig-r022-20230409   gcc  
ia64                 randconfig-r024-20230410   gcc  
ia64                 randconfig-r031-20230409   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230411   gcc  
loongarch            randconfig-r024-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r025-20230409   gcc  
microblaze           randconfig-r034-20230409   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230409   clang
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230411   gcc  
nios2                randconfig-r006-20230411   gcc  
nios2                randconfig-r024-20230409   gcc  
openrisc     buildonly-randconfig-r004-20230409   gcc  
openrisc             randconfig-r012-20230410   gcc  
openrisc             randconfig-r013-20230409   gcc  
openrisc             randconfig-r016-20230409   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230409   gcc  
parisc               randconfig-r023-20230409   gcc  
parisc               randconfig-r033-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230410   gcc  
powerpc      buildonly-randconfig-r006-20230409   gcc  
powerpc              randconfig-r011-20230410   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230410   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r016-20230410   gcc  
riscv                randconfig-r024-20230410   gcc  
riscv                randconfig-r025-20230410   gcc  
riscv                randconfig-r031-20230410   clang
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230409   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230411   gcc  
s390                 randconfig-r004-20230411   gcc  
s390                 randconfig-r015-20230409   gcc  
s390                 randconfig-r026-20230409   gcc  
s390                 randconfig-r035-20230410   clang
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
s390                 randconfig-r044-20230411   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230410   gcc  
sh                   randconfig-r021-20230409   gcc  
sh                   randconfig-r022-20230409   gcc  
sh                   randconfig-r025-20230409   gcc  
sh                   randconfig-r032-20230410   gcc  
sh                   randconfig-r034-20230410   gcc  
sparc        buildonly-randconfig-r004-20230410   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230409   gcc  
sparc                randconfig-r035-20230409   gcc  
sparc                randconfig-r036-20230409   gcc  
sparc64      buildonly-randconfig-r003-20230410   gcc  
sparc64              randconfig-r011-20230410   gcc  
sparc64              randconfig-r012-20230409   gcc  
sparc64              randconfig-r025-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64                        randconfig-k001   clang
x86_64               randconfig-r021-20230410   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230409   gcc  
xtensa               randconfig-r004-20230411   gcc  
xtensa               randconfig-r014-20230410   gcc  
xtensa               randconfig-r023-20230410   gcc  
xtensa               randconfig-r033-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
