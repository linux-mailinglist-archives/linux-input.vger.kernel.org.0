Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4BA5301E5
	for <lists+linux-input@lfdr.de>; Sun, 22 May 2022 10:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235978AbiEVIjV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 May 2022 04:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbiEVIjT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 May 2022 04:39:19 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C44DE0
        for <linux-input@vger.kernel.org>; Sun, 22 May 2022 01:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653208758; x=1684744758;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KfW8K1k0sPdqbf6G8sL/z+4bA57KUv7qFebuCkBRUPc=;
  b=Xwfmf036M5zHVXNq1cISNFSpr8c1/EnBG2vCdLuFacVqGKWFsYSaqDRQ
   WPv74c8TMtN3dtgqnYdscI3FtzDtWiyotWtYtNhgljbtJ71OsY9lNmGdz
   2ApFMLzRPBRzxkqLnJ0lahowlmm0MVeTym5rzddEmjzFwSu3LAh7SWfHb
   7W8QJw3FPN9QKD91UNRjW9YXDAbdFkURn6oF4+GBK33O3qDz1xfwJ54+B
   9eG/WcXYlm+/s4KdEu+XrI1Ip3PiO5YS3zEw6CG/B8zRMgrkRJhBFu9HY
   eYtIcx2h/guzCxVTq1cP0J/5YfThFrHAdUK6frQxZc4rx6XgsWTR6iB94
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="298284130"
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="298284130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2022 01:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="900075646"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 May 2022 01:39:16 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nsh7L-0000Dj-Pr;
        Sun, 22 May 2022 08:39:15 +0000
Date:   Sun, 22 May 2022 16:38:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 fabcf4d8696839a8da8a3f90d1fd30ae923ddde7
Message-ID: <6289f6a2.sUCJh6DJ3Y9O+1Bp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: fabcf4d8696839a8da8a3f90d1fd30ae923ddde7  Input: cypress_ps2 - fix typo in comment

elapsed time: 723m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                       imx_v6_v7_defconfig
arm                           imxrt_defconfig
parisc                           alldefconfig
mips                     loongson1b_defconfig
um                                  defconfig
um                               alldefconfig
powerpc                    sam440ep_defconfig
arm                        shmobile_defconfig
powerpc                      cm5200_defconfig
mips                      maltasmvp_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
sh                          rsk7269_defconfig
powerpc                     pq2fads_defconfig
parisc                           allyesconfig
ia64                          tiger_defconfig
sh                           se7750_defconfig
mips                  decstation_64_defconfig
arm                            zeus_defconfig
s390                       zfcpdump_defconfig
arm                       omap2plus_defconfig
powerpc64                           defconfig
mips                 decstation_r4k_defconfig
sh                           se7721_defconfig
arm                           h3600_defconfig
arm                           sama5_defconfig
h8300                     edosk2674_defconfig
arm                           h5000_defconfig
arc                           tb10x_defconfig
m68k                          multi_defconfig
nios2                            alldefconfig
arc                          axs101_defconfig
alpha                               defconfig
powerpc                      ppc6xx_defconfig
m68k                          amiga_defconfig
sh                         microdev_defconfig
arm                  randconfig-c002-20220522
x86_64                        randconfig-c001
ia64                                defconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                  randconfig-c002-20220522
x86_64                        randconfig-c007
s390                 randconfig-c005-20220522
i386                          randconfig-c001
powerpc              randconfig-c003-20220522
riscv                randconfig-c006-20220522
mips                 randconfig-c004-20220522
arm                          ep93xx_defconfig
powerpc                          g5_defconfig
powerpc                    socrates_defconfig
arm                         mv78xx0_defconfig
powerpc                    ge_imp3a_defconfig
mips                      pic32mzda_defconfig
powerpc                 mpc8560_ads_defconfig
arm                      tct_hammer_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc8315_rdb_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220522
hexagon              randconfig-r041-20220522

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
