Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB915AC59C
	for <lists+linux-input@lfdr.de>; Sun,  4 Sep 2022 19:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235044AbiIDRNM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Sep 2022 13:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235039AbiIDRNL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Sep 2022 13:13:11 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D86F32AAA
        for <linux-input@vger.kernel.org>; Sun,  4 Sep 2022 10:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662311590; x=1693847590;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vCAyjT16r1YBkTPwz7NgeFCxi2FCVvCsXXlb0bbPGGE=;
  b=B5koA2TrwfBIgYl24WC7zlrKfzXcQLYZyYSw6+dDmGs0AXZB51Tpparx
   2BOVjYH1oIIGq5kVqbzoGcHtzowDBGJjKgXRsegRMmzOfUiwYSx6iwDSf
   un32/kcA2S4avhqzfzIK/gpO31LC16d7Z3W+LcXK6CPKpg/8JGpyjtaoR
   boEJCXygs4iKWeNeCcMzYGTnC+URN6ezQIwH3Qj7+CkWDZrso66ZXOPGq
   AcNoCQ/qLh0G/v6spVr3l1JhKdnrtwI5+lRAHfS4NBYc47ZUxi+NVZkMF
   t+QoETjZpw+Gf41uVjPpGlK8VfH5ia68abr6y0xXC7L6AziCD8zisSZR0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="296259952"
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="296259952"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 10:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="590647883"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Sep 2022 10:13:08 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUtBE-0003GP-0f;
        Sun, 04 Sep 2022 17:13:08 +0000
Date:   Mon, 05 Sep 2022 01:12:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:gpio-test] BUILD SUCCESS
 df74c03112c198ccff4679d8e1f38dc8603c7974
Message-ID: <6314dc84.mOP0A1qP3c5ORBm3%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git gpio-test
branch HEAD: df74c03112c198ccff4679d8e1f38dc8603c7974  gpiolib: of: remove [devm_]gpiod_get_from_of_node() APIs

elapsed time: 725m

configs tested: 78
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20220904
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a002
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a013
sh                           se7722_defconfig
x86_64                        randconfig-a011
arm                           u8500_defconfig
arm                         assabet_defconfig
i386                          randconfig-a001
riscv                randconfig-r042-20220904
i386                          randconfig-a003
csky                              allnoconfig
m68k                       m5475evb_defconfig
i386                                defconfig
arm                      integrator_defconfig
mips                       bmips_be_defconfig
x86_64                        randconfig-a004
parisc64                         alldefconfig
mips                      fuloong2e_defconfig
sparc64                          alldefconfig
s390                 randconfig-r044-20220904
x86_64                        randconfig-a015
powerpc                          allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a005
sh                            shmin_defconfig
mips                             allyesconfig
arc                               allnoconfig
powerpc                           allnoconfig
i386                             allyesconfig
alpha                             allnoconfig
riscv                             allnoconfig
ia64                      gensparse_defconfig
sh                               allmodconfig
i386                          randconfig-a014
i386                          randconfig-c001
i386                          randconfig-a012
microblaze                      mmu_defconfig
i386                          randconfig-a016
x86_64                              defconfig
arm                         lpc18xx_defconfig
sparc                               defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
sh                           se7712_defconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220904
hexagon              randconfig-r041-20220904
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
powerpc                          g5_defconfig
x86_64                        randconfig-a005
i386                          randconfig-a002
arm                   milbeaut_m10v_defconfig
x86_64                        randconfig-a014
i386                          randconfig-a006
x86_64                        randconfig-a016
i386                          randconfig-a004
riscv                          rv32_defconfig
i386                          randconfig-a013
powerpc                 mpc8272_ads_defconfig
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
