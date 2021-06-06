Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2056D39CFE1
	for <lists+linux-input@lfdr.de>; Sun,  6 Jun 2021 17:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhFFPvL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Jun 2021 11:51:11 -0400
Received: from mga07.intel.com ([134.134.136.100]:62847 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230205AbhFFPvJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 6 Jun 2021 11:51:09 -0400
IronPort-SDR: z3Bpsi6HAN+4ibi3syNnYQgBV3HENVbF4WPsaCfxeWebdjH2I9k2x99IhHKUcsuxoTTfzwMJvJ
 8Iw3n7J+G4wA==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="268376049"
X-IronPort-AV: E=Sophos;i="5.83,253,1616482800"; 
   d="scan'208";a="268376049"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2021 08:49:18 -0700
IronPort-SDR: 3wEL4+EJu2nfpBcC2FnkHumE96SLtwmuwNDG2uP29Oc+Ul17iM3wys40sXvxO2Hpgea0FhqgAm
 GzkU6Oi2nQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,253,1616482800"; 
   d="scan'208";a="447233198"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Jun 2021 08:49:17 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lpv1Y-0007zB-QW; Sun, 06 Jun 2021 15:49:16 +0000
Date:   Sun, 06 Jun 2021 23:49:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 83b41248ed04ac64a3aafc47be2b25bc1509e2f9
Message-ID: <60bcee7a.aFhSBAgabQvoDMuU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 83b41248ed04ac64a3aafc47be2b25bc1509e2f9  Input: cy8ctmg110_ts - switch to using gpiod API

elapsed time: 725m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
parisc                              defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests
x86_64                      rhel-8.3-kbuiltin

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
