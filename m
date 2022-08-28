Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B046B5A3F0F
	for <lists+linux-input@lfdr.de>; Sun, 28 Aug 2022 20:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiH1SU1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Aug 2022 14:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiH1SU1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Aug 2022 14:20:27 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D6B27FFD
        for <linux-input@vger.kernel.org>; Sun, 28 Aug 2022 11:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661710825; x=1693246825;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IRPo1O6Fh9ITyYe3kMQaBePyBvQr9ahbEo499Or0s28=;
  b=cYg6FjbppVhIocWm9YsTn33ixKtmgBFAfLW5IllxAy6HBautwB9qYd2O
   KDB7Rh+WGotVixVhq2pvMBtY5xnOZrLzuK1kUtcYYyColUglcDwG+/JGY
   l1K+InyhEYKjvLjbK1ipAaR/ZDMQ/GF1Bw/8WYGr7Z+YnfDrWcGdFzkZd
   wVaRe8I+vN+5agF0NwHsol8vhxR7s9oxEfogiG2Ab8v6jci2Buyv2hnIz
   GezqeRgoffA4Of1uzlZ32tymljRaIQ//0wIhy2nXbBCrPS0oI3FyB/mOd
   4aWQIEfkyopKG0AQVjKOIPV3yIEwnBt4q9MfkZ2u38Q4ThEgbwUBSMcNt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="292339009"
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="292339009"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 11:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="939332330"
Received: from lkp-server01.sh.intel.com (HELO fc16deae1c42) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2022 11:20:23 -0700
Received: from kbuild by fc16deae1c42 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSMtT-0001Tb-0j;
        Sun, 28 Aug 2022 18:20:23 +0000
Date:   Mon, 29 Aug 2022 02:19:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 98e01215708b6d416345465c09dce2bd4868c67a
Message-ID: <630bb1be.iw6gDg3ErpDdDDeo%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 98e01215708b6d416345465c09dce2bd4868c67a  Input: iforce - wake up after clearing IFORCE_XMIT_RUNNING flag

elapsed time: 797m

configs tested: 105
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                              defconfig
loongarch                         allnoconfig
x86_64                               rhel-8.3
loongarch                           defconfig
i386                             allyesconfig
riscv                             allnoconfig
riscv                    nommu_virt_defconfig
x86_64                           allyesconfig
i386                         debian-10.3-func
x86_64                           rhel-8.3-kvm
i386                        debian-10.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arc                               allnoconfig
i386                   debian-10.3-kselftests
x86_64                          rhel-8.3-func
i386                          debian-10.3-kvm
i386                              debian-10.3
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                randconfig-r042-20220828
x86_64                        randconfig-a015
arm                        shmobile_defconfig
alpha                             allnoconfig
csky                              allnoconfig
x86_64                        randconfig-a013
arm                                 defconfig
arc                  randconfig-r043-20220828
x86_64                         rhel-8.3-kunit
csky                                defconfig
arm                              allyesconfig
x86_64                        randconfig-a002
s390                 randconfig-r044-20220828
arm64                            allyesconfig
x86_64                                  kexec
x86_64                        randconfig-a011
ia64                          tiger_defconfig
mips                           ip32_defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                        randconfig-a006
riscv                            allmodconfig
sparc                            allyesconfig
i386                          randconfig-a014
alpha                               defconfig
i386                          randconfig-a001
s390                             allyesconfig
s390                                defconfig
mips                          rb532_defconfig
i386                          randconfig-a012
powerpc                          allyesconfig
sh                           se7750_defconfig
sparc                               defconfig
xtensa                           allyesconfig
riscv                               defconfig
i386                          randconfig-a016
i386                          randconfig-a003
parisc                              defconfig
riscv                            allyesconfig
nios2                               defconfig
x86_64                        randconfig-a004
arm                          pxa3xx_defconfig
i386                          randconfig-a005
nios2                            allyesconfig
mips                      maltasmvp_defconfig
parisc                           allyesconfig
ia64                             allmodconfig
parisc64                            defconfig
i386                          randconfig-c001
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arm64                               defconfig
ia64                                defconfig
m68k                                defconfig
arm                              allmodconfig
mips                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220828
hexagon              randconfig-r045-20220828
x86_64                        randconfig-a005
x86_64                        randconfig-a001
arm                      tct_hammer_defconfig
mips                        qi_lb60_defconfig
i386                          randconfig-a013
powerpc                    ge_imp3a_defconfig
arm                       netwinder_defconfig
i386                          randconfig-a011
x86_64                        randconfig-a016
arm                     am200epdkit_defconfig
x86_64                        randconfig-a003
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a014
i386                          randconfig-a004
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
