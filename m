Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC9404EFC92
	for <lists+linux-input@lfdr.de>; Sat,  2 Apr 2022 00:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236823AbiDAWIo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Apr 2022 18:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235963AbiDAWIo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Apr 2022 18:08:44 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04701B8FDC
        for <linux-input@vger.kernel.org>; Fri,  1 Apr 2022 15:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648850813; x=1680386813;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MFpcRCHbvp0wZQnO08aR9Q/VHcBGCE27dwmm1G6a0Mo=;
  b=YaPuF0qvuXBvMAxv2/VVw7ayYPLOtpahkF8Mw2hyy6MNGZBKfmaoLq9D
   YLj5Wxi/1NdDaUVCA554vn9dhC8YmkXJK3x4JrbpC2FJ4+lrpqVDza2dF
   AMcOZb4tVrGDbQT5nd8cIcMPqbdIBtQCmPNkImZESkcm61PPbwLD5YBOu
   sQLaXWj9btDbBmrVttqRBgf4gR+ChfwlhOKZ4hez13MaVRaJKwLhMXU/a
   kk+QgrvM0KltIeerR2u0txJA3FZPhPHK9gmlOhMBPRF8+ni2h3OfFwYkH
   yGsXNyARnrjcprvVJtQ0/1XnZvnmQFRVnY+cCo34eiqkOW9VVOtADX4+R
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="260226084"
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="260226084"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 15:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="522933696"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Apr 2022 15:06:52 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1naPPv-0001YO-Gc;
        Fri, 01 Apr 2022 22:06:51 +0000
Date:   Sat, 02 Apr 2022 06:06:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 8b188fba75195745026e11d408e4a7e94e01d701
Message-ID: <62477762.50QxWW8vBKXFPxmE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 8b188fba75195745026e11d408e4a7e94e01d701  Revert "Input: clear BTN_RIGHT/MIDDLE on buttonpads"

elapsed time: 968m

configs tested: 110
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                          randconfig-c001
mips                           xway_defconfig
sh                          lboxre2_defconfig
arm                           h5000_defconfig
powerpc                       holly_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7619_defconfig
xtensa                  audio_kc705_defconfig
arm                        clps711x_defconfig
arm                            zeus_defconfig
sh                          r7780mp_defconfig
sh                           se7705_defconfig
sh                          polaris_defconfig
m68k                         apollo_defconfig
sh                          rsk7269_defconfig
arm                        keystone_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220331
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220331
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc              randconfig-c003-20220331
x86_64                        randconfig-c007
s390                 randconfig-c005-20220331
arm                  randconfig-c002-20220331
riscv                randconfig-c006-20220331
mips                 randconfig-c004-20220331
i386                          randconfig-c001
mips                        bcm63xx_defconfig
arm                         shannon_defconfig
arm                       imx_v4_v5_defconfig
arm                        vexpress_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220331
hexagon              randconfig-r041-20220331
riscv                randconfig-r042-20220331
s390                 randconfig-r044-20220331
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
