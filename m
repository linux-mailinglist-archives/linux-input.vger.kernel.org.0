Return-Path: <linux-input+bounces-15654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FE8BFC4EC
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 15:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DFA762265A
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 13:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371ED30ACE3;
	Wed, 22 Oct 2025 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLQaWKGa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7276B347BA9;
	Wed, 22 Oct 2025 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140318; cv=none; b=abxtlD46X/nsVBy83jjzZZFBO0olghhRQLxp4vjVrQc//2+m3n1PoBsxk7KwHNkzRb0awTIigNGh1pssirdO1zWb9D8sKrFRg3IYLucBQu5n0HkBYrwK1CuDnoKfBfQ8D8e9bTEp96cSW/UDerkZ3oT4gJuiAA5crTj1eIUUWmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140318; c=relaxed/simple;
	bh=Jk07LSuW7o+FzSpWG5F/znIOgaI7RMdvCBmOLObpTrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8Uy6olmUMGv6KmS7rlbTDnlkQSV36OIjeq6OX83LrteG4fna/s+Ec295UB/8Mob0CN6/cu2HuA6hV3mC2+bB9whXMgKhOBD1j+oVMtcJXqDGlYd/ucP2qbJQmd7TxHZXX6VElYM6GnZeID5kBzajgEp0Cg1BLmb6tNofq4iIc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLQaWKGa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761140316; x=1792676316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jk07LSuW7o+FzSpWG5F/znIOgaI7RMdvCBmOLObpTrE=;
  b=kLQaWKGakS5bZ4CROE0NWa6b4DlfasmPgIn0r/Tu/uoUwTC86FaNcV9V
   3WbXZy4cV1YwwCLVJAo2jHUcAehvAnoBPmZP+NOqFlNn4WHKCUYC9ErPe
   yls1Fptkt22qRB136R3Uf9uuv9s7QmO/wLIl5rtfWpuLQdxVUU3NICk9f
   qwkK3O/txsGtwE8OFI42k13LqKs/iEIq+efTtMbaFnFRxFg6aCWE5MKP9
   S+iwX+mBx1AkGEECK3P0h2vzFEKdr5Zw/kFIf0SHlj07S43lUsB6J3NS/
   n/acIKiypT3qTdlFu6y49X5Cajc6UwTv1ABUrKA5UdrljWjvC2o7exNAY
   w==;
X-CSE-ConnectionGUID: UCKfzWVMTkaad839hsanFA==
X-CSE-MsgGUID: 2ZnMFXJfTdW6RLJkzAXauw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74406847"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="74406847"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 06:38:36 -0700
X-CSE-ConnectionGUID: ql/oeXATRQWxWC8SoZ9/Ng==
X-CSE-MsgGUID: ip3xF8XMTfupYz0ejroGyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="183463464"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2025 06:38:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBZ2s-000COn-2a;
	Wed, 22 Oct 2025 13:38:30 +0000
Date: Wed, 22 Oct 2025 21:38:04 +0800
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
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
Message-ID: <202510222013.EBLC609m-lkp@intel.com>
References: <20251018101759.4089-6-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018101759.4089-6-lkml@antheas.dev>

Hi Antheas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-simplify-RGB-init-sequence/20251018-182410
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251018101759.4089-6-lkml%40antheas.dev
patch subject: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple kbd led handlers
config: i386-randconfig-141-20251020 (https://download.01.org/0day-ci/archive/20251022/202510222013.EBLC609m-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510222013.EBLC609m-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/asus-wmi.c:1623 kbd_led_update_all() warn: always true condition '(value >= 0) => (0-u32max >= 0)'

Old smatch warnings:
drivers/platform/x86/asus-wmi.c:2288 asus_new_rfkill() warn: '*rfkill' is an error pointer or valid

vim +1623 drivers/platform/x86/asus-wmi.c

  1589	
  1590	static void kbd_led_update_all(struct work_struct *work)
  1591	{
  1592		enum led_brightness value;
  1593		struct asus_wmi *asus;
  1594		bool registered, notify;
  1595		int ret;
  1596	
  1597		asus = container_of(work, struct asus_wmi, kbd_led_work);
  1598	
  1599		scoped_guard(spinlock_irqsave, &asus_ref.lock) {
  1600			registered = asus->kbd_led_registered;
  1601			value = asus->kbd_led_wk;
  1602			notify = asus->kbd_led_notify;
  1603		}
  1604	
  1605		if (!registered) {
  1606			/*
  1607			 * This workqueue runs under asus-wmi, which means probe has
  1608			 * completed and asus-wmi will keep running until it finishes.
  1609			 * Therefore, we can safely register the LED without holding
  1610			 * a spinlock.
  1611			 */
  1612			ret = devm_led_classdev_register(&asus->platform_device->dev,
  1613						    &asus->kbd_led);
  1614			if (!ret) {
  1615				scoped_guard(spinlock_irqsave, &asus_ref.lock)
  1616					asus->kbd_led_registered = true;
  1617			} else {
  1618				pr_warn("Failed to register keyboard backlight LED: %d\n", ret);
  1619				return;
  1620			}
  1621		}
  1622	
> 1623		if (value >= 0)
  1624			do_kbd_led_set(&asus->kbd_led, value);
  1625		if (notify) {
  1626			scoped_guard(spinlock_irqsave, &asus_ref.lock)
  1627				asus->kbd_led_notify = false;
  1628			led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
  1629		}
  1630	}
  1631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

