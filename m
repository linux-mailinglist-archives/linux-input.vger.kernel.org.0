Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2E3C4D0DE2
	for <lists+linux-input@lfdr.de>; Tue,  8 Mar 2022 03:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239059AbiCHCNJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Mar 2022 21:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344369AbiCHCNI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Mar 2022 21:13:08 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52AD25C40
        for <linux-input@vger.kernel.org>; Mon,  7 Mar 2022 18:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646705532; x=1678241532;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/LdTUrily64fuK4CzmDcD83Dz4fd31h5y+GUVIkn/a4=;
  b=SLY1qFusahavujTvz3FqTmWF3n/TofyXgEmTiQrK3vJngqmlWODScjpB
   QTUosPmFUmF/mRbDt9uQKZH7klp2nFAbARBDD3WNQsHlVASO6jrLRNPYJ
   bPuQT1fR/5gnxD7GuR3p12xes5i9itb31nYI/5ZKnQCCpzUkK8w8hk0Fk
   O3AbnEWUSLHUWlBjNB+elzjE32Kt9JcZ24p0FhJuViIAzGpxO5UMkSU1g
   Q86IwldtAdAdeILVswpfxeY5k4tJc5uQLkFQdlkPITi2dfwnMvcaWH9HX
   7SLREXtSO5Bv+r4J9Hj4kaS9+JSF4aILCT0rQxaT6xmUHpwKztIo5vJQP
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="317797539"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="317797539"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 18:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="595723856"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2022 18:12:11 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nRPKc-0000rO-9L; Tue, 08 Mar 2022 02:12:10 +0000
Date:   Tue, 08 Mar 2022 10:11:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 327b89f0acc4c20a06ed59e4d9af7f6d804dc2e2
Message-ID: <6226bb53.rPG3oTadEjtYteOE%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 327b89f0acc4c20a06ed59e4d9af7f6d804dc2e2  HID: add mapping for KEY_ALL_APPLICATIONS

elapsed time: 5479m

configs tested: 148
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
mips                 randconfig-c004-20220307
powerpc                     pq2fads_defconfig
ia64                          tiger_defconfig
m68k                        m5272c3_defconfig
arm                        multi_v7_defconfig
um                             i386_defconfig
arm                          gemini_defconfig
arm                           sama5_defconfig
openrisc                            defconfig
parisc                generic-32bit_defconfig
sh                            migor_defconfig
sh                          rsk7201_defconfig
arm                         lubbock_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            hisi_defconfig
arc                      axs103_smp_defconfig
sh                          rsk7269_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
m68k                       m5208evb_defconfig
sh                        apsh4ad0a_defconfig
sh                           sh2007_defconfig
h8300                            alldefconfig
powerpc                 mpc834x_mds_defconfig
arm                           tegra_defconfig
openrisc                 simple_smp_defconfig
arm                      jornada720_defconfig
mips                         db1xxx_defconfig
xtensa                         virt_defconfig
powerpc                    klondike_defconfig
arm                         vf610m4_defconfig
arm                          exynos_defconfig
arm                           h3600_defconfig
mips                         rt305x_defconfig
powerpc                    adder875_defconfig
powerpc                     tqm8555_defconfig
sh                          lboxre2_defconfig
arm                        trizeps4_defconfig
sh                         apsh4a3a_defconfig
mips                           ci20_defconfig
mips                            gpr_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                  randconfig-c002-20220307
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
x86_64               randconfig-a006-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a005-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a003-20220307
x86_64               randconfig-a002-20220307
i386                 randconfig-a005-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a003-20220307
i386                 randconfig-a006-20220307
i386                 randconfig-a002-20220307
i386                 randconfig-a001-20220307
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
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
arm                       imx_v4_v5_defconfig
x86_64                           allyesconfig
mips                     cu1000-neo_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                   microwatt_defconfig
powerpc                          allmodconfig
mips                           rs90_defconfig
powerpc                     tqm8540_defconfig
arm                          imote2_defconfig
powerpc                      ppc64e_defconfig
powerpc                     akebono_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      obs600_defconfig
arm                        magician_defconfig
x86_64               randconfig-a016-20220307
x86_64               randconfig-a012-20220307
x86_64               randconfig-a015-20220307
x86_64               randconfig-a013-20220307
x86_64               randconfig-a014-20220307
x86_64               randconfig-a011-20220307
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a012-20220307
i386                 randconfig-a013-20220307
i386                 randconfig-a015-20220307
i386                 randconfig-a011-20220307
i386                 randconfig-a014-20220307
i386                 randconfig-a016-20220307
hexagon              randconfig-r045-20220307
riscv                randconfig-r042-20220307
hexagon              randconfig-r041-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
