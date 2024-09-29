Return-Path: <linux-input+bounces-6857-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C29098937C
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 09:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B714281969
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 07:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED08013A265;
	Sun, 29 Sep 2024 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzhI78dg"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352321F95A;
	Sun, 29 Sep 2024 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727595622; cv=none; b=KDu4Ng1QtrlvaKcHumfqrK5nHS0fw0LAqr37NgRfdwZtSuiW9YxgGDmLTpXleIkXtrNAWfl67EQ0dbG1rUruh0PPyTClPs7jC1BstQ372x4Z8LlezSveS9EfUiANILIrwhKIBvvQ0OwCd5cYRd7VbVxLT0Rp1hYxxpUBY3Gcxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727595622; c=relaxed/simple;
	bh=wGxWHk+iodS3mlP5Z/WAVJxfkUca1FSivOYcI33k12Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOxw9rS+pguJxJupCWDCHwspNFppxdumtfOuyRg4QazibNtrdlBKN8o8wJtiI3MfuByTX3hDJJpA8do39MIeTOrUVVNvxxuvIQQWJT2RoiQ7I0yehnuVCcUc3YGmLXxQmc7xyFboRrxfwFdpmnsuAlH4joIeOXwiTimfDapj87I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzhI78dg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727595621; x=1759131621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wGxWHk+iodS3mlP5Z/WAVJxfkUca1FSivOYcI33k12Q=;
  b=DzhI78dg07fnrOqIMyrvxsojzcdKeG4cFPYRPc5YRqsfif2y7gSrqip7
   gRfvINir80p5QLpA6xXj+rE7MjAZ6M+i4b3Nn4T+0udOeKG+deK2nMDPW
   zZOjvBUOLMnBbE40WmK132YeybXQ2armp/0sYkHVLIgW5Qfo9SY4Zotrp
   IwltwHAxjGJFc3RrFvDSwLUOhZBkLcHQCRQE7yKf8MP+Vaz64gJ+Dd8OY
   9PZzcZPOC5YL0o90dIXlJHe/xYbKiC9pNhCWftNtabMwHW6NTRcAphwBA
   wAbN4XLOZPBWCxpyKqRYybzZrsNPkdsisiiLpAYVoa+y59TTNc82uc3e3
   w==;
X-CSE-ConnectionGUID: huDAJOuHSnynAbPnAmD7CQ==
X-CSE-MsgGUID: AsksNixuTlWfhIxaLgRkbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="14316084"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="14316084"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 00:40:19 -0700
X-CSE-ConnectionGUID: BRz8Q1I7TBONv/YhKerRsA==
X-CSE-MsgGUID: EYnfQ/ESSlCH4dbbLCZaSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="96297876"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Sep 2024 00:40:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suoXN-000O0D-23;
	Sun, 29 Sep 2024 07:40:13 +0000
Date: Sun, 29 Sep 2024 15:39:55 +0800
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
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <202409291428.gVFlS4L1-lkp@intel.com>
References: <20240927124152.139099-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927124152.139099-2-wse@tuxedocomputers.com>

Hi Werner,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO/20240927-214157
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240927124152.139099-2-wse%40tuxedocomputers.com
patch subject: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
config: x86_64-buildonly-randconfig-003-20240929 (https://download.01.org/0day-ci/archive/20240929/202409291428.gVFlS4L1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291428.gVFlS4L1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291428.gVFlS4L1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.o: in function `remove':
>> tuxedo_nb04_wmi_ab_init.c:(.text+0x34): undefined reference to `hid_destroy_device'
   ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.o: in function `ll_parse':
>> tuxedo_nb04_wmi_ab_virtual_lamp_array.c:(.text+0xdbd): undefined reference to `hid_parse_report'
   ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.o: in function `tuxedo_nb04_virtual_lamp_array_add_device':
>> tuxedo_nb04_wmi_ab_virtual_lamp_array.c:(.text+0xeff): undefined reference to `hid_allocate_device'
>> ld: tuxedo_nb04_wmi_ab_virtual_lamp_array.c:(.text+0xfbb): undefined reference to `hid_add_device'
>> ld: tuxedo_nb04_wmi_ab_virtual_lamp_array.c:(.text+0x1004): undefined reference to `hid_destroy_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

