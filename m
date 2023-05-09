Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBEE6FBEC8
	for <lists+linux-input@lfdr.de>; Tue,  9 May 2023 07:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjEIFiN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 May 2023 01:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233293AbjEIFiM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 May 2023 01:38:12 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEAF4C31
        for <linux-input@vger.kernel.org>; Mon,  8 May 2023 22:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683610691; x=1715146691;
  h=date:from:to:cc:subject:message-id;
  bh=NMN/n8Fim5tQ1FkOzt82fWDmiAcLUQBWUXtx7KPbi00=;
  b=OeaEzTSTQqKinvK0ReEwLKuQ9m09HUozqpUTYEvZZ2Bv9/gRm6ZwZSLz
   Xao/DOaAfPnQqYZ8e929kIDy0OdSAk4S5dn1N8RVfNVsEMltkv0d2XZoG
   JnViMadgJE9KUb79VXStTfoyNTW4VPqohSiR5zi5KjCVFLe7o4kqZbUi+
   /NWH01AkmdPQFADr+G1I+hZzd1qWLe9xfZAtzNYKrOMGjgNJoh4Myp4+B
   UBFc2XK1Pve9JBkNXpvOVBNpMGBC5rIhf+vGGsZcBlTEK2nbv4t5a+Cp0
   ud5XPURbwJPuynb+hJS05XT/clyY98EeO4/CCEtdAjMzhntPvvJTSOrXC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348642457"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="348642457"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 22:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="701694328"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="701694328"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 May 2023 22:38:06 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pwG2z-0001md-04;
        Tue, 09 May 2023 05:38:01 +0000
Date:   Tue, 09 May 2023 13:37:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 bcf784985e35fc39d682f0dde750162e7f54a1f0
Message-ID: <20230509053717.Yn17j%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: bcf784985e35fc39d682f0dde750162e7f54a1f0  Input: pwm-vibra - add support for enable GPIO

elapsed time: 722m

configs tested: 158
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230508   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230507   gcc  
alpha                randconfig-r023-20230507   gcc  
alpha                randconfig-r032-20230507   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230507   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230508   gcc  
arc                  randconfig-r043-20230507   gcc  
arc                  randconfig-r043-20230508   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230507   gcc  
arm          buildonly-randconfig-r002-20230508   clang
arm          buildonly-randconfig-r003-20230507   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r023-20230508   clang
arm                  randconfig-r046-20230507   gcc  
arm                  randconfig-r046-20230508   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230507   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230507   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r014-20230508   gcc  
csky                 randconfig-r031-20230507   gcc  
hexagon              randconfig-r002-20230508   clang
hexagon              randconfig-r011-20230508   clang
hexagon              randconfig-r012-20230507   clang
hexagon              randconfig-r034-20230507   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r041-20230508   clang
hexagon              randconfig-r045-20230507   clang
hexagon              randconfig-r045-20230508   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230508   clang
i386                          randconfig-a001   gcc  
i386                 randconfig-a002-20230508   clang
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230508   clang
i386                          randconfig-a003   gcc  
i386                 randconfig-a004-20230508   clang
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230508   clang
i386                          randconfig-a005   gcc  
i386                 randconfig-a006-20230508   clang
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
i386                 randconfig-r015-20230508   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230507   gcc  
ia64                 randconfig-r035-20230507   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230508   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r014-20230507   gcc  
loongarch            randconfig-r036-20230507   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230508   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r033-20230507   gcc  
microblaze   buildonly-randconfig-r002-20230507   gcc  
microblaze   buildonly-randconfig-r005-20230507   gcc  
microblaze           randconfig-r001-20230507   gcc  
microblaze           randconfig-r002-20230507   gcc  
microblaze           randconfig-r011-20230507   gcc  
microblaze           randconfig-r013-20230507   gcc  
microblaze           randconfig-r015-20230507   gcc  
microblaze           randconfig-r024-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230508   gcc  
mips                 randconfig-r016-20230507   gcc  
mips                 randconfig-r021-20230508   clang
mips                 randconfig-r022-20230507   gcc  
mips                 randconfig-r022-20230508   clang
mips                 randconfig-r024-20230508   clang
mips                 randconfig-r025-20230508   clang
mips                 randconfig-r026-20230507   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230508   gcc  
nios2                randconfig-r021-20230507   gcc  
nios2                randconfig-r033-20230507   gcc  
nios2                randconfig-r036-20230507   gcc  
parisc       buildonly-randconfig-r006-20230507   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230507   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r004-20230507   gcc  
powerpc              randconfig-r006-20230507   gcc  
powerpc              randconfig-r026-20230508   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230507   clang
riscv        buildonly-randconfig-r005-20230508   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230507   clang
riscv                randconfig-r013-20230508   gcc  
riscv                randconfig-r014-20230507   clang
riscv                randconfig-r042-20230507   clang
riscv                randconfig-r042-20230508   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230508   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r032-20230507   gcc  
s390                 randconfig-r044-20230507   clang
s390                 randconfig-r044-20230508   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230507   gcc  
sh           buildonly-randconfig-r005-20230507   gcc  
sh                   randconfig-r005-20230507   gcc  
sparc        buildonly-randconfig-r004-20230507   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230507   gcc  
sparc                randconfig-r006-20230508   gcc  
sparc                randconfig-r015-20230507   gcc  
sparc                randconfig-r024-20230507   gcc  
sparc                randconfig-r035-20230507   gcc  
sparc64              randconfig-r004-20230508   gcc  
sparc64              randconfig-r012-20230508   gcc  
sparc64              randconfig-r021-20230507   gcc  
sparc64              randconfig-r022-20230507   gcc  
sparc64              randconfig-r026-20230507   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230508   clang
x86_64               randconfig-a002-20230508   clang
x86_64               randconfig-a003-20230508   clang
x86_64               randconfig-a004-20230508   clang
x86_64               randconfig-a005-20230508   clang
x86_64               randconfig-a006-20230508   clang
x86_64               randconfig-a011-20230508   gcc  
x86_64               randconfig-a012-20230508   gcc  
x86_64               randconfig-a013-20230508   gcc  
x86_64               randconfig-a014-20230508   gcc  
x86_64               randconfig-a015-20230508   gcc  
x86_64               randconfig-a016-20230508   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r016-20230508   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
