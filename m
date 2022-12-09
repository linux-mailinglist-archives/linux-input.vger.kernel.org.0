Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9707B6488FA
	for <lists+linux-input@lfdr.de>; Fri,  9 Dec 2022 20:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiLITbX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Dec 2022 14:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiLITbW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Dec 2022 14:31:22 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E35BAC6DF
        for <linux-input@vger.kernel.org>; Fri,  9 Dec 2022 11:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670614281; x=1702150281;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E39n+Ljh+UwyfJySplcTkORqP4/innbMNWWe+gfpKt8=;
  b=Y0cPtwqHwtKKpqB5NsuQoWvkqV8B/ZzGNCMQkzZJpQh2ZIbneHYuL+lv
   vXQ0seTqwiZZ/utObDwbV8uWMFYmNP8IcLkPnU1J052utfh1/5DaIsmLb
   zqq8UqRcwFA74fQxPpAz9AzNJR0Oqyr9SMl8qzop4GJ/4ovBNJqQngFVd
   YfHFBZleieFDgxguYhKv1h+7VyOq64JKybWiemJ9RNz1pcdLHOKYviK3j
   YsAuD62AfLG6CzlnWLz7XkFS0h/rS4ps8ZlCJ9urFQ82++zOLY5HeyN6Z
   2E9vYR1y+ZdD/dCezWTHUhikmlBOBfxCovE6oFQDCSorFcYFh9fwn/Pt1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="317561557"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="317561557"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 11:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="754147539"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="754147539"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2022 11:31:19 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p3j5b-00022l-0y;
        Fri, 09 Dec 2022 19:31:19 +0000
Date:   Sat, 10 Dec 2022 03:31:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 c3991107a28a5ad0bd90660ca3bbf8c2c220ea98
Message-ID: <63938cfc.KrIZ45GebRVuPafN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: c3991107a28a5ad0bd90660ca3bbf8c2c220ea98  Input: elants_i2c - delay longer with reset asserted

elapsed time: 1016m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
powerpc                           allnoconfig
s390                             allyesconfig
x86_64                          rhel-8.3-rust
arc                  randconfig-r043-20221207
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20221207
sh                               allmodconfig
x86_64                        randconfig-a002
s390                 randconfig-r044-20221207
x86_64                           allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
mips                             allyesconfig
x86_64                        randconfig-a013
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64                        randconfig-a011
i386                                defconfig
i386                          randconfig-a001
x86_64                        randconfig-a015
i386                          randconfig-a003
i386                          randconfig-a005
arm                  randconfig-r046-20221208
arc                  randconfig-r043-20221208
alpha                            allyesconfig
arm                                 defconfig
arc                              allyesconfig
i386                          randconfig-a016
i386                          randconfig-a014
m68k                             allyesconfig
i386                          randconfig-a012
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
x86_64                            allnoconfig
arm                            lart_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      cm5200_defconfig
arm                        oxnas_v6_defconfig
x86_64                           rhel-8.3-bpf
i386                          randconfig-c001
arm                            zeus_defconfig
nios2                         3c120_defconfig
m68k                             allmodconfig
arc                  randconfig-r043-20221209
riscv                randconfig-r042-20221209
s390                 randconfig-r044-20221209
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                  randconfig-c002-20221209
x86_64                        randconfig-c001
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a002
hexagon              randconfig-r045-20221208
hexagon              randconfig-r041-20221208
riscv                randconfig-r042-20221208
i386                          randconfig-a004
i386                          randconfig-a006
s390                 randconfig-r044-20221208
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
arm                           sama7_defconfig
powerpc                   microwatt_defconfig
powerpc                      ppc44x_defconfig
arm                       mainstone_defconfig
mips                          rm200_defconfig
powerpc                  mpc885_ads_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
