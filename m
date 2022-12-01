Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55ED463F85E
	for <lists+linux-input@lfdr.de>; Thu,  1 Dec 2022 20:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbiLATeU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Dec 2022 14:34:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiLATeA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Dec 2022 14:34:00 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAF01F2C5
        for <linux-input@vger.kernel.org>; Thu,  1 Dec 2022 11:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669923162; x=1701459162;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qin6B2XGjLffFCDLc7/32+sipbD91NurpLQxq5XgykA=;
  b=Gfe6rZndtEr/vF0/fYqDY9KeyZkHMa+JnNGqvPUfvexCTuXQ2R7/73lm
   v1JCKMGvVlAB4Qhs5DL/1CoQ4wF7MfUv1gp/C4bgK4BS5MlY+Y7ut5gxF
   0/C1eeOZVTxV1d5cx9S14Vt3K7gc915E+wunISciDDZL0NI6FbgD2WvfL
   3LFqVeMP/NF2bhHdOUaj4ZDThbf1CweSOhADZUlGWcw0K79LJ83GcZbxZ
   giH4c3ltEH6qgQ/NysqxFh0YV+59k74Lxw691utbTg6YLhpf2vHZmiZU0
   oDMETYSbS1QaIJPYainYxDg3C/9Mb1In9gMS+4Tz3zNEYSH2SG2SL1FV4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377938241"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="377938241"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2022 11:32:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="644761774"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="644761774"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Dec 2022 11:32:39 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0pIU-000CqN-2h;
        Thu, 01 Dec 2022 19:32:38 +0000
Date:   Fri, 02 Dec 2022 03:32:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 a5df8025f37a813f3f512ea3048ca505561b9c27
Message-ID: <6389013b.goFmsDWP3/oVwpzq%lkp@intel.com>
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
branch HEAD: a5df8025f37a813f3f512ea3048ca505561b9c27  Input: msg2638 - only read linux,keycodes array if necessary

elapsed time: 1142m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                            allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
arm                                 defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arc                        nsim_700_defconfig
arm                           h3600_defconfig
i386                             allyesconfig
m68k                          hp300_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                       common_defconfig
i386                          randconfig-c001
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
arc                  randconfig-r043-20221201
riscv                randconfig-r042-20221201
s390                 randconfig-r044-20221201
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
s390                 randconfig-r044-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r045-20221128
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
