Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D83FE4FA960
	for <lists+linux-input@lfdr.de>; Sat,  9 Apr 2022 17:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbiDIPzU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Apr 2022 11:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236516AbiDIPzU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Apr 2022 11:55:20 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004392716
        for <linux-input@vger.kernel.org>; Sat,  9 Apr 2022 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649519593; x=1681055593;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vMDBCLIjnP3M/ZdEkPjF8t3qBAnd12yXVqw2o+/ag7o=;
  b=PEU/soQnc8r2axp2yZX2nfQq0F5TJAsc2PFUTGo90UOVVw0gvlJBWPJ0
   JWl63EKMOmDOhk3q/d7YYSI3P8H2vRF9jCcYeTP9W8d2CkPT58U98j7iR
   deE+kokD5jLjizRpWx8dhjeQ3fSm+MxvoZ1rZfhJtoS8yfoNrsWvf30ew
   x0rDc9qGmZkltqlnpJpRR8H6ls9J7RrRXWJBOwD1svsVLw7WHjxRJbDla
   cQ3Vs2b2MRr0d9IlB21ZSY7Thx1iTVcn+LmY50VDy9Kmd13wlZPKjTJwn
   wfabSCcKhzHu8JCZp2wphRNymQGCKCLJj6Qar8rSK6Bn70NUBUyH9dAfC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10312"; a="242412989"
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; 
   d="scan'208";a="242412989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2022 08:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; 
   d="scan'208";a="653785489"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2022 08:53:11 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ndDOg-0000BQ-Vb;
        Sat, 09 Apr 2022 15:53:10 +0000
Date:   Sat, 09 Apr 2022 23:52:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 e505edaedcb9e7d16eefddc62d2189afaea0febc
Message-ID: <6251abbf.g60Cd7XUECSqL/ST%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: e505edaedcb9e7d16eefddc62d2189afaea0febc  Input: add support for Azoteq IQS7222A/B/C

elapsed time: 721m

configs tested: 133
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
mips                  maltasmvp_eva_defconfig
mips                 decstation_r4k_defconfig
arm                       aspeed_g5_defconfig
mips                      loongson3_defconfig
s390                                defconfig
m68k                        m5407c3_defconfig
h8300                            alldefconfig
sh                        edosk7760_defconfig
sh                           se7722_defconfig
arc                          axs103_defconfig
sh                   secureedge5410_defconfig
sh                              ul2_defconfig
sh                           se7712_defconfig
powerpc                    adder875_defconfig
openrisc                            defconfig
powerpc                       maple_defconfig
arm                           stm32_defconfig
arm64                            alldefconfig
nios2                         10m50_defconfig
mips                    maltaup_xpa_defconfig
sh                            migor_defconfig
sh                           se7206_defconfig
arm                        clps711x_defconfig
sh                          sdk7786_defconfig
sh                        dreamcast_defconfig
sh                           sh2007_defconfig
powerpc64                           defconfig
ia64                          tiger_defconfig
powerpc                 mpc8540_ads_defconfig
arm                          gemini_defconfig
sh                          kfr2r09_defconfig
ia64                             alldefconfig
powerpc                     ep8248e_defconfig
h8300                       h8s-sim_defconfig
parisc                generic-32bit_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220408
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220408
arc                  randconfig-r043-20220408
s390                 randconfig-r044-20220408
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220408
riscv                randconfig-c006-20220408
mips                 randconfig-c004-20220408
arm                  randconfig-c002-20220408
mips                        omega2p_defconfig
mips                        bcm63xx_defconfig
arm                       mainstone_defconfig
mips                     loongson1c_defconfig
mips                      pic32mzda_defconfig
powerpc                     pseries_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                     cu1000-neo_defconfig
powerpc               mpc834x_itxgp_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220408
hexagon              randconfig-r041-20220408

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
