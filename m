Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D38BB612C21
	for <lists+linux-input@lfdr.de>; Sun, 30 Oct 2022 19:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiJ3SCl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Oct 2022 14:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ3SCk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Oct 2022 14:02:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A0318C
        for <linux-input@vger.kernel.org>; Sun, 30 Oct 2022 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667152960; x=1698688960;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mUFuemb2yCIrRUFZf+LAr91CbI4K43raKJAAl0abA58=;
  b=LGd48H1apqYlFhxM/DQo5Wddhm40BTLQjNnVj7OIvHEAEOBMcbFj1l6f
   vYoJBVfRyhOJLZHNIG3Z4sYQh6bxdh1l3yNEr2rSGwnApK1ZCUNmK5cib
   McMKSSIW0/mXz+3X0hMaLKvebwGVzGdTmnuslcW0M5/mScp5q4ocwRzi0
   m6Anjlna0ZifcQ7Yigie6Ixa25ROB4mQDaLw2WOk18JrnAumXXGBuaREc
   SCp05FqsfWoN46jy9kYG7u2CuEvuMUzasG9SnZRDSmGL+AvmuI0IhV8vC
   m7FAuJwyyoniVOngNBhbW1kj9rdwgJhvBsmJJg2d3onjMGOTmiR8OVq9r
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="308766648"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="308766648"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 11:02:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="611269963"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="611269963"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Oct 2022 11:02:38 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1opCdp-000CFQ-2C;
        Sun, 30 Oct 2022 18:02:37 +0000
Date:   Mon, 31 Oct 2022 02:02:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 66603243f5283f7f28c795f09e7c2167233df0bd
Message-ID: <635ebc32.R+DfVnnYOcu/jXw8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 66603243f5283f7f28c795f09e7c2167233df0bd  Input: add driver for Hynitron cstxxx touchscreens

elapsed time: 725m

configs tested: 77
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
x86_64                              defconfig
arc                  randconfig-r043-20221030
i386                                defconfig
i386                          randconfig-a016
m68k                             allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                               rhel-8.3
ia64                             allmodconfig
arm                                 defconfig
x86_64                           rhel-8.3-syz
s390                                defconfig
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
x86_64                        randconfig-a011
i386                          randconfig-a005
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
alpha                            allyesconfig
x86_64                           allyesconfig
mips                             allyesconfig
x86_64                        randconfig-a006
x86_64                          rhel-8.3-func
i386                          randconfig-a001
x86_64                        randconfig-a004
powerpc                           allnoconfig
i386                          randconfig-a014
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a003
i386                             allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a013
i386                          randconfig-a012
s390                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                            hisi_defconfig
powerpc                      ep88xc_defconfig
csky                             alldefconfig
powerpc              randconfig-c003-20221030
i386                          randconfig-c001
arm                            lart_defconfig
powerpc                      ppc6xx_defconfig
loongarch                 loongson3_defconfig
arm                         at91_dt_defconfig

clang tested configs:
hexagon              randconfig-r041-20221030
s390                 randconfig-r044-20221030
riscv                randconfig-r042-20221030
hexagon              randconfig-r045-20221030
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
x86_64                        randconfig-a001
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a013
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a006
powerpc                     skiroot_defconfig
mips                           rs90_defconfig
arm                         orion5x_defconfig
mips                   sb1250_swarm_defconfig
powerpc                     powernv_defconfig
x86_64                        randconfig-k001
powerpc                          g5_defconfig
arm                         palmz72_defconfig
mips                malta_qemu_32r6_defconfig
arm                       aspeed_g4_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
