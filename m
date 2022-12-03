Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249E8641689
	for <lists+linux-input@lfdr.de>; Sat,  3 Dec 2022 13:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiLCMI5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Dec 2022 07:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiLCMI4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Dec 2022 07:08:56 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967D4178A7
        for <linux-input@vger.kernel.org>; Sat,  3 Dec 2022 04:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670069336; x=1701605336;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZXEUkWi22IAFeHaaOaZIzjeowWfsNdanMP2L6/bEyRc=;
  b=IyOzKbg5nYhq0zbdSkRZoI38tBWZ3xnNw94+UefKBOJhJxBkWdi/XXW1
   7DFBpEhKWIQrmu9bFJceT14WQL4ifINjmXi7NobwAEn3ZnJuhk+tbX6U2
   vDLppd+Z54aBrqj0GGvV+fWWWxVuoVsnuIoanakebMw/BHze2tsUc51HQ
   K/XSKS5+wTjeREGquWC84vEqLN0s+qNOXjvVz0h9+nt8lnI4mLHQn4M17
   3IKAMmrIwunj3SEQSr4B6MVWPWlIIxEbBAoFd3n3NosWDhUDcl9P8XcQf
   QRXfCjCxzzDWXZOfjL7svPKBaWGOcgMckJV0KXe54DiPM5IZoNJSp38DE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="317973707"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="317973707"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 04:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="751599686"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="751599686"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Dec 2022 04:08:52 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p1RK7-000EWD-32;
        Sat, 03 Dec 2022 12:08:51 +0000
Date:   Sat, 03 Dec 2022 20:08:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 56232e933dd6a930167f0147463e8d07851278ec
Message-ID: <638b3c29.JSpDrmHwQ6ObAl3b%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 56232e933dd6a930167f0147463e8d07851278ec  Input: zforce_ts - Convert to i2c's .probe_new()

elapsed time: 720m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
mips                             allyesconfig
x86_64                        randconfig-a011
powerpc                          allmodconfig
x86_64                        randconfig-a015
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20221201
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
s390                 randconfig-r044-20221201
x86_64                        randconfig-a004
arc                                 defconfig
x86_64                        randconfig-a002
s390                             allmodconfig
alpha                               defconfig
riscv                randconfig-r042-20221201
s390                                defconfig
m68k                             allmodconfig
x86_64                        randconfig-a006
x86_64                              defconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
i386                          randconfig-a016
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a014
i386                             allyesconfig
i386                          randconfig-a012
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                            allnoconfig
i386                          randconfig-c001

clang tested configs:
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221201
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a011
arm                       spear13xx_defconfig
arm                          ep93xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
