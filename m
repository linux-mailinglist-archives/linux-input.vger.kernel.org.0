Return-Path: <linux-input+bounces-16993-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BBD1439D
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 18:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2AC53015441
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AA7376BF8;
	Mon, 12 Jan 2026 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRqfxwzS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A24376BF3;
	Mon, 12 Jan 2026 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768237242; cv=none; b=pOCj9pIeBI1vVS+ONw8AYN8/zQO1+85VLpQWvTefp+2hae36PG3R9hZTgrJZWjZ3ZQ9u8OJgwMTxEgmedk0gxD5VNTX/hXDLOMvu3JCtbMUMlpU+QBMLIKdvo8mrjsfWFXTZ6pDOwIGGn3ubvOb67zb0mTRwwKDn73pjS78SE04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768237242; c=relaxed/simple;
	bh=qF61K2x/dTRZSzLm1gfFEGBiX89NQ0+CnDKlm5c8oD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IifC0VlI1Wv+NFErBV7MyZtZ0wrIcXrvfX8T3T3/GfcW186YFhIamnrc5xyAvmomxTGBcLwXd26MBkuKYk2Am97rpti/g9sS+W+bepOhkDjXTWSYu974wbrNvncpkjuLuKCee5gSf+xbjDjEDbxzbXLGDZkmdBJ+bjUjoEj/ny4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRqfxwzS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768237241; x=1799773241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qF61K2x/dTRZSzLm1gfFEGBiX89NQ0+CnDKlm5c8oD0=;
  b=kRqfxwzSDTp+G3LyEVoqQ0INzfd9RWUj/KL16IdUOU0TalKG4HTd26Qw
   A3NL9tzuplW2+5gXkpVGZjcIBX57X1aKjG0LMw83FsaqfSuV4j33NcWZC
   iXwKHZdbcesZ8jxnbfiACEh6aY1WyJ7M/32sPIPRaTGIoqqGOVtWTPQQb
   B3c8u+1k5lFLaFcPfsFwok3P8C96EF8dHJ1hszbbTPsy5iS/ZJqOFjrwK
   oTDYPuUNmTmrOa8A1BNF4mhTHilyRn1Nv0zfVAe4Lj1OcyISS5vC9Z/WS
   QEsV+HFDyXOxdZpcBU3hjsCY6+S9YNvVumnU8yqI+DVci/h4QKuYIZ+52
   g==;
X-CSE-ConnectionGUID: b6TlUKbKR9yPFRLslBJNsw==
X-CSE-MsgGUID: cmEk1UpmQL+fOE3c5lR8Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69500546"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69500546"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 09:00:41 -0800
X-CSE-ConnectionGUID: dYwOZXNnSpmU94NUInp3Eg==
X-CSE-MsgGUID: 465Xvgt1TgiPREs5noXBIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208289157"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2026 09:00:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfLHP-00000000DcW-3MrQ;
	Mon, 12 Jan 2026 17:00:35 +0000
Date: Tue, 13 Jan 2026 01:00:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH 12/12] HID: surface: Use pm_ptr_sleep instead of #ifdef
 CONFIG_PM_SLEEP
Message-ID: <202601130046.aUeJ5BLs-lkp@intel.com>
References: <20260112105500.3664834-13-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112105500.3664834-13-hadess@hadess.net>

Hi Bastien,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Nocera/HID-hid-alps-Use-pm_ptr-instead-of-ifdef-CONFIG_PM/20260112-190559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260112105500.3664834-13-hadess%40hadess.net
patch subject: [PATCH 12/12] HID: surface: Use pm_ptr_sleep instead of #ifdef CONFIG_PM_SLEEP
config: x86_64-buildonly-randconfig-006-20260112 (https://download.01.org/0day-ci/archive/20260113/202601130046.aUeJ5BLs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130046.aUeJ5BLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130046.aUeJ5BLs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/surface-hid/surface_kbd.c:291:9: error: call to undeclared function 'pm_ptr_sleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     291 |                 .pm = pm_ptr_sleep(&surface_hid_pm_ops),
         |                       ^
>> drivers/hid/surface-hid/surface_kbd.c:291:9: error: incompatible integer to pointer conversion initializing 'const struct dev_pm_ops *' with an expression of type 'int' [-Wint-conversion]
     291 |                 .pm = pm_ptr_sleep(&surface_hid_pm_ops),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/surface-hid/surface_kbd.c:291:9: error: initializer element is not a compile-time constant
     291 |                 .pm = pm_ptr_sleep(&surface_hid_pm_ops),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/pm_ptr_sleep +291 drivers/hid/surface-hid/surface_kbd.c

   284	
   285	static struct platform_driver surface_kbd_driver = {
   286		.probe = surface_kbd_probe,
   287		.remove = surface_kbd_remove,
   288		.driver = {
   289			.name = "surface_keyboard",
   290			.acpi_match_table = surface_kbd_match,
 > 291			.pm = pm_ptr_sleep(&surface_hid_pm_ops),
   292			.probe_type = PROBE_PREFER_ASYNCHRONOUS,
   293		},
   294	};
   295	module_platform_driver(surface_kbd_driver);
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

