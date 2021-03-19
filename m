Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EE2342397
	for <lists+linux-input@lfdr.de>; Fri, 19 Mar 2021 18:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhCSRpm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Mar 2021 13:45:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:3380 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230215AbhCSRpU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Mar 2021 13:45:20 -0400
IronPort-SDR: ebKb3HgCVunrysHvflfqAkFkOilFc/2u8RdgtfKInwMEAFbP0BjBJZYQl3Byl8kWeEKTOe1jJs
 MO/oEb0llL4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="177523793"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="gz'50?scan'50,208,50";a="177523793"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 10:45:19 -0700
IronPort-SDR: 7zelS5bUVccSlILD69Gk879vf45NJFInuKf0SguW9AMsnQVOWmfcMgSSnCl25+7rxEouKsqiQ0
 qhGyrs6VmkiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="gz'50?scan'50,208,50";a="413599353"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Mar 2021 10:45:17 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lNJBU-0001xZ-Gi; Fri, 19 Mar 2021 17:45:16 +0000
Date:   Sat, 20 Mar 2021 01:45:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dario Pagani <dario.pagani.146@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>
Subject: [hid:for-5.13/thrustmaster 1/1] drivers/hid/hid-thrustmaster.c:62:
 warning: wrong kernel-doc identifier on line:
Message-ID: <202103200103.vmRo7ISm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-5.13/thrustmaster
head:   c49c33637802a2c6957a78119eb8be3b055dd9e9
commit: c49c33637802a2c6957a78119eb8be3b055dd9e9 [1/1] HID: support for initialization of some Thrustmaster wheels
config: nios2-randconfig-s032-20210318 (attached as .config)
compiler: nios2-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-277-gc089cd2d-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=c49c33637802a2c6957a78119eb8be3b055dd9e9
        git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
        git fetch --no-tags hid for-5.13/thrustmaster
        git checkout c49c33637802a2c6957a78119eb8be3b055dd9e9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=nios2 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/hid/hid-thrustmaster.c:23: warning: Incorrect use of kernel-doc format:  * These interrupts are used to prevent a nasty crash when initializing the
   drivers/hid/hid-thrustmaster.c:26: warning: cannot understand function prototype: 'const u8 setup_0[] = '
   drivers/hid/hid-thrustmaster.c:49: warning: cannot understand function prototype: 'struct tm_wheel_info '
>> drivers/hid/hid-thrustmaster.c:62: warning: wrong kernel-doc identifier on line:
    * Known wheels.
   drivers/hid/hid-thrustmaster.c:84: warning: cannot understand function prototype: 'struct __packed tm_wheel_response '
   drivers/hid/hid-thrustmaster.c:143: warning: wrong kernel-doc identifier on line:
    * On some setups initializing the T300RS crashes the kernel,
   drivers/hid/hid-thrustmaster.c:202: warning: Function parameter or member 'urb' not described in 'thrustmaster_model_handler'
>> drivers/hid/hid-thrustmaster.c:202: warning: expecting prototype for Called by the USB subsystem when the wheel responses to our request(). Prototype was for thrustmaster_model_handler() instead
   drivers/hid/hid-thrustmaster.c:265: warning: wrong kernel-doc identifier on line:
    * Function called by HID when a hid Thrustmaster FFB wheel is connected to the host.


vim +62 drivers/hid/hid-thrustmaster.c

    60	
    61	/**
  > 62	 * Known wheels.
    63	 * Note: TMX does not work as it requires 2 control packets
    64	 */
    65	static const struct tm_wheel_info tm_wheels_infos[] = {
    66		{0x0306, 0x0006, "Thrustmaster T150RS"},
    67		{0x0206, 0x0005, "Thrustmaster T300RS"},
    68		{0x0204, 0x0005, "Thrustmaster T300 Ferrari Alcantara Edition"},
    69		{0x0002, 0x0002, "Thrustmaster T500RS"}
    70		//{0x0407, 0x0001, "Thrustmaster TMX"}
    71	};
    72	
    73	static const uint8_t tm_wheels_infos_length = 4;
    74	
    75	/**
    76	 * This structs contains (in little endian) the response data
    77	 * of the wheel to the request 73
    78	 *
    79	 * A sufficient research to understand what each field does is not
    80	 * beign conducted yet. The position and meaning of fields are a
    81	 * just a very optimistic guess based on instinct....
    82	 */
    83	struct __packed tm_wheel_response
    84	{
    85		/**
    86		 * Seems to be the type of packet
    87		 * - 0x0049 if is data.a (15 bytes)
    88		 * - 0x0047 if is data.b (7 bytes)
    89		 */
    90		uint16_t type;
    91	
    92		union {
    93			struct __packed {
    94				uint16_t field0;
    95				uint16_t field1;
    96				/**
    97				 * Seems to be the model code of the wheel
    98				 * Read table thrustmaster_wheels to values
    99				 */
   100				uint16_t model;
   101	
   102				uint16_t field2;
   103				uint16_t field3;
   104				uint16_t field4;
   105				uint16_t field5;
   106			} a;
   107			struct __packed {
   108				uint16_t field0;
   109				uint16_t field1;
   110				uint16_t model;
   111			} b;
   112		} data;
   113	};
   114	
   115	struct tm_wheel {
   116		struct usb_device *usb_dev;
   117		struct urb *urb;
   118	
   119		struct usb_ctrlrequest *model_request;
   120		struct tm_wheel_response *response;
   121	
   122		struct usb_ctrlrequest *change_request;
   123	};
   124	
   125	/** The control packet to send to wheel */
   126	static const struct usb_ctrlrequest model_request = {
   127		.bRequestType = 0xc1,
   128		.bRequest = 73,
   129		.wValue = 0,
   130		.wIndex = 0,
   131		.wLength = cpu_to_le16(0x0010)
   132	};
   133	
   134	static const struct usb_ctrlrequest change_request = {
   135		.bRequestType = 0x41,
   136		.bRequest = 83,
   137		.wValue = 0, // Will be filled by the driver
   138		.wIndex = 0,
   139		.wLength = 0
   140	};
   141	
   142	/**
   143	 * On some setups initializing the T300RS crashes the kernel,
   144	 * these interrupts fix that particular issue. So far they haven't caused any
   145	 * adverse effects in other wheels.
   146	 */
   147	static void thrustmaster_interrupts(struct hid_device *hdev)
   148	{
   149		int ret, trans, i, b_ep;
   150		u8 *send_buf = kmalloc(256, GFP_KERNEL);
   151		struct usb_host_endpoint *ep;
   152		struct device *dev = &hdev->dev;
   153		struct usb_interface *usbif = to_usb_interface(dev->parent);
   154		struct usb_device *usbdev = interface_to_usbdev(usbif);
   155	
   156		if (!send_buf) {
   157			hid_err(hdev, "failed allocating send buffer\n");
   158			return;
   159		}
   160	
   161		ep = &usbif->cur_altsetting->endpoint[1];
   162		b_ep = ep->desc.bEndpointAddress;
   163	
   164		for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
   165			memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
   166	
   167			ret = usb_interrupt_msg(usbdev,
   168				usb_sndintpipe(usbdev, b_ep),
   169				send_buf,
   170				setup_arr_sizes[i],
   171				&trans,
   172				USB_CTRL_SET_TIMEOUT);
   173	
   174			if (ret) {
   175				hid_err(hdev, "setup data couldn't be sent\n");
   176				return;
   177			}
   178		}
   179	
   180		kfree(send_buf);
   181	}
   182	
   183	static void thrustmaster_change_handler(struct urb *urb)
   184	{
   185		struct hid_device *hdev = urb->context;
   186	
   187		// The wheel seems to kill himself before answering the host and therefore is violating the USB protocol...
   188		if (urb->status == 0 || urb->status == -EPROTO || urb->status == -EPIPE)
   189			hid_info(hdev, "Success?! The wheel should have been initialized!\n");
   190		else
   191			hid_warn(hdev, "URB to change wheel mode seems to have failed with error %d\n", urb->status);
   192	}
   193	
   194	/**
   195	 * Called by the USB subsystem when the wheel responses to our request
   196	 * to get [what it seems to be] the wheel's model.
   197	 *
   198	 * If the model id is recognized then we send an opportune USB CONTROL REQUEST
   199	 * to switch the wheel to its full capabilities
   200	 */
   201	static void thrustmaster_model_handler(struct urb *urb)
 > 202	{
   203		struct hid_device *hdev = urb->context;
   204		struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
   205		uint16_t model = 0;
   206		int i, ret;
   207		const struct tm_wheel_info *twi = 0;
   208	
   209		if (urb->status) {
   210			hid_err(hdev, "URB to get model id failed with error %d\n", urb->status);
   211			return;
   212		}
   213	
   214		if (tm_wheel->response->type == cpu_to_le16(0x49))
   215			model = le16_to_cpu(tm_wheel->response->data.a.model);
   216		else if (tm_wheel->response->type == cpu_to_le16(0x47))
   217			model = le16_to_cpu(tm_wheel->response->data.b.model);
   218		else {
   219			hid_err(hdev, "Unknown packet type 0x%x, unable to proceed further with wheel init\n", tm_wheel->response->type);
   220			return;
   221		}
   222	
   223		for (i = 0; i < tm_wheels_infos_length && !twi; i++)
   224			if (tm_wheels_infos[i].wheel_type == model)
   225				twi = tm_wheels_infos + i;
   226	
   227		if (twi)
   228			hid_info(hdev, "Wheel with model id 0x%x is a %s\n", model, twi->wheel_name);
   229		else {
   230			hid_err(hdev, "Unknown wheel's model id 0x%x, unable to proceed further with wheel init\n", model);
   231			return;
   232		}
   233	
   234		tm_wheel->change_request->wValue = cpu_to_le16(twi->switch_value);
   235		usb_fill_control_urb(
   236			tm_wheel->urb,
   237			tm_wheel->usb_dev,
   238			usb_sndctrlpipe(tm_wheel->usb_dev, 0),
   239			(char *)tm_wheel->change_request,
   240			0, 0, // We do not expect any response from the wheel
   241			thrustmaster_change_handler,
   242			hdev
   243		);
   244	
   245		ret = usb_submit_urb(tm_wheel->urb, GFP_ATOMIC);
   246		if (ret)
   247			hid_err(hdev, "Error %d while submitting the change URB. I am unable to initialize this wheel...\n", ret);
   248	}
   249	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--OXfL5xGRrasGEqWY
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
CbJlqvqA39ack/n/A+e8+skYIQIA

--OXfL5xGRrasGEqWY--
