Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8F0759D82
	for <lists+linux-input@lfdr.de>; Wed, 19 Jul 2023 20:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjGSSgx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jul 2023 14:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjGSSgw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jul 2023 14:36:52 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671C31FEC
        for <linux-input@vger.kernel.org>; Wed, 19 Jul 2023 11:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689791805; x=1721327805;
  h=date:from:to:cc:subject:message-id;
  bh=1GfqQFQhTxYIWkUyCG/PGgZwnGbIbfQS1DIqrihxDFM=;
  b=SFIgrnUzRPVTKdOTkWAWlYmiAkTBTEkC3t50a/fE8UYy2neqqdLd12Ds
   8j7XY0vh+MWiR6KbOlwh2MApVzoeRN0cUlj1lEtZfct3gRn8QI0NBSaOQ
   wLTPEdWb7X+4Jzq7z0ssdlw8s1qyXZ0w4uuRkXQygkkfsAZPGP3eAuu68
   UYgaJBt41GaQJdH4eZ/JDSUL8AsMarqCwTyALyD1rO9nQH8cyGuGiYr2N
   u3F/RJFz2DtQ1NSVhsZcauszrcYkDtvTrwAeVAVDOr86H/dyYB0Z/4qcw
   QMGO23W0sbmVhlzSYb7oJiwgxSiE8ZnoGsgdIDojLKq4/Es/DxBeN02mB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397406550"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="397406550"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 11:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="837799645"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="837799645"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2023 11:36:41 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qMC2S-0005NL-1q;
        Wed, 19 Jul 2023 18:36:40 +0000
Date:   Thu, 20 Jul 2023 02:36:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 bf93349b11ab6f4a5861fbabe01236bf3d58075a
Message-ID: <202307200213.R4wqhD8N-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: bf93349b11ab6f4a5861fbabe01236bf3d58075a  Input: mms114 - add support for touch keys

elapsed time: 720m

configs tested: 142
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230718   gcc  
alpha                randconfig-r016-20230718   gcc  
alpha                randconfig-r036-20230718   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r033-20230718   gcc  
arc                  randconfig-r043-20230718   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                                 defconfig   gcc  
arm                          ixp4xx_defconfig   clang
arm                           omap1_defconfig   clang
arm                  randconfig-r001-20230718   clang
arm                  randconfig-r003-20230718   clang
arm                  randconfig-r033-20230718   clang
arm                  randconfig-r046-20230718   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230718   clang
arm64                randconfig-r012-20230718   clang
arm64                randconfig-r023-20230718   clang
csky                                defconfig   gcc  
csky                 randconfig-r023-20230718   gcc  
csky                 randconfig-r032-20230718   gcc  
csky                 randconfig-r034-20230718   gcc  
csky                 randconfig-r036-20230718   gcc  
hexagon              randconfig-r035-20230718   clang
hexagon              randconfig-r041-20230718   clang
hexagon              randconfig-r045-20230718   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230717   clang
i386         buildonly-randconfig-r004-20230718   gcc  
i386         buildonly-randconfig-r005-20230717   clang
i386         buildonly-randconfig-r005-20230718   gcc  
i386         buildonly-randconfig-r006-20230717   clang
i386         buildonly-randconfig-r006-20230718   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230718   gcc  
i386                 randconfig-i002-20230718   gcc  
i386                 randconfig-i003-20230718   gcc  
i386                 randconfig-i004-20230718   gcc  
i386                 randconfig-i005-20230718   gcc  
i386                 randconfig-i006-20230718   gcc  
i386                 randconfig-i011-20230718   clang
i386                 randconfig-i012-20230718   clang
i386                 randconfig-i013-20230718   clang
i386                 randconfig-i014-20230718   clang
i386                 randconfig-i015-20230718   clang
i386                 randconfig-i016-20230718   clang
i386                 randconfig-r001-20230718   gcc  
i386                 randconfig-r004-20230718   gcc  
i386                 randconfig-r034-20230718   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230718   gcc  
loongarch            randconfig-r034-20230718   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230718   gcc  
m68k                 randconfig-r006-20230718   gcc  
m68k                 randconfig-r022-20230718   gcc  
microblaze           randconfig-r021-20230718   gcc  
microblaze           randconfig-r032-20230718   gcc  
microblaze           randconfig-r033-20230718   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230718   clang
mips                 randconfig-r013-20230718   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230718   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r024-20230718   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc              randconfig-r014-20230718   clang
powerpc              randconfig-r015-20230718   clang
powerpc              randconfig-r025-20230718   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230718   gcc  
riscv                randconfig-r006-20230718   gcc  
riscv                randconfig-r031-20230718   gcc  
riscv                randconfig-r042-20230718   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230718   gcc  
s390                 randconfig-r044-20230718   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230718   gcc  
sh                           se7724_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230718   gcc  
sparc                randconfig-r025-20230718   gcc  
sparc                randconfig-r026-20230718   gcc  
sparc64              randconfig-r024-20230718   gcc  
sparc64              randconfig-r035-20230718   gcc  
sparc64              randconfig-r036-20230718   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230717   clang
x86_64       buildonly-randconfig-r001-20230718   gcc  
x86_64       buildonly-randconfig-r002-20230717   clang
x86_64       buildonly-randconfig-r002-20230718   gcc  
x86_64       buildonly-randconfig-r003-20230717   clang
x86_64       buildonly-randconfig-r003-20230718   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r021-20230718   clang
x86_64               randconfig-x001-20230718   clang
x86_64               randconfig-x002-20230718   clang
x86_64               randconfig-x003-20230718   clang
x86_64               randconfig-x004-20230718   clang
x86_64               randconfig-x005-20230718   clang
x86_64               randconfig-x006-20230718   clang
x86_64               randconfig-x011-20230718   gcc  
x86_64               randconfig-x012-20230718   gcc  
x86_64               randconfig-x013-20230718   gcc  
x86_64               randconfig-x014-20230718   gcc  
x86_64               randconfig-x015-20230718   gcc  
x86_64               randconfig-x016-20230718   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
