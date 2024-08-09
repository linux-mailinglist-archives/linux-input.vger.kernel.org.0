Return-Path: <linux-input+bounces-5470-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB07394D4E5
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 18:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C2411C20E7B
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 16:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA97220328;
	Fri,  9 Aug 2024 16:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIdkZEd0"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA96381D9;
	Fri,  9 Aug 2024 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723221876; cv=none; b=aFdYou7Uw7NHEe0hB2FPFnKlzNfCnLg+8v0WKl42JAdLkqLxYq4vnfWRmrQl+TZznW+pTTrs46bLOFsVPSsYt1VPZyE6Y2byH4GY5PBfT63pvIw3gvJJTEDL6cGYw1URvVHxnUSqpmxTMMsW07tKX+N6ZNb/tWy0wwaQ0qr/61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723221876; c=relaxed/simple;
	bh=vLE2cjx+eGlTzAhIetya+WWnuf0ErM3c6dyZ/onkUFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljOdYVHKZXLP1Uo1+s24IQr/syM81hNJsWoWOcxX88/idG/NjyE4l6l8bpxROMlc/eC2mnOfdJCMwO10xjq7DVsBqWnclWTP4+aFrlbNVJK4zjuk3SWImYjrJJoxjaJBg3CY6KIMaKvQlXM1hq4cfm32CIVncMdWgPBx+4CPA0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIdkZEd0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723221875; x=1754757875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vLE2cjx+eGlTzAhIetya+WWnuf0ErM3c6dyZ/onkUFc=;
  b=LIdkZEd0Kesm6ACKzuNpqqdGRdmAE7j8zwQABwffF6m2qXNgweVJoeFB
   mPaPpCb2wCKfRCKtVsBav/ZBgmNzKplWylwT6lNzhcYItQ347lvL80KLT
   k0LG09jxmooTmhaUjdpwMVBcmHBRGBHd4IgKyPw8x2GB7YgOR4hgPR+bK
   cuW7Dk9jFyN/2Qtp2ChSV84aMpBePbcCkbtXJLvViwchtp6TDEvDY75wz
   y4dBAGAfz0nwEFqVQkw5NUFuaxgz+sNhgdAy3axsP0BoctfFxBsNdSk2n
   NaLJhkK4kJ97sNgjsRfWaOv/Wm6ckYbL7o5T2E7hG11ukJRgRDtrOprRU
   g==;
X-CSE-ConnectionGUID: ljRL99NsTT6db0M8wKS8MQ==
X-CSE-MsgGUID: hwvaDGgpRsiceN1qvxwo0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21284318"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="21284318"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 09:44:34 -0700
X-CSE-ConnectionGUID: Kpg+x0KOQn2Xht89cUizQg==
X-CSE-MsgGUID: e7B76N61TUyKXw8NmPYnuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57842290"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2024 09:44:33 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scSj7-0008ii-2s;
	Fri, 09 Aug 2024 16:44:29 +0000
Date: Sat, 10 Aug 2024 00:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Hutterer <peter.hutterer@who-t.net>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hidraw - add HIDIOCREVOKE ioctl
Message-ID: <202408100004.Lp6vMaKd-lkp@intel.com>
References: <20240809100342.GA52163@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809100342.GA52163@quokka>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Hutterer/HID-hidraw-add-HIDIOCREVOKE-ioctl/20240809-202833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240809100342.GA52163%40quokka
patch subject: [PATCH v2] HID: hidraw - add HIDIOCREVOKE ioctl
config: i386-randconfig-052-20240809 (https://download.01.org/0day-ci/archive/20240810/202408100004.Lp6vMaKd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100004.Lp6vMaKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100004.Lp6vMaKd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hidraw.c:41:22: warning: no previous prototype for 'hidraw_is_revoked' [-Wmissing-prototypes]
      41 | __weak noinline bool hidraw_is_revoked(struct hidraw_list *list)
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/hid/hidraw.c:47:21: warning: no previous prototype for 'hidraw_open_errno' [-Wmissing-prototypes]
      47 | __weak noinline int hidraw_open_errno(__u32 major, __u32 minor)
         |                     ^~~~~~~~~~~~~~~~~


vim +/hidraw_is_revoked +41 drivers/hid/hidraw.c

    40	
  > 41	__weak noinline bool hidraw_is_revoked(struct hidraw_list *list)
    42	{
    43		return list->revoked;
    44	}
    45	ALLOW_ERROR_INJECTION(hidraw_is_revoked, TRUE);
    46	
  > 47	__weak noinline int hidraw_open_errno(__u32 major, __u32 minor)
    48	{
    49		return 0;
    50	}
    51	ALLOW_ERROR_INJECTION(hidraw_open_errno, ERRNO);
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

