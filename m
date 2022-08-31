Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B865A8372
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 18:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbiHaQrZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Aug 2022 12:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbiHaQrY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Aug 2022 12:47:24 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB81D83DA
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 09:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661964443; x=1693500443;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jGRko6tSlku8iRCNIebninemjbFBP5GHVn9bsqLS/q8=;
  b=JtSDc7ZKi9HM0E8EpKQjO87eAtnGM3+Dllboq0WB0ay08OH9ipWL2aE+
   2l7mNraBiVvmYHuLdUriDu7m4bTV1w/mvP6xNxFCgvikHuM1n8GA0cKza
   gkGRDdEypUfYRci8Os15J6/ppy0iA+hGxNXaRYKbG7+dTsSP+cll/25CQ
   /7aKn645a9+kOhNe6pmmwVxoPrvgCpmmvmEAZ8ZcrEpvWhVHfSXJOlunT
   P/yduYcb3cbjw/1zsJ0X2R+KiHzbMSjbvpBGYeyvFuOWFd3XEnWeKWEli
   wn3JsxoYKCfY1mh9jxSm6/AZHyT7LvF8eUGZrF0GRd0K9rHKtD0punx7R
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="293070278"
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; 
   d="scan'208";a="293070278"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 09:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; 
   d="scan'208";a="680484046"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2022 09:47:19 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTQs3-0000UP-0n;
        Wed, 31 Aug 2022 16:47:19 +0000
Date:   Thu, 01 Sep 2022 00:46:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 4f35adaee07d182a4a7ef6b960c614ff3c5b4090
Message-ID: <630f9077.y+FQoTSbTmachxUE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 4f35adaee07d182a4a7ef6b960c614ff3c5b4090  Input: adp5588-keys - use new PM macros

elapsed time: 723m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                              defconfig
arm                                 defconfig
m68k                             allmodconfig
arc                  randconfig-r043-20220830
arc                              allyesconfig
x86_64                               rhel-8.3
sh                               allmodconfig
i386                          randconfig-a012
x86_64                           allyesconfig
i386                          randconfig-a016
alpha                            allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a004
x86_64                        randconfig-a011
i386                          randconfig-a005
x86_64                        randconfig-a002
x86_64                        randconfig-a006
m68k                             allyesconfig
arm                              allyesconfig
i386                             allyesconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a014
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
powerpc                          allmodconfig
mips                             allyesconfig
ia64                             allmodconfig

clang tested configs:
s390                 randconfig-r044-20220830
i386                          randconfig-a002
hexagon              randconfig-r045-20220830
riscv                randconfig-r042-20220830
i386                          randconfig-a004
i386                          randconfig-a013
hexagon              randconfig-r041-20220830
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a012
i386                          randconfig-a006
i386                          randconfig-a011
x86_64                        randconfig-a014

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
