Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18484D0B0A
	for <lists+linux-input@lfdr.de>; Mon,  7 Mar 2022 23:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238176AbiCGW1F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Mar 2022 17:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236293AbiCGW1F (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Mar 2022 17:27:05 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB66544773
        for <linux-input@vger.kernel.org>; Mon,  7 Mar 2022 14:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646691969; x=1678227969;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EfKRyhZzLlj4dkH5Q/d+K6v7TUJ18qk5CGaDLnuyLkc=;
  b=KOelzris2vVOm454gwZeoj67o8VPMLTSITqyDTYZ5etFnRDJU7rEIGpP
   JfrS/a+DCW9yQrMe17Vlgvs1TvKHkxyVeDFdknNB0Z5ZyRj4kYzLZVlSn
   VrkQtaulG4a9E+9zBvdUKi534l57q22CB/YHP3HxZtjEdvlf7CXVs3Skp
   lJETdtMmMTw6XNuiRISFAaqRSRJf0+6QYrEKrUmOATSghsplq8fIumaK6
   VWQcWU+NPIZB+MYyaNwGkDMb2KcjZcIZnrTnySfN2py0lJBTA063RQGtb
   wb3Rqx2PqTTcNVsx4HfqgqMNlVaQXSzieJJ8BDm561x9MFkAI/xVt6oz0
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="253352869"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="253352869"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 14:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="711278883"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Mar 2022 14:26:08 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nRLnr-0000kK-Hz; Mon, 07 Mar 2022 22:26:07 +0000
Date:   Tue, 08 Mar 2022 06:25:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 f28af984e771efd1ded81b865b50fa13b69bcde5
Message-ID: <62268677.rhSei3nC1b6RsBJ8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: f28af984e771efd1ded81b865b50fa13b69bcde5  Input: mt6779-keypad - add MediaTek keypad driver

elapsed time: 905m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220307
powerpc                      ppc40x_defconfig
mips                     loongson1b_defconfig
sh                               alldefconfig
arm                        clps711x_defconfig
sh                               j2_defconfig
m68k                          amiga_defconfig
powerpc                       ppc64_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
m68k                       m5208evb_defconfig
sh                        apsh4ad0a_defconfig
sh                           sh2007_defconfig
arm                  randconfig-c002-20220307
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
alpha                            allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
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
x86_64               randconfig-a001-20220307
x86_64               randconfig-a002-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a003-20220307
x86_64               randconfig-a005-20220307
x86_64               randconfig-a006-20220307
i386                 randconfig-a001-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a003-20220307
i386                 randconfig-a002-20220307
i386                 randconfig-a005-20220307
i386                 randconfig-a006-20220307
arc                  randconfig-r043-20220307
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
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20220307
i386                 randconfig-c001-20220307
powerpc              randconfig-c003-20220307
riscv                randconfig-c006-20220307
mips                 randconfig-c004-20220307
arm                  randconfig-c002-20220307
s390                 randconfig-c005-20220307
powerpc                     mpc5200_defconfig
arm                            mmp2_defconfig
powerpc                     pseries_defconfig
mips                     cu1000-neo_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                   microwatt_defconfig
powerpc                          allmodconfig
arm                        neponset_defconfig
powerpc                      obs600_defconfig
powerpc                      walnut_defconfig
mips                      bmips_stb_defconfig
mips                          ath79_defconfig
mips                           ip22_defconfig
riscv                          rv32_defconfig
powerpc                      ppc64e_defconfig
hexagon              randconfig-r045-20220307
riscv                randconfig-r042-20220307
hexagon              randconfig-r041-20220307
s390                 randconfig-r044-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
