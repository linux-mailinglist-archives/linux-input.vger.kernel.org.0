Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6A460C21C
	for <lists+linux-input@lfdr.de>; Tue, 25 Oct 2022 05:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiJYDME (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Oct 2022 23:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiJYDMA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Oct 2022 23:12:00 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D05A2F647
        for <linux-input@vger.kernel.org>; Mon, 24 Oct 2022 20:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666667519; x=1698203519;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4Xp3xFxdHMxXRdkrSE631JvmTk4le9FP9Ut8Bqwfb4E=;
  b=SafXDKYa757o/xokpQRlO4Y8NtPp5u7hCT45hDeNF+3iSTxvZ0D3HaGF
   bo0TeZ504uCHK6wuoUUvd5IuNKjXCDcwzh9FPj4JmwyK19MWX5IQNLXMN
   ZZ9GJkvTgPxkzYwBUCnEXhpONrVKfbZgBm8+qpSfFWFZ/kY4E9xVxp9+F
   OSjRTfo9MZD2AkboqIT8UAU4G5zAoqgmbt920C6sCkg/Oths9WI2RSClJ
   bsVZSO8rC3kY7CS/+BYEqA8mQ129LhqZZpmLzdWCO8SPoqI23byzCqAgz
   JfftPN823hnh799dL4tHAkxpDDlin5qt26lL5qjPvnKwDQpKc+JEy7526
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306306879"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="306306879"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 20:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="694792596"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="694792596"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Oct 2022 20:11:57 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onAM9-0005rd-0z;
        Tue, 25 Oct 2022 03:11:57 +0000
Date:   Tue, 25 Oct 2022 11:11:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD REGRESSION
 8b96465c93a8c0f85ead5b3f8d4305beac97899e
Message-ID: <635753e0.qTC5aInvIme6F1Fv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 8b96465c93a8c0f85ead5b3f8d4305beac97899e  Input: matrix_keypad - replace header inclusions by forward declarations

Error/Warning: (recently discovered and may have been fixed)

drivers/input/keyboard/stmpe-keypad.c:353:9: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
drivers/input/keyboard/stmpe-keypad.c:355:33: error: implicit declaration of function 'of_property_read_bool' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arc-allyesconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arc-buildonly-randconfig-r004-20221025
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arm-allyesconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arm-buildonly-randconfig-r005-20221023
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arm-randconfig-r036-20221024
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arm64-allyesconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- csky-randconfig-c004-20221025
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- i386-allyesconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- ia64-allmodconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- ia64-randconfig-r033-20221024
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- m68k-allmodconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- m68k-allyesconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- mips-allyesconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- nios2-randconfig-r025-20221023
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- s390-allyesconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
|   `-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_u32
|-- sh-allmodconfig
|   |-- drivers-input-keyboard-stmpe-keypad.c:error:implicit-declaration-of-function-of_property_read_bool
clang_recent_errors
`-- arm64-randconfig-r023-20221023
    |-- drivers-input-keyboard-stmpe-keypad.c:error:call-to-undeclared-function-of_property_read_bool-ISO-C99-and-later-do-not-support-implicit-function-declarations
    `-- drivers-input-keyboard-stmpe-keypad.c:error:call-to-undeclared-function-of_property_read_u32-ISO-C99-and-later-do-not-support-implicit-function-declarations

elapsed time: 727m

configs tested: 123
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
m68k                             allyesconfig
i386                                defconfig
i386                 randconfig-a016-20221024
i386                 randconfig-a014-20221024
i386                 randconfig-a013-20221024
x86_64                              defconfig
alpha                            allyesconfig
i386                 randconfig-a012-20221024
arc                  randconfig-r043-20221024
arc                              allyesconfig
i386                 randconfig-a011-20221024
x86_64                           rhel-8.3-syz
i386                 randconfig-a015-20221024
x86_64               randconfig-k001-20221024
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20221024
s390                 randconfig-r044-20221024
arc                  randconfig-r043-20221023
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
ia64                             allmodconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                          randconfig-c001
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
powerpc                   motionpro_defconfig
csky                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
openrisc                            defconfig
arm                        mini2440_defconfig
sh                         ecovec24_defconfig
m68k                            mac_defconfig
m68k                            q40_defconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                       omap2plus_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear6xx_defconfig
powerpc                      tqm8xx_defconfig
powerpc                 mpc834x_mds_defconfig
mips                            gpr_defconfig
sh                        sh7763rdp_defconfig
ia64                             allyesconfig
sh                             shx3_defconfig
arc                      axs103_smp_defconfig
mips                        vocore2_defconfig
sh                         ap325rxa_defconfig
ia64                      gensparse_defconfig
arm                          pxa910_defconfig
i386                 randconfig-c001-20221024
parisc                generic-64bit_defconfig
sh                           se7712_defconfig
arc                              alldefconfig
sh                        dreamcast_defconfig
sh                          polaris_defconfig
riscv                    nommu_k210_defconfig
xtensa                    xip_kc705_defconfig
powerpc                      chrp32_defconfig
sh                          lboxre2_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                       m5249evb_defconfig
arm                       aspeed_g5_defconfig
powerpc                  storcenter_defconfig
powerpc                 canyonlands_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                     tqm8555_defconfig

clang tested configs:
hexagon              randconfig-r045-20221023
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221024
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023
hexagon              randconfig-r041-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a005-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a001-20221024
x86_64               randconfig-a004-20221024
x86_64               randconfig-a003-20221024
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
mips                     loongson2k_defconfig
arm                          moxart_defconfig
arm                         s3c2410_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
