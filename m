Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB085B47E5
	for <lists+linux-input@lfdr.de>; Sat, 10 Sep 2022 20:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiIJSUV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 14:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiIJSUS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 14:20:18 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66551AD88
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 11:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662834016; x=1694370016;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sar5JNIsmR9HzweIdVHpYRRMB3GDTFdCY87Tt4YbuMg=;
  b=Pa4U/vSu15C0C1/i+FuKJ3mVUwts4xYZpmsHqklbj8JA5EywOb5VpLNo
   k4pFT96KxPsyUSirYiTeTTbes/QvraKWxz7MuiElTghw2dQBGThh4JX3R
   npjOXsBuGrvcDwwSvb1e3jlNtkh7s4tdWxyoSsVlTgcagCPjQMCAARpJv
   9BUX83wXa4Hs43xM+IrxnUJA81w+4NCL/7tIAI+ITc4B84+fP1UF+8Rep
   7h1v/xBTLsI7+fUnE+TOSwBVotopjSbqlr1F0HhhGSPCf6ns229U82CaW
   INauoq+QxES20oweL7EaSKwl/nRriK3jwC5kKHAxaN6ZTVn7T1mIeK2zC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="280683731"
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="280683731"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 11:20:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="592993326"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Sep 2022 11:20:14 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oX55S-0000MM-04;
        Sat, 10 Sep 2022 18:20:14 +0000
Date:   Sun, 11 Sep 2022 02:20:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:tmp-gpiolib-of-quirks] BUILD SUCCESS
 063e18ac945d4e6f2e7baa061a9a0b7c9f550d35
Message-ID: <631cd551.e8UVO2uUmY/z3/ZB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tmp-gpiolib-of-quirks
branch HEAD: 063e18ac945d4e6f2e7baa061a9a0b7c9f550d35  gpiolib: of: factor out conversion from OF flags

elapsed time: 726m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                                defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
powerpc                           allnoconfig
m68k                             allmodconfig
x86_64                              defconfig
m68k                             allyesconfig
x86_64                        randconfig-a015
i386                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
i386                          randconfig-a016
i386                          randconfig-a001
x86_64                        randconfig-a004
arm                                 defconfig
i386                          randconfig-a003
x86_64                          rhel-8.3-func
x86_64                        randconfig-a002
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20220909
arc                  randconfig-r043-20220907
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a003
s390                 randconfig-r044-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r041-20220909
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220909
riscv                randconfig-r042-20220909
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220909

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
