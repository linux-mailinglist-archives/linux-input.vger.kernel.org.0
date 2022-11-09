Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6BF6223FE
	for <lists+linux-input@lfdr.de>; Wed,  9 Nov 2022 07:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiKIGgZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Nov 2022 01:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKIGgY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Nov 2022 01:36:24 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2227B19C31
        for <linux-input@vger.kernel.org>; Tue,  8 Nov 2022 22:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667975784; x=1699511784;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rDoxpqzSDY6IkeRbEK7MQPzq4RWcObj7O+ho1/3W1ps=;
  b=Jts98MEX65r7yl0vGPqhqBgk81JVPc32FhvLhZ9ovwnMUfQYlDGlUxlR
   6JgrE1FWN0KQ2TW/K7l+4pQORrfp6qtsZuMyWNU7X0V0/FZcc9uNQtMLs
   p2V4VaIxdWIhZ/V8qO46nWjYfuN7W8673ld0F8j8Lu0Ib26recrkiPA4V
   nBe/OTSXwYHi4gvWxctlV8nrkfeosAVPA19qunqJ2tZGdyXNwMPO3weoD
   K9BpdS1ontWlFbZPcS2GMWkpUj+cWTNR3gX34wTEL+vMa/Fnc8n7QCDwo
   7NiZjX9KPmok8ndR8aRTsYXfRAAC04Eb5WzUS8BM9KNOQ5+HHsF5qnI+T
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="298423707"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="298423707"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 22:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="587657562"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="587657562"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Nov 2022 22:36:22 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osehB-00019w-29;
        Wed, 09 Nov 2022 06:36:21 +0000
Date:   Wed, 09 Nov 2022 14:35:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 26c263bf1847d4dadba016a0457c4c5f446407bf
Message-ID: <636b4a48.rg7hwhz71OqG1O2H%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 26c263bf1847d4dadba016a0457c4c5f446407bf  Input: i8042 - apply probe defer to more ASUS ZenBook models

elapsed time: 720m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a006-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a004-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a002-20221107
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sparc                       sparc32_defconfig
csky                             alldefconfig
sh                           se7712_defconfig
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a002-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
arm                        trizeps4_defconfig
arm                           sunxi_defconfig
sh                  sh7785lcr_32bit_defconfig
arc                              alldefconfig
arm                          exynos_defconfig
mips                          rb532_defconfig
arm                             rpc_defconfig
arm                      integrator_defconfig
powerpc                        cell_defconfig
powerpc                     rainier_defconfig
mips                      loongson3_defconfig
powerpc                     sequoia_defconfig
arm                             ezx_defconfig
powerpc                     mpc83xx_defconfig
powerpc                       holly_defconfig
arm                        clps711x_defconfig
arm                      footbridge_defconfig
m68k                       m5275evb_defconfig
nios2                            alldefconfig
powerpc                    klondike_defconfig
powerpc                        warp_defconfig
m68k                        m5272c3_defconfig
sh                           se7722_defconfig
mips                            ar7_defconfig
parisc                generic-64bit_defconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
mips                        bcm47xx_defconfig
riscv                               defconfig
openrisc                 simple_smp_defconfig
arc                        vdk_hs38_defconfig
sh                          rsk7269_defconfig

clang tested configs:
arm                       imx_v4_v5_defconfig
arm                          moxart_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
mips                     cu1000-neo_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
mips                        qi_lb60_defconfig
arm                         mv78xx0_defconfig
mips                          ath25_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
