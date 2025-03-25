Return-Path: <linux-input+bounces-11163-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E207A6E9A7
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 07:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED6B83AE9DE
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 06:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83137234969;
	Tue, 25 Mar 2025 06:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+8EcVa0"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D8C20E6F7;
	Tue, 25 Mar 2025 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742884441; cv=none; b=X57/qS+IVdO55e5aKjAJZPawPQH1n/oZTXJy3NCfpcAttIcqykQ6tUaR8kTyjUvhED+LE9Xu4XXOucAZvbBe3BeDIA/3GRXqSocNgFg2hL42Nx3I50xkpQSe7x+twj793MMfwpScbWX5AhSqy2kNBNrTaTLqH01WVMc/I7DC884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742884441; c=relaxed/simple;
	bh=9AmwvCBDzu9WR28vFl38+N6gLo043YVCwgjR3QF7otA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brE0dxJ1iN4bR/nnGaJp9ICI0rm3t0kNGjMWQDLEjyxaS28VpfcmdxU9EVPoxw0VW6IngLDJoICI2zmkK9Goj1SW5JmkadtQpQeTXDmFIxR4uTc6u86rCfPxX2v9dAD5/PoEPbeg0GgOA6K6doGA52d076cEeLqlIeixe/zm0vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+8EcVa0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742884440; x=1774420440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9AmwvCBDzu9WR28vFl38+N6gLo043YVCwgjR3QF7otA=;
  b=Y+8EcVa0c1DQrR2rjhjy8DalE96WtHPRsbTLUga7Xsgx0L+VPxZtmUcw
   CFzT5dkEhsbg0jY61MRKTOBvnlrKqLDdGcWgLIYgk9uI2Y57BKPa3dQ0k
   np5IM9Ko2tdIBOAnBMy+W+jxl2XOQTJ7bZFilCr+7jLqf9uXs4x3GSuED
   lnJ0ru2KL7rsAwsCswSD3LyqCGxNdXP0aSkvKKGuD429/sNhtOoV36t/m
   MwhUzLr8+QaAe1HHU2l1X8LyABZhtPzN9I0aAxV9piVcWH0+BIOiBCMeU
   Ww7oCKNKSK4yQr2XknAzHq0y50II16daJQYWWSGNWazAfwyrZRKA+RTvd
   A==;
X-CSE-ConnectionGUID: Crz3J1YFTt2R9qPFACewig==
X-CSE-MsgGUID: 71W1CB4hSr2ZPufpapFZ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="66573555"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="66573555"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 23:33:59 -0700
X-CSE-ConnectionGUID: 8Gs8zqMHSFSCR7zT/HNatQ==
X-CSE-MsgGUID: Mk8E2JI+SpinTRZMRkHy+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="128959997"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2025 23:33:56 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twxrA-0004Ae-0t;
	Tue, 25 Mar 2025 06:33:49 +0000
Date: Tue, 25 Mar 2025 14:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v4 09/11] HID: asus: add basic RGB support
Message-ID: <202503251316.lPXAIXIV-lkp@intel.com>
References: <20250324210151.6042-10-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324210151.6042-10-lkml@antheas.dev>

Hi Antheas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-refactor-init-sequence-per-spec/20250325-051852
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250324210151.6042-10-lkml%40antheas.dev
patch subject: [PATCH v4 09/11] HID: asus: add basic RGB support
config: riscv-randconfig-002-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251316.lPXAIXIV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251316.lPXAIXIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251316.lPXAIXIV-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/hid/hid-asus.o: in function `asus_kbd_register_leds':
>> drivers/hid/hid-asus.c:676:(.text+0x23f8): undefined reference to `devm_led_classdev_multicolor_register_ext'


vim +676 drivers/hid/hid-asus.c

312a522531f6e5 Antheas Kapenekakis 2025-03-24  645  
af22a610bc3850 Carlo Caione        2017-04-06  646  static int asus_kbd_register_leds(struct hid_device *hdev)
af22a610bc3850 Carlo Caione        2017-04-06  647  {
af22a610bc3850 Carlo Caione        2017-04-06  648  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
af22a610bc3850 Carlo Caione        2017-04-06  649  	unsigned char kbd_func;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  650  	struct asus_kbd_leds *leds;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  651  	bool no_led;
af22a610bc3850 Carlo Caione        2017-04-06  652  	int ret;
af22a610bc3850 Carlo Caione        2017-04-06  653  
2c82a7b20f7b7a Luke D. Jones       2024-04-16  654  	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
2c82a7b20f7b7a Luke D. Jones       2024-04-16  655  	if (ret < 0)
2c82a7b20f7b7a Luke D. Jones       2024-04-16  656  		return ret;
2c82a7b20f7b7a Luke D. Jones       2024-04-16  657  
3ebfeb18b44e01 Antheas Kapenekakis 2025-03-24  658  	/* Get keyboard functions */
3ebfeb18b44e01 Antheas Kapenekakis 2025-03-24  659  	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
b92b80246e0626 Luke D Jones        2020-10-27  660  	if (ret < 0)
b92b80246e0626 Luke D Jones        2020-10-27  661  		return ret;
53078a736fbc60 Luke D. Jones       2025-01-11  662  
53078a736fbc60 Luke D. Jones       2025-01-11  663  	if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
53078a736fbc60 Luke D. Jones       2025-01-11  664  		ret = asus_kbd_disable_oobe(hdev);
53078a736fbc60 Luke D. Jones       2025-01-11  665  		if (ret < 0)
53078a736fbc60 Luke D. Jones       2025-01-11  666  			return ret;
53078a736fbc60 Luke D. Jones       2025-01-11  667  	}
af22a610bc3850 Carlo Caione        2017-04-06  668  
af22a610bc3850 Carlo Caione        2017-04-06  669  	/* Check for backlight support */
af22a610bc3850 Carlo Caione        2017-04-06  670  	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
af22a610bc3850 Carlo Caione        2017-04-06  671  		return -ENODEV;
af22a610bc3850 Carlo Caione        2017-04-06  672  
af22a610bc3850 Carlo Caione        2017-04-06  673  	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
af22a610bc3850 Carlo Caione        2017-04-06  674  					      sizeof(struct asus_kbd_leds),
af22a610bc3850 Carlo Caione        2017-04-06  675  					      GFP_KERNEL);
af22a610bc3850 Carlo Caione        2017-04-06 @676  	if (!drvdata->kbd_backlight)
af22a610bc3850 Carlo Caione        2017-04-06  677  		return -ENOMEM;
af22a610bc3850 Carlo Caione        2017-04-06  678  
312a522531f6e5 Antheas Kapenekakis 2025-03-24  679  	leds = drvdata->kbd_backlight;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  680  	leds->removed = false;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  681  	leds->brightness = 3;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  682  	leds->hdev = hdev;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  683  	leds->listener.brightness_set = asus_kbd_listener_set;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  684  
312a522531f6e5 Antheas Kapenekakis 2025-03-24  685  	leds->rgb_colors[0] = 0;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  686  	leds->rgb_colors[1] = 0;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  687  	leds->rgb_colors[2] = 0;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  688  	leds->rgb_init = true;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  689  	leds->rgb_set = false;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  690  	leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
312a522531f6e5 Antheas Kapenekakis 2025-03-24  691  					"asus-%s:rgb:peripheral",
312a522531f6e5 Antheas Kapenekakis 2025-03-24  692  					strlen(hdev->uniq) ?
312a522531f6e5 Antheas Kapenekakis 2025-03-24  693  					hdev->uniq : dev_name(&hdev->dev));
312a522531f6e5 Antheas Kapenekakis 2025-03-24  694  	leds->mc_led.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  695  	leds->mc_led.led_cdev.max_brightness = 3,
312a522531f6e5 Antheas Kapenekakis 2025-03-24  696  	leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set,
312a522531f6e5 Antheas Kapenekakis 2025-03-24  697  	leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get,
312a522531f6e5 Antheas Kapenekakis 2025-03-24  698  	leds->mc_led.subled_info = leds->subled_info,
312a522531f6e5 Antheas Kapenekakis 2025-03-24  699  	leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info),
312a522531f6e5 Antheas Kapenekakis 2025-03-24  700  	leds->subled_info[0].color_index = LED_COLOR_ID_RED;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  701  	leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  702  	leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  703  
312a522531f6e5 Antheas Kapenekakis 2025-03-24  704  	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
315c537068a13f Pietro Borrello     2023-02-12  705  	spin_lock_init(&drvdata->kbd_backlight->lock);
af22a610bc3850 Carlo Caione        2017-04-06  706  
d37db2009c913c Antheas Kapenekakis 2025-03-24  707  	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
312a522531f6e5 Antheas Kapenekakis 2025-03-24  708  	no_led = !!ret;
d37db2009c913c Antheas Kapenekakis 2025-03-24  709  
312a522531f6e5 Antheas Kapenekakis 2025-03-24  710  	if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
312a522531f6e5 Antheas Kapenekakis 2025-03-24  711  		ret = devm_led_classdev_multicolor_register(
312a522531f6e5 Antheas Kapenekakis 2025-03-24  712  			&hdev->dev, &leds->mc_led);
312a522531f6e5 Antheas Kapenekakis 2025-03-24  713  		if (!ret)
312a522531f6e5 Antheas Kapenekakis 2025-03-24  714  			leds->rgb_registered = true;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  715  		no_led &= !!ret;
312a522531f6e5 Antheas Kapenekakis 2025-03-24  716  	}
312a522531f6e5 Antheas Kapenekakis 2025-03-24  717  
312a522531f6e5 Antheas Kapenekakis 2025-03-24  718  	if (no_led) {
af22a610bc3850 Carlo Caione        2017-04-06  719  		/* No need to have this still around */
af22a610bc3850 Carlo Caione        2017-04-06  720  		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
af22a610bc3850 Carlo Caione        2017-04-06  721  	}
af22a610bc3850 Carlo Caione        2017-04-06  722  
312a522531f6e5 Antheas Kapenekakis 2025-03-24  723  	return no_led ? -ENODEV : 0;
af22a610bc3850 Carlo Caione        2017-04-06  724  }
af22a610bc3850 Carlo Caione        2017-04-06  725  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

