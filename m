Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735DA5886DA
	for <lists+linux-input@lfdr.de>; Wed,  3 Aug 2022 07:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbiHCFmx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Aug 2022 01:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233757AbiHCFmx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Aug 2022 01:42:53 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617D14333C
        for <linux-input@vger.kernel.org>; Tue,  2 Aug 2022 22:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659505372; x=1691041372;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DyCazbpSM+3SfopOJD4dvOF5IzcXCyzzJ+AgtGem9Zo=;
  b=DMNTh7WOFpfcMsmtzDodW5a35JCI3ByFWwx75AdK/fwYkIv4rpBc7hm8
   YTW0IribjoCx4qurZgPqoubLThQJJlrewTRhRq0e1hQJDaZ/MhotPXnpb
   DlsCQkGeqKz+NjmepjAwXUEbRPAFxZAaP95YM4xPTgRjGD9b57DoUa6qA
   DZzVAUg9qqmYETRQGUC2BeVpKXAGsnUzWIwkeGRg5jRRrt7HillYqHfal
   akxWq5AjEdP+7pk5woiJVvmOWdGMwEbtdyJ+PWY3dqznvexSnX2B68Oo/
   WipMDOW0Cr/PXsVxV/1pPT1bF1+5ty1sclhEe5I0Ot7BbzaGZobemcQNd
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="290362893"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="290362893"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 22:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="631009220"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 22:42:50 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oJ79e-000Gsl-0q;
        Wed, 03 Aug 2022 05:42:50 +0000
Date:   Wed, 03 Aug 2022 13:42:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 8bb5e7f4dcd9b9ef22a3ea25c9066a8a968f12dd
Message-ID: <62ea0ad3.r635YZPiO7OwWmiT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 8bb5e7f4dcd9b9ef22a3ea25c9066a8a968f12dd  Merge branch 'next' into for-linus

elapsed time: 706m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64               randconfig-a011-20220801
x86_64               randconfig-a012-20220801
arc                  randconfig-r043-20220801
sh                               allmodconfig
i386                                defconfig
arm                                 defconfig
m68k                             allmodconfig
x86_64               randconfig-a013-20220801
x86_64               randconfig-a016-20220801
x86_64               randconfig-a014-20220801
arc                              allyesconfig
x86_64               randconfig-a015-20220801
i386                             allyesconfig
s390                 randconfig-r044-20220801
alpha                            allyesconfig
riscv                randconfig-r042-20220801
m68k                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                 randconfig-a016-20220801
i386                 randconfig-a013-20220801
i386                 randconfig-a015-20220801
i386                 randconfig-a012-20220801
i386                 randconfig-a011-20220801
i386                 randconfig-a014-20220801
xtensa                         virt_defconfig
powerpc                      makalu_defconfig
m68k                          atari_defconfig
arc                      axs103_smp_defconfig
x86_64               randconfig-k001-20220801
i386                 randconfig-c001-20220801
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
loongarch                           defconfig
loongarch                         allnoconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                       omap2plus_defconfig
sh                         apsh4a3a_defconfig
nios2                         3c120_defconfig

clang tested configs:
x86_64               randconfig-a002-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a003-20220801
x86_64               randconfig-a005-20220801
hexagon              randconfig-r045-20220801
hexagon              randconfig-r041-20220801
i386                 randconfig-a001-20220801
x86_64               randconfig-a006-20220801
i386                 randconfig-a002-20220801
x86_64               randconfig-a004-20220801
i386                 randconfig-a003-20220801
i386                 randconfig-a005-20220801
i386                 randconfig-a004-20220801
i386                 randconfig-a006-20220801
arm                   milbeaut_m10v_defconfig
powerpc                      obs600_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                    gamecube_defconfig
s390                             alldefconfig
arm                         mv78xx0_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
