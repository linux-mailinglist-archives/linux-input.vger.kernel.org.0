Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6840855E129
	for <lists+linux-input@lfdr.de>; Tue, 28 Jun 2022 15:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345146AbiF1LCB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jun 2022 07:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345185AbiF1LBa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jun 2022 07:01:30 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDFB2610A
        for <linux-input@vger.kernel.org>; Tue, 28 Jun 2022 04:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656414090; x=1687950090;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OB7wnENmtZBVWlSjAOgunst7Sm7CxK2y6w4WBI7R3Xs=;
  b=aeX/vRkBJu08eDc/HsIqqnamveEygr9BYtHg4rYcDlRP8YKt5zJuSN5g
   Ul4Brg4iqOJn1Vf9CG4BSgSEbh8dTsmj2G/sdVx8/AMIZjhP2zAMJeAm1
   MgQAqNbI3OvlcvkjOl/kcXMHXTpRXLMhLHhJSMdZO6ouxvnrJMPllN1M+
   Oxtzv32T6074eoQdtKp7g4HqJYwlMnjIIwa7rommfmw+7ILTnwxfjIThm
   U4GA3xtRTRfNPmozXAiItZYKEQX12ZU6uSzpcxu+ywjLYRk+zeuQ8QvUb
   ajh3zaeyzr2mA/q8FW5kPniE2yFC5obZLR8aifTLNUNemDDTYQJwtRyt0
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="281746963"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="281746963"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 04:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="646867186"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jun 2022 04:01:28 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o68yG-0009wF-1a;
        Tue, 28 Jun 2022 11:01:28 +0000
Date:   Tue, 28 Jun 2022 19:01:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 039d4ed3428cf9c2052048d177880ebd02104764
Message-ID: <62badf73.EMxDX1gom0b0Rm4e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 039d4ed3428cf9c2052048d177880ebd02104764  Input: usbtouchscreen - add driver_info sanity check

elapsed time: 725m

configs tested: 51
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64               randconfig-a012-20220627
x86_64               randconfig-a016-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a013-20220627
x86_64               randconfig-a014-20220627
x86_64               randconfig-a015-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a013-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a016-20220627
riscv                randconfig-r042-20220627
arc                  randconfig-r043-20220627
s390                 randconfig-r044-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a004-20220627
i386                 randconfig-a002-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a005-20220627
i386                 randconfig-a006-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
