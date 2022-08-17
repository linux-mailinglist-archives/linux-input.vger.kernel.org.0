Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFEF596CC4
	for <lists+linux-input@lfdr.de>; Wed, 17 Aug 2022 12:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiHQKW3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Aug 2022 06:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbiHQKWT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Aug 2022 06:22:19 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4008A6BD55
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 03:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660731738; x=1692267738;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nWvIvHxE1iHp7a0uHMYHX5f0VRzm6PeAPpf6f0l3bbk=;
  b=hb0zFMXliGtywKMkkmd1IDzRhLvct4XuUdwuGDRXhk+YV0WMDl9jiQ4P
   mEa8r7Kuxzm300Su742tnWAmfkVSCeA+jodu9NOtFhc8MdF64owCBteE0
   xQ+f9/UhU8OMd1NA0RleB6HtHkzJjYKThr0ZH2VICI6TY+1iEjhsVgmaJ
   EyIDEh4xHOLGPdCaqdnh7fjUX+jaXSvDL6hvmuQ2oc6i+lzTZeIvQpC0W
   un1yjFZ7FTGgP+zeEVaTJ0SbbvFbP7nl1kIYgOuYYijF/xdwyXAHt++yn
   EDfcSFe6AQu4pI6A52AE3mvHSM7J9eRlaortE32ta7QdxpetaiFUiUClb
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="354201179"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="354201179"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 03:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="636323017"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2022 03:22:16 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oOGBk-0000oG-0F;
        Wed, 17 Aug 2022 10:22:16 +0000
Date:   Wed, 17 Aug 2022 18:21:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 900365814ee08a5ce481b8505b36b65f0101ffe2
Message-ID: <62fcc139.FBIg4zj4ybVGMrwd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 900365814ee08a5ce481b8505b36b65f0101ffe2  Input: adc-joystick - add polled input device support

elapsed time: 721m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allmodconfig
arc                              allyesconfig
arc                  randconfig-r043-20220815
alpha                            allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                             allyesconfig
i386                 randconfig-a003-20220815
i386                 randconfig-a005-20220815
i386                 randconfig-a002-20220815
i386                 randconfig-a001-20220815
i386                 randconfig-a006-20220815
i386                 randconfig-a004-20220815
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a001-20220815
x86_64               randconfig-a003-20220815
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a005-20220815
x86_64               randconfig-a004-20220815
x86_64                           rhel-8.3-syz
x86_64               randconfig-a002-20220815
x86_64               randconfig-a006-20220815
x86_64                              defconfig
arm                                 defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig

clang tested configs:
hexagon              randconfig-r045-20220815
hexagon              randconfig-r041-20220815
s390                 randconfig-r044-20220815
riscv                randconfig-r042-20220815
x86_64               randconfig-a013-20220815
x86_64               randconfig-a012-20220815
x86_64               randconfig-a016-20220815
x86_64               randconfig-a011-20220815
x86_64               randconfig-a015-20220815
x86_64               randconfig-a014-20220815
i386                 randconfig-a015-20220815
i386                 randconfig-a016-20220815
i386                 randconfig-a012-20220815
i386                 randconfig-a011-20220815
i386                 randconfig-a013-20220815
i386                 randconfig-a014-20220815

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
