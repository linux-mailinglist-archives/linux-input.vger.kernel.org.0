Return-Path: <linux-input+bounces-13929-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33490B219A2
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 02:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAFC2420102
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 00:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A36E2BE643;
	Tue, 12 Aug 2025 00:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1zPaFgg"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33212BE03B;
	Tue, 12 Aug 2025 00:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754956865; cv=none; b=uCiayFRcWKTX61puMC74cItv0pCkKEqIOIhZXSQlZODBXAcYDrFgMkjuEPocytGQBIGxhHok6noEQ0zcXY3rzavRS4ijRozvDxjsK0zwyDLdb4B/KsQNZcpod72H4uszcIaI/j+4hEU2UBP9ISMauQ9FcAjVJ6VNK+REzYcMjXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754956865; c=relaxed/simple;
	bh=0BsARfXFOK9iv+i6XDSueazUUe1YJAx4E+RY8y9T6UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnBKvtQ8bZAYuC5cnCuWg+QS9mLqH/Nm4PORPrQAHfoDgIuIgGxmNe0MEMk/v8Cbf5GR6Ucmhauelsi6mDefBedDxmjRzecBPb2Cquc6owQSpciBjDLevAPjAJBpwmVHFpeJEFlJwerulRpmeNgmUpoL6+HU3VBAbTACoye46jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1zPaFgg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754956864; x=1786492864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0BsARfXFOK9iv+i6XDSueazUUe1YJAx4E+RY8y9T6UQ=;
  b=K1zPaFggAMheRJVjc7kgwSXuS97lXuZfyoYFLG8glX5ymcmx8r3b9GYj
   v15zscCzR/R8WI0o/bivj4HJYtCrBP7RfIWoWqUKwlDNAW/a89/cYuTMM
   29ZjaMlG1tBRpXpYpCNhYrUv9Wg0dnqNYslRTlOCUVOkMThJoCIrRjObT
   SoI3hkI9LsUKv1uveSI3EZLW8kkg/LrxUTkDHTq7+CWkQC5qzwsHMiDKi
   utESC2gBLa/QQjYO7G9f3wZ2Q3EaQefKOKBI9QCU7N4Nc3/UJWChsJMGb
   UqeWDeBTiFSTCEC0mVCEnBONeuk//S3sddaKrml5QLES5xuyyTSf5ztBn
   A==;
X-CSE-ConnectionGUID: yu0dhlojTSKngKAgiT04dw==
X-CSE-MsgGUID: ajU2ussWS1eOwjW5aSbLYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="82659501"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="82659501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 17:01:03 -0700
X-CSE-ConnectionGUID: /+F4pJ2/QBmrReRdHnf/fA==
X-CSE-MsgGUID: S5LZyq5LS2SfK3Kxq//CzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166842144"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Aug 2025 17:01:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulcRm-0006Iu-2l;
	Tue, 12 Aug 2025 00:00:58 +0000
Date: Tue, 12 Aug 2025 08:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Leo L. Schwab" <ewhac@ewhac.org>, Hans de Goede <hansg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
	"Leo L. Schwab" <ewhac@ewhac.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <202508120615.TGJUom52-lkp@intel.com>
References: <20250810225617.1006272-2-ewhac@ewhac.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810225617.1006272-2-ewhac@ewhac.org>

Hi Leo,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.17-rc1 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-L-Schwab/HID-lg-g15-Add-support-for-Logitech-G13/20250811-070633
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20250810225617.1006272-2-ewhac%40ewhac.org
patch subject: [PATCH] HID: lg-g15 - Add support for Logitech G13.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250812/202508120615.TGJUom52-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120615.TGJUom52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120615.TGJUom52-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/hid-lg-g15.c: In function 'lg_g13_event':
>> drivers/hid/hid-lg-g15.c:703:68: error: 'struct led_classdev' has no member named 'brightness_hw_changed'
     703 |                 (!!TEST_BIT(rep->keybits, 23)) ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
         |                                                                    ^


vim +703 drivers/hid/hid-lg-g15.c

   665	
   666	static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
   667	{
   668		struct g13_input_report const * const rep = (struct g13_input_report *) data;
   669		int i, val;
   670		bool hw_brightness_changed;
   671	
   672		/*
   673		 * Main macropad and menu keys.
   674		 * Emit key events defined for each bit position.
   675		 */
   676		for (i = 0;  i < ARRAY_SIZE(g13_keys_for_bits);  ++i) {
   677			if (g13_keys_for_bits[i]) {
   678				val = TEST_BIT(rep->keybits, i);
   679				input_report_key(g15->input, g13_keys_for_bits[i], val);
   680			}
   681		}
   682		input_sync(g15->input);
   683	
   684		/*
   685		 * Joystick.
   686		 * Emit button and deflection events.
   687		 */
   688		for (i = 0;  i < ARRAY_SIZE(g13_keys_for_bits_js);  ++i) {
   689			if (g13_keys_for_bits_js[i]) {
   690				val = TEST_BIT(rep->keybits, i + 33);
   691				input_report_key(g15->input_js, g13_keys_for_bits_js[i], val);
   692			}
   693		}
   694		input_report_abs(g15->input_js, ABS_X, rep->joy_x);
   695		input_report_abs(g15->input_js, ABS_Y, rep->joy_y);
   696		input_sync(g15->input_js);
   697	
   698		/*
   699		 * Bit 23 of keybits[] reports the current backlight on/off state.  If
   700		 * it has changed from the last cached value, apply an update.
   701		 */
   702		hw_brightness_changed =
 > 703			(!!TEST_BIT(rep->keybits, 23)) ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
   704		if (hw_brightness_changed) {
   705			led_classdev_notify_brightness_hw_changed(
   706				&g15->leds[0].cdev,
   707				TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF);
   708		}
   709	
   710		return 0;
   711	}
   712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

