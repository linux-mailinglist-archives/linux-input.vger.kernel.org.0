Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726D16DC91A
	for <lists+linux-input@lfdr.de>; Mon, 10 Apr 2023 18:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjDJQQd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Apr 2023 12:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjDJQQc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Apr 2023 12:16:32 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEEDE5A
        for <linux-input@vger.kernel.org>; Mon, 10 Apr 2023 09:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681143391; x=1712679391;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KiM2CyuCyvzomaGaX2k1y/JaYHmrXzdBd9PqXqc9n68=;
  b=mt5SL4BxOLrxwBUsP9uFuvOSUVVcLLqPguwY+VURJdSEcvKmIBtom21T
   vUeCvim1TbJ3vumCM+6yDYgPqENH4UM8N8QlVLP7DOiGly2LjpWHBGn7B
   Ml+b6c08HcXVJqzCMD0QUird3TTCiu/v31cN41TyNQXYkXv5gc5ErBH9J
   338dgwWjv/ppNTEiLxF6DSD97WA/3NrI+RWjFBvI/VCyeA7SYkor98Apg
   8B7Ca7sP+aOu777e46/F5jXtGvARTmOeisfghlt86hy/EDSn4h/O8dBZ3
   TTOSLx6cof9e9W+lJw9REJooDWZBIO4X5EJkVh43pkU/CE0GgcWfsBH5l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371229638"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="371229638"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 09:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="757496433"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="757496433"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Apr 2023 09:16:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pluBx-000VU9-0K;
        Mon, 10 Apr 2023 16:16:29 +0000
Date:   Tue, 11 Apr 2023 00:15:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 cd7cd6f386df21725eeab5d803226d4f74177203
Message-ID: <64343622.K3C/G1wWHRldBBzD%lkp@intel.com>
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
branch HEAD: cd7cd6f386df21725eeab5d803226d4f74177203  Input: cma3000_d0x - remove unneeded code

elapsed time: 812m

configs tested: 192
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230409   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230409   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230409   gcc  
arc          buildonly-randconfig-r002-20230410   gcc  
arc          buildonly-randconfig-r005-20230410   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230409   gcc  
arc                  randconfig-r013-20230410   gcc  
arc                  randconfig-r016-20230410   gcc  
arc                  randconfig-r033-20230409   gcc  
arc                  randconfig-r036-20230410   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r001-20230409   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230409   clang
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230410   clang
arm64                randconfig-r004-20230410   clang
arm64                randconfig-r031-20230410   clang
csky         buildonly-randconfig-r003-20230410   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r032-20230409   gcc  
hexagon      buildonly-randconfig-r006-20230410   clang
hexagon              randconfig-r011-20230410   clang
hexagon              randconfig-r012-20230409   clang
hexagon              randconfig-r013-20230410   clang
hexagon              randconfig-r025-20230410   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
i386                             allyesconfig   gcc  
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
i386                 randconfig-r006-20230410   clang
i386                 randconfig-r026-20230410   gcc  
i386                 randconfig-r033-20230410   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230410   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230410   gcc  
ia64                 randconfig-r013-20230409   gcc  
ia64                 randconfig-r015-20230410   gcc  
ia64                 randconfig-r025-20230409   gcc  
ia64                 randconfig-r035-20230409   gcc  
ia64                          tiger_defconfig   gcc  
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230409   gcc  
loongarch    buildonly-randconfig-r006-20230409   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230410   gcc  
loongarch            randconfig-r004-20230409   gcc  
loongarch            randconfig-r016-20230410   gcc  
loongarch            randconfig-r023-20230409   gcc  
loongarch            randconfig-r032-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230409   gcc  
m68k                 randconfig-r031-20230410   gcc  
m68k                 randconfig-r035-20230409   gcc  
m68k                 randconfig-r035-20230410   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r005-20230410   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip22_defconfig   clang
mips                           ip27_defconfig   clang
mips                 randconfig-r032-20230410   gcc  
mips                           rs90_defconfig   clang
nios2        buildonly-randconfig-r004-20230410   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230409   gcc  
openrisc     buildonly-randconfig-r006-20230409   gcc  
openrisc             randconfig-r003-20230409   gcc  
openrisc             randconfig-r006-20230409   gcc  
openrisc             randconfig-r006-20230410   gcc  
openrisc             randconfig-r024-20230409   gcc  
openrisc             randconfig-r031-20230409   gcc  
openrisc             randconfig-r033-20230409   gcc  
parisc       buildonly-randconfig-r002-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230410   gcc  
parisc               randconfig-r011-20230409   gcc  
parisc               randconfig-r011-20230410   gcc  
parisc               randconfig-r012-20230409   gcc  
parisc               randconfig-r022-20230409   gcc  
parisc               randconfig-r034-20230410   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230409   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                 mpc836x_mds_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc              randconfig-r001-20230410   clang
powerpc              randconfig-r003-20230410   clang
powerpc              randconfig-r015-20230410   gcc  
powerpc              randconfig-r022-20230409   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230410   gcc  
riscv                randconfig-r026-20230409   gcc  
riscv                randconfig-r034-20230409   clang
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230410   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230409   clang
s390                 randconfig-r004-20230410   clang
s390                 randconfig-r021-20230409   gcc  
s390                 randconfig-r023-20230409   gcc  
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh           buildonly-randconfig-r001-20230410   gcc  
sh           buildonly-randconfig-r004-20230410   gcc  
sh                        edosk7760_defconfig   gcc  
sh                   randconfig-r004-20230409   gcc  
sh                   randconfig-r012-20230410   gcc  
sh                   randconfig-r014-20230409   gcc  
sh                   randconfig-r015-20230409   gcc  
sh                   randconfig-r026-20230409   gcc  
sh                           se7750_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230410   gcc  
sparc                randconfig-r031-20230409   gcc  
sparc64      buildonly-randconfig-r001-20230409   gcc  
sparc64      buildonly-randconfig-r003-20230409   gcc  
sparc64              randconfig-r005-20230410   gcc  
sparc64              randconfig-r006-20230409   gcc  
sparc64              randconfig-r021-20230409   gcc  
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
x86_64               randconfig-r024-20230410   gcc  
x86_64               randconfig-r033-20230410   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r014-20230410   gcc  
xtensa               randconfig-r015-20230409   gcc  
xtensa               randconfig-r016-20230409   gcc  
xtensa               randconfig-r034-20230410   gcc  
xtensa               randconfig-r036-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
