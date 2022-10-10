Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A945FA318
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 20:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiJJSC3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 14:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJJSC2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 14:02:28 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604A463FC7
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665424947; x=1696960947;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WQTFkn2hxmTBw3iyT3aWUHhkzxSD76saf0KUXAWY/QY=;
  b=jJsU1AfjjVLA5qf+Q8y1VkgodGg/wb6ns1fIlytYguZqEeMmBx9DZvaD
   TNVWht4ZocQFeowtlu7dliduYXRcrt2m/ITiZbxD1L96zBQTyAtCHnYU1
   tIQZaTok0qFJROSWTXuUVTb4gyyTKDjYcTdyOQBT50GZtsp/OgV2EX7vY
   rt71PnBlBsRrDN+4as1Jzs2+hmpG92vvg3lyjoprKqrkR+3to2AVctPJi
   xJDsEFSpETlBTRBdpltq9rcaUtaM+itcYSDr32DizYGXzp3QlF/xKl2tp
   wXweKo0FZOfbNokYulTkQdKyutVMHnbEPEqGiovLsxqyPxEos61Ghy55A
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="301907185"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="301907185"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 11:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="657027574"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="657027574"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Oct 2022 11:02:20 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ohx6a-00025i-0r;
        Mon, 10 Oct 2022 18:02:20 +0000
Date:   Tue, 11 Oct 2022 02:01:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 fe5b6aaef72a0f7daa06e7960e0bee45c2984e41
Message-ID: <63445df5.wtIFoNFAp4VnwxNR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: fe5b6aaef72a0f7daa06e7960e0bee45c2984e41  Input: i8042 - fix refount leak on sparc

elapsed time: 721m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                               defconfig
um                             i386_defconfig
arc                                 defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20221010
i386                                defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
s390                 randconfig-r044-20221010
x86_64                               rhel-8.3
s390                                defconfig
riscv                randconfig-r042-20221010
arm                                 defconfig
x86_64                           allyesconfig
i386                 randconfig-a015-20221010
powerpc                           allnoconfig
alpha                             allnoconfig
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
riscv                             allnoconfig
x86_64                           rhel-8.3-syz
csky                              allnoconfig
i386                 randconfig-a016-20221010
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
arc                               allnoconfig
m68k                             allmodconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
s390                             allyesconfig
x86_64               randconfig-a011-20221010
arm64                            allyesconfig
x86_64               randconfig-a016-20221010
arm                              allyesconfig
x86_64               randconfig-a014-20221010
i386                 randconfig-a011-20221010
x86_64               randconfig-a015-20221010
x86_64               randconfig-a012-20221010
x86_64               randconfig-a013-20221010
i386                 randconfig-a013-20221010
i386                 randconfig-a012-20221010
i386                 randconfig-a014-20221010
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20221010
hexagon              randconfig-r045-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a005-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a002-20221010
i386                 randconfig-a003-20221010
i386                 randconfig-a004-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a005-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a006-20221010

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
