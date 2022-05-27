Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4E6535947
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 08:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245291AbiE0G0W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 02:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245212AbiE0G0V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 02:26:21 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400173136E
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 23:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653632779; x=1685168779;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d/NP628nSVBZ77cD5QuMDMneunzWbso1oInOr4u94nE=;
  b=KMSskgWK3p7VX3WeVAuxgljmXqJr07EAIbIo/edhxfPAF85eRr0KPVN+
   a1VyMpIRLgLNFTQyFN7fpJEtMVMpSQNOOb/uEPzgHYEF+Nt/bsXAaQ5zM
   cF3f+lBaz3dBpf95DGJ9J6JhgwWtSpJRLJTNPtg7Wh/ok9SNu0pNESJCd
   8UGwbY0ioySfYnZaEdRJQZE4tu5Qe+2L94G2iy97DCPg+f+fahhhtWbFg
   0Qf7zuT3ajD7S9c3U1o9R3S3U1xvZZ0yFhR4FhsYCi/mdgX3fFR+PGHAE
   Y4qHZFKZAxQgEx3eiThIDIIpszcbio6LTW4aUfzAwgVk0Hq07wQeYfgXo
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="274399549"
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; 
   d="scan'208";a="274399549"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 23:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; 
   d="scan'208";a="704973608"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 May 2022 23:26:17 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nuTQP-0004UA-3H;
        Fri, 27 May 2022 06:26:17 +0000
Date:   Fri, 27 May 2022 14:25:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 5f76955ab1e43e5795a9631b22ca4f918a0ae986
Message-ID: <62906ed7.pFKimDvzOEoq94+t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 5f76955ab1e43e5795a9631b22ca4f918a0ae986  Input: stmfts - do not leave device disabled in stmfts_input_open

elapsed time: 724m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc                      pcm030_defconfig
mips                         db1xxx_defconfig
sh                          polaris_defconfig
arm                         assabet_defconfig
arm                            mps2_defconfig
arm                           imxrt_defconfig
parisc                           alldefconfig
parisc64                            defconfig
arm                         vf610m4_defconfig
sh                            titan_defconfig
sh                           sh2007_defconfig
openrisc                         alldefconfig
sh                           se7712_defconfig
arm                          pxa3xx_defconfig
sh                ecovec24-romimage_defconfig
mips                         bigsur_defconfig
powerpc                      ep88xc_defconfig
arc                           tb10x_defconfig
powerpc                         ps3_defconfig
sh                          sdk7786_defconfig
mips                  maltasmvp_eva_defconfig
sh                        apsh4ad0a_defconfig
arm                     eseries_pxa_defconfig
sh                           se7343_defconfig
sparc                       sparc64_defconfig
s390                       zfcpdump_defconfig
arm                        trizeps4_defconfig
sh                            hp6xx_defconfig
mips                 decstation_r4k_defconfig
riscv                    nommu_k210_defconfig
m68k                        m5407c3_defconfig
powerpc                     ep8248e_defconfig
arc                            hsdk_defconfig
arm                  randconfig-c002-20220526
arm                  randconfig-c002-20220524
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
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
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                              debian-10.3
i386                             allyesconfig
i386                   debian-10.3-kselftests
sparc                               defconfig
i386                                defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a016
i386                          randconfig-a012
i386                          randconfig-a014
x86_64                        randconfig-a006
x86_64                        randconfig-a004
arc                  randconfig-r043-20220524
s390                 randconfig-r044-20220524
riscv                randconfig-r042-20220524
arc                  randconfig-r043-20220526
riscv                randconfig-r042-20220526
s390                 randconfig-r044-20220526
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                      walnut_defconfig
mips                       rbtx49xx_defconfig
mips                         tb0287_defconfig
powerpc                      obs600_defconfig
arm                        mvebu_v5_defconfig
arm                     am200epdkit_defconfig
mips                           ip28_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r045-20220524
hexagon              randconfig-r041-20220524
hexagon              randconfig-r045-20220526
hexagon              randconfig-r041-20220526

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
