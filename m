Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F3664B0B3
	for <lists+linux-input@lfdr.de>; Tue, 13 Dec 2022 09:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbiLMICK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Dec 2022 03:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234661AbiLMICC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Dec 2022 03:02:02 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12D019002
        for <linux-input@vger.kernel.org>; Tue, 13 Dec 2022 00:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670918518; x=1702454518;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zG4Wo6s0I4H6n/PhG8yT1eibosZ+fyNIIvjsgv7jdU8=;
  b=AgL7ArDfIHU44CDH5HT4rBbCLqE9Ymmd5wmNX0mHVwJqiWUBUkzVlOE5
   UW2t1Ip07Ai8rapsYBfvsAZrjj519IkVqui8tY8k0BBvJq+26vKq6O/a8
   HsNA8NgtjwPP2tqmuxgAeN2a0oy3TGIA0TUDpGjsYoO+JxeTK379zZT3C
   UNjRuVdPAW9ZQ8U1/hqy6pXCzWvfwse4DX00ppryb2Qdb2th3pzTK2BOU
   jnZCPp2JqbtpX597IKai0Yn2NkbQ/NdpJBehWp89eBRbFmojPEjmpCOAA
   dgZqX3sJ/0z0sJObosciDY1U/84sTU/9uFrNie1+qFHWRhF3qYEylIBCB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="316772589"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="316772589"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 00:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="755284209"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="755284209"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2022 00:01:53 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p50Ea-0004BI-2i;
        Tue, 13 Dec 2022 08:01:52 +0000
Date:   Tue, 13 Dec 2022 16:01:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 e291c116f60f3c1ca98090f0f8e7c77e658562fb
Message-ID: <63983168.8BiCFDFik71gxxMx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: e291c116f60f3c1ca98090f0f8e7c77e658562fb  Merge branch 'next' into for-linus

elapsed time: 724m

configs tested: 80
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a013-20221212
i386                 randconfig-a014-20221212
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a012-20221212
x86_64                          rhel-8.3-func
arc                                 defconfig
i386                                defconfig
i386                 randconfig-a011-20221212
sh                               allmodconfig
i386                 randconfig-a015-20221212
alpha                               defconfig
i386                             allyesconfig
i386                 randconfig-a016-20221212
mips                             allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64                              defconfig
arc                              allyesconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
m68k                             allyesconfig
s390                                defconfig
s390                             allmodconfig
arm                                 defconfig
x86_64                           allyesconfig
x86_64               randconfig-a013-20221212
x86_64               randconfig-a011-20221212
x86_64               randconfig-a012-20221212
x86_64               randconfig-a014-20221212
x86_64               randconfig-a015-20221212
x86_64               randconfig-a016-20221212
s390                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
riscv                randconfig-r042-20221212
arc                  randconfig-r043-20221211
arc                  randconfig-r043-20221212
arm                  randconfig-r046-20221211
s390                 randconfig-r044-20221212
x86_64                            allnoconfig
arm                        shmobile_defconfig
powerpc                     pq2fads_defconfig
sh                 kfr2r09-romimage_defconfig
openrisc                         alldefconfig
mips                        bcm47xx_defconfig
sh                          polaris_defconfig
arm                        spear6xx_defconfig
arm                          pxa910_defconfig
i386                          randconfig-c001
sh                               j2_defconfig
mips                           gcw0_defconfig
xtensa                          iss_defconfig

clang tested configs:
i386                 randconfig-a002-20221212
i386                 randconfig-a003-20221212
i386                 randconfig-a001-20221212
i386                 randconfig-a004-20221212
i386                 randconfig-a006-20221212
i386                 randconfig-a005-20221212
x86_64               randconfig-a002-20221212
arm                  randconfig-r046-20221212
x86_64               randconfig-a001-20221212
x86_64               randconfig-a004-20221212
riscv                randconfig-r042-20221211
x86_64               randconfig-a003-20221212
hexagon              randconfig-r045-20221211
hexagon              randconfig-r041-20221211
hexagon              randconfig-r045-20221212
s390                 randconfig-r044-20221211
hexagon              randconfig-r041-20221212
x86_64               randconfig-a005-20221212
x86_64               randconfig-a006-20221212

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
