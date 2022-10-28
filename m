Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9D661120C
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 14:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiJ1M6n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 08:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiJ1M6l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 08:58:41 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2D91D29BE
        for <linux-input@vger.kernel.org>; Fri, 28 Oct 2022 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666961921; x=1698497921;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fGHQ5mdgCFHpDQjwX7hKvbm7k3vSQ7OPCEjwev2jXxs=;
  b=C4K8/sqGA0inBvJHDzTgX1higyk4Q1EMTyRN9d1aTXljico9OXVH9KcN
   nP1al/A0NDrvE94gpn5Cm2ku2uk/Nl3wTAwOLEq8NNT3iPvJ6t7iPwArK
   TCa76hirsazn1xwkmRyBmtfo2gau8T0xs38hIT1vJRulD/KsjMke79o08
   p6RlaBaQA1XeDfyd9BZqYD4q/HoASAVZ/FeeM7fW+3/popNSSd2v1c40s
   VAxadbUsyrvzNjZx0X8Wh2OAgYcgxsif30CIt+00xfpIHRXac4XgB0gSQ
   tE7Hr6mgWpFq3cq3tlKkp0wlo4awmDEIzeS/VWhfjwg3CHeRGnhxpyeQZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="307209265"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="307209265"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 05:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="696209818"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="696209818"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Oct 2022 05:58:39 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooOwZ-0009vL-0K;
        Fri, 28 Oct 2022 12:58:39 +0000
Date:   Fri, 28 Oct 2022 20:58:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD REGRESSION
 8deb2ff9f756dad75851039c88afad7a0e1fd666
Message-ID: <635bd1ef.xA9vq1rYMJ6XKPe6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 8deb2ff9f756dad75851039c88afad7a0e1fd666  dt-bindings: input: qcom,pm8921-pwrkey: convert to dt-schema

Error/Warning: (recently discovered and may have been fixed)

arch/arm/mach-s3c/mach-crag6410.c:183:19: error: 'KEY_VOLUMEUP' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:184:19: error: 'KEY_HOME' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:185:19: error: 'KEY_VOLUMEDOWN' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:186:19: error: 'KEY_HELP' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:187:19: error: 'KEY_MENU' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:188:19: error: 'KEY_MEDIA' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:190:19: error: 'KEY_DOWN' undeclared here (not in a function); did you mean 'KEY_ROW'?
arch/arm/mach-s3c/mach-crag6410.c:191:19: error: 'KEY_LEFT' undeclared here (not in a function); did you mean 'KERN_ALERT'?
arch/arm/mach-s3c/mach-crag6410.c:192:19: error: 'KEY_UP' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:193:19: error: 'KEY_RIGHT' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:194:19: error: 'KEY_CAMERA' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:210:27: error: 'KEY_SUSPEND' undeclared here (not in a function); did you mean 'PMSG_SUSPEND'?
arch/arm/mach-s3c/mach-crag6410.c:212:27: error: 'EV_KEY' undeclared here (not in a function); did you mean 'PF_KEY'?
arch/arm/mach-s3c/mach-crag6410.c:217:27: error: 'SW_FRONT_PROXIMITY' undeclared here (not in a function)
arch/arm/mach-s3c/mach-crag6410.c:219:27: error: 'EV_SW' undeclared here (not in a function)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm-allyesconfig
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:EV_KEY-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:EV_SW-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_CAMERA-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_DOWN-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_HELP-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_HOME-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_LEFT-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_MEDIA-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_MENU-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_RIGHT-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_SUSPEND-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_UP-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_VOLUMEDOWN-undeclared-here-(not-in-a-function)
    |-- arch-arm-mach-s3c-mach-crag6410.c:error:KEY_VOLUMEUP-undeclared-here-(not-in-a-function)
    `-- arch-arm-mach-s3c-mach-crag6410.c:error:SW_FRONT_PROXIMITY-undeclared-here-(not-in-a-function)

elapsed time: 720m

configs tested: 70
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
arc                                 defconfig
um                           x86_64_defconfig
alpha                               defconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                                defconfig
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
x86_64                        randconfig-a013
x86_64                               rhel-8.3
arc                  randconfig-r043-20221028
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                          rhel-8.3-func
s390                             allyesconfig
s390                 randconfig-r044-20221026
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64                        randconfig-a015
x86_64                           allyesconfig
i386                          randconfig-a012
sh                               allmodconfig
mips                             allyesconfig
i386                          randconfig-a016
i386                          randconfig-a014
m68k                             allmodconfig
riscv                randconfig-r042-20221026
arc                  randconfig-r043-20221026
riscv                randconfig-r042-20221028
arc                              allyesconfig
s390                 randconfig-r044-20221028
i386                             allyesconfig
alpha                            allyesconfig
arm                                 defconfig
i386                          randconfig-a005
i386                          randconfig-a003
i386                          randconfig-a001
m68k                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
csky                                defconfig
openrisc                            defconfig
i386                          randconfig-c001

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a012
i386                          randconfig-a011
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221026
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221028
x86_64                        randconfig-a016
i386                          randconfig-a015
hexagon              randconfig-r041-20221026
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
arm                         hackkit_defconfig
arm                         socfpga_defconfig
mips                      bmips_stb_defconfig
powerpc                     tqm5200_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
