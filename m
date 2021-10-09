Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF55C427AD5
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 16:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbhJIOew (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 10:34:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:38132 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229929AbhJIOev (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 10:34:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="312862928"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; 
   d="gz'50?scan'50,208,50";a="312862928"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2021 07:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; 
   d="gz'50?scan'50,208,50";a="440949506"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Oct 2021 07:32:49 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mZDP6-0000JQ-RH; Sat, 09 Oct 2021 14:32:48 +0000
Date:   Sat, 9 Oct 2021 22:32:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alistair Francis <alistair@alistair23.me>,
        dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kbuild-all@lists.01.org, linux-imx@nxp.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/4] HID: wacom: Add support for the AG14 Wacom device
Message-ID: <202110092248.eB6AWHnT-lkp@intel.com>
References: <20211009114313.17967-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20211009114313.17967-2-alistair@alistair23.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alistair,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hid/for-next]
[also build test ERROR on robh/for-next shawnguo/for-next linus/master v5.15-rc4 next-20211008]
[cannot apply to dtor-input/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alistair-Francis/HID-wacom_sys-Add-support-for-flipping-the-data-values/20211009-194419
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
config: arm-randconfig-r016-20211009 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b41e12004527538eaeaa1fd929a751c9504a32a0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alistair-Francis/HID-wacom_sys-Add-support-for-flipping-the-data-values/20211009-194419
        git checkout b41e12004527538eaeaa1fd929a751c9504a32a0
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/hid/wacom_wac.h:9,
                    from drivers/hid/wacom_wac.c:11:
>> drivers/hid/wacom_wac.c:4836:46: error: 'USB_VENDOR_ID_I2C_WACOM' undeclared here (not in a function); did you mean 'USB_VENDOR_ID_WACOM'?
    4836 |         HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_I2C_WACOM, prod),\
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:680:46: note: in definition of macro 'HID_DEVICE'
     680 |         .bus = (b), .group = (g), .vendor = (ven), .product = (prod)
         |                                              ^~~
   drivers/hid/wacom_wac.c:4900:11: note: in expansion of macro 'I2C_AG14_DEVICE_WACOM'
    4900 |         { I2C_AG14_DEVICE_WACOM(0x95) },
         |           ^~~~~~~~~~~~~~~~~~~~~


vim +4836 drivers/hid/wacom_wac.c

  4275	
  4276	static const struct wacom_features wacom_features_0x00 =
  4277		{ "Wacom Penpartner", 5040, 3780, 255, 0,
  4278		  PENPARTNER, WACOM_PENPRTN_RES, WACOM_PENPRTN_RES };
  4279	static const struct wacom_features wacom_features_0x10 =
  4280		{ "Wacom Graphire", 10206, 7422, 511, 63,
  4281		  GRAPHIRE, WACOM_GRAPHIRE_RES, WACOM_GRAPHIRE_RES };
  4282	static const struct wacom_features wacom_features_0x81 =
  4283		{ "Wacom Graphire BT", 16704, 12064, 511, 32,
  4284		  GRAPHIRE_BT, WACOM_GRAPHIRE_RES, WACOM_GRAPHIRE_RES, 2 };
  4285	static const struct wacom_features wacom_features_0x11 =
  4286		{ "Wacom Graphire2 4x5", 10206, 7422, 511, 63,
  4287		  GRAPHIRE, WACOM_GRAPHIRE_RES, WACOM_GRAPHIRE_RES };
  4288	static const struct wacom_features wacom_features_0x12 =
  4289		{ "Wacom Graphire2 5x7", 13918, 10206, 511, 63,
  4290		  GRAPHIRE, WACOM_GRAPHIRE_RES, WACOM_GRAPHIRE_RES };
  4291	static const struct wacom_features wacom_features_0x13 =
  4292		{ "Wacom Graphire3", 10208, 7424, 511, 63,
  4293		  GRAPHIRE, WACOM_GRAPHIRE_RES, WACOM_GRAPHIRE_RES };
  4294	static const struct wacom_features wacom_features_0x14 =
  4295		{ "Wacom Graphire3 6x8", 16704, 12064, 511, 63,
  4296		  GRAPHIRE, WACOM_GRAPHIRE_RES, WACOM_GRAPHIRE_RES };
  4297	static const struct wacom_features wacom_features_0x15 =
  4298		{ "Wacom Graphire4 4x5", 10208, 7424, 511, 63,
  4299		  WACOM_G4, WACOM_GRAPHIRE_RES, WACOM_GRAPHIRE_RES };
  4300	static const struct wacom_features wacom_features_0x16 =
  4301		{ "Wacom Graphire4 6x8", 16704, 12064, 511, 63,
  4302		  WACOM_G4, WACOM_GRAPHIRE_RES, WACOM_GRAPHIRE_RES };
  4303	static const struct wacom_features wacom_features_0x17 =
  4304		{ "Wacom BambooFun 4x5", 14760, 9225, 511, 63,
  4305		  WACOM_MO, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4306	static const struct wacom_features wacom_features_0x18 =
  4307		{ "Wacom BambooFun 6x8", 21648, 13530, 511, 63,
  4308		  WACOM_MO, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4309	static const struct wacom_features wacom_features_0x19 =
  4310		{ "Wacom Bamboo1 Medium", 16704, 12064, 511, 63,
  4311		  GRAPHIRE, WACOM_GRAPHIRE_RES, WACOM_GRAPHIRE_RES };
  4312	static const struct wacom_features wacom_features_0x60 =
  4313		{ "Wacom Volito", 5104, 3712, 511, 63,
  4314		  GRAPHIRE, WACOM_VOLITO_RES, WACOM_VOLITO_RES };
  4315	static const struct wacom_features wacom_features_0x61 =
  4316		{ "Wacom PenStation2", 3250, 2320, 255, 63,
  4317		  GRAPHIRE, WACOM_VOLITO_RES, WACOM_VOLITO_RES };
  4318	static const struct wacom_features wacom_features_0x62 =
  4319		{ "Wacom Volito2 4x5", 5104, 3712, 511, 63,
  4320		  GRAPHIRE, WACOM_VOLITO_RES, WACOM_VOLITO_RES };
  4321	static const struct wacom_features wacom_features_0x63 =
  4322		{ "Wacom Volito2 2x3", 3248, 2320, 511, 63,
  4323		  GRAPHIRE, WACOM_VOLITO_RES, WACOM_VOLITO_RES };
  4324	static const struct wacom_features wacom_features_0x64 =
  4325		{ "Wacom PenPartner2", 3250, 2320, 511, 63,
  4326		  GRAPHIRE, WACOM_VOLITO_RES, WACOM_VOLITO_RES };
  4327	static const struct wacom_features wacom_features_0x65 =
  4328		{ "Wacom Bamboo", 14760, 9225, 511, 63,
  4329		  WACOM_MO, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4330	static const struct wacom_features wacom_features_0x69 =
  4331		{ "Wacom Bamboo1", 5104, 3712, 511, 63,
  4332		  GRAPHIRE, WACOM_PENPRTN_RES, WACOM_PENPRTN_RES };
  4333	static const struct wacom_features wacom_features_0x6A =
  4334		{ "Wacom Bamboo1 4x6", 14760, 9225, 1023, 63,
  4335		  GRAPHIRE, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4336	static const struct wacom_features wacom_features_0x6B =
  4337		{ "Wacom Bamboo1 5x8", 21648, 13530, 1023, 63,
  4338		  GRAPHIRE, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4339	static const struct wacom_features wacom_features_0x20 =
  4340		{ "Wacom Intuos 4x5", 12700, 10600, 1023, 31,
  4341		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4342	static const struct wacom_features wacom_features_0x21 =
  4343		{ "Wacom Intuos 6x8", 20320, 16240, 1023, 31,
  4344		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4345	static const struct wacom_features wacom_features_0x22 =
  4346		{ "Wacom Intuos 9x12", 30480, 24060, 1023, 31,
  4347		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4348	static const struct wacom_features wacom_features_0x23 =
  4349		{ "Wacom Intuos 12x12", 30480, 31680, 1023, 31,
  4350		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4351	static const struct wacom_features wacom_features_0x24 =
  4352		{ "Wacom Intuos 12x18", 45720, 31680, 1023, 31,
  4353		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4354	static const struct wacom_features wacom_features_0x30 =
  4355		{ "Wacom PL400", 5408, 4056, 255, 0,
  4356		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4357	static const struct wacom_features wacom_features_0x31 =
  4358		{ "Wacom PL500", 6144, 4608, 255, 0,
  4359		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4360	static const struct wacom_features wacom_features_0x32 =
  4361		{ "Wacom PL600", 6126, 4604, 255, 0,
  4362		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4363	static const struct wacom_features wacom_features_0x33 =
  4364		{ "Wacom PL600SX", 6260, 5016, 255, 0,
  4365		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4366	static const struct wacom_features wacom_features_0x34 =
  4367		{ "Wacom PL550", 6144, 4608, 511, 0,
  4368		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4369	static const struct wacom_features wacom_features_0x35 =
  4370		{ "Wacom PL800", 7220, 5780, 511, 0,
  4371		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4372	static const struct wacom_features wacom_features_0x37 =
  4373		{ "Wacom PL700", 6758, 5406, 511, 0,
  4374		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4375	static const struct wacom_features wacom_features_0x38 =
  4376		{ "Wacom PL510", 6282, 4762, 511, 0,
  4377		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4378	static const struct wacom_features wacom_features_0x39 =
  4379		{ "Wacom DTU710", 34080, 27660, 511, 0,
  4380		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4381	static const struct wacom_features wacom_features_0xC4 =
  4382		{ "Wacom DTF521", 6282, 4762, 511, 0,
  4383		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4384	static const struct wacom_features wacom_features_0xC0 =
  4385		{ "Wacom DTF720", 6858, 5506, 511, 0,
  4386		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4387	static const struct wacom_features wacom_features_0xC2 =
  4388		{ "Wacom DTF720a", 6858, 5506, 511, 0,
  4389		  PL, WACOM_PL_RES, WACOM_PL_RES };
  4390	static const struct wacom_features wacom_features_0x03 =
  4391		{ "Wacom Cintiq Partner", 20480, 15360, 511, 0,
  4392		  PTU, WACOM_PL_RES, WACOM_PL_RES };
  4393	static const struct wacom_features wacom_features_0x41 =
  4394		{ "Wacom Intuos2 4x5", 12700, 10600, 1023, 31,
  4395		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4396	static const struct wacom_features wacom_features_0x42 =
  4397		{ "Wacom Intuos2 6x8", 20320, 16240, 1023, 31,
  4398		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4399	static const struct wacom_features wacom_features_0x43 =
  4400		{ "Wacom Intuos2 9x12", 30480, 24060, 1023, 31,
  4401		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4402	static const struct wacom_features wacom_features_0x44 =
  4403		{ "Wacom Intuos2 12x12", 30480, 31680, 1023, 31,
  4404		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4405	static const struct wacom_features wacom_features_0x45 =
  4406		{ "Wacom Intuos2 12x18", 45720, 31680, 1023, 31,
  4407		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4408	static const struct wacom_features wacom_features_0xB0 =
  4409		{ "Wacom Intuos3 4x5", 25400, 20320, 1023, 63,
  4410		  INTUOS3S, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 4 };
  4411	static const struct wacom_features wacom_features_0xB1 =
  4412		{ "Wacom Intuos3 6x8", 40640, 30480, 1023, 63,
  4413		  INTUOS3, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 8 };
  4414	static const struct wacom_features wacom_features_0xB2 =
  4415		{ "Wacom Intuos3 9x12", 60960, 45720, 1023, 63,
  4416		  INTUOS3, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 8 };
  4417	static const struct wacom_features wacom_features_0xB3 =
  4418		{ "Wacom Intuos3 12x12", 60960, 60960, 1023, 63,
  4419		  INTUOS3L, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 8 };
  4420	static const struct wacom_features wacom_features_0xB4 =
  4421		{ "Wacom Intuos3 12x19", 97536, 60960, 1023, 63,
  4422		  INTUOS3L, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 8 };
  4423	static const struct wacom_features wacom_features_0xB5 =
  4424		{ "Wacom Intuos3 6x11", 54204, 31750, 1023, 63,
  4425		  INTUOS3, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 8 };
  4426	static const struct wacom_features wacom_features_0xB7 =
  4427		{ "Wacom Intuos3 4x6", 31496, 19685, 1023, 63,
  4428		  INTUOS3S, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 4 };
  4429	static const struct wacom_features wacom_features_0xB8 =
  4430		{ "Wacom Intuos4 4x6", 31496, 19685, 2047, 63,
  4431		  INTUOS4S, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7 };
  4432	static const struct wacom_features wacom_features_0xB9 =
  4433		{ "Wacom Intuos4 6x9", 44704, 27940, 2047, 63,
  4434		  INTUOS4, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9 };
  4435	static const struct wacom_features wacom_features_0xBA =
  4436		{ "Wacom Intuos4 8x13", 65024, 40640, 2047, 63,
  4437		  INTUOS4L, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9 };
  4438	static const struct wacom_features wacom_features_0xBB =
  4439		{ "Wacom Intuos4 12x19", 97536, 60960, 2047, 63,
  4440		  INTUOS4L, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9 };
  4441	static const struct wacom_features wacom_features_0xBC =
  4442		{ "Wacom Intuos4 WL", 40640, 25400, 2047, 63,
  4443		  INTUOS4, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9 };
  4444	static const struct wacom_features wacom_features_0xBD =
  4445		{ "Wacom Intuos4 WL", 40640, 25400, 2047, 63,
  4446		  INTUOS4WL, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9 };
  4447	static const struct wacom_features wacom_features_0x26 =
  4448		{ "Wacom Intuos5 touch S", 31496, 19685, 2047, 63,
  4449		  INTUOS5S, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7, .touch_max = 16 };
  4450	static const struct wacom_features wacom_features_0x27 =
  4451		{ "Wacom Intuos5 touch M", 44704, 27940, 2047, 63,
  4452		  INTUOS5, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9, .touch_max = 16 };
  4453	static const struct wacom_features wacom_features_0x28 =
  4454		{ "Wacom Intuos5 touch L", 65024, 40640, 2047, 63,
  4455		  INTUOS5L, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9, .touch_max = 16 };
  4456	static const struct wacom_features wacom_features_0x29 =
  4457		{ "Wacom Intuos5 S", 31496, 19685, 2047, 63,
  4458		  INTUOS5S, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7 };
  4459	static const struct wacom_features wacom_features_0x2A =
  4460		{ "Wacom Intuos5 M", 44704, 27940, 2047, 63,
  4461		  INTUOS5, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9 };
  4462	static const struct wacom_features wacom_features_0x314 =
  4463		{ "Wacom Intuos Pro S", 31496, 19685, 2047, 63,
  4464		  INTUOSPS, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7, .touch_max = 16,
  4465		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4466	static const struct wacom_features wacom_features_0x315 =
  4467		{ "Wacom Intuos Pro M", 44704, 27940, 2047, 63,
  4468		  INTUOSPM, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9, .touch_max = 16,
  4469		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4470	static const struct wacom_features wacom_features_0x317 =
  4471		{ "Wacom Intuos Pro L", 65024, 40640, 2047, 63,
  4472		  INTUOSPL, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9, .touch_max = 16,
  4473		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4474	static const struct wacom_features wacom_features_0xF4 =
  4475		{ "Wacom Cintiq 24HD", 104480, 65600, 2047, 63,
  4476		  WACOM_24HD, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 16,
  4477		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4478		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET };
  4479	static const struct wacom_features wacom_features_0xF8 =
  4480		{ "Wacom Cintiq 24HD touch", 104480, 65600, 2047, 63, /* Pen */
  4481		  WACOM_24HD, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 16,
  4482		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4483		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4484		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0xf6 };
  4485	static const struct wacom_features wacom_features_0xF6 =
  4486		{ "Wacom Cintiq 24HD touch", .type = WACOM_24HDT, /* Touch */
  4487		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0xf8, .touch_max = 10,
  4488		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4489	static const struct wacom_features wacom_features_0x32A =
  4490		{ "Wacom Cintiq 27QHD", 120140, 67920, 2047, 63,
  4491		  WACOM_27QHD, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 0,
  4492		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4493		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET };
  4494	static const struct wacom_features wacom_features_0x32B =
  4495		{ "Wacom Cintiq 27QHD touch", 120140, 67920, 2047, 63,
  4496		  WACOM_27QHD, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 0,
  4497		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4498		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4499		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x32C };
  4500	static const struct wacom_features wacom_features_0x32C =
  4501		{ "Wacom Cintiq 27QHD touch", .type = WACOM_27QHDT,
  4502		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x32B, .touch_max = 10 };
  4503	static const struct wacom_features wacom_features_0x3F =
  4504		{ "Wacom Cintiq 21UX", 87200, 65600, 1023, 63,
  4505		  CINTIQ, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 8 };
  4506	static const struct wacom_features wacom_features_0xC5 =
  4507		{ "Wacom Cintiq 20WSX", 86680, 54180, 1023, 63,
  4508		  WACOM_BEE, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 10 };
  4509	static const struct wacom_features wacom_features_0xC6 =
  4510		{ "Wacom Cintiq 12WX", 53020, 33440, 1023, 63,
  4511		  WACOM_BEE, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 10 };
  4512	static const struct wacom_features wacom_features_0x304 =
  4513		{ "Wacom Cintiq 13HD", 59552, 33848, 1023, 63,
  4514		  WACOM_13HD, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9,
  4515		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4516		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET };
  4517	static const struct wacom_features wacom_features_0x333 =
  4518		{ "Wacom Cintiq 13HD touch", 59552, 33848, 2047, 63,
  4519		  WACOM_13HD, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9,
  4520		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4521		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4522		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x335 };
  4523	static const struct wacom_features wacom_features_0x335 =
  4524		{ "Wacom Cintiq 13HD touch", .type = WACOM_24HDT, /* Touch */
  4525		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x333, .touch_max = 10,
  4526		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4527	static const struct wacom_features wacom_features_0xC7 =
  4528		{ "Wacom DTU1931", 37832, 30305, 511, 0,
  4529		  PL, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4530	static const struct wacom_features wacom_features_0xCE =
  4531		{ "Wacom DTU2231", 47864, 27011, 511, 0,
  4532		  DTU, WACOM_INTUOS_RES, WACOM_INTUOS_RES,
  4533		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBMOUSE };
  4534	static const struct wacom_features wacom_features_0xF0 =
  4535		{ "Wacom DTU1631", 34623, 19553, 511, 0,
  4536		  DTU, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4537	static const struct wacom_features wacom_features_0xFB =
  4538		{ "Wacom DTU1031", 22096, 13960, 511, 0,
  4539		  DTUS, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4,
  4540		  WACOM_DTU_OFFSET, WACOM_DTU_OFFSET,
  4541		  WACOM_DTU_OFFSET, WACOM_DTU_OFFSET };
  4542	static const struct wacom_features wacom_features_0x32F =
  4543		{ "Wacom DTU1031X", 22672, 12928, 511, 0,
  4544		  DTUSX, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 0,
  4545		  WACOM_DTU_OFFSET, WACOM_DTU_OFFSET,
  4546		  WACOM_DTU_OFFSET, WACOM_DTU_OFFSET };
  4547	static const struct wacom_features wacom_features_0x336 =
  4548		{ "Wacom DTU1141", 23672, 13403, 1023, 0,
  4549		  DTUS, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4,
  4550		  WACOM_DTU_OFFSET, WACOM_DTU_OFFSET,
  4551		  WACOM_DTU_OFFSET, WACOM_DTU_OFFSET };
  4552	static const struct wacom_features wacom_features_0x57 =
  4553		{ "Wacom DTK2241", 95840, 54260, 2047, 63,
  4554		  DTK, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 6,
  4555		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4556		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET };
  4557	static const struct wacom_features wacom_features_0x59 = /* Pen */
  4558		{ "Wacom DTH2242", 95840, 54260, 2047, 63,
  4559		  DTK, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 6,
  4560		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4561		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4562		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x5D };
  4563	static const struct wacom_features wacom_features_0x5D = /* Touch */
  4564		{ "Wacom DTH2242",       .type = WACOM_24HDT,
  4565		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x59, .touch_max = 10,
  4566		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4567	static const struct wacom_features wacom_features_0xCC =
  4568		{ "Wacom Cintiq 21UX2", 87200, 65600, 2047, 63,
  4569		  WACOM_21UX2, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 18,
  4570		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4571		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET };
  4572	static const struct wacom_features wacom_features_0xFA =
  4573		{ "Wacom Cintiq 22HD", 95840, 54260, 2047, 63,
  4574		  WACOM_22HD, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 18,
  4575		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4576		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET };
  4577	static const struct wacom_features wacom_features_0x5B =
  4578		{ "Wacom Cintiq 22HDT", 95840, 54260, 2047, 63,
  4579		  WACOM_22HD, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 18,
  4580		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4581		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4582		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x5e };
  4583	static const struct wacom_features wacom_features_0x5E =
  4584		{ "Wacom Cintiq 22HDT", .type = WACOM_24HDT,
  4585		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x5b, .touch_max = 10,
  4586		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4587	static const struct wacom_features wacom_features_0x90 =
  4588		{ "Wacom ISDv4 90", 26202, 16325, 255, 0,
  4589		  TABLETPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES }; /* Pen-only */
  4590	static const struct wacom_features wacom_features_0x93 =
  4591		{ "Wacom ISDv4 93", 26202, 16325, 255, 0,
  4592		  TABLETPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 1 };
  4593	static const struct wacom_features wacom_features_0x97 =
  4594		{ "Wacom ISDv4 97", 26202, 16325, 511, 0,
  4595		  TABLETPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES }; /* Pen-only */
  4596	static const struct wacom_features wacom_features_0x9A =
  4597		{ "Wacom ISDv4 9A", 26202, 16325, 255, 0,
  4598		  TABLETPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 1 };
  4599	static const struct wacom_features wacom_features_0x9F =
  4600		{ "Wacom ISDv4 9F", 26202, 16325, 255, 0,
  4601		  TABLETPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 1 };
  4602	static const struct wacom_features wacom_features_0xE2 =
  4603		{ "Wacom ISDv4 E2", 26202, 16325, 255, 0,
  4604		  TABLETPC2FG, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4605	static const struct wacom_features wacom_features_0xE3 =
  4606		{ "Wacom ISDv4 E3", 26202, 16325, 255, 0,
  4607		  TABLETPC2FG, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4608	static const struct wacom_features wacom_features_0xE5 =
  4609		{ "Wacom ISDv4 E5", 26202, 16325, 255, 0,
  4610		  MTSCREEN, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4611	static const struct wacom_features wacom_features_0xE6 =
  4612		{ "Wacom ISDv4 E6", 27760, 15694, 255, 0,
  4613		  TABLETPC2FG, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4614	static const struct wacom_features wacom_features_0xEC =
  4615		{ "Wacom ISDv4 EC", 25710, 14500, 255, 0,
  4616		  TABLETPC,    WACOM_INTUOS_RES, WACOM_INTUOS_RES }; /* Pen-only */
  4617	static const struct wacom_features wacom_features_0xED =
  4618		{ "Wacom ISDv4 ED", 26202, 16325, 255, 0,
  4619		  TABLETPCE, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 1 };
  4620	static const struct wacom_features wacom_features_0xEF =
  4621		{ "Wacom ISDv4 EF", 26202, 16325, 255, 0,
  4622		  TABLETPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES }; /* Pen-only */
  4623	static const struct wacom_features wacom_features_0x100 =
  4624		{ "Wacom ISDv4 100", 26202, 16325, 255, 0,
  4625		  MTTPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4626	static const struct wacom_features wacom_features_0x101 =
  4627		{ "Wacom ISDv4 101", 26202, 16325, 255, 0,
  4628		  MTTPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4629	static const struct wacom_features wacom_features_0x10D =
  4630		{ "Wacom ISDv4 10D", 26202, 16325, 255, 0,
  4631		  MTTPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4632	static const struct wacom_features wacom_features_0x10E =
  4633		{ "Wacom ISDv4 10E", 27760, 15694, 255, 0,
  4634		  MTTPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4635	static const struct wacom_features wacom_features_0x10F =
  4636		{ "Wacom ISDv4 10F", 27760, 15694, 255, 0,
  4637		  MTTPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4638	static const struct wacom_features wacom_features_0x116 =
  4639		{ "Wacom ISDv4 116", 26202, 16325, 255, 0,
  4640		  TABLETPCE, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 1 };
  4641	static const struct wacom_features wacom_features_0x12C =
  4642		{ "Wacom ISDv4 12C", 27848, 15752, 2047, 0,
  4643		  TABLETPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES }; /* Pen-only */
  4644	static const struct wacom_features wacom_features_0x4001 =
  4645		{ "Wacom ISDv4 4001", 26202, 16325, 255, 0,
  4646		  MTTPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4647	static const struct wacom_features wacom_features_0x4004 =
  4648		{ "Wacom ISDv4 4004", 11060, 6220, 255, 0,
  4649		  MTTPC_B, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4650	static const struct wacom_features wacom_features_0x5000 =
  4651		{ "Wacom ISDv4 5000", 27848, 15752, 1023, 0,
  4652		  MTTPC_B, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4653	static const struct wacom_features wacom_features_0x5002 =
  4654		{ "Wacom ISDv4 5002", 29576, 16724, 1023, 0,
  4655		  MTTPC_B, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4656	static const struct wacom_features wacom_features_0x47 =
  4657		{ "Wacom Intuos2 6x8", 20320, 16240, 1023, 31,
  4658		  INTUOS, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4659	static const struct wacom_features wacom_features_0x84 =
  4660		{ "Wacom Wireless Receiver", .type = WIRELESS, .touch_max = 16 };
  4661	static const struct wacom_features wacom_features_0xD0 =
  4662		{ "Wacom Bamboo 2FG", 14720, 9200, 1023, 31,
  4663		  BAMBOO_TOUCH, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4664	static const struct wacom_features wacom_features_0xD1 =
  4665		{ "Wacom Bamboo 2FG 4x5", 14720, 9200, 1023, 31,
  4666		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4667	static const struct wacom_features wacom_features_0xD2 =
  4668		{ "Wacom Bamboo Craft", 14720, 9200, 1023, 31,
  4669		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4670	static const struct wacom_features wacom_features_0xD3 =
  4671		{ "Wacom Bamboo 2FG 6x8", 21648, 13700, 1023, 31,
  4672		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4673	static const struct wacom_features wacom_features_0xD4 =
  4674		{ "Wacom Bamboo Pen", 14720, 9200, 1023, 31,
  4675		  BAMBOO_PEN, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4676	static const struct wacom_features wacom_features_0xD5 =
  4677		{ "Wacom Bamboo Pen 6x8", 21648, 13700, 1023, 31,
  4678		  BAMBOO_PEN, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4679	static const struct wacom_features wacom_features_0xD6 =
  4680		{ "Wacom BambooPT 2FG 4x5", 14720, 9200, 1023, 31,
  4681		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4682	static const struct wacom_features wacom_features_0xD7 =
  4683		{ "Wacom BambooPT 2FG Small", 14720, 9200, 1023, 31,
  4684		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4685	static const struct wacom_features wacom_features_0xD8 =
  4686		{ "Wacom Bamboo Comic 2FG", 21648, 13700, 1023, 31,
  4687		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4688	static const struct wacom_features wacom_features_0xDA =
  4689		{ "Wacom Bamboo 2FG 4x5 SE", 14720, 9200, 1023, 31,
  4690		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4691	static const struct wacom_features wacom_features_0xDB =
  4692		{ "Wacom Bamboo 2FG 6x8 SE", 21648, 13700, 1023, 31,
  4693		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 2 };
  4694	static const struct wacom_features wacom_features_0xDD =
  4695	        { "Wacom Bamboo Connect", 14720, 9200, 1023, 31,
  4696	          BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4697	static const struct wacom_features wacom_features_0xDE =
  4698	        { "Wacom Bamboo 16FG 4x5", 14720, 9200, 1023, 31,
  4699		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 16 };
  4700	static const struct wacom_features wacom_features_0xDF =
  4701	        { "Wacom Bamboo 16FG 6x8", 21648, 13700, 1023, 31,
  4702		  BAMBOO_PT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 16 };
  4703	static const struct wacom_features wacom_features_0x300 =
  4704		{ "Wacom Bamboo One S", 14720, 9225, 1023, 31,
  4705		  BAMBOO_PEN, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4706	static const struct wacom_features wacom_features_0x301 =
  4707		{ "Wacom Bamboo One M", 21648, 13530, 1023, 31,
  4708		  BAMBOO_PEN, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4709	static const struct wacom_features wacom_features_0x302 =
  4710		{ "Wacom Intuos PT S", 15200, 9500, 1023, 31,
  4711		  INTUOSHT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 16,
  4712		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4713	static const struct wacom_features wacom_features_0x303 =
  4714		{ "Wacom Intuos PT M", 21600, 13500, 1023, 31,
  4715		  INTUOSHT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 16,
  4716		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4717	static const struct wacom_features wacom_features_0x30E =
  4718		{ "Wacom Intuos S", 15200, 9500, 1023, 31,
  4719		  INTUOSHT, WACOM_INTUOS_RES, WACOM_INTUOS_RES,
  4720		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4721	static const struct wacom_features wacom_features_0x6004 =
  4722		{ "ISD-V4", 12800, 8000, 255, 0,
  4723		  TABLETPC, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4724	static const struct wacom_features wacom_features_0x307 =
  4725		{ "Wacom ISDv5 307", 59552, 33848, 2047, 63,
  4726		  CINTIQ_HYBRID, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9,
  4727		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4728		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4729		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x309 };
  4730	static const struct wacom_features wacom_features_0x309 =
  4731		{ "Wacom ISDv5 309", .type = WACOM_24HDT, /* Touch */
  4732		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x0307, .touch_max = 10,
  4733		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4734	static const struct wacom_features wacom_features_0x30A =
  4735		{ "Wacom ISDv5 30A", 59552, 33848, 2047, 63,
  4736		  CINTIQ_HYBRID, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9,
  4737		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4738		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4739		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x30C };
  4740	static const struct wacom_features wacom_features_0x30C =
  4741		{ "Wacom ISDv5 30C", .type = WACOM_24HDT, /* Touch */
  4742		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x30A, .touch_max = 10,
  4743		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4744	static const struct wacom_features wacom_features_0x318 =
  4745		{ "Wacom USB Bamboo PAD", 4095, 4095, /* Touch */
  4746		  .type = BAMBOO_PAD, 35, 48, .touch_max = 4 };
  4747	static const struct wacom_features wacom_features_0x319 =
  4748		{ "Wacom Wireless Bamboo PAD", 4095, 4095, /* Touch */
  4749		  .type = BAMBOO_PAD, 35, 48, .touch_max = 4 };
  4750	static const struct wacom_features wacom_features_0x325 =
  4751		{ "Wacom ISDv5 325", 59552, 33848, 2047, 63,
  4752		  CINTIQ_COMPANION_2, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 11,
  4753		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4754		  WACOM_CINTIQ_OFFSET, WACOM_CINTIQ_OFFSET,
  4755		  .oVid = USB_VENDOR_ID_WACOM, .oPid = 0x326 };
  4756	static const struct wacom_features wacom_features_0x326 = /* Touch */
  4757		{ "Wacom ISDv5 326", .type = HID_GENERIC, .oVid = USB_VENDOR_ID_WACOM,
  4758		  .oPid = 0x325 };
  4759	static const struct wacom_features wacom_features_0x323 =
  4760		{ "Wacom Intuos P M", 21600, 13500, 1023, 31,
  4761		  INTUOSHT, WACOM_INTUOS_RES, WACOM_INTUOS_RES,
  4762		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4763	static const struct wacom_features wacom_features_0x331 =
  4764		{ "Wacom Express Key Remote", .type = REMOTE,
  4765		  .numbered_buttons = 18, .check_for_hid_type = true,
  4766		  .hid_type = HID_TYPE_USBNONE };
  4767	static const struct wacom_features wacom_features_0x33B =
  4768		{ "Wacom Intuos S 2", 15200, 9500, 2047, 63,
  4769		  INTUOSHT2, WACOM_INTUOS_RES, WACOM_INTUOS_RES,
  4770		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4771	static const struct wacom_features wacom_features_0x33C =
  4772		{ "Wacom Intuos PT S 2", 15200, 9500, 2047, 63,
  4773		  INTUOSHT2, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 16,
  4774		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4775	static const struct wacom_features wacom_features_0x33D =
  4776		{ "Wacom Intuos P M 2", 21600, 13500, 2047, 63,
  4777		  INTUOSHT2, WACOM_INTUOS_RES, WACOM_INTUOS_RES,
  4778		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4779	static const struct wacom_features wacom_features_0x33E =
  4780		{ "Wacom Intuos PT M 2", 21600, 13500, 2047, 63,
  4781		  INTUOSHT2, WACOM_INTUOS_RES, WACOM_INTUOS_RES, .touch_max = 16,
  4782		  .check_for_hid_type = true, .hid_type = HID_TYPE_USBNONE };
  4783	static const struct wacom_features wacom_features_0x343 =
  4784		{ "Wacom DTK1651", 34816, 19759, 1023, 0,
  4785		  DTUS, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4,
  4786		  WACOM_DTU_OFFSET, WACOM_DTU_OFFSET,
  4787		  WACOM_DTU_OFFSET, WACOM_DTU_OFFSET };
  4788	static const struct wacom_features wacom_features_0x360 =
  4789		{ "Wacom Intuos Pro M", 44800, 29600, 8191, 63,
  4790		  INTUOSP2_BT, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9, .touch_max = 10 };
  4791	static const struct wacom_features wacom_features_0x361 =
  4792		{ "Wacom Intuos Pro L", 62200, 43200, 8191, 63,
  4793		  INTUOSP2_BT, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 9, .touch_max = 10 };
  4794	static const struct wacom_features wacom_features_0x377 =
  4795		{ "Wacom Intuos BT S", 15200, 9500, 4095, 63,
  4796		  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
  4797	static const struct wacom_features wacom_features_0x379 =
  4798		{ "Wacom Intuos BT M", 21600, 13500, 4095, 63,
  4799		  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
  4800	static const struct wacom_features wacom_features_0x37A =
  4801		{ "Wacom One by Wacom S", 15200, 9500, 2047, 63,
  4802		  BAMBOO_PEN, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4803	static const struct wacom_features wacom_features_0x37B =
  4804		{ "Wacom One by Wacom M", 21600, 13500, 2047, 63,
  4805		  BAMBOO_PEN, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
  4806	static const struct wacom_features wacom_features_0x393 =
  4807		{ "Wacom Intuos Pro S", 31920, 19950, 8191, 63,
  4808		  INTUOSP2S_BT, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7,
  4809		  .touch_max = 10 };
  4810	static const struct wacom_features wacom_features_0x3c6 =
  4811		{ "Wacom Intuos BT S", 15200, 9500, 4095, 63,
  4812		  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
  4813	static const struct wacom_features wacom_features_0x3c8 =
  4814		{ "Wacom Intuos BT M", 21600, 13500, 4095, 63,
  4815		  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
  4816	
  4817	static const struct wacom_features wacom_features_0x95 =
  4818		{ "Wacom AG14", .type = HID_GENERIC, .oVid = 0x2D1F, .oPid = 149 };
  4819	
  4820	static const struct wacom_features wacom_features_HID_ANY_ID =
  4821		{ "Wacom HID", .type = HID_GENERIC, .oVid = HID_ANY_ID, .oPid = HID_ANY_ID };
  4822	
  4823	#define USB_DEVICE_WACOM(prod)						\
  4824		HID_DEVICE(BUS_USB, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
  4825		.driver_data = (kernel_ulong_t)&wacom_features_##prod
  4826	
  4827	#define BT_DEVICE_WACOM(prod)						\
  4828		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
  4829		.driver_data = (kernel_ulong_t)&wacom_features_##prod
  4830	
  4831	#define I2C_DEVICE_WACOM(prod)						\
  4832		HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
  4833		.driver_data = (kernel_ulong_t)&wacom_features_##prod
  4834	
  4835	#define I2C_AG14_DEVICE_WACOM(prod)					    \
> 4836		HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_I2C_WACOM, prod),\
  4837		.driver_data = (kernel_ulong_t)&wacom_features_##prod
  4838	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--/9DWx/yDrRhgMJTb
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--/9DWx/yDrRhgMJTb--
