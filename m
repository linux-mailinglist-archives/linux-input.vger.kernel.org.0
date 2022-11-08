Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C8D621754
	for <lists+linux-input@lfdr.de>; Tue,  8 Nov 2022 15:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbiKHOt4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Nov 2022 09:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbiKHOtz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Nov 2022 09:49:55 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3368F09
        for <linux-input@vger.kernel.org>; Tue,  8 Nov 2022 06:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667918994; x=1699454994;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fOjdY2nax4TULpWO8QXYy3FMxleVVQb8Nv9dxT16Tdc=;
  b=PVSsxEs4u9fRFQShD3WUsi6PZZWrv9daDstACef56BkHikN6owbj5Z02
   mE1wC8vx2LwVPvVZTM0DPot0HHvuuYa/gwtW3/JIt7ffVpIN7Q9k211fz
   uPwVdvK2LgNEy3UdPjHTGQXsSzp//P096o41BWsUwbqWpuwBEYOfudiiD
   9yWKTIIb/LvYSy5NqvzzrLZEQYgiZOVZJEjHaoN+DAwPPie4Auhk97d09
   1DSRrg4AP4WVQSw5tEWhqzqtbJ+M+gT6su95oLsDm5NKVIp3TRezd746X
   tPX03jJkGgSAHHoWowrOJae2SSxBQdQcFCdET7718hg4E/FqZ2YpMI9EV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="310706790"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="310706790"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 06:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="614298827"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="614298827"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Nov 2022 06:49:52 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osPvE-0000Pm-0r;
        Tue, 08 Nov 2022 14:49:52 +0000
Date:   Tue, 08 Nov 2022 22:49:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 6100a19c4fcfe154dd32f8a8ef4e8c0b1f607c75
Message-ID: <636a6c8b.QAUNTC4Fvhnm584x%lkp@intel.com>
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
branch HEAD: 6100a19c4fcfe154dd32f8a8ef4e8c0b1f607c75  Input: joystick - fix Kconfig warning for JOYSTICK_ADC

elapsed time: 1099m

configs tested: 56
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
m68k                             allyesconfig
s390                             allmodconfig
powerpc                           allnoconfig
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221107
x86_64                          rhel-8.3-func
sh                               allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
mips                             allyesconfig
arc                              allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
i386                                defconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                            allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                             pxa_defconfig
riscv                               defconfig
sh                            titan_defconfig
mips                  decstation_64_defconfig
powerpc                mpc7448_hpc2_defconfig
nios2                               defconfig

clang tested configs:
hexagon              randconfig-r041-20221107
hexagon              randconfig-r045-20221107
s390                 randconfig-r044-20221107
riscv                randconfig-r042-20221107
x86_64               randconfig-a014-20221107
x86_64               randconfig-a015-20221107
x86_64               randconfig-a013-20221107
x86_64               randconfig-a012-20221107
x86_64               randconfig-a011-20221107
x86_64               randconfig-a016-20221107
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
