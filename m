Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7854145B6D6
	for <lists+linux-input@lfdr.de>; Wed, 24 Nov 2021 09:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240722AbhKXIrf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Nov 2021 03:47:35 -0500
Received: from mga02.intel.com ([134.134.136.20]:15266 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229905AbhKXIq4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Nov 2021 03:46:56 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="222457320"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="222457320"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 00:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="475044776"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2021 00:43:41 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mpnsR-0004Xu-4X; Wed, 24 Nov 2021 08:43:39 +0000
Date:   Wed, 24 Nov 2021 16:43:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
        jikos@kernel.org
Cc:     kbuild-all@lists.01.org, benjamin.tissoires@redhat.com,
        peter.hutterer@who-t.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH 1/1] HID: multitouch: only map BTN_LEFT on buttonpads
Message-ID: <202111241646.G968t85X-lkp@intel.com>
References: <20211123191238.12472-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211123191238.12472-2-jose.exposito89@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi "José,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hid/for-next]
[also build test ERROR on v5.16-rc2 next-20211124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/Do-not-map-BTN_RIGHT-MIDDLE-on-buttonpads/20211124-031407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20211124/202111241646.G968t85X-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/67a7bd322df749f6ef9a142479668db93b93beca
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jos-Exp-sito/Do-not-map-BTN_RIGHT-MIDDLE-on-buttonpads/20211124-031407
        git checkout 67a7bd322df749f6ef9a142479668db93b93beca
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/hid/hid-multitouch.c: In function 'mt_touch_input_configured':
>> drivers/hid/hid-multitouch.c:1291:26: error: 'dev' undeclared (first use in this function); did you mean 'hdev'?
    1291 |   __clear_bit(BTN_RIGHT, dev->keybit);
         |                          ^~~
         |                          hdev
   drivers/hid/hid-multitouch.c:1291:26: note: each undeclared identifier is reported only once for each function it appears in


vim +1291 drivers/hid/hid-multitouch.c

  1261	
  1262	static int mt_touch_input_configured(struct hid_device *hdev,
  1263					     struct hid_input *hi,
  1264					     struct mt_application *app)
  1265	{
  1266		struct mt_device *td = hid_get_drvdata(hdev);
  1267		struct mt_class *cls = &td->mtclass;
  1268		struct input_dev *input = hi->input;
  1269		int ret;
  1270	
  1271		if (!td->maxcontacts)
  1272			td->maxcontacts = MT_DEFAULT_MAXCONTACT;
  1273	
  1274		mt_post_parse(td, app);
  1275		if (td->serial_maybe)
  1276			mt_post_parse_default_settings(td, app);
  1277	
  1278		if (cls->is_indirect)
  1279			app->mt_flags |= INPUT_MT_POINTER;
  1280	
  1281		if (app->quirks & MT_QUIRK_NOT_SEEN_MEANS_UP)
  1282			app->mt_flags |= INPUT_MT_DROP_UNUSED;
  1283	
  1284		/* check for clickpads */
  1285		if ((app->mt_flags & INPUT_MT_POINTER) &&
  1286		    (app->buttons_count == 1))
  1287			td->is_buttonpad = true;
  1288	
  1289		if (td->is_buttonpad) {
  1290			__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
> 1291			__clear_bit(BTN_RIGHT, dev->keybit);
  1292			__clear_bit(BTN_MIDDLE, dev->keybit);
  1293		}
  1294	
  1295		app->pending_palm_slots = devm_kcalloc(&hi->input->dev,
  1296						       BITS_TO_LONGS(td->maxcontacts),
  1297						       sizeof(long),
  1298						       GFP_KERNEL);
  1299		if (!app->pending_palm_slots)
  1300			return -ENOMEM;
  1301	
  1302		ret = input_mt_init_slots(input, td->maxcontacts, app->mt_flags);
  1303		if (ret)
  1304			return ret;
  1305	
  1306		app->mt_flags = 0;
  1307		return 0;
  1308	}
  1309	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
