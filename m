Return-Path: <linux-input+bounces-3740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 918708C96D2
	for <lists+linux-input@lfdr.de>; Sun, 19 May 2024 23:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2597EB20A57
	for <lists+linux-input@lfdr.de>; Sun, 19 May 2024 21:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF15523BB;
	Sun, 19 May 2024 21:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vy5MdXFi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118CE101CE
	for <linux-input@vger.kernel.org>; Sun, 19 May 2024 21:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716154221; cv=none; b=ZqBWLjk7z5j40fcvS8hWALOQHajJRiXpW8uq2LguPAe1nGKwJIYydUBCdHO66AKtn1dEXJV2yxR3hVuKpudmVy2II+FjurHGB3OIwtrS7ZgIua2kkfF5WTBo/Oc07PriwSi2VDcbaz7VTPHAHMre3b9xdtn34z1DsagRbkENAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716154221; c=relaxed/simple;
	bh=JhCzOiXMH17suymuHy5UuNk2aRjcue8i6vGsriKK2M0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gqO5vXfzS6oH2Caqf/mBxciSkbydgMJMXC+2t419yuG01cpVxJ8LzfIyOXmYgfwBoi1nhplV5NVSrwTll+tU9HDCTi4W/N1gxGsdP2h9g+kiygLCKVMMSYac0MmLZIuFge8E+r0nbRhHaKh4Eq5TsSW3bjlCh0qOmNlf4UWTjbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vy5MdXFi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716154219; x=1747690219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JhCzOiXMH17suymuHy5UuNk2aRjcue8i6vGsriKK2M0=;
  b=Vy5MdXFiLaOC7N4xnFkeAcUxs9pj1P3A/l0yT/WwnhaRgRBMILcDbhw4
   spl0seCEYPc4Dg5w5I/+9Rizk7D25sh9jgwS2dx+MLUhg3KqIF3c7zRoA
   jeKPjBoVme6gJq8v0gAaCFzuG/7+eqH+fEr8JY477Y3gvoCgZNhnfdOzD
   ifXJTQuP2ityW9rDS1BuuIY55F+9fCfDD1rFn3O+pDRNb279Ybn+ppAZ6
   7MEseWbTAb++GVANfZAU+blg74tIUmYntYP3bKcNS78OpI2uGd+IJN3Re
   vQz9aHdLdXH1zRc3BoP2B/x2zO3HZSmVFAfJBGUWg9THzdS88BhZ1kPfl
   g==;
X-CSE-ConnectionGUID: jzmdSQvySC6ZgXKC9uKtUA==
X-CSE-MsgGUID: UigkMipjTcK4fTAMK6RnLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="29788064"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="29788064"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 14:30:18 -0700
X-CSE-ConnectionGUID: uGFmu/JiRZmh64jjFICdmw==
X-CSE-MsgGUID: XZkp08ilQuC/QJwiNCOuBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="32488997"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2024 14:30:15 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8o6b-0004Bg-2q;
	Sun, 19 May 2024 21:30:12 +0000
Date: Mon, 20 May 2024 05:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org,
	Peter Hutterer <peter.hutterer@who-t.net>
Subject: [dtor-input:next 188/188] drivers/input/input.c:1489:9: warning:
 comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int
 *') and 'typeof (((1UL) << 12)) *' (aka 'unsigned long *'))
Message-ID: <202405200547.y7iHuRu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   c1307f8a152ac69f7efb759edfb8d71b4aa228f4
commit: c1307f8a152ac69f7efb759edfb8d71b4aa228f4 [188/188] Input: try trimming too long modalias strings
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240520/202405200547.y7iHuRu6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405200547.y7iHuRu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405200547.y7iHuRu6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/input.c:1489:9: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    1489 |         return min(len, PAGE_SIZE);
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +1489 drivers/input/input.c

  1477	
  1478	static ssize_t input_dev_show_modalias(struct device *dev,
  1479					       struct device_attribute *attr,
  1480					       char *buf)
  1481	{
  1482		struct input_dev *id = to_input_dev(dev);
  1483		size_t len;
  1484	
  1485		len = input_print_modalias(buf, PAGE_SIZE, id);
  1486		if (len < PAGE_SIZE - 2)
  1487			len += snprintf(buf + len, PAGE_SIZE - len, "\n");
  1488	
> 1489		return min(len, PAGE_SIZE);
  1490	}
  1491	static DEVICE_ATTR(modalias, S_IRUGO, input_dev_show_modalias, NULL);
  1492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

