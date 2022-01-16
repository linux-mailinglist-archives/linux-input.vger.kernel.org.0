Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98E048FE50
	for <lists+linux-input@lfdr.de>; Sun, 16 Jan 2022 19:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235953AbiAPSAL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Jan 2022 13:00:11 -0500
Received: from mga09.intel.com ([134.134.136.24]:28190 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235951AbiAPSAL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Jan 2022 13:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642356011; x=1673892011;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9yaUJzVxEjOehQbeRgX9W6PQw4kEUjXdLop9o9duCq0=;
  b=kqoQmRqnmI9RQU8v4mwofBS9Mbjm9njx/mMzkRhb5MUAx9qo0yBDMy8B
   txreVp/XdeG3kGCpE+Twa6uh/lw8viRUaErwd9eP8L75rxVrC4NdZfVCR
   ljbNGbCStbWsYTJD1WR/qapNE1VCANA5zen3yOZ5cWcqBN3HWppZiHf3K
   tCVcWbTr/nXDQPDI69kUqNFNt6sssEPyLqvCYlpYhUDmY9yZgC12Zy07N
   QVOrJF6FZJDy0e3bGuDzQb0sZ+RSqdJetducj1bIy+bAoK8XdMNiXxjIy
   dnQ87wfPzoe7GtLxFY52CUHQtwjdw3E5g4uBVScgx0/ouwFfjmFN+oTjs
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10228"; a="244303350"
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="244303350"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 10:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="692830322"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jan 2022 10:00:08 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n99p1-000AtO-Mb; Sun, 16 Jan 2022 18:00:07 +0000
Date:   Mon, 17 Jan 2022 01:59:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 762f99f4f3cb41a775b5157dd761217beba65873
Message-ID: <61e45cef.BNtLwWTlFdpoYgVb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 762f99f4f3cb41a775b5157dd761217beba65873  Merge branch 'next' into for-linus

elapsed time: 1210m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
m68k                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
s390                             allmodconfig
powerpc                          allyesconfig
s390                             allyesconfig
mips                      fuloong2e_defconfig
sh                           se7343_defconfig
openrisc                 simple_smp_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                       maple_defconfig
sh                               j2_defconfig
xtensa                          iss_defconfig
sh                            hp6xx_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        trizeps4_defconfig
arm                     eseries_pxa_defconfig
powerpc                        cell_defconfig
arm                          simpad_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
arm                  randconfig-c002-20220116
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220116
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220116
i386                          randconfig-c001
mips                 randconfig-c004-20220116
s390                 randconfig-c005-20220116
riscv                randconfig-c006-20220116
powerpc                      acadia_defconfig
arm                      pxa255-idp_defconfig
powerpc                     kmeter1_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220116
riscv                randconfig-r042-20220116
s390                 randconfig-r044-20220116
hexagon              randconfig-r041-20220116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
