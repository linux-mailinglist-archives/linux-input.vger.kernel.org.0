Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D675F19A4
	for <lists+linux-input@lfdr.de>; Sat,  1 Oct 2022 05:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbiJADj6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 23:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbiJADjR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 23:39:17 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A33BE6
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 20:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664595556; x=1696131556;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mm9nr5OjSeCgp/M4zebmXjkfBDN9IHBXDOFyfNozjqY=;
  b=cr5qotUW6XtspwxMwCrjW9WdS69fq+60hSipRwtciKvn4m/ptZjSXHTU
   CkD/+qKKva3xGYz6Rr8M8FqgMGsJA6X5NUcAiiFzNZAfZYnznqDknNJ2R
   14zpeKr8mXQg//hqnIMe5CLIWHz9McpLow85Q/bWs1xf93ZR6MVD7A2xI
   l1HDldu9ZHBkRk9hy4lyHoCeJkTwABeFao18s73UbWFZShpUNXeK6KUri
   UQMQYJSbVY8/Sf7zdJp1KliLCgpXa4JFviz+Pa3HvvWuC4V+bC6SLSLhk
   j0/u8HCcQSd5rzYK4eiXCAEBF1r7+s73CxfM4Zh9sBiwAtXbVT0pdGec3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="364180937"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; 
   d="scan'208";a="364180937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 20:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="656169767"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; 
   d="scan'208";a="656169767"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Sep 2022 20:39:13 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oeTLM-0001od-1a;
        Sat, 01 Oct 2022 03:39:12 +0000
Date:   Sat, 01 Oct 2022 11:38:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 2d09ac951b7750780ecb3de3ccb642dffd7ef62b
Message-ID: <6337b648.9Gjs4OsrAXyYH0Be%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 2d09ac951b7750780ecb3de3ccb642dffd7ef62b  input: drop empty comment blocks

elapsed time: 1678m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
x86_64                           rhel-8.3-syz
um                           x86_64_defconfig
s390                             allmodconfig
powerpc                           allnoconfig
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
mips                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                                defconfig
m68k                             allyesconfig
s390                             allyesconfig
x86_64                              defconfig
arc                  randconfig-r043-20220925
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                  randconfig-r043-20220926
riscv                randconfig-r042-20220925
x86_64                           allyesconfig
s390                 randconfig-r044-20220925
i386                             allyesconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a003-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a001-20220926
arm                                 defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r041-20220925
hexagon              randconfig-r045-20220926
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
x86_64               randconfig-a013-20220926
i386                 randconfig-a014-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a012-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926
x86_64               randconfig-a014-20220926
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64               randconfig-a016-20220926
x86_64               randconfig-a015-20220926
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
