Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7A2401D7D
	for <lists+linux-input@lfdr.de>; Mon,  6 Sep 2021 17:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242395AbhIFPSs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Sep 2021 11:18:48 -0400
Received: from mga04.intel.com ([192.55.52.120]:50816 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239993AbhIFPSs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Sep 2021 11:18:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="218127086"
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; 
   d="scan'208";a="218127086"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 08:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; 
   d="scan'208";a="464071314"
Received: from lkp-server01.sh.intel.com (HELO 53c23d017ad5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Sep 2021 08:17:38 -0700
Received: from kbuild by 53c23d017ad5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mNGNN-0000o8-FY; Mon, 06 Sep 2021 15:17:37 +0000
Date:   Mon, 06 Sep 2021 23:17:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 daf87bffd02e35387a62c77eb32337c934cf631a
Message-ID: <6136310e.5Z9R29MfDZYi37jB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: daf87bffd02e35387a62c77eb32337c934cf631a  Input: palmas-pwrbutton - handle return value of platform_get_irq()

elapsed time: 722m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210906
mips                           gcw0_defconfig
mips                     loongson2k_defconfig
sh                          urquell_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     sequoia_defconfig
arm                         cm_x300_defconfig
powerpc                     pq2fads_defconfig
arm                      pxa255-idp_defconfig
xtensa                  audio_kc705_defconfig
sh                           se7619_defconfig
arm                          imote2_defconfig
arc                         haps_hs_defconfig
sh                          r7785rp_defconfig
powerpc                      makalu_defconfig
arm                     davinci_all_defconfig
sh                           se7750_defconfig
arm                          pcm027_defconfig
arm                        mini2440_defconfig
powerpc                         ps3_defconfig
sh                         ap325rxa_defconfig
mips                      malta_kvm_defconfig
ia64                      gensparse_defconfig
powerpc64                        alldefconfig
s390                                defconfig
powerpc                    sam440ep_defconfig
xtensa                         virt_defconfig
arm                   milbeaut_m10v_defconfig
mips                         tb0226_defconfig
sh                        sh7785lcr_defconfig
powerpc                     mpc5200_defconfig
m68k                             alldefconfig
powerpc                 linkstation_defconfig
mips                           ip28_defconfig
powerpc                       ebony_defconfig
arm                         orion5x_defconfig
powerpc                           allnoconfig
arm                            zeus_defconfig
powerpc                     mpc83xx_defconfig
mips                      maltasmvp_defconfig
riscv                          rv32_defconfig
powerpc                 mpc8272_ads_defconfig
arm                         s3c2410_defconfig
arm                          ixp4xx_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                         bigsur_defconfig
um                             i386_defconfig
powerpc                      ppc6xx_defconfig
arm                        multi_v7_defconfig
h8300                     edosk2674_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                   lite5200b_defconfig
sh                     sh7710voipgw_defconfig
arm                      jornada720_defconfig
arm                       aspeed_g4_defconfig
arm                             pxa_defconfig
arm                         lubbock_defconfig
sh                   sh7770_generic_defconfig
powerpc                     ksi8560_defconfig
nios2                               defconfig
arm                           corgi_defconfig
sh                          r7780mp_defconfig
arm                         lpc32xx_defconfig
sh                        dreamcast_defconfig
openrisc                         alldefconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
mips                         db1xxx_defconfig
m68k                          amiga_defconfig
mips                       lemote2f_defconfig
arm                         at91_dt_defconfig
sh                          kfr2r09_defconfig
sh                        sh7763rdp_defconfig
arc                        nsim_700_defconfig
openrisc                    or1ksim_defconfig
mips                  maltasmvp_eva_defconfig
riscv                    nommu_virt_defconfig
parisc                generic-32bit_defconfig
powerpc                     taishan_defconfig
sh                            migor_defconfig
powerpc                     tqm5200_defconfig
arm                        mvebu_v7_defconfig
h8300                               defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20210906
i386                 randconfig-c001-20210905
arm                  randconfig-c002-20210905
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20210906
x86_64               randconfig-a004-20210906
x86_64               randconfig-a003-20210906
x86_64               randconfig-a005-20210906
x86_64               randconfig-a001-20210906
x86_64               randconfig-a002-20210906
i386                 randconfig-a005-20210906
i386                 randconfig-a004-20210906
i386                 randconfig-a006-20210906
i386                 randconfig-a002-20210906
i386                 randconfig-a003-20210906
i386                 randconfig-a001-20210906
i386                 randconfig-a011-20210905
arc                  randconfig-r043-20210906
riscv                    nommu_k210_defconfig
riscv                               defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20210905
mips                 randconfig-c004-20210905
powerpc              randconfig-c003-20210905
x86_64               randconfig-c007-20210905
i386                 randconfig-c001-20210905
arm                  randconfig-c002-20210905
riscv                randconfig-c006-20210905
s390                 randconfig-c005-20210906
mips                 randconfig-c004-20210906
powerpc              randconfig-c003-20210906
i386                 randconfig-c001-20210906
arm                  randconfig-c002-20210906
x86_64               randconfig-a011-20210906
x86_64               randconfig-a016-20210906
x86_64               randconfig-a012-20210906
x86_64               randconfig-a015-20210906
x86_64               randconfig-a014-20210906
x86_64               randconfig-a013-20210906
i386                 randconfig-a015-20210906
i386                 randconfig-a014-20210906
i386                 randconfig-a012-20210906
i386                 randconfig-a011-20210906
i386                 randconfig-a013-20210906
i386                 randconfig-a016-20210906
x86_64               randconfig-a006-20210905
x86_64               randconfig-a004-20210905
x86_64               randconfig-a003-20210905
x86_64               randconfig-a005-20210905
x86_64               randconfig-a001-20210905
x86_64               randconfig-a002-20210905
hexagon              randconfig-r045-20210906
hexagon              randconfig-r041-20210906
riscv                randconfig-r042-20210906
s390                 randconfig-r044-20210906

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
