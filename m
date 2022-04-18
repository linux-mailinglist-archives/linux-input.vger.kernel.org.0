Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F635504E0E
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 10:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234324AbiDRI6E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 04:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237352AbiDRI6B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 04:58:01 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19C92DE4
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 01:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650272120; x=1681808120;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FqLbM1sNNdrx2+B34p0gusj6nC8QYYupzXp0S3eyAHY=;
  b=EKx1hZFqNipgzCtYfvho9TGWK5EE1Oj7xknltcgwYKFB9ocish9OxpqN
   4LuwrivujUWRJ5tDiy/FzypcIIwpLVXbb35kkGHZnY/bgoyZF5XwyJmEN
   56e4AluWCu6N3D439+9B2DmMHglB/jXfyYgAlno6mzSEp0MCCUYg2u3LO
   9W1lFjCOF1VmDi8Jvw1DPi5/UFDsEehAudvRraP+K4Z2sEdiZd9qsZ/pa
   dyF+FgDzpXINTL5rCeSPWZgx9lMUmR3WspXyEBK0d7g5evpV5MKOiwW5b
   5hnps88ViHqJvQbnwvVtPYH6vVZaT0kCnKbMgVojOPHCuzbIk1yNNKuTj
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="326383405"
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="326383405"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 01:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="575497223"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Apr 2022 01:55:19 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ngNAE-0004Ud-Bk;
        Mon, 18 Apr 2022 08:55:18 +0000
Date:   Mon, 18 Apr 2022 16:54:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 470776c6b03491a3e82c644737a6da5466b8b3eb
Message-ID: <625d2755.PYFGWwT0ZreriyQI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 470776c6b03491a3e82c644737a6da5466b8b3eb  Input: add Marine Navigation Keycodes

elapsed time: 726m

configs tested: 161
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220418
mips                 randconfig-c004-20220418
parisc                           allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                              allyesconfig
arm                           stm32_defconfig
sh                        apsh4ad0a_defconfig
mips                         db1xxx_defconfig
sh                           se7750_defconfig
arm                             rpc_defconfig
powerpc                   motionpro_defconfig
sh                           se7705_defconfig
sh                ecovec24-romimage_defconfig
m68k                        m5272c3_defconfig
riscv                            allmodconfig
powerpc                           allnoconfig
sh                          rsk7203_defconfig
powerpc                     rainier_defconfig
sh                            shmin_defconfig
sh                             espt_defconfig
riscv                               defconfig
m68k                                defconfig
i386                                defconfig
ia64                                defconfig
sh                           se7721_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc834x_itx_defconfig
mips                     loongson1b_defconfig
powerpc                        cell_defconfig
powerpc                     tqm8548_defconfig
powerpc                    sam440ep_defconfig
powerpc                       holly_defconfig
sh                                  defconfig
arm                        realview_defconfig
powerpc                     mpc83xx_defconfig
mips                  maltasmvp_eva_defconfig
arc                        nsim_700_defconfig
mips                             allyesconfig
powerpc                 mpc85xx_cds_defconfig
mips                         mpc30x_defconfig
arm                           corgi_defconfig
arm                        keystone_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                         rt305x_defconfig
m68k                       bvme6000_defconfig
ia64                            zx1_defconfig
arc                      axs103_smp_defconfig
arm                             pxa_defconfig
mips                  decstation_64_defconfig
mips                            ar7_defconfig
m68k                          amiga_defconfig
mips                    maltaup_xpa_defconfig
arm                      integrator_defconfig
parisc                generic-32bit_defconfig
powerpc                     pq2fads_defconfig
sh                             sh03_defconfig
sh                   rts7751r2dplus_defconfig
sparc                       sparc32_defconfig
powerpc                      pcm030_defconfig
arm                         lpc18xx_defconfig
openrisc                    or1ksim_defconfig
x86_64               randconfig-c001-20220418
arm                  randconfig-c002-20220417
arm                  randconfig-c002-20220418
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220418
x86_64               randconfig-a004-20220418
x86_64               randconfig-a006-20220418
x86_64               randconfig-a001-20220418
x86_64               randconfig-a002-20220418
x86_64               randconfig-a005-20220418
i386                 randconfig-a004-20220418
i386                 randconfig-a001-20220418
i386                 randconfig-a003-20220418
i386                 randconfig-a005-20220418
i386                 randconfig-a006-20220418
i386                 randconfig-a002-20220418
arc                  randconfig-r043-20220418
arc                  randconfig-r043-20220417
s390                 randconfig-r044-20220417
riscv                randconfig-r042-20220417
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220417
arm                  randconfig-c002-20220417
i386                          randconfig-c001
riscv                randconfig-c006-20220417
mips                 randconfig-c004-20220417
riscv                randconfig-c006-20220418
arm                  randconfig-c002-20220418
powerpc              randconfig-c003-20220418
mips                 randconfig-c004-20220418
i386                 randconfig-c001-20220418
s390                 randconfig-c005-20220418
x86_64               randconfig-c007-20220418
s390                 randconfig-c005-20220417
mips                           rs90_defconfig
arm                         bcm2835_defconfig
powerpc                     kilauea_defconfig
mips                            e55_defconfig
arm64                            allyesconfig
mips                        omega2p_defconfig
mips                     cu1830-neo_defconfig
mips                           ip28_defconfig
arm                           spitz_defconfig
arm                            dove_defconfig
x86_64               randconfig-a016-20220418
x86_64               randconfig-a012-20220418
x86_64               randconfig-a013-20220418
x86_64               randconfig-a014-20220418
x86_64               randconfig-a015-20220418
x86_64               randconfig-a011-20220418
i386                 randconfig-a011-20220418
i386                 randconfig-a015-20220418
i386                 randconfig-a016-20220418
i386                 randconfig-a012-20220418
i386                 randconfig-a013-20220418
i386                 randconfig-a014-20220418
riscv                randconfig-r042-20220418
hexagon              randconfig-r041-20220417
hexagon              randconfig-r041-20220418
hexagon              randconfig-r045-20220417
s390                 randconfig-r044-20220418
hexagon              randconfig-r045-20220418

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
