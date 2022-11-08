Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91107620B4A
	for <lists+linux-input@lfdr.de>; Tue,  8 Nov 2022 09:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbiKHIfv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Nov 2022 03:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbiKHIfu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Nov 2022 03:35:50 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1DB5F89
        for <linux-input@vger.kernel.org>; Tue,  8 Nov 2022 00:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667896549; x=1699432549;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=df+pWwp0O+87XAc/al6w5140m3XqpVtK2KbDh4KSyRQ=;
  b=GYrGr5jO3OcgdQoXSz1ecHznBEjOCAwEbBf5Xbot1w+0BaMH6Y0L+uuv
   WyRcAVskYXbm6vNN2+FPgnl2CXmKYgXfKeS6YWxrPpw6rcxU7mNHB0JgZ
   sW8Vf4YfsIOvU7fsfiHSnVL+0Cd7fEuohk02v430kJHkdaEgvbR++Mhsm
   I3gaFxqh5ITw/Y3vGFvp+zBI1LQmJnjEaavTfRW7eBDWBSiSesTMg9ue0
   lx+E6NZuKJchXnE6aWMr++d+jMVNTbQlmg1COdkp05TzZjHBVktKBjqB8
   3YwaaDMCCw2yZvsgbaCxFiqr40yedm48XHBzWHsYHsBiYyPZrrc8W0cr/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="309350413"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="309350413"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 00:35:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="614201514"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="614201514"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Nov 2022 00:35:47 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osK5C-0000ET-2k;
        Tue, 08 Nov 2022 08:35:46 +0000
Date:   Tue, 08 Nov 2022 16:35:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 e13757f52496444b994a7ac67b6e517a15d89bbc
Message-ID: <636a14da.LzPhOTP/s7ywNEws%lkp@intel.com>
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
branch HEAD: e13757f52496444b994a7ac67b6e517a15d89bbc  Input: soc_button_array - add Acer Switch V 10 to dmi_use_low_level_irq[]

elapsed time: 725m

configs tested: 42
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                  randconfig-r043-20221107
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                              defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
i386                             allyesconfig
i386                                defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221107
riscv                randconfig-r042-20221107
hexagon              randconfig-r045-20221107
s390                 randconfig-r044-20221107
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
x86_64               randconfig-a014-20221107
x86_64               randconfig-a011-20221107
x86_64               randconfig-a013-20221107
x86_64               randconfig-a012-20221107
x86_64               randconfig-a015-20221107
x86_64               randconfig-a016-20221107

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
