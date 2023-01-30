Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20066816B5
	for <lists+linux-input@lfdr.de>; Mon, 30 Jan 2023 17:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235958AbjA3QnW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Jan 2023 11:43:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237741AbjA3QnO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Jan 2023 11:43:14 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CBB199D6
        for <linux-input@vger.kernel.org>; Mon, 30 Jan 2023 08:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675096991; x=1706632991;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CM8UpvzIUK7OCaOdeqIleft5jis8wvzkxvY5UxhQdG4=;
  b=b2uohl7zKIvLIxKX7qdoYRgZscKRiWttJHUp7JzG3XKTqRFZDVgpivOV
   g/AKkKoIJjuSkPbuWcwkFpF9ZcExsmQC9kJtyebWF78+S+Jn7iq6bvQIC
   PWd1Ws/hHihZ7kYtnMmw8uG4qC3gciLelDL0j7UxipvzAiGBR3yqC43Qr
   r7zsvxm6VAflHQ+e1lY3wIT4O3Pnu1zvubrokV5l+gkuSg/Xe1CJQS2X+
   yPldbwmf0RpLzEn//x/2q36oj8vD2NUqkXEpYPsj9SaqnqaUzSXgYgArZ
   S33ORorxmyRZ2U21UVX/NCf13x6CyggCg3RNMvuTsgxanGjXj350B8QP4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325303709"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="325303709"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 08:43:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806745710"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="806745710"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 08:43:10 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMXFN-0003l0-23;
        Mon, 30 Jan 2023 16:43:09 +0000
Date:   Tue, 31 Jan 2023 00:42:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 04f8b4ea20c85f579e8bbcd9da138779e9d4d36f
Message-ID: <63d7f389.XFgGBBme7q6JNHpv%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 04f8b4ea20c85f579e8bbcd9da138779e9d4d36f  Input: pmic8xxx-keypad - fix a Kconfig spelling mistake & hyphenation

elapsed time: 720m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
x86_64                            allnoconfig
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a002-20230130
i386                 randconfig-a005-20230130
x86_64               randconfig-a001-20230130
arc                                 defconfig
x86_64                              defconfig
x86_64               randconfig-a003-20230130
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
x86_64                               rhel-8.3
x86_64               randconfig-a004-20230130
alpha                               defconfig
x86_64               randconfig-a002-20230130
x86_64               randconfig-a006-20230130
s390                                defconfig
x86_64               randconfig-a005-20230130
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                           allyesconfig
i386                                defconfig
arm                                 defconfig
arc                  randconfig-r043-20230129
arm                  randconfig-r046-20230129
s390                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
i386                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a016-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a014-20230130
hexagon              randconfig-r041-20230129
riscv                randconfig-r042-20230129
riscv                randconfig-r042-20230130
s390                 randconfig-r044-20230129
hexagon              randconfig-r045-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
s390                 randconfig-r044-20230130
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
x86_64               randconfig-a014-20230130
x86_64               randconfig-a012-20230130
x86_64               randconfig-a015-20230130

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
