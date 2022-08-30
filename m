Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6055A5CA7
	for <lists+linux-input@lfdr.de>; Tue, 30 Aug 2022 09:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbiH3HOP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 03:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbiH3HOO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 03:14:14 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BBEEC22BD
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 00:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661843653; x=1693379653;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t+JJJHDALaqbYngAXfK0S42AU2X8Eetci0rTIQCs2r0=;
  b=j+NaHGx7FsA2jS/tUf8hcvssmESY1J5UNfBSqA+tuZXABaoa/x3WZT4K
   sN1RbIP9wlH0kW8Z5YCbXhgx4RCdgUAUaiu/prK/qe/OzM0VBgh5oif8x
   yiZGVZdfL2ASWp+2iPjm3QFwMU7u1Oz1Zjoo+wZ9dm34KmgM7PDfd5m/i
   bAtgoBlUB+5H36npd+9XtzzGcP8Y+3y8q4X08G/Ko0Ckw/WnoFLwxyOwt
   E9ORw84OK97Q1AQ/Kz5ajOrcBMcIxPiavtm9iSkPwbkwI5UaeC4Z8rdqp
   kuyNbX1aj+yzD8vR0VW4+iBJ6wkSrpteJZ4RbOmDN9qpYdNcOPHdNooz1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="359066652"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="359066652"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 00:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="679929991"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2022 00:13:53 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSvRY-00001c-1X;
        Tue, 30 Aug 2022 07:13:52 +0000
Date:   Tue, 30 Aug 2022 15:13:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 9c9c71168f7979f3798b61c65b4530fbfbcf19d1
Message-ID: <630db885.xrZ+FH9HBGODDW6P%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 9c9c71168f7979f3798b61c65b4530fbfbcf19d1  Input: iforce - add support for Boeder Force Feedback Wheel

elapsed time: 728m

configs tested: 71
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                  randconfig-r043-20220829
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
i386                 randconfig-a001-20220829
x86_64               randconfig-a003-20220829
m68k                             allmodconfig
i386                 randconfig-a003-20220829
mips                             allyesconfig
arc                              allyesconfig
i386                 randconfig-a002-20220829
powerpc                          allmodconfig
alpha                            allyesconfig
i386                 randconfig-a004-20220829
x86_64               randconfig-a004-20220829
x86_64               randconfig-a005-20220829
i386                 randconfig-a005-20220829
x86_64               randconfig-a002-20220829
i386                 randconfig-a006-20220829
x86_64               randconfig-a006-20220829
x86_64                          rhel-8.3-func
m68k                             allyesconfig
x86_64               randconfig-a001-20220829
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
i386                                defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                             allyesconfig
sh                            migor_defconfig
sh                      rts7751r2d1_defconfig
x86_64                           allyesconfig
xtensa                           alldefconfig
powerpc                         wii_defconfig
powerpc                        cell_defconfig
xtensa                    xip_kc705_defconfig
arm                                 defconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
powerpc                    amigaone_defconfig
arm                              allyesconfig
m68k                       m5208evb_defconfig
arm64                            allyesconfig
xtensa                  nommu_kc705_defconfig
powerpc                       ppc64_defconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220829
hexagon              randconfig-r045-20220829
s390                 randconfig-r044-20220829
riscv                randconfig-r042-20220829
i386                 randconfig-a011-20220829
i386                 randconfig-a014-20220829
i386                 randconfig-a013-20220829
i386                 randconfig-a012-20220829
i386                 randconfig-a016-20220829
i386                 randconfig-a015-20220829
x86_64               randconfig-a011-20220829
x86_64               randconfig-a012-20220829
x86_64               randconfig-a013-20220829
x86_64               randconfig-a014-20220829
x86_64               randconfig-a016-20220829
x86_64               randconfig-a015-20220829
arm                        magician_defconfig
powerpc                   lite5200b_defconfig
arm                         orion5x_defconfig
powerpc                     powernv_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
