Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0DFE61010D
	for <lists+linux-input@lfdr.de>; Thu, 27 Oct 2022 21:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbiJ0TC6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Oct 2022 15:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234239AbiJ0TCz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Oct 2022 15:02:55 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C691F9CC
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666897372; x=1698433372;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zchs729TIg13hFzn/HF0g99CxsUZpC1eI2YZg2QdQ0s=;
  b=dOIu3zTQbfTq5s7R87FnSW7L1ZFk0S7+NydOoHUb88zQvQjqW7wNPKPW
   WeSOhFPOp/1aSP4jNtcRLk3RIeMGzHT2bIH4AdPiLFY8RzJKXdjIchBnV
   3UtcOCT/37DaqOlyj5vnYM9W6IKsiGX2JgxvcG8VUtnoZsH+HIGe35IS1
   XBop8rzayshF7PdIgihudU3qZp39TqSKbE7KWH99mixOb35E/WkNRhdS2
   vMxzXClrFF/PSqa+0vlcij9jGAtLexJC7KxcdnsKNFJxcXhQkzKopQG9c
   nBP8X/8ZOokn5FB5OnpfZEG6rqlrAiG3i7FQm1jmzXY7O1GTDxUf7u7ZN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="372527607"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="372527607"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 12:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="721778180"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="721778180"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Oct 2022 12:02:26 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oo893-00095R-3C;
        Thu, 27 Oct 2022 19:02:25 +0000
Date:   Fri, 28 Oct 2022 03:01:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:tmp-gpiolib-of-quirks] BUILD REGRESSION
 4b127b2f83c2dc81d6086bcadc7edf23ceb68c2c
Message-ID: <635ad58f.HwRWKwmrcC0PHntP%lkp@intel.com>
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
branch HEAD: 4b127b2f83c2dc81d6086bcadc7edf23ceb68c2c  ASoC: tlv320aic32x4: switch to using gpiod API

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202210271732.IoNpItvn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210271750.BWb6m6Ea-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210271820.FwHgix56-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210271848.7RUTkksN-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210271848.bSWRN91d-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210271848.sxSX2RC4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210271855.3v6wD1JI-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210271857.9cuAVv2q-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210271923.kSPtk6tU-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210272003.lma6nxlm-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210280157.7GGmSmOd-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210280222.12tylowe-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c:254:57: error: 'node' undeclared (first use in this function)
drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:298:9: error: implicit declaration of function 'gpio_set_value_cansleep'; did you mean 'gpiod_set_value_cansleep'? [-Werror=implicit-function-declaration]
drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:499:29: warning: passing argument 1 of 'PTR_ERR_OR_ZERO' makes pointer from integer without a cast [-Wint-conversion]
drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:505:38: error: 'struct panel_drv_data' has no member named 'reset'
drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:505:45: error: expected ')' before string constant
drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:505:9: error: too few arguments to function 'gpiod_set_consumer_name'
sound/soc/codecs/tpa6130a2.c:62:33: error: implicit declaration of function 'gpioid_set_value'; did you mean 'gpiod_set_value'? [-Werror=implicit-function-declaration]
sound/soc/codecs/wcd9335.c:5055:30: warning: format '%d' expects a matching 'int' argument [-Wformat=]
sound/soc/codecs/wcd938x.c:4042:15: error: variable 'wcd_irq_chip' has initializer but incomplete type
sound/soc/codecs/wcd938x.c:4042:24: error: storage size of 'wcd_irq_chip' isn't known
sound/soc/codecs/wcd938x.c:4043:10: error: 'struct irq_chip' has no member named 'name'
sound/soc/codecs/wcd938x.c:4043:17: warning: excess elements in struct initializer
sound/soc/codecs/wcd938x.c:4049:55: error: 'handle_simple_irq' undeclared (first use in this function)
sound/soc/codecs/wcd938x.c:4049:9: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
sound/soc/codecs/wcd938x.c:4050:9: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
sound/soc/codecs/wcd938x.c:4051:9: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
sound/soc/codecs/wcd938x.c:4057:16: warning: excess elements in struct initializer
sound/soc/codecs/wcd938x.c:4063:19: warning: assignment to 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
|-- arc-allyesconfig
|   `-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
|-- arm-allyesconfig
|   |-- sound-soc-codecs-tpa6130a2.c:error:implicit-declaration-of-function-gpioid_set_value
|   |-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
|   |-- sound-soc-codecs-wcd938x.c:warning:assignment-to-struct-irq_domain-from-int-makes-pointer-from-integer-without-a-cast
|   `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer
|-- arm64-allyesconfig
|   |-- sound-soc-codecs-tpa6130a2.c:error:implicit-declaration-of-function-gpioid_set_value
|   |-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
|   |-- sound-soc-codecs-wcd938x.c:warning:assignment-to-struct-irq_domain-from-int-makes-pointer-from-integer-without-a-cast
|   `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer
|-- ia64-allyesconfig
|   |-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
|   |-- sound-soc-codecs-wcd938x.c:warning:assignment-to-struct-irq_domain-from-int-makes-pointer-from-integer-without-a-cast
|   `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer
|-- ia64-randconfig-r036-20221026
|   |-- sound-soc-codecs-tpa6130a2.c:error:implicit-declaration-of-function-gpioid_set_value
|   `-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
|-- m68k-allmodconfig
|   `-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
|-- m68k-allyesconfig
|   |-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
|   |-- sound-soc-codecs-wcd938x.c:warning:assignment-to-struct-irq_domain-from-int-makes-pointer-from-integer-without-a-cast
|   `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer
|-- parisc-randconfig-r025-20221026
|   `-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
|-- s390-allyesconfig
|   |-- sound-soc-codecs-wcd938x.c:error:handle_simple_irq-undeclared-(first-use-in-this-function)
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_chip_and_handler
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_nested_thread
|   |-- sound-soc-codecs-wcd938x.c:error:implicit-declaration-of-function-irq_set_noprobe
|   |-- sound-soc-codecs-wcd938x.c:error:storage-size-of-wcd_irq_chip-isn-t-known
|   |-- sound-soc-codecs-wcd938x.c:error:struct-irq_chip-has-no-member-named-name
|   `-- sound-soc-codecs-wcd938x.c:error:variable-wcd_irq_chip-has-initializer-but-incomplete-type
|-- sh-allmodconfig
|   |-- drivers-video-fbdev-omap2-omapfb-displays-panel-nec-nl8048hl11.c:error:node-undeclared-(first-use-in-this-function)
|   |-- drivers-video-fbdev-omap2-omapfb-displays-panel-tpo-td043mtea1.c:error:expected-)-before-string-constant
|   |-- drivers-video-fbdev-omap2-omapfb-displays-panel-tpo-td043mtea1.c:error:implicit-declaration-of-function-gpio_set_value_cansleep
|   |-- drivers-video-fbdev-omap2-omapfb-displays-panel-tpo-td043mtea1.c:error:struct-panel_drv_data-has-no-member-named-reset
|   |-- drivers-video-fbdev-omap2-omapfb-displays-panel-tpo-td043mtea1.c:error:too-few-arguments-to-function-gpiod_set_consumer_name
|   `-- drivers-video-fbdev-omap2-omapfb-displays-panel-tpo-td043mtea1.c:warning:passing-argument-of-PTR_ERR_OR_ZERO-makes-pointer-from-integer-without-a-cast
|-- sparc-randconfig-r022-20221026
|   `-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
`-- x86_64-allyesconfig
    |-- sound-soc-codecs-wcd9335.c:warning:format-d-expects-a-matching-int-argument
    |-- sound-soc-codecs-wcd938x.c:warning:assignment-to-struct-irq_domain-from-int-makes-pointer-from-integer-without-a-cast
    `-- sound-soc-codecs-wcd938x.c:warning:excess-elements-in-struct-initializer
clang_recent_errors
|-- hexagon-randconfig-r041-20221026
|   |-- sound-soc-codecs-max98373-i2c.c:error:incompatible-pointer-types-passing-struct-gpio_decs-to-parameter-of-type-struct-gpio_desc-Werror-Wincompatible-pointer-types
|   |-- sound-soc-codecs-max98373-i2c.c:error:use-of-undeclared-identifier-dev
|   |-- sound-soc-codecs-tas5086.c:error:incompatible-pointer-types-assigning-to-struct-gpio_decs-from-struct-gpio_desc-Werror-Wincompatible-pointer-types
|   `-- sound-soc-codecs-tas5086.c:error:incompatible-pointer-types-passing-struct-gpio_decs-to-parameter-of-type-struct-gpio_desc-Werror-Wincompatible-pointer-types
|-- i386-randconfig-a006
|   |-- sound-soc-codecs-tas5086.c:error:incompatible-pointer-types-assigning-to-struct-gpio_decs-from-struct-gpio_desc-Werror-Wincompatible-pointer-types
|   |-- sound-soc-codecs-tas5086.c:error:incompatible-pointer-types-passing-struct-gpio_decs-to-parameter-of-type-struct-gpio_desc-Werror-Wincompatible-pointer-types
|   `-- sound-soc-codecs-wcd9335.c:warning:more-conversions-than-data-arguments
|-- i386-randconfig-a011
|   |-- sound-soc-codecs-tlv320aic32x4.c:error:incomplete-definition-of-type-struct-aic32x4_setup_data
|   `-- sound-soc-codecs-tpa6130a2.c:error:implicit-declaration-of-function-gpioid_set_value-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|-- mips-randconfig-r024-20221026
|   `-- drivers-video-fbdev-omap2-omapfb-displays-panel-nec-nl8048hl11.c:error:use-of-undeclared-identifier-node
`-- x86_64-randconfig-a014
    |-- sound-soc-codecs-max98373-i2c.c:error:incompatible-pointer-types-passing-struct-gpio_decs-to-parameter-of-type-struct-gpio_desc-Werror-Wincompatible-pointer-types
    |-- sound-soc-codecs-max98373-i2c.c:error:use-of-undeclared-identifier-dev
    `-- sound-soc-codecs-tpa6130a2.c:error:implicit-declaration-of-function-gpioid_set_value-is-invalid-in-C99-Werror-Wimplicit-function-declaration

elapsed time: 724m

configs tested: 57
configs skipped: 2

gcc tested configs:
um                           x86_64_defconfig
ia64                             allmodconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
powerpc                           allnoconfig
alpha                               defconfig
powerpc                          allmodconfig
s390                                defconfig
i386                                defconfig
mips                             allyesconfig
s390                             allyesconfig
sh                               allmodconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                              defconfig
i386                          randconfig-a005
riscv                randconfig-r042-20221026
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221026
s390                 randconfig-r044-20221026
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
i386                          randconfig-a012
arc                              allyesconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a004
i386                          randconfig-a016
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
x86_64                        randconfig-a006
arm                                 defconfig
m68k                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
i386                          randconfig-a002
hexagon              randconfig-r045-20221026
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a004
hexagon              randconfig-r041-20221026
i386                          randconfig-a011
x86_64                        randconfig-a014
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
