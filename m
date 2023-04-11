Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31DEA6DCFD8
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 04:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjDKCqw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Apr 2023 22:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjDKCqw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Apr 2023 22:46:52 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F4D270E
        for <linux-input@vger.kernel.org>; Mon, 10 Apr 2023 19:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681181211; x=1712717211;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r07Jxy2jQhtLUjraPIr3h3BGrxuOx7k1VKF5BoKWpLY=;
  b=ijnDglFqfxqsjonFf3Gf8BRvID4sVdB0+HNgX6SUfJn39FzgGZJxNcTP
   LX+gpnAVX9mohbcgVjZK1EyHTJmiCWNtJpEQMPAbk7TDo4DOkRye4YE3e
   xIJXaLalnlO48O+EaB/2CKMGGM0gDl1/ILC9X03HUya1E3zb77iFdTfKe
   KZcXES/zjxwe2L9PCMGEMmARKJ968xQkc1xiWzeoLc7Cgy66pmTGlHyCn
   t+XtVrCNNtz8bptaCCgWZ+8clYPbIjS4UH/KXWDlEuigxItYZ7sg4Sa7Z
   9lZPVaMtgAUOINZIBbckRg1ocWx+VtHO3gZQMMRqnxK9/53am5OThimUm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="340997680"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="340997680"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 19:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="799721226"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="799721226"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2023 19:46:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pm41x-000Vr5-0b;
        Tue, 11 Apr 2023 02:46:49 +0000
Date:   Tue, 11 Apr 2023 10:46:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 b3d80fd27a3c2d8715a40cbf876139b56195f162
Message-ID: <6434ca0d.PUXKm6Tj4MigdB62%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: b3d80fd27a3c2d8715a40cbf876139b56195f162  Input: pegasus-notetaker - check pipe type when probing

elapsed time: 1445m

configs tested: 167
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230410   gcc  
alpha                randconfig-r013-20230410   gcc  
alpha                randconfig-r034-20230409   gcc  
alpha                randconfig-r034-20230410   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230409   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                        mvebu_v7_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r012-20230409   clang
arm                  randconfig-r012-20230410   clang
arm                  randconfig-r021-20230409   clang
arm                  randconfig-r033-20230410   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm                         s3c6400_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230409   clang
csky         buildonly-randconfig-r006-20230410   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230409   gcc  
csky                 randconfig-r006-20230409   gcc  
csky                 randconfig-r022-20230410   gcc  
csky                 randconfig-r025-20230410   gcc  
hexagon              randconfig-r011-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230410   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                          tiger_defconfig   gcc  
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230410   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230409   gcc  
m68k                 randconfig-r023-20230410   gcc  
m68k                 randconfig-r032-20230409   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r032-20230410   gcc  
microblaze           randconfig-r033-20230410   gcc  
microblaze           randconfig-r035-20230409   gcc  
microblaze           randconfig-r036-20230410   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230410   gcc  
mips                           ip22_defconfig   clang
mips                           ip27_defconfig   clang
mips                 randconfig-r001-20230409   gcc  
mips                 randconfig-r011-20230410   clang
mips                 randconfig-r031-20230410   gcc  
mips                           rs90_defconfig   clang
nios2        buildonly-randconfig-r001-20230410   gcc  
nios2        buildonly-randconfig-r005-20230410   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r036-20230409   gcc  
openrisc             randconfig-r003-20230409   gcc  
openrisc             randconfig-r004-20230409   gcc  
openrisc             randconfig-r023-20230409   gcc  
openrisc             randconfig-r031-20230410   gcc  
parisc       buildonly-randconfig-r001-20230409   gcc  
parisc       buildonly-randconfig-r003-20230409   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230409   gcc  
parisc               randconfig-r014-20230409   gcc  
parisc               randconfig-r021-20230410   gcc  
parisc               randconfig-r022-20230409   gcc  
parisc               randconfig-r034-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                 mpc836x_mds_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc              randconfig-r016-20230409   gcc  
powerpc              randconfig-r016-20230410   gcc  
powerpc              randconfig-r033-20230409   clang
powerpc                     skiroot_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230410   gcc  
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230410   gcc  
s390         buildonly-randconfig-r005-20230409   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230409   gcc  
s390                 randconfig-r024-20230409   gcc  
s390                 randconfig-r025-20230409   gcc  
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                   randconfig-r011-20230409   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230410   gcc  
sparc                randconfig-r015-20230410   gcc  
sparc                randconfig-r032-20230409   gcc  
sparc                randconfig-r033-20230409   gcc  
sparc                randconfig-r035-20230409   gcc  
sparc64      buildonly-randconfig-r006-20230409   gcc  
sparc64              randconfig-r036-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64                        randconfig-k001   clang
x86_64               randconfig-r006-20230410   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230409   gcc  
xtensa               randconfig-r005-20230410   gcc  
xtensa               randconfig-r024-20230410   gcc  
xtensa               randconfig-r034-20230410   gcc  
xtensa               randconfig-r035-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
