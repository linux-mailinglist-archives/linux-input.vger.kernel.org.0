Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA0565ED441
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 07:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbiI1FbS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 01:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiI1FbQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 01:31:16 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628941D88DF
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 22:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664343076; x=1695879076;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yveTe/sKKh7iBaYgRALanHcZOIUlVdIsPeG+bOovzR4=;
  b=H1bPaQMFwE0gcWDvOJKxa4Cnn4GqRrzyN15DqaMAboMeXGN6jAk++sgX
   ab56KFUITmLxr3U6cOGXENJa1X7rktcprQK6umwVKgjsjmmALk4tPWQbd
   4WoqBWJBfGboJW8ctR4uShPUFRUXbTPZFcVZKFu2Feu7m1QFlbRKXrkND
   cNFy0QZ1GIZxLC718Ts560JATJBomdsg3RjMxufHNGmh3HJBuwynyv5e3
   KHbYDrvJwQODD66er0U8uR/8xOiPL+RlGEtebWAjg4cQbJrbaeVt8otLp
   lVhbYwCw4eHo28r06bAWexRXNvCSJYXIbsgxfF4u4eYXsQx+ny7rwUO+h
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281879809"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="281879809"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 22:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="599443413"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="599443413"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Sep 2022 22:31:14 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odPf2-00022F-2T;
        Wed, 28 Sep 2022 05:31:08 +0000
Date:   Wed, 28 Sep 2022 13:30:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 e62563db857f81d75c5726a35bc0180bed6d1540
Message-ID: <6333dc04.qTuQVcLy8fJ9lJXe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: e62563db857f81d75c5726a35bc0180bed6d1540  Input: snvs_pwrkey - fix SNVS_HPVIDR1 register address

elapsed time: 856m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
powerpc                           allnoconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
sh                               allmodconfig
arc                  randconfig-r043-20220925
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
arm                                 defconfig
x86_64                        randconfig-a002
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arm                              allyesconfig
arm64                            allyesconfig
i386                 randconfig-a001-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a015-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
