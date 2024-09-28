Return-Path: <linux-input+bounces-6847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B17988E7C
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 10:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4E891C20FD1
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 08:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C686619E995;
	Sat, 28 Sep 2024 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrp4Eeml"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0995719E99D;
	Sat, 28 Sep 2024 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727511910; cv=none; b=OhO4KMBZUzYuALeEOVB//M0I8SkFliQX8VkYAzwKmDEb7+e4G9TuZR1W9zTqMDwAWvExw3Iq5RVCoPvAkbAI55x74H2rq3STxLHU5XjzqVDk70b1iRztlqWIXU8svtwyuq+B/hpucnWHugWXapLcm+zGEgTawF6T9hBZ8VON5pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727511910; c=relaxed/simple;
	bh=eP/TnfqxHVi8bnCA6ntB7xSf069JnDxMZXL23L7xJIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2Wph709wJM+SJh/EDlpMq9JZJqdv6mmbNISkrOrWF1W9mpkSAUSgQdZPFWVh1taqcA1hx0O4VsiM26op5T7dSJGJaX4/otQ/NSqZvLsNPImkFKs9Xtd5cDbDpxccOBXqTeNWEDXcv8CWWJrmEs9xeA7+oK75njqFCrQUL34HJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrp4Eeml; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727511909; x=1759047909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eP/TnfqxHVi8bnCA6ntB7xSf069JnDxMZXL23L7xJIs=;
  b=mrp4EemlYlTjVdVAr6+dKGtsiVUhu5LD0+h0EcVMXT9VvzQiKgL7tFFH
   ouWprkVwNE9REySokM6VKn7HerWe8UHQhf5CVZFf+kY+L/xc7nvFQzqgl
   byEAGTv6dpllcCdYhMYldzV1/dSyvkqPOMdVbYz6OLG4UQLs8Fjc5wzYI
   NR+RlQZ9dsvn7rk2jPju/pWD8N2oYhCJmboB7pHb64dbYcE5tlMHCCgMh
   6me7lDq6B+XlaU8CBDEV+5u/nn58/yFlyLVmYla5OV+bWNth+UH1+Epy8
   nMtyLp4oSj2IUMHdTpfG6lBsPnJQQPfjTBJMacYuce8oP5YTabRftpSTA
   w==;
X-CSE-ConnectionGUID: IcVDsx0FShejPaN3aBoNbA==
X-CSE-MsgGUID: P+2MVlvVTcqiQoaqv+++Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30547202"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30547202"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:25:08 -0700
X-CSE-ConnectionGUID: D1KuRM6aQeKBN7hDKSOj6w==
X-CSE-MsgGUID: EuvC2xSqR02LyuujdFQCxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103578910"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Sep 2024 01:25:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suSlC-000N27-0K;
	Sat, 28 Sep 2024 08:25:02 +0000
Date: Sat, 28 Sep 2024 16:24:43 +0800
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
Message-ID: <202409281630.xJUVwU5V-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281630.xJUVwU5V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281630.xJUVwU5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281630.xJUVwU5V-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `remove':
>> drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c:67: undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `__wmi_method_acpi_object_out':
>> drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c:26: undefined reference to `wmidev_evaluate_method'
   ld: vmlinux.o: in function `ll_parse':
>> drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:355: undefined reference to `hid_parse_report'
   ld: vmlinux.o: in function `tuxedo_nb04_virtual_lamp_array_add_device':
>> drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:721: undefined reference to `hid_allocate_device'
>> ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:734: undefined reference to `hid_add_device'
>> ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:736: undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `tuxedo_nb04_wmi_ab_driver_init':
>> drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c:86: undefined reference to `__wmi_driver_register'
   ld: vmlinux.o: in function `tuxedo_nb04_wmi_ab_driver_exit':
>> drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c:86: undefined reference to `wmi_driver_unregister'


vim +67 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c

    62	
    63	static void remove(struct wmi_device *wdev)
    64	{
    65		struct tuxedo_nb04_wmi_driver_data_t *driver_data = dev_get_drvdata(&wdev->dev);
    66	
  > 67		hid_destroy_device(driver_data->virtual_lamp_array_hdev);
    68	}
    69	
    70	static const struct wmi_device_id tuxedo_nb04_wmi_ab_device_ids[] = {
    71		{ .guid_string = "80C9BAA6-AC48-4538-9234-9F81A55E7C85" },
    72		{ }
    73	};
    74	MODULE_DEVICE_TABLE(wmi, tuxedo_nb04_wmi_ab_device_ids);
    75	
    76	static struct wmi_driver tuxedo_nb04_wmi_ab_driver = {
    77		.driver = {
    78			.name = "tuxedo_nb04_wmi_ab",
    79			.probe_type = PROBE_PREFER_ASYNCHRONOUS,
    80		},
    81		.id_table = tuxedo_nb04_wmi_ab_device_ids,
    82		.probe = probe,
    83		.remove = remove,
    84		.no_singleton = true,
    85	};
  > 86	module_wmi_driver(tuxedo_nb04_wmi_ab_driver);
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

