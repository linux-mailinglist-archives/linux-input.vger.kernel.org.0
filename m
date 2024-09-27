Return-Path: <linux-input+bounces-6804-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C7398812E
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 11:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B4C81C20DD7
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 09:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06F3189B84;
	Fri, 27 Sep 2024 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6QFwfKk"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F3C433D9;
	Fri, 27 Sep 2024 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727428876; cv=none; b=mn+ddqVfn6jr9GT3WKv2bJRjPiqdTpoaaJNj3lFbtn4o+rmkuYZ6oBCW0CUHLq4Y6YHe27msp/DpFK9De1JvAvkq26XpW95+QcRXP8q/lvLJtNwwIKW0XH8VSs8Esyqw/loD9wtICSzLWl8Z6EmT6q2do0HbtEWrZws9Eawn3ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727428876; c=relaxed/simple;
	bh=Feg1rJf+Ok5MuyDp5qFLYt1e9SPAPqpO16Fov4Dpznc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkNxdUYUsi3vH3zNRS+/hpzNdwyndnLJK5b4pqlNPAZ+ZdHuXC/VeG4vLlW69TFmkpNEtce4xTCpIOMQvXwWnzhpLbsJmY+WAZeQ0bcitGchumlLE/gRznDI4f4Y1q3BGcqQHtQgjA5ktZOftq6xO/fl9LV83tQ8PvyZoFdT2Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6QFwfKk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727428875; x=1758964875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Feg1rJf+Ok5MuyDp5qFLYt1e9SPAPqpO16Fov4Dpznc=;
  b=k6QFwfKk7kL2WDSvS45zJjZh2xlnGQDXJdwBjTU2EU2ClPsSXY1FKvly
   RW9Ze0WF2RnONJ9Lz35KcvGYrh8+IYJLTLEHi0bKFONxrdOj2rO2orDae
   n5A9kVkOZvQFfMUavYqNDM2rfQdKxz5vXom/HhrCVnQeivD31lrPgfr9s
   ddadvs81qQNeVwfsaF3xbX+3YiZw+JXe3qWjMJRiIylpo22CP4f74wXyv
   W0Uq7LQmB9Y/rLffRbWP+LVgiWeLmsOTiH//IewxRZZFNRIXChxKta0/x
   LDvVC10oUclKe21BEwR/SI15ydgZOrsUlJxty/xjbx8wR2J9WnQCwfcW7
   g==;
X-CSE-ConnectionGUID: sYuU/lQ9QWy9MA4hRFXt3g==
X-CSE-MsgGUID: iTsafTYHSreAkvf53iSq2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44082372"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="44082372"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:21:14 -0700
X-CSE-ConnectionGUID: AXRdLICrR9C1Rt4gFoKHdQ==
X-CSE-MsgGUID: 5EBYGRSSQzin8++YidxWgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="76845810"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2024 02:21:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su79v-000Lkt-1g;
	Fri, 27 Sep 2024 09:21:07 +0000
Date: Fri, 27 Sep 2024 17:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, bentiss@kernel.org,
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
	lee@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	onitake@gmail.com, pavel@ucw.cz,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <202409271653.rAiw37rN-lkp@intel.com>
References: <20240926174405.110748-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926174405.110748-2-wse@tuxedocomputers.com>

Hi Werner,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip lee-leds/for-leds-next linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO-NB04-devices/20240927-014628
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240926174405.110748-2-wse%40tuxedocomputers.com
patch subject: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
config: i386-buildonly-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271653.rAiw37rN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271653.rAiw37rN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271653.rAiw37rN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c: In function 'll_raw_request':
>> <command-line>: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
   <command-line>: note: in definition of macro 'KBUILD_MODNAME'
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'pr_fmt'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:589:9: note: in expansion of macro 'dynamic_pr_debug'
     589 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:669:9: note: in expansion of macro 'pr_debug'
     669 |         pr_debug("Recived report: rtype: %u, reqtype: %u, reportnum: %u, len: %lu buf:\n", rtype,
         |         ^~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

