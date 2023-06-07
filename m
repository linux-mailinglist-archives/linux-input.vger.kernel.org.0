Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8B2725610
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 09:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237800AbjFGHmB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 03:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237764AbjFGHle (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 03:41:34 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD3D1FD0
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686123540; x=1717659540;
  h=date:from:to:cc:subject:message-id;
  bh=GtIqi44ZT2aHC3gVrx7B9VN4xo2gXnhi21e5g/lzY60=;
  b=MXG5aO123ta7aAVKLm5Fqgom9Dc4juU0b+x+eIFSghyAGFKqwjSUBqD4
   2SuenJ5j0N92sujqo7JBh1mWLDUU9Ayr+vrWhNuHOT4yu/HPjdYohRCKo
   RHuqg+QLK47NMDHKr4ISUsLhsG/OR0R2XJd2OoraxmVnoCM1tGw9DC1Ms
   6uga1EEcstnBg3BazVn6YW9C11V1HcOalDhEfRzbpWYiDc9jHKOrHGzNr
   9aG5ZB9OY6tYaRnbwXPzkkiBHyv1Mrw1RzjtYVVD1ZHpGn0Nsb3fTDZTF
   pTSMrnjIQCSD6OxHs1GmBYreZasyYsKvVoJZhLKBt2aA8PPTf7bpgD8Ld
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="385231920"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="385231920"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 00:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883638768"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="883638768"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jun 2023 00:38:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q6nkl-0006Ju-2C;
        Wed, 07 Jun 2023 07:38:47 +0000
Date:   Wed, 07 Jun 2023 15:37:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 8c9cce9cb81b5fdc6e66bf3f129727b89e8daab7
Message-ID: <20230607073758.GKuJL%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 8c9cce9cb81b5fdc6e66bf3f129727b89e8daab7  Input: pm8941-powerkey - fix debounce on gen2+ PMICs

elapsed time: 722m

configs tested: 144
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230606   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r036-20230606   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230606   gcc  
arc                  randconfig-r016-20230606   gcc  
arc                  randconfig-r043-20230606   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r035-20230606   clang
arm                  randconfig-r046-20230606   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230606   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230606   clang
csky                                defconfig   gcc  
csky                 randconfig-r014-20230606   gcc  
csky                 randconfig-r021-20230606   gcc  
csky                 randconfig-r022-20230606   gcc  
csky                 randconfig-r031-20230606   gcc  
hexagon      buildonly-randconfig-r005-20230606   clang
hexagon              randconfig-r011-20230606   clang
hexagon              randconfig-r041-20230606   clang
hexagon              randconfig-r045-20230606   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230606   gcc  
i386                 randconfig-i002-20230606   gcc  
i386                 randconfig-i003-20230606   gcc  
i386                 randconfig-i004-20230606   gcc  
i386                 randconfig-i005-20230606   gcc  
i386                 randconfig-i006-20230606   gcc  
i386                 randconfig-i011-20230606   clang
i386                 randconfig-i012-20230606   clang
i386                 randconfig-i013-20230606   clang
i386                 randconfig-i014-20230606   clang
i386                 randconfig-i015-20230606   clang
i386                 randconfig-i016-20230606   clang
i386                 randconfig-i051-20230606   gcc  
i386                 randconfig-i052-20230606   gcc  
i386                 randconfig-i053-20230606   gcc  
i386                 randconfig-i054-20230606   gcc  
i386                 randconfig-i055-20230606   gcc  
i386                 randconfig-i056-20230606   gcc  
i386                 randconfig-i061-20230606   gcc  
i386                 randconfig-i062-20230606   gcc  
i386                 randconfig-i063-20230606   gcc  
i386                 randconfig-i064-20230606   gcc  
i386                 randconfig-i065-20230606   gcc  
i386                 randconfig-i066-20230606   gcc  
i386                 randconfig-r013-20230606   clang
i386                 randconfig-r015-20230606   clang
i386                 randconfig-r024-20230606   clang
i386                 randconfig-r034-20230606   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r022-20230606   gcc  
loongarch            randconfig-r026-20230606   gcc  
loongarch            randconfig-r032-20230606   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230606   gcc  
microblaze   buildonly-randconfig-r004-20230606   gcc  
microblaze           randconfig-r015-20230606   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230606   clang
mips         buildonly-randconfig-r006-20230606   clang
mips                 randconfig-r001-20230606   clang
mips                 randconfig-r025-20230606   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230606   gcc  
nios2                randconfig-r032-20230606   gcc  
openrisc             randconfig-r003-20230606   gcc  
parisc       buildonly-randconfig-r001-20230606   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230606   gcc  
parisc               randconfig-r012-20230606   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r033-20230606   gcc  
powerpc              randconfig-r034-20230606   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230606   clang
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230606   clang
riscv                randconfig-r025-20230606   clang
riscv                randconfig-r036-20230606   gcc  
riscv                randconfig-r042-20230606   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230606   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r006-20230606   gcc  
sh                   randconfig-r023-20230606   gcc  
sh                   randconfig-r035-20230606   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r031-20230606   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r004-20230606   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230606   gcc  
x86_64               randconfig-a002-20230606   gcc  
x86_64               randconfig-a003-20230606   gcc  
x86_64               randconfig-a004-20230606   gcc  
x86_64               randconfig-a005-20230606   gcc  
x86_64               randconfig-a006-20230606   gcc  
x86_64               randconfig-a011-20230606   clang
x86_64               randconfig-a012-20230606   clang
x86_64               randconfig-a013-20230606   clang
x86_64               randconfig-a014-20230606   clang
x86_64               randconfig-a015-20230606   clang
x86_64               randconfig-a016-20230606   clang
x86_64               randconfig-r005-20230606   gcc  
x86_64               randconfig-r026-20230606   clang
x86_64               randconfig-x051-20230606   clang
x86_64               randconfig-x052-20230606   clang
x86_64               randconfig-x053-20230606   clang
x86_64               randconfig-x054-20230606   clang
x86_64               randconfig-x055-20230606   clang
x86_64               randconfig-x056-20230606   clang
x86_64               randconfig-x061-20230606   clang
x86_64               randconfig-x062-20230606   clang
x86_64               randconfig-x063-20230606   clang
x86_64               randconfig-x064-20230606   clang
x86_64               randconfig-x065-20230606   clang
x86_64               randconfig-x066-20230606   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230606   gcc  
xtensa               randconfig-r002-20230606   gcc  
xtensa               randconfig-r024-20230606   gcc  
xtensa               randconfig-r033-20230606   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
