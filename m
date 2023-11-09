Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B36267E62E2
	for <lists+linux-input@lfdr.de>; Thu,  9 Nov 2023 05:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbjKIEnR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Nov 2023 23:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjKIEnR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Nov 2023 23:43:17 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC3D26A0
        for <linux-input@vger.kernel.org>; Wed,  8 Nov 2023 20:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699504995; x=1731040995;
  h=date:from:to:cc:subject:message-id;
  bh=2y1ARoVKZSE7G6l54BzH0nEeNyAChY7M+hCXHSCiwoo=;
  b=l2yoF2BD0DqtFYsGgJHAG/X+YvBhPQbNOCtuQZYn99kKIiXidG76vuIw
   UzQftho1gI7ilSSFdePGRoHGXfxDwEmMc8kvct7ONxPXlOxNyS/HlCA9n
   M6NuZ8DoO1LYXajRvCWhz8Xe+Tgfb7Ya7aDUEyCJ8Erac109eiVnBFvny
   jLMfT/ozTxV7bU/3lVlpAc7+mmN3cghJWr3vckm7gPK6opzuEVohlxz2g
   nmOlyXdaTpcSbSQMRKxcMHm2OKddz6Mej2M9SpSO/+OcDkrL0IhmRgdvx
   v2U/ySsIZkadfw3wWvGF6pA7llMuNvARJcxT8TIRn+BDC4z3igKfTRiMQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="387081315"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="387081315"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 20:43:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="886883360"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="886883360"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Nov 2023 20:43:13 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r0wsp-0008Uy-2B;
        Thu, 09 Nov 2023 04:43:11 +0000
Date:   Thu, 09 Nov 2023 12:43:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 cdd5b5a9761fd66d17586e4f4ba6588c70e640ea
Message-ID: <202311091207.tzbvCNb9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: cdd5b5a9761fd66d17586e4f4ba6588c70e640ea  Merge branch 'next' into for-linus

elapsed time: 3076m

configs tested: 139
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231108   gcc  
arc                   randconfig-002-20231108   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231108   gcc  
csky                  randconfig-002-20231108   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231108   gcc  
i386         buildonly-randconfig-002-20231108   gcc  
i386         buildonly-randconfig-003-20231108   gcc  
i386         buildonly-randconfig-004-20231108   gcc  
i386         buildonly-randconfig-005-20231108   gcc  
i386         buildonly-randconfig-006-20231108   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231108   gcc  
i386                  randconfig-002-20231108   gcc  
i386                  randconfig-003-20231108   gcc  
i386                  randconfig-004-20231108   gcc  
i386                  randconfig-005-20231108   gcc  
i386                  randconfig-006-20231108   gcc  
i386                  randconfig-011-20231108   gcc  
i386                  randconfig-012-20231108   gcc  
i386                  randconfig-013-20231108   gcc  
i386                  randconfig-014-20231108   gcc  
i386                  randconfig-015-20231108   gcc  
i386                  randconfig-016-20231108   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231108   gcc  
loongarch             randconfig-002-20231108   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231108   gcc  
nios2                 randconfig-002-20231108   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231108   gcc  
parisc                randconfig-002-20231108   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231108   gcc  
powerpc               randconfig-002-20231108   gcc  
powerpc               randconfig-003-20231108   gcc  
powerpc64             randconfig-001-20231108   gcc  
powerpc64             randconfig-002-20231108   gcc  
powerpc64             randconfig-003-20231108   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231108   gcc  
riscv                 randconfig-002-20231108   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231108   gcc  
s390                  randconfig-002-20231108   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231108   gcc  
sh                    randconfig-002-20231108   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231108   gcc  
sparc                 randconfig-002-20231108   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231108   gcc  
sparc64               randconfig-002-20231108   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231108   gcc  
um                    randconfig-002-20231108   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231108   gcc  
x86_64       buildonly-randconfig-002-20231108   gcc  
x86_64       buildonly-randconfig-003-20231108   gcc  
x86_64       buildonly-randconfig-004-20231108   gcc  
x86_64       buildonly-randconfig-005-20231108   gcc  
x86_64       buildonly-randconfig-006-20231108   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231109   gcc  
x86_64                randconfig-002-20231109   gcc  
x86_64                randconfig-003-20231109   gcc  
x86_64                randconfig-004-20231109   gcc  
x86_64                randconfig-005-20231109   gcc  
x86_64                randconfig-006-20231109   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231108   gcc  
xtensa                randconfig-002-20231108   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
