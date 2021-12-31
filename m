Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE59482580
	for <lists+linux-input@lfdr.de>; Fri, 31 Dec 2021 19:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhLaSVK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Dec 2021 13:21:10 -0500
Received: from mga09.intel.com ([134.134.136.24]:7436 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229583AbhLaSVK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Dec 2021 13:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640974870; x=1672510870;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nGCbR6/2HXWS5zyHHFZ+3LOy7cXMVnDnCEtBwDW/TnU=;
  b=G7ZBYjouTzZQnLvzxzred7LvT51Ps4yUcS+K+7XI81RJa6NA3TLFXn/f
   iTn581Q+PFPFrUyfJcs3N/fCI58wSZOwlrQWO6Fk7pp6OZTLFGyrEM4Ae
   UMmyLLmkHXXqXk1pygbmZMI0bQAeKj4DecBck5cQbXnxOpJeb1mshsT3v
   Oi3UkF1pGYWKoCx1ZhPCkT0Qvx0T2NptaSCg3aFfYObJsKb1Sx38GSMZp
   GI6ZHUxWyCmZDrtJ+Y78YEg/3QbjjE9gARWI5D3D1gkQyqnOtHUHMuSUy
   JRwWTDSSe/FaxG9h+WW7V1zjrYXCc5153E5U7EmVof/ikVjd+sGE9RDT+
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="241634444"
X-IronPort-AV: E=Sophos;i="5.88,252,1635231600"; 
   d="scan'208";a="241634444"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2021 10:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,252,1635231600"; 
   d="scan'208";a="687547450"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Dec 2021 10:21:08 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n3MWa-000BZT-67; Fri, 31 Dec 2021 18:21:08 +0000
Date:   Sat, 01 Jan 2022 02:20:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 bc7ec91718c49d938849697cfad98fcd9877cc26
Message-ID: <61cf49dd.Y8TKeComXldszNBv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: bc7ec91718c49d938849697cfad98fcd9877cc26  Input: spaceball - fix parsing of movement data packets

elapsed time: 722m

configs tested: 169
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211231
arm                        shmobile_defconfig
mips                        maltaup_defconfig
arm                          pxa910_defconfig
alpha                            allyesconfig
sh                            shmin_defconfig
arm                            dove_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            lart_defconfig
parisc                generic-64bit_defconfig
arm                            mps2_defconfig
nds32                             allnoconfig
parisc                              defconfig
powerpc                      walnut_defconfig
powerpc                     pseries_defconfig
sh                             shx3_defconfig
arm                         cm_x300_defconfig
arm                           corgi_defconfig
m68k                            q40_defconfig
arm                       cns3420vb_defconfig
powerpc                    gamecube_defconfig
arm                          gemini_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc832x_mds_defconfig
sh                            titan_defconfig
h8300                    h8300h-sim_defconfig
riscv                          rv32_defconfig
mips                  maltasmvp_eva_defconfig
openrisc                            defconfig
alpha                               defconfig
arm                         shannon_defconfig
mips                         tb0287_defconfig
mips                           ci20_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                             allmodconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      cm5200_defconfig
powerpc                    sam440ep_defconfig
h8300                       h8s-sim_defconfig
sparc                            allyesconfig
um                                  defconfig
powerpc                      chrp32_defconfig
i386                                defconfig
arc                          axs103_defconfig
m68k                       m5475evb_defconfig
sh                           sh2007_defconfig
xtensa                           alldefconfig
microblaze                          defconfig
alpha                            alldefconfig
mips                         db1xxx_defconfig
parisc                generic-32bit_defconfig
h8300                               defconfig
powerpc                 linkstation_defconfig
powerpc                     taishan_defconfig
arm                        realview_defconfig
arm                           omap1_defconfig
mips                         mpc30x_defconfig
arc                     nsimosci_hs_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7722_defconfig
mips                       rbtx49xx_defconfig
arm                            qcom_defconfig
mips                     loongson1b_defconfig
powerpc                       holly_defconfig
m68k                       bvme6000_defconfig
arm                        oxnas_v6_defconfig
powerpc                  storcenter_defconfig
arm                           spitz_defconfig
sh                        sh7785lcr_defconfig
powerpc                 mpc836x_mds_defconfig
sparc                       sparc64_defconfig
sh                              ul2_defconfig
microblaze                      mmu_defconfig
sh                   sh7724_generic_defconfig
powerpc                    socrates_defconfig
mips                            e55_defconfig
sh                        edosk7705_defconfig
arm                  randconfig-c002-20211231
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20211231
x86_64               randconfig-a001-20211231
x86_64               randconfig-a003-20211231
x86_64               randconfig-a006-20211231
x86_64               randconfig-a004-20211231
x86_64               randconfig-a005-20211231
i386                 randconfig-a001-20211231
i386                 randconfig-a005-20211231
i386                 randconfig-a004-20211231
i386                 randconfig-a002-20211231
i386                 randconfig-a006-20211231
i386                 randconfig-a003-20211231
arc                  randconfig-r043-20211231
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                            kunit_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20211231
arm                  randconfig-c002-20211231
mips                 randconfig-c004-20211231
powerpc              randconfig-c003-20211231
x86_64               randconfig-c007-20211231
i386                 randconfig-c001-20211231
powerpc                   lite5200b_defconfig
powerpc                          allmodconfig
arm                         orion5x_defconfig
arm                          moxart_defconfig
mips                          ath25_defconfig
mips                      maltaaprp_defconfig
mips                     cu1830-neo_defconfig
powerpc                     skiroot_defconfig
x86_64                           allyesconfig
powerpc                      acadia_defconfig
arm                            dove_defconfig
arm                         socfpga_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                  colibri_pxa270_defconfig
x86_64               randconfig-a013-20211231
x86_64               randconfig-a012-20211231
x86_64               randconfig-a011-20211231
x86_64               randconfig-a016-20211231
x86_64               randconfig-a014-20211231
x86_64               randconfig-a015-20211231
i386                 randconfig-a016-20211231
i386                 randconfig-a011-20211231
i386                 randconfig-a012-20211231
i386                 randconfig-a013-20211231
i386                 randconfig-a014-20211231
i386                 randconfig-a015-20211231
hexagon              randconfig-r041-20211231
hexagon              randconfig-r045-20211231
riscv                randconfig-r042-20211231
s390                 randconfig-r044-20211231

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
