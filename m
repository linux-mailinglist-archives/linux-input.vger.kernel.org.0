Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9FE7B4A93
	for <lists+linux-input@lfdr.de>; Mon,  2 Oct 2023 03:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbjJBBpQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Oct 2023 21:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjJBBpP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 Oct 2023 21:45:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9407CBC
        for <linux-input@vger.kernel.org>; Sun,  1 Oct 2023 18:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696211113; x=1727747113;
  h=date:from:to:cc:subject:message-id;
  bh=KcXxYIHNZ16nZHHnGADzH5PfvEIdmYBld+yQonSsHqw=;
  b=iA7F8yGJV4zmmFyOTOM/hv0F+h4kkmasnj68Ux28I4WafQqvB8lpfx60
   zqnxpZW6BBTQaO4EgBAYf1X1WyBrHRMGtmqwpmPcX7+RVnNVJDrkexEO7
   E5SWlAbkvASP687RY7piVikgqq3TNI/KGrFoTLqFLST8taWT0q3yNjo/a
   WUsOYosSvXTtR+bugRB9K0clBvExPthrgLvfcisC/808XE9lR2NWD+mCS
   dqbSJPxB34pyvK9Gu3OsB7m7PVWT0fIlJZUvO+5ozNL+TI6iIwZEDfq9A
   v7NDDzmxU+45HSqXrlaRu+nbxRoVwlIrW9TTURnt992Zq1MQoB9nNQI8G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="413486818"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="413486818"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 18:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="1081504211"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="1081504211"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 01 Oct 2023 18:45:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qn7zi-0005fD-0U;
        Mon, 02 Oct 2023 01:45:10 +0000
Date:   Mon, 02 Oct 2023 09:44:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 68ede283a1d8fe0813b218aeb498faf3b0fc0a7b
Message-ID: <202310020947.kpKP7fiG-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 68ede283a1d8fe0813b218aeb498faf3b0fc0a7b  Input: axp20x-pek - avoid needless newline removal

elapsed time: 1951m

configs tested: 105
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
arc                   randconfig-001-20231001   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231001   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231001   gcc  
i386         buildonly-randconfig-002-20231001   gcc  
i386         buildonly-randconfig-003-20231001   gcc  
i386         buildonly-randconfig-004-20231001   gcc  
i386         buildonly-randconfig-005-20231001   gcc  
i386         buildonly-randconfig-006-20231001   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231001   gcc  
i386                  randconfig-002-20231001   gcc  
i386                  randconfig-003-20231001   gcc  
i386                  randconfig-004-20231001   gcc  
i386                  randconfig-005-20231001   gcc  
i386                  randconfig-006-20231001   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231001   gcc  
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
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231001   gcc  
x86_64                randconfig-002-20231001   gcc  
x86_64                randconfig-003-20231001   gcc  
x86_64                randconfig-004-20231001   gcc  
x86_64                randconfig-005-20231001   gcc  
x86_64                randconfig-006-20231001   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
