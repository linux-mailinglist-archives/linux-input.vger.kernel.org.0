Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBE161010C
	for <lists+linux-input@lfdr.de>; Thu, 27 Oct 2022 21:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiJ0TC5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Oct 2022 15:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235971AbiJ0TCz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Oct 2022 15:02:55 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E6222513
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666897372; x=1698433372;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x8S4ON823IRZQZNfu97omtKDvf9vU/7loWHIa30bXts=;
  b=GIjq13KN1t4W3p6Thl7JJa7cmmBck8z8PgMAZGtUbwYZYyIEkVT1CeCk
   2B1jNtGPWe26GDN7u/pWXRigJoiBWpS6accAXcLMcYdtSXaA7upVSCiNh
   mxhUgWBvA4S3U4eVqpOsDw4h+aVHMUc+z7gceu7uJL4kW6awXOWOREf/Z
   0IJY9VZ1mgnEhOaE0vLVac4G3CAHyNEhClv2YONX2y5NSEiBWio7U07uM
   WSLG93Hd13tfpmhEe8cXhbdyjXVGXLtLYkN1sMja8L55W4T431U/hQDOu
   pAHKooNwjQpkBk1L99XqnLqlQBFA1NT8/vh45FAxkfDx/afQgPg3zmYrq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="288033409"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="288033409"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 12:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="775106940"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="775106940"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2022 12:02:26 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oo893-00095L-2v;
        Thu, 27 Oct 2022 19:02:25 +0000
Date:   Fri, 28 Oct 2022 03:01:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:tmp-gpiolib-swnode] BUILD SUCCESS
 27103fbbe0c396313c7b89742b8dae15cd9d16ea
Message-ID: <635ad591.NpnYOpBHgxYl/6kP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tmp-gpiolib-swnode
branch HEAD: 27103fbbe0c396313c7b89742b8dae15cd9d16ea  gpiolib: add support for software nodes

elapsed time: 724m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                         rhel-8.3-kunit
s390                                defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
i386                          randconfig-a014
powerpc                           allnoconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
powerpc                          allmodconfig
mips                             allyesconfig
i386                          randconfig-a012
i386                                defconfig
s390                             allyesconfig
alpha                            allyesconfig
riscv                randconfig-r042-20221026
arm                                 defconfig
x86_64                        randconfig-a015
arc                  randconfig-r043-20221026
i386                          randconfig-a016
s390                 randconfig-r044-20221026
x86_64                               rhel-8.3
sh                               allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
i386                          randconfig-a001
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
i386                          randconfig-a003
i386                          randconfig-a005
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20221026
i386                          randconfig-a011
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221026
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
