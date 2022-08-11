Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1380358FB42
	for <lists+linux-input@lfdr.de>; Thu, 11 Aug 2022 13:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbiHKL3u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Aug 2022 07:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234028AbiHKL3u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Aug 2022 07:29:50 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D1765806
        for <linux-input@vger.kernel.org>; Thu, 11 Aug 2022 04:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660217389; x=1691753389;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x+15fJocfrvdlrzc/Ki0Rq2So2PULOX7SOmXUl6HMpY=;
  b=eRMRgQrl0/F6WmZx57+n686tYMJoTw4ulh95FS5e45UYG4YzGy3CSuGQ
   D24mRdGQntiNLybg0uzTQqyV0s8PRERQ6eiiavUIItpjcuc+tteGB5Raj
   1UfbuWyJbpAu98VXxpMBMJlTQ7L6pcX9aHCnghbE7a6mWjyzGKqy01HfB
   7I5rRs0669pKC5fbmr7OpjH1OoE+h1LnJ38sNeWbU2SalDeL8dDMU/L71
   5JP/wMi4OkfHgapPWg9s/NtVsfWvUdZWe/DP8BXE8padF9pshm7+dfSgA
   oFiBahPrzTb1O9qwU6mWIKxaKvluCEt8B2Rsu5hICudXwMrZcx+6O+zgz
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="271099042"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="271099042"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 04:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="556096186"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2022 04:29:47 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oM6Nn-00008i-0V;
        Thu, 11 Aug 2022 11:29:47 +0000
Date:   Thu, 11 Aug 2022 19:29:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 51c88597517d9625c127f0d8f8f3bf04ef5f8d76
Message-ID: <62f4e807.XXs46bLOggVs+UEf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 51c88597517d9625c127f0d8f8f3bf04ef5f8d76  Input: mt6779-keypad - support double keys matrix

elapsed time: 713m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
riscv                randconfig-r042-20220810
x86_64                        randconfig-a002
i386                                defconfig
m68k                             allyesconfig
arm                                 defconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a006
i386                          randconfig-a005
i386                          randconfig-a016
x86_64                              defconfig
sh                               allmodconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
x86_64                        randconfig-a013
i386                          randconfig-a012
x86_64                        randconfig-a004
mips                             allyesconfig
powerpc                           allnoconfig
i386                             allyesconfig
i386                          randconfig-a001
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220810
i386                          randconfig-a003
i386                          randconfig-a014
x86_64                        randconfig-a011
alpha                            allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
arm64                            allyesconfig
m68k                             allmodconfig
s390                 randconfig-r044-20220810
x86_64                           rhel-8.3-syz
arc                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a001
i386                          randconfig-a004
hexagon              randconfig-r041-20220810
i386                          randconfig-a015
x86_64                        randconfig-a016
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220810

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
