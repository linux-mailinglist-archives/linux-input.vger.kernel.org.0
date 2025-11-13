Return-Path: <linux-input+bounces-16083-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DE6C575AF
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 13:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEEC63B7024
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 12:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3469D2D8370;
	Thu, 13 Nov 2025 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNCKZa9T"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8BB2BDC2B;
	Thu, 13 Nov 2025 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036173; cv=none; b=Da92dMu0mxYWncI/Fe3CWMvfFIHmRljzxcUm5XR3VC1sWgsnqPgSURjRnlygHhIXx26k1k2ufEVsVB5GX2TCr224HcssOspyHtCkyjHg60unGFTc1KXxfe5Bz5X4gwSyuVECo1vgXqY3oycj4Y1XZU6xk7Y7vj8X71eu9RovPU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036173; c=relaxed/simple;
	bh=ymUzwABaCWUeY/arnrVJraJRxCLYt63uNLdgQy6SZvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuWQuj2JZS0RVPg6XmNrAA6+OInVx8xix/xRSR4PDLo2+EUzQ+U694Am3hEGzH0db0XzA7luth2mjyinOdG22PDMi63L/x9vMSM7+BmWgtVqRNHbw0Ugw7VoV73zQdGTsvJZCLY43uubWXoYKLKYmUjLk8heVzJ5hY5w0+tHVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNCKZa9T; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763036172; x=1794572172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ymUzwABaCWUeY/arnrVJraJRxCLYt63uNLdgQy6SZvM=;
  b=jNCKZa9TUeajl9r8g24Qvki52f5DtZEfaWe4MLVNCvkV1xAPbTGZew6/
   +55bE+Rho2GGJXtnGzk2nyBJ46zPUmPXN0yg4PWHY5xIMC1Xu1hSObsFN
   ZYrsdrrK6usquefuRgaVtJIH997rUh2A65dSV1UpY43D6KfhNGnC3CsLO
   FYEQMo8ufUSOfOIirUycMofKMz6KsRiz4BOwyIoJ2rK269jzx1f+pf5hB
   vsOIxHw0LLDm9Rnx9hcZRDo/8TiwFmh/lRrStPk32VOghvnp7L6rK7Wad
   FxKE2z13EJ9IdjdwzJhM6ZBzlRigsprb7fzBg5hl0C6RhZSiA9OdwgFN3
   w==;
X-CSE-ConnectionGUID: 8sIFbtOtS4a9GU8/9lZh9A==
X-CSE-MsgGUID: hnFr1unmSPybW/Nt9P6s+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64998438"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="64998438"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:16:11 -0800
X-CSE-ConnectionGUID: FBHEm0HGQ820Oqx66wwwEw==
X-CSE-MsgGUID: 2vKSDQYdRaK2P1TUMPeacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="193602834"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2025 04:16:09 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJWFC-0005J5-2e;
	Thu, 13 Nov 2025 12:16:06 +0000
Date: Thu, 13 Nov 2025 20:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v1 3/5] Input: gpio_decoder - replace custom loop by
 gpiod_get_array_value_cansleep()
Message-ID: <202511131958.6ItfY60O-lkp@intel.com>
References: <20251112191412.2088105-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112191412.2088105-4-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus hid/for-next linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/Input-gpio_decoder-make-use-of-device-properties/20251113-032111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20251112191412.2088105-4-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 3/5] Input: gpio_decoder - replace custom loop by gpiod_get_array_value_cansleep()
config: x86_64-buildonly-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131958.6ItfY60O-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131958.6ItfY60O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131958.6ItfY60O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/misc/gpio_decoder.c:38:53: error: use of undeclared identifier 'val'
      38 |                 dev_err(decoder->dev, "Error reading GPIO: %d\n", val);
         |                                                                   ^
   1 error generated.


vim +/val +38 drivers/input/misc/gpio_decoder.c

    27	
    28	static int gpio_decoder_get_gpios_state(struct gpio_decoder *decoder)
    29	{
    30		struct gpio_descs *gpios = decoder->input_gpios;
    31		DECLARE_BITMAP(values, 32);
    32		unsigned int size;
    33		int err;
    34	
    35		size = min(gpios->ndescs, 32U);
    36		err = gpiod_get_array_value_cansleep(size, gpios->desc, gpios->info, values);
    37		if (err) {
  > 38			dev_err(decoder->dev, "Error reading GPIO: %d\n", val);
    39			return err;
    40		}
    41	
    42		return bitmap_read(values, 0, size);
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

