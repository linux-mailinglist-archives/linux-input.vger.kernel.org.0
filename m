Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFF4F5FA43B
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 21:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJJTcr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 15:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiJJTcp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 15:32:45 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5AC4AD40
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 12:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665430364; x=1696966364;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GCPUaIVTu7rsQW5pXRhwZkfgbaxwWoK5zl3pA6dOgGU=;
  b=hMrhqBmjVLLI3SUZexVeCfpsBTBC5pcJgDuQ1CJq1s+kuguW9AhMOjQf
   azJwgN4yKBPf0SpLxzWdb9p7vfPFT+hIIZU3dwnuHUAP5RTwsrfikQRMM
   ZMoIuInrqklfCveI8oC3/Ux3JRhGQhtcZIVaonPyDvuavHoaV+RaFGK11
   rou1AxHusqJZFbVWw8DWKLf3osVhLNCcJUGUywsrGYN7yxI8YvWr4rtcn
   8GSJ9bExJ/bMqnzPJemavU8McLYkvcAjJZpqGlkluF+W3tojtqDVdUFx5
   dOkoEyKR1FR2R00qfzTC+Bx1xWMJ4v+ncDzgKpOayXHE7CtmYds82TKfK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="284698378"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="284698378"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 12:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="688923853"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="688923853"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Oct 2022 12:32:43 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ohyW3-00027O-0L;
        Mon, 10 Oct 2022 19:32:43 +0000
Date:   Tue, 11 Oct 2022 03:31:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 5f8f8574c7f5585b09a9623f0f13462e4eb67b4d
Message-ID: <63447325.q3GGlfVJqyrT9hbN%lkp@intel.com>
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
branch HEAD: 5f8f8574c7f5585b09a9623f0f13462e4eb67b4d  Merge branch 'next' into for-linus

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
i386                 randconfig-a012-20221010
i386                 randconfig-a011-20221010
s390                                defconfig
i386                 randconfig-a013-20221010
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221010
i386                 randconfig-a015-20221010
i386                 randconfig-a014-20221010
i386                 randconfig-a016-20221010
s390                 randconfig-r044-20221010
s390                             allyesconfig
riscv                randconfig-r042-20221010
x86_64               randconfig-a011-20221010
x86_64                           allyesconfig
arm                              allyesconfig
x86_64               randconfig-a016-20221010
m68k                             allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20221010
arc                              allyesconfig
arm64                            allyesconfig
x86_64               randconfig-a015-20221010
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a012-20221010
alpha                            allyesconfig
x86_64               randconfig-a013-20221010
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
x86_64                               rhel-8.3
sh                               allmodconfig
mips                             allyesconfig
x86_64                           rhel-8.3-syz
i386                             allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig
i386                                defconfig

clang tested configs:
i386                 randconfig-a003-20221010
hexagon              randconfig-r045-20221010
hexagon              randconfig-r041-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a005-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a006-20221010
i386                 randconfig-a004-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a002-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a005-20221010

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
