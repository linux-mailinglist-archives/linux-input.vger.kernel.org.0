Return-Path: <linux-input+bounces-11011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA8A6A36D
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 11:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C28D7A94AF
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 10:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7BE21481B;
	Thu, 20 Mar 2025 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUzMyr+Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23061EEA56;
	Thu, 20 Mar 2025 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742465953; cv=none; b=WY6JdFoEFbzHLE3p/TjVBUMDHSNH3koQhgy6rCB34WGl33DWl98jqgp8vK1OEHX3/keDB99JVbpk+lAeSvlDELx/IQIenhs7iY/0niRzN2Tsb6+mUkMrs9hutQLGii+2/DaWWzsFan9LfFp9IArOm1eAMSpiVvPzMPMTn/8tBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742465953; c=relaxed/simple;
	bh=8WDPQ7/wmjD0kkZAXaPY1dsidVCmiWqFIXWkKeaRNEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWeUenCHOpaJz+6vCf3yr3KK3T6Coklp0TSG+/BGAz6tJL8vj/nAy6Ed44zGhkgDrMRMvaO5s7Xd2wJKMFbPVdK8LT6Z7QQfLDiqYnlniSFiSAsukap5R47KI4P4OwWZQ6BS2kd6CuJ/OSvksHA7YeZICphBHwIVEqSS/9x1qCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUzMyr+Y; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742465952; x=1774001952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8WDPQ7/wmjD0kkZAXaPY1dsidVCmiWqFIXWkKeaRNEw=;
  b=YUzMyr+Y/bVgJt92QxYMiPnQtMUpIQMO62HNnKdSKGTPMBe5a+h5f5td
   AbY0GBj/znuIFWDHihZ2YroXZyuTFLMekz/deztdDNFpChMEdDYC5CO53
   dh78GhdVUHTM8lKEnhk0OON/Oim1FskTD8jXgkfDJ0QhvDCUn1WfNgsCo
   nyhpmpFF4aV+apgGA+v8FhFWOJ2n6NTPRHZH/pA4s0WwuE9BGVRc1ct7c
   49ne9Dp5JfvCNNC4m/HCyV7Mqo4mdUyZCZGlQWNDIBEISs9RrVD7Ee7to
   VJtnCW03sk/uGf8QQ2TrePY0GwTpRfCETITGYICfzjurANKitCz6l6fVn
   Q==;
X-CSE-ConnectionGUID: uaq7BB6oQ8OLr7hQcTjz1A==
X-CSE-MsgGUID: R50ZMYAGTkmdNewX5WLP/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="66150346"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="66150346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 03:19:11 -0700
X-CSE-ConnectionGUID: 2aJi/B0kRWybmQ6SvR0Z9w==
X-CSE-MsgGUID: Hl5aCehrRqeOZpoxMUZ72g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="128143941"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2025 03:19:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvCzS-0000Mp-22;
	Thu, 20 Mar 2025 10:19:06 +0000
Date: Thu, 20 Mar 2025 18:18:41 +0800
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
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH 11/11] HID: asus: add support for the asus-wmi brightness
 handler
Message-ID: <202503201739.4NJJCyeZ-lkp@intel.com>
References: <20250319191320.10092-12-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319191320.10092-12-lkml@antheas.dev>

Hi Antheas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4701f33a10702d5fc577c32434eb62adde0a1ae1]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-refactor-init-sequence-per-spec/20250320-031740
base:   4701f33a10702d5fc577c32434eb62adde0a1ae1
patch link:    https://lore.kernel.org/r/20250319191320.10092-12-lkml%40antheas.dev
patch subject: [PATCH 11/11] HID: asus: add support for the asus-wmi brightness handler
config: s390-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201739.4NJJCyeZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201739.4NJJCyeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201739.4NJJCyeZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/hid-asus.c: In function 'asus_event':
>> drivers/hid/hid-asus.c:325:11: error: invalid use of void expression
       return !asus_brt_event(ASUS_BRT_UP);
              ^
   drivers/hid/hid-asus.c:327:11: error: invalid use of void expression
       return !asus_brt_event(ASUS_BRT_DOWN);
              ^
   drivers/hid/hid-asus.c:329:11: error: invalid use of void expression
       return !asus_brt_event(ASUS_BRT_TOGGLE);
              ^


vim +325 drivers/hid/hid-asus.c

   311	
   312	static int asus_event(struct hid_device *hdev, struct hid_field *field,
   313			      struct hid_usage *usage, __s32 value)
   314	{
   315		if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
   316		    (usage->hid & HID_USAGE) != 0x00 &&
   317		    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
   318			hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
   319				 usage->hid & HID_USAGE);
   320		}
   321	
   322		if (usage->type == EV_KEY && value) {
   323			switch (usage->code) {
   324			case KEY_KBDILLUMUP:
 > 325				return !asus_brt_event(ASUS_BRT_UP);
   326			case KEY_KBDILLUMDOWN:
   327				return !asus_brt_event(ASUS_BRT_DOWN);
   328			case KEY_KBDILLUMTOGGLE:
   329				return !asus_brt_event(ASUS_BRT_TOGGLE);
   330			}
   331		}
   332	
   333		return 0;
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

