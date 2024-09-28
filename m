Return-Path: <linux-input+bounces-6844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41847988E5A
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 10:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 098AB2828CF
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 08:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D758719DF82;
	Sat, 28 Sep 2024 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLK1S68w"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D3613A40D;
	Sat, 28 Sep 2024 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727510650; cv=none; b=Qs4rvJl7toGY8vU10i8rkG5W4XwQ0tDPdldCOXc9cYUwIThK2ZP25FzUSKv5dxuK/S//iQLe2pmIdkXAuJVu2pAuQYWtv66GvlszD72cWm7oz8Cot3Jss0/HTUuImM9nfgvNL2PLsZf9mF8Nkp40wdqmah6uD3XT7wGuBwTSDGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727510650; c=relaxed/simple;
	bh=iYwiwZZbcYBs1YE9u1895Apadus7z72Bxx4TTaVUpUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzkuNA+lH5lUCZOrduMI7X09qQEXuebXA9qpbC5CPnx61V6p+gumOWFZna81/poYSMCW0Y3PyYhcvtImyKMNbN/o2/pUweBiS8fO+qJKJywA2TXupcjAEpWGzAYE+jApMiU6TVzHI5SpPODT0qTNYkDXE6hU3ZkP229RNkEkoJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLK1S68w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727510649; x=1759046649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iYwiwZZbcYBs1YE9u1895Apadus7z72Bxx4TTaVUpUc=;
  b=FLK1S68waFTiaLSREZYWatNLSkp1urP33T8hASWa2t6Xw2QhB3eWRMYL
   sQemx+VOqeTYb5hHsRyfaRq1+LA/Dz3tQSz/n5o/yFyFeJN7RsdOjcFOB
   IfQcnRo3kPTWuEeavOUcVcDJQLacQET5j7cbHagistH5EN3RakTdiUX/s
   UH43qYFkeJFmNg8s/pRk0mHkZWDvvi9ehXz2vQFwH+Fa0odILPwACQF0D
   os1+63sYHuA0L+KfVcVq8wgqRurdE4zJ0ipclaIMY1/vwFviKZzldSC5V
   JElbF7gRqoAuHavM4/vt1RSDkdgJTB1GYPtlYTWzxaqvtogXPkWeKFJl/
   A==;
X-CSE-ConnectionGUID: oeOId70DRPCzSXn09cEwfw==
X-CSE-MsgGUID: i5zn4qx8QyOmWmubOt0OBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37331703"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37331703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:04:08 -0700
X-CSE-ConnectionGUID: 5dMSq6rWRAaEU6u8vUhqEQ==
X-CSE-MsgGUID: ZEojGvVpSUqDqljoa2Fw0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72831532"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2024 01:04:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suSQr-000N1Q-1O;
	Sat, 28 Sep 2024 08:04:01 +0000
Date: Sat, 28 Sep 2024 16:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, bentiss@kernel.org,
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
	lee@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
Message-ID: <202409281513.tYxQaGoH-lkp@intel.com>
References: <20240927141745.145176-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927141745.145176-1-wse@tuxedocomputers.com>

Hi Werner,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO-NB04-devices/20240927-221932
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240927141745.145176-1-wse%40tuxedocomputers.com
patch subject: [PATCH v3] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
config: x86_64-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281513.tYxQaGoH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281513.tYxQaGoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281513.tYxQaGoH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
ERROR: modpost: "hid_destroy_device" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
>> ERROR: modpost: "wmidev_evaluate_method" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
>> ERROR: modpost: "wmi_driver_unregister" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
>> ERROR: modpost: "__wmi_driver_register" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
ERROR: modpost: "hid_parse_report" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
ERROR: modpost: "hid_add_device" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
ERROR: modpost: "hid_allocate_device" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

