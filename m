Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C159E48488C
	for <lists+linux-input@lfdr.de>; Tue,  4 Jan 2022 20:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiADT3M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jan 2022 14:29:12 -0500
Received: from mga01.intel.com ([192.55.52.88]:2545 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbiADT3M (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Jan 2022 14:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641324552; x=1672860552;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vi3Hr9QrGL0MHtXejx0LbthB/M/Aq0RVeumcTwtJXSc=;
  b=lVfmNFoCb2AN+mQj/UVwsJB+wooEEoUGvSvJ0Bs5XN2qQpUupA8QThLj
   hyh+VVSfq1E9mRldj2uRvBAQOywriqUWzC2Sxhemh2W12aPY//EoDSzxc
   XMGAbNqqnJfnH4lKBg8Bn5EY4OWmwtB0Wwn15lXnh9l+28LBCqWZVUANg
   nf4/IOlCI+ExPzrU4ymJ9MQttnn1B6OQRb0TuL0+jTMptfY8S1QPegte1
   NAaFUfuMbBCofyWBMV95gau3ahBt1pzoE/n/EPVoIPQLJjwi42fcWCvHL
   W5FZ7Hb6tD78As2MITYReGrTUxdYIl/aK1eccED5ZAogphhUTuJKhIlQw
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266555630"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="266555630"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 11:29:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="472177084"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Jan 2022 11:29:07 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n4pUY-000FnN-RJ; Tue, 04 Jan 2022 19:29:06 +0000
Date:   Wed, 05 Jan 2022 03:28:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 08a6df09063818d55c1f0aa8cf3385d8d217b506
Message-ID: <61d49ff2.KPzkLGeLb4pxAbBb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 08a6df09063818d55c1f0aa8cf3385d8d217b506  Input: gpio-keys - avoid clearing twice some memory

elapsed time: 727m

configs tested: 54
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
