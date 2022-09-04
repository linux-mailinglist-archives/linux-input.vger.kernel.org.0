Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114865AC392
	for <lists+linux-input@lfdr.de>; Sun,  4 Sep 2022 11:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233046AbiIDJOE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Sep 2022 05:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiIDJOD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Sep 2022 05:14:03 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6FA3DBD9
        for <linux-input@vger.kernel.org>; Sun,  4 Sep 2022 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662282842; x=1693818842;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HV+2tIBciVJQghYC/Rumsmw1zgaIcVMSAfCWj9ck8G8=;
  b=kEG2rD+bg1Qd9tji40Mlxvt8cLvW7eGHVeQPeRZlxaJRRNcAy0QqHMHD
   7HNiCY8dWJ6KWlcJuz2jIWzYmtNSNFxE4sbkozfeq1rR+w/jJoGji27FL
   Bb3C2PXcuxh2hapUMBtNjvKotZQprS3rfEQSLJTLcWBL73/VGUZ7T2+Aj
   vGWt4yaXWoIDO5tbwJEV0sin/uOdPA0DWPmEH3mAZJIU/F8qeKj+yJ879
   xmmp1p1ojO/mHcVlnaCK2IgEnSPDDmImH+kNzXr/6JnUypv+WLXZIRo9D
   EJtoXmUIqQ+i9yreWpEK4maIr7GQrUvK/UvPKyemlwaN3ClKJgLW54aoo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="296229474"
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="296229474"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 02:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="564432266"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Sep 2022 02:13:43 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUlhH-0002s9-0M;
        Sun, 04 Sep 2022 09:13:43 +0000
Date:   Sun, 04 Sep 2022 17:13:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 f4e7a254299bcdfe7bced700a7d96690b1b9a6f2
Message-ID: <63146c21.zLaNADEPkTHj0KXM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: f4e7a254299bcdfe7bced700a7d96690b1b9a6f2  Input: aiptek - switch to using dev_groups for driver-specific attributes

elapsed time: 771m

configs tested: 92
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
arc                  randconfig-r043-20220904
riscv                randconfig-r042-20220904
um                           x86_64_defconfig
s390                 randconfig-r044-20220904
i386                                defconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a011
i386                          randconfig-a016
x86_64                        randconfig-a004
i386                          randconfig-a012
sh                               allmodconfig
microblaze                          defconfig
i386                          randconfig-a014
powerpc                          allmodconfig
i386                          randconfig-a003
x86_64                          rhel-8.3-func
x86_64                        randconfig-a013
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                        randconfig-a006
mips                             allyesconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
powerpc                         wii_defconfig
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
i386                          randconfig-a001
m68k                        m5272c3_defconfig
sh                          r7785rp_defconfig
x86_64                    rhel-8.3-kselftests
sh                           se7206_defconfig
arc                      axs103_smp_defconfig
sh                               j2_defconfig
x86_64                        randconfig-a002
arm                                 defconfig
csky                              allnoconfig
arc                               allnoconfig
i386                             allyesconfig
alpha                             allnoconfig
riscv                             allnoconfig
microblaze                      mmu_defconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
sh                          sdk7780_defconfig
m68k                             alldefconfig
mips                      fuloong2e_defconfig
arm                         lpc18xx_defconfig
sparc                               defconfig
sh                           se7712_defconfig
arm                     eseries_pxa_defconfig
arm                        keystone_defconfig
arm                         assabet_defconfig
mips                       bmips_be_defconfig
mips                  decstation_64_defconfig
x86_64                           allyesconfig
arm                      integrator_defconfig
mips                  maltasmvp_eva_defconfig
parisc64                         alldefconfig
sh                   rts7751r2dplus_defconfig
sh                            shmin_defconfig
sh                           se7721_defconfig
ia64                      gensparse_defconfig
alpha                            allyesconfig
m68k                             allyesconfig
arm                              allyesconfig
arc                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
m68k                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220904
hexagon              randconfig-r045-20220904
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a004
arm                        multi_v5_defconfig
i386                          randconfig-a006
powerpc                 mpc8272_ads_defconfig
x86_64                        randconfig-a001
arm                         orion5x_defconfig
arm                           sama7_defconfig
x86_64                        randconfig-a003
powerpc                          g5_defconfig
powerpc                      ppc64e_defconfig
riscv                          rv32_defconfig
arm                            mmp2_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
