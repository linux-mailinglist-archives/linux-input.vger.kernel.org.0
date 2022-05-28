Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50609536DFF
	for <lists+linux-input@lfdr.de>; Sat, 28 May 2022 19:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238734AbiE1RvF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 May 2022 13:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239804AbiE1Ruz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 May 2022 13:50:55 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450751057E
        for <linux-input@vger.kernel.org>; Sat, 28 May 2022 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653760254; x=1685296254;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1O1ZGD2DcBxmNcRwFxNPWxMQ4TCkefl3blaKYH4SWfE=;
  b=j53Vy3FxzneP2vDiDI65bR8EZLZ93z8roteOiZECm3z/Xd8B4Ts67EPr
   UPsjd92PPTz+03rLTOxAgPVYw0UyE+Os06L4755nQeY4H8SbSVp51MknV
   zfMQ/WYqOlVcbANCJ5zk5f97qNGh8V7GcZbFF6PvYJLFJj/F7n/2xu/xX
   D7bLzPH9JHPslOOPGgQ9pFFUduemCCgd5hooQhf3abGwhY8qCRS6kdgmC
   s7ymBVlRjM4NZuFJfdk1HBI8AvdEjRK0JsDbsx0hTCmAA19YoxjTKelQ8
   6GB2I6RoK1lnRLB/b4oN7bHLyLFQo+CBXkhQWd2ckN2L3ORh3RzBtiPFZ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10361"; a="361081855"
X-IronPort-AV: E=Sophos;i="5.91,259,1647327600"; 
   d="scan'208";a="361081855"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2022 10:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,259,1647327600"; 
   d="scan'208";a="719316028"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 May 2022 10:50:52 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nv0aS-0000Ox-6X;
        Sat, 28 May 2022 17:50:52 +0000
Date:   Sun, 29 May 2022 01:49:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 ba0f32141bc515da2269ebba468741dffe2f9f43
Message-ID: <629260c1.O2Atw3REZGB0OZA6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: ba0f32141bc515da2269ebba468741dffe2f9f43  Input: cros_ec_keyb - handle x86 detachable/convertible Chromebooks

elapsed time: 722m

configs tested: 114
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
sh                             sh03_defconfig
xtensa                           alldefconfig
arc                     haps_hs_smp_defconfig
powerpc                 mpc8540_ads_defconfig
sh                            hp6xx_defconfig
mips                 decstation_r4k_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm8555_defconfig
sh                            shmin_defconfig
arm                           u8500_defconfig
alpha                               defconfig
sh                           se7712_defconfig
powerpc                     ep8248e_defconfig
sh                          sdk7786_defconfig
xtensa                  cadence_csp_defconfig
sh                          kfr2r09_defconfig
ia64                                defconfig
powerpc                    adder875_defconfig
m68k                          atari_defconfig
sh                          r7780mp_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                     magicpanelr2_defconfig
arm                  randconfig-c002-20220526
arm                  randconfig-c002-20220524
x86_64                        randconfig-c001
ia64                             allyesconfig
ia64                             allmodconfig
riscv                             allnoconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                                defconfig
parisc                              defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a005
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220524
riscv                randconfig-r042-20220524
arc                  randconfig-r043-20220526
riscv                randconfig-r042-20220526
s390                 randconfig-r044-20220526
arc                  randconfig-r043-20220524
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                    gamecube_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a006
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220524
hexagon              randconfig-r045-20220526
hexagon              randconfig-r041-20220526
hexagon              randconfig-r041-20220524

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
