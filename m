Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB15756A133
	for <lists+linux-input@lfdr.de>; Thu,  7 Jul 2022 13:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235124AbiGGLno (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jul 2022 07:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232504AbiGGLnn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jul 2022 07:43:43 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDD726115
        for <linux-input@vger.kernel.org>; Thu,  7 Jul 2022 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657194222; x=1688730222;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KjPsMkUkzwk0boICg+RicPX934UGhQlB/AKCg+CUo/k=;
  b=bmjxR+9jhXzAXGDL3231ggNAJTmuX8I2DIBK034HSZI+ix1iBk2nLg7h
   zxT7FtXE6kKT2Vjc5ZfhNH0pORWFHpfW5apgDpW6J7USGiYLFFHqLV3ax
   9LUwWx6rAPiqWX98lM65at3ip7BTO7avFvYluf2oRFrAuqPN1N9B5Vfjw
   S7fPjrvR/BGtHrqP3pNfebWsfk4ezj6PitA9X3Vnu6P7D+Kf3dDAZAuuu
   odaP9T3Xr+sIK2rkOUwG9etAtfoHUWHtN2bwj0B9ZtF+N/W1X/tL5Fpdl
   Z6Dt/8xdXdxuFTMuHZDgiOnaLVU4XXRsScH7UxLudQVBaJS6BROY+WM6j
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="284744724"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="284744724"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 04:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="920559193"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Jul 2022 04:43:41 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9Pv2-000LxF-Mn;
        Thu, 07 Jul 2022 11:43:40 +0000
Date:   Thu, 07 Jul 2022 19:43:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 c4bcc1b99b8b8acdfe673e4701a9c2acb6b8b2fb
Message-ID: <62c6c6e8.1IlUZDpRbHgBi+W/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: c4bcc1b99b8b8acdfe673e4701a9c2acb6b8b2fb  Input: goodix - switch use of acpi_gpio_get_*_resource() APIs

elapsed time: 721m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
m68k                        mvme147_defconfig
m68k                             alldefconfig
xtensa                       common_defconfig
m68k                         amcore_defconfig
sh                           se7721_defconfig
powerpc                  storcenter_defconfig
mips                 decstation_r4k_defconfig
sh                           se7712_defconfig
sh                        edosk7705_defconfig
ia64                             allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                          randconfig-a005
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220706
riscv                randconfig-r042-20220707
arc                  randconfig-r043-20220707
s390                 randconfig-r044-20220707
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                      pxa255-idp_defconfig
powerpc                     tqm8540_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a002
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220706
hexagon              randconfig-r045-20220706
riscv                randconfig-r042-20220706
s390                 randconfig-r044-20220706

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
