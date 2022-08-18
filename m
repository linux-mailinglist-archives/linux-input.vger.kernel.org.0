Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B760597FF8
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 10:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239481AbiHRIVj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 04:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239095AbiHRIVi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 04:21:38 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEB17AC35
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660810898; x=1692346898;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jdnqsImNCZHgPtdvh3C6Im4J7/oGKghJAOAJSlbpgFY=;
  b=Q7aa3oLg7lKSaymgGRi6MJDtfakYmfzzjH2F5EFbbm0hvWlN8qWVWcQY
   XSX1cbgIcqdxF12WorcGtL7jJqdI8i13LQoJWx9lElfa4hPb8tuOUDkyb
   XwQNKKWPLQ5LK/XKnVLlYopxuUQSfkWQidHuSjVDMhO0OgT3dq9g8HBU8
   cBsVgil88qHVMuMaJJDcEDTK3WGXOh+iAAsvx1Y7wIUvjjBKSaIp63sSo
   03ionJzY62w7mpYUbpr28Zq7/F2MN/SzQU0w8EbvhMiIKoi5IaIuuhIEM
   sUcD2FRuZvIU7s+Iib+qM6747dRE+TEcEeDxnLnqjWWvJ58HpEYukgpVn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="293976242"
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="293976242"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 01:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; 
   d="scan'208";a="640772693"
Received: from lkp-server01.sh.intel.com (HELO 6cc724e23301) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Aug 2022 01:21:36 -0700
Received: from kbuild by 6cc724e23301 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oOamV-0000Fh-2k;
        Thu, 18 Aug 2022 08:21:35 +0000
Date:   Thu, 18 Aug 2022 16:21:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 24c06e000e8fa237ff2d960def0768a47d0db7b1
Message-ID: <62fdf679.DsKNyx+uRF2SQnwx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 24c06e000e8fa237ff2d960def0768a47d0db7b1  Input: adc-joystick - add polled input device support

elapsed time: 726m

configs tested: 113
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a013
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a015
riscv                randconfig-r042-20220818
s390                 randconfig-r044-20220818
arc                  randconfig-r043-20220818
arm                             pxa_defconfig
powerpc                      ppc40x_defconfig
powerpc                      mgcoge_defconfig
powerpc                      cm5200_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
sparc                       sparc32_defconfig
sh                          r7785rp_defconfig
mips                  decstation_64_defconfig
arm                         cm_x300_defconfig
i386                          randconfig-c001
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
mips                      loongson3_defconfig
sh                          polaris_defconfig
arc                          axs103_defconfig
powerpc                       maple_defconfig
sh                        edosk7705_defconfig
arm                            zeus_defconfig
nios2                         3c120_defconfig
sh                           se7712_defconfig
arm                          pxa3xx_defconfig
arm                            xcep_defconfig
sh                               alldefconfig
ia64                         bigsur_defconfig
nios2                            allyesconfig
arm                          exynos_defconfig
arm                           tegra_defconfig
mips                           ip32_defconfig
m68k                            mac_defconfig
arc                          axs101_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 mpc837x_mds_defconfig
alpha                            alldefconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arc                 nsimosci_hs_smp_defconfig
sh                         microdev_defconfig
sh                          lboxre2_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                             sh03_defconfig
arm                          simpad_defconfig
sh                        edosk7760_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                        m5307c3_defconfig
arm                             ezx_defconfig
mips                        vocore2_defconfig
arm                        oxnas_v6_defconfig
m68k                          hp300_defconfig
powerpc                         ps3_defconfig
nios2                               defconfig
powerpc                     tqm8548_defconfig

clang tested configs:
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
powerpc                 mpc8560_ads_defconfig
arm                           spitz_defconfig
powerpc                 xes_mpc85xx_defconfig
x86_64                        randconfig-k001
powerpc                          g5_defconfig
arm64                            allyesconfig
arm                          ixp4xx_defconfig
powerpc                      obs600_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
