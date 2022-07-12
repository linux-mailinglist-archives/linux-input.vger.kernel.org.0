Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB448571774
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 12:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbiGLKiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 06:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbiGLKiN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 06:38:13 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15668FD4D
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 03:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657622292; x=1689158292;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WigcB3LgWgnRP4PUFZWbRWZYbW7gT4BI0EtM9C6bevw=;
  b=Eu1HbquvEB5zjjs/stOFwyRCbI3b1KFg3FNMHxFm9EtXTU9xLulGVDOI
   4dXMnjpNsHsBisH/Xe2pL1s/MYIaaEaAa5+kG5u/WQg+nZ6BYeL/vMNM+
   viIJEHb4RiznvCVub8ilT0p3pCcUiYeuYn+mZMsxuJy9a8VNU8iaXFAgb
   JBNqSleCWgpnS4Yat0Ij1/Wz5C1m/642Cv8nM2pYeIT2j0MRs7f7HAnOZ
   xHQHBCQupGD3MutfIy/gEcZZ/639AsImHiPvO6wj0Vy6A2ifyOS3W+vcS
   UNeC5e/Rr+ThKGMyVKpKYJcuKHLfTGrLe1VUkoxnZhQjBO4jIbPKX5lqO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="282450498"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="282450498"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 03:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="622456964"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Jul 2022 03:38:10 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oBDHO-00021x-2w;
        Tue, 12 Jul 2022 10:38:10 +0000
Date:   Tue, 12 Jul 2022 18:37:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 39636805cab2d46aa645f389f3fca8040afd4c4f
Message-ID: <62cd4f01.LuoAmv2jieWoh5Qn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 39636805cab2d46aa645f389f3fca8040afd4c4f  dt-bindings: input: iqs7222: Use central 'linux,code' definition

elapsed time: 722m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220710
s390                 randconfig-r044-20220710
riscv                randconfig-r042-20220710
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220710
hexagon              randconfig-r045-20220710

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
