Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 886D970F44D
	for <lists+linux-input@lfdr.de>; Wed, 24 May 2023 12:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjEXKgE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 May 2023 06:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbjEXKgD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 May 2023 06:36:03 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF9AB7
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 03:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684924562; x=1716460562;
  h=date:from:to:cc:subject:message-id;
  bh=pEaJ8HjBPcBI0ZTM0Yoyhj9B/wuC6DLEvMxqsTceBj8=;
  b=W/qhjMPpW0UdnHpFZDKXQX2TRqNnomXKpWTWzuDdbUoVf4K5W6Xt+fsh
   X1v8yHUKBDfiiPhvp2bDu40iza69TReMIG6I4K+n8eAmmh3LpN6rB7ejU
   5JMa0ONBcfXuYfbjwh4NX+jnD6yp/FqxOOatEhvwK2cIECFwNTi8QkstY
   JamIlOeX8wZOLOeTKJZvSRTTycqEyTw7YLJS54QDUmpk8MpomEg4KaUQ4
   eu4HPVVisP8tnIhRekApv6kpASVPYLTHT5hewUDoFV3AvAW3bmK60cD/A
   qR44+kgKppmGO9jywhlU2MXzIcqp4WSPZF6KrJlezhy0H3RoIl0IGMqxx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="351036837"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="351036837"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 03:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="848693956"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="848693956"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 May 2023 03:35:59 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1lqY-000Efj-24;
        Wed, 24 May 2023 10:35:58 +0000
Date:   Wed, 24 May 2023 18:35:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 b00315628095075da4af8d6d519d85d95117de09
Message-ID: <20230524103553.ZiFUG%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230524154417/lkp-src/repo/*/dtor-input
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: b00315628095075da4af8d6d519d85d95117de09  Input: tests - add test to cover all input_grab_device() function

elapsed time: 720m

configs tested: 205
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230521   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230521   gcc  
alpha                randconfig-r025-20230522   gcc  
alpha                randconfig-r036-20230522   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230521   gcc  
arc                  randconfig-r026-20230521   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230522   gcc  
arm          buildonly-randconfig-r005-20230521   clang
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230522   gcc  
arm                  randconfig-r031-20230521   gcc  
arm                  randconfig-r034-20230522   clang
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230521   clang
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230521   clang
arm64                randconfig-r022-20230522   clang
csky         buildonly-randconfig-r003-20230522   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r014-20230521   gcc  
csky                 randconfig-r025-20230521   gcc  
hexagon      buildonly-randconfig-r001-20230521   clang
hexagon              randconfig-r013-20230521   clang
hexagon              randconfig-r025-20230521   clang
hexagon              randconfig-r026-20230522   clang
hexagon              randconfig-r041-20230521   clang
hexagon              randconfig-r041-20230522   clang
hexagon              randconfig-r045-20230521   clang
hexagon              randconfig-r045-20230522   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230522   gcc  
i386                 randconfig-a002-20230522   gcc  
i386                 randconfig-a003-20230522   gcc  
i386                 randconfig-a004-20230522   gcc  
i386                 randconfig-a005-20230522   gcc  
i386                 randconfig-a006-20230522   gcc  
i386                 randconfig-a011-20230522   clang
i386                 randconfig-a012-20230522   clang
i386                 randconfig-a013-20230522   clang
i386                 randconfig-a014-20230522   clang
i386                 randconfig-a015-20230522   clang
i386                 randconfig-a016-20230522   clang
i386                 randconfig-r004-20230522   gcc  
i386                 randconfig-r011-20230522   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230522   gcc  
ia64         buildonly-randconfig-r003-20230522   gcc  
ia64         buildonly-randconfig-r006-20230521   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r022-20230521   gcc  
ia64                 randconfig-r031-20230521   gcc  
ia64                 randconfig-r035-20230522   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230522   gcc  
loongarch            randconfig-r014-20230522   gcc  
loongarch            randconfig-r016-20230521   gcc  
loongarch            randconfig-r021-20230521   gcc  
loongarch            randconfig-r023-20230522   gcc  
loongarch            randconfig-r026-20230521   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r036-20230522   gcc  
microblaze           randconfig-r006-20230521   gcc  
microblaze           randconfig-r012-20230522   gcc  
microblaze           randconfig-r013-20230522   gcc  
microblaze           randconfig-r021-20230521   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230522   clang
mips                 randconfig-r004-20230521   gcc  
mips                 randconfig-r011-20230522   gcc  
mips                 randconfig-r012-20230521   clang
mips                 randconfig-r013-20230521   clang
mips                 randconfig-r033-20230522   clang
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230521   gcc  
nios2                randconfig-r026-20230522   gcc  
openrisc     buildonly-randconfig-r003-20230521   gcc  
openrisc             randconfig-r002-20230522   gcc  
openrisc             randconfig-r033-20230521   gcc  
openrisc             randconfig-r036-20230521   gcc  
parisc       buildonly-randconfig-r001-20230521   gcc  
parisc       buildonly-randconfig-r004-20230522   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230522   gcc  
parisc               randconfig-r002-20230521   gcc  
parisc               randconfig-r015-20230522   gcc  
parisc               randconfig-r023-20230521   gcc  
parisc               randconfig-r024-20230522   gcc  
parisc               randconfig-r032-20230521   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230522   gcc  
powerpc              randconfig-r011-20230521   gcc  
powerpc              randconfig-r024-20230521   gcc  
powerpc              randconfig-r034-20230521   clang
powerpc              randconfig-r034-20230522   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230521   gcc  
riscv        buildonly-randconfig-r005-20230522   clang
riscv        buildonly-randconfig-r006-20230522   clang
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230522   clang
riscv                randconfig-r022-20230522   clang
riscv                randconfig-r031-20230522   gcc  
riscv                randconfig-r036-20230521   clang
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230521   clang
s390                 randconfig-r002-20230521   clang
s390                 randconfig-r016-20230521   gcc  
s390                 randconfig-r034-20230521   clang
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230521   gcc  
sh           buildonly-randconfig-r005-20230522   gcc  
sh                   randconfig-r002-20230522   gcc  
sh                   randconfig-r006-20230521   gcc  
sh                   randconfig-r015-20230522   gcc  
sh                   randconfig-r035-20230521   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230522   gcc  
sparc                randconfig-r012-20230522   gcc  
sparc                randconfig-r014-20230522   gcc  
sparc                randconfig-r016-20230522   gcc  
sparc                randconfig-r024-20230522   gcc  
sparc64      buildonly-randconfig-r002-20230522   gcc  
sparc64              randconfig-r001-20230522   gcc  
sparc64              randconfig-r003-20230521   gcc  
sparc64              randconfig-r006-20230522   gcc  
sparc64              randconfig-r023-20230522   gcc  
sparc64              randconfig-r024-20230521   gcc  
sparc64              randconfig-r032-20230521   gcc  
sparc64              randconfig-r032-20230522   gcc  
sparc64              randconfig-r033-20230521   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230522   gcc  
x86_64               randconfig-a002-20230522   gcc  
x86_64               randconfig-a003-20230522   gcc  
x86_64               randconfig-a004-20230522   gcc  
x86_64               randconfig-a005-20230522   gcc  
x86_64               randconfig-a006-20230522   gcc  
x86_64               randconfig-a011-20230522   clang
x86_64               randconfig-a012-20230522   clang
x86_64               randconfig-a013-20230522   clang
x86_64               randconfig-a014-20230522   clang
x86_64               randconfig-a015-20230522   clang
x86_64               randconfig-a016-20230522   clang
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64               randconfig-x061-20230522   clang
x86_64               randconfig-x062-20230522   clang
x86_64               randconfig-x063-20230522   clang
x86_64               randconfig-x064-20230522   clang
x86_64               randconfig-x065-20230522   clang
x86_64               randconfig-x066-20230522   clang
x86_64               randconfig-x071-20230522   gcc  
x86_64               randconfig-x072-20230522   gcc  
x86_64               randconfig-x073-20230522   gcc  
x86_64               randconfig-x074-20230522   gcc  
x86_64               randconfig-x075-20230522   gcc  
x86_64               randconfig-x076-20230522   gcc  
x86_64               randconfig-x081-20230522   gcc  
x86_64               randconfig-x082-20230522   gcc  
x86_64               randconfig-x083-20230522   gcc  
x86_64               randconfig-x084-20230522   gcc  
x86_64               randconfig-x085-20230522   gcc  
x86_64               randconfig-x086-20230522   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230522   gcc  
xtensa       buildonly-randconfig-r005-20230521   gcc  
xtensa               randconfig-r001-20230521   gcc  
xtensa               randconfig-r003-20230522   gcc  
xtensa               randconfig-r014-20230521   gcc  
xtensa               randconfig-r032-20230522   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
