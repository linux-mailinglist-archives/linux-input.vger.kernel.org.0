Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABFC591A0A
	for <lists+linux-input@lfdr.de>; Sat, 13 Aug 2022 13:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239404AbiHMLqU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Aug 2022 07:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiHMLqT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Aug 2022 07:46:19 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D8F1D32F
        for <linux-input@vger.kernel.org>; Sat, 13 Aug 2022 04:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660391178; x=1691927178;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hLrNjxs59hJUwjWJAXrQ1CCZA+kup+p8CljhzP9K4wM=;
  b=HTFeX6jsI0uCX6bx/OWUCju9+qT0StmowwWp6hFWd9WsfxXesM+XvgfK
   BBphBd+xie1uZPxU9Sce4UtZQKWRUSpdtoEbEEBgdZ2AQNOIh4LGjOOSQ
   Ht6yEGF3SiviaNaIkzZg/YfPUB1kp/RRzPuPid7816Dils55zK9sOJgrj
   6jocwHw03IaKPIVmNuYS8ZW3a7APKbciejQi41GBrPPKBe9am/o0dcvcF
   WKk+YwiapteqbD2U6b5NH939XMBbayTLWaKmdpYGXLTjwQSh21TXcHWF8
   TCNybn2jMQsS18ku1NQvmTUCKbCIMYvUH7eoIBCFBrovvYm8L8GUVaKz3
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="293017082"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="293017082"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 04:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="639171020"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Aug 2022 04:46:17 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oMpaq-0001dH-1m;
        Sat, 13 Aug 2022 11:46:16 +0000
Date:   Sat, 13 Aug 2022 19:45:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 8bd5d27d426b560755b5c99a9a495384987f0955
Message-ID: <62f78ecf.Hm3mH6DDU3hqn1Cy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 8bd5d27d426b560755b5c99a9a495384987f0955  Input: Add IBM Operation Panel driver

elapsed time: 720m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
s390                 randconfig-r044-20220812
arc                  randconfig-r043-20220812
um                           x86_64_defconfig
riscv                randconfig-r042-20220812
i386                                defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a006
x86_64                        randconfig-a015
x86_64                        randconfig-a004
x86_64                           rhel-8.3-syz
i386                             allyesconfig
i386                          randconfig-a016
i386                          randconfig-a005
m68k                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
arm                                 defconfig
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
powerpc                           allnoconfig
alpha                            allyesconfig
i386                          randconfig-a012
m68k                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a014
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                        dreamcast_defconfig
parisc                           alldefconfig
parisc                              defconfig
powerpc                 mpc834x_mds_defconfig

clang tested configs:
hexagon              randconfig-r041-20220812
hexagon              randconfig-r045-20220812
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a016
i386                          randconfig-a002
x86_64                        randconfig-a014
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
