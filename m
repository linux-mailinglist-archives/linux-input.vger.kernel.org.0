Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94CE62DC2F
	for <lists+linux-input@lfdr.de>; Thu, 17 Nov 2022 14:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239485AbiKQNDB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Nov 2022 08:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234724AbiKQNC7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Nov 2022 08:02:59 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C695764570
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 05:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668690178; x=1700226178;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cUmJiR1owhgDO/ygBzgNJQl2q3O6xi6LzOFFVtz2y6U=;
  b=dmgK/CY2EgtVPKGfzZTrbO2gTfISTSEfZev1bPa9QYyVTw1ShUMjMvJ0
   c5KpoNe6nwEUHws/tHoCSP6LV7Hgk/+BDfTb4KCQ1uInM67H6gMmbUxA/
   u2mdNiCzNWONPWcUkqvQ4Az5h8tXHYzi8yjnl0CYQJ7uPr2PG9Y1ZZNNJ
   8XTiMk2gNOV863ek1QFVb+os655vV0Bxel1R7vJtxV3aMgZgjISDywuuh
   I3fCBF9i5hbvqTqsWqJKqLnN8/uj7W9Vv6dxsAo1b3pwiHpk20GppZvae
   o8FridSOdiNMTV3WDkyuhSilykuUU/cSZQo1+nuPbFGGpR4HnZoMS3P20
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="311546631"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="311546631"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 05:02:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="672801890"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="672801890"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Nov 2022 05:02:57 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oveXg-0000KF-1D;
        Thu, 17 Nov 2022 13:02:56 +0000
Date:   Thu, 17 Nov 2022 21:02:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 5e7a0af793ce7ed528117145f856224deb81b7a7
Message-ID: <637630f0.w4AcrdvdQbAMesS1%lkp@intel.com>
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
branch HEAD: 5e7a0af793ce7ed528117145f856224deb81b7a7  fixp-arith: do not require users to include bug.h

elapsed time: 757m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
arc                              allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
x86_64                        randconfig-a006
x86_64                              defconfig
i386                          randconfig-a003
x86_64                               rhel-8.3
arc                  randconfig-r043-20221117
i386                                defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                           allyesconfig
s390                 randconfig-r044-20221117
riscv                randconfig-r042-20221117
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
s390                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221117
hexagon              randconfig-r045-20221117
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
