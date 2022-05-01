Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EAC51677A
	for <lists+linux-input@lfdr.de>; Sun,  1 May 2022 21:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343640AbiEATbX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 May 2022 15:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243485AbiEATbW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 May 2022 15:31:22 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C7841F8E
        for <linux-input@vger.kernel.org>; Sun,  1 May 2022 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651433276; x=1682969276;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zqyDfAzlOH4QhUyHEfP5D2/EQcQBr5pF9LoGjlnZIMI=;
  b=aJ8Z3tiS2zBHvwZ5Qi4B5qIusvHiRyHwb8i1tTgWK5OQ0wuQSl8IH1vZ
   1UJ0jprCAIr6bmVC+dWCecpjCw0aF5m2+eDJJf5d0o+4LTyHbviD9mrYP
   tI8LcWYCewpvH3D06T6f0c0QDkJFE0RbKpC9OK61Zihtk8fzOgp6Urqll
   NXbWqFQU3GveRVXIo2J6hYuH19gUN5+VAcYqtRIjs67okwoENZegOqLdj
   XPcX5aH78/WRHy3SCZNHfgB83RC4goa1Tq8x7gDU1owKI2Eht3cBMUWNG
   TSLzcs7xlHlzZQ/ZcQ9QQ8o6vReeqVEq/wpfrvDEGnYgUxmw1TF7nXCCj
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247603906"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="247603906"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 12:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="598313922"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 May 2022 12:27:54 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nlFEX-00091X-FM;
        Sun, 01 May 2022 19:27:53 +0000
Date:   Mon, 02 May 2022 03:27:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 4352e23a7ff2f8a4ff229dd1283ed2f2b708ec51
Message-ID: <626edf2f.G+xdBj3ZgujYL+vz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 4352e23a7ff2f8a4ff229dd1283ed2f2b708ec51  Input: cros-ec-keyb - only register keyboard if rows/columns exist

elapsed time: 6949m

configs tested: 362
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220425
mips                     decstation_defconfig
m68k                            q40_defconfig
arm                           corgi_defconfig
sh                           se7724_defconfig
parisc                generic-32bit_defconfig
sh                           se7750_defconfig
powerpc                      pcm030_defconfig
xtensa                          iss_defconfig
m68k                         amcore_defconfig
arc                        nsim_700_defconfig
sh                           se7206_defconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
mips                  decstation_64_defconfig
arm                            zeus_defconfig
s390                             allmodconfig
sh                          rsk7264_defconfig
mips                  maltasmvp_eva_defconfig
mips                      maltasmvp_defconfig
sh                        sh7763rdp_defconfig
mips                           ci20_defconfig
arm                         lubbock_defconfig
m68k                                defconfig
sh                          sdk7780_defconfig
powerpc                     tqm8555_defconfig
arm                         s3c6400_defconfig
parisc                generic-64bit_defconfig
alpha                               defconfig
mips                    maltaup_xpa_defconfig
arc                        nsimosci_defconfig
powerpc                      arches_defconfig
powerpc                 linkstation_defconfig
sh                     sh7710voipgw_defconfig
sh                        edosk7705_defconfig
mips                           ip32_defconfig
arm                          lpd270_defconfig
riscv                            allyesconfig
ia64                      gensparse_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                       bvme6000_defconfig
arm                         lpc18xx_defconfig
arm                          pxa910_defconfig
powerpc                     ep8248e_defconfig
s390                                defconfig
mips                         tb0226_defconfig
sh                        edosk7760_defconfig
powerpc                 mpc834x_mds_defconfig
arc                            hsdk_defconfig
mips                          rb532_defconfig
powerpc                       holly_defconfig
mips                        vocore2_defconfig
powerpc                      ppc6xx_defconfig
arm                       multi_v4t_defconfig
arm                      jornada720_defconfig
powerpc                    adder875_defconfig
sh                           se7619_defconfig
sh                   secureedge5410_defconfig
sh                            shmin_defconfig
sh                          r7780mp_defconfig
sh                     magicpanelr2_defconfig
nios2                               defconfig
h8300                    h8300h-sim_defconfig
arm                        oxnas_v6_defconfig
h8300                     edosk2674_defconfig
arm                      footbridge_defconfig
arc                     haps_hs_smp_defconfig
parisc                           alldefconfig
sh                         microdev_defconfig
powerpc                     taishan_defconfig
sparc                       sparc64_defconfig
powerpc                        cell_defconfig
arm                         cm_x300_defconfig
h8300                            alldefconfig
powerpc                       eiger_defconfig
sh                          kfr2r09_defconfig
powerpc                   currituck_defconfig
mips                            gpr_defconfig
m68k                       m5208evb_defconfig
arc                              alldefconfig
powerpc                 mpc837x_mds_defconfig
xtensa                       common_defconfig
sh                             sh03_defconfig
arm                       imx_v6_v7_defconfig
m68k                            mac_defconfig
ia64                         bigsur_defconfig
m68k                          sun3x_defconfig
arm                         nhk8815_defconfig
powerpc                     tqm8541_defconfig
arm                            lart_defconfig
powerpc                         ps3_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc8540_ads_defconfig
arm                          pxa3xx_defconfig
arm                          exynos_defconfig
powerpc                 mpc834x_itx_defconfig
arm                             pxa_defconfig
arm                        keystone_defconfig
arm                         vf610m4_defconfig
m68k                           sun3_defconfig
powerpc                     mpc83xx_defconfig
sh                      rts7751r2d1_defconfig
sh                         ap325rxa_defconfig
mips                       bmips_be_defconfig
m68k                        m5272c3_defconfig
sh                             shx3_defconfig
sh                           se7780_defconfig
arc                     nsimosci_hs_defconfig
m68k                       m5249evb_defconfig
xtensa                           alldefconfig
arm                          gemini_defconfig
sh                          landisk_defconfig
arc                         haps_hs_defconfig
xtensa                  cadence_csp_defconfig
arm                         assabet_defconfig
parisc                              defconfig
powerpc                     tqm8548_defconfig
sh                         ecovec24_defconfig
xtensa                         virt_defconfig
powerpc                      mgcoge_defconfig
powerpc                   motionpro_defconfig
m68k                       m5475evb_defconfig
arm                            qcom_defconfig
mips                         db1xxx_defconfig
m68k                          multi_defconfig
sh                   sh7724_generic_defconfig
mips                     loongson1b_defconfig
m68k                        m5307c3_defconfig
mips                            ar7_defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
mips                      loongson3_defconfig
arm                          simpad_defconfig
nios2                            allyesconfig
arm                        cerfcube_defconfig
arm                      integrator_defconfig
um                               alldefconfig
sh                          rsk7201_defconfig
arm                        multi_v7_defconfig
sh                ecovec24-romimage_defconfig
microblaze                          defconfig
powerpc                     pq2fads_defconfig
arm                           sunxi_defconfig
sh                           se7751_defconfig
powerpc64                        alldefconfig
arm                           sama5_defconfig
ia64                             alldefconfig
sh                          lboxre2_defconfig
mips                       capcella_defconfig
m68k                          atari_defconfig
arm                            mps2_defconfig
sh                           sh2007_defconfig
powerpc                     asp8347_defconfig
sparc64                          alldefconfig
sh                  sh7785lcr_32bit_defconfig
arm                       aspeed_g5_defconfig
m68k                             alldefconfig
arm                           h3600_defconfig
powerpc                    amigaone_defconfig
sh                           se7721_defconfig
powerpc                           allnoconfig
powerpc                      cm5200_defconfig
arm                           tegra_defconfig
sh                            hp6xx_defconfig
openrisc                 simple_smp_defconfig
arm                     eseries_pxa_defconfig
arm                           imxrt_defconfig
openrisc                    or1ksim_defconfig
i386                             alldefconfig
m68k                        mvme16x_defconfig
i386                                defconfig
mips                           jazz_defconfig
powerpc                      makalu_defconfig
powerpc                      chrp32_defconfig
sh                               allmodconfig
sh                        sh7785lcr_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                   rts7751r2dplus_defconfig
parisc64                            defconfig
powerpc                  storcenter_defconfig
x86_64                           alldefconfig
powerpc                    sam440ep_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220428
arm                  randconfig-c002-20220501
x86_64               randconfig-c001-20220425
arm                  randconfig-c002-20220425
arm                  randconfig-c002-20220427
arm                  randconfig-c002-20220429
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
csky                                defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64               randconfig-a015-20220425
x86_64               randconfig-a014-20220425
x86_64               randconfig-a011-20220425
x86_64               randconfig-a013-20220425
x86_64               randconfig-a012-20220425
x86_64               randconfig-a016-20220425
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
i386                 randconfig-a014-20220425
i386                 randconfig-a012-20220425
i386                 randconfig-a011-20220425
i386                 randconfig-a015-20220425
i386                 randconfig-a013-20220425
i386                 randconfig-a016-20220425
arc                  randconfig-r043-20220501
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
arc                  randconfig-r043-20220428
arc                  randconfig-r043-20220429
s390                 randconfig-r044-20220429
riscv                randconfig-r042-20220429
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz

clang tested configs:
riscv                randconfig-c006-20220427
mips                 randconfig-c004-20220427
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220427
powerpc              randconfig-c003-20220427
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
powerpc              randconfig-c003-20220501
riscv                randconfig-c006-20220501
mips                 randconfig-c004-20220501
arm                  randconfig-c002-20220501
s390                 randconfig-c005-20220428
riscv                randconfig-c006-20220425
mips                 randconfig-c004-20220425
x86_64               randconfig-c007-20220425
arm                  randconfig-c002-20220425
i386                 randconfig-c001-20220425
powerpc              randconfig-c003-20220425
riscv                randconfig-c006-20220429
mips                 randconfig-c004-20220429
arm                  randconfig-c002-20220429
powerpc              randconfig-c003-20220429
mips                          ath79_defconfig
arm                       spear13xx_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
arm                        magician_defconfig
riscv                             allnoconfig
powerpc                 mpc836x_rdk_defconfig
arm64                            allyesconfig
powerpc                     tqm8540_defconfig
mips                        omega2p_defconfig
powerpc                      ppc64e_defconfig
arm                     davinci_all_defconfig
mips                     loongson2k_defconfig
arm                        vexpress_defconfig
arm                         palmz72_defconfig
arm                       cns3420vb_defconfig
powerpc                     tqm5200_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                     cu1830-neo_defconfig
powerpc                    mvme5100_defconfig
powerpc                      ppc44x_defconfig
arm                         s3c2410_defconfig
arm                            mmp2_defconfig
powerpc                      katmai_defconfig
arm                      pxa255-idp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc8272_ads_defconfig
arm                       aspeed_g4_defconfig
powerpc                      walnut_defconfig
arm                              alldefconfig
mips                            e55_defconfig
arm                                 defconfig
powerpc                     pseries_defconfig
arm                          moxart_defconfig
mips                           mtx1_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    socrates_defconfig
arm                         bcm2835_defconfig
mips                          rm200_defconfig
arm                       netwinder_defconfig
mips                          ath25_defconfig
powerpc                          allyesconfig
powerpc                     ksi8560_defconfig
mips                       lemote2f_defconfig
powerpc                     kmeter1_defconfig
x86_64                           allyesconfig
mips                           ip28_defconfig
mips                      maltaaprp_defconfig
powerpc                        fsp2_defconfig
mips                      malta_kvm_defconfig
mips                           ip27_defconfig
mips                       rbtx49xx_defconfig
powerpc                          allmodconfig
i386                             allyesconfig
arm                         hackkit_defconfig
mips                malta_qemu_32r6_defconfig
riscv                          rv32_defconfig
mips                     cu1000-neo_defconfig
arm                             mxs_defconfig
powerpc                 linkstation_defconfig
hexagon                          alldefconfig
mips                      bmips_stb_defconfig
arm                       versatile_defconfig
powerpc                      pmac32_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a006-20220425
i386                 randconfig-a002-20220425
i386                 randconfig-a005-20220425
i386                 randconfig-a003-20220425
i386                 randconfig-a001-20220425
i386                 randconfig-a004-20220425
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a002-20220425
x86_64               randconfig-a004-20220425
x86_64               randconfig-a003-20220425
x86_64               randconfig-a001-20220425
x86_64               randconfig-a005-20220425
x86_64               randconfig-a006-20220425
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220428
riscv                randconfig-r042-20220428
hexagon              randconfig-r045-20220428

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
