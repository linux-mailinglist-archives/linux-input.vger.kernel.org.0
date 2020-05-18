Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0AD1D7C04
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 16:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbgERO6I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 10:58:08 -0400
Received: from mga05.intel.com ([192.55.52.43]:11300 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727035AbgERO6I (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 10:58:08 -0400
IronPort-SDR: Ja4DD1UUnXw93qc7GnuiqeJR6Wm2TbQvhHmnqvBY/SQBTt3Pi/K74wcLwONQvODl5ogGE1wJm+
 zPhZSqUSdf2w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 07:58:07 -0700
IronPort-SDR: DU1jHPUNYR7frrw/ljmiWbvHBcibXir2FQtSgb9hX4oPjb+wsAtEAMh1ceENrhFUlL2tATtpnv
 P5/tahSwfzOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="308129095"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 May 2020 07:58:06 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jahDR-000GmH-Hd; Mon, 18 May 2020 22:58:05 +0800
Date:   Mon, 18 May 2020 22:57:07 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD REGRESSION
 918e2844d940da7c624262a7aa327615d3eb5abd
Message-ID: <5ec2a243.kBjRre6ZrGX9S3N3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 918e2844d940da7c624262a7aa327615d3eb5abd  Input: elants - refactor elants_i2c_execute_command()

Error/Warning in current branch:

drivers/base/regmap/regmap-i2c.c:115:9: error: implicit declaration of function 'i2c_smbus_write_word_swapped' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:129:8: error: implicit declaration of function 'i2c_master_send' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:150:7: error: implicit declaration of function 'i2c_check_functionality' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:163:8: error: implicit declaration of function 'i2c_transfer' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:218:9: error: implicit declaration of function 'i2c_smbus_write_i2c_block_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:233:8: error: implicit declaration of function 'i2c_smbus_read_i2c_block_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:25:8: error: implicit declaration of function 'i2c_smbus_read_byte_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:43:9: error: implicit declaration of function 'i2c_smbus_write_byte_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:61:8: error: implicit declaration of function 'i2c_smbus_read_word_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:79:9: error: implicit declaration of function 'i2c_smbus_write_word_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-i2c.c:97:8: error: implicit declaration of function 'i2c_smbus_read_word_swapped' [-Werror=implicit-function-declaration]
drivers/input/misc/iqs269a.c:1829:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
drivers/input/misc/iqs269a.c:1829:1: warning: data definition has no type or storage class
drivers/input/misc/iqs269a.c:1829:1: warning: parameter names (without types) in function declaration

Error/Warning ids grouped by kconfigs:

recent_errors
`-- sparc-randconfig-r036-20200518
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_check_functionality
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_master_send
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_smbus_read_byte_data
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_smbus_read_i2c_block_data
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_smbus_read_word_data
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_smbus_read_word_swapped
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_smbus_write_byte_data
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_smbus_write_i2c_block_data
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_smbus_write_word_data
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_smbus_write_word_swapped
    |-- drivers-base-regmap-regmap-i2c.c:error:implicit-declaration-of-function-i2c_transfer
    |-- drivers-input-misc-iqs269a.c:error:type-defaults-to-int-in-declaration-of-module_i2c_driver
    |-- drivers-input-misc-iqs269a.c:warning:data-definition-has-no-type-or-storage-class
    `-- drivers-input-misc-iqs269a.c:warning:parameter-names-(without-types)-in-function-declaration

elapsed time: 634m

configs tested: 127
configs skipped: 10

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sparc                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
nios2                            alldefconfig
sparc                       sparc32_defconfig
ia64                         bigsur_defconfig
ia64                      gensparse_defconfig
sh                     sh7710voipgw_defconfig
powerpc                  mpc885_ads_defconfig
arm                  colibri_pxa300_defconfig
sh                      rts7751r2d1_defconfig
riscv                            allyesconfig
m68k                        mvme147_defconfig
sh                         apsh4a3a_defconfig
riscv                            alldefconfig
arm                          ep93xx_defconfig
mips                           ip32_defconfig
mips                          rm200_defconfig
mips                       lemote2f_defconfig
riscv                          rv32_defconfig
powerpc                           allnoconfig
arc                     haps_hs_smp_defconfig
xtensa                           allyesconfig
mips                        qi_lb60_defconfig
sh                           se7721_defconfig
mips                       bmips_be_defconfig
arm                      integrator_defconfig
parisc                              defconfig
sh                   sh7770_generic_defconfig
xtensa                           alldefconfig
c6x                               allnoconfig
mips                           gcw0_defconfig
ia64                        generic_defconfig
powerpc                  storcenter_defconfig
arm                       multi_v4t_defconfig
nios2                         10m50_defconfig
arc                        nsim_700_defconfig
s390                                defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
i386                 randconfig-a006-20200518
i386                 randconfig-a005-20200518
i386                 randconfig-a001-20200518
i386                 randconfig-a003-20200518
i386                 randconfig-a004-20200518
i386                 randconfig-a002-20200518
x86_64               randconfig-a016-20200518
x86_64               randconfig-a012-20200518
x86_64               randconfig-a015-20200518
x86_64               randconfig-a013-20200518
x86_64               randconfig-a011-20200518
x86_64               randconfig-a014-20200518
i386                 randconfig-a012-20200518
i386                 randconfig-a014-20200518
i386                 randconfig-a016-20200518
i386                 randconfig-a011-20200518
i386                 randconfig-a015-20200518
i386                 randconfig-a013-20200518
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-7.6-kselftests
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
