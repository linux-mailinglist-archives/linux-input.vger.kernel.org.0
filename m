Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4194778EF21
	for <lists+linux-input@lfdr.de>; Thu, 31 Aug 2023 16:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjHaOBs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Aug 2023 10:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234585AbjHaOBr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Aug 2023 10:01:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A90E61
        for <linux-input@vger.kernel.org>; Thu, 31 Aug 2023 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693490498; x=1725026498;
  h=date:from:to:cc:subject:message-id;
  bh=nzMdrgkQab/eh/BgjyE3Gy+QIcOeSlpVYBQtPkk5PTY=;
  b=LTOjNY/PaalGmRevwR4SN7IfL0C/K3XYWfLN/mUnizEgZ/kBJtL/54Vp
   BQxJyi2SEl0De+8vBltfem+5GgneNYBG5gEoCX2c7JH+nzrEwa126Txia
   rquFLv3pgT8WtPjdybMBakx3r7icOtn3vUQ+fKGsOIdputM5PJ+MZKYHJ
   bbFA90ZymmMYnt+6rPVwJ6L6irkoJJtoOUJc9LEdgka39KkOHzBgjXIF0
   nA6Q+IKDl0cn/sMhVH35J8JTDrH5pxTU+TaWkusPPfYBcRtu6mSbargZT
   b+bt2ithK8n/zvzMxzHHTOk+Fp3OMq/2stAIAYwcas81sHhAubXhtqD67
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="366167766"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="366167766"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 06:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739532425"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="739532425"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Aug 2023 06:39:51 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qbhtl-0000Bp-0C;
        Thu, 31 Aug 2023 13:39:49 +0000
Date:   Thu, 31 Aug 2023 21:39:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 1ac731c529cd4d6adbce134754b51ff7d822b145
Message-ID: <202308312108.JlwJoY9Y-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 1ac731c529cd4d6adbce134754b51ff7d822b145  Merge branch 'next' into for-linus

elapsed time: 845m

configs tested: 161
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230831   gcc  
alpha                randconfig-r015-20230831   gcc  
alpha                randconfig-r034-20230831   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230831   gcc  
arc                  randconfig-r024-20230831   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230831   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r022-20230831   gcc  
csky                 randconfig-r031-20230831   gcc  
csky                 randconfig-r033-20230831   gcc  
hexagon               randconfig-001-20230831   clang
hexagon               randconfig-002-20230831   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230831   gcc  
i386         buildonly-randconfig-002-20230831   gcc  
i386         buildonly-randconfig-003-20230831   gcc  
i386         buildonly-randconfig-004-20230831   gcc  
i386         buildonly-randconfig-005-20230831   gcc  
i386         buildonly-randconfig-006-20230831   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230831   gcc  
i386                  randconfig-002-20230831   gcc  
i386                  randconfig-003-20230831   gcc  
i386                  randconfig-004-20230831   gcc  
i386                  randconfig-005-20230831   gcc  
i386                  randconfig-006-20230831   gcc  
i386                  randconfig-011-20230831   clang
i386                  randconfig-012-20230831   clang
i386                  randconfig-013-20230831   clang
i386                  randconfig-014-20230831   clang
i386                  randconfig-015-20230831   clang
i386                  randconfig-016-20230831   clang
i386                 randconfig-r013-20230831   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230831   gcc  
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
mips                 randconfig-r016-20230831   gcc  
mips                 randconfig-r023-20230831   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r001-20230831   gcc  
openrisc             randconfig-r006-20230831   gcc  
openrisc             randconfig-r032-20230831   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc64            randconfig-r011-20230831   clang
powerpc64            randconfig-r026-20230831   clang
powerpc64            randconfig-r035-20230831   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230831   gcc  
riscv                randconfig-r004-20230831   gcc  
riscv                randconfig-r025-20230831   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230831   clang
s390                 randconfig-r012-20230831   clang
s390                 randconfig-r036-20230831   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230831   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r014-20230831   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r021-20230831   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230831   gcc  
x86_64       buildonly-randconfig-002-20230831   gcc  
x86_64       buildonly-randconfig-003-20230831   gcc  
x86_64       buildonly-randconfig-004-20230831   gcc  
x86_64       buildonly-randconfig-005-20230831   gcc  
x86_64       buildonly-randconfig-006-20230831   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230831   clang
x86_64                randconfig-002-20230831   clang
x86_64                randconfig-003-20230831   clang
x86_64                randconfig-004-20230831   clang
x86_64                randconfig-005-20230831   clang
x86_64                randconfig-006-20230831   clang
x86_64                randconfig-011-20230831   gcc  
x86_64                randconfig-012-20230831   gcc  
x86_64                randconfig-013-20230831   gcc  
x86_64                randconfig-014-20230831   gcc  
x86_64                randconfig-015-20230831   gcc  
x86_64                randconfig-016-20230831   gcc  
x86_64                randconfig-071-20230831   gcc  
x86_64                randconfig-072-20230831   gcc  
x86_64                randconfig-073-20230831   gcc  
x86_64                randconfig-074-20230831   gcc  
x86_64                randconfig-075-20230831   gcc  
x86_64                randconfig-076-20230831   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r003-20230831   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
