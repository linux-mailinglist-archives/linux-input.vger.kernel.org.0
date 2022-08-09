Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83B4958D605
	for <lists+linux-input@lfdr.de>; Tue,  9 Aug 2022 11:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbiHIJLs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Aug 2022 05:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiHIJLr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Aug 2022 05:11:47 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0361BD5D
        for <linux-input@vger.kernel.org>; Tue,  9 Aug 2022 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660036307; x=1691572307;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nd5AM+j6mOeETERYxP75oqMkBrL0zUZw2DXqJbUUwRo=;
  b=UHC8ATq3ySOfyl/SlV5URonedhiEq7tcpiOvtBoK1Xt6cngTFbv3hNdM
   5zLcK9K2ID0eoHzmjCtk2otEG5G8oGgY/+8POpggn6QWRRvjRmCcI9QNH
   1/gc1B2UHP4yYTRlJwpeJkBPT1jQxjI2Zg73IBp5nS5vqR2/yKlPtYnGK
   pUHQhtXXA4uoEffW6vYPgJ9HQs3lXmiogSawaRMTZe/H6Nr72AP9KsIf9
   kZaUuRSpq2ZRgMmTNCOP/r0S6A8SO6GXpfbYDgO0INPJe2rF2V1O9y+Gz
   ar230u2LgsCteBATrn0jCCJzqOYbTGXXss4RycMbLyIRcoZFiL2LU2U/v
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="291579279"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="291579279"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 02:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="637645624"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Aug 2022 02:11:45 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oLLH6-000MsP-2H;
        Tue, 09 Aug 2022 09:11:44 +0000
Date:   Tue, 09 Aug 2022 17:11:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 938db76cf8c8d2bd7c56aca74bef68d443e76954
Message-ID: <62f224c4.keqTwcCl0/Stfwmp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 938db76cf8c8d2bd7c56aca74bef68d443e76954  Input: elan_i2c - convert to use dev_groups

elapsed time: 710m

configs tested: 76
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a002-20220808
x86_64                           rhel-8.3-syz
arm                                 defconfig
i386                 randconfig-a003-20220808
x86_64                          rhel-8.3-func
i386                 randconfig-a004-20220808
m68k                             allmodconfig
x86_64                              defconfig
x86_64               randconfig-a003-20220808
x86_64               randconfig-a006-20220808
powerpc                           allnoconfig
i386                 randconfig-a006-20220808
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a001-20220808
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
x86_64               randconfig-a002-20220808
arc                  randconfig-r043-20220808
m68k                             allyesconfig
i386                                defconfig
x86_64               randconfig-a005-20220808
i386                 randconfig-a005-20220808
x86_64                               rhel-8.3
sh                               allmodconfig
i386                             allyesconfig
x86_64               randconfig-a001-20220808
x86_64                           allyesconfig
x86_64               randconfig-a004-20220808
mips                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                             ezx_defconfig
powerpc                 mpc837x_rdb_defconfig
arc                         haps_hs_defconfig
nios2                            alldefconfig
m68k                          hp300_defconfig
csky                                defconfig
ia64                             alldefconfig
m68k                       m5275evb_defconfig
powerpc                        cell_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
sh                          rsk7203_defconfig
riscv                    nommu_k210_defconfig
powerpc                       holly_defconfig
i386                 randconfig-c001-20220808

clang tested configs:
hexagon              randconfig-r045-20220808
s390                 randconfig-r044-20220808
x86_64               randconfig-a013-20220808
x86_64               randconfig-a015-20220808
hexagon              randconfig-r041-20220808
i386                 randconfig-a016-20220808
riscv                randconfig-r042-20220808
x86_64               randconfig-a016-20220808
x86_64               randconfig-a012-20220808
x86_64               randconfig-a011-20220808
x86_64               randconfig-a014-20220808
i386                 randconfig-a013-20220808
i386                 randconfig-a012-20220808
i386                 randconfig-a014-20220808
i386                 randconfig-a011-20220808
i386                 randconfig-a015-20220808
mips                          malta_defconfig
arm                       mainstone_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                   lite5200b_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
