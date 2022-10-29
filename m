Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6096B6121C2
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 11:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiJ2JZa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 05:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJ2JZ2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 05:25:28 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9334D11A1B
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667035526; x=1698571526;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q3DcF6r3d7L7Wg/l317iK0pZmPKuaREz1xdisyIto2A=;
  b=aqbiHnVP6asz6YBBuFNW39sV0s0xVebhNEjy7mADbQCZCB9cAqt9YInj
   32NG8OvJv43ccHX0uxTR0kse7F4r411jBjMmyYiCoa5rm7wESN4Wp6niX
   b6UKmN3OYbm+e7RRhhgMPTh293aRkKr6Sou95oYuH3BjenQ7eCBKWsFrh
   xZOesG+AfM1jphy8ZebEk+3am+7OpwWxjjZsK4pygEARA3WPfUH4xng9A
   ZakoV9znJ3xU473zgHw8CeThGBPspD3lurWuw3DUlsZhi8kMiT6UG18WL
   WYYj9Lsxa4VtWFxQbp9GvCCAVQko5Tmkvyus4Es5VfKqsjkkRFNw8ktqo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="288368079"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="288368079"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 02:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="738406526"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="738406526"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2022 02:25:21 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooi5g-000As9-2B;
        Sat, 29 Oct 2022 09:25:20 +0000
Date:   Sat, 29 Oct 2022 17:24:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:tmp-gpiolib-of-quirks] BUILD SUCCESS
 0241d679cd1ae0dd5fc76ebacec9f0929036b7bf
Message-ID: <635cf14d.xPtIH/hPSH345XW5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tmp-gpiolib-of-quirks
branch HEAD: 0241d679cd1ae0dd5fc76ebacec9f0929036b7bf  ASoC: tlv320aic32x4: switch to using gpiod API

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20221028
arc                                 defconfig
alpha                               defconfig
x86_64                               rhel-8.3
riscv                randconfig-r042-20221028
m68k                             allmodconfig
s390                 randconfig-r044-20221028
alpha                            allyesconfig
arc                              allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
s390                             allmodconfig
m68k                             allyesconfig
arm                                 defconfig
s390                                defconfig
x86_64                        randconfig-a002
x86_64                           allyesconfig
i386                                defconfig
mips                             allyesconfig
x86_64                        randconfig-a006
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
s390                             allyesconfig
ia64                             allmodconfig
i386                          randconfig-a014
i386                          randconfig-a001
x86_64                        randconfig-a013
i386                          randconfig-a003
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a015
arm64                            allyesconfig
i386                          randconfig-a005
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
