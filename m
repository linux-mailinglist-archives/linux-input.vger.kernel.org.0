Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E9F4B9F6C
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 12:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240040AbiBQLyE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 06:54:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233749AbiBQLyE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 06:54:04 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DD7291FA6
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645098829; x=1676634829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xWW9MhUhwtvErVIWbpcYWoWnb0r1U9w7lWn6Em0RCtc=;
  b=k/Hum8ScKIZo5c0dFva8xhGRWH2e9qfDu+RK2QB2UTYetIq05v6cxaDB
   oXPif2Fjp67NgdIVjQE8I7YJD8Phccjn6Xq4KjO/Aakl0qNpEyEoH+zaR
   jPNElzrw+Yn4hHC/agLBhz6CtuXPMLwBHE83ousHrROP0tacjMXHaYz+Q
   FvBCSUS3xag+tzwi6+sgIRvyb3q/SQmgHVJx0TEsUY0x9hsHpqGkYBoM6
   lX1u0u82f/5ujd4+0JiH5lAxe1rKz5tLh5OgohixWA8Jg422fKjjX8qA1
   l4fM+6Y/dF7AAvPTsJb9ZYS9s1MiTrK9ywR0N/uwtmxqI5kvMlQJXsQoT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="238260271"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="238260271"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 03:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="502060977"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Feb 2022 03:53:48 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nKfM3-00009F-F7; Thu, 17 Feb 2022 11:53:47 +0000
Date:   Thu, 17 Feb 2022 19:53:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jiri Kosina <jkosina@suse.cz>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org
Subject: [hid:for-5.18/apple 9/9] input-leds.c:undefined reference to
 `led_classdev_unregister'
Message-ID: <202202171901.BwyfQMby-lkp@intel.com>
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
head:   4ea1e06cd2f1db285e662ef20f78fff5f5f32824
commit: 4ea1e06cd2f1db285e662ef20f78fff5f5f32824 [9/9] HID: apple: properly reflect LEDS dependency
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20220217/202202171901.BwyfQMby-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=4ea1e06cd2f1db285e662ef20f78fff5f5f32824
        git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
        git fetch --no-tags hid for-5.18/apple
        git checkout 4ea1e06cd2f1db285e662ef20f78fff5f5f32824
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/input/input-leds.o: in function `input_leds_disconnect':
>> input-leds.c:(.text+0x18): undefined reference to `led_classdev_unregister'
   /usr/bin/ld: drivers/input/input-leds.o: in function `input_leds_connect':
>> input-leds.c:(.text+0x24c): undefined reference to `led_classdev_register_ext'
>> /usr/bin/ld: input-leds.c:(.text+0x2b3): undefined reference to `led_classdev_unregister'
   /usr/bin/ld: drivers/hid/hid-apple.o: in function `apple_probe':
   hid-apple.c:(.text+0x7d2): undefined reference to `devm_led_classdev_register_ext'
   collect2: error: ld returned 1 exit status

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LEDS_CLASS
   Depends on NEW_LEDS
   Selected by
   - HID_APPLE && INPUT && HID

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
