Return-Path: <linux-input+bounces-14436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 458FFB40EC4
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 22:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4A617B58DF
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 20:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C02234964;
	Tue,  2 Sep 2025 20:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgLUEb4P"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F2203706;
	Tue,  2 Sep 2025 20:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756846074; cv=none; b=WzioUZY13nmuWWs1+dlP+cORUzNo+Y+xdmQkTMAOFtQsLP+roU0sHHL6Toe6UYDykeWZ1UL1SyuS6tVpu6+hjQCXfEX0B45nJ6goiuqU71Tm87e24XY+czp4D+zsH/hrwpx8r5BwCk8MI9uqpbzkU+whO2/lOv39LOGFfpAOIfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756846074; c=relaxed/simple;
	bh=F2kD4w31rmC8aRc55QM8VeAbD7vVZzwGup32InjmXFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLQMsC5fdrCwDlKXw41ab4vY3pUfhW09l8/YcV4Z+PPt7To0UrJsyKQ4WeBQGAvz9uCAlGJ/nnzHpkShosI8/BltUv5yp8q9Um8evOGLphtOD57H8JnDq9YmxM+5nrZ5+vo+2i2N5IPNrzz7AV0uJL7+FNC7XpdbK3poFejjMeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgLUEb4P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EE9C4CEED;
	Tue,  2 Sep 2025 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756846073;
	bh=F2kD4w31rmC8aRc55QM8VeAbD7vVZzwGup32InjmXFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WgLUEb4P3BucztLyEYtKfNbcksfLtRcdtfoZO90JxzgpGZzCs8hwUk8QA5cvR0jUW
	 ZTBkkco5IlzvxRkHoOEdYhPCLL5oj02TXNMHtyk0aE+djN49Ov+8B9FQzpcoV/Ath1
	 8ZwoxSXvYk1vHzBJKct89wwCOfRO50a/4ElIARX4Zcsj+3+isPnd23pVQTQG8Lo60x
	 enNR7yy9R8fP5Qt2XdgfpFT/HMVBfvRJy4O+q0xchVigrvNKG9Aty9aQShIc+6UdmV
	 c9PAX0rFX7P3/fNyLgNUR/+WN5FixODVqoQ08WW/mVoC8AWEktbHukjERwcnQWCvZd
	 eMbTjJGLelOZg==
Message-ID: <9600871d-7a68-4e7e-8cc1-5280af554378@kernel.org>
Date: Tue, 2 Sep 2025 22:47:48 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] HID: lg-g15 - Add support for Logitech G13.
To: kernel test robot <lkp@intel.com>, "Leo L. Schwab" <ewhac@ewhac.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250902003659.361934-2-ewhac@ewhac.org>
 <202509030200.ITZPZGmG-lkp@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <202509030200.ITZPZGmG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Sep-25 21:46, kernel test robot wrote:
> Hi Leo,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on hid/for-next]
> [also build test ERROR on linus/master v6.17-rc4 next-20250902]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Leo-L-Schwab/HID-lg-g15-Add-support-for-Logitech-G13/20250902-091504
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
> patch link:    https://lore.kernel.org/r/20250902003659.361934-2-ewhac%40ewhac.org
> patch subject: [PATCH v5] HID: lg-g15 - Add support for Logitech G13.
> config: i386-buildonly-randconfig-006-20250902 (https://download.01.org/0day-ci/archive/20250903/202509030200.ITZPZGmG-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030200.ITZPZGmG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509030200.ITZPZGmG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/hid/hid-lg-g15.c:692:30: error: no member named 'brightness_hw_changed' in 'struct led_classdev'
>      692 |                                            ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
>          |                                               ~~~~~~~~~~~~~~~~~ ^
>    1 error generated.

Ah right, IS_ENABLED() only helps to avoid errors about references which
are resolved link-time and this is a compile-time issue.

But as discussed in the v3 thread we don't want to use 
cdev.brightness_hw_changed anyways.

Regards,

Hans


> 
> vim +692 drivers/hid/hid-lg-g15.c
> 
>    655	
>    656	static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
>    657	{
>    658		struct g13_input_report const * const rep = (struct g13_input_report *) data;
>    659		int i, val;
>    660	
>    661		/*
>    662		 * Main macropad and menu keys.
>    663		 * Emit key events defined for each bit position.
>    664		 */
>    665		for (i = 0; i < ARRAY_SIZE(g13_keys_for_bits); ++i) {
>    666			if (g13_keys_for_bits[i]) {
>    667				val = TEST_BIT(rep->keybits, i);
>    668				input_report_key(g15->input, g13_keys_for_bits[i], val);
>    669			}
>    670		}
>    671		input_sync(g15->input);
>    672	
>    673		/*
>    674		 * Joystick.
>    675		 * Emit button and deflection events.
>    676		 */
>    677		for (i = 0; i < ARRAY_SIZE(g13_keys_for_bits_js); ++i) {
>    678			val = TEST_BIT(rep->keybits, i + G13_JS_KEYBITS_OFFSET);
>    679			input_report_key(g15->input_js, g13_keys_for_bits_js[i], val);
>    680		}
>    681		input_report_abs(g15->input_js, ABS_X, rep->joy_x);
>    682		input_report_abs(g15->input_js, ABS_Y, rep->joy_y);
>    683		input_sync(g15->input_js);
>    684	
>    685		if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)) {
>    686			/*
>    687			 * Bit 23 of keybits[] reports the current backlight on/off
>    688			 * state.  If it has changed from the last cached value, apply
>    689			 * an update.
>    690			 */
>    691			bool hw_brightness_changed = (!!TEST_BIT(rep->keybits, 23))
>  > 692						   ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
>    693			if (hw_brightness_changed)
>    694				led_classdev_notify_brightness_hw_changed(
>    695					&g15->leds[0].cdev,
>    696					TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF);
>    697		}
>    698	
>    699		return 0;
>    700	}
>    701	
> 


