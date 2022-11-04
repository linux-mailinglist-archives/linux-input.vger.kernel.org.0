Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8538461A29F
	for <lists+linux-input@lfdr.de>; Fri,  4 Nov 2022 21:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiKDUnu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Nov 2022 16:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiKDUno (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Nov 2022 16:43:44 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C9A30F7F
        for <linux-input@vger.kernel.org>; Fri,  4 Nov 2022 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667594622; x=1699130622;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7UpJm1MEUknXoSKmSJgBckae8G+imN/fvYULvQe80KM=;
  b=fR48XOg+5zGCHK38teHXWK+S0/AGnxBGLB5SlGXIm9QSU6LsTVYJjCRj
   5KkuQHXx6udq9ogHsiaricyL2TJIcO/kVk8PcCliWSQ9wE/rIoBwDDFYu
   5BZqjdqRjmYbdKZCoSWMDlskLQyFxxIGYcr+mdg7Ja/BLXbeuYyRx/tt3
   e6LD9CtQbtoBx/rx9ElMUP9uvGG9ZcBlKjJwfIOX49R6UGWS0Z9NioPPV
   /PunSPwARS33ZDtc5E134xEYXGfSBtqLh9Pm+B4JZIeCPmPpkI62b3i0R
   0P/w/nAuCDp7iV/qsLH90qBVgZ/qKDBQSofwytVWP4oOMFn8MOOglHmbA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="311818903"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="311818903"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 13:43:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="613197489"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="613197489"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Nov 2022 13:43:39 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1or3XP-000HJt-0f;
        Fri, 04 Nov 2022 20:43:39 +0000
Date:   Sat, 05 Nov 2022 04:42:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:tmp-gpiolib] BUILD SUCCESS
 dc04f5ab1b1114aa19b9026f816fc01ca9c9941d
Message-ID: <63657951.13aukMKeV7nhTqgl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tmp-gpiolib
branch HEAD: dc04f5ab1b1114aa19b9026f816fc01ca9c9941d  gpiolib: of: remove [devm_]gpiod_get_from_of_node() APIs

elapsed time: 811m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
ia64                             allmodconfig
x86_64                              defconfig
arc                  randconfig-r043-20221104
x86_64                        randconfig-a015
arc                                 defconfig
riscv                randconfig-r042-20221104
i386                                defconfig
x86_64                        randconfig-a013
s390                 randconfig-r044-20221104
s390                             allmodconfig
alpha                               defconfig
i386                          randconfig-a001
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a011
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
i386                          randconfig-a003
s390                             allyesconfig
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
mips                             allyesconfig
i386                          randconfig-a016
m68k                             allyesconfig
i386                          randconfig-a005
arc                              allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
arm                                 defconfig
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
m68k                             allmodconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r041-20221104
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221104
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a011
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
