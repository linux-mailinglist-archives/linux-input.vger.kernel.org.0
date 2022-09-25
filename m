Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD1E5E95DD
	for <lists+linux-input@lfdr.de>; Sun, 25 Sep 2022 22:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbiIYUYR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Sep 2022 16:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiIYUYQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Sep 2022 16:24:16 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F513286CF
        for <linux-input@vger.kernel.org>; Sun, 25 Sep 2022 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664137452; x=1695673452;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h74IuzdMCra7Z7R9QPHpbPw6tCgKlyewnQuBem33qPI=;
  b=DXt8MpeS7pvatR+/WLbfHXrfcuXPYo3wFNuDdAsLwBMcTa5RKpOch8CM
   319BGgOIFjYcQToIWxMEVq+0ElHCxs1LycqNrngFq7azkr9EAoKXaKF57
   UikgJv/TE7rawrTP9KC90eaGmMDIvEmpBkY3fbI6qEFvaQzsmUsX/K3Hy
   htyV4xDZcWvafwtkQlvKyUTd0fFVi+oC1oXooSuQXISsomWCagGIfH5gu
   I7JoiIoDQiI5yv9LWLSy5rnAYNyugO2tR1YewPj9f4U28+a2jYw8hEBAp
   xCVYVhWEOQq/5O1loR2l4NPIAqdzx94Cwykb+gdOSUKPW8OzLC7Uem5Fk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="364924191"
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="364924191"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2022 13:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="689324146"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Sep 2022 13:24:10 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocYAb-0008M6-2Z;
        Sun, 25 Sep 2022 20:24:09 +0000
Date:   Mon, 26 Sep 2022 04:23:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 5db8a0d31cab2798f693a360628dcafaee1ecce9
Message-ID: <6330b8d8.JneGH9K8TAtLq/3t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 5db8a0d31cab2798f693a360628dcafaee1ecce9  Input: joydev - fix comment typo

elapsed time: 720m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
arc                                 defconfig
x86_64                          rhel-8.3-func
s390                             allmodconfig
arc                  randconfig-r043-20220925
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a013
x86_64                        randconfig-a011
alpha                               defconfig
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a015
arm                                 defconfig
x86_64                        randconfig-a006
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a002
i386                          randconfig-a001
s390                 randconfig-r044-20220925
i386                          randconfig-a003
powerpc                          allmodconfig
s390                                defconfig
mips                             allyesconfig
x86_64                        randconfig-a004
riscv                randconfig-r042-20220925
powerpc                           allnoconfig
s390                             allyesconfig
i386                          randconfig-a016
arm64                            allyesconfig
i386                          randconfig-a014
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a005
m68k                             allmodconfig
i386                          randconfig-a012
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220925
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220925
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
