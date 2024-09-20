Return-Path: <linux-input+bounces-6627-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6374097DAB4
	for <lists+linux-input@lfdr.de>; Sat, 21 Sep 2024 01:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AF211C211BA
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 23:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA8518D63B;
	Fri, 20 Sep 2024 23:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR32iEPI"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8DF1C693;
	Fri, 20 Sep 2024 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726873702; cv=none; b=TuQKxHLeAq8+PtNqhvP718lupet5CglME1avfgz4jUE/LZYDbsmhYsQTZYbholi6Jl/a7eyZfb659TMrT61bacyhzqvRn8abhfat52LxgabdsvLDNWxFRV5Sds1A5xoChAWjwTq1d4AggK7sst7M9yoKMwRxEsgX5/2DQw+cqHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726873702; c=relaxed/simple;
	bh=n56m61Kl9DwYCLtqidIMx41TFAMLRpqmR7mkeyGZe0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5jalBS4RGz0bFgIk123b1WmFk3W4YQex6b16+Gro0J50iGNCqZdMTOcIIafeuwmjJ7Y1Agfto8cJfDFNEBhQNawnamG3M4Fz93OAbqxcVMljP8icyhDktzYYZelnsWDfQL9WKzRPao6ghdsb/3FJAdvqtPGwQguHmDO/GysyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR32iEPI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726873700; x=1758409700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n56m61Kl9DwYCLtqidIMx41TFAMLRpqmR7mkeyGZe0c=;
  b=mR32iEPI5jb+6OfXRCDs193q7qz9tLxkD1zMcb8RR4cxOdjh61GIAuYc
   lB7MEYRHxLTH9breqOpaYzMJNThk+0EcLR+aHJpqSKgXhXsjcbVQ/ED68
   F6JLML2tEemY1d/+gozV9s2kV+XhhdHwlzjd0S7kuTJiwmCw23IJAnaFF
   D/yoPz6BUjSLvLjoL9DudJE27OTuf21MzS6lXU3LU9+pfuB16RYo98ZcZ
   Bg/cv5F16UzAiWmgXMLRmHXW9tpPGxo6WPhPSXXO39ezhD3cKiOTLuGuj
   HKOOpLcm9xKUggit0qSNsM+0bY/zDPql/YK6U0wOqCccjlBdUHtH6x8JU
   w==;
X-CSE-ConnectionGUID: gdRkb6gYRhmA8phCPaVzxQ==
X-CSE-MsgGUID: wQALtvwLQrixIMvOme/sKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29687670"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="29687670"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 16:08:19 -0700
X-CSE-ConnectionGUID: mTeLW5O5TNG7Od4wLzJ+XA==
X-CSE-MsgGUID: S9ImTKaTQASOh24ll39QOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="70457327"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Sep 2024 16:08:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srmjW-000EvB-38;
	Fri, 20 Sep 2024 23:08:14 +0000
Date: Sat, 21 Sep 2024 07:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com, Vishnu Sankar <vishnuocv@gmail.com>
Subject: Re: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys
 using raw  events.
Message-ID: <202409210619.eaTT5ACU-lkp@intel.com>
References: <20240917100432.10887-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917100432.10887-1-vishnuocv@gmail.com>

Hi Vishnu,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishnu-Sankar/hid-hid-lenovo-Supporting-TP-X12-TAB-1-2-Kbd-Hotkeys-using-raw-events/20240917-180639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240917100432.10887-1-vishnuocv%40gmail.com
patch subject: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys using raw  events.
config: parisc-randconfig-r062-20240921 (https://download.01.org/0day-ci/archive/20240921/202409210619.eaTT5ACU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409210619.eaTT5ACU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210619.eaTT5ACU-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/hid/hid-lenovo.o: in function `lenovo_raw_event':
>> hid-lenovo.c:(.text+0x1958): undefined reference to `platform_profile_cycle'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

