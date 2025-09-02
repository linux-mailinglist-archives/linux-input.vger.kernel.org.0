Return-Path: <linux-input+bounces-14434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A925B40E09
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 21:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4F484E6348
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 19:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EFE2E6CD2;
	Tue,  2 Sep 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxjMS+TN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643412D5957;
	Tue,  2 Sep 2025 19:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756842403; cv=none; b=k7RjJHqh/uS8XiWcV3L+rL10+1sGYBSYvCcRksIw2IF5N08MEwSgrESLZNC6S0u7B47Eo3cnHV0RWCUpIAHtH77kC0Y1/AqozcFcOpdMbsCsgTD2M9rJ6So81OcKsrZC/kjJxhg8SY3AArTcDJBuNCUKce4t1pMc7dalqXTS4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756842403; c=relaxed/simple;
	bh=aiaZWQm8cItPl/RpfEsCq/MTzAAGUWn+iS50Uo0NurM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeypB/F6xuYqEj5FyV9bYAu6x/b4Wu+hxTEDM7veokwmHa5tn7bGoW4e72nV2eTx6fo35/Osq++LsnJDX8GZv+mLBEl8Ghsylhd9t9HVYwqaYwTFvGn3Nti2V7S7oJFf1eTHABkaNGlB+MtOvk54tENKbRKYRtqRWpCX7u95YB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxjMS+TN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756842401; x=1788378401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aiaZWQm8cItPl/RpfEsCq/MTzAAGUWn+iS50Uo0NurM=;
  b=gxjMS+TNuOJ/+OoJj/H2+ejqHR5h9R/ymKOxhsSx8YrstqivVY8nDkrT
   AfxlVISo0fAq40Sg0byOw0/6zCoBLkQJa3eJDOYY7VwoXf6WkA7p9Xnyc
   UhF7ROREsaGTOa9NTxUxwZK0pAGN4zMXiFyzWSgRXKQmtB+1BZURiorhw
   YoL7AQ5acSswSTUucSOIk5YL2ggxUYPZpmizq/gVDa005KP6tkEn+BSOU
   i/E2maVJKfF7jS6fNuFZNgcLa57nfjx86+hvAxnQ4VGTGqiZNzl1n8GTz
   lP1b/94Y6te+NeJAF2n/qv2reINjAihm/cOdjNiWO2mjji53YAYd40OoK
   Q==;
X-CSE-ConnectionGUID: 0LpChwucThOg2mLlf0Ctug==
X-CSE-MsgGUID: byneEBTCSf2p10g5LJ8eZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62966101"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62966101"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 12:46:41 -0700
X-CSE-ConnectionGUID: dsWdXLJMT0aI0vjeBPBLMQ==
X-CSE-MsgGUID: yYBJnSU4TiuPOK7P8BYBVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="202279186"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Sep 2025 12:46:38 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utWxf-0002yZ-2o;
	Tue, 02 Sep 2025 19:46:35 +0000
Date: Wed, 3 Sep 2025 03:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Leo L. Schwab" <ewhac@ewhac.org>, Hans de Goede <hansg@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kate Hsuan <hpa@redhat.com>, "Leo L. Schwab" <ewhac@ewhac.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <202509030200.ITZPZGmG-lkp@intel.com>
References: <20250902003659.361934-2-ewhac@ewhac.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902003659.361934-2-ewhac@ewhac.org>

Hi Leo,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-L-Schwab/HID-lg-g15-Add-support-for-Logitech-G13/20250902-091504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20250902003659.361934-2-ewhac%40ewhac.org
patch subject: [PATCH v5] HID: lg-g15 - Add support for Logitech G13.
config: i386-buildonly-randconfig-006-20250902 (https://download.01.org/0day-ci/archive/20250903/202509030200.ITZPZGmG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030200.ITZPZGmG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030200.ITZPZGmG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/hid-lg-g15.c:692:30: error: no member named 'brightness_hw_changed' in 'struct led_classdev'
     692 |                                            ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
         |                                               ~~~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +692 drivers/hid/hid-lg-g15.c

   655	
   656	static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
   657	{
   658		struct g13_input_report const * const rep = (struct g13_input_report *) data;
   659		int i, val;
   660	
   661		/*
   662		 * Main macropad and menu keys.
   663		 * Emit key events defined for each bit position.
   664		 */
   665		for (i = 0; i < ARRAY_SIZE(g13_keys_for_bits); ++i) {
   666			if (g13_keys_for_bits[i]) {
   667				val = TEST_BIT(rep->keybits, i);
   668				input_report_key(g15->input, g13_keys_for_bits[i], val);
   669			}
   670		}
   671		input_sync(g15->input);
   672	
   673		/*
   674		 * Joystick.
   675		 * Emit button and deflection events.
   676		 */
   677		for (i = 0; i < ARRAY_SIZE(g13_keys_for_bits_js); ++i) {
   678			val = TEST_BIT(rep->keybits, i + G13_JS_KEYBITS_OFFSET);
   679			input_report_key(g15->input_js, g13_keys_for_bits_js[i], val);
   680		}
   681		input_report_abs(g15->input_js, ABS_X, rep->joy_x);
   682		input_report_abs(g15->input_js, ABS_Y, rep->joy_y);
   683		input_sync(g15->input_js);
   684	
   685		if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)) {
   686			/*
   687			 * Bit 23 of keybits[] reports the current backlight on/off
   688			 * state.  If it has changed from the last cached value, apply
   689			 * an update.
   690			 */
   691			bool hw_brightness_changed = (!!TEST_BIT(rep->keybits, 23))
 > 692						   ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
   693			if (hw_brightness_changed)
   694				led_classdev_notify_brightness_hw_changed(
   695					&g15->leds[0].cdev,
   696					TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF);
   697		}
   698	
   699		return 0;
   700	}
   701	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

