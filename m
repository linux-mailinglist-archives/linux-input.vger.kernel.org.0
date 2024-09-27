Return-Path: <linux-input+bounces-6810-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA18988408
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 14:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E141F2845C2
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 12:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E94D18BC0A;
	Fri, 27 Sep 2024 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ezw3VrnR"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D734518BBB6;
	Fri, 27 Sep 2024 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727439501; cv=none; b=Jl/VtOJE5kJZLDBiNgOgko5ZtvSUSmwQjcYJyJ4RMi5m+bz58saxkKmUlWhRAEub/qUEsCpihnikZpLtLQ4NfGWzqeRAtH8zJ6HEGrklVdr3TaIbaY2tjPGlbHt1IvmcionQJS8UyRgiQBjbjFjvjVoRdSXWuMQI20mRF33tw8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727439501; c=relaxed/simple;
	bh=CfVVMD85UuddKb+TLEcOyQy/FEVpMkbkldwAhODi9Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljxZarg1W9j0zAek9G1aoC/GH0xhrw9Vo3jhrbhLiJvcnqtDLVQ1WAwvB+ZI17VfNo5pBoL48GnzVvnmPBdF108m8esCT4VI2x0/ElNLgXb428b3+Ft0eVn2H1ZOGlYz2L/5caFEaivkl1kE5oMQUJ8QuBOjZ+peCE+oefMD/V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ezw3VrnR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727439500; x=1758975500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CfVVMD85UuddKb+TLEcOyQy/FEVpMkbkldwAhODi9Wk=;
  b=Ezw3VrnRerQqNafrUcMvJb7o8U5PDf90qYgSD9N44GYk9DiQjiSnrNDu
   BUWyqEhYLPhGJhiLmYO4BtLx3Vj59UF1nirQbagAF4d9eZrYuQQCe25hJ
   +TrP1pwG/ING+js1nDaNisG3QRvWuUEwS4wz3UvFu3uxFbHIA8hsn8F/U
   eBHBfGkWKmqAKKh1i2r2SoUcZEwcPbFNi0VQSueMRoXxMI0eBq3IbU8yR
   fbN8lQvsUGZC6d/d2rB++N4g6FPrMsdzdHZwHhfrzqf5oLrl9mZNgVn+j
   h7aDY1i5yYjWJXnSHW8qg4526b/heSuZ+IKvW+cfWenInRGD1V+eS06YC
   Q==;
X-CSE-ConnectionGUID: MGO+SFvxQfyO9gpzheWrVw==
X-CSE-MsgGUID: xZCUIctFRpe6NVe+KvsJPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26048916"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26048916"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 05:18:19 -0700
X-CSE-ConnectionGUID: jOvYryP6SpeUsh1MMxehQA==
X-CSE-MsgGUID: fJOPsJg5R/KqL0vzKSKsxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77354219"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Sep 2024 05:18:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su9vI-000Lsx-1N;
	Fri, 27 Sep 2024 12:18:12 +0000
Date: Fri, 27 Sep 2024 20:18:11 +0800
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
Message-ID: <202409271950.jUMzgCG8-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO-NB04-devices/20240927-014628
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240926174405.110748-2-wse%40tuxedocomputers.com
patch subject: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
config: i386-alldefconfig (https://download.01.org/0day-ci/archive/20240927/202409271950.jUMzgCG8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271950.jUMzgCG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271950.jUMzgCG8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.o: in function `tuxedo_nb04_wmi_ab_driver_init':
>> tuxedo_nb04_wmi_ab_init.c:(.init.text+0xb): undefined reference to `__wmi_driver_register'
   ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.o: in function `tuxedo_nb04_wmi_ab_driver_exit':
>> tuxedo_nb04_wmi_ab_init.c:(.exit.text+0x9): undefined reference to `wmi_driver_unregister'
   ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.o: in function `__wmi_method_buffer_out.constprop.0':
>> tuxedo_nb04_wmi_util.c:(.text+0x52): undefined reference to `wmidev_evaluate_method'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

