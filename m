Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF21F5F237E
	for <lists+linux-input@lfdr.de>; Sun,  2 Oct 2022 16:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiJBOMj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Oct 2022 10:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiJBOMh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Oct 2022 10:12:37 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198AE399D0
        for <linux-input@vger.kernel.org>; Sun,  2 Oct 2022 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664719957; x=1696255957;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HFuTzMUwbHI1yjkJ1ST1pQ0PcWCWLMo9zFAbdn3ZdyI=;
  b=nfys+NFpRPHDum0IG99SgB6uPHnzcEFF8kkGW2zI3qcaBCt8n7H+aNri
   yud31CYLjG7i5b1y+JqUwOPKO7j9BemJBx47nIao1gJs8AYo0BVZN8sOb
   9RDP1zh1pzOANRcFkMP2gicyC9MaDcrIUXwfJdQIQGGBXgi8mgGkLOTE9
   aWHdOTfcPIz3LiDsfLDfJJLi3QrlcPBrzkrHEmx4wsOziMs76W0SqsAMZ
   S6HhvZRblWp/CokXX9HYs1XRimn0Lduz1amDRh/3pMB6q/YRaoFnF0rSl
   c168X+La79gK3vPu7cDG/IadfSOE+TFiqJB9A9j4JOR1S4mbVbjBMbGee
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="388769701"
X-IronPort-AV: E=Sophos;i="5.93,363,1654585200"; 
   d="scan'208";a="388769701"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2022 07:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="952077666"
X-IronPort-AV: E=Sophos;i="5.93,363,1654585200"; 
   d="scan'208";a="952077666"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2022 07:12:35 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oezhr-0003hW-0v;
        Sun, 02 Oct 2022 14:12:35 +0000
Date:   Sun, 02 Oct 2022 22:11:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 27d8537f3a32a655fa528e529f1feaf5b31b9b41
Message-ID: <63399c22.JuDUUVfNWMkj/0DV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 27d8537f3a32a655fa528e529f1feaf5b31b9b41  Input: i8042 - fix refount leak on sparc

elapsed time: 937m

configs tested: 87
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
x86_64                              defconfig
alpha                               defconfig
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                          randconfig-a005
m68k                             allyesconfig
arc                  randconfig-r043-20221002
i386                          randconfig-a003
powerpc                           allnoconfig
s390                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a014
arm                                 defconfig
x86_64                           allyesconfig
s390                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a001
mips                             allyesconfig
sh                               allmodconfig
arm64                            allyesconfig
i386                                defconfig
alpha                            allyesconfig
x86_64                        randconfig-a013
m68k                             allmodconfig
arm                              allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a004
arc                              allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                             allyesconfig
csky                                defconfig
m68k                       m5475evb_defconfig
mips                           ip32_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                        cell_defconfig
nios2                         3c120_defconfig
m68k                           virt_defconfig
powerpc                 mpc834x_mds_defconfig
arm                            lart_defconfig
arm                         lpc18xx_defconfig
powerpc                  storcenter_defconfig
i386                          randconfig-c001
m68k                        m5407c3_defconfig
ia64                            zx1_defconfig
arm                      jornada720_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                  randconfig-c002-20221002
x86_64                        randconfig-c001
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a006
hexagon              randconfig-r041-20221002
hexagon              randconfig-r045-20221002
riscv                randconfig-r042-20221002
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
s390                 randconfig-r044-20221002
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a014
x86_64                        randconfig-a003
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
