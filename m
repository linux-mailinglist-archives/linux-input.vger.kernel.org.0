Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5EC6C1D22
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 18:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbjCTRDo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Mar 2023 13:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbjCTRD3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Mar 2023 13:03:29 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D590367ED
        for <linux-input@vger.kernel.org>; Mon, 20 Mar 2023 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679331426; x=1710867426;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KXnjKqmCcr11NugobY56re5hOFjGQ92eBVQIKdKVwPE=;
  b=P00Y9gZq/LBLYP6Iy+8pWaoqfiYXYzBdiX2FrHsCy/+kRaMy7j10N56v
   8yAHzNL4zrV+8dEi2fz6fWDMtX6YxRoyQ6WVNVmKVWoLzCZeRw61derKr
   n3nUDh92KWYR+3dCdZlgHbeoopWimR2eWwB0kdH+NPDF8Ucdl30Yl2cPk
   yk0O/0osRnOE1hb1qwZ6fF7/4Fmal1PWVIHQbMIMBXBXYNv2sL6F52xvh
   bkYJZZW+Xv39ZQFnhLv2xi9X2OBhZ2llCqoS3f6JQIlfz8htZOHJqJ+bg
   iddWYAusA3GmhjaHOmAhPAoO31+Q2+yJsoBWqPMUkeD3gDMP3sfaZp5yN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="366437112"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="366437112"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 09:53:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674461230"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="674461230"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Mar 2023 09:53:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peIlZ-000BAU-0R;
        Mon, 20 Mar 2023 16:53:49 +0000
Date:   Tue, 21 Mar 2023 00:53:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 6906f5060d39f95aa0be30e998e0cc1179ba3d04
Message-ID: <64188f93.HT/gzS0+yi6DWl/D%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 6906f5060d39f95aa0be30e998e0cc1179ba3d04  Input: iqs62x-keys - suppress duplicated error message in .remove()

elapsed time: 727m

configs tested: 303
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230320   gcc  
alpha        buildonly-randconfig-r005-20230319   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230319   gcc  
alpha                randconfig-r011-20230319   gcc  
alpha                randconfig-r014-20230319   gcc  
alpha                randconfig-r023-20230319   gcc  
alpha                randconfig-r033-20230319   gcc  
alpha                randconfig-r035-20230319   gcc  
alpha                randconfig-r036-20230319   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230319   gcc  
arc          buildonly-randconfig-r003-20230319   gcc  
arc          buildonly-randconfig-r005-20230320   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r006-20230319   gcc  
arc                  randconfig-r024-20230319   gcc  
arc                  randconfig-r043-20230319   gcc  
arc                  randconfig-r043-20230320   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm          buildonly-randconfig-r005-20230319   gcc  
arm                                 defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                  randconfig-r003-20230319   clang
arm                  randconfig-r012-20230319   gcc  
arm                  randconfig-r013-20230319   gcc  
arm                  randconfig-r025-20230319   gcc  
arm                  randconfig-r032-20230319   clang
arm                  randconfig-r046-20230319   gcc  
arm                  randconfig-r046-20230320   clang
arm                           stm32_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230320   clang
csky                             alldefconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230319   gcc  
csky                 randconfig-r003-20230319   gcc  
csky                 randconfig-r006-20230319   gcc  
csky                 randconfig-r014-20230319   gcc  
csky                 randconfig-r022-20230319   gcc  
csky                 randconfig-r031-20230319   gcc  
csky                 randconfig-r033-20230319   gcc  
csky                 randconfig-r035-20230320   gcc  
hexagon      buildonly-randconfig-r001-20230319   clang
hexagon      buildonly-randconfig-r003-20230319   clang
hexagon      buildonly-randconfig-r004-20230319   clang
hexagon              randconfig-r001-20230319   clang
hexagon              randconfig-r004-20230320   clang
hexagon              randconfig-r021-20230319   clang
hexagon              randconfig-r022-20230319   clang
hexagon              randconfig-r032-20230319   clang
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r041-20230320   clang
hexagon              randconfig-r045-20230319   clang
hexagon              randconfig-r045-20230320   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230320   clang
i386                         debian-10.3-func   gcc  
i386                   debian-10.3-kselftests   gcc  
i386                        debian-10.3-kunit   gcc  
i386                          debian-10.3-kvm   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230320   clang
i386                          randconfig-a001   gcc  
i386                 randconfig-a002-20230320   clang
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230320   clang
i386                          randconfig-a003   gcc  
i386                 randconfig-a004-20230320   clang
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230320   clang
i386                          randconfig-a005   gcc  
i386                 randconfig-a006-20230320   clang
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230320   gcc  
i386                          randconfig-a011   clang
i386                 randconfig-a012-20230320   gcc  
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230320   gcc  
i386                          randconfig-a013   clang
i386                 randconfig-a014-20230320   gcc  
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230320   gcc  
i386                          randconfig-a015   clang
i386                 randconfig-a016-20230320   gcc  
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230319   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230319   gcc  
ia64                 randconfig-r021-20230319   gcc  
ia64                 randconfig-r033-20230319   gcc  
ia64                 randconfig-r036-20230319   gcc  
ia64                 randconfig-r036-20230320   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230320   gcc  
loongarch    buildonly-randconfig-r006-20230319   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230319   gcc  
loongarch            randconfig-r011-20230319   gcc  
loongarch            randconfig-r013-20230319   gcc  
loongarch            randconfig-r014-20230319   gcc  
loongarch            randconfig-r015-20230319   gcc  
loongarch            randconfig-r022-20230319   gcc  
loongarch            randconfig-r025-20230320   gcc  
loongarch            randconfig-r026-20230320   gcc  
loongarch            randconfig-r031-20230319   gcc  
loongarch            randconfig-r032-20230319   gcc  
loongarch            randconfig-r034-20230319   gcc  
m68k                             allmodconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230319   gcc  
m68k                 randconfig-r014-20230319   gcc  
m68k                 randconfig-r015-20230319   gcc  
m68k                 randconfig-r026-20230319   gcc  
m68k                 randconfig-r031-20230319   gcc  
m68k                           virt_defconfig   gcc  
microblaze   buildonly-randconfig-r001-20230319   gcc  
microblaze           randconfig-r005-20230319   gcc  
microblaze           randconfig-r014-20230319   gcc  
microblaze           randconfig-r026-20230319   gcc  
microblaze           randconfig-r034-20230319   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                          malta_defconfig   clang
mips                      maltasmvp_defconfig   gcc  
mips                 randconfig-r004-20230319   clang
mips                 randconfig-r005-20230319   clang
mips                 randconfig-r026-20230319   gcc  
mips                 randconfig-r034-20230320   gcc  
mips                           rs90_defconfig   clang
nios2                         3c120_defconfig   gcc  
nios2        buildonly-randconfig-r005-20230320   gcc  
nios2        buildonly-randconfig-r006-20230319   gcc  
nios2        buildonly-randconfig-r006-20230320   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230319   gcc  
nios2                randconfig-r003-20230319   gcc  
nios2                randconfig-r004-20230320   gcc  
nios2                randconfig-r005-20230320   gcc  
nios2                randconfig-r006-20230319   gcc  
nios2                randconfig-r015-20230319   gcc  
nios2                randconfig-r023-20230320   gcc  
nios2                randconfig-r026-20230319   gcc  
nios2                randconfig-r035-20230319   gcc  
nios2                randconfig-r036-20230319   gcc  
openrisc     buildonly-randconfig-r004-20230319   gcc  
openrisc             randconfig-r001-20230319   gcc  
openrisc             randconfig-r006-20230319   gcc  
openrisc             randconfig-r021-20230319   gcc  
openrisc             randconfig-r022-20230319   gcc  
openrisc             randconfig-r023-20230319   gcc  
openrisc             randconfig-r024-20230319   gcc  
openrisc             randconfig-r025-20230319   gcc  
openrisc             randconfig-r034-20230319   gcc  
openrisc             randconfig-r035-20230319   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230320   gcc  
parisc               randconfig-r022-20230319   gcc  
parisc               randconfig-r025-20230319   gcc  
parisc               randconfig-r031-20230319   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230319   clang
powerpc      buildonly-randconfig-r004-20230319   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                        icon_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
powerpc                 mpc834x_mds_defconfig   gcc  
powerpc                 mpc85xx_cds_defconfig   gcc  
powerpc                     pq2fads_defconfig   gcc  
powerpc              randconfig-r002-20230319   gcc  
powerpc              randconfig-r021-20230319   clang
powerpc              randconfig-r021-20230320   gcc  
powerpc              randconfig-r024-20230319   clang
powerpc              randconfig-r025-20230319   clang
powerpc              randconfig-r033-20230319   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230319   clang
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r001-20230320   clang
riscv                randconfig-r002-20230319   gcc  
riscv                randconfig-r004-20230319   gcc  
riscv                randconfig-r005-20230319   gcc  
riscv                randconfig-r006-20230319   gcc  
riscv                randconfig-r012-20230319   clang
riscv                randconfig-r016-20230319   clang
riscv                randconfig-r032-20230319   gcc  
riscv                randconfig-r036-20230319   gcc  
riscv                randconfig-r042-20230319   clang
riscv                randconfig-r042-20230320   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230319   clang
s390         buildonly-randconfig-r002-20230319   clang
s390                                defconfig   gcc  
s390                 randconfig-r001-20230320   clang
s390                 randconfig-r004-20230320   clang
s390                 randconfig-r006-20230320   clang
s390                 randconfig-r015-20230319   clang
s390                 randconfig-r023-20230319   clang
s390                 randconfig-r044-20230319   clang
s390                 randconfig-r044-20230320   gcc  
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh           buildonly-randconfig-r002-20230320   gcc  
sh           buildonly-randconfig-r004-20230319   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r006-20230320   gcc  
sh                   randconfig-r011-20230319   gcc  
sh                   randconfig-r023-20230319   gcc  
sh                   randconfig-r024-20230319   gcc  
sh                   randconfig-r032-20230319   gcc  
sh                   randconfig-r034-20230319   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc        buildonly-randconfig-r004-20230320   gcc  
sparc        buildonly-randconfig-r006-20230319   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230319   gcc  
sparc                randconfig-r004-20230319   gcc  
sparc                randconfig-r012-20230319   gcc  
sparc                randconfig-r015-20230319   gcc  
sparc                randconfig-r016-20230319   gcc  
sparc                randconfig-r021-20230319   gcc  
sparc                randconfig-r022-20230319   gcc  
sparc                randconfig-r024-20230320   gcc  
sparc                randconfig-r031-20230319   gcc  
sparc                randconfig-r035-20230319   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r001-20230319   gcc  
sparc64              randconfig-r011-20230319   gcc  
sparc64              randconfig-r016-20230319   gcc  
sparc64              randconfig-r025-20230319   gcc  
sparc64              randconfig-r033-20230319   gcc  
sparc64              randconfig-r035-20230319   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230320   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230320   clang
x86_64                        randconfig-a002   gcc  
x86_64               randconfig-a003-20230320   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230320   clang
x86_64                        randconfig-a004   gcc  
x86_64               randconfig-a005-20230320   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230320   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r006-20230320   clang
x86_64               randconfig-r022-20230320   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                              defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r002-20230319   gcc  
xtensa               randconfig-r003-20230319   gcc  
xtensa               randconfig-r003-20230320   gcc  
xtensa               randconfig-r004-20230319   gcc  
xtensa               randconfig-r013-20230319   gcc  
xtensa               randconfig-r031-20230319   gcc  
xtensa               randconfig-r033-20230320   gcc  
xtensa               randconfig-r034-20230319   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
