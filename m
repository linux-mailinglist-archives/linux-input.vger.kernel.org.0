Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 226725E952C
	for <lists+linux-input@lfdr.de>; Sun, 25 Sep 2022 19:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbiIYR6I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Sep 2022 13:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbiIYR6H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Sep 2022 13:58:07 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3460D27CF1
        for <linux-input@vger.kernel.org>; Sun, 25 Sep 2022 10:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664128687; x=1695664687;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uRdhNUufF5BiPGZgjI4CwdwP9srbSdGOcO1LAqo9x8g=;
  b=fcJGo6JhWZF4qbRAaPMtxMq2wAx6zlNpnJ7MKmeHpQ5yhY4umNVg/BMu
   P904pvPArwTF21MyRfzBUV6hHx+jvP6vUqfmHwIeSNtqwhw+kTDOvWbmF
   rJpK8i9gtVeAd9bed2J20ARovHwTAhdiGmBzqz5HqHq1zZVlYkvcQMM5z
   eftzP59f55z1EWRTRDL7e2MsEuTMbUm34JpYnGNCeFE5YyqfX+zJwhy39
   V27LwTK/nztJZla9MXV9dqWj2rtk5NUn60rXdmG+RoqQEE7Ck67MR8vuC
   sU2HHZu6vs85NIZtLX7nFLXhpCWFZ0ktNwO8iEj3Bx3ESUV5MTHZhUPA4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="298484550"
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="298484550"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2022 10:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="598481506"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Sep 2022 10:58:05 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocVtE-0008FW-2F;
        Sun, 25 Sep 2022 17:58:04 +0000
Date:   Mon, 26 Sep 2022 01:57:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 2fd003ee8ade6b7f2777becc6f9917d7c313784f
Message-ID: <6330967f.OxddD517YRvuiPu9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 2fd003ee8ade6b7f2777becc6f9917d7c313784f  Input: synaptics - disable Intertouch for Lenovo T14 and P14s AMD G1

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20220925
x86_64                        randconfig-a013
x86_64                        randconfig-a011
riscv                randconfig-r042-20220925
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                        randconfig-a015
s390                 randconfig-r044-20220925
i386                                defconfig
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a004
arm                                 defconfig
x86_64                        randconfig-a006
x86_64                           rhel-8.3-kvm
i386                          randconfig-a001
i386                             allyesconfig
i386                          randconfig-a003
x86_64                          rhel-8.3-func
arm64                            allyesconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a005
ia64                             allmodconfig
arm                              allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig

clang tested configs:
x86_64                        randconfig-a014
hexagon              randconfig-r045-20220925
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20220925
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
