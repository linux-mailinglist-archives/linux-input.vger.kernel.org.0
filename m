Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F55963D730
	for <lists+linux-input@lfdr.de>; Wed, 30 Nov 2022 14:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiK3NvX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Nov 2022 08:51:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiK3NvW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Nov 2022 08:51:22 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B3E31340
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 05:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669816278; x=1701352278;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OboYa7wPxZ9+uJE235yjr38ScEuH/aj60mPYmill4nM=;
  b=FI3RsfeXOgKwUZKCZ7K8hXKnClmgvgQaTNTD/ubgzZleo5K/HLru1iP8
   mYmVT/OHpofy9LzaG75HlYwW1LD6J+xI8NYcFr1mRgxHl0Njc4TUbUgta
   GlahL36kabSs/9vedXPIwoSKw15q/JPAesbkGhMTGzOtSx+bojc0ql1wX
   Ex6wAnVKin9owsVHnIetyB/pdCV8aEND4GolVqf4DsqxZfGU9RMTOsseH
   werPBi5IBhZuBUKQFXVCVGgNlO5f2zQVWj1p9GxJtYZz/5GgrpbTnbclW
   FxWynbfiCGtf/95Vz0o/sbtN0tYRdlBgbuowpcVmkiw9JdfJ2pxbfGdE+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="377557696"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="377557696"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 05:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="818634451"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="818634451"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2022 05:51:14 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0NUX-000BDb-2n;
        Wed, 30 Nov 2022 13:51:13 +0000
Date:   Wed, 30 Nov 2022 21:50:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 80fb249da98e6b9e7c3d356da912a67757e92e75
Message-ID: <63875fb5.ZYFu3a6S3CZ1wqUF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 80fb249da98e6b9e7c3d356da912a67757e92e75  Input: elants_i2c - delete some dead code

elapsed time: 730m

configs tested: 93
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
um                             i386_defconfig
s390                             allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
i386                             allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                            allnoconfig
sh                        sh7763rdp_defconfig
powerpc                         ps3_defconfig
xtensa                  cadence_csp_defconfig
mips                      maltasmvp_defconfig
ia64                             allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-a001-20221128
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
i386                 randconfig-a004-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a002-20221128
i386                          randconfig-c001
x86_64               randconfig-a002-20221128
x86_64               randconfig-a001-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a006-20221128
x86_64               randconfig-a005-20221128
x86_64               randconfig-a003-20221128
arm                       omap2plus_defconfig
sh                               j2_defconfig
mips                           ci20_defconfig
sh                          sdk7786_defconfig
arc                     haps_hs_smp_defconfig
powerpc                      cm5200_defconfig
arm                          lpd270_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
sh                           se7750_defconfig
sh                             espt_defconfig
sparc64                          alldefconfig
powerpc                   currituck_defconfig
arc                               allnoconfig
csky                                defconfig
nios2                               defconfig
mips                           gcw0_defconfig
xtensa                    xip_kc705_defconfig
arm                        oxnas_v6_defconfig
sh                          lboxre2_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
i386                 randconfig-a012-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a014-20221128
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
s390                 randconfig-r044-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r045-20221128
x86_64               randconfig-k001-20221128
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
arm                      tct_hammer_defconfig
arm                        vexpress_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
