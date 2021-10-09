Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0A8427AA8
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 15:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbhJINnu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 09:43:50 -0400
Received: from mga04.intel.com ([192.55.52.120]:21795 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233146AbhJINnu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 09:43:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="225434308"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; 
   d="gz'50?scan'50,208,50";a="225434308"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2021 06:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; 
   d="gz'50?scan'50,208,50";a="590835107"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 09 Oct 2021 06:41:48 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mZCbk-0000H4-88; Sat, 09 Oct 2021 13:41:48 +0000
Date:   Sat, 9 Oct 2021 21:41:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alistair Francis <alistair@alistair23.me>,
        dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-imx@nxp.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/4] HID: wacom: Add support for the AG14 Wacom device
Message-ID: <202110092116.ei7ZRQdJ-lkp@intel.com>
References: <20211009114313.17967-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20211009114313.17967-2-alistair@alistair23.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--+HP7ph2BbKc20aGI
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
config: i386-randconfig-r015-20211009 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 30caca39f401ae17927439c0a0bd6d1b1916dd6a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b41e12004527538eaeaa1fd929a751c9504a32a0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alistair-Francis/HID-wacom_sys-Add-support-for-flipping-the-data-values/20211009-194419
        git checkout b41e12004527538eaeaa1fd929a751c9504a32a0
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hid/wacom_wac.c:4900:4: error: use of undeclared identifier 'USB_VENDOR_ID_I2C_WACOM'
           { I2C_AG14_DEVICE_WACOM(0x95) },
             ^
   drivers/hid/wacom_wac.c:4836:39: note: expanded from macro 'I2C_AG14_DEVICE_WACOM'
           HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_I2C_WACOM, prod),\
                                                ^
>> drivers/hid/wacom_wac.c:5010:1: error: definition of variable with array type needs an explicit size or an initializer
   MODULE_DEVICE_TABLE(hid, wacom_ids);
   ^
   include/linux/module.h:244:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
   extern typeof(name) __mod_##type##__##name##_device_table               \
                       ^
   <scratch space>:160:1: note: expanded from here
   __mod_hid__wacom_ids_device_table
   ^
   2 errors generated.


vim +/USB_VENDOR_ID_I2C_WACOM +4900 drivers/hid/wacom_wac.c

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
  4836		HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_I2C_WACOM, prod),\
  4837		.driver_data = (kernel_ulong_t)&wacom_features_##prod
  4838	
  4839	#define USB_DEVICE_LENOVO(prod)					\
  4840		HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, prod),			\
  4841		.driver_data = (kernel_ulong_t)&wacom_features_##prod
  4842	
  4843	const struct hid_device_id wacom_ids[] = {
  4844		{ USB_DEVICE_WACOM(0x00) },
  4845		{ USB_DEVICE_WACOM(0x03) },
  4846		{ USB_DEVICE_WACOM(0x10) },
  4847		{ USB_DEVICE_WACOM(0x11) },
  4848		{ USB_DEVICE_WACOM(0x12) },
  4849		{ USB_DEVICE_WACOM(0x13) },
  4850		{ USB_DEVICE_WACOM(0x14) },
  4851		{ USB_DEVICE_WACOM(0x15) },
  4852		{ USB_DEVICE_WACOM(0x16) },
  4853		{ USB_DEVICE_WACOM(0x17) },
  4854		{ USB_DEVICE_WACOM(0x18) },
  4855		{ USB_DEVICE_WACOM(0x19) },
  4856		{ USB_DEVICE_WACOM(0x20) },
  4857		{ USB_DEVICE_WACOM(0x21) },
  4858		{ USB_DEVICE_WACOM(0x22) },
  4859		{ USB_DEVICE_WACOM(0x23) },
  4860		{ USB_DEVICE_WACOM(0x24) },
  4861		{ USB_DEVICE_WACOM(0x26) },
  4862		{ USB_DEVICE_WACOM(0x27) },
  4863		{ USB_DEVICE_WACOM(0x28) },
  4864		{ USB_DEVICE_WACOM(0x29) },
  4865		{ USB_DEVICE_WACOM(0x2A) },
  4866		{ USB_DEVICE_WACOM(0x30) },
  4867		{ USB_DEVICE_WACOM(0x31) },
  4868		{ USB_DEVICE_WACOM(0x32) },
  4869		{ USB_DEVICE_WACOM(0x33) },
  4870		{ USB_DEVICE_WACOM(0x34) },
  4871		{ USB_DEVICE_WACOM(0x35) },
  4872		{ USB_DEVICE_WACOM(0x37) },
  4873		{ USB_DEVICE_WACOM(0x38) },
  4874		{ USB_DEVICE_WACOM(0x39) },
  4875		{ USB_DEVICE_WACOM(0x3F) },
  4876		{ USB_DEVICE_WACOM(0x41) },
  4877		{ USB_DEVICE_WACOM(0x42) },
  4878		{ USB_DEVICE_WACOM(0x43) },
  4879		{ USB_DEVICE_WACOM(0x44) },
  4880		{ USB_DEVICE_WACOM(0x45) },
  4881		{ USB_DEVICE_WACOM(0x47) },
  4882		{ USB_DEVICE_WACOM(0x57) },
  4883		{ USB_DEVICE_WACOM(0x59) },
  4884		{ USB_DEVICE_WACOM(0x5B) },
  4885		{ USB_DEVICE_WACOM(0x5D) },
  4886		{ USB_DEVICE_WACOM(0x5E) },
  4887		{ USB_DEVICE_WACOM(0x60) },
  4888		{ USB_DEVICE_WACOM(0x61) },
  4889		{ USB_DEVICE_WACOM(0x62) },
  4890		{ USB_DEVICE_WACOM(0x63) },
  4891		{ USB_DEVICE_WACOM(0x64) },
  4892		{ USB_DEVICE_WACOM(0x65) },
  4893		{ USB_DEVICE_WACOM(0x69) },
  4894		{ USB_DEVICE_WACOM(0x6A) },
  4895		{ USB_DEVICE_WACOM(0x6B) },
  4896		{ BT_DEVICE_WACOM(0x81) },
  4897		{ USB_DEVICE_WACOM(0x84) },
  4898		{ USB_DEVICE_WACOM(0x90) },
  4899		{ USB_DEVICE_WACOM(0x93) },
> 4900		{ I2C_AG14_DEVICE_WACOM(0x95) },
  4901		{ USB_DEVICE_WACOM(0x97) },
  4902		{ USB_DEVICE_WACOM(0x9A) },
  4903		{ USB_DEVICE_WACOM(0x9F) },
  4904		{ USB_DEVICE_WACOM(0xB0) },
  4905		{ USB_DEVICE_WACOM(0xB1) },
  4906		{ USB_DEVICE_WACOM(0xB2) },
  4907		{ USB_DEVICE_WACOM(0xB3) },
  4908		{ USB_DEVICE_WACOM(0xB4) },
  4909		{ USB_DEVICE_WACOM(0xB5) },
  4910		{ USB_DEVICE_WACOM(0xB7) },
  4911		{ USB_DEVICE_WACOM(0xB8) },
  4912		{ USB_DEVICE_WACOM(0xB9) },
  4913		{ USB_DEVICE_WACOM(0xBA) },
  4914		{ USB_DEVICE_WACOM(0xBB) },
  4915		{ USB_DEVICE_WACOM(0xBC) },
  4916		{ BT_DEVICE_WACOM(0xBD) },
  4917		{ USB_DEVICE_WACOM(0xC0) },
  4918		{ USB_DEVICE_WACOM(0xC2) },
  4919		{ USB_DEVICE_WACOM(0xC4) },
  4920		{ USB_DEVICE_WACOM(0xC5) },
  4921		{ USB_DEVICE_WACOM(0xC6) },
  4922		{ USB_DEVICE_WACOM(0xC7) },
  4923		{ USB_DEVICE_WACOM(0xCC) },
  4924		{ USB_DEVICE_WACOM(0xCE) },
  4925		{ USB_DEVICE_WACOM(0xD0) },
  4926		{ USB_DEVICE_WACOM(0xD1) },
  4927		{ USB_DEVICE_WACOM(0xD2) },
  4928		{ USB_DEVICE_WACOM(0xD3) },
  4929		{ USB_DEVICE_WACOM(0xD4) },
  4930		{ USB_DEVICE_WACOM(0xD5) },
  4931		{ USB_DEVICE_WACOM(0xD6) },
  4932		{ USB_DEVICE_WACOM(0xD7) },
  4933		{ USB_DEVICE_WACOM(0xD8) },
  4934		{ USB_DEVICE_WACOM(0xDA) },
  4935		{ USB_DEVICE_WACOM(0xDB) },
  4936		{ USB_DEVICE_WACOM(0xDD) },
  4937		{ USB_DEVICE_WACOM(0xDE) },
  4938		{ USB_DEVICE_WACOM(0xDF) },
  4939		{ USB_DEVICE_WACOM(0xE2) },
  4940		{ USB_DEVICE_WACOM(0xE3) },
  4941		{ USB_DEVICE_WACOM(0xE5) },
  4942		{ USB_DEVICE_WACOM(0xE6) },
  4943		{ USB_DEVICE_WACOM(0xEC) },
  4944		{ USB_DEVICE_WACOM(0xED) },
  4945		{ USB_DEVICE_WACOM(0xEF) },
  4946		{ USB_DEVICE_WACOM(0xF0) },
  4947		{ USB_DEVICE_WACOM(0xF4) },
  4948		{ USB_DEVICE_WACOM(0xF6) },
  4949		{ USB_DEVICE_WACOM(0xF8) },
  4950		{ USB_DEVICE_WACOM(0xFA) },
  4951		{ USB_DEVICE_WACOM(0xFB) },
  4952		{ USB_DEVICE_WACOM(0x100) },
  4953		{ USB_DEVICE_WACOM(0x101) },
  4954		{ USB_DEVICE_WACOM(0x10D) },
  4955		{ USB_DEVICE_WACOM(0x10E) },
  4956		{ USB_DEVICE_WACOM(0x10F) },
  4957		{ USB_DEVICE_WACOM(0x116) },
  4958		{ USB_DEVICE_WACOM(0x12C) },
  4959		{ USB_DEVICE_WACOM(0x300) },
  4960		{ USB_DEVICE_WACOM(0x301) },
  4961		{ USB_DEVICE_WACOM(0x302) },
  4962		{ USB_DEVICE_WACOM(0x303) },
  4963		{ USB_DEVICE_WACOM(0x304) },
  4964		{ USB_DEVICE_WACOM(0x307) },
  4965		{ USB_DEVICE_WACOM(0x309) },
  4966		{ USB_DEVICE_WACOM(0x30A) },
  4967		{ USB_DEVICE_WACOM(0x30C) },
  4968		{ USB_DEVICE_WACOM(0x30E) },
  4969		{ USB_DEVICE_WACOM(0x314) },
  4970		{ USB_DEVICE_WACOM(0x315) },
  4971		{ USB_DEVICE_WACOM(0x317) },
  4972		{ USB_DEVICE_WACOM(0x318) },
  4973		{ USB_DEVICE_WACOM(0x319) },
  4974		{ USB_DEVICE_WACOM(0x323) },
  4975		{ USB_DEVICE_WACOM(0x325) },
  4976		{ USB_DEVICE_WACOM(0x326) },
  4977		{ USB_DEVICE_WACOM(0x32A) },
  4978		{ USB_DEVICE_WACOM(0x32B) },
  4979		{ USB_DEVICE_WACOM(0x32C) },
  4980		{ USB_DEVICE_WACOM(0x32F) },
  4981		{ USB_DEVICE_WACOM(0x331) },
  4982		{ USB_DEVICE_WACOM(0x333) },
  4983		{ USB_DEVICE_WACOM(0x335) },
  4984		{ USB_DEVICE_WACOM(0x336) },
  4985		{ USB_DEVICE_WACOM(0x33B) },
  4986		{ USB_DEVICE_WACOM(0x33C) },
  4987		{ USB_DEVICE_WACOM(0x33D) },
  4988		{ USB_DEVICE_WACOM(0x33E) },
  4989		{ USB_DEVICE_WACOM(0x343) },
  4990		{ BT_DEVICE_WACOM(0x360) },
  4991		{ BT_DEVICE_WACOM(0x361) },
  4992		{ BT_DEVICE_WACOM(0x377) },
  4993		{ BT_DEVICE_WACOM(0x379) },
  4994		{ USB_DEVICE_WACOM(0x37A) },
  4995		{ USB_DEVICE_WACOM(0x37B) },
  4996		{ BT_DEVICE_WACOM(0x393) },
  4997		{ BT_DEVICE_WACOM(0x3c6) },
  4998		{ BT_DEVICE_WACOM(0x3c8) },
  4999		{ USB_DEVICE_WACOM(0x4001) },
  5000		{ USB_DEVICE_WACOM(0x4004) },
  5001		{ USB_DEVICE_WACOM(0x5000) },
  5002		{ USB_DEVICE_WACOM(0x5002) },
  5003		{ USB_DEVICE_LENOVO(0x6004) },
  5004	
  5005		{ USB_DEVICE_WACOM(HID_ANY_ID) },
  5006		{ I2C_DEVICE_WACOM(HID_ANY_ID) },
  5007		{ BT_DEVICE_WACOM(HID_ANY_ID) },
  5008		{ }
  5009	};
> 5010	MODULE_DEVICE_TABLE(hid, wacom_ids);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--+HP7ph2BbKc20aGI
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
8pld3zbQAQA=

--+HP7ph2BbKc20aGI--
