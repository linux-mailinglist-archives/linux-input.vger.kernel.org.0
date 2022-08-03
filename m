Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A955886DB
	for <lists+linux-input@lfdr.de>; Wed,  3 Aug 2022 07:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbiHCFny (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Aug 2022 01:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233757AbiHCFnx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Aug 2022 01:43:53 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574084333C
        for <linux-input@vger.kernel.org>; Tue,  2 Aug 2022 22:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659505432; x=1691041432;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MAWIa6/KnyqEa1fLyBUYirIYHkrcXs90cKU8DHdmKhc=;
  b=D/+3lkq7x2TVh31pQrHKiH7uncCvG9wMTYqpzivJ1LemzG1sS7D6YKWM
   M7+dj21i2HjezdCvH4vFsK5/AXVCHG1g2SO3dajF9/Wqv7ZygwtxDZRi0
   5WUYzcNs+B31CbosaeBudbPLYc56J1Jucus2TQLuCcovyarAcW4a1s9mT
   nMCpAxrVJXWmlnjDpwN+njhOulR4pJtEXugGomTbLI1hLzQaI46X+knSE
   NCBN6y9zzgiWgmiOfC+vqkS9Hl5h3tdbpoAGEK+Z5DCRnqNcIjFp2Hc/c
   uCMqkkNjbG/U+hzU6T4YFtxWb5rx7+5joNZjrpB2lNf7503lnlJMKIBdh
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="315445335"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="315445335"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 22:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="930251905"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2022 22:43:50 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oJ7Ac-000Gsp-0v;
        Wed, 03 Aug 2022 05:43:50 +0000
Date:   Wed, 03 Aug 2022 13:43:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 7c744d00990ea999d27f306f6db5ccb61b1304b2
Message-ID: <62ea0b00.n4UpkJcA02HizL8I%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 7c744d00990ea999d27f306f6db5ccb61b1304b2  Input: adc-joystick - fix ordering in adc_joystick_probe()

elapsed time: 707m

configs tested: 82
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
x86_64               randconfig-a011-20220801
x86_64               randconfig-a012-20220801
x86_64               randconfig-a013-20220801
x86_64               randconfig-a014-20220801
s390                 randconfig-r044-20220801
i386                             allyesconfig
riscv                randconfig-r042-20220801
arm                                 defconfig
x86_64               randconfig-a015-20220801
sh                               allmodconfig
x86_64               randconfig-a016-20220801
arc                  randconfig-r043-20220801
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
arm                              allyesconfig
arm64                            allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                 randconfig-a016-20220801
i386                 randconfig-a013-20220801
i386                 randconfig-a015-20220801
i386                 randconfig-a012-20220801
i386                 randconfig-a011-20220801
i386                 randconfig-a014-20220801
xtensa                         virt_defconfig
powerpc                      makalu_defconfig
m68k                          atari_defconfig
arc                      axs103_smp_defconfig
m68k                             allmodconfig
ia64                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64               randconfig-k001-20220801
i386                 randconfig-c001-20220801
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
loongarch                           defconfig
loongarch                         allnoconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                       omap2plus_defconfig
sh                         apsh4a3a_defconfig
nios2                         3c120_defconfig

clang tested configs:
x86_64               randconfig-a003-20220801
x86_64               randconfig-a004-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a002-20220801
x86_64               randconfig-a005-20220801
x86_64               randconfig-a006-20220801
i386                 randconfig-a003-20220801
hexagon              randconfig-r041-20220801
i386                 randconfig-a004-20220801
i386                 randconfig-a005-20220801
i386                 randconfig-a001-20220801
hexagon              randconfig-r045-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a006-20220801
arm                   milbeaut_m10v_defconfig
powerpc                      obs600_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                    gamecube_defconfig
s390                             alldefconfig
arm                         mv78xx0_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
