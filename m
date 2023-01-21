Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E71A676426
	for <lists+linux-input@lfdr.de>; Sat, 21 Jan 2023 07:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjAUG1E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 21 Jan 2023 01:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjAUG1E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 21 Jan 2023 01:27:04 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2044371BF4
        for <linux-input@vger.kernel.org>; Fri, 20 Jan 2023 22:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674282423; x=1705818423;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CrE2RA3+yG43UzJ/FxB67FD6EVoathpyN7rQU5nvMYI=;
  b=Gl+rt223AvBIXYp/9rzEc71n9s6PLqlc8FdnDy7pwVUl1ach2Vz3X0YJ
   /pRNj/YZbxrsM2LcAl4zMTrVvbgd0/42U4uu2BRdPUbh4IURGXET1Ffhb
   4sdZyFbPpzrP4rQeaXjH56rAvpjjyd0IJNxuEp17iQ+k+lUuhQ38duCr9
   YudfQfVASm03zEJ634uU9wuWC3Y6d08WOM474tPNFSCvEnREHwq4AlgLV
   botfinkBbgVA51iqK0xmk6Mrm5LM909FuZoEQNtQps2IMODi2lcO5CzU4
   moQXBoUblsN7rG1qMN2Lh2l9guQGbZECY2GF8+vrenjJUffU/X6u4N3pn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="388123418"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="388123418"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 22:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="610717061"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="610717061"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2023 22:27:00 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pJ7LA-0003fN-0W;
        Sat, 21 Jan 2023 06:27:00 +0000
Date:   Sat, 21 Jan 2023 14:26:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 8aaec1177521eed07240ec5ac2bc55b2a1c35b42
Message-ID: <63cb85b1.aWZOzPVMavYeBSvj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 8aaec1177521eed07240ec5ac2bc55b2a1c35b42  Input: cros_ec_keyb - add 3 buttons for monitor function

elapsed time: 720m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-syz
alpha                               defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                                defconfig
x86_64                           rhel-8.3-bpf
s390                             allyesconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                  randconfig-r046-20230119
arc                  randconfig-r043-20230119
i386                          randconfig-a001
i386                          randconfig-a003
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
i386                          randconfig-a005
i386                                defconfig
x86_64                        randconfig-a006
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a004
x86_64                        randconfig-a015
arm64                            allyesconfig
x86_64                        randconfig-a002
sh                               allmodconfig
arm                                 defconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
i386                          randconfig-a014
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64                          rhel-8.3-func
mips                             allyesconfig
i386                          randconfig-a012
arm                              allyesconfig
i386                          randconfig-a016
powerpc                          allmodconfig

clang tested configs:
s390                 randconfig-r044-20230119
hexagon              randconfig-r045-20230119
hexagon              randconfig-r041-20230119
i386                          randconfig-a002
riscv                randconfig-r042-20230119
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a001
i386                          randconfig-a013
x86_64                          rhel-8.3-rust
i386                          randconfig-a015
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
