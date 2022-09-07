Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7535B0B5D
	for <lists+linux-input@lfdr.de>; Wed,  7 Sep 2022 19:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiIGRU3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Sep 2022 13:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiIGRU2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Sep 2022 13:20:28 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516B097B0F
        for <linux-input@vger.kernel.org>; Wed,  7 Sep 2022 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662571226; x=1694107226;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZlskQz9o+vlv9IuuaBmD2udTildbonRTKGCXMDaHJmA=;
  b=Mathb4swTMuCYT6FDYRlGFGCO4A/+oqkfKdU5+TuIsTaqqxSy89Ub/O9
   k0BgVicZuxcHJhzaZFIHyK+1qW5W+ag8KVhb1ObNgMh4svwkawezjLw5z
   UGjw2BU5y1HTLTk8vw7puSC0ikV6ftaA2XRcWsaxYaGz0Ca21j6nxmWtt
   Md7L+F6OICplgpFwt1d0AhgiFoILrr8JODlMhno4GEKldwWRGtXmTNjMR
   UZ9jRk7b6dKpQpoNY/KPLiNB7BeeMx/O8SGiL3u+qNsdEtEhD4OP+X6ey
   KTnNp3SLJXMHPuHeIZjwko4nEENogyQwD6KMjvC59oltb+wCauhmystkX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="297750400"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="297750400"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 10:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="644714906"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2022 10:20:24 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oVyit-0006nx-1G;
        Wed, 07 Sep 2022 17:20:23 +0000
Date:   Thu, 08 Sep 2022 01:19:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 e23c69e3324892f7420686b3aaa0403df6cf152c
Message-ID: <6318d2b8.Bez3XAdsneQYWEHk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: e23c69e3324892f7420686b3aaa0403df6cf152c  Input: xpad - add support for XBOX One Elite paddles

elapsed time: 1302m

configs tested: 162
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220906
riscv                randconfig-r042-20220906
s390                 randconfig-r044-20220906
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
x86_64                        randconfig-a006
powerpc                           allnoconfig
arc                              allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a014
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
x86_64                        randconfig-a002
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
powerpc                    adder875_defconfig
sh                        dreamcast_defconfig
sh                   sh7770_generic_defconfig
sh                          lboxre2_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
sh                           se7750_defconfig
sparc64                          alldefconfig
arm                             ezx_defconfig
powerpc                    amigaone_defconfig
arm                        cerfcube_defconfig
sparc                            allyesconfig
sh                           se7705_defconfig
i386                          randconfig-c001
powerpc                      bamboo_defconfig
powerpc                      makalu_defconfig
arc                         haps_hs_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                         10m50_defconfig
arc                          axs103_defconfig
xtensa                          iss_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
csky                             alldefconfig
m68k                                defconfig
powerpc                     pq2fads_defconfig
alpha                               defconfig
sh                          r7780mp_defconfig
sparc                       sparc64_defconfig
parisc64                            defconfig
powerpc                 canyonlands_defconfig
arm                           viper_defconfig
s390                             allmodconfig
parisc                generic-32bit_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                              defconfig
m68k                        mvme16x_defconfig
arm                         lubbock_defconfig
m68k                       m5475evb_defconfig
sh                        edosk7705_defconfig
xtensa                  nommu_kc705_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
powerpc                mpc7448_hpc2_defconfig
arm                           sama5_defconfig
powerpc                     tqm8548_defconfig
arm                          iop32x_defconfig
mips                           ip32_defconfig
sh                            titan_defconfig
sh                     sh7710voipgw_defconfig
sh                          rsk7264_defconfig
sh                 kfr2r09-romimage_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig
powerpc                 mpc837x_mds_defconfig
m68k                          hp300_defconfig
sh                   sh7724_generic_defconfig
powerpc                  storcenter_defconfig
powerpc                      tqm8xx_defconfig
sh                  sh7785lcr_32bit_defconfig
openrisc                            defconfig
arm                            mps2_defconfig
s390                                defconfig
arc                                 defconfig
s390                             allyesconfig
m68k                          atari_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                      rts7751r2d1_defconfig
sh                          landisk_defconfig
arm                           u8500_defconfig
ia64                             alldefconfig
powerpc                    sam440ep_defconfig
m68k                          amiga_defconfig
m68k                        stmark2_defconfig
sh                                  defconfig
mips                     loongson1b_defconfig
xtensa                         virt_defconfig
ia64                         bigsur_defconfig
arm                        keystone_defconfig
m68k                          multi_defconfig
arm                             pxa_defconfig
mips                           gcw0_defconfig
parisc64                         alldefconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
arm                       spear13xx_defconfig
mips                      malta_kvm_defconfig
arm                    vt8500_v6_v7_defconfig
arm                     davinci_all_defconfig
x86_64                        randconfig-k001
powerpc                     akebono_defconfig
powerpc                   lite5200b_defconfig
arm                              alldefconfig
powerpc                        icon_defconfig
powerpc                      obs600_defconfig
powerpc                     tqm5200_defconfig
powerpc                     mpc512x_defconfig
arm                           spitz_defconfig
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
