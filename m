Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18FB6F4835
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 18:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjEBQUu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 May 2023 12:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233951AbjEBQUp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 May 2023 12:20:45 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B912D4A
        for <linux-input@vger.kernel.org>; Tue,  2 May 2023 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683044433; x=1714580433;
  h=date:from:to:cc:subject:message-id;
  bh=QV2BM5dpX0Bw+zbKYEdLreE0vxWOuvYacEwWbIJgb+g=;
  b=JcryYGXF23xxSznTHtircizLYMKzNDsKWIAlHSaaMGogQxr9tyHz2RrL
   6A9poxwj/3d/IR55XtZOLmpjwaibs7I273FOrMDqjLQpOa48onopGLq2k
   mHzPeIGQUYpBng98seG9BGyPF/U4Qo1mqFmboCRGx3dDqb3oD0K2dFS1H
   DreQXknMDLSDtLy4XiVoG0YGBB782Yj0VXQTrn2ARvcKgWf0Jcxf+SMEA
   5HCAvlEASPexLFb9Y81XQfBmEZeTOfq2vYDm52n/P6vlboYv+IqcwUVAm
   Wp8V9uzNtXemviGGaaUVpceG6yizOZiqscNgEAkABVkJiZpNz1IHxdZta
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="411591250"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="411591250"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 09:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="840341325"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="840341325"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 May 2023 09:20:30 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ptsjt-00019o-3A;
        Tue, 02 May 2023 16:20:29 +0000
Date:   Wed, 03 May 2023 00:19:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 3a2df60200a03f78173f1fd831aa54c08464dcde
Message-ID: <20230502161955.u-ysL%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 3a2df60200a03f78173f1fd831aa54c08464dcde  Input: uinput - allow injecting event times

elapsed time: 721m

configs tested: 165
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230430   gcc  
alpha                randconfig-r013-20230430   gcc  
alpha                randconfig-r013-20230502   gcc  
alpha                randconfig-r021-20230430   gcc  
alpha                randconfig-r022-20230501   gcc  
alpha                randconfig-r031-20230430   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230502   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230501   gcc  
arc                  randconfig-r006-20230502   gcc  
arc                  randconfig-r011-20230430   gcc  
arc                  randconfig-r013-20230501   gcc  
arc                  randconfig-r025-20230430   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230501   gcc  
arm          buildonly-randconfig-r005-20230501   gcc  
arm          buildonly-randconfig-r006-20230430   gcc  
arm          buildonly-randconfig-r006-20230501   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230501   clang
arm                  randconfig-r022-20230430   gcc  
arm                  randconfig-r035-20230502   gcc  
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230430   gcc  
arm64                randconfig-r036-20230502   clang
csky                                defconfig   gcc  
csky                 randconfig-r014-20230430   gcc  
csky                 randconfig-r021-20230430   gcc  
hexagon              randconfig-r011-20230502   clang
hexagon              randconfig-r012-20230501   clang
hexagon              randconfig-r031-20230502   clang
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
i386                 randconfig-r003-20230501   gcc  
i386                 randconfig-r025-20230501   clang
i386                 randconfig-r026-20230501   clang
i386                 randconfig-r035-20230501   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230430   gcc  
ia64                 randconfig-r015-20230430   gcc  
ia64                 randconfig-r024-20230430   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230430   gcc  
loongarch    buildonly-randconfig-r004-20230430   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230430   gcc  
loongarch            randconfig-r003-20230430   gcc  
loongarch            randconfig-r023-20230501   gcc  
loongarch            randconfig-r026-20230430   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230502   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230501   gcc  
m68k                 randconfig-r001-20230502   gcc  
m68k                 randconfig-r015-20230502   gcc  
m68k                 randconfig-r035-20230430   gcc  
microblaze           randconfig-r005-20230502   gcc  
microblaze           randconfig-r012-20230502   gcc  
microblaze           randconfig-r021-20230501   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r011-20230502   clang
mips                 randconfig-r034-20230501   clang
mips                 randconfig-r036-20230430   clang
nios2        buildonly-randconfig-r001-20230502   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230501   gcc  
nios2                randconfig-r032-20230430   gcc  
openrisc             randconfig-r002-20230501   gcc  
openrisc             randconfig-r033-20230502   gcc  
parisc       buildonly-randconfig-r002-20230501   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r025-20230501   gcc  
parisc               randconfig-r032-20230501   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230501   clang
powerpc              randconfig-r012-20230502   gcc  
powerpc              randconfig-r016-20230502   gcc  
powerpc              randconfig-r023-20230501   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230502   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230502   gcc  
riscv                randconfig-r031-20230501   gcc  
riscv                randconfig-r033-20230430   gcc  
riscv                randconfig-r034-20230430   gcc  
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230501   clang
s390         buildonly-randconfig-r005-20230430   clang
s390                                defconfig   gcc  
s390                 randconfig-r015-20230502   gcc  
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230502   gcc  
sh                   randconfig-r005-20230430   gcc  
sh                   randconfig-r021-20230501   gcc  
sh                   randconfig-r024-20230430   gcc  
sh                   randconfig-r032-20230502   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230430   gcc  
sparc64              randconfig-r013-20230502   gcc  
sparc64              randconfig-r014-20230501   gcc  
sparc64              randconfig-r023-20230430   gcc  
sparc64              randconfig-r034-20230502   gcc  
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
x86_64               randconfig-r011-20230501   clang
x86_64               randconfig-r016-20230501   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r006-20230501   gcc  
xtensa               randconfig-r016-20230430   gcc  
xtensa               randconfig-r016-20230502   gcc  
xtensa               randconfig-r036-20230501   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
