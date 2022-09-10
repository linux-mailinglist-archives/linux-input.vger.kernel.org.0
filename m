Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933A35B47E6
	for <lists+linux-input@lfdr.de>; Sat, 10 Sep 2022 20:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiIJSUU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 14:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiIJSUS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 14:20:18 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142CE1AD84
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 11:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662834016; x=1694370016;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6WZDLAb3dbKw3Nha4zFfMnEtDvUI5rSFw2cyUQFGvhY=;
  b=WWvNMh02RF+esRZ3tUkRwsw9w5ChO4OT+Zlc4mkR9up1/lkmutppdUXi
   Lcc6qvCuXDvrzmc0BEKVc+C2DP8uYVR4GXnXSHELZNSfJDbcl7zpTPuhc
   /dCBFULDFkUszreGAWtNjvv8yMUTRdFVFwfM/tE9SoS9mw2QQ88zGKd+2
   EDkbeBliZ4YHvmi4yBmPUNc0+LuiPKecJ5JmkkPucFYJn1LDREqD0M6Sv
   usWCz8r2Nra6IjViFV/k/rYQL1aP+CLqBCLvayyokB90yPTec8L6w42jh
   ZPizmAF6FX/HKybqx4R40mF58/hqjJ9ZgtuuubcwblSdJ6KGjxdxka+Bc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="277399141"
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="277399141"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 11:20:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="645943490"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Sep 2022 11:20:14 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oX55R-0000MJ-34;
        Sat, 10 Sep 2022 18:20:13 +0000
Date:   Sun, 11 Sep 2022 02:20:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:tmp-gpiolib-swnode] BUILD REGRESSION
 0f07ef1f9435d4dd3cd1d593e9998eca1a40e39d
Message-ID: <631cd557.HHK3g1maYtusQ+oA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tmp-gpiolib-swnode
branch HEAD: 0f07ef1f9435d4dd3cd1d593e9998eca1a40e39d  gpiolib: acpi: avoid leaking ACPI details into upper gpiolib layers

Error/Warning reports:

https://lore.kernel.org/linux-input/202209101826.63KRVUah-lkp@intel.com
https://lore.kernel.org/linux-input/202209101827.wvnuTHku-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpio/gpiolib-of.h:24:53: warning: 'struct fwnode_hanlde' declared inside parameter list will not be visible outside of this definition or declaration
drivers/gpio/gpiolib-of.h:25:53: warning: 'struct fwnode_hanlde' declared inside parameter list will not be visible outside of this definition or declaration
drivers/gpio/gpiolib.c:4075:37: error: passing argument 1 of 'of_find_gpio' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/gpio/gpiolib.c:4077:37: error: passing argument 1 of 'of_find_gpio' from incompatible pointer type [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-randconfig-a001
|   |-- drivers-gpio-gpiolib-of.h:warning:struct-fwnode_hanlde-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|   `-- drivers-gpio-gpiolib.c:error:passing-argument-of-of_find_gpio-from-incompatible-pointer-type
|-- x86_64-randconfig-m001
|   |-- drivers-gpio-gpiolib-of.h:warning:struct-fwnode_hanlde-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|   `-- drivers-gpio-gpiolib.c:error:passing-argument-of-of_find_gpio-from-incompatible-pointer-type
`-- x86_64-rhel-8.3-kselftests
    |-- drivers-gpio-gpiolib-of.h:warning:struct-fwnode_hanlde-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
    `-- drivers-gpio-gpiolib.c:error:passing-argument-of-of_find_gpio-from-incompatible-pointer-type
clang_recent_errors
|-- hexagon-randconfig-r041-20220909
|   |-- drivers-gpio-gpiolib-of.h:warning:declaration-of-struct-fwnode_hanlde-will-not-be-visible-outside-of-this-function
|   `-- drivers-gpio-gpiolib.c:error:incompatible-pointer-types-passing-struct-fwnode_handle-to-parameter-of-type-struct-fwnode_hanlde-Werror-Wincompatible-pointer-types
`-- x86_64-randconfig-a005
    |-- drivers-gpio-gpiolib-of.h:warning:declaration-of-struct-fwnode_hanlde-will-not-be-visible-outside-of-this-function
    `-- drivers-gpio-gpiolib.c:error:incompatible-pointer-types-passing-struct-fwnode_handle-to-parameter-of-type-struct-fwnode_hanlde-Werror-Wincompatible-pointer-types

elapsed time: 725m

configs tested: 53
configs skipped: 2

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
powerpc                           allnoconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220909
sh                               allmodconfig
x86_64                        randconfig-a004
mips                             allyesconfig
x86_64                        randconfig-a002
x86_64                              defconfig
m68k                             allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a006
powerpc                          allmodconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a001
arm                                 defconfig
i386                          randconfig-a003
i386                          randconfig-a012
ia64                             allmodconfig
i386                          randconfig-a016
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
riscv                randconfig-r042-20220909
s390                 randconfig-r044-20220909
x86_64                        randconfig-a001
i386                          randconfig-a013
x86_64                        randconfig-a003
i386                          randconfig-a015
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
