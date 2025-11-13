Return-Path: <linux-input+bounces-16078-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 614CCC57039
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 11:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 904E2347483
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 10:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616F7334C11;
	Thu, 13 Nov 2025 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnsDJHDu"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F95333740;
	Thu, 13 Nov 2025 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030942; cv=none; b=saTsbCFeboKOtEBNabK0DLUbvDU+AIud6C59liXHNYV0ziAL9oUnrqcyi3he6tOYGJplB8bCRC5sI3V2tYy12RAZG6+2D1Ta3+cMbP/tiJmzITk5WZ3RNGc8o1e6n0701RTTKZIRPp2mM1PrvEo3EWC3Fl4ZQjeybbXFC7k/VKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030942; c=relaxed/simple;
	bh=Kk7iQLm+24oOMTVTh2IdKYXvsg6dx5HmrqEKOGDDp8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNswyJiCFCYxR9UlYgIqyVQeARahykcRCe+YvF54uh5En2chbCY6EIZEvnGHYmm2T6zBx5Hd1JqW4cyD2Zvbp1tPkEpc5NtBTBlEmBuJNwzl9RDi+HbMCftUMoekA/+7awqNk+6V3z7rQnfStyOyfONRqKwM0Bfu2ZqXYgjLa1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnsDJHDu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763030940; x=1794566940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kk7iQLm+24oOMTVTh2IdKYXvsg6dx5HmrqEKOGDDp8A=;
  b=mnsDJHDu1sWJW7dSqt3vnlGp1kjsJVmIXhx+zfqQ2FBXAgYgMvhcunVv
   kHtbQGtn3WujI8cHyGJYCgASRYjFek3oP5K8elJMr72WTTyS5fVYYJjve
   kXMLKhcVUNVxVnUtxOG8yDL53sUZmHSP96FTUJ83jAQGsBzulvjaZJ6hF
   1jfQjibx/Bj6D/KzFl1oAbiYV8vWtAXp8xXRwBxWRgTfGGXKhrjl+aiZD
   wwAnJGKsaspeY2hvtX3sWmQ/qEqAPb/aXenWLp2EVAwG+5Mwhf1shn7Ri
   dn3AK0UdAwadiRMfsrFv870i7HUcLNhhSaLrxVyLcF1stz3y5bY/AAdVa
   A==;
X-CSE-ConnectionGUID: O9xwsAnPRzyFzekdFkbvyA==
X-CSE-MsgGUID: X4itm76JQtOmhLIqoVlQyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76210782"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="76210782"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 02:49:00 -0800
X-CSE-ConnectionGUID: /+K8ypNoTt2KPmbavEptYw==
X-CSE-MsgGUID: wKQ0LwkDRNytVpHMFUsZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="226773907"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2025 02:48:58 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJUsq-0005BX-0e;
	Thu, 13 Nov 2025 10:48:56 +0000
Date: Thu, 13 Nov 2025 18:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v1 3/5] Input: gpio_decoder - replace custom loop by
 gpiod_get_array_value_cansleep()
Message-ID: <202511131832.JljMfKrW-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-004-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131832.JljMfKrW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131832.JljMfKrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131832.JljMfKrW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/input/misc/gpio_decoder.c:10:
   drivers/input/misc/gpio_decoder.c: In function 'gpio_decoder_get_gpios_state':
>> drivers/input/misc/gpio_decoder.c:38:67: error: 'val' undeclared (first use in this function)
      38 |                 dev_err(decoder->dev, "Error reading GPIO: %d\n", val);
         |                                                                   ^~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/input/misc/gpio_decoder.c:38:17: note: in expansion of macro 'dev_err'
      38 |                 dev_err(decoder->dev, "Error reading GPIO: %d\n", val);
         |                 ^~~~~~~
   drivers/input/misc/gpio_decoder.c:38:67: note: each undeclared identifier is reported only once for each function it appears in
      38 |                 dev_err(decoder->dev, "Error reading GPIO: %d\n", val);
         |                                                                   ^~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/input/misc/gpio_decoder.c:38:17: note: in expansion of macro 'dev_err'
      38 |                 dev_err(decoder->dev, "Error reading GPIO: %d\n", val);
         |                 ^~~~~~~


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

