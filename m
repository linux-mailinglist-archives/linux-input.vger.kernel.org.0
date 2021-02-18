Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA78631E6D1
	for <lists+linux-input@lfdr.de>; Thu, 18 Feb 2021 08:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhBRHQr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 02:16:47 -0500
Received: from mga06.intel.com ([134.134.136.31]:60387 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231236AbhBRHIb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 02:08:31 -0500
IronPort-SDR: qeHdkyGNoY/QqHsUH1ldYcWcj1eW6XUwtixi+cHhnjVzEHinrp+PS4dE7ZoAqsATxMsrpE1Nzb
 FPz5cQQH15jA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="244879428"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="244879428"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 23:05:31 -0800
IronPort-SDR: 6HHQzObIQLr5C2p29uXTZuYrMpP0rKtbeMx4KZVVCkR+DH3Kar979B374FUzRM+PcHKPL7eaBR
 E/4DMecOM2oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="362325104"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Feb 2021 23:05:29 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lCdNQ-0009WG-5W; Thu, 18 Feb 2021 07:05:28 +0000
Date:   Thu, 18 Feb 2021 15:04:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 42ffcd1dba1796bcda386eb6f260df9fc23c90af
Message-ID: <602e1192.FZoGuwTayYaBBya5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 42ffcd1dba1796bcda386eb6f260df9fc23c90af  Input: xpad - add support for PowerA Enhanced Wired Controller for Xbox Series X|S

elapsed time: 720m

configs tested: 129
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                     davinci_all_defconfig
sh                          polaris_defconfig
sh                        sh7757lcr_defconfig
m68k                             allyesconfig
arm                        multi_v5_defconfig
arm                            u300_defconfig
powerpc                        icon_defconfig
powerpc                    amigaone_defconfig
arm                           sama5_defconfig
m68k                         amcore_defconfig
sparc                       sparc64_defconfig
m68k                        mvme147_defconfig
mips                        nlm_xlr_defconfig
arm                              zx_defconfig
arm                         lubbock_defconfig
ia64                         bigsur_defconfig
arm                            lart_defconfig
powerpc                     rainier_defconfig
arm                        cerfcube_defconfig
arm                         lpc32xx_defconfig
arm                         s3c2410_defconfig
arm                          pxa3xx_defconfig
m68k                       m5208evb_defconfig
mips                      pic32mzda_defconfig
powerpc                      katmai_defconfig
powerpc                      acadia_defconfig
xtensa                    xip_kc705_defconfig
m68k                        m5307c3_defconfig
m68k                        m5407c3_defconfig
arm                             rpc_defconfig
sh                           sh2007_defconfig
nios2                               defconfig
sh                         microdev_defconfig
mips                       capcella_defconfig
arm                          exynos_defconfig
ia64                      gensparse_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210216
x86_64               randconfig-a002-20210216
x86_64               randconfig-a004-20210216
x86_64               randconfig-a001-20210216
x86_64               randconfig-a005-20210216
x86_64               randconfig-a006-20210216
i386                 randconfig-a003-20210216
i386                 randconfig-a005-20210216
i386                 randconfig-a002-20210216
i386                 randconfig-a006-20210216
i386                 randconfig-a001-20210216
i386                 randconfig-a004-20210216
i386                 randconfig-a003-20210217
i386                 randconfig-a005-20210217
i386                 randconfig-a002-20210217
i386                 randconfig-a006-20210217
i386                 randconfig-a001-20210217
i386                 randconfig-a004-20210217
x86_64               randconfig-a013-20210217
x86_64               randconfig-a016-20210217
x86_64               randconfig-a012-20210217
x86_64               randconfig-a015-20210217
x86_64               randconfig-a014-20210217
x86_64               randconfig-a011-20210217
i386                 randconfig-a016-20210217
i386                 randconfig-a014-20210217
i386                 randconfig-a012-20210217
i386                 randconfig-a013-20210217
i386                 randconfig-a011-20210217
i386                 randconfig-a015-20210217
i386                 randconfig-a016-20210216
i386                 randconfig-a014-20210216
i386                 randconfig-a012-20210216
i386                 randconfig-a013-20210216
i386                 randconfig-a011-20210216
i386                 randconfig-a015-20210216
i386                 randconfig-a016-20210215
i386                 randconfig-a014-20210215
i386                 randconfig-a012-20210215
i386                 randconfig-a013-20210215
i386                 randconfig-a011-20210215
i386                 randconfig-a015-20210215
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
