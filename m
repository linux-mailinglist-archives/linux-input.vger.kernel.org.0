Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895C8751F17
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 12:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbjGMKi7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jul 2023 06:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjGMKiy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jul 2023 06:38:54 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2261A1BF9
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 03:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689244733; x=1720780733;
  h=date:from:to:cc:subject:message-id;
  bh=amok63kElQpILbNnzWnABCj5Tv9ebMUqNEa6t3s+c2Y=;
  b=jJVH/ZvEBIil1kpz2rUusunwX77PB6/RsssJlg0PMCvIa0/X0yMd2MAP
   gS/y3Pk7adi/lKiPOWCN5UYE5bzh2a27j33VmXeZanwNLzJ2oW4yqnGAr
   bMAgVAk8zumTk88nnzvypLLf2sG7wxGHTNZx3os1s9EBkbvBHoCpF4Z0G
   pSbfeWYIpoBGHaSKZttUQGy5fJ8k7IeSy4hzUoDdUoYMcIFP1C+FoGYz9
   IK+VrRj5rW4mRpmKbt6zBwwMsJZmOU1Wu8svgt8S3zrxg3bs3bc/0UMmP
   tMOdBdN2cHTo13ZVgyzcQOdlGZepCR+9DLJ2QGJvejlmNNBaSimx6kVUn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="350002890"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="350002890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 03:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="757114533"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="757114533"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Jul 2023 03:38:51 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qJtik-0006Y6-2V;
        Thu, 13 Jul 2023 10:38:50 +0000
Date:   Thu, 13 Jul 2023 18:38:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 f2ba47e65f3b5642488802a60cb7dd068f425edc
Message-ID: <202307131823.BLe5HaXL-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: f2ba47e65f3b5642488802a60cb7dd068f425edc  Input: add support for Azoteq IQS7210A/7211A/E

elapsed time: 725m

configs tested: 167
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230713   gcc  
arc                  randconfig-r014-20230712   gcc  
arc                  randconfig-r043-20230712   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                  randconfig-r001-20230712   clang
arm                  randconfig-r046-20230712   gcc  
arm                             rpc_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230712   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230712   gcc  
csky                 randconfig-r006-20230712   gcc  
hexagon              randconfig-r004-20230712   clang
hexagon              randconfig-r041-20230712   clang
hexagon              randconfig-r045-20230712   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230712   gcc  
i386         buildonly-randconfig-r005-20230712   gcc  
i386         buildonly-randconfig-r006-20230712   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230712   gcc  
i386                 randconfig-i002-20230712   gcc  
i386                 randconfig-i003-20230712   gcc  
i386                 randconfig-i004-20230712   gcc  
i386                 randconfig-i005-20230712   gcc  
i386                 randconfig-i006-20230712   gcc  
i386                 randconfig-i011-20230712   clang
i386                 randconfig-i011-20230713   gcc  
i386                 randconfig-i012-20230712   clang
i386                 randconfig-i012-20230713   gcc  
i386                 randconfig-i013-20230712   clang
i386                 randconfig-i013-20230713   gcc  
i386                 randconfig-i014-20230712   clang
i386                 randconfig-i014-20230713   gcc  
i386                 randconfig-i015-20230712   clang
i386                 randconfig-i015-20230713   gcc  
i386                 randconfig-i016-20230712   clang
i386                 randconfig-i016-20230713   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                 randconfig-r011-20230712   gcc  
m68k                 randconfig-r012-20230713   gcc  
m68k                 randconfig-r013-20230713   gcc  
m68k                 randconfig-r022-20230712   gcc  
m68k                 randconfig-r023-20230712   gcc  
microblaze           randconfig-r002-20230713   gcc  
microblaze           randconfig-r031-20230713   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          malta_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230712   gcc  
nios2                randconfig-r026-20230712   gcc  
nios2                randconfig-r031-20230713   gcc  
nios2                randconfig-r035-20230713   gcc  
openrisc             randconfig-r014-20230712   gcc  
openrisc             randconfig-r016-20230712   gcc  
openrisc             randconfig-r025-20230712   gcc  
openrisc             randconfig-r032-20230713   gcc  
openrisc             randconfig-r033-20230713   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230712   gcc  
parisc               randconfig-r006-20230712   gcc  
parisc               randconfig-r011-20230713   gcc  
parisc               randconfig-r035-20230713   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      obs600_defconfig   clang
powerpc              randconfig-r005-20230712   gcc  
powerpc              randconfig-r012-20230712   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                      walnut_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r015-20230713   gcc  
riscv                randconfig-r024-20230712   clang
riscv                randconfig-r042-20230712   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230712   gcc  
s390                 randconfig-r014-20230713   gcc  
s390                 randconfig-r034-20230713   clang
s390                 randconfig-r044-20230712   clang
sh                               allmodconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230712   gcc  
sparc                randconfig-r021-20230712   gcc  
sparc                randconfig-r023-20230712   gcc  
sparc                randconfig-r025-20230712   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64              randconfig-r013-20230712   gcc  
sparc64              randconfig-r022-20230712   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r003-20230713   gcc  
um                   randconfig-r004-20230713   gcc  
um                   randconfig-r005-20230713   gcc  
um                   randconfig-r012-20230713   clang
um                   randconfig-r014-20230713   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230712   gcc  
x86_64       buildonly-randconfig-r002-20230712   gcc  
x86_64       buildonly-randconfig-r003-20230712   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r036-20230713   clang
x86_64               randconfig-x001-20230712   clang
x86_64               randconfig-x002-20230712   clang
x86_64               randconfig-x003-20230712   clang
x86_64               randconfig-x004-20230712   clang
x86_64               randconfig-x005-20230712   clang
x86_64               randconfig-x006-20230712   clang
x86_64               randconfig-x011-20230710   gcc  
x86_64               randconfig-x011-20230712   gcc  
x86_64               randconfig-x012-20230710   gcc  
x86_64               randconfig-x012-20230712   gcc  
x86_64               randconfig-x013-20230710   gcc  
x86_64               randconfig-x013-20230712   gcc  
x86_64               randconfig-x014-20230710   gcc  
x86_64               randconfig-x014-20230712   gcc  
x86_64               randconfig-x015-20230710   gcc  
x86_64               randconfig-x015-20230712   gcc  
x86_64               randconfig-x016-20230710   gcc  
x86_64               randconfig-x016-20230712   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r015-20230712   gcc  
xtensa               randconfig-r015-20230713   gcc  
xtensa               randconfig-r016-20230713   gcc  
xtensa               randconfig-r032-20230713   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
