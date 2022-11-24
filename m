Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024B3636EE6
	for <lists+linux-input@lfdr.de>; Thu, 24 Nov 2022 01:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiKXAW3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Nov 2022 19:22:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiKXAW2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Nov 2022 19:22:28 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D7C58BC7
        for <linux-input@vger.kernel.org>; Wed, 23 Nov 2022 16:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669249346; x=1700785346;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X3DQYdb3onx0TmGBRoql8+rLHgBXPvme+wwcJ24X3Lk=;
  b=muaU0XWKn7FjygSrSlm10xKudVZT50oqJXWubDa1E1JlGb1CDhJ0OPeV
   pm7WOGXjutaT9g+4JdZgsmvpndtPszpnpmXTg3AmhC9XVnrsNKaf46Het
   2bw46ocM9owj44b3iidHg531yeIqbIl3h4kqwZkirsOZha6QNc0JJjIGm
   CktkZQCnZ+V/8TJsSQNvo0DAMuKtWYUEjhOWrrOylEYaV4PRzpqL0iMzD
   VwbPJ38nFn1R444hug3pD3kvBybJ3EuyKJs3OLzuQHY4xlVU8FQeTS6d7
   AQDM3QrHX5wU4e+hx8tS/K5Ogg8EHM6ZOKIkVhK79mCkchmL04cQNgFjB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="376329164"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="376329164"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 16:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="642052710"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="642052710"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 16:19:42 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxzxt-0003F3-2D;
        Thu, 24 Nov 2022 00:19:41 +0000
Date:   Thu, 24 Nov 2022 08:19:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 9f4211bf7f811b653aa6acfb9aea38222436a458
Message-ID: <637eb87a.i5i4R0BeI/RrvYOE%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 9f4211bf7f811b653aa6acfb9aea38222436a458  HID: add mapping for camera access keys

elapsed time: 1293m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
mips                             allyesconfig
arc                                 defconfig
powerpc                           allnoconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
i386                 randconfig-a016-20221121
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                 randconfig-a011-20221121
x86_64                        randconfig-a002
i386                 randconfig-a012-20221121
i386                 randconfig-a014-20221121
i386                 randconfig-a013-20221121
x86_64               randconfig-a012-20221121
m68k                             allyesconfig
x86_64               randconfig-a011-20221121
i386                 randconfig-a015-20221121
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64               randconfig-a015-20221121
x86_64               randconfig-a013-20221121
x86_64                        randconfig-a004
x86_64               randconfig-a014-20221121
x86_64                               rhel-8.3
x86_64               randconfig-a016-20221121
x86_64                              defconfig
x86_64                           allyesconfig
i386                                defconfig
riscv                randconfig-r042-20221121
arc                  randconfig-r043-20221121
arc                  randconfig-r043-20221122
s390                 randconfig-r044-20221121
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64               randconfig-a001-20221121
i386                 randconfig-a001-20221121
i386                 randconfig-a003-20221121
x86_64               randconfig-a003-20221121
x86_64                        randconfig-a005
i386                 randconfig-a002-20221121
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64               randconfig-a002-20221121
i386                 randconfig-a006-20221121
i386                 randconfig-a004-20221121
x86_64                        randconfig-a003
x86_64               randconfig-a005-20221121
x86_64               randconfig-a006-20221121
i386                 randconfig-a005-20221121
x86_64               randconfig-a004-20221121
hexagon              randconfig-r041-20221122
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221121
hexagon              randconfig-r045-20221122
s390                 randconfig-r044-20221122
riscv                randconfig-r042-20221122

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
