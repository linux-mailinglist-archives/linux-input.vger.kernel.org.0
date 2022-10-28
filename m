Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17726119D9
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 20:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiJ1SDx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 14:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiJ1SDv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 14:03:51 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A86821128D
        for <linux-input@vger.kernel.org>; Fri, 28 Oct 2022 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666980230; x=1698516230;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rGRH7fKm7eC9oI5KIZut83ZjExedAhFfJzhIvMrUQW8=;
  b=Yz4TfWAsXSKxZAvN6oMqMnIxRd7v1BVGhn6F6lkm73M6NyhMnge0WsRb
   /eLjWy2t2cQc+CJ1uAZjhHI/jeDfWvYh59qkz4/wGRkaBDfF7OiLjEaTW
   KJXRKfWJizJp64a0AGUqrRx+nWWR3eIAsiFvSJpaw2/E4J44DNOVYlOfT
   8x5rg7PSJwael2bBGSykKlxupyypQaSgNFuwK953LpcUMcnCzQhBaa/wQ
   JQq1BCZ8fqcEkFpdYF/VRdl4BSdiEoWnVJTCZvCTOtoZq107W1N6shey5
   1dMEZlcRCdYfJ2Kjyim1ZVIoz5oJjVQ+VHPc/4IXttz9JLdlzJ603NhRI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="372766727"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="372766727"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 11:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="584004789"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="584004789"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Oct 2022 11:03:48 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooThr-000A7G-2c;
        Fri, 28 Oct 2022 18:03:47 +0000
Date:   Sat, 29 Oct 2022 02:03:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:tmp-gpiolib-of-quirks] BUILD REGRESSION
 1c47bdc8ffacb79e05472c796f4da7daf8389eab
Message-ID: <635c1980.5ELU0hAoxwzKCHOp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tmp-gpiolib-of-quirks
branch HEAD: 1c47bdc8ffacb79e05472c796f4da7daf8389eab  ASoC: tlv320aic32x4: switch to using gpiod API

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202210271750.BWb6m6Ea-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210272003.lma6nxlm-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210280222.12tylowe-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:505:38: error: 'struct panel_drv_data' has no member named 'reset'
sound/soc/codecs/wcd938x.c:4043:15: error: variable 'wcd_irq_chip' has initializer but incomplete type
sound/soc/codecs/wcd938x.c:4043:24: error: storage size of 'wcd_irq_chip' isn't known
sound/soc/codecs/wcd938x.c:4044:10: error: 'struct irq_chip' has no member named 'name'
sound/soc/codecs/wcd938x.c:4044:17: warning: excess elements in struct initializer
sound/soc/codecs/wcd938x.c:4050:55: error: 'handle_simple_irq' undeclared (first use in this function)
sound/soc/codecs/wcd938x.c:4050:9: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
sound/soc/codecs/wcd938x.c:4051:9: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
sound/soc/codecs/wcd938x.c:4052:9: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allyesconfig
|   |-- sound-soc-codecs-wcd938x.c:error:handle_simple_irq-undeclared-(first-use-in-this-function)
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_chip_and_handler
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_nested_thread
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_noprobe
|   |-- sound-soc-codecs-wcd938x.c:error:storage-size-of-wcd_irq_chip-isn-t-known
|   |-- sound-soc-codecs-wcd938x.c:error:struct-irq_chip-has-no-member-named-name
|   |-- sound-soc-codecs-wcd938x.c:error:variable-wcd_irq_chip-has-initializer-but-incomplete-type
|   `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer
|-- s390-allyesconfig
|   |-- sound-soc-codecs-wcd938x.c:error:handle_simple_irq-undeclared-(first-use-in-this-function)
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_chip_and_handler
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_nested_thread
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_noprobe
|   |-- sound-soc-codecs-wcd938x.c:error:storage-size-of-wcd_irq_chip-isn-t-known
|   |-- sound-soc-codecs-wcd938x.c:error:struct-irq_chip-has-no-member-named-name
|   |-- sound-soc-codecs-wcd938x.c:error:variable-wcd_irq_chip-has-initializer-but-incomplete-type
|   `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer
|-- sh-allmodconfig
|   `-- drivers-video-fbdev-omap2-omapfb-displays-panel-tpo-td043mtea1.c:error:struct-panel_drv_data-has-no-member-named-reset
|-- sparc-allyesconfig
|   |-- sound-soc-codecs-wcd938x.c:error:handle_simple_irq-undeclared-(first-use-in-this-function)
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_chip_and_handler
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_nested_thread
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_noprobe
|   |-- sound-soc-codecs-wcd938x.c:error:storage-size-of-wcd_irq_chip-isn-t-known
|   |-- sound-soc-codecs-wcd938x.c:error:struct-irq_chip-has-no-member-named-name
|   |-- sound-soc-codecs-wcd938x.c:error:variable-wcd_irq_chip-has-initializer-but-incomplete-type
|   `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer
|-- x86_64-allmodconfig
|   |-- sound-soc-codecs-wcd938x.c:error:handle_simple_irq-undeclared-(first-use-in-this-function)
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_chip_and_handler
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_nested_thread
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_noprobe
|   |-- sound-soc-codecs-wcd938x.c:error:storage-size-of-wcd_irq_chip-isn-t-known
|   |-- sound-soc-codecs-wcd938x.c:error:struct-irq_chip-has-no-member-named-name
|   |-- sound-soc-codecs-wcd938x.c:error:variable-wcd_irq_chip-has-initializer-but-incomplete-type
|   `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer
`-- x86_64-allyesconfig
    |-- sound-soc-codecs-wcd938x.c:error:handle_simple_irq-undeclared-(first-use-in-this-function)
    |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_chip_and_handler
    |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_nested_thread
    |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_noprobe
    |-- sound-soc-codecs-wcd938x.c:error:storage-size-of-wcd_irq_chip-isn-t-known
    |-- sound-soc-codecs-wcd938x.c:error:struct-irq_chip-has-no-member-named-name
    |-- sound-soc-codecs-wcd938x.c:error:variable-wcd_irq_chip-has-initializer-but-incomplete-type
    `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer

elapsed time: 726m

configs tested: 58
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                                defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                        randconfig-a002
m68k                             allmodconfig
x86_64                               rhel-8.3
arc                              allyesconfig
powerpc                           allnoconfig
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
s390                                defconfig
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
arc                  randconfig-r043-20221027
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
x86_64                        randconfig-a015
arm                                 defconfig
alpha                            allyesconfig
x86_64                        randconfig-a006
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
sh                               allmodconfig
powerpc                          allmodconfig
i386                          randconfig-a003
mips                             allyesconfig
i386                          randconfig-a005
i386                          randconfig-a014
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
arm64                            allyesconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a001
hexagon              randconfig-r045-20221027
s390                 randconfig-r044-20221027
x86_64                        randconfig-a003
riscv                randconfig-r042-20221027
x86_64                        randconfig-a005
hexagon              randconfig-r041-20221027
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
