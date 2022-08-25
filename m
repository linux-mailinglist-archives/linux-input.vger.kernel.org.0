Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0215A093F
	for <lists+linux-input@lfdr.de>; Thu, 25 Aug 2022 08:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbiHYG4d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 02:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiHYG4c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 02:56:32 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89ABA5007B
        for <linux-input@vger.kernel.org>; Wed, 24 Aug 2022 23:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661410591; x=1692946591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i5I91mhC1mrJAxtVLeqNQ0w7d9F6NPhaobzFQr+3va4=;
  b=VYAbnqFUIohnvitVUlGcsm919PJEEI1Btz5SEwBveLACJy/p56d2YnVm
   HGfidA62BT12i6UErG4wlOBiTNT7nTjLdA78nA9++rfID9p05XwiEaoba
   AkTmYfwOOirD0oXCZ0DBFMnwnYuXBrEmw/akO8lkRqA3YMEhd8ss7Otuy
   oL79J3FOMP2jYkz1xUVsVEzVx1w54lkugP88F6D72MK7OPnL+RPaG+4iH
   MXV+BtTzOdQb9tIST7ZByQkWeBqP5Z2Fca1JDdN6rLyIX1cq4C3DlGg1G
   bzzeeLkCAiw9U9/TSjHvLxiEqgJuye4ZnOYZzSqorJT1LcOFNkKsiBkgF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="291732066"
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; 
   d="scan'208";a="291732066"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 23:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; 
   d="scan'208";a="699346341"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2022 23:56:28 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oR6mx-0001oR-1q;
        Thu, 25 Aug 2022 06:56:27 +0000
Date:   Thu, 25 Aug 2022 14:56:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 80b9ebd3e478cd41526cbf84f80c3e0eb885d1d3
Message-ID: <63071d0c.o/H9wVN52auTRD3t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 80b9ebd3e478cd41526cbf84f80c3e0eb885d1d3  Input: goodix - add compatible string for GT1158

elapsed time: 2181m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
x86_64                        randconfig-a002
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                                defconfig
arc                  randconfig-r043-20220824
s390                 randconfig-r044-20220824
riscv                randconfig-r042-20220824
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a013
i386                             allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a016
x86_64                        randconfig-a015
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
alpha                               defconfig
arc                                 defconfig
s390                                defconfig
s390                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
s390                             allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r041-20220824
hexagon              randconfig-r045-20220824
i386                          randconfig-a013
x86_64                        randconfig-a012
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
