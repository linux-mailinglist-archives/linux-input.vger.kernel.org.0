Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7829D74EBB7
	for <lists+linux-input@lfdr.de>; Tue, 11 Jul 2023 12:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjGKK1Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jul 2023 06:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjGKK1Q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jul 2023 06:27:16 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93C81AC
        for <linux-input@vger.kernel.org>; Tue, 11 Jul 2023 03:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689071234; x=1720607234;
  h=date:from:to:cc:subject:message-id;
  bh=N3A0NP5Goysgnj9jhE53LJgpJFZEUpbOGIEK9DfXKjQ=;
  b=DRhSVO/+977ZZmeN8lPEM3eOwosGxHvSJCdH2t5nSVcTQ3/Z83Qn8ent
   yxWgVx0M60hRrdiHIxVUk4+fOpFlL/33xx5wE3nEI6hFTy5VxoSDYO5zl
   wcG1z11AMFB43cpPbWLmTFEDldN4owfBDILclBjO5TIDBCP7sB1IBh46u
   5d9QtbARccfCDbpfKKr60Ueq1RbnH8Q9HC8B0ZLWzLnK4f/3DhV8XTIIw
   Dd9Ax2myYOlp87mgSNuMKRcw+3mkgtCCTHHSoJeoGJ2b8De5fdNB5sdnT
   yuD7P6gb9d0PFpWReMzySqibgAu6alXaxet9w/IXK80uaY5LpUTvBcPCK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368081543"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="368081543"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 03:27:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="895126590"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="895126590"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Jul 2023 03:26:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qJAa9-0004iR-3D;
        Tue, 11 Jul 2023 10:26:57 +0000
Date:   Tue, 11 Jul 2023 18:26:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 dd24e202ac722b3fea1fadb7f6c0b2db61086e78
Message-ID: <202307111814.uh4ifIr6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: dd24e202ac722b3fea1fadb7f6c0b2db61086e78  Input: iqs7222 - add support for Azoteq IQS7222D

elapsed time: 877m

configs tested: 184
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230710   gcc  
alpha                randconfig-r011-20230710   gcc  
alpha                randconfig-r014-20230710   gcc  
alpha                randconfig-r022-20230710   gcc  
alpha                randconfig-r025-20230710   gcc  
alpha                randconfig-r032-20230710   gcc  
alpha                randconfig-r036-20230710   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230710   gcc  
arc                  randconfig-r024-20230710   gcc  
arc                  randconfig-r031-20230710   gcc  
arc                  randconfig-r043-20230710   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230710   clang
arm                  randconfig-r024-20230710   gcc  
arm                  randconfig-r025-20230710   gcc  
arm                  randconfig-r046-20230710   gcc  
arm                  randconfig-r046-20230711   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230710   gcc  
arm64                randconfig-r006-20230710   gcc  
arm64                randconfig-r034-20230710   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230710   gcc  
csky                 randconfig-r031-20230710   gcc  
csky                 randconfig-r034-20230710   gcc  
hexagon              randconfig-r033-20230710   clang
hexagon              randconfig-r035-20230710   clang
hexagon              randconfig-r041-20230710   clang
hexagon              randconfig-r041-20230711   clang
hexagon              randconfig-r045-20230710   clang
hexagon              randconfig-r045-20230711   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230710   gcc  
i386         buildonly-randconfig-r004-20230711   clang
i386         buildonly-randconfig-r005-20230710   gcc  
i386         buildonly-randconfig-r005-20230711   clang
i386         buildonly-randconfig-r006-20230710   gcc  
i386         buildonly-randconfig-r006-20230711   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230710   gcc  
i386                 randconfig-i001-20230711   clang
i386                 randconfig-i002-20230710   gcc  
i386                 randconfig-i002-20230711   clang
i386                 randconfig-i003-20230710   gcc  
i386                 randconfig-i003-20230711   clang
i386                 randconfig-i004-20230710   gcc  
i386                 randconfig-i004-20230711   clang
i386                 randconfig-i005-20230710   gcc  
i386                 randconfig-i005-20230711   clang
i386                 randconfig-i006-20230710   gcc  
i386                 randconfig-i006-20230711   clang
i386                 randconfig-i011-20230710   clang
i386                 randconfig-i011-20230711   gcc  
i386                 randconfig-i012-20230710   clang
i386                 randconfig-i012-20230711   gcc  
i386                 randconfig-i013-20230710   clang
i386                 randconfig-i013-20230711   gcc  
i386                 randconfig-i014-20230710   clang
i386                 randconfig-i014-20230711   gcc  
i386                 randconfig-i015-20230710   clang
i386                 randconfig-i015-20230711   gcc  
i386                 randconfig-i016-20230710   clang
i386                 randconfig-i016-20230711   gcc  
i386                 randconfig-r003-20230710   gcc  
i386                 randconfig-r023-20230710   clang
i386                 randconfig-r024-20230710   clang
i386                 randconfig-r032-20230710   gcc  
i386                 randconfig-r033-20230710   gcc  
i386                 randconfig-r035-20230710   gcc  
i386                 randconfig-r036-20230710   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230710   gcc  
loongarch            randconfig-r015-20230710   gcc  
loongarch            randconfig-r032-20230710   gcc  
loongarch            randconfig-r035-20230710   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230710   gcc  
m68k                 randconfig-r004-20230710   gcc  
m68k                 randconfig-r016-20230710   gcc  
m68k                 randconfig-r034-20230710   gcc  
microblaze           randconfig-r032-20230710   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                 randconfig-r004-20230710   clang
mips                 randconfig-r011-20230710   gcc  
mips                 randconfig-r014-20230710   gcc  
mips                 randconfig-r021-20230710   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230710   gcc  
nios2                randconfig-r012-20230710   gcc  
nios2                randconfig-r013-20230710   gcc  
openrisc             randconfig-r003-20230710   gcc  
openrisc             randconfig-r015-20230710   gcc  
openrisc             randconfig-r032-20230710   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230710   gcc  
parisc               randconfig-r025-20230710   gcc  
parisc               randconfig-r026-20230710   gcc  
parisc               randconfig-r034-20230710   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc              randconfig-r023-20230710   clang
powerpc                     tqm8548_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230710   gcc  
riscv                randconfig-r003-20230710   gcc  
riscv                randconfig-r016-20230710   clang
riscv                randconfig-r026-20230710   clang
riscv                randconfig-r042-20230710   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r031-20230710   gcc  
s390                 randconfig-r033-20230710   gcc  
s390                 randconfig-r036-20230710   gcc  
s390                 randconfig-r044-20230710   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230710   gcc  
sh                   randconfig-r016-20230710   gcc  
sh                   randconfig-r033-20230710   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230710   gcc  
sparc                randconfig-r014-20230710   gcc  
sparc64              randconfig-r002-20230710   gcc  
sparc64              randconfig-r006-20230710   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r012-20230710   gcc  
um                   randconfig-r014-20230710   gcc  
um                   randconfig-r016-20230710   gcc  
um                   randconfig-r022-20230710   gcc  
um                   randconfig-r024-20230710   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230710   gcc  
x86_64       buildonly-randconfig-r001-20230711   clang
x86_64       buildonly-randconfig-r002-20230710   gcc  
x86_64       buildonly-randconfig-r002-20230711   clang
x86_64       buildonly-randconfig-r003-20230710   gcc  
x86_64       buildonly-randconfig-r003-20230711   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230710   clang
x86_64               randconfig-x002-20230710   clang
x86_64               randconfig-x003-20230710   clang
x86_64               randconfig-x004-20230710   clang
x86_64               randconfig-x005-20230710   clang
x86_64               randconfig-x006-20230710   clang
x86_64               randconfig-x011-20230710   gcc  
x86_64               randconfig-x012-20230710   gcc  
x86_64               randconfig-x013-20230710   gcc  
x86_64               randconfig-x014-20230710   gcc  
x86_64               randconfig-x015-20230710   gcc  
x86_64               randconfig-x016-20230710   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r015-20230710   gcc  
xtensa               randconfig-r035-20230710   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
