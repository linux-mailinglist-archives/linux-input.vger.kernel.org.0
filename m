Return-Path: <linux-input+bounces-9147-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF0FA0A54F
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 19:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BD54188A74E
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 18:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605251B4253;
	Sat, 11 Jan 2025 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlOY7AR9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26621B4F02
	for <linux-input@vger.kernel.org>; Sat, 11 Jan 2025 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736620834; cv=none; b=Hcz2Ggh3CbEpahkF3efnOYHWMIJUmk2SpgISJvBHeyrSRdDjQJGjviU+CjrnuWjTjEbR3RzR+/3T6mMUBq4ShG+HUgx4zTA3Of+AqCcFIFDZygff/KGj2Fe1B8EOfUt1H2yqkbMPyGhB+wUwiwkOzmwAHFCC1adnRI754ihFpO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736620834; c=relaxed/simple;
	bh=lDzFmv4AXP9zuMcQN9d/GhYLVgG5qYlQRnP0zi7qIvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SqOBnAggHk5tsDyMfA+E3xj9kJiZYjUtUzkbvIfV9m2RsSlqzsimLk7tt8lTlJI3XUd/s6fPhTuTD3Z+T1CKtRyLgKEIzuMo5KQXXGhuCZxos636bEcoP0WRSbEuXE9KkCACLwAf5Y2PzOR1/YbRw2otecg5wDfRZvLLkB+mVg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlOY7AR9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736620832; x=1768156832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDzFmv4AXP9zuMcQN9d/GhYLVgG5qYlQRnP0zi7qIvo=;
  b=BlOY7AR9sPY2RXaO860TBfS7oESJYyiJeA1KOkYp2D74OMCQoMLCOPNO
   22mZto5yXZ7RSSV+y9aAkuC/dk5K7y6uAYGs73/EjEf+aMzELFa3Rz7cH
   G4yWSMnWzGTfMJ6PBp7fyg9wGTWv0UAvZZm3CXShVwCgMrs6SVNzrLC50
   kedBqcvPKw68B27Ym4WNL6+eLlF9Ic6Tzmv/Japrgoau1UBuGD4yOmF4+
   GWLGgVeQpLMP5N0DnWD3MxlQIqiNsKY29mCnEsS6YNzsndwt3V/j1x6Yw
   sBKUYTBt2+MMIEAj7mxfDfXpj1P5Rye6FSqhduNC2kcl7v6rJ3tfMYeUs
   w==;
X-CSE-ConnectionGUID: svcitY+9R0CEOzJVGYnqlA==
X-CSE-MsgGUID: uWmGoO+zSma/hfwofXkXkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37057290"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="37057290"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 10:40:31 -0800
X-CSE-ConnectionGUID: MEW40z7SRSWC75L5ZdqQ9Q==
X-CSE-MsgGUID: yqo1+2iJQk+vgM+tDW8Djg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127313988"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2025 10:40:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWgPL-000L5j-2t;
	Sat, 11 Jan 2025 18:40:27 +0000
Date: Sun, 12 Jan 2025 02:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>
Subject: [hid:for-6.14/lenovo 1/2] ERROR: modpost: "platform_profile_cycle"
 [drivers/hid/hid-lenovo.ko] undefined!
Message-ID: <202501120227.AAevhHnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.14/lenovo
head:   52e7d1f7c2fdd1592ab2cc48edd7ca583cabe93e
commit: 84c9d2a968c8276f1ceddaa1526c803263eae2b4 [1/2] HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys
config: x86_64-randconfig-073-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120227.AAevhHnK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120227.AAevhHnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120227.AAevhHnK-lkp@intel.com/

Note: the hid/for-6.14/lenovo HEAD 52e7d1f7c2fdd1592ab2cc48edd7ca583cabe93e builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
>> ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

