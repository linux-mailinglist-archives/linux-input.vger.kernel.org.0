Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA465A9EE4
	for <lists+linux-input@lfdr.de>; Thu,  1 Sep 2022 20:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbiIASZ4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Sep 2022 14:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233350AbiIASZy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Sep 2022 14:25:54 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FBA419BC
        for <linux-input@vger.kernel.org>; Thu,  1 Sep 2022 11:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662056752; x=1693592752;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nhRBRBUcwtdoHNZCBV5dvaoO2HHpb9ws8/tNoFwTIjw=;
  b=b+csdc3iUtUmmfZA5ksMTQ5/D9jjr5Jz1zKbzaSxm+qaX4vajltWo76T
   HCnXK1utqpqlq/l9pSMyWzVTxF/i9MuIUxR9m8INTrEyhdwzgatGjRIze
   Xx3dKoBVt6v2iuQxhdU6b/cTtMIfvI0jVy9P/pc2QnrmlaWrfRbT6Fo3E
   Rwg+4EKJNS7steunB+9GCXSOfcKxR2fAHkAvjGpru3ObdkU1JjRPU/o+x
   Lz8cYXN0kwL6tpoo/JeTiMFSE8267Pf8ffLXW6/rfbpwhXmHFCeFocdfT
   SRgeAnEJGW0vjNdHe+Fvm9BcS7ctoujpWeu6oFYrUXsy3Zd2EQP2hBYAv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278811840"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="278811840"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 11:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="680976220"
Received: from lkp-server02.sh.intel.com (HELO b138c9e8658c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2022 11:25:51 -0700
Received: from kbuild by b138c9e8658c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTosw-0000d3-1F;
        Thu, 01 Sep 2022 18:25:50 +0000
Date:   Fri, 02 Sep 2022 02:25:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 ed3d5bd20dcdfdbe110feeabf120cba7bd329ad8
Message-ID: <6310f910.gZQJoIfQuOWhDE2S%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: ed3d5bd20dcdfdbe110feeabf120cba7bd329ad8  Input: rt5120 - add power key support

elapsed time: 1129m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
s390                 randconfig-r044-20220831
mips                             allyesconfig
arc                  randconfig-r043-20220831
powerpc                           allnoconfig
riscv                randconfig-r042-20220831
x86_64                              defconfig
sh                               allmodconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a002
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a006
i386                          randconfig-a012
m68k                             allmodconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
x86_64                        randconfig-a011
i386                          randconfig-a005
i386                                defconfig
x86_64                        randconfig-a015
i386                          randconfig-a003
i386                          randconfig-a014
i386                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220831
hexagon              randconfig-r045-20220831
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a016
i386                          randconfig-a015
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a006
x86_64                        randconfig-a014
riscv                randconfig-r042-20220901
hexagon              randconfig-r041-20220901
hexagon              randconfig-r045-20220901
s390                 randconfig-r044-20220901

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
