Return-Path: <linux-input+bounces-5604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19D954D29
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 16:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AE80B257D2
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 14:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109881BF331;
	Fri, 16 Aug 2024 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3ghxTJa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A981BF334;
	Fri, 16 Aug 2024 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723819803; cv=none; b=KpC/pXXf3iNmGhgDXZeWqaG62nJFqovyuJbr75dTfk2WCkHAMuqiJHI7DpjBmEQ5BB1kR3JBiOoOLyEgGwwEO/YpNbYtKkfIvj3YgD30cju3LPNJ2Fv6B2UU41ZR99Gz3HCrXDE9Ay6eVeQ3Sk0IBc1AJLkfm5ECtEVY1KjUqU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723819803; c=relaxed/simple;
	bh=TVvyNQ4JTKhP8ZePQ5yHX8ZJ1kIfRyWT6dFWdabi0qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkoqTC5uld14F8gKB4wqyF5X0JYJF8kQoxLTJLsC3Hl6622JhNJQjLUA6KOmaNnPc7WWxhMSWAXB1LQ7IqTW2+opaW2qH/U7+91ocacRmYkgshAeyT42hKJa4gjrJWK7wIPVY38LmsoGIgxbtBS89dhJoQvg0Lt5Jyf4k46ywk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3ghxTJa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723819802; x=1755355802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TVvyNQ4JTKhP8ZePQ5yHX8ZJ1kIfRyWT6dFWdabi0qI=;
  b=A3ghxTJaHjMp531bZRFgk9ZtPBpcly9zucMUfKh4ijobVnlhLm9vAWGS
   /3SwudyxWBKCYCma5F24OSTq/0+31PkUTifggb1CCX4J0iL5xdzGj6TgU
   BKDNjZBx0nGUfBZn3qtShl3n/ixJoy9nwkfu8c1Uh+a0tgLLvPrXX5l3z
   4tsomWtJ9ep1pTcBEYJ1t/M9pxTahuC+ZCC1ILhBlfUU9MS8arhYzv6p5
   CrE2iH9xWPd7CQNCNZvRI6oMJ+TRU40nS5lNKwhJvGSfpUoPsgwhxenQr
   7ogdIu2SsAz2WLbdA6NXosS7D/5d/7tqNTkaVQ9DJlMve8nSbCBPYyupi
   w==;
X-CSE-ConnectionGUID: jt6wUZZyRtqI37rFzM6esQ==
X-CSE-MsgGUID: P9ZXfkHxSLaK053lL/bQJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33503009"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="33503009"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 07:50:01 -0700
X-CSE-ConnectionGUID: dsiHfzOXRpSjcW2ydIHECg==
X-CSE-MsgGUID: RzONDTMJQxGm4uNL4lGqjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="60247348"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2024 07:49:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seyH6-0006Wg-1g;
	Fri, 16 Aug 2024 14:49:56 +0000
Date: Fri, 16 Aug 2024 22:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: corsair-void: Add Corsair Void headset family driver
Message-ID: <202408162236.nuV8tt6o-lkp@intel.com>
References: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com>

Hi Stuart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stuart-Hayhurst/HID-corsair-void-Add-Corsair-Void-headset-family-driver/20240815-004208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240813153819.840275-3-stuart.a.hayhurst%40gmail.com
patch subject: [PATCH] HID: corsair-void: Add Corsair Void headset family driver
config: parisc-randconfig-r131-20240816 (https://download.01.org/0day-ci/archive/20240816/202408162236.nuV8tt6o-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240816/202408162236.nuV8tt6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162236.nuV8tt6o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-corsair-void.c:405:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] send_sidetone @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-corsair-void.c:405:23: sparse:     expected unsigned short [usertype] send_sidetone
   drivers/hid/hid-corsair-void.c:405:23: sparse:     got restricted __le16 [usertype]

vim +405 drivers/hid/hid-corsair-void.c

   395	
   396	static int corsair_void_send_sidetone_wired(struct device *dev, const char *buf,
   397						    unsigned int sidetone)
   398	{
   399		struct usb_interface *usb_if = to_usb_interface(dev->parent);
   400		struct usb_device *usb_dev = interface_to_usbdev(usb_if);
   401		u16 send_sidetone;
   402		int ret = 0;
   403	
   404		/* Packet format to set sidetone for wired headsets */
 > 405		send_sidetone = cpu_to_le16(sidetone);
   406		ret = usb_control_msg_send(usb_dev, 0,
   407					   CORSAIR_VOID_USB_SIDETONE_REQUEST,
   408					   CORSAIR_VOID_USB_SIDETONE_REQUEST_TYPE,
   409					   CORSAIR_VOID_USB_SIDETONE_VALUE,
   410					   CORSAIR_VOID_USB_SIDETONE_INDEX,
   411					   &send_sidetone, 2, USB_CTRL_SET_TIMEOUT,
   412					   GFP_KERNEL);
   413	
   414		return ret;
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

