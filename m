Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E79629B50
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 14:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiKON7M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 08:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiKON7L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 08:59:11 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCB8399
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 05:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668520750; x=1700056750;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lFTBX9nbZwFhU2mkAqgpkJBHn6PZqn8oStQpZ8ABriU=;
  b=K0aZW/IZeVbGAR6NdSv285n16xGUS4AhcrXAIthqy9Ad549BUDYPLZ4p
   XWRBzEOkhYvcPOas2BkE2v2J6S3NOxk3LIWBAr6AvvXyKpbnIEqWvvgBL
   a9pMHs/AEvLdlZEYA4h7L6QgABUJCTGxY3kalPJkjaJlVrnRcUkDzy9Tx
   ijtROK/5sxe3eC03MwSQfgfbve2clkvJ/jMubSYkEHifj4fQjtWvGSBme
   xImUOpy1vqzGwKkia/+U4Y3e91jv/JWoF/X/BV1yPSgOcR4sN150pRpoh
   p+ipC46gtesuk6Va+jtq1D0qsHJbk5u/heL9PHlg9b8McnAuWQXxcDHBP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="398546468"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="398546468"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 05:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="744600064"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="744600064"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2022 05:59:08 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ouwSx-0001PF-1m;
        Tue, 15 Nov 2022 13:59:07 +0000
Date:   Tue, 15 Nov 2022 21:58:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 ae6b18e631d6afb4beaec9288a3245a77b22c06a
Message-ID: <63739b05.p8Y7xPpLt5t/P8dF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: ae6b18e631d6afb4beaec9288a3245a77b22c06a  Input: msg2638 - add support for msg2138

elapsed time: 726m

configs tested: 97
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20221114
s390                             allyesconfig
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a005-20221114
m68k                             allmodconfig
x86_64               randconfig-a002-20221114
i386                 randconfig-a006-20221114
i386                                defconfig
x86_64                              defconfig
x86_64               randconfig-a001-20221114
x86_64               randconfig-a004-20221114
x86_64               randconfig-a005-20221114
i386                 randconfig-a002-20221114
x86_64               randconfig-a006-20221114
i386                 randconfig-a003-20221114
x86_64               randconfig-a003-20221114
i386                 randconfig-a001-20221114
i386                 randconfig-a004-20221114
ia64                             allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
x86_64                            allnoconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
xtensa                         virt_defconfig
sh                            shmin_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
parisc                generic-32bit_defconfig
sh                     magicpanelr2_defconfig
mips                           gcw0_defconfig
powerpc                     stx_gp3_defconfig
sh                           sh2007_defconfig
loongarch                        allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-c001
arm                           sunxi_defconfig
arm                               allnoconfig
loongarch                 loongson3_defconfig
arc                         haps_hs_defconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
sh                            hp6xx_defconfig
mips                  decstation_64_defconfig
powerpc                    sam440ep_defconfig
sparc64                          alldefconfig
m68k                          atari_defconfig
powerpc                      ppc6xx_defconfig
powerpc                        cell_defconfig

clang tested configs:
s390                 randconfig-r044-20221114
hexagon              randconfig-r041-20221114
hexagon              randconfig-r045-20221114
riscv                randconfig-r042-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a014-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
i386                          randconfig-a013
i386                 randconfig-a013-20221114
i386                          randconfig-a011
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a016-20221114
i386                          randconfig-a015
arm                        magician_defconfig
x86_64               randconfig-k001-20221114
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
