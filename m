Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3416124D6
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJ2SHC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ2SHC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:07:02 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707C720BD4
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667066821; x=1698602821;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vapkPjqudnyjMqY5phbbRvGp1vzICDEIn5Lc7Eydzfo=;
  b=eetMsOTGrcpylNcDkNaW7uRMSL2+F/nQh7yDccAqm13G9X1CxtHvFGwF
   5eBIG1ug0cMM6XShCV9tThqFr9p7VXnYKRGo6dbm6svlMA42nrG62tg/v
   5t+6TpAMNCnzGRLYW35njwOMjAAXrHkEQMHcCukNTMG2tsLfisj6eqiIe
   UGaOfZeOu8dIJJ2RLIgqY0rpUhWdzWFrAC+h7zSztGa3LWYXbtXUBi63a
   Rid8OOCZilcBgh9kvQifSyaWvvhjYmsqkPfdFClsaRfY7UQOKhHU8/arB
   UjSb6Bgqs69ndKbMxX/h6ceQftr6nyAd/CPz5uXhEIpR02wD5+c27UG07
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="296094023"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="296094023"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 11:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="962360177"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="962360177"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Oct 2022 11:06:54 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooqEQ-000BH5-0Q;
        Sat, 29 Oct 2022 18:06:54 +0000
Date:   Sun, 30 Oct 2022 02:06:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 b78272b5fd9616e611dfb6da216d056223b7a6fd
Message-ID: <635d6baa./C8nw2gngfpJ9Um0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: b78272b5fd9616e611dfb6da216d056223b7a6fd  Input: add driver for Hynitron cstxxx touchscreens

elapsed time: 720m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                               rhel-8.3
arc                                 defconfig
s390                             allmodconfig
m68k                             allyesconfig
i386                          randconfig-a005
x86_64                           allyesconfig
i386                          randconfig-a016
i386                                defconfig
x86_64                        randconfig-a006
alpha                               defconfig
arm                                 defconfig
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20221028
s390                                defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
riscv                randconfig-r042-20221028
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
s390                 randconfig-r044-20221028
arm64                            allyesconfig
arm                              allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a015
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
m68k                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                             allyesconfig
ia64                             allmodconfig
m68k                         apollo_defconfig
m68k                       m5249evb_defconfig
arm                       multi_v4t_defconfig
sh                           se7722_defconfig
arm                        spear6xx_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
sh                            titan_defconfig
powerpc                      mgcoge_defconfig
arm                          pxa3xx_defconfig
sh                        dreamcast_defconfig
i386                          randconfig-c001

clang tested configs:
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a003
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
i386                          randconfig-a013
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a015
s390                 randconfig-r044-20221029
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
