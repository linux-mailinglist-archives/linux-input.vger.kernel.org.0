Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD017641688
	for <lists+linux-input@lfdr.de>; Sat,  3 Dec 2022 13:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiLCMI5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Dec 2022 07:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiLCMI4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Dec 2022 07:08:56 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E1D40913
        for <linux-input@vger.kernel.org>; Sat,  3 Dec 2022 04:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670069335; x=1701605335;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=B9ikaMo+V5ufj2h5eIk8hnRtZNLsxQ5HUV0zAjr4y/8=;
  b=BKtPWcqq9CbJWUyrj9Z/qtcvIgQrw5fhLn72U1Fs4gCjfX+gP8C1LEmn
   NZkhtl6TADDlKNQvDSAZ3EYL+Z6B9zCZHWD4RaNQ0P4IpX7DrUICn6Rqh
   sfQLQ+D/T7a2f304wCfV1qbXumaYLMtYgy12Y6/1/3yEjTfaIMcnjLPKD
   e6mVyobqft4ysyqSu+b3DcqD61tGF6eFHwjFGSUhOlGFqulA4MG+DlSMR
   GH5iK1RXb24HlwuYydKCQR8l4HQ+LynDujSyD9q3NuWV0bFKsdsICurrH
   OU0fgsbdrIfdmiqOzCLKCK7S4ku9xVvUJ0B3e9P6AbWMA0oha7c9XqqR+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="378267525"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="378267525"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 04:08:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="645315489"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="645315489"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Dec 2022 04:08:52 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p1RK7-000EWB-2x;
        Sat, 03 Dec 2022 12:08:51 +0000
Date:   Sat, 03 Dec 2022 20:08:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 8c9a59939deb4bfafdc451100c03d1e848b4169b
Message-ID: <638b3c25.lCwxfIia7I+ITad0%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 8c9a59939deb4bfafdc451100c03d1e848b4169b  Input: raydium_ts_i2c - fix memory leak in raydium_i2c_send()

elapsed time: 721m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
x86_64                               rhel-8.3
um                             i386_defconfig
powerpc                           allnoconfig
x86_64                              defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
alpha                               defconfig
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
s390                                defconfig
sh                               allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
s390                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
ia64                             allmodconfig
arc                  randconfig-r043-20221201
riscv                randconfig-r042-20221201
s390                 randconfig-r044-20221201
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
arm                                 defconfig
x86_64                            allnoconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-c001

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221201
hexagon              randconfig-r041-20221201
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015
arm                       spear13xx_defconfig
arm                          ep93xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
