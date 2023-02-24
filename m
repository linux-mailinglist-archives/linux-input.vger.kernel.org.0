Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F646A21E8
	for <lists+linux-input@lfdr.de>; Fri, 24 Feb 2023 20:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjBXTAH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Feb 2023 14:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjBXTAG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Feb 2023 14:00:06 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE411B2D5
        for <linux-input@vger.kernel.org>; Fri, 24 Feb 2023 11:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677265205; x=1708801205;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I+tNCjAYGBlIdCAorajvlLq1aAoXhsvf0YdFMFtwSo8=;
  b=JmqrDrtaCTpZACtzQez3Q1sYY9dZXlS7JkN0iWpunqjfxmRAQGp8KYbB
   RRu1+KvRJaPBWhCoYLBsctFuVF3piCoXTqRx2nbrV480+US0Yy4vlf9uQ
   xnMq+lACn0dtASmc4wUk91ZVYrDjrR6Cek2zFVf3sMTGcZXCsKzmF4d94
   SnqavCaRNnz4vChfTLnGei/6OlSvSnRTvs4XIutesFmUPAMGHdy4eCQQS
   0iGHcKWdxtjvcoYdD7XeiyQUIvAHvkIUK2JvahNN+nm4blcXwanuKALYC
   yWPoElMc/wwJ9aSJXFF+x/7E/VuJg+NOwK7FvO5glNPZe4IRJX7suWz+O
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335791970"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="335791970"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 11:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="815839594"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="815839594"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2023 11:00:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pVdIZ-0002ev-0m;
        Fri, 24 Feb 2023 19:00:03 +0000
Date:   Sat, 25 Feb 2023 02:59:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 d5f7638eb5fed0eb12e45a127764c4111b11c50e
Message-ID: <63f908f8.qrnn94SjXOL2+KJG%lkp@intel.com>
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
branch HEAD: d5f7638eb5fed0eb12e45a127764c4111b11c50e  Input: matrix_keypad - replace header inclusions by forward declarations

elapsed time: 725m

configs tested: 19
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
clang                                   alpha   defconfig
gcc                                       arc   defconfig
gcc                                       arm   defconfig
gcc                                     arm64   defconfig
gcc                                      csky   defconfig
gcc                                      i386   defconfig
gcc                                      ia64   defconfig
gcc                                 loongarch   defconfig
gcc                                      m68k   defconfig
gcc                                     nios2   defconfig
gcc                                    parisc   defconfig
gcc                                  parisc64   defconfig
gcc                                     riscv   defconfig
gcc                                     riscv   rv32_defconfig
gcc                                      s390   defconfig
gcc                                     sparc   defconfig
gcc                                        um   i386_defconfig
gcc                                        um   x86_64_defconfig
gcc                                    x86_64   defconfig
gcc                                                  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
