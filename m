Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8569B59105A
	for <lists+linux-input@lfdr.de>; Fri, 12 Aug 2022 13:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238492AbiHLLvA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Aug 2022 07:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238361AbiHLLun (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Aug 2022 07:50:43 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A81E6155
        for <linux-input@vger.kernel.org>; Fri, 12 Aug 2022 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660305042; x=1691841042;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xh5dZB66I8XXGZW5O8jryFPGrsD+1wDdlnNgAvwYmlU=;
  b=O2QJMtNai7+Pv42KcQoXm9mPS+5VyqjW8hMD/8o24/CZYmPzoIzY+mb8
   NW/OPvTMDBn0WZgOcjk5KaOkrK+F/csqu15sfRLTw0xHjrdmX8rQiSHD/
   ahdkADXtIYm4XXexf9NYOZKaJ8SIILRFS3L8vwCA+l0zn3Z6qT1sf6Wox
   Lpwltue3Zxmn3TIeWLRA/face90oIKPRT6VpmF7opHWzs0/pncylHa0wt
   2wREgUBkwSAmpFYWw1LwcKvJrSgr6VOLGkmhjR5iz4BV+lelWLtRwOYlL
   lsQZcm8SynQBVfVe1j0ntRE9C17nIWu7Rd9n88T7Qu8mVNB/C+glaxL8z
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="289149809"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="289149809"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 04:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="748173066"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2022 04:50:41 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oMTBY-0000UF-1S;
        Fri, 12 Aug 2022 11:50:40 +0000
Date:   Fri, 12 Aug 2022 19:50:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 93e719f661379c014f44bd83b361b1bc49ea7082
Message-ID: <62f63e7b.sE+oQdk39MxQaXxv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 93e719f661379c014f44bd83b361b1bc49ea7082  Input: applespi - use correct struct names in comment

elapsed time: 719m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220811
m68k                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                          randconfig-a014
x86_64                              defconfig
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
m68k                             allmodconfig
i386                          randconfig-a016
x86_64                        randconfig-a015
i386                          randconfig-a012
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
i386                          randconfig-a001
x86_64                          rhel-8.3-func
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
arm                              allyesconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220811
hexagon              randconfig-r045-20220811
x86_64                        randconfig-a012
riscv                randconfig-r042-20220811
s390                 randconfig-r044-20220811
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                        randconfig-a014
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
