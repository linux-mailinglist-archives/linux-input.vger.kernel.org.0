Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59B64BD1F5
	for <lists+linux-input@lfdr.de>; Sun, 20 Feb 2022 22:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245084AbiBTVVT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Feb 2022 16:21:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245073AbiBTVVQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Feb 2022 16:21:16 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A994BFFD
        for <linux-input@vger.kernel.org>; Sun, 20 Feb 2022 13:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645392054; x=1676928054;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=syTIWr2Ypxeqj9JrnkAhRVWFNdKdyBYjD9tSO+2B+Ms=;
  b=QqerFzZHHihThNRsy8CJwfUZWN1i3CZWeaEoOOBJsS5KaF8I2vEGvi30
   bv+9aVviK+jAn3L4nRQbX8Pilwd2KJx1vuNg1CeuLMDFhDcHHzBV/2cMs
   6YSTiBTRkD7zvbn2+v92veVERyeshxReIZHah+9pj6T/jLAG2vPcYyK+t
   lZMBzi3zUf6mW5vEpi1eUYm5WSyalaLBqEJleYqmggsgtMMLeNV80HwWe
   FKLBDwWs6Yg6ChNbHyIxQ8///LPkS06yupAwKY27EPx3bHNQkcBrsEv+e
   fXKLN17+weVmw1dWlyZw0UW6yePy6MU/6+s5Si7ao+bYV2Ygqw6UVBky6
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="314666931"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="314666931"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 13:20:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="531612838"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Feb 2022 13:20:53 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nLtdU-0000n0-6o; Sun, 20 Feb 2022 21:20:52 +0000
Date:   Mon, 21 Feb 2022 05:20:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 7b1f781f2d2460693f43d5f764198df558e3494b
Message-ID: <6212b099.nAnFN5y4rl8g6r6i%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 7b1f781f2d2460693f43d5f764198df558e3494b  Input: psmouse - set up dependency between PS/2 and SMBus companions

elapsed time: 725m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
mips                 randconfig-c004-20220220
i386                          randconfig-c001
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
sh                          landisk_defconfig
powerpc                     redwood_defconfig
arm                          badge4_defconfig
arm                         lpc18xx_defconfig
powerpc                     pq2fads_defconfig
mips                             allyesconfig
ia64                         bigsur_defconfig
mips                      maltasmvp_defconfig
xtensa                    smp_lx200_defconfig
xtensa                          iss_defconfig
powerpc                      ppc40x_defconfig
m68k                           sun3_defconfig
arm                         axm55xx_defconfig
sh                     sh7710voipgw_defconfig
sh                        edosk7760_defconfig
powerpc                       ppc64_defconfig
arm                       multi_v4t_defconfig
powerpc                    klondike_defconfig
m68k                        m5272c3_defconfig
xtensa                              defconfig
powerpc                      pcm030_defconfig
mips                       bmips_be_defconfig
h8300                            alldefconfig
powerpc                    sam440ep_defconfig
powerpc                   motionpro_defconfig
sh                             espt_defconfig
powerpc                     tqm8555_defconfig
sh                           se7343_defconfig
sh                   rts7751r2dplus_defconfig
m68k                          amiga_defconfig
nios2                         10m50_defconfig
arm                         lubbock_defconfig
sh                         ecovec24_defconfig
mips                           xway_defconfig
mips                      loongson3_defconfig
arm64                            alldefconfig
powerpc                     rainier_defconfig
sh                        dreamcast_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                        vocore2_defconfig
um                           x86_64_defconfig
sh                           se7751_defconfig
powerpc64                           defconfig
powerpc                 mpc8540_ads_defconfig
mips                         tb0226_defconfig
mips                     decstation_defconfig
arm                            zeus_defconfig
sh                        sh7763rdp_defconfig
powerpc                      bamboo_defconfig
powerpc                       maple_defconfig
arc                          axs101_defconfig
parisc                generic-64bit_defconfig
powerpc                     tqm8541_defconfig
powerpc                     asp8347_defconfig
nds32                               defconfig
powerpc                      ppc6xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a001
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220220
s390                 randconfig-r044-20220220
riscv                randconfig-r042-20220220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220220
x86_64                        randconfig-c007
arm                  randconfig-c002-20220220
mips                 randconfig-c004-20220220
i386                          randconfig-c001
riscv                randconfig-c006-20220220
powerpc                    mvme5100_defconfig
powerpc                        fsp2_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     mpc5200_defconfig
powerpc                     kilauea_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                   microwatt_defconfig
powerpc                      walnut_defconfig
mips                        workpad_defconfig
powerpc                   bluestone_defconfig
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
hexagon              randconfig-r045-20220220
hexagon              randconfig-r041-20220220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
