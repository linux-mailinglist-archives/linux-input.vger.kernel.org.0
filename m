Return-Path: <linux-input+bounces-9862-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C015A2DAA6
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 04:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB32E7A2B40
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 03:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B17CA6F;
	Sun,  9 Feb 2025 03:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPEsrCQw"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5688EED8
	for <linux-input@vger.kernel.org>; Sun,  9 Feb 2025 03:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739072514; cv=none; b=Jaqyxh9TpWtvYs1kTY1JpRlgtx0ZbPTzQ3okqZHGAU7p/XFj29D4OwTo0co9IgvfUOFRgmzxO17MvOtO2qKL1A55Ouo8GKZPkY2S9izhw1DY7mjXeRv8vOshUVdeJbZAt6mIiUZ6l8S0yGhZ3wzrQJvhnuSivQ441W76ssDM2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739072514; c=relaxed/simple;
	bh=R/BOiK6+vzz8VGXktpKy5LU6SYhDpiLMoY5UBsNOlyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=umNpuetHKu7xy3ms7P6dEzel/oy3JaJZmZfMmmNsWPW34LDGUrYwV51zHhHRaqbsIZVMLtEZ+uvqcedZzw6R2hEMFCVk4bqBXwd7QJYgNTJk6Qo8qC5H96Krw6gc8i95PHEBJDegWfOeoUYIbIuXCYSdM19mUiYelQuidAyiaSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPEsrCQw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739072512; x=1770608512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R/BOiK6+vzz8VGXktpKy5LU6SYhDpiLMoY5UBsNOlyc=;
  b=UPEsrCQwloCXshdsTKdI7+PFnrRFvtyA4xmV3f4rbv8Ybom9zzgBm6HG
   IPSiUtJGdow5ZVrz41FGJsvXPyNUXLBR+nyoJLEwxQJjm0TiurdlDVhN6
   FP0XEmpOVT0wLu+v88Twpvbpxe8heEtayg0LRhl5uz19Z3edxjiytt7bz
   8rYYEl88ZUwHNjSu43XXln/muQcMx3gguOZSa8SvNbOBRULnCwEi6NCt3
   YQXHpMbExroJm/f+cBgitsPpfghJtP9F7xJBHi5jotYTqXSX1+7rjFxuT
   xWhB0Crg+XGN5p6PFJXxYQPpLQvEl0rhEdUjumlZ3mqxBKGZF0G2i6YiU
   w==;
X-CSE-ConnectionGUID: dDnusqGtT4ij1zWJPx/syA==
X-CSE-MsgGUID: 9qht5SckRNChDP2hcpnRmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39805933"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="39805933"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 19:41:51 -0800
X-CSE-ConnectionGUID: IpvGyS3TSFGKritIieDQiw==
X-CSE-MsgGUID: jAGjwZPyQ76HDDBsQpuP9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115948608"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Feb 2025 19:41:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgyCZ-00112T-1z;
	Sun, 09 Feb 2025 03:41:47 +0000
Date: Sun, 9 Feb 2025 11:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kerem Karabay <kekrby@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>, Aditya Garg <gargaditya08@live.com>
Subject: [hid:for-6.15/apple 2/4] drivers/hid/hid-appletb-kbd.c:119:18:
 sparse: sparse: symbol 'appletb_kbd_attrs' was not declared. Should it be
 static?
Message-ID: <202502091105.ZsLoBSIh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.15/apple
head:   93a0fc48948107e0cc34e1de22c3cb363a8f2783
commit: 8e9b9152cfbdc2a90a8acb68acbc1407ef67d139 [2/4] HID: hid-appletb-kbd: add driver for the keyboard mode of Apple Touch Bars
config: arc-randconfig-r122-20250209 (https://download.01.org/0day-ci/archive/20250209/202502091105.ZsLoBSIh-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502091105.ZsLoBSIh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091105.ZsLoBSIh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-appletb-kbd.c:119:18: sparse: sparse: symbol 'appletb_kbd_attrs' was not declared. Should it be static?

vim +/appletb_kbd_attrs +119 drivers/hid/hid-appletb-kbd.c

   118	
 > 119	struct attribute *appletb_kbd_attrs[] = {
   120		&dev_attr_mode.attr,
   121		NULL
   122	};
   123	ATTRIBUTE_GROUPS(appletb_kbd);
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

