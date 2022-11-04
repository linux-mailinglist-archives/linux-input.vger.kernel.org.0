Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7CA1619339
	for <lists+linux-input@lfdr.de>; Fri,  4 Nov 2022 10:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiKDJPL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Nov 2022 05:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiKDJPJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Nov 2022 05:15:09 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E40E3E
        for <linux-input@vger.kernel.org>; Fri,  4 Nov 2022 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667553309; x=1699089309;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F/JOJ3JRXrdUAdjDm0RUMKBkb4OR+MxowwKeQrsyxtY=;
  b=KrrbJ8021P/ccaFg5v6v5U1UjUkLSZd3ok++y64wWypXzu30iodnSEa+
   YuMUN1QrBywGjfdMqoQ6WlW4VpBD7W0gDr/RZX3u6BpNHw0a1MUrPRWwR
   P6fDrixQGFPPiStwea27HYAxv8dp/t9cVxC9lnPldd+c678ThCNxlV3fq
   bkUEdZjPWwRmVXuh6BAJNpW00igPQI8bRS0AXQ2djKu4+qrcYXTElQahN
   PYXrMfIjnMi83FDgCpQqo0cvSrIxqiLMWuOfKtHQEmh5r9BpDL7/laO8w
   FSV6tMD5pNVdGamJq45npbO4bvuarvaU1zRS4FqedHBEbFCUfJ1UP3YHf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="396223824"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="396223824"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 02:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="777651348"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="777651348"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2022 02:15:07 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oqsn5-000GpO-0I;
        Fri, 04 Nov 2022 09:15:07 +0000
Date:   Fri, 04 Nov 2022 17:14:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 c7e37cc6240767f794678d11704935d49cc81d59
Message-ID: <6364d7df.8vaZPof6rJD+bQjb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: c7e37cc6240767f794678d11704935d49cc81d59  Input: goodix - try resetting the controller when no config is set

elapsed time: 724m

configs tested: 81
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                                defconfig
sh                               allmodconfig
x86_64                              defconfig
s390                                defconfig
s390                             allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                               rhel-8.3
ia64                             allmodconfig
i386                          randconfig-a014
x86_64                           allyesconfig
m68k                             allmodconfig
i386                          randconfig-a012
s390                             allyesconfig
arc                              allyesconfig
i386                             allyesconfig
i386                          randconfig-a016
alpha                            allyesconfig
m68k                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
sh                        sh7763rdp_defconfig
riscv                randconfig-r042-20221102
arc                  randconfig-r043-20221102
s390                 randconfig-r044-20221102
i386                          randconfig-c001
arm                           u8500_defconfig
nios2                         10m50_defconfig
powerpc                   currituck_defconfig
mips                         cobalt_defconfig
parisc                           allyesconfig
powerpc                     rainier_defconfig
x86_64                           alldefconfig
powerpc                 mpc837x_mds_defconfig
riscv                randconfig-r042-20221104
arc                  randconfig-r043-20221104
s390                 randconfig-r044-20221104
powerpc                     taishan_defconfig
xtensa                  cadence_csp_defconfig
m68k                        m5307c3_defconfig
xtensa                         virt_defconfig
m68k                           sun3_defconfig
arm                        keystone_defconfig
arm                        spear6xx_defconfig
m68k                                defconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
riscv                          rv32_defconfig
arm                         bcm2835_defconfig
arm                         s3c2410_defconfig
x86_64                        randconfig-k001
mips                       rbtx49xx_defconfig
arm                       cns3420vb_defconfig
arm                     am200epdkit_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
