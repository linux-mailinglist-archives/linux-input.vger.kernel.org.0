Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D83361933A
	for <lists+linux-input@lfdr.de>; Fri,  4 Nov 2022 10:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiKDJPN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Nov 2022 05:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiKDJPM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Nov 2022 05:15:12 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA0DAE3E
        for <linux-input@vger.kernel.org>; Fri,  4 Nov 2022 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667553310; x=1699089310;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u0G/cBdEOm6FYMPl48vOXt2hyW1F/eLdS9Rmv41sGvU=;
  b=A1+l/rkyMR0T7FXfkaqq3QsZdHOIL86BqBQXEeP0V8JxTmyPZkDu0Qxd
   SKa+YSVfnbL/st5/1N/Qay4IPfL9GB4Ul1rM1onRajOqF12ynO9rr2GXR
   C3cMvwD2kpOnxCsc4XduRCZJShK1aWh6VRYymNx/otXvhpZqgEXASC5ZK
   nV6B3VKdhR+H62k6c+KuiyKkM4eRkXU4Quf7LYVkbCRzLWcF4mzxsvDw/
   QlCjMJ1c7YCoRScRANs85+E9UWU1/qlb2Q8HOIY0LNk+ZC9kOqkG1Zf9d
   c5+toqNTQTmR7lN6LAOA7Fcbqocj67mbbN1VgmU0xJJ+xF/O6nF/dQVq6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="290312177"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="290312177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 02:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="586127913"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="586127913"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Nov 2022 02:15:07 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oqsn5-000GpL-0E;
        Fri, 04 Nov 2022 09:15:07 +0000
Date:   Fri, 04 Nov 2022 17:14:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 153a197077d33861744be5a2d4bd17cec2c2dca3
Message-ID: <6364d7e0.XfnCuNU8JTjgCb+k%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 153a197077d33861744be5a2d4bd17cec2c2dca3  dt-bindings: input: sun4i-lradc-keys: Add F1C100s compatible

elapsed time: 724m

configs tested: 78
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
x86_64                          rhel-8.3-func
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a004
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a006
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                  randconfig-r043-20221102
i386                                defconfig
riscv                randconfig-r042-20221102
x86_64                        randconfig-a002
x86_64                              defconfig
i386                          randconfig-a016
x86_64                        randconfig-a013
s390                 randconfig-r044-20221102
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arc                  randconfig-r043-20221103
i386                          randconfig-a012
i386                          randconfig-a014
x86_64                           allyesconfig
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
riscv                randconfig-r042-20221104
arc                  randconfig-r043-20221104
s390                 randconfig-r044-20221104
powerpc                     taishan_defconfig
xtensa                  cadence_csp_defconfig
m68k                        m5307c3_defconfig
xtensa                         virt_defconfig
m68k                           sun3_defconfig
arm                        keystone_defconfig
arm                        spear6xx_defconfig
m68k                                defconfig

clang tested configs:
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
hexagon              randconfig-r041-20221102
i386                          randconfig-a006
x86_64                        randconfig-a001
i386                          randconfig-a015
i386                          randconfig-a004
hexagon              randconfig-r045-20221102
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221103
hexagon              randconfig-r041-20221103
riscv                randconfig-r042-20221103
i386                          randconfig-a013
s390                 randconfig-r044-20221103
i386                          randconfig-a011
mips                       rbtx49xx_defconfig
arm                       cns3420vb_defconfig
arm                     am200epdkit_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
