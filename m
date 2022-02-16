Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 639074B930A
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 22:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbiBPVQG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 16:16:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiBPVQG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 16:16:06 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7C92B0B0B
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 13:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645046152; x=1676582152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MOoxN1njQwdjq6AI4eRSswZaAGgK9AdDhhAh6VTw12Q=;
  b=irGifRH33K734wZ1/5OvdK7tEX+qAzOjy9oN3fmssiBBKhKD2xOFakEf
   7ox3Ki3YORNMkE+XQdsjRxDEZBpfKnTwawD2C43UtFQn6ObxCf6Zzz/GU
   55cYFc95uxliWYTHt133R7HbCOwjC1P+52CUvT+5nTlKEUUxMQtvWq0L0
   UU2YLHEj6hZdNsKhgVADOInQSSKIOSFfbq+MuXnGsMmpYiz3GvygeMnyC
   ahAQj5Lzlom8bhJN/GKHTHf+uc46mf0sL/DD4CgRF9UszOBr1Bl9TQMki
   TA00U6dfix+OIDVNdiaZIvG4wC+hnSyGReVZMQSTwq1sxAhqqKGLX6L5q
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250461297"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="250461297"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 13:15:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="704470608"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Feb 2022 13:15:50 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nKReP-000B7x-HV; Wed, 16 Feb 2022 21:15:49 +0000
Date:   Thu, 17 Feb 2022 05:14:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Pawlowski <paul@mrarm.io>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Aun-Ali Zaidi <admin@kodeit.net>,
        Aditya Garg <gargaditya08@live.com>
Subject: [hid:for-5.18/apple 6/8] hid-apple.c:undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202202170548.gIIZ5R9W-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-5.18/apple
head:   c5f09b1b45cbb90147846f82ec0489789c99667e
commit: 9018eacbe623b2c3535da37035e5f22d3d70b6ce [6/8] HID: apple: Add support for keyboard backlight on certain T2 Macs.
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20220217/202202170548.gIIZ5R9W-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=9018eacbe623b2c3535da37035e5f22d3d70b6ce
        git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
        git fetch --no-tags hid for-5.18/apple
        git checkout 9018eacbe623b2c3535da37035e5f22d3d70b6ce
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/hid/hid-apple.o: in function `apple_probe':
>> hid-apple.c:(.text+0x785): undefined reference to `devm_led_classdev_register_ext'
   collect2: error: ld returned 1 exit status

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
