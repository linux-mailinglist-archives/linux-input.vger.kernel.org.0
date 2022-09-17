Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC5A5BB784
	for <lists+linux-input@lfdr.de>; Sat, 17 Sep 2022 11:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiIQJWz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Sep 2022 05:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiIQJWx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Sep 2022 05:22:53 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE2132077
        for <linux-input@vger.kernel.org>; Sat, 17 Sep 2022 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663406572; x=1694942572;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=06KBMskZ1GXm1/TxKr1qEvtxzXLoHfaSxVl2SO5szl0=;
  b=cwNDsTMsiuzJ0dXoVtvWyh57Wixcsx5hXMYHPe37eyBNB9QF680ax2H8
   uxwOgXXN1V6UOIHRSvLn4ZzwAu++11wCBpVyvYd4PvCez0qhUD5rm1kHk
   CI8+hJFMFsBeurHvZk2s907JnO7SRelkjhRmDp/3ERAYSH17YJDTPDkig
   QchksT4eHEZPdzR/yxzKRT2xaIqWzdqXb8VvAs8CKAmZcaPQoXM5c7Y3v
   IMvUeZkMuD5uNtyHdqP4VVe+mqzpqtNn7SCpzwczmBb2njkonCRRL/a/s
   gfbQVFYxlSlGAQ+6JYQREbdBBU9i4+96PSm3YJVWSkJiW3cZQ62eWfPBX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="279523457"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="279523457"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 02:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="648537034"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Sep 2022 02:22:51 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oZU2E-0000C7-21;
        Sat, 17 Sep 2022 09:22:50 +0000
Date:   Sat, 17 Sep 2022 17:21:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 437d49b051e8ca80d2ffa8f3fd98ce58755c2758
Message-ID: <632591af.ZZuUJDhfGlLB0VE0%lkp@intel.com>
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
branch HEAD: 437d49b051e8ca80d2ffa8f3fd98ce58755c2758  dt-bindings: input: auo-pixcir-ts: fix gpio and interrupt properties

elapsed time: 726m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220916
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
alpha                            allyesconfig
i386                                defconfig
arc                              allyesconfig
powerpc                           allnoconfig
m68k                             allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
i386                          randconfig-a001
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                               rhel-8.3
x86_64                        randconfig-a002
x86_64                           allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
i386                          randconfig-a016
i386                             allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a014
x86_64                        randconfig-a013
i386                          randconfig-a012
x86_64                        randconfig-a015
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
sparc                               defconfig
powerpc                      pasemi_defconfig
mips                 decstation_r4k_defconfig
powerpc                  storcenter_defconfig
arm                            mps2_defconfig
ia64                             allmodconfig
sh                          polaris_defconfig
arm                           sama5_defconfig
sh                           se7722_defconfig
csky                             alldefconfig
powerpc                     tqm8548_defconfig
m68k                        m5307c3_defconfig
sh                          lboxre2_defconfig
arm                       aspeed_g5_defconfig
arm                           h3600_defconfig
openrisc                    or1ksim_defconfig
arm                            hisi_defconfig
sparc                       sparc64_defconfig
xtensa                    xip_kc705_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
arm                           imxrt_defconfig
sh                            titan_defconfig
m68k                       m5275evb_defconfig
powerpc                   motionpro_defconfig

clang tested configs:
hexagon              randconfig-r041-20220916
riscv                randconfig-r042-20220916
hexagon              randconfig-r045-20220916
s390                 randconfig-r044-20220916
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a003
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a016
x86_64                        randconfig-a014
mips                       rbtx49xx_defconfig
arm                         mv78xx0_defconfig
x86_64                        randconfig-k001
arm                       aspeed_g4_defconfig
i386                             allyesconfig
arm                       cns3420vb_defconfig
arm                           spitz_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
