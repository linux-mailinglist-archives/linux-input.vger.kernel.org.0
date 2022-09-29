Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CEF5EFE65
	for <lists+linux-input@lfdr.de>; Thu, 29 Sep 2022 22:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiI2UIU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Sep 2022 16:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiI2UIT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Sep 2022 16:08:19 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E157B1C4
        for <linux-input@vger.kernel.org>; Thu, 29 Sep 2022 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664482098; x=1696018098;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vw5blpvVoDpjpuiLF7RUZmmIm7Di+lkcLxYXteAd9p8=;
  b=gV6DFx7fPBLjT86SjNKUZVrj1rMnF1nRnfiskvRvg67HcRm3Tb8x7GWm
   jUvQ00IF8HM5c42VAoAMvE2i96az6f8eN90BsN6Xqdo/51CImxl56iQFe
   Elo4fRtmcNauhZOBxksQP/LiNXDlz/9/LSZptn+dOj6BQoOlSQUqaxwp/
   wr99Myu+g3SYUbPZynURlL0aCmVIOYpER8s0woY6KraJNKR5eu4If0Tg+
   T7bswidzneaV/ghRvdkd3+wb2gLsoskyvrPaz9hA0EQJ9AHeKvmbgtIAR
   UrBIplF2EqnQ9+eaW3T9+f51A/ZSzYiTJu2bHUVrKTt/ojN/lpEIJnPw0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="302929091"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; 
   d="scan'208";a="302929091"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 13:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="573599392"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; 
   d="scan'208";a="573599392"
Received: from lkp-server01.sh.intel.com (HELO 6126f2790925) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Sep 2022 13:08:16 -0700
Received: from kbuild by 6126f2790925 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odzpQ-0001bT-0W;
        Thu, 29 Sep 2022 20:08:16 +0000
Date:   Fri, 30 Sep 2022 04:07:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 fff1011a26d6cbf26b18c8ee4c61d99943174f8c
Message-ID: <6335fb18.GEd5yTnUzmPD+3nB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: fff1011a26d6cbf26b18c8ee4c61d99943174f8c  Input: xpad - add X-Box Adaptive Profile button

elapsed time: 1059m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64               randconfig-a002-20220926
sh                               allmodconfig
x86_64               randconfig-a004-20220926
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a006-20220926
x86_64               randconfig-a001-20220926
x86_64                               rhel-8.3
x86_64               randconfig-a003-20220926
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a005-20220926
x86_64                           rhel-8.3-syz
s390                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
i386                                defconfig
arm                                 defconfig
arc                  randconfig-r043-20220928
i386                 randconfig-a005-20220926
x86_64                        randconfig-a015
i386                 randconfig-a006-20220926
x86_64                        randconfig-a013
i386                 randconfig-a004-20220926
i386                 randconfig-a002-20220926
s390                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a011
arm64                            allyesconfig
i386                 randconfig-a003-20220926
i386                 randconfig-a001-20220926
arm                              allyesconfig
i386                             allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                  randconfig-r043-20220925
alpha                            allyesconfig
arc                              allyesconfig
riscv                randconfig-r042-20220925
s390                 randconfig-r044-20220925
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220928
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220928
x86_64                        randconfig-a016
riscv                randconfig-r042-20220928
x86_64                        randconfig-a012
s390                 randconfig-r044-20220928
i386                 randconfig-a012-20220926
i386                 randconfig-a011-20220926
hexagon              randconfig-r041-20220925
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
hexagon              randconfig-r045-20220925

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
