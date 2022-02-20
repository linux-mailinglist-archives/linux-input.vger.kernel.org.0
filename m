Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF4F4BD20F
	for <lists+linux-input@lfdr.de>; Sun, 20 Feb 2022 22:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237000AbiBTVeV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Feb 2022 16:34:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbiBTVeT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Feb 2022 16:34:19 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A83377FB
        for <linux-input@vger.kernel.org>; Sun, 20 Feb 2022 13:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645392835; x=1676928835;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YN0OwfG6Q08+FsMA1jqeu1eZPhFQCbUAKwlZmZp8IgQ=;
  b=Sl7Gr+PsuXeyb+gq4KmHfo03wf4b2oDIoZLkamFm82BJMnGfY+TdWQOK
   pnJxW1VXs1jzbzDUABNRs7qlecdVhGouOjlnb3t/7id7qhrMaVgu6Xgk9
   jB2GmVBX6uneItRtIwHEby3j6eTQBQuh13ukqb5YEJ5P7gMBi9PKLGir3
   KqQWLyk+urpDaAQYVO9+lix+tIx2G/tBeC+ab4mdagD4yZPnPkmMKpfsu
   NOYPixefTX+38xKHQvx1m/XR64b0RlcWsw1dXi90SeEF2xVd6UZrZW5fk
   L0VZnDz7/D1X+kxGQzQPlPg4s2LtocKbj4KU62EJhied77gepCvsuA0eu
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="248984511"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="248984511"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 13:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="531616183"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Feb 2022 13:33:54 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nLtq5-0000sL-GL; Sun, 20 Feb 2022 21:33:53 +0000
Date:   Mon, 21 Feb 2022 05:33:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 986c6f7c3fc855032f3457a5a1b7fbcc09c375bb
Message-ID: <6212b3af.i18SeAaOphl40lCv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 986c6f7c3fc855032f3457a5a1b7fbcc09c375bb  Merge tag 'v5.17-rc4' into next

elapsed time: 733m

configs tested: 147
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220220
sh                           se7619_defconfig
arm                        clps711x_defconfig
m68k                        stmark2_defconfig
mips                        vocore2_defconfig
mips                 decstation_r4k_defconfig
powerpc                       eiger_defconfig
mips                      loongson3_defconfig
xtensa                    smp_lx200_defconfig
xtensa                          iss_defconfig
powerpc                      ppc40x_defconfig
arm                          iop32x_defconfig
sh                          r7780mp_defconfig
powerpc                    klondike_defconfig
m68k                        m5272c3_defconfig
xtensa                              defconfig
arm                         axm55xx_defconfig
powerpc                     tqm8555_defconfig
sparc64                          alldefconfig
arm                       omap2plus_defconfig
sh                         ap325rxa_defconfig
powerpc                      pcm030_defconfig
mips                       bmips_be_defconfig
h8300                            alldefconfig
nios2                         10m50_defconfig
arm                         lubbock_defconfig
sh                         ecovec24_defconfig
m68k                        m5407c3_defconfig
arm                            xcep_defconfig
arm                          lpd270_defconfig
arm                           h3600_defconfig
mips                           xway_defconfig
arm                            zeus_defconfig
sh                        sh7763rdp_defconfig
powerpc                      bamboo_defconfig
sh                          sdk7780_defconfig
ia64                         bigsur_defconfig
arc                            hsdk_defconfig
h8300                               defconfig
nds32                               defconfig
sh                          landisk_defconfig
powerpc                      ppc6xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220220
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
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
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a001
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a013
i386                          randconfig-a016
i386                          randconfig-a012
i386                          randconfig-a014
s390                 randconfig-r044-20220220
arc                  randconfig-r043-20220220
riscv                randconfig-r042-20220220
x86_64                        randconfig-a006
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
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
mips                          ath79_defconfig
arm                      pxa255-idp_defconfig
powerpc                    mvme5100_defconfig
powerpc                        fsp2_defconfig
powerpc                 mpc836x_mds_defconfig
arm                       cns3420vb_defconfig
mips                           ip27_defconfig
powerpc                     mpc5200_defconfig
powerpc                     kilauea_defconfig
powerpc                    ge_imp3a_defconfig
arm                         mv78xx0_defconfig
powerpc                     ppa8548_defconfig
mips                          rm200_defconfig
x86_64                           allyesconfig
arm                          moxart_defconfig
mips                         tb0287_defconfig
powerpc                  mpc866_ads_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220220
hexagon              randconfig-r041-20220220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
