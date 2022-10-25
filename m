Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4534860D384
	for <lists+linux-input@lfdr.de>; Tue, 25 Oct 2022 20:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbiJYS0X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Oct 2022 14:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiJYS0X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Oct 2022 14:26:23 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7958FEF5B0
        for <linux-input@vger.kernel.org>; Tue, 25 Oct 2022 11:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666722382; x=1698258382;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IxdaY6xlWZeYJT3BbinDPoOdpbxKNeCOaVxyZRPVh7Y=;
  b=FRaUrqOiwHpG0sZfLP8VrYCjpmwfNF2XVg1qfohQDg717oU75brHwrxk
   63DJsXXF7I+7x/jC2jPD4KEGVaHzom9qBqFmwOhlvgRXAI0h22uxJARVU
   hU1ve3Fc7YdcwpcqhoZo1Dfe6DZKFOloo8RtGW3ZEegbYcJYCtccM4pYr
   LxhdgyOtoXoC9znZ0o5Dp/vAg2BRtHiUQd4FmNKhDYMaTP2Q4nprE+aJz
   y7gqbS5GyT/dgWIzmi7RtfV7fvPkVK3xRVSbiP6xm9ySwLIJeXweRO2V8
   l/bZYajzXd7HOJvIu/XdnR91wh/LCpekPUrcgAYxyXxGsApbed2+e0TXs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="291060574"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="291060574"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 11:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="806766495"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="806766495"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Oct 2022 11:26:20 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onOd2-0006WK-0V;
        Tue, 25 Oct 2022 18:26:20 +0000
Date:   Wed, 26 Oct 2022 02:25:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 1810e248b2dc3ef2f15deafe1c3249f7de7ad417
Message-ID: <63582a15.TVh6cZ6o45mVCeSt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 1810e248b2dc3ef2f15deafe1c3249f7de7ad417  Input: matrix_keypad - replace header inclusions by forward declarations

elapsed time: 724m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                               defconfig
arc                                 defconfig
powerpc                           allnoconfig
s390                                defconfig
s390                             allmodconfig
um                             i386_defconfig
x86_64                              defconfig
mips                             allyesconfig
powerpc                          allmodconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                                defconfig
s390                             allyesconfig
arc                  randconfig-r043-20221024
sh                               allmodconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
riscv                randconfig-r042-20221024
x86_64                           allyesconfig
s390                 randconfig-r044-20221024
arc                  randconfig-r043-20221025
i386                 randconfig-a015-20221024
i386                 randconfig-a016-20221024
arm                                 defconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
ia64                             allmodconfig
x86_64                        randconfig-a015
x86_64               randconfig-a014-20221024
x86_64               randconfig-a013-20221024
arm                              allyesconfig
x86_64               randconfig-a012-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a011-20221024
x86_64               randconfig-a015-20221024
i386                 randconfig-a012-20221024
arm64                            allyesconfig
i386                 randconfig-a014-20221024
i386                 randconfig-a013-20221024
i386                 randconfig-a011-20221024
arc                  randconfig-r043-20221023
powerpc                       eiger_defconfig
powerpc                      chrp32_defconfig
csky                             alldefconfig
sh                            migor_defconfig
sh                      rts7751r2d1_defconfig
m68k                           sun3_defconfig
sh                        dreamcast_defconfig
sh                          urquell_defconfig
arm                        mini2440_defconfig
sh                          lboxre2_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64               randconfig-k001-20221024
sh                             sh03_defconfig
arm                          pxa3xx_defconfig
powerpc                       ppc64_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     sequoia_defconfig
arm                       multi_v4t_defconfig
powerpc                 mpc837x_rdb_defconfig
loongarch                         allnoconfig
parisc64                         alldefconfig
arm                            hisi_defconfig
arm                          exynos_defconfig
i386                          randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r041-20221024
hexagon              randconfig-r045-20221024
hexagon              randconfig-r041-20221025
hexagon              randconfig-r045-20221025
s390                 randconfig-r044-20221025
riscv                randconfig-r042-20221025
i386                 randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a005-20221024
i386                 randconfig-a006-20221024
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64               randconfig-a005-20221024
x86_64                        randconfig-a016
x86_64               randconfig-a003-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a001-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a004-20221024
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
