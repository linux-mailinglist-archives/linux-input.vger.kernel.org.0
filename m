Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2AD5E95DB
	for <lists+linux-input@lfdr.de>; Sun, 25 Sep 2022 22:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiIYUYO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Sep 2022 16:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiIYUYN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Sep 2022 16:24:13 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7986528717
        for <linux-input@vger.kernel.org>; Sun, 25 Sep 2022 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664137452; x=1695673452;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1h46kohP7a0xm2sM06PfH1GdzGFU2rqcK5t+YSWTuw4=;
  b=dt8zJourUWk2/ONAuUISU8024PRYvXwsSAD3a43PZhxxwQ8pbpfZJuex
   7Kv2f26nnprrb4iSqNUJvarzZSULjbd/+QQM72GZFLPBvcxqEOCkjaXYZ
   4NmIL9X9cWFrJTxV7jSuYtSmliYgsDFSLFXgGawF/gwDfdk3zdOFrw8Hi
   qZn08Iy2dgphSvAoCw5Hh+H6uGjm86HdP6fu7+rMpvut9giEI4Dovq7DR
   5/yeGo7hlKNH1FtO1Z87tMP3cLRfnQ3kLd8nBVpk0YJJGtbRqN0a+WnLP
   19fN40mQC9S0jGvI10jpmWcrS5fj5PwyjAmI3Nd2rnMKwuEggR4EKZWJ+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="387183446"
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="387183446"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2022 13:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="598503462"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Sep 2022 13:24:10 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocYAb-0008M9-2w;
        Sun, 25 Sep 2022 20:24:09 +0000
Date:   Mon, 26 Sep 2022 04:23:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:gpio-test] BUILD SUCCESS
 215f6694ec3ebe4cfe7938e3800cd7c6a82e7edf
Message-ID: <6330b8dd.FxRbyA1DzxPHlsul%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git gpio-test
branch HEAD: 215f6694ec3ebe4cfe7938e3800cd7c6a82e7edf  soc: fsl: qe: switch to using gpiod API

elapsed time: 721m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20220925
riscv                randconfig-r042-20220925
x86_64                        randconfig-a002
i386                             allyesconfig
s390                 randconfig-r044-20220925
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
arm                                 defconfig
arc                                 defconfig
x86_64                               rhel-8.3
arm                              allyesconfig
s390                             allmodconfig
powerpc                          allmodconfig
x86_64                           allyesconfig
arm64                            allyesconfig
x86_64                        randconfig-a006
alpha                               defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
s390                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a013
x86_64                        randconfig-a004
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
mips                             allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a011
alpha                            allyesconfig
i386                          randconfig-a001
s390                             allyesconfig
i386                          randconfig-a003
m68k                             allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a005
i386                          randconfig-a016
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220925
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a002
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
