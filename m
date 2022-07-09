Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0A156CAF7
	for <lists+linux-input@lfdr.de>; Sat,  9 Jul 2022 19:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiGIRs4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Jul 2022 13:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiGIRs4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Jul 2022 13:48:56 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9144CDE
        for <linux-input@vger.kernel.org>; Sat,  9 Jul 2022 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657388934; x=1688924934;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2OQf7NP9cUsLRzEwgj1vZzZKBpj8efBOefLoAmviz3o=;
  b=VjV68sEvTy8EpcYtPvBeFnX/VaU8o/JyW4a7mvKHFJ/XUoFkMBWvD/3T
   eq2pJq8iSBTA+Lg1xkzo+wlGkHFbxPKgPl7AptUCetX1DqII2v1oatR7w
   LK5isQbCrcNyDhhi9o4lPXo5HpKEniJm3SFftqg7XUOFdYqulGe+8xtLU
   6qwGXGXRU+xMYRzADchbO6cdr3Ia25Dee8D0F9GZs84yQB/AKyr01xGe1
   Z9ifYdA72wbLrsw8B2LafXM7UwQSjjHiNMlwOYYnFZbr8hrHwGebANC3R
   LJ0FDwsDXWQp2rCgryNiGiZZmyrL6yejdY76r+a/nljKA+2uE9OhN60d7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="348435232"
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; 
   d="scan'208";a="348435232"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2022 10:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; 
   d="scan'208";a="621590889"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Jul 2022 10:48:53 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oAEZY-000OyG-Kn;
        Sat, 09 Jul 2022 17:48:52 +0000
Date:   Sun, 10 Jul 2022 01:48:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 94c8e8664ab6f781b2ba1258c3bb389131f5ebb4
Message-ID: <62c9bf7f.66necJBbuP+V3ox2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 94c8e8664ab6f781b2ba1258c3bb389131f5ebb4  Input: i8042 - add dritek quirk for Acer Aspire One AO532

elapsed time: 723m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
m68k                         apollo_defconfig
arm                      footbridge_defconfig
microblaze                      mmu_defconfig
sh                          rsk7264_defconfig
arc                 nsimosci_hs_smp_defconfig
ia64                          tiger_defconfig
sh                        edosk7705_defconfig
sh                           se7721_defconfig
sh                           se7750_defconfig
mips                         rt305x_defconfig
alpha                            alldefconfig
sh                        apsh4ad0a_defconfig
sh                          r7785rp_defconfig
parisc                generic-32bit_defconfig
arc                         haps_hs_defconfig
mips                          rb532_defconfig
um                                  defconfig
m68k                             allyesconfig
sh                           se7619_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220707
s390                 randconfig-r044-20220707
riscv                randconfig-r042-20220707
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                  mpc866_ads_defconfig
powerpc                   microwatt_defconfig
mips                        maltaup_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      walnut_defconfig
powerpc                          g5_defconfig
mips                       rbtx49xx_defconfig
arm                         palmz72_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220707
hexagon              randconfig-r045-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
