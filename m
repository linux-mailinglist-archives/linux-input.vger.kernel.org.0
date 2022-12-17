Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3F364F8E3
	for <lists+linux-input@lfdr.de>; Sat, 17 Dec 2022 13:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiLQMBA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Dec 2022 07:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLQMA7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Dec 2022 07:00:59 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD1B20B
        for <linux-input@vger.kernel.org>; Sat, 17 Dec 2022 04:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671278458; x=1702814458;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4HIydv8/kewLyopOd+iZkhQ9ZyXDySqsbLNuyTCkb6g=;
  b=EmKGk2Wg2gy4jOBAZxFDEzp1urnuENu3gmmTL0LMhA7uxhWc03qtMLJT
   dHyT9pI76752VyH8CW06xBeKKPGYxgtzJUmT+o2azHXX9LzNWGvAtL+rJ
   IJR+c22BITZonQSDpC220WfsK/ANWEII8uGp8l3guQvhE7JY4JaBJRNSu
   Biwf3ZocOXn6vSqSkieO5UrI1uQn3nEdngplkLavHB/M/d/FhEx4Hvd+M
   /nsRTLM+C4hJFDWM7hEQh0qgPZ+rz/grbLpWyI69F9A0zl27mZDUxW192
   /N0z9Y3REiNPRHldCtl4Z8tUXUnQje2Mj5d/TN60zRtcI4Wx0FN5wkUjP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="405376378"
X-IronPort-AV: E=Sophos;i="5.96,252,1665471600"; 
   d="scan'208";a="405376378"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2022 04:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="774418784"
X-IronPort-AV: E=Sophos;i="5.96,252,1665471600"; 
   d="scan'208";a="774418784"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2022 04:00:55 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p6Vs7-0007k6-37;
        Sat, 17 Dec 2022 12:00:55 +0000
Date:   Sat, 17 Dec 2022 19:59:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 3c44e2b6cde674797b76e76d3a903a63ce8a18bb
Message-ID: <639daf3b.svAym4hkYWJF3YDL%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 3c44e2b6cde674797b76e76d3a903a63ce8a18bb  Revert "Input: synaptics - switch touchpad on HP Laptop 15-da3001TU to RMI mode"

elapsed time: 794m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
arc                                 defconfig
x86_64                        randconfig-a004
x86_64                              defconfig
x86_64                        randconfig-a002
alpha                               defconfig
m68k                             allyesconfig
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a006
m68k                             allmodconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
i386                                defconfig
x86_64                        randconfig-a013
x86_64                           allyesconfig
x86_64                        randconfig-a011
mips                             allyesconfig
arm                                 defconfig
alpha                            allyesconfig
x86_64                        randconfig-a015
arm64                            allyesconfig
riscv                randconfig-r042-20221216
arm                              allyesconfig
ia64                             allmodconfig
i386                          randconfig-a001
i386                          randconfig-a012
i386                          randconfig-a003
arc                  randconfig-r043-20221216
i386                          randconfig-a005
i386                          randconfig-a016
s390                 randconfig-r044-20221216
i386                          randconfig-a014
i386                             allyesconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
x86_64                            allnoconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
i386                          randconfig-c001
mips                     decstation_defconfig
sh                           se7343_defconfig
sh                          rsk7203_defconfig
arm                         at91_dt_defconfig
powerpc                      cm5200_defconfig
powerpc                          allmodconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a016
x86_64                        randconfig-a012
arm                  randconfig-r046-20221216
i386                          randconfig-a013
hexagon              randconfig-r041-20221216
i386                          randconfig-a011
hexagon              randconfig-r045-20221216
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-k001
mips                      pic32mzda_defconfig
powerpc                 mpc836x_rdk_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
