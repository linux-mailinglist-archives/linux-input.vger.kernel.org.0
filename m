Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9EA35E95DC
	for <lists+linux-input@lfdr.de>; Sun, 25 Sep 2022 22:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiIYUYP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Sep 2022 16:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbiIYUYO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Sep 2022 16:24:14 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF0F27CD5
        for <linux-input@vger.kernel.org>; Sun, 25 Sep 2022 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664137452; x=1695673452;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=R0uTPNh+m1YB/cElWqk7FSDQGB/K45/WrvuFAZCn0/c=;
  b=jJKYyClim2koqfiLNG5vCRlTSqFNjTzxuRxbkvQgSesB9puvALv7l1wS
   wSZad+tzoliYWPdL3lFqBOTy4vcIBnyXgYY1FTgXmDBs1nE0qWLvjGURL
   FvUk8vZp6ojEC2HoOOllFEE0kVZGTCQr65mKUCj8fc4qs9DTMySuhFpKL
   LcofAKIBz728XXdD/KbpxF1NQL5aoO9mm2/qV4dd4EcNptWTz7SecIn5B
   psDBnjbxkHQjGMFuXlz02n8XYdshNS41kYq8im2H+r5SW8tqHVdocO9Kh
   cI4UPQ5L0G96nW7MYAl9qxK0KelZdxXMFrsWYm7uoT/sRHYVokExXBA2h
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="301790484"
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="301790484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2022 13:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="949624280"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2022 13:24:10 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocYAb-0008MB-32;
        Sun, 25 Sep 2022 20:24:09 +0000
Date:   Mon, 26 Sep 2022 04:23:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:gpio-of-cleanups] BUILD REGRESSION
 2720bc0c1c4c13a5f20c55d5d6a077522b46a430
Message-ID: <6330b8db.GZPpSPNkv34DtbmA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git gpio-of-cleanups
branch HEAD: 2720bc0c1c4c13a5f20c55d5d6a077522b46a430  soc: fsl: qe: switch to using gpiod API

Error/Warning reports:

https://lore.kernel.org/linux-input/202209251708.6nw3olDU-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/soc/fsl/qe/gpio.c:183:12: warning: assignment to 'struct gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/soc/fsl/qe/gpio.c:183:14: error: implicit declaration of function 'gpio_to_chip'; did you mean 'gpiod_to_chip'? [-Werror=implicit-function-declaration]
drivers/soc/fsl/qe/gpio.c:23:32: error: field 'mm_gc' has incomplete type
drivers/soc/fsl/qe/gpio.c:341:23: error: implicit declaration of function 'of_mm_gpiochip_add_data'; did you mean 'devm_gpiochip_add_data'? [-Werror=implicit-function-declaration]
drivers/soc/fsl/qe/gpio.c:40:49: error: invalid use of undefined type 'struct of_mm_gpio_chip'
drivers/soc/fsl/qe/gpio.c:53:41: error: implicit declaration of function 'to_of_mm_gpio_chip' [-Werror=implicit-function-declaration]
drivers/soc/fsl/qe/gpio.c:53:41: warning: initialization of 'struct of_mm_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-allmodconfig
|   |-- drivers-soc-fsl-qe-gpio.c:error:field-mm_gc-has-incomplete-type
|   |-- drivers-soc-fsl-qe-gpio.c:error:implicit-declaration-of-function-gpio_to_chip
|   |-- drivers-soc-fsl-qe-gpio.c:error:implicit-declaration-of-function-of_mm_gpiochip_add_data
|   |-- drivers-soc-fsl-qe-gpio.c:error:implicit-declaration-of-function-to_of_mm_gpio_chip
|   |-- drivers-soc-fsl-qe-gpio.c:error:invalid-use-of-undefined-type-struct-of_mm_gpio_chip
|   |-- drivers-soc-fsl-qe-gpio.c:warning:assignment-to-struct-gpio_chip-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-soc-fsl-qe-gpio.c:warning:initialization-of-struct-of_mm_gpio_chip-from-int-makes-pointer-from-integer-without-a-cast
`-- powerpc-allyesconfig
    |-- drivers-soc-fsl-qe-gpio.c:error:field-mm_gc-has-incomplete-type
    |-- drivers-soc-fsl-qe-gpio.c:error:implicit-declaration-of-function-gpio_to_chip
    |-- drivers-soc-fsl-qe-gpio.c:error:implicit-declaration-of-function-of_mm_gpiochip_add_data
    |-- drivers-soc-fsl-qe-gpio.c:error:implicit-declaration-of-function-to_of_mm_gpio_chip
    |-- drivers-soc-fsl-qe-gpio.c:error:invalid-use-of-undefined-type-struct-of_mm_gpio_chip
    |-- drivers-soc-fsl-qe-gpio.c:warning:assignment-to-struct-gpio_chip-from-int-makes-pointer-from-integer-without-a-cast
    `-- drivers-soc-fsl-qe-gpio.c:warning:initialization-of-struct-of_mm_gpio_chip-from-int-makes-pointer-from-integer-without-a-cast

elapsed time: 721m

configs tested: 58
configs skipped: 2

gcc tested configs:
arc                                 defconfig
x86_64                              defconfig
alpha                               defconfig
x86_64                        randconfig-a002
i386                                defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a004
x86_64                        randconfig-a006
um                             i386_defconfig
um                           x86_64_defconfig
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           allyesconfig
s390                                defconfig
i386                          randconfig-a005
x86_64                        randconfig-a015
i386                             allyesconfig
arm64                            allyesconfig
powerpc                           allnoconfig
arm                              allyesconfig
x86_64                        randconfig-a013
s390                             allmodconfig
powerpc                          allmodconfig
x86_64                        randconfig-a011
x86_64                          rhel-8.3-func
mips                             allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a014
i386                          randconfig-a012
arc                  randconfig-r043-20220925
arc                              allyesconfig
i386                          randconfig-a016
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
s390                 randconfig-r044-20220925
riscv                randconfig-r042-20220925
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a014
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220925
hexagon              randconfig-r045-20220925

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
