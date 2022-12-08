Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17EA6471BE
	for <lists+linux-input@lfdr.de>; Thu,  8 Dec 2022 15:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiLHO1K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 09:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiLHO0B (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 09:26:01 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA5799504
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 06:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670509547; x=1702045547;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Uq/6jaJNEGsuqqwonbUODwL5wfku1nT0iwhd36A+OaQ=;
  b=PLD+np3vmKVAsm997q6ie1jEyY1aCZ7FGSxlh+HCF7KXD1mBdAIAEADz
   BAoCjN+N/NKyCJi1aIVkynD3iwyWIS+I6FU6sh1E/ExdByiLsopUIsy/G
   8aoFNpxfZCSy9UA46ArJ/GQpNjr27YhEPe8WKXMGSorELwlpun1Moeglb
   EcOvX704odhzS1TNkXg8YkWZFRv+N/PE88awQaRoPbluF3Hd0t7jfhXJ7
   RF7+mvVYXCFvAadLXGZjQl70ZBCJ8ZdZCsOPi7vkAIiblrIzu8tc2tp6g
   c9FRXW6FBctxgsBk9ZSDC+EUmiGcqw3QvQ6cjb2FeDc66Ljpjvljovfkg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="296871286"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="296871286"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 06:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="892246188"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="892246188"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2022 06:25:46 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p3HqL-0001Bb-12;
        Thu, 08 Dec 2022 14:25:45 +0000
Date:   Thu, 08 Dec 2022 22:25:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 de4b8d201666b332034f8117b0995a43534b57d3
Message-ID: <6391f3d7.i7aj+PBLTnnV5fws%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: de4b8d201666b332034f8117b0995a43534b57d3  Input: pxspad - fix unused data warning when force feedback not enabled

elapsed time: 722m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arc                                 defconfig
um                             i386_defconfig
s390                             allmodconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
alpha                               defconfig
sh                               allmodconfig
s390                                defconfig
x86_64                               rhel-8.3
x86_64                              defconfig
mips                             allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
i386                                defconfig
x86_64                          rhel-8.3-func
s390                 randconfig-r044-20221207
i386                          randconfig-a016
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a014
i386                          randconfig-a012
arc                  randconfig-r043-20221207
arm                                 defconfig
i386                          randconfig-a001
i386                             allyesconfig
riscv                randconfig-r042-20221207
i386                          randconfig-a003
i386                          randconfig-a005
arm                              allyesconfig
ia64                             allmodconfig
arm64                            allyesconfig
x86_64                            allnoconfig
i386                          randconfig-c001

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a006
arm                  randconfig-r046-20221207
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-k001
arm                           omap1_defconfig
powerpc                    ge_imp3a_defconfig
arm                         socfpga_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
