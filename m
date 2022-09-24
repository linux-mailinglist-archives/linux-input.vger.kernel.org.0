Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2085E8EB1
	for <lists+linux-input@lfdr.de>; Sat, 24 Sep 2022 18:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233984AbiIXQ6N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Sep 2022 12:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbiIXQ5s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Sep 2022 12:57:48 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C15691D17
        for <linux-input@vger.kernel.org>; Sat, 24 Sep 2022 09:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664038667; x=1695574667;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=reUqumL7V5p6zhSWDbGBI1KwDaTxIrXZvynuIb6NX6E=;
  b=eN5ctcsY8toXG0Y06H/W0DWopokDn2yQxgEmVZ8IOq7aXWmWfBolECIw
   lQTzNa/5eTGMm+tl97Xz3DCN0dMXAnWWs5xaf44Gcq+DyeBndRkFpIC9p
   YNxVsAsB6f/WlzlOj+wdePmgZhLPvzPlMCfsmeXAZ4kXZWGcKFKQwqmuP
   t2dbvkJ3jy4Q4vej1CKKr/CSbEBmgceYv2aCMBdQTRA7FLmIc9gw95obT
   TP6j24heUOF0kCIPr+VUVjyB35i0aQpb0eR2P+CnBKktbDU7+ySO+tP4d
   cTjHOtaGJu+XB1urA68OOxPKCMyNpEEVnzx0Ac14FvSwsSsL8R1VFNGi8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="362616818"
X-IronPort-AV: E=Sophos;i="5.93,342,1654585200"; 
   d="scan'208";a="362616818"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2022 09:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,342,1654585200"; 
   d="scan'208";a="571723686"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Sep 2022 09:57:45 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oc8TJ-0006ny-0W;
        Sat, 24 Sep 2022 16:57:45 +0000
Date:   Sun, 25 Sep 2022 00:57:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 87d3d1b1403ba079cf9b1541a247156863af07f0
Message-ID: <632f3703.3xuwD/8WbuqLtHDv%lkp@intel.com>
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
branch HEAD: 87d3d1b1403ba079cf9b1541a247156863af07f0  Input: synaptics-rmi4 - drop useless gotos in rmi_f34v7_do_reflash()

elapsed time: 1251m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20220923
riscv                randconfig-r042-20220923
s390                 randconfig-r044-20220923
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm                                 defconfig
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                        randconfig-a011
arm64                            allyesconfig
x86_64                        randconfig-a002
arm                              allyesconfig
i386                          randconfig-a016
i386                          randconfig-a014
sh                               allmodconfig
i386                          randconfig-a012
x86_64                        randconfig-a004
i386                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm

clang tested configs:
hexagon              randconfig-r045-20220923
hexagon              randconfig-r041-20220923
i386                          randconfig-a006
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a012
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a001
i386                          randconfig-a013
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
