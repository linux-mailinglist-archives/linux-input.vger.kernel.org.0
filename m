Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C806623F7AB
	for <lists+linux-input@lfdr.de>; Sat,  8 Aug 2020 14:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgHHM5A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 8 Aug 2020 08:57:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:19701 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgHHM5A (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 8 Aug 2020 08:57:00 -0400
IronPort-SDR: HgwM4wb593W7KuLguXjN++bzecq4e0KastrCeEWJNWkR8N/yxCRvNLjH9rzHK/U+dvwr83y90R
 I6BLrAjYnGTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="238133446"
X-IronPort-AV: E=Sophos;i="5.75,449,1589266800"; 
   d="scan'208";a="238133446"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2020 05:56:58 -0700
IronPort-SDR: p4ex2B84l0+zysn61bROkSklong7ctGvk92NmUByq1EhJEkW7WYMH3xLfYN3K+5+0ZD6wOlqWu
 tBDx1bM1/tsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,449,1589266800"; 
   d="scan'208";a="438177308"
Received: from lkp-server02.sh.intel.com (HELO 65e25449d42f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Aug 2020 05:56:56 -0700
Received: from kbuild by 65e25449d42f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k4OPA-00008R-72; Sat, 08 Aug 2020 12:56:56 +0000
Date:   Sat, 08 Aug 2020 20:56:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 9e8238020c5beba64e7ffafbb7ea0fb02fe68270
Message-ID: <5f2ea0e4.NISdG9J099ZaRJPq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  for-linus
branch HEAD: 9e8238020c5beba64e7ffafbb7ea0fb02fe68270  Merge branch 'next' into for-linus

elapsed time: 721m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      loongson3_defconfig
arc                        nsimosci_defconfig
sh                        edosk7705_defconfig
arm                      jornada720_defconfig
arm                             pxa_defconfig
alpha                            alldefconfig
arm                        shmobile_defconfig
m68k                          multi_defconfig
arm                         nhk8815_defconfig
arm                          pxa3xx_defconfig
sh                           se7722_defconfig
m68k                       m5249evb_defconfig
mips                      bmips_stb_defconfig
um                            kunit_defconfig
arm                           sunxi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200808
i386                 randconfig-a005-20200808
i386                 randconfig-a001-20200808
i386                 randconfig-a003-20200808
i386                 randconfig-a002-20200808
i386                 randconfig-a006-20200808
i386                 randconfig-a005-20200807
i386                 randconfig-a004-20200807
i386                 randconfig-a001-20200807
i386                 randconfig-a002-20200807
i386                 randconfig-a003-20200807
i386                 randconfig-a006-20200807
x86_64               randconfig-a013-20200807
x86_64               randconfig-a011-20200807
x86_64               randconfig-a012-20200807
x86_64               randconfig-a016-20200807
x86_64               randconfig-a015-20200807
x86_64               randconfig-a014-20200807
i386                 randconfig-a011-20200808
i386                 randconfig-a014-20200808
i386                 randconfig-a015-20200808
i386                 randconfig-a013-20200808
i386                 randconfig-a012-20200808
i386                 randconfig-a016-20200808
i386                 randconfig-a011-20200807
i386                 randconfig-a012-20200807
i386                 randconfig-a013-20200807
i386                 randconfig-a015-20200807
i386                 randconfig-a014-20200807
i386                 randconfig-a016-20200807
x86_64               randconfig-a006-20200808
x86_64               randconfig-a001-20200808
x86_64               randconfig-a002-20200808
x86_64               randconfig-a003-20200808
x86_64               randconfig-a005-20200808
x86_64               randconfig-a004-20200808
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
