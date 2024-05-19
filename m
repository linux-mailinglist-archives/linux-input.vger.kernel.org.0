Return-Path: <linux-input+bounces-3741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 156C78C96DA
	for <lists+linux-input@lfdr.de>; Sun, 19 May 2024 23:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6D461F2106C
	for <lists+linux-input@lfdr.de>; Sun, 19 May 2024 21:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC6671B24;
	Sun, 19 May 2024 21:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qv3LBc/l"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC2D71743
	for <linux-input@vger.kernel.org>; Sun, 19 May 2024 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716154826; cv=none; b=LM2EOgARmqpPvpxIumqrzqZleDlQX43DmU3tTYtrs3qk8ROcx9z0iBP3Y0a+9xUYC1Vvab4ANBS3QdLTvvQrCir7Jpl3AqIwWvFmRRZ17d6gY6svvvtlhDSbbp62YlzhcFzPksIqlbzPb7wwjFwuFOpdEwzFW78U64Nd7xfC5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716154826; c=relaxed/simple;
	bh=T01XMr8BH0Z8iBUKhgRqEY1ug7lZRqe9/cbbglE8Ms8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KbTZmrDgf3Oc/PKcpD8CmWFkOBoLZS4p5j5eIZGV95ULgEQWAkbZKi8cWK8AeqKFd/qHxvrqAmGDwGNIUyM6dbZD12oOsKf4xgwspqpsjyRmNg/BwTgTVJN6O5OhwQOGJWN3tvP9xR1YfDmOT16kKgaI07Zvb3LNdL8CrjTwhiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qv3LBc/l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716154825; x=1747690825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T01XMr8BH0Z8iBUKhgRqEY1ug7lZRqe9/cbbglE8Ms8=;
  b=Qv3LBc/l9WCG+quWRB1z7G7IfwWxWYwkGBAWgE10+mkis3HQPjX4f7Uo
   1nR/InWU/PrjwPMmENdghFoH7t9V6du7a/Wuzh+ULiInYA8jP9iNMod00
   6GnWU1nXF0YJvwj3yz7kgV8ef6CdWKhIM2mWcQwOtIf5t5urcxozAxD9D
   J0Jlzq45LcSiOPUDg34WHOghgqL++OQJnP27h/R2z1MLz035AvqeebZz+
   AvOsC071EO6fM1LvMlFCN6BMRmiIqzt6Yb2FUpXRWI1iA/F3tUygkPOoo
   QONs78mK+q0xJgNekvZEEDGxIMUmwnh0u1ipTjtI9qjcApCYxQSCkTWUl
   g==;
X-CSE-ConnectionGUID: GGsp7toHS3+GylBRlEDugQ==
X-CSE-MsgGUID: y9p8gz9PQGOEywvAziNWOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="16060288"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="16060288"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 14:40:24 -0700
X-CSE-ConnectionGUID: kjxgIgPiSh2cJbFCrXIUQA==
X-CSE-MsgGUID: Gga8NalqRSOvcUPJ3Nrw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="63564390"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2024 14:40:22 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8oGS-0004C0-0s;
	Sun, 19 May 2024 21:40:20 +0000
Date: Mon, 20 May 2024 05:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org,
	Peter Hutterer <peter.hutterer@who-t.net>
Subject: [dtor-input:next 188/188] drivers/input/input.c:1489:9: warning:
 comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int
 *') and 'typeof ((1UL << 12)) *' (aka 'unsigned long *'))
Message-ID: <202405200512.hpbZWegE-lkp@intel.com>
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
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20240520/202405200512.hpbZWegE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405200512.hpbZWegE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405200512.hpbZWegE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/input.c:1489:9: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof ((1UL << 12)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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

