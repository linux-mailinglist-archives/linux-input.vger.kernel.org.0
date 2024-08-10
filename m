Return-Path: <linux-input+bounces-5473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBF294DA43
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 05:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 932F31F21FC8
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 03:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CDA61FF2;
	Sat, 10 Aug 2024 03:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0BusgFh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B9179BC;
	Sat, 10 Aug 2024 03:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723259724; cv=none; b=s2Ll9QgeKThN/haSpIQwDaKyZq8pLGJo248xQTkBRqTMxRGm9RLNKYywzQVWhXSbOHDBKYawIpLArcHrN0W4qEHlpYLAYs3hi4xpY1ORk9I954llDsUknzIQqUQv1/nxPnDIJ0pE8u0x6cX9pEyPy0H2VBAFKhpPZspp4Juje48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723259724; c=relaxed/simple;
	bh=O9KoFdDnMMbLwa3iE08BPsmUNtkolKPePIVJLiReEDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7o+oDEVe7MM8fiWHTtPbKFEwUgdW1JMh2DvpldyUROq2vU69TAAieVcCSDXSCcTsceRLUhErX/5iUsG1slQhsRgWUf+bPc9OOta+YAKy/6p69SGWLrMisnkeFn4s6DZ87jhPNxkusqNFw10JUMAjs5RT64u/yWCszeR63NjwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0BusgFh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723259723; x=1754795723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9KoFdDnMMbLwa3iE08BPsmUNtkolKPePIVJLiReEDo=;
  b=h0BusgFhK5BQ0BaGChT56C+Kg7A1S0C94Zj9AmwBRsZrKH8yiB8s2b2v
   JpIICdlfPHyILLYujt/VVAR1g2+Y+17RY8S3M3o4epWbVZ++3q7maIN/F
   cbTWBBwTxZd/bEjBbU7kOKa2UbIKqyhGKb+Cn8+aUBrlshAi+bT+P5snl
   bTI0v0XfeL1vHjQrrOeqo/Cx4q2JI9FXvJzHphhWQwJDwu9hOOfO18W9b
   BrQc79beQqa/67G0sxPxjO28VPNq49qu/GVKYs/qEloxHFd5Ue6iopnxZ
   MembK2E863ITvHRQALNr58Sv1fjzUeQTc8/t5KcodIv7KxHLofjDTe1Ws
   A==;
X-CSE-ConnectionGUID: p3Tj0tAjT5Oa+pLbWQgDfQ==
X-CSE-MsgGUID: XHJ10sb1Swmn4iAlowq/eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32124232"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="32124232"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 20:15:21 -0700
X-CSE-ConnectionGUID: thWUoZKZS8GOunRq0xE3Tg==
X-CSE-MsgGUID: hJybC2d4R9ikc5O+20Ul/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="57408512"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Aug 2024 20:15:20 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sccZZ-0009Yj-2t;
	Sat, 10 Aug 2024 03:15:17 +0000
Date: Sat, 10 Aug 2024 11:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Hutterer <peter.hutterer@who-t.net>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hidraw - add HIDIOCREVOKE ioctl
Message-ID: <202408101044.nmAzxQqQ-lkp@intel.com>
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
config: x86_64-randconfig-102-20240809 (https://download.01.org/0day-ci/archive/20240810/202408101044.nmAzxQqQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101044.nmAzxQqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408101044.nmAzxQqQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hidraw.c:41:22: warning: no previous prototype for function 'hidraw_is_revoked' [-Wmissing-prototypes]
      41 | __weak noinline bool hidraw_is_revoked(struct hidraw_list *list)
         |                      ^
   drivers/hid/hidraw.c:41:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | __weak noinline bool hidraw_is_revoked(struct hidraw_list *list)
         |                 ^
         |                 static 
>> drivers/hid/hidraw.c:47:21: warning: no previous prototype for function 'hidraw_open_errno' [-Wmissing-prototypes]
      47 | __weak noinline int hidraw_open_errno(__u32 major, __u32 minor)
         |                     ^
   drivers/hid/hidraw.c:47:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | __weak noinline int hidraw_open_errno(__u32 major, __u32 minor)
         |                 ^
         |                 static 
   2 warnings generated.


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

