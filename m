Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5806D5BEC0D
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 19:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiITRcr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 13:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiITRcq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 13:32:46 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7690963B6
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663695165; x=1695231165;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=deuu/YkZ9OKKz8UHPVB6SzCsiKX0F6GsrQ5nHo5O0Ek=;
  b=JEMxIbQJgGFhAYZreK+XvX7OM74Ne4eAG+bwGzro25ULDqRvTBYD7+2N
   czWFGpvnhectlmXROnPyJMEKyTi/YUSh+jwHYYqyeV+GNUDF7G69vIXSg
   M2w65Udqh3P/Xm4bkorCaOSz9VQ91RkQZb/24t0dbJHAyW/Z6pHfoGFwY
   HW52aVSRQ8l7cs20eck/VkPB1q/SENrqo2UdLz3i80EUFhqCdcyWyknHK
   psn4OujuGbwsOHzYXEUijj6VzH/AB6dagW+p/rL8HBB2LFuDGBf7GPpXQ
   1fhT1tLE5QaP8ZwfgpZ6BRoiT6XoO+ep1u+FwR5mX52Ao29zGEFSYsWp4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="301144451"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="301144451"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 10:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="681397753"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2022 10:32:23 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oah6c-0002rp-1p;
        Tue, 20 Sep 2022 17:32:22 +0000
Date:   Wed, 21 Sep 2022 01:32:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:gpio-test] BUILD REGRESSION
 53be931d133999d54ca1f0869ffb0aed731a0289
Message-ID: <6329f911.Dbb5LCQk1hRU207p%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git gpio-test
branch HEAD: 53be931d133999d54ca1f0869ffb0aed731a0289  ASoC: ssm2518: switch to using gpiod API

Error/Warning reports:

https://lore.kernel.org/linux-input/202209201926.qKKWT7uk-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/pci/controller/pci-mvebu.c:1100:9: error: implicit declaration of function 'chained_irq_enter'; did you mean 'ct_irq_enter'? [-Werror=implicit-function-declaration]
drivers/pci/controller/pci-mvebu.c:1115:9: error: implicit declaration of function 'chained_irq_exit'; did you mean 'ct_irq_exit'? [-Werror=implicit-function-declaration]
drivers/pci/controller/pci-mvebu.c:1344:17: error: too few arguments to function 'devm_kfree'
drivers/pci/controller/pci-mvebu.c:1344:32: error: passing argument 1 of 'devm_kfree' from incompatible pointer type [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm-defconfig
    |-- drivers-pci-controller-pci-mvebu.c:error:implicit-declaration-of-function-chained_irq_enter
    |-- drivers-pci-controller-pci-mvebu.c:error:implicit-declaration-of-function-chained_irq_exit
    |-- drivers-pci-controller-pci-mvebu.c:error:passing-argument-of-devm_kfree-from-incompatible-pointer-type
    `-- drivers-pci-controller-pci-mvebu.c:error:too-few-arguments-to-function-devm_kfree

elapsed time: 721m

configs tested: 58
configs skipped: 2

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                               rhel-8.3
s390                             allyesconfig
x86_64               randconfig-a012-20220919
riscv                randconfig-r042-20220919
powerpc                           allnoconfig
arc                  randconfig-r043-20220919
x86_64               randconfig-a011-20220919
x86_64               randconfig-a014-20220919
x86_64                           allyesconfig
i386                 randconfig-a013-20220919
i386                                defconfig
x86_64               randconfig-a015-20220919
arm                                 defconfig
s390                 randconfig-r044-20220919
x86_64               randconfig-a013-20220919
x86_64               randconfig-a016-20220919
i386                 randconfig-a012-20220919
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a011-20220919
x86_64                          rhel-8.3-func
arm                              allyesconfig
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
i386                 randconfig-a014-20220919
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
i386                 randconfig-a016-20220919
arc                              allyesconfig
i386                 randconfig-a015-20220919
alpha                            allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig
i386                             allyesconfig

clang tested configs:
i386                 randconfig-a001-20220919
i386                 randconfig-a002-20220919
i386                 randconfig-a003-20220919
i386                 randconfig-a004-20220919
i386                 randconfig-a006-20220919
i386                 randconfig-a005-20220919
x86_64               randconfig-a003-20220919
hexagon              randconfig-r041-20220919
x86_64               randconfig-a001-20220919
x86_64               randconfig-a002-20220919
hexagon              randconfig-r045-20220919
x86_64               randconfig-a004-20220919
x86_64               randconfig-a006-20220919
x86_64               randconfig-a005-20220919

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
