Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4B5753468
	for <lists+linux-input@lfdr.de>; Fri, 14 Jul 2023 09:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235636AbjGNH5D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jul 2023 03:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235572AbjGNH4j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jul 2023 03:56:39 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C23C44A5
        for <linux-input@vger.kernel.org>; Fri, 14 Jul 2023 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689321290; x=1720857290;
  h=date:from:to:cc:subject:message-id;
  bh=BSwWGfy6xOxPpynA9d6NZ40+0qrb/AofXEJvbNh8SOQ=;
  b=babJQC8YI5HlDptBkbFx+i16Y4GfRrGBqIu5OfpGL4Zs/sc6L9Tk4uvw
   eJSXNQuPu9TGUxjleM3Op6szSfBcOOr1YRASsWVBr5wtvG68GInCig1Ga
   TRZSVtAqgEAJbBiw26BUspO/HkBZxi0vlT7Jzq1bnNuj5dW6k8+B7ra4l
   tN3RydSY0fa3BoBM9c0DzpfnmEHzl0lsB2Dq6vSiaf7NOPv9wuH2srqoZ
   YgzQebLy/tvgnwdFWk/p7IthnXwpUEEwaVgutpdrb9HcKhWTZYF95axQb
   D9bENdG5fD5MhhRJz5LUkGiyyOm2GfnRQBBXwchtpkvP17CD5aEZWtY67
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368056068"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="368056068"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 00:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="751953081"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="751953081"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Jul 2023 00:52:26 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qKDbG-0007IB-0k;
        Fri, 14 Jul 2023 07:52:26 +0000
Date:   Fri, 14 Jul 2023 15:51:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 677232f879f2464007c511a73048ff5996b479fc
Message-ID: <202307141533.1W2XdyjR-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 677232f879f2464007c511a73048ff5996b479fc  Input: iqs7211 - point to match data directly

elapsed time: 725m

configs tested: 142
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r036-20230713   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230713   gcc  
arc                  randconfig-r013-20230713   gcc  
arc                  randconfig-r015-20230713   gcc  
arc                  randconfig-r043-20230713   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                  randconfig-r003-20230713   gcc  
arm                  randconfig-r033-20230713   gcc  
arm                  randconfig-r046-20230713   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230713   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230713   gcc  
csky                 randconfig-r032-20230713   gcc  
hexagon              randconfig-r002-20230713   clang
hexagon              randconfig-r011-20230713   clang
hexagon              randconfig-r022-20230713   clang
hexagon              randconfig-r032-20230713   clang
hexagon              randconfig-r033-20230713   clang
hexagon              randconfig-r041-20230713   clang
hexagon              randconfig-r045-20230713   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230713   clang
i386         buildonly-randconfig-r005-20230713   clang
i386         buildonly-randconfig-r006-20230713   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230713   clang
i386                 randconfig-i002-20230713   clang
i386                 randconfig-i003-20230713   clang
i386                 randconfig-i004-20230713   clang
i386                 randconfig-i005-20230713   clang
i386                 randconfig-i006-20230713   clang
i386                 randconfig-i011-20230713   gcc  
i386                 randconfig-i012-20230713   gcc  
i386                 randconfig-i013-20230713   gcc  
i386                 randconfig-i014-20230713   gcc  
i386                 randconfig-i015-20230713   gcc  
i386                 randconfig-i016-20230713   gcc  
i386                 randconfig-r031-20230713   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230713   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230713   gcc  
m68k                 randconfig-r016-20230713   gcc  
microblaze           randconfig-r001-20230713   gcc  
microblaze           randconfig-r034-20230713   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1b_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230713   gcc  
nios2                randconfig-r002-20230713   gcc  
nios2                randconfig-r011-20230713   gcc  
nios2                randconfig-r016-20230713   gcc  
nios2                randconfig-r023-20230713   gcc  
openrisc             randconfig-r004-20230713   gcc  
openrisc             randconfig-r024-20230713   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230713   gcc  
parisc               randconfig-r036-20230713   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r014-20230713   gcc  
powerpc              randconfig-r023-20230713   gcc  
powerpc              randconfig-r035-20230713   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230713   gcc  
riscv                randconfig-r042-20230713   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230713   clang
s390                 randconfig-r034-20230713   clang
s390                 randconfig-r044-20230713   gcc  
sh                               allmodconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                   randconfig-r003-20230713   gcc  
sh                   randconfig-r013-20230713   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230713   gcc  
sparc64              randconfig-r021-20230713   gcc  
sparc64              randconfig-r025-20230713   gcc  
sparc64              randconfig-r035-20230713   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230713   clang
x86_64       buildonly-randconfig-r002-20230713   clang
x86_64       buildonly-randconfig-r003-20230713   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r006-20230713   clang
x86_64               randconfig-x001-20230713   gcc  
x86_64               randconfig-x002-20230713   gcc  
x86_64               randconfig-x003-20230713   gcc  
x86_64               randconfig-x004-20230713   gcc  
x86_64               randconfig-x005-20230713   gcc  
x86_64               randconfig-x006-20230713   gcc  
x86_64               randconfig-x011-20230713   clang
x86_64               randconfig-x012-20230713   clang
x86_64               randconfig-x013-20230713   clang
x86_64               randconfig-x014-20230713   clang
x86_64               randconfig-x015-20230713   clang
x86_64               randconfig-x016-20230713   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r025-20230713   gcc  
xtensa               randconfig-r026-20230713   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
