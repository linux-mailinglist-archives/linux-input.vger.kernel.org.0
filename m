Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA085B8182
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 08:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbiINGdt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 02:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiINGds (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 02:33:48 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16B561709
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 23:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663137227; x=1694673227;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=L5+QuKx9lo2hwwUfs+g1Pgzcy1wYOm/J5fFT2ZVZmzg=;
  b=AQkXD7JUXEj+H8+qCTRiti+S7c5kH1j69YL3Cv4JdFQVefqLC1YmvLg0
   Q6mv45rI6hUnnJ0GT/f1ByHr3AUwie5Lsdftz5/wi2sdV5iLMspN7R4fT
   1+cdR4smKbG981REjkdlMenXgzowV94tBHVWqnsp4x0vHuFM3V/2sZIU6
   Ti89ZfLaC0Lzl6tnIwF7DfM2T5GQzimbP8gus8X3YSZT0HUp2xLepsA83
   Vv2HB7uTb7/krbGgFe6kwC3O2iAA6xJz1zWwTPg2HcheepTMdDbHV5tuK
   qkVmeaSPOPMtaKC8LQypJTASLxhuKfzF4JXjZppIvcHFsBy7mVMiJOvhD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="297080679"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="297080679"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 23:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="685191914"
Received: from lkp-server01.sh.intel.com (HELO f00d1ee8958c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2022 23:33:46 -0700
Received: from kbuild by f00d1ee8958c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYLxx-00002q-36;
        Wed, 14 Sep 2022 06:33:45 +0000
Date:   Wed, 14 Sep 2022 14:32:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 cd01569b040e3f496b74e4b78c2e79fc10979b28
Message-ID: <63217593.x4n+ruW4bWYuhjhH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: cd01569b040e3f496b74e4b78c2e79fc10979b28  Input: mtk-pmic-keys - add support for MT6331 PMIC keys

elapsed time: 728m

configs tested: 60
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                 randconfig-a006-20220912
sh                               allmodconfig
i386                 randconfig-a001-20220912
m68k                             allmodconfig
i386                 randconfig-a002-20220912
arc                              allyesconfig
i386                 randconfig-a004-20220912
alpha                            allyesconfig
mips                             allyesconfig
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
i386                 randconfig-a003-20220912
x86_64                         rhel-8.3-kunit
i386                 randconfig-a005-20220912
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
um                             i386_defconfig
x86_64                           rhel-8.3-syz
um                           x86_64_defconfig
arc                  randconfig-r043-20220912
arc                  randconfig-r043-20220911
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
arm                                 defconfig
x86_64               randconfig-a001-20220912
i386                             allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a006-20220912
x86_64               randconfig-a004-20220912
riscv                randconfig-r042-20220911
x86_64               randconfig-a002-20220912
s390                 randconfig-r044-20220911
x86_64               randconfig-a005-20220912
x86_64               randconfig-a003-20220912
arm64                            allyesconfig
arm                              allyesconfig
sparc                               defconfig
xtensa                  cadence_csp_defconfig

clang tested configs:
hexagon              randconfig-r041-20220912
hexagon              randconfig-r041-20220911
hexagon              randconfig-r045-20220911
s390                 randconfig-r044-20220912
riscv                randconfig-r042-20220912
x86_64               randconfig-a012-20220912
x86_64               randconfig-a014-20220912
i386                 randconfig-a014-20220912
hexagon              randconfig-r045-20220912
x86_64               randconfig-a013-20220912
x86_64               randconfig-a016-20220912
x86_64               randconfig-a015-20220912
x86_64               randconfig-a011-20220912
i386                 randconfig-a015-20220912
i386                 randconfig-a013-20220912
i386                 randconfig-a016-20220912
i386                 randconfig-a011-20220912
i386                 randconfig-a012-20220912

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
