Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2843A7001F2
	for <lists+linux-input@lfdr.de>; Fri, 12 May 2023 09:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240323AbjELH4f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 May 2023 03:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239868AbjELH4J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 May 2023 03:56:09 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D489E72B
        for <linux-input@vger.kernel.org>; Fri, 12 May 2023 00:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683878152; x=1715414152;
  h=date:from:to:cc:subject:message-id;
  bh=pC36jZtfqI3iiyM/X7LIhNliKCgj7LkCktn0U5eZXFU=;
  b=nOFyzBF/VkUDKj6Yq19OY5QRykQfYptv3EhVWYC+x0jj6/2W3//Snx2m
   VbzN9FDrkYUGfjsc7L8A6tfp469VIm+P6vdH2Ojh0XlWAw83IdTdfuGJG
   Bi9K2/eSEe79uOQZq90UTEHBVPnFtopqcfDiFf0awv94EOlxd0RUU1OY8
   Dxm1El2En/4ELtxDScSIFrR9zQz0EJ8Vdm5nwHvrKe3lX5SpiXtqz5BRk
   VO89MDccAvauILFQIMEt8SFNM3xtKo3otwTxqrKynMsrtswFP3HY2RnXn
   rNq2TjISK7MfFKnajh4xsoQKJOcUR3HBeoN8OPZBP+XwGgxQLMND/llxP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="352978006"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="352978006"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 00:55:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="694135274"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="694135274"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2023 00:55:42 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pxNcr-0004fN-1Q;
        Fri, 12 May 2023 07:55:41 +0000
Date:   Fri, 12 May 2023 15:55:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 7b63a88bb62ba2ddf5fcd956be85fe46624628b9
Message-ID: <20230512075503.J7EtE%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 7b63a88bb62ba2ddf5fcd956be85fe46624628b9  Input: psmouse - fix OOB access in Elantech protocol

elapsed time: 729m

configs tested: 132
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230511   gcc  
alpha                randconfig-r006-20230511   gcc  
alpha                randconfig-r011-20230509   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230509   gcc  
arc                  randconfig-r023-20230509   gcc  
arc                  randconfig-r043-20230509   gcc  
arc                  randconfig-r043-20230511   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r016-20230509   gcc  
arm                  randconfig-r031-20230511   gcc  
arm                  randconfig-r033-20230509   clang
arm                  randconfig-r046-20230509   gcc  
arm                  randconfig-r046-20230511   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230511   clang
arm64        buildonly-randconfig-r006-20230511   clang
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230511   gcc  
hexagon              randconfig-r004-20230509   clang
hexagon              randconfig-r024-20230509   clang
hexagon              randconfig-r024-20230511   clang
hexagon              randconfig-r034-20230511   clang
hexagon              randconfig-r036-20230509   clang
hexagon              randconfig-r041-20230509   clang
hexagon              randconfig-r041-20230511   clang
hexagon              randconfig-r045-20230509   clang
hexagon              randconfig-r045-20230511   clang
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
ia64         buildonly-randconfig-r005-20230509   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230509   gcc  
ia64                 randconfig-r035-20230511   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230509   gcc  
loongarch            randconfig-r021-20230511   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230511   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230509   gcc  
m68k                 randconfig-r012-20230509   gcc  
m68k                 randconfig-r025-20230509   gcc  
m68k                 randconfig-r032-20230509   gcc  
microblaze   buildonly-randconfig-r001-20230511   gcc  
microblaze           randconfig-r013-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230511   gcc  
mips                 randconfig-r011-20230511   clang
mips                 randconfig-r015-20230509   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230511   gcc  
nios2                randconfig-r033-20230511   gcc  
nios2                randconfig-r035-20230509   gcc  
parisc       buildonly-randconfig-r002-20230509   gcc  
parisc       buildonly-randconfig-r003-20230509   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r025-20230511   gcc  
parisc               randconfig-r026-20230511   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230511   clang
powerpc              randconfig-r005-20230509   gcc  
powerpc              randconfig-r034-20230509   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r026-20230509   clang
riscv                randconfig-r042-20230509   clang
riscv                randconfig-r042-20230511   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230509   clang
s390                 randconfig-r032-20230511   clang
s390                 randconfig-r044-20230509   clang
s390                 randconfig-r044-20230511   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r014-20230509   gcc  
sh                   randconfig-r022-20230509   gcc  
sh                   randconfig-r023-20230511   gcc  
sparc        buildonly-randconfig-r004-20230509   gcc  
sparc        buildonly-randconfig-r006-20230509   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230509   gcc  
sparc                randconfig-r031-20230509   gcc  
sparc64      buildonly-randconfig-r002-20230511   gcc  
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
xtensa       buildonly-randconfig-r004-20230511   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
