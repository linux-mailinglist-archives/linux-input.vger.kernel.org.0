Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 509FF4CAC7D
	for <lists+linux-input@lfdr.de>; Wed,  2 Mar 2022 18:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244269AbiCBRwX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Mar 2022 12:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243537AbiCBRwW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Mar 2022 12:52:22 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466C43D4A0
        for <linux-input@vger.kernel.org>; Wed,  2 Mar 2022 09:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646243499; x=1677779499;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w/aKLkzapapvbzesJYN7uH6v9a3gjnTuWEiIgRcHQ/g=;
  b=cbbPPHjPdeYfTIbm3UGs8d6Kjfxjdjzb0cnzfWWQXeRjxPes3qr/K1Dc
   6uGF1a7D9VPahx9EwSlEe4IN++pASUO5GXDFd5XjgJbCySTsXknQKR65a
   8PifYkO9Jyy4EP3eACPLCSh+Evr+huCmWwZt394pPprT9bvqkYmhQmN54
   XbeXEO3fJPu63wjkJtyTMQhIzs96POeDmctU8eTWdE1OB/K6l7ZfhT/LK
   Sxueiy1YiTrnN1d/OFCtvkOBTTW4UNXCTwxZ1HyHGZHwtycu5gKxwlg+L
   aAbDJP49HPew25SND2NM78WHrinTS2Pcv8aFb92L9HXhbiOEMAXc5eAZ8
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251039538"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="251039538"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 09:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="576190834"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 02 Mar 2022 09:51:20 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nPT8C-0001go-99; Wed, 02 Mar 2022 17:51:20 +0000
Date:   Thu, 03 Mar 2022 01:50:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 04b7762e37c95d9b965d16bb0e18dbd1fa2e2861
Message-ID: <621fae7c.Dip4RCodl6EL9hv0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 04b7762e37c95d9b965d16bb0e18dbd1fa2e2861  Input: elan_i2c - fix regulator enable count imbalance after suspend/resume

elapsed time: 722m

configs tested: 147
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220302
i386                          randconfig-c001
mips                 randconfig-c004-20220302
arm                        clps711x_defconfig
powerpc                 mpc834x_itx_defconfig
h8300                               defconfig
sh                           se7705_defconfig
sh                          r7780mp_defconfig
sh                           sh2007_defconfig
mips                      fuloong2e_defconfig
mips                     loongson1b_defconfig
powerpc                    klondike_defconfig
arm                             ezx_defconfig
mips                         bigsur_defconfig
arm                         vf610m4_defconfig
m68k                          atari_defconfig
sh                   secureedge5410_defconfig
arm                          iop32x_defconfig
arc                     nsimosci_hs_defconfig
xtensa                  nommu_kc705_defconfig
mips                        jmr3927_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                 decstation_r4k_defconfig
sparc                            allyesconfig
sh                        sh7785lcr_defconfig
arm                        trizeps4_defconfig
arm                      jornada720_defconfig
m68k                          hp300_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     rainier_defconfig
arm                           stm32_defconfig
xtensa                  cadence_csp_defconfig
powerpc                      mgcoge_defconfig
powerpc                     taishan_defconfig
sparc64                          alldefconfig
powerpc                     asp8347_defconfig
parisc64                         alldefconfig
sh                ecovec24-romimage_defconfig
sh                            titan_defconfig
m68k                        m5272c3_defconfig
powerpc                     tqm8541_defconfig
sh                          sdk7786_defconfig
arm                        shmobile_defconfig
sh                               j2_defconfig
powerpc                   currituck_defconfig
powerpc                     pq2fads_defconfig
powerpc                   motionpro_defconfig
arm                            qcom_defconfig
ia64                             alldefconfig
arm                        oxnas_v6_defconfig
m68k                        stmark2_defconfig
m68k                        m5307c3_defconfig
arc                      axs103_smp_defconfig
xtensa                generic_kc705_defconfig
powerpc64                           defconfig
csky                             alldefconfig
powerpc                         wii_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20220302
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220302
riscv                randconfig-r042-20220302
s390                 randconfig-r044-20220302
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220302
riscv                randconfig-c006-20220302
i386                          randconfig-c001
arm                  randconfig-c002-20220302
mips                 randconfig-c004-20220302
x86_64                        randconfig-c007
powerpc                 mpc8313_rdb_defconfig
mips                      bmips_stb_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220302
hexagon              randconfig-r041-20220302

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
