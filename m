Return-Path: <linux-input+bounces-8441-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBCB9E8AED
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 06:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39DB164419
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 05:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FBF156872;
	Mon,  9 Dec 2024 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVJZ4SE8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C157BB1D;
	Mon,  9 Dec 2024 05:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720948; cv=none; b=HwHWwskqSU7jFXlpmykBUOBVx8W9Y5OJst6fxdNUB4IV8ErpspgB/ImxqtJxike3WKqya8/Q4Xz7wSetZ74ExZegNNC/gV69L6PbyywaVGMJvVvjt0uo8xecaamNEfD5+ikYg9pMetXcbwk3vS8tmGS4Tr+fDTQ80JCSH6Cvj4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720948; c=relaxed/simple;
	bh=jYILTV6MefuoCzDE2iYdlbJRzhBEhk1oamLG9PPaW0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaPGDKi9zHMAFNE0l8MYXuji0FuVoyTX7mKFYiyCYc9LMea3WD/EMSuKpWqYh7Q8wxUb6wtBIN30icanI23hb7SXtPAcnoItbXa2hUuRgz2FO9YSFPy4fmjshBSYWBKa0aOYLL6HQaWOULZcYffFW/an3sWCQu8t9VufOTjIeK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVJZ4SE8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720948; x=1765256948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jYILTV6MefuoCzDE2iYdlbJRzhBEhk1oamLG9PPaW0E=;
  b=AVJZ4SE8jWEt+gyIKVZgGA/Dius7IqrVjoaRrZVQ3dns06hw2Bp/UU1k
   X16eFLQFTyjK96pHI9gwQwH4IHbU2ZIuuOhyplUF8bHTrTgCT/F4ATpB2
   3RGmjIGJlli2Uj3G6AuF93imbX6MJ8cccdEZkpc1eoVBSnPj7ma9U3x0i
   y1r0m6uGR9DiLmRyvopHFz2Wd22PV8A9U+y+09+TQml7OOD6fJQmzbjvQ
   /eP5HiR9NcNlyPM5M4QbDPLlia5hOVkKnNcj1ScFGJJa0C681bRYUnsVi
   aBM8cJqzBndHLDjfLF4jRhRE2ChZFjtSHI/2rh1sKQ+FRvzeEaCtBGC2Y
   w==;
X-CSE-ConnectionGUID: 2dq5YxH3SruY2hTFoQNEUw==
X-CSE-MsgGUID: KyAP39W7Tniz1gQ2NICu9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34140462"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34140462"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:08:47 -0800
X-CSE-ConnectionGUID: lUrmVs9+S32ILcjk2EmyFg==
X-CSE-MsgGUID: pVjykfr5TqWACXgcvzUnQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99413803"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2024 21:08:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW0f-0003xt-2P;
	Mon, 09 Dec 2024 05:08:41 +0000
Date: Mon, 9 Dec 2024 13:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 1/2] HID: input: fix test for CONFIG_HID_KUNIT_TEST=m
Message-ID: <202412091018.qz83ukPy-lkp@intel.com>
References: <20241208-hid-ifdef-kunit-v1-1-cbea6077a233@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208-hid-ifdef-kunit-v1-1-cbea6077a233@weissschuh.net>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7503345ac5f5e82fd9a36d6e6b447c016376403a]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/HID-input-fix-test-for-CONFIG_HID_KUNIT_TEST-m/20241208-200350
base:   7503345ac5f5e82fd9a36d6e6b447c016376403a
patch link:    https://lore.kernel.org/r/20241208-hid-ifdef-kunit-v1-1-cbea6077a233%40weissschuh.net
patch subject: [PATCH 1/2] HID: input: fix test for CONFIG_HID_KUNIT_TEST=m
config: i386-randconfig-012-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091018.qz83ukPy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091018.qz83ukPy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091018.qz83ukPy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_kmalloc_array
   >>> referenced by test.h:447 (include/kunit/test.h:447)
   >>>               drivers/hid/hid-input.o:(hid_test_input_set_battery_charge_status) in archive vmlinux.a
   >>> referenced by test.h:447 (include/kunit/test.h:447)
   >>>               drivers/hid/hid-input.o:(hid_test_input_get_battery_property) in archive vmlinux.a
   >>> referenced by test.h:447 (include/kunit/test.h:447)
   >>>               drivers/hid/hid-input.o:(hid_test_input_get_battery_property) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: kunit_binary_assert_format
   >>> referenced by hid-input-test.c:20 (drivers/hid/hid-input-test.c:20)
   >>>               drivers/hid/hid-input.o:(hid_test_input_set_battery_charge_status) in archive vmlinux.a
   >>> referenced by hid-input-test.c:24 (drivers/hid/hid-input-test.c:24)
   >>>               drivers/hid/hid-input.o:(hid_test_input_set_battery_charge_status) in archive vmlinux.a
   >>> referenced by hid-input-test.c:28 (drivers/hid/hid-input-test.c:28)
   >>>               drivers/hid/hid-input.o:(hid_test_input_set_battery_charge_status) in archive vmlinux.a
   >>> referenced 6 more times
--
>> ld.lld: error: undefined symbol: __kunit_do_failed_assertion
   >>> referenced by hid-input-test.c:20 (drivers/hid/hid-input-test.c:20)
   >>>               drivers/hid/hid-input.o:(hid_test_input_set_battery_charge_status) in archive vmlinux.a
   >>> referenced by hid-input-test.c:24 (drivers/hid/hid-input-test.c:24)
   >>>               drivers/hid/hid-input.o:(hid_test_input_set_battery_charge_status) in archive vmlinux.a
   >>> referenced by hid-input-test.c:28 (drivers/hid/hid-input-test.c:28)
   >>>               drivers/hid/hid-input.o:(hid_test_input_set_battery_charge_status) in archive vmlinux.a
   >>> referenced 9 more times
--
>> ld.lld: error: undefined symbol: kunit_ptr_not_err_assert_format
   >>> referenced by hid-input-test.c:16 (drivers/hid/hid-input-test.c:16)
   >>>               drivers/hid/hid-input.o:(hid_test_input_set_battery_charge_status) in archive vmlinux.a
   >>> referenced by hid-input-test.c:39 (drivers/hid/hid-input-test.c:39)
   >>>               drivers/hid/hid-input.o:(hid_test_input_get_battery_property) in archive vmlinux.a
   >>> referenced by hid-input-test.c:43 (drivers/hid/hid-input-test.c:43)
   >>>               drivers/hid/hid-input.o:(hid_test_input_get_battery_property) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __kunit_abort
   >>> referenced by hid-input-test.c:16 (drivers/hid/hid-input-test.c:16)
   >>>               drivers/hid/hid-input.o:(hid_test_input_set_battery_charge_status) in archive vmlinux.a
   >>> referenced by hid-input-test.c:39 (drivers/hid/hid-input-test.c:39)
   >>>               drivers/hid/hid-input.o:(hid_test_input_get_battery_property) in archive vmlinux.a
   >>> referenced by hid-input-test.c:43 (drivers/hid/hid-input-test.c:43)
   >>>               drivers/hid/hid-input.o:(hid_test_input_get_battery_property) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

