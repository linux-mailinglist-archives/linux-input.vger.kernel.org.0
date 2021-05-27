Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B195039318B
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 16:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236665AbhE0O4h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 10:56:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:47898 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234847AbhE0O4g (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 10:56:36 -0400
IronPort-SDR: /VczeXLLErnKmWBDdfjRDGY0Vwd/XcHBAe2ciqS3/xfaRh93us6XsMAe8nkSH+p6HrJsVQBAno
 Upy/Qs/RQF0w==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="263952272"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="gz'50?scan'50,208,50";a="263952272"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 07:55:03 -0700
IronPort-SDR: UF1ujAofBbllxovKPkEdGIgKecqptsKALeA6+MpXP4ZTX5lp8dBzWHvpo0Lx2crQrGUHAvD2bt
 3moxDEIG00zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="gz'50?scan'50,208,50";a="397775192"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 May 2021 07:54:59 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lmHPW-0002rM-V7; Thu, 27 May 2021 14:54:58 +0000
Date:   Thu, 27 May 2021 22:54:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Erica Taylor <rickytaylor26@gmail.com>, linux-input@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Erica Taylor <rickytaylor26@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Matt Reynolds <mattreynolds@chromium.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Sanjay Govind <sanjay.govind9@gmail.com>
Subject: Re: [PATCH 2/2] Input: xpad - add Logitech G923 Xbox variant
Message-ID: <202105272208.DVqdSVSF-lkp@intel.com>
References: <20210527134104.217865-3-rickytaylor26@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <20210527134104.217865-3-rickytaylor26@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Erica,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hid/for-next]
[also build test ERROR on input/next v5.13-rc3]
[cannot apply to jikos-hid/for-next next-20210527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Erica-Taylor/G923-Racing-Wheel-support/20210527-214315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
config: alpha-randconfig-r023-20210526 (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ae500b9fb85860a6590531cecf51be335880aa67
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Erica-Taylor/G923-Racing-Wheel-support/20210527-214315
        git checkout ae500b9fb85860a6590531cecf51be335880aa67
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=alpha 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/input/joystick/xpad.c: In function 'xpad_prepare_next_init_packet':
>> drivers/input/joystick/xpad.c:1020:23: error: 'g923_hidpp_init' undeclared (first use in this function)
    1020 |   memcpy(xpad->odata, g923_hidpp_init, ARRAY_SIZE(g923_hidpp_init));
         |                       ^~~~~~~~~~~~~~~
   drivers/input/joystick/xpad.c:1020:23: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:11,
                    from drivers/input/joystick/xpad.c:64:
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:240:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     240 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                            ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:49:59: note: in expansion of macro '__must_be_array'
      49 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/input/joystick/xpad.c:1020:40: note: in expansion of macro 'ARRAY_SIZE'
    1020 |   memcpy(xpad->odata, g923_hidpp_init, ARRAY_SIZE(g923_hidpp_init));
         |                                        ^~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:240:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     240 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                            ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:49:59: note: in expansion of macro '__must_be_array'
      49 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/input/joystick/xpad.c:1021:43: note: in expansion of macro 'ARRAY_SIZE'
    1021 |   xpad->irq_out->transfer_buffer_length = ARRAY_SIZE(g923_hidpp_init);
         |                                           ^~~~~~~~~~
   At top level:
   drivers/input/joystick/xpad.c:574:17: warning: 'switch_to_hidpp_cmd' defined but not used [-Wunused-const-variable=]
     574 | static const u8 switch_to_hidpp_cmd[] = {
         |                 ^~~~~~~~~~~~~~~~~~~


vim +/g923_hidpp_init +1020 drivers/input/joystick/xpad.c

   988	
   989	/* Callers must hold xpad->odata_lock spinlock */
   990	static bool xpad_prepare_next_init_packet(struct usb_xpad *xpad)
   991	{
   992		const struct xboxone_init_packet *init_packet;
   993	
   994		if (xpad->xtype != XTYPE_XBOXONE)
   995			return false;
   996	
   997		/* Perform initialization sequence for Xbox One pads that require it */
   998		while (xpad->init_seq < ARRAY_SIZE(xboxone_init_packets)) {
   999			init_packet = &xboxone_init_packets[xpad->init_seq++];
  1000	
  1001			if (init_packet->idVendor != 0 &&
  1002			    init_packet->idVendor != xpad->dev->id.vendor)
  1003				continue;
  1004	
  1005			if (init_packet->idProduct != 0 &&
  1006			    init_packet->idProduct != xpad->dev->id.product)
  1007				continue;
  1008	
  1009			/* This packet applies to our device, so prepare to send it */
  1010			memcpy(xpad->odata, init_packet->data, init_packet->len);
  1011			xpad->irq_out->transfer_buffer_length = init_packet->len;
  1012	
  1013			/* Update packet with current sequence number */
  1014			xpad->odata[2] = xpad->odata_serial++;
  1015			return true;
  1016		}
  1017	
  1018		if (switch_to_hidpp && xpad->mapping & HIDPP_CAPABLE) {
  1019			dev_dbg(&xpad->intf->dev, "%s - switching to HID++", __func__);
> 1020			memcpy(xpad->odata, g923_hidpp_init, ARRAY_SIZE(g923_hidpp_init));
  1021			xpad->irq_out->transfer_buffer_length = ARRAY_SIZE(g923_hidpp_init);
  1022			xpad->odata[2] = xpad->odata_serial++;
  1023			return true;
  1024		}
  1025	
  1026		return false;
  1027	}
  1028	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--5vNYLRcllDrimb99
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--5vNYLRcllDrimb99--
