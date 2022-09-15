Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E095B9242
	for <lists+linux-input@lfdr.de>; Thu, 15 Sep 2022 03:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiIOBnM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 21:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiIOBnK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 21:43:10 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334BB8E0D1
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 18:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663206190; x=1694742190;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7JFoaxiV0iG+8MD6uL9H0qjFTgGfOKF0XUjhc0E5Dc8=;
  b=JKBhUNHr716epYtr5Ys4Bzgh91pwxxImFclcT8loO3orlSqA001QHeE9
   kozm866txG/qGCPbHnizLEwkMWiw7KdAgx5B2CUvnCVm+qlNBTSRP4DR3
   Zh+xpEQgQwOVSF2f80jjhmie2enpes+noqhlVjRFGCzukSBvCYtssxNDx
   8jDR/hwXPniBDI12cOpvzAAH/VF8JbAvO3f6iRWaxG2uHF8tXx8V4lQZ+
   gsoEMI0Vn9Xd3raQ5hKYNgo2UCxxg7MCjPsNMXMs92J59X2TD1/Yf6Iua
   MUvUvzQnNsqog4Avwq3gXMT/fh3EDNM4VtZjFPrk1koKmNol7pYtvQD10
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="298583693"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="298583693"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 18:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="685529378"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2022 18:43:06 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYduE-0000mH-01;
        Thu, 15 Sep 2022 01:43:06 +0000
Date:   Thu, 15 Sep 2022 09:42:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 7984b43542070f5888546d95b48003c4a8af7c0f
Message-ID: <6322830b.ss+EV/jH3zW90G8r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 7984b43542070f5888546d95b48003c4a8af7c0f  Input: synaptics - enable InterTouch for the ThinkPad P1 G3

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
alpha                               defconfig
arc                                 defconfig
s390                             allmodconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                               rhel-8.3
i386                          randconfig-a001
x86_64                        randconfig-a006
i386                          randconfig-a003
x86_64                           rhel-8.3-syz
s390                                defconfig
x86_64                           allyesconfig
i386                          randconfig-a005
arm                                 defconfig
arc                  randconfig-r043-20220914
x86_64                        randconfig-a013
i386                             allyesconfig
x86_64                        randconfig-a011
x86_64                         rhel-8.3-kunit
powerpc                           allnoconfig
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
i386                          randconfig-a016
i386                          randconfig-a014
x86_64                          rhel-8.3-func
s390                             allyesconfig
i386                          randconfig-a012
sh                               allmodconfig
ia64                             allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
arm                              allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
hexagon              randconfig-r041-20220914
s390                 randconfig-r044-20220914
x86_64                        randconfig-a005
i386                          randconfig-a006
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220914
i386                          randconfig-a004
riscv                randconfig-r042-20220914
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
