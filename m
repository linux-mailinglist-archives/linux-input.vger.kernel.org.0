Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1A96E566
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2019 14:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfGSMJ3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jul 2019 08:09:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:12983 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727994AbfGSMJ3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jul 2019 08:09:29 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jul 2019 05:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,282,1559545200"; 
   d="scan'208";a="319949755"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2019 05:09:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hoRhW-0001dP-V4; Fri, 19 Jul 2019 20:09:26 +0800
Date:   Fri, 19 Jul 2019 20:08:47 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Ronald =?unknown-8bit?B?VHNjaGFsw6Ry?= <ronald@innovation.ch>
Cc:     kbuild-all@01.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [input:next 2292/2295] drivers/input/keyboard/applespi.c:948:34:
 sparse: sparse: cast from restricted __le16
Message-ID: <201907192031.PePbN1Pn%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/dtor/input.git next
head:   771a081e44a9baa1991ef011cc453ef425591740
commit: 038b1a05eae6666b731920e46f47d8e2332e07ff [2292/2295] Input: add Apple SPI keyboard and trackpad driver
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        git checkout 038b1a05eae6666b731920e46f47d8e2332e07ff
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/input/keyboard/applespi.c:948:34: sparse: sparse: cast from restricted __le16
>> drivers/input/keyboard/applespi.c:948:34: sparse: sparse: cast from restricted __le16
>> drivers/input/keyboard/applespi.c:948:34: sparse: sparse: cast from restricted __le16
>> drivers/input/keyboard/applespi.c:948:34: sparse: sparse: cast from restricted __le16
>> drivers/input/keyboard/applespi.c:948:34: sparse: sparse: cast from restricted __le16
>> drivers/input/keyboard/applespi.c:948:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:949:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:949:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:949:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:949:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:949:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:949:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:950:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:950:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:950:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:950:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:950:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:950:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:951:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:951:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:951:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:951:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:951:34: sparse: sparse: cast from restricted __le16
   drivers/input/keyboard/applespi.c:951:34: sparse: sparse: cast from restricted __le16
>> drivers/input/keyboard/applespi.c:1615:37: sparse: sparse: incorrect type in argument 1 (different type sizes) @@    expected unsigned short [usertype] *name @@    got ype] *name @@
>> drivers/input/keyboard/applespi.c:1615:37: sparse:    expected unsigned short [usertype] *name
>> drivers/input/keyboard/applespi.c:1615:37: sparse:    got char *
>> drivers/input/keyboard/applespi.c:1957:25: sparse: sparse: symbol 'applespi_pm_ops' was not declared. Should it be static?

vim +948 drivers/input/keyboard/applespi.c

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
