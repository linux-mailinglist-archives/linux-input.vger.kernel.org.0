Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D0A504F5B
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 13:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbiDRL2G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 07:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiDRL2E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 07:28:04 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2310E17E30
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650281126; x=1681817126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X1LXZ4zb8FuEZRzkgrdW4ZhAn7ZNbFSXmJ5gb7I9kQo=;
  b=C6GPIF4+RrDJ/SKeKG7xGKjM2gqrLMzuoasy0W3RCT2oHz0dtPaHDeJo
   d8YwJ8rSsI22lYPHNbMqRbHOsicQzqpToiZxYAcZFL8DCB6uj5y2v/7TK
   ettBqU87nFrXwrgcisM1TUaT9ed+xOD1z6Kh/UmfDIm70ajt5y9c6IL6l
   Qjz5Yg7nEFvXyvdyB/8rRSpo/+wL2SWPF6+qcaKFgNWO6iVXQX4o2afzb
   AeK0fgkLiD0FwmxrgWgpMMcTMUktw7YWXgNoJdA/nGTr5BgiM6vNkpKRq
   cq1yzcJOj0OQ0BXY8hrcgnRdD6XVg39Kk+YiGOHAsCz53LLN7Z7ZBnKZe
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="243432374"
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="243432374"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 04:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="509710335"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Apr 2022 04:25:24 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ngPVT-0004aV-Ha;
        Mon, 18 Apr 2022 11:25:23 +0000
Date:   Mon, 18 Apr 2022 19:25:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 66ab05c75642712f382a17a887eb558caa6646e1
Message-ID: <625d4a8f.h1ynmUDFCmrClWF7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 66ab05c75642712f382a17a887eb558caa6646e1  Input: iqs7222 - avoid dereferencing a NULL pointer

elapsed time: 727m

configs tested: 209
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20220418
sh                        apsh4ad0a_defconfig
mips                         db1xxx_defconfig
arm                           stm32_defconfig
powerpc                   motionpro_defconfig
arm                             rpc_defconfig
sh                           se7750_defconfig
sh                           se7705_defconfig
sh                ecovec24-romimage_defconfig
m68k                        m5272c3_defconfig
riscv                            allmodconfig
powerpc                           allnoconfig
sh                          rsk7203_defconfig
powerpc                     rainier_defconfig
h8300                            alldefconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
m68k                          atari_defconfig
sh                            shmin_defconfig
sh                             espt_defconfig
riscv                               defconfig
m68k                                defconfig
i386                                defconfig
ia64                                defconfig
arm                          simpad_defconfig
arm                           sunxi_defconfig
ia64                             alldefconfig
ia64                        generic_defconfig
arm                           u8500_defconfig
powerpc                      cm5200_defconfig
arc                              alldefconfig
sh                           se7721_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc834x_itx_defconfig
mips                     loongson1b_defconfig
powerpc                        cell_defconfig
powerpc                     tqm8548_defconfig
ia64                         bigsur_defconfig
sh                         apsh4a3a_defconfig
powerpc                     asp8347_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7269_defconfig
arm                          iop32x_defconfig
powerpc                    sam440ep_defconfig
powerpc                       holly_defconfig
sh                                  defconfig
mips                  maltasmvp_eva_defconfig
arm                        realview_defconfig
powerpc                     mpc83xx_defconfig
sh                          landisk_defconfig
powerpc                         wii_defconfig
sh                          sdk7786_defconfig
arc                        nsim_700_defconfig
mips                             allyesconfig
powerpc                 mpc85xx_cds_defconfig
mips                         mpc30x_defconfig
arm                           corgi_defconfig
powerpc                       ppc64_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc64                           defconfig
arm                        keystone_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                         rt305x_defconfig
m68k                       bvme6000_defconfig
ia64                            zx1_defconfig
powerpc64                        alldefconfig
sh                           se7343_defconfig
mips                        vocore2_defconfig
mips                  decstation_64_defconfig
mips                            ar7_defconfig
m68k                          amiga_defconfig
mips                    maltaup_xpa_defconfig
arm                      integrator_defconfig
parisc                generic-32bit_defconfig
powerpc                     pq2fads_defconfig
sh                            hp6xx_defconfig
x86_64                           alldefconfig
m68k                        m5307c3_defconfig
m68k                        m5407c3_defconfig
mips                      loongson3_defconfig
arm                       aspeed_g5_defconfig
xtensa                    smp_lx200_defconfig
sh                             sh03_defconfig
sh                   rts7751r2dplus_defconfig
sparc                       sparc32_defconfig
powerpc                      pcm030_defconfig
arm                         lpc18xx_defconfig
openrisc                    or1ksim_defconfig
arm                  randconfig-c002-20220417
arm                  randconfig-c002-20220418
x86_64               randconfig-c001-20220418
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                                defconfig
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
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                 randconfig-a004-20220418
i386                 randconfig-a001-20220418
i386                 randconfig-a003-20220418
i386                 randconfig-a005-20220418
i386                 randconfig-a006-20220418
i386                 randconfig-a002-20220418
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arc                  randconfig-r043-20220418
arc                  randconfig-r043-20220417
s390                 randconfig-r044-20220417
riscv                randconfig-r042-20220417
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
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
powerpc              randconfig-c003-20220418
mips                 randconfig-c004-20220418
riscv                randconfig-c006-20220418
i386                 randconfig-c001-20220418
s390                 randconfig-c005-20220418
x86_64               randconfig-c007-20220418
s390                 randconfig-c005-20220417
arm                  randconfig-c002-20220418
powerpc                 mpc8315_rdb_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     ppa8548_defconfig
arm                         s3c2410_defconfig
mips                           rs90_defconfig
arm                  colibri_pxa270_defconfig
arm                         shannon_defconfig
powerpc                    mvme5100_defconfig
arm                       versatile_defconfig
mips                            e55_defconfig
arm64                            allyesconfig
mips                     cu1830-neo_defconfig
mips                        omega2p_defconfig
arm                       cns3420vb_defconfig
powerpc                     tqm8540_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
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
