Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46DA4EDFDD
	for <lists+linux-input@lfdr.de>; Thu, 31 Mar 2022 19:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbiCaRoP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Mar 2022 13:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiCaRoO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Mar 2022 13:44:14 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DFD19B071
        for <linux-input@vger.kernel.org>; Thu, 31 Mar 2022 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648748545; x=1680284545;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bO6O2TLV63nhMBr9IWzS2TbXAfdWdhGdGnkJjwuVs4Y=;
  b=FqLiywgsJz4pkINlzg/kvus8jbNaUKvrJtcEFkDmA/um4mjKvPTXjcsG
   OOpx+5cVOUTdect84ZuOi0Jbbx6xKeA5tkzFB+gfr6Io2FHoYWilKdL1o
   buB5JeyYxIZOiovbr8HGNpL5ti2UOD5lQwtfO3AAC0HGFRbNKtpv/AOLk
   buDoeF/D/xH9hWqAWTmL2Alb1YgzfA3mDW4NH6N9yBfoBN6V2Sbgei+yQ
   paSLOfy+ioZBzO1WDOEljM6u/72MKl+XJFqNXtR8s6LN7i73wGDZSJx+0
   FDfWUd4p22CiB5pzOFdMYUyfL5k3mH9Hs2hG3uhhWfM5bhy55xgE6sH3e
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284830498"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="284830498"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2022 10:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="586523865"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 31 Mar 2022 10:42:02 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nZyo5-0000VE-Rl;
        Thu, 31 Mar 2022 17:42:01 +0000
Date:   Fri, 01 Apr 2022 01:41:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 5710faba8a2a15349c9001bd4b2cd958e56c90fa
Message-ID: <6245e7af.bUQXY9dQbdH62eWz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 5710faba8a2a15349c9001bd4b2cd958e56c90fa  Merge branch 'next' into for-linus

elapsed time: 723m

configs tested: 145
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                ecovec24-romimage_defconfig
arc                                 defconfig
arc                 nsimosci_hs_smp_defconfig
arm64                            alldefconfig
ia64                        generic_defconfig
parisc                              defconfig
s390                       zfcpdump_defconfig
arc                              alldefconfig
sh                            hp6xx_defconfig
sh                            migor_defconfig
powerpc                         wii_defconfig
powerpc                     taishan_defconfig
sh                             shx3_defconfig
powerpc                      chrp32_defconfig
powerpc                 mpc837x_mds_defconfig
sh                         microdev_defconfig
m68k                            q40_defconfig
powerpc                     sequoia_defconfig
arc                    vdk_hs38_smp_defconfig
sh                               j2_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          landisk_defconfig
arm                            mps2_defconfig
nios2                         10m50_defconfig
sh                           sh2007_defconfig
m68k                            mac_defconfig
powerpc                       ppc64_defconfig
arm                          pxa3xx_defconfig
xtensa                    smp_lx200_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7203_defconfig
arm                            xcep_defconfig
arm                         cm_x300_defconfig
arc                     nsimosci_hs_defconfig
sparc                       sparc32_defconfig
powerpc                 linkstation_defconfig
sh                        sh7763rdp_defconfig
powerpc                      arches_defconfig
sh                          kfr2r09_defconfig
openrisc                    or1ksim_defconfig
arm                        trizeps4_defconfig
sh                           se7724_defconfig
arm                       aspeed_g5_defconfig
parisc                           alldefconfig
i386                                defconfig
arc                        nsim_700_defconfig
arm                     eseries_pxa_defconfig
ia64                      gensparse_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220331
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220331
powerpc              randconfig-c003-20220331
riscv                randconfig-c006-20220331
mips                 randconfig-c004-20220331
powerpc                    socrates_defconfig
powerpc                   lite5200b_defconfig
arm                          pcm027_defconfig
powerpc                     ksi8560_defconfig
arm                      pxa255-idp_defconfig
powerpc                     mpc5200_defconfig
mips                     cu1830-neo_defconfig
arm                     am200epdkit_defconfig
i386                             allyesconfig
mips                  cavium_octeon_defconfig
powerpc                     ppa8548_defconfig
arm                            mmp2_defconfig
mips                       rbtx49xx_defconfig
powerpc                    mvme5100_defconfig
arm                            dove_defconfig
mips                        maltaup_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220331
hexagon              randconfig-r041-20220331
riscv                randconfig-r042-20220331

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
