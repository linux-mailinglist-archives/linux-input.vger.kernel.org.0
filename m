Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F899665C24
	for <lists+linux-input@lfdr.de>; Wed, 11 Jan 2023 14:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbjAKNIo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Jan 2023 08:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbjAKNIe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Jan 2023 08:08:34 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB311A381
        for <linux-input@vger.kernel.org>; Wed, 11 Jan 2023 05:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673442512; x=1704978512;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G/oJmPRwKT2zMCmCEqT0l3JP+DXp+xujhyBzht2a2NU=;
  b=gsz95nEinN/nKIRszyWclZ37LWjvYSioxnv0TomAXLVa2ydrZDoSRrlH
   h12JQXGlq+9SB34K7CxzfmjnV05FSMgdNe0YL07f4wwrWpRuZXMmZ01uH
   Y/4DMCjIKUNtrtxuux9R/66GnWkfi4C1gXska4nXRxp1XDl1M1gkAyrd2
   uNEY8PZV3xrws396wiUJIcnSFeT+i6ijRbNO2l/R6Lgu+GtwQoO+newJO
   Us11erJ1soO8cLGtsZNiFgThSNEgJIHk597/lKCkw7anO9hZTMCAUUC6X
   GiCc/jLzqDc1/BdyAQggcAfYPDgeXPi+9IcM8X5kks/xz/L4meEPEQnEr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="323472913"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="323472913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 05:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="659364593"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="659364593"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jan 2023 05:08:31 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFaqD-00099c-2q;
        Wed, 11 Jan 2023 13:08:29 +0000
Date:   Wed, 11 Jan 2023 21:07:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 407da561244b9d51e6a794d6305ba38ec2c9d907
Message-ID: <63beb4ab.ExsekrRfZRaACEm9%lkp@intel.com>
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
branch HEAD: 407da561244b9d51e6a794d6305ba38ec2c9d907  Merge tag 'v6.2-rc3' into next

elapsed time: 725m

configs tested: 110
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
x86_64                            allnoconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
s390                 randconfig-r044-20230110
sh                               allmodconfig
arc                  randconfig-r043-20230110
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20230110
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
m68k                          amiga_defconfig
riscv                            allmodconfig
sh                   rts7751r2dplus_defconfig
m68k                                defconfig
sh                          rsk7201_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                     taishan_defconfig
arm                         assabet_defconfig
parisc                generic-64bit_defconfig
mips                        vocore2_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                  iss476-smp_defconfig
sh                          r7780mp_defconfig
mips                           gcw0_defconfig
mips                         bigsur_defconfig
sh                          sdk7786_defconfig
sh                             espt_defconfig
openrisc                         alldefconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
arc                           tb10x_defconfig
csky                             alldefconfig
arm                        keystone_defconfig
sh                          rsk7264_defconfig
sh                           se7722_defconfig
i386                             alldefconfig
sh                         microdev_defconfig
sh                          urquell_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                          badge4_defconfig
i386                          randconfig-c001
s390                       zfcpdump_defconfig
arm                         lubbock_defconfig
powerpc                     redwood_defconfig
sh                          rsk7203_defconfig
sh                            hp6xx_defconfig

clang tested configs:
arm                  randconfig-r046-20230110
hexagon              randconfig-r045-20230110
hexagon              randconfig-r041-20230110
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
riscv                randconfig-r042-20230111
s390                 randconfig-r044-20230111
hexagon              randconfig-r041-20230111
hexagon              randconfig-r045-20230111

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
