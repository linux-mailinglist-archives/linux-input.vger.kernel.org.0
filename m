Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87211330D0C
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 13:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhCHMD2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 07:03:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:7730 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231897AbhCHMDH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 07:03:07 -0500
IronPort-SDR: O55wSvBXRBOKZCnBYqkdQlq6zU5mTJwx5WGubBXk82+SFuWD3ZerVyK+MVnaA2Xvcvxlw+Y58/
 6lK+riNMFlyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="175125163"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="175125163"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 04:03:05 -0800
IronPort-SDR: o/9+f3v3GzuZ6jYw/1rrj8Pp/ryKu+Q8saX1I9KgXFi4UNnMFfB6oM+UiOZf0lrFlTIOgciKHq
 zDwvMI8gtCRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="376064470"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2021 04:03:04 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lJEbH-0000xb-FU; Mon, 08 Mar 2021 12:03:03 +0000
Date:   Mon, 08 Mar 2021 20:02:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 30b3f68715595dee7fe4d9bd91a2252c3becdf0a
Message-ID: <6046124e.bAKM8xn0wwRjCva+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 30b3f68715595dee7fe4d9bd91a2252c3becdf0a  Input: s6sy761 - fix coordinate read bit shift

elapsed time: 721m

configs tested: 92
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           ip28_defconfig
mips                       capcella_defconfig
arm                        mini2440_defconfig
arm                           spitz_defconfig
arm                          pxa168_defconfig
m68k                             allyesconfig
m68k                        m5407c3_defconfig
um                             i386_defconfig
parisc                generic-32bit_defconfig
arm                         at91_dt_defconfig
powerpc                     powernv_defconfig
csky                             alldefconfig
mips                        nlm_xlr_defconfig
xtensa                       common_defconfig
sh                          sdk7780_defconfig
powerpc                      bamboo_defconfig
arm                            hisi_defconfig
arm                      jornada720_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210308
i386                 randconfig-a003-20210308
i386                 randconfig-a002-20210308
i386                 randconfig-a006-20210308
i386                 randconfig-a004-20210308
i386                 randconfig-a001-20210308
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
x86_64               randconfig-a013-20210307
x86_64               randconfig-a016-20210307
x86_64               randconfig-a015-20210307
x86_64               randconfig-a014-20210307
x86_64               randconfig-a012-20210307
x86_64               randconfig-a011-20210307
i386                 randconfig-a016-20210308
i386                 randconfig-a012-20210308
i386                 randconfig-a014-20210308
i386                 randconfig-a013-20210308
i386                 randconfig-a011-20210308
i386                 randconfig-a015-20210308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
