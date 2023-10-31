Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A42A7DC4B9
	for <lists+linux-input@lfdr.de>; Tue, 31 Oct 2023 04:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbjJaDHa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Oct 2023 23:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjJaDH3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Oct 2023 23:07:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EB5C6
        for <linux-input@vger.kernel.org>; Mon, 30 Oct 2023 20:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698721647; x=1730257647;
  h=date:from:to:cc:subject:message-id;
  bh=mrYaGEEyGz/VDqGJKd2f6c0b/sH2N6ZQeqP/foc5knY=;
  b=MVlR9Xw0o/VwbBL4TAGmSXOBrWj6VtzmoHKT8nhNQHLAM7qHAQbsA3+g
   t7wNFIQYodByODKZNfDAnF7S1xPPa0PlRbEeaQwJI7j0QlJsnfcz+MaiZ
   heBQyC5KjlFasxrzdp8NAlY4/CoY8aOkYOCrme0LfuMAGKLVlJESinIWy
   NGNPaKIQkbK6GvUZv0n01UmM/DA3kMK9wD7rujwc4yM8SYwkj/fkpfTfx
   ad3dcqseQbIyplmZ/z274Pv3TeAWkn/RRgw0/+MAUBggFgTCiXwEVR56a
   +d9BCM3+P2nKWjUsLutJff0R9e+wbRxCihKbRuMjWDoPwGVdtS1eNArN9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="9733056"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="9733056"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 20:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764107038"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="764107038"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Oct 2023 20:07:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qxf6B-000DmJ-1y;
        Tue, 31 Oct 2023 03:07:23 +0000
Date:   Tue, 31 Oct 2023 11:06:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 28d3fe32354701decc3e76d89712569c269b5e4f
Message-ID: <202310311146.LFo7BiVx-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 28d3fe32354701decc3e76d89712569c269b5e4f  Input: walkera0701 - use module_parport_driver macro to simplify the code

elapsed time: 2787m

configs tested: 138
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
arc                   randconfig-001-20231029   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231029   gcc  
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
i386         buildonly-randconfig-001-20231029   gcc  
i386         buildonly-randconfig-002-20231029   gcc  
i386         buildonly-randconfig-003-20231029   gcc  
i386         buildonly-randconfig-004-20231029   gcc  
i386         buildonly-randconfig-005-20231029   gcc  
i386         buildonly-randconfig-006-20231029   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231029   gcc  
i386                  randconfig-002-20231029   gcc  
i386                  randconfig-003-20231029   gcc  
i386                  randconfig-004-20231029   gcc  
i386                  randconfig-005-20231029   gcc  
i386                  randconfig-006-20231029   gcc  
i386                  randconfig-011-20231029   gcc  
i386                  randconfig-012-20231029   gcc  
i386                  randconfig-013-20231029   gcc  
i386                  randconfig-014-20231029   gcc  
i386                  randconfig-015-20231029   gcc  
i386                  randconfig-016-20231029   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231029   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        omega2p_defconfig   clang
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
powerpc                    klondike_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231029   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231029   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231029   gcc  
sparc                       sparc32_defconfig   gcc  
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
x86_64       buildonly-randconfig-001-20231029   gcc  
x86_64       buildonly-randconfig-002-20231029   gcc  
x86_64       buildonly-randconfig-003-20231029   gcc  
x86_64       buildonly-randconfig-004-20231029   gcc  
x86_64       buildonly-randconfig-005-20231029   gcc  
x86_64       buildonly-randconfig-006-20231029   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231029   gcc  
x86_64                randconfig-002-20231029   gcc  
x86_64                randconfig-003-20231029   gcc  
x86_64                randconfig-004-20231029   gcc  
x86_64                randconfig-005-20231029   gcc  
x86_64                randconfig-006-20231029   gcc  
x86_64                randconfig-011-20231029   gcc  
x86_64                randconfig-012-20231029   gcc  
x86_64                randconfig-013-20231029   gcc  
x86_64                randconfig-014-20231029   gcc  
x86_64                randconfig-015-20231029   gcc  
x86_64                randconfig-016-20231029   gcc  
x86_64                randconfig-071-20231029   gcc  
x86_64                randconfig-072-20231029   gcc  
x86_64                randconfig-073-20231029   gcc  
x86_64                randconfig-074-20231029   gcc  
x86_64                randconfig-075-20231029   gcc  
x86_64                randconfig-076-20231029   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
