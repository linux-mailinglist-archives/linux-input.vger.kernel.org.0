Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52FD34231C
	for <lists+linux-input@lfdr.de>; Fri, 19 Mar 2021 18:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhCSRWo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Mar 2021 13:22:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:43077 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229956AbhCSRWU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Mar 2021 13:22:20 -0400
IronPort-SDR: 8MECDL0HAgJnPancMGGqHMFhOWkwnrmIsBi5zyldjOx3qzpeMQUnQiyOZBWG+OnUk7mcubnnpM
 xQiFbahZt2dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="251285228"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="gz'50?scan'50,208,50";a="251285228"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 10:22:19 -0700
IronPort-SDR: hUVCEUj243L/erO/psWkLEL+Hwho4VV1knWhhLu9l2K/KaBi76Id2S7RwVq+mGPt9SkGa7kQ93
 xmlRIzTp9hrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="gz'50?scan'50,208,50";a="512555835"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2021 10:22:16 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lNIpE-0001xB-9A; Fri, 19 Mar 2021 17:22:16 +0000
Date:   Sat, 20 Mar 2021 01:21:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dario Pagani <dario.pagani.146@gmail.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-input@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>
Subject: [hid:for-5.13/thrustmaster 1/1] drivers/hid/hid-thrustmaster.c:62:
 warning: wrong kernel-doc identifier on line:
Message-ID: <202103200117.0466oF3V-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-5.13/thrustmaster
head:   c49c33637802a2c6957a78119eb8be3b055dd9e9
commit: c49c33637802a2c6957a78119eb8be3b055dd9e9 [1/1] HID: support for initialization of some Thrustmaster wheels
config: arm64-randconfig-r033-20210318 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project fcc1ce00931751ac02498986feb37744e9ace8de)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=c49c33637802a2c6957a78119eb8be3b055dd9e9
        git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
        git fetch --no-tags hid for-5.13/thrustmaster
        git checkout c49c33637802a2c6957a78119eb8be3b055dd9e9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64 

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

    21	
    22	/**
  > 23	 * These interrupts are used to prevent a nasty crash when initializing the
    24	 * T300RS. Used in thrustmaster_interrupts().
    25	 */
    26	static const u8 setup_0[] = { 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    27	static const u8 setup_1[] = { 0x0a, 0x04, 0x90, 0x03, 0x00, 0x00, 0x00, 0x00 };
    28	static const u8 setup_2[] = { 0x0a, 0x04, 0x00, 0x0c, 0x00, 0x00, 0x00, 0x00 };
    29	static const u8 setup_3[] = { 0x0a, 0x04, 0x12, 0x10, 0x00, 0x00, 0x00, 0x00 };
    30	static const u8 setup_4[] = { 0x0a, 0x04, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00 };
    31	static const u8 *const setup_arr[] = { setup_0, setup_1, setup_2, setup_3, setup_4 };
    32	static const unsigned int setup_arr_sizes[] = {
    33		ARRAY_SIZE(setup_0),
    34		ARRAY_SIZE(setup_1),
    35		ARRAY_SIZE(setup_2),
    36		ARRAY_SIZE(setup_3),
    37		ARRAY_SIZE(setup_4)
    38	};
    39	/**
    40	 * This struct contains for each type of
    41	 * Thrustmaster wheel
    42	 *
    43	 * Note: The values are stored in the CPU
    44	 * endianness, the USB protocols always use
    45	 * little endian; the macro cpu_to_le[BIT]()
    46	 * must be used when preparing USB packets
    47	 * and vice-versa
    48	 */
    49	struct tm_wheel_info {
    50		uint16_t wheel_type;
    51	
    52		/**
    53		 * See when the USB control out packet is prepared...
    54		 * @TODO The TMX seems to require multiple control codes to switch.
    55		 */
    56		uint16_t switch_value;
    57	
    58		char const *const wheel_name;
    59	};
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

--M9NhX3UHpAaciwkO
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--M9NhX3UHpAaciwkO--
