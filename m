Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6849560928
	for <lists+linux-input@lfdr.de>; Wed, 29 Jun 2022 20:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiF2SaP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jun 2022 14:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiF2SaP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jun 2022 14:30:15 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4696631219
        for <linux-input@vger.kernel.org>; Wed, 29 Jun 2022 11:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656527414; x=1688063414;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pi7TdVVgTa1rNWBlPjCyBzS5oTsYx+4EBSNTVCDb7As=;
  b=e4wFY5rkYl7m40wUkLhXIhSBj3Itgod3W1/yD5a/ka/kapjBgdBnNftg
   6l9XV3HVptMD3xWHywi2j0Ib1X50+JA+LCzlpYKmbRp/EuHW4imd2rrlM
   oNJ9upTCkEfzV06HJwRb6fpMKFWGWx/ZxAJopHcl5jiuvhXl9Fblpysdt
   pEMYeHYK5qoRrdbA9BrqBC8K15dXq7hz/Zc1ohNHxIRAUs6evsRMrXzTG
   DyxuqTJ3ghwDiY8Yd37is27Fp7AZAnLhjD5OmMDeOnnHysGCAz9KWVKSP
   /wrEjI4fcaZpcZVuLAAijpwKBLZky1CZVb6sGISlGgXYXpanK5gjI5vFm
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="282848284"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="282848284"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 11:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="595348511"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jun 2022 11:30:12 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o6cS4-000BPw-67;
        Wed, 29 Jun 2022 18:30:12 +0000
Date:   Thu, 30 Jun 2022 02:29:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 b2274ff2c4bb7eb6fca6039c7e431506c6c26605
Message-ID: <62bc9a07.sr+FgnKObR9q9fu5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: b2274ff2c4bb7eb6fca6039c7e431506c6c26605  Input: sensehat-joystick - remove unnecessary error message

elapsed time: 724m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                         axm55xx_defconfig
sh                            hp6xx_defconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
i386                                defconfig
i386                             allyesconfig
i386                 randconfig-a012-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a013-20220627
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220627
s390                 randconfig-r044-20220627
riscv                randconfig-r042-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
mips                          rm200_defconfig
powerpc                     skiroot_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64               randconfig-a005-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a004-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a005-20220627
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a002-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a004-20220627
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220629
hexagon              randconfig-r045-20220629
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
