Return-Path: <linux-input+bounces-7091-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF365991382
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 02:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85989B220CE
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 00:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9524C91;
	Sat,  5 Oct 2024 00:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+5HWJ/e"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50E4C9F;
	Sat,  5 Oct 2024 00:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728088311; cv=none; b=I2/HuGzTX1HWBlt0pWIkTsL8EDb8BsXw4yPI5yu+mZFS+49H1jY15HctJSyIgi3gPd/TLXRlTaVR5R4ShdCWwBzJ6El1fnZyl0MMn7jEANtMWrN9CQiOtycDcf1X/ovD5OjqieE4+UrCMm9Hv+GOuQSASAzV7WO22JexWDSh5hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728088311; c=relaxed/simple;
	bh=MWATiQ5I6VIj3BVzjkw3ESahCCu58nlThuw47mMQ8ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kV96yRB7XqXjv3AptvFDWQIN/33sVA+ZtSTtpDiS4aTaCOiIEqvt7VD5uWSJN5ywLXCKjzQZkuZq/2lGKXcXdqVXMiICdIUdxHADyUFXvPNOjt9oEuUOJvWpbxwcYvOJKkrBWaF3plff25z30Dn1zPt50U23sc8NnNUUZAW4R9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+5HWJ/e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728088309; x=1759624309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MWATiQ5I6VIj3BVzjkw3ESahCCu58nlThuw47mMQ8ng=;
  b=A+5HWJ/euCDajhTwIbZKsvIa/OUjcslPBQGO2WgNQd0X7JOdL3xy0Qlk
   dkSfuu5Az8np8rP3HL1MAWRKz81Q3/qPHF/KhH1336ufZDjeML3gQQMmM
   KDaCmmG7evxtz+3pALv9GvWKXNzXy6XWkD3jZWYHHoxkyq8ZDRhiuVbql
   Uy6TA61yyCbCFxtc3JXxN5GLfqN2qD6z74rdg6szlf6J8EfE29U3sX6tH
   XoQwndaobYGsRzjfJ6Msm6+uKa7VOWvVGugp0RrhdrVJn4XqBtiZ+F76P
   6Ighj2PLlyLMTSc9J5W0qVFIUwGv0jlUYUFlCv7QXdPvl7niQRgIc0Ibk
   w==;
X-CSE-ConnectionGUID: LIeA783WQ02AyvCwN9tOFA==
X-CSE-MsgGUID: yzwQ/gKPRYq6JdDS6MLjUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26789030"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="26789030"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 17:31:49 -0700
X-CSE-ConnectionGUID: jXYCXlquSZagKbT/nUbuEg==
X-CSE-MsgGUID: 21n+kBPpRgy2h1ApTOAzxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="75684749"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2024 17:31:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swsi0-0002NQ-2q;
	Sat, 05 Oct 2024 00:31:44 +0000
Date: Sat, 5 Oct 2024 08:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com, Vishnu Sankar <vishnuocv@gmail.com>
Subject: Re: [PATCH] hid-lenovo: Support for TP-X12-TAB-1/2 Kbd Fn keys that
 use HID raw events.
Message-ID: <202410050809.Rgpf9KE6-lkp@intel.com>
References: <20241003095124.7611-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003095124.7611-1-vishnuocv@gmail.com>

Hi Vishnu,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishnu-Sankar/hid-lenovo-Support-for-TP-X12-TAB-1-2-Kbd-Fn-keys-that-use-HID-raw-events/20241003-175338
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20241003095124.7611-1-vishnuocv%40gmail.com
patch subject: [PATCH] hid-lenovo: Support for TP-X12-TAB-1/2 Kbd Fn keys that use HID raw events.
config: i386-buildonly-randconfig-005-20241005 (https://download.01.org/0day-ci/archive/20241005/202410050809.Rgpf9KE6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050809.Rgpf9KE6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050809.Rgpf9KE6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-lenovo.o: in function `lenovo_raw_event':
>> hid-lenovo.c:(.text+0x1297): undefined reference to `platform_profile_cycle'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

