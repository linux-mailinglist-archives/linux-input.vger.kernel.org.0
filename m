Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222C752748E
	for <lists+linux-input@lfdr.de>; Sun, 15 May 2022 00:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbiENW4N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 May 2022 18:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbiENWz4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 May 2022 18:55:56 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1162F3A3
        for <linux-input@vger.kernel.org>; Sat, 14 May 2022 15:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652568953; x=1684104953;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=73ZnnF6l98fzJQxdKGkrA/3uzw9iW+Ll2mLmXRPTx6g=;
  b=ZelbItKHgHcQYdN/Di5ezlaiLv4yFm2IWpcmNsS79Sxc+QfRyrTij+uJ
   c2iOgeJG+3/sCo0SqA92vgxynqfiqZ1heE/hLWvRvatvxW7EYtX+WrizW
   P3clbM+gdZiDGjFuTQxqbNDdkZ9y88uo3QVj1SSVijpjgcpCYeIYzWRvC
   5GFi1Ef4AYVKoJ6y3es/BrbbCDoCqLA33h5eK0jdCQnbE9m85XzYeyPNN
   XpjDdAS5w8S5mBn5tCwoShdpeWkF2FN3jNeGJvBNWHWv9lkyhiReOUFeA
   il0aNFTbrOlH1W3QWnf+nLmqxTlQSoXC3t5JBZRgKTZ/uz88lFt/Btbbt
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="270245081"
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; 
   d="scan'208";a="270245081"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 15:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; 
   d="scan'208";a="543787137"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 May 2022 15:55:47 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nq0fp-00015R-Nb;
        Sat, 14 May 2022 22:55:45 +0000
Date:   Sun, 15 May 2022 06:55:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 ec648fc0a00378359dbf719371ed36657d6ccf4a
Message-ID: <62803361.ZB/rkuAhfsYvKwJo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: ec648fc0a00378359dbf719371ed36657d6ccf4a  Input: sun4i-lradc-keys - add support for R329 and D1

elapsed time: 13148m

configs tested: 417
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
powerpc              randconfig-c003-20220505
powerpc              randconfig-c003-20220512
m68k                       m5208evb_defconfig
powerpc                      ep88xc_defconfig
arm                         at91_dt_defconfig
arm                        clps711x_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                         tb0226_defconfig
m68k                             allmodconfig
xtensa                       common_defconfig
arm                      jornada720_defconfig
arm                           stm32_defconfig
csky                                defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                     tqm8555_defconfig
powerpc                     ep8248e_defconfig
sh                ecovec24-romimage_defconfig
arm                           sunxi_defconfig
ia64                             alldefconfig
arm                          exynos_defconfig
h8300                    h8300h-sim_defconfig
arm                        multi_v7_defconfig
powerpc                      mgcoge_defconfig
xtensa                    smp_lx200_defconfig
ia64                      gensparse_defconfig
arm                          simpad_defconfig
arm                        cerfcube_defconfig
sh                          r7785rp_defconfig
sh                          urquell_defconfig
sparc64                             defconfig
m68k                       m5475evb_defconfig
arm                        shmobile_defconfig
m68k                        mvme16x_defconfig
m68k                       m5249evb_defconfig
arm                            pleb_defconfig
mips                          rb532_defconfig
riscv                               defconfig
powerpc                     sequoia_defconfig
arc                          axs103_defconfig
m68k                       m5275evb_defconfig
xtensa                           alldefconfig
xtensa                    xip_kc705_defconfig
xtensa                  audio_kc705_defconfig
h8300                     edosk2674_defconfig
arm                            hisi_defconfig
mips                        bcm47xx_defconfig
sh                              ul2_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7712_defconfig
powerpc                       ppc64_defconfig
csky                             alldefconfig
mips                           ip32_defconfig
sh                             sh03_defconfig
sh                   sh7724_generic_defconfig
m68k                          atari_defconfig
powerpc                      cm5200_defconfig
powerpc                       eiger_defconfig
ia64                         bigsur_defconfig
powerpc                     redwood_defconfig
mips                  decstation_64_defconfig
h8300                       h8s-sim_defconfig
sh                          kfr2r09_defconfig
mips                             allyesconfig
sparc                       sparc32_defconfig
powerpc                     pq2fads_defconfig
sh                 kfr2r09-romimage_defconfig
arm                         axm55xx_defconfig
arm                        spear6xx_defconfig
x86_64                           alldefconfig
powerpc                     tqm8548_defconfig
m68k                       bvme6000_defconfig
sh                           se7705_defconfig
mips                       bmips_be_defconfig
sh                        sh7763rdp_defconfig
powerpc                 mpc8540_ads_defconfig
sh                          landisk_defconfig
xtensa                  nommu_kc705_defconfig
mips                           ci20_defconfig
sh                           se7721_defconfig
s390                       zfcpdump_defconfig
m68k                           sun3_defconfig
powerpc                      ppc40x_defconfig
powerpc                    adder875_defconfig
arc                        nsim_700_defconfig
sh                         ecovec24_defconfig
sh                               allmodconfig
sh                        dreamcast_defconfig
mips                 decstation_r4k_defconfig
powerpc64                        alldefconfig
arc                        nsimosci_defconfig
um                           x86_64_defconfig
powerpc                        warp_defconfig
powerpc                      tqm8xx_defconfig
sh                         ap325rxa_defconfig
x86_64                              defconfig
mips                      loongson3_defconfig
sparc                            alldefconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                         virt_defconfig
m68k                            q40_defconfig
arm                        keystone_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
sh                   secureedge5410_defconfig
arc                                 defconfig
mips                             allmodconfig
m68k                          hp300_defconfig
ia64                          tiger_defconfig
powerpc                           allnoconfig
sh                             espt_defconfig
arm                       multi_v4t_defconfig
arm                             ezx_defconfig
arm                        mini2440_defconfig
xtensa                              defconfig
arm                           sama5_defconfig
openrisc                            defconfig
powerpc                  iss476-smp_defconfig
sh                          rsk7203_defconfig
nios2                         3c120_defconfig
sparc                            allyesconfig
sh                         microdev_defconfig
arc                     nsimosci_hs_defconfig
powerpc                     stx_gp3_defconfig
mips                           jazz_defconfig
um                               alldefconfig
openrisc                    or1ksim_defconfig
mips                            ar7_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                       holly_defconfig
arm                        trizeps4_defconfig
arm                            xcep_defconfig
riscv                            allyesconfig
arm                           viper_defconfig
sparc                       sparc64_defconfig
sh                          polaris_defconfig
powerpc                         wii_defconfig
arm64                            alldefconfig
m68k                          sun3x_defconfig
mips                     decstation_defconfig
xtensa                  cadence_csp_defconfig
arm                         assabet_defconfig
h8300                            allyesconfig
powerpc                     rainier_defconfig
sparc                               defconfig
sh                           se7750_defconfig
sh                                  defconfig
arc                     haps_hs_smp_defconfig
m68k                         apollo_defconfig
powerpc                     taishan_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         mpc30x_defconfig
arm                            zeus_defconfig
arm                     eseries_pxa_defconfig
powerpc                  storcenter_defconfig
arm                         lubbock_defconfig
sh                           se7343_defconfig
parisc                generic-32bit_defconfig
alpha                               defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
sh                   rts7751r2dplus_defconfig
i386                                defconfig
arm                         nhk8815_defconfig
mips                      fuloong2e_defconfig
sh                          rsk7269_defconfig
alpha                            alldefconfig
m68k                        m5307c3_defconfig
arm                      integrator_defconfig
nios2                         10m50_defconfig
arm                          gemini_defconfig
powerpc                      pcm030_defconfig
alpha                            allyesconfig
arm                          lpd270_defconfig
mips                        vocore2_defconfig
powerpc                      bamboo_defconfig
i386                             alldefconfig
m68k                        mvme147_defconfig
sh                          lboxre2_defconfig
arm                             pxa_defconfig
arm                         vf610m4_defconfig
arc                           tb10x_defconfig
microblaze                          defconfig
mips                         db1xxx_defconfig
powerpc                   currituck_defconfig
mips                      maltasmvp_defconfig
powerpc                      chrp32_defconfig
nios2                            allyesconfig
sh                        apsh4ad0a_defconfig
arm                            qcom_defconfig
powerpc                 mpc837x_mds_defconfig
arm                        mvebu_v7_defconfig
powerpc                       maple_defconfig
powerpc                      ppc6xx_defconfig
sh                          sdk7786_defconfig
arm                         lpc18xx_defconfig
arm                         s3c6400_defconfig
arm                       aspeed_g5_defconfig
m68k                        stmark2_defconfig
powerpc                      makalu_defconfig
arm                         cm_x300_defconfig
arm                        oxnas_v6_defconfig
mips                           gcw0_defconfig
arm                             rpc_defconfig
nios2                            alldefconfig
arm                            lart_defconfig
arm                       imx_v6_v7_defconfig
openrisc                 simple_smp_defconfig
arm                          pxa3xx_defconfig
m68k                          multi_defconfig
arc                              alldefconfig
sh                  sh7785lcr_32bit_defconfig
openrisc                  or1klitex_defconfig
m68k                         amcore_defconfig
m68k                          amiga_defconfig
sh                         apsh4a3a_defconfig
arm                           corgi_defconfig
sh                        sh7785lcr_defconfig
powerpc                    amigaone_defconfig
sh                     magicpanelr2_defconfig
sh                          sdk7780_defconfig
arc                         haps_hs_defconfig
um                                  defconfig
arc                          axs101_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       omap2plus_defconfig
powerpc                      arches_defconfig
ia64                            zx1_defconfig
arm                        realview_defconfig
mips                     loongson1b_defconfig
powerpc64                           defconfig
sh                               j2_defconfig
powerpc                     asp8347_defconfig
h8300                               defconfig
powerpc                    sam440ep_defconfig
sh                           se7722_defconfig
arm                          iop32x_defconfig
sh                          rsk7264_defconfig
sh                           se7751_defconfig
sh                            hp6xx_defconfig
mips                  maltasmvp_eva_defconfig
sh                          r7780mp_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220506
arm                  randconfig-c002-20220508
arm                  randconfig-c002-20220505
arm                  randconfig-c002-20220507
arm                  randconfig-c002-20220512
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a001
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220505
s390                 randconfig-r044-20220505
riscv                randconfig-r042-20220505
arc                  randconfig-r043-20220512
riscv                randconfig-r042-20220512
s390                 randconfig-r044-20220512
arc                  randconfig-r043-20220507
s390                 randconfig-r044-20220507
riscv                randconfig-r042-20220507
arc                  randconfig-r043-20220513
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220505
riscv                randconfig-c006-20220505
arm                  randconfig-c002-20220505
powerpc              randconfig-c003-20220506
riscv                randconfig-c006-20220506
mips                 randconfig-c004-20220506
arm                  randconfig-c002-20220506
s390                 randconfig-c005-20220506
powerpc              randconfig-c003-20220507
riscv                randconfig-c006-20220507
mips                 randconfig-c004-20220507
arm                  randconfig-c002-20220507
powerpc              randconfig-c003-20220508
riscv                randconfig-c006-20220508
mips                 randconfig-c004-20220508
arm                  randconfig-c002-20220508
mips                 randconfig-c004-20220512
powerpc              randconfig-c003-20220512
arm                  randconfig-c002-20220512
s390                 randconfig-c005-20220512
riscv                randconfig-c006-20220512
powerpc                     tqm5200_defconfig
powerpc                          allyesconfig
arm                  colibri_pxa300_defconfig
arm                          pcm027_defconfig
mips                        omega2p_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                         tb0219_defconfig
powerpc                     mpc5200_defconfig
arm                       cns3420vb_defconfig
arm                          collie_defconfig
mips                      pic32mzda_defconfig
i386                             allyesconfig
mips                           mtx1_defconfig
arm                         socfpga_defconfig
powerpc                      ppc64e_defconfig
x86_64                           allyesconfig
arm                         orion5x_defconfig
powerpc                     ksi8560_defconfig
mips                          ath25_defconfig
mips                           rs90_defconfig
arm                      pxa255-idp_defconfig
arm                  colibri_pxa270_defconfig
arm                        magician_defconfig
powerpc                     pseries_defconfig
arm                        spear3xx_defconfig
arm                        mvebu_v5_defconfig
powerpc                  mpc885_ads_defconfig
arm                        vexpress_defconfig
arm                     davinci_all_defconfig
arm                       netwinder_defconfig
riscv                    nommu_virt_defconfig
arm                           spitz_defconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm8540_defconfig
riscv                             allnoconfig
arm                       mainstone_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                      walnut_defconfig
arm                             mxs_defconfig
arm                        neponset_defconfig
mips                      malta_kvm_defconfig
hexagon                             defconfig
powerpc                 mpc832x_rdb_defconfig
mips                       lemote2f_defconfig
mips                        workpad_defconfig
mips                          ath79_defconfig
arm                            mmp2_defconfig
arm                            dove_defconfig
powerpc                          allmodconfig
arm                         lpc32xx_defconfig
arm                          ixp4xx_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          moxart_defconfig
powerpc                   lite5200b_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                   sb1250_swarm_defconfig
powerpc                 mpc8272_ads_defconfig
arm                       spear13xx_defconfig
powerpc                      katmai_defconfig
arm                         s3c2410_defconfig
mips                        maltaup_defconfig
powerpc                      ppc44x_defconfig
mips                     cu1000-neo_defconfig
arm                       aspeed_g4_defconfig
arm                         s5pv210_defconfig
arm                       versatile_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                   bluestone_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220506
riscv                randconfig-r042-20220506
hexagon              randconfig-r041-20220506
hexagon              randconfig-r045-20220512
hexagon              randconfig-r041-20220512
hexagon              randconfig-r045-20220505
hexagon              randconfig-r041-20220505
hexagon              randconfig-r045-20220509
hexagon              randconfig-r045-20220508
riscv                randconfig-r042-20220508
hexagon              randconfig-r041-20220509
hexagon              randconfig-r041-20220508

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
