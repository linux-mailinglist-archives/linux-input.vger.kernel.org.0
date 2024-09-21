Return-Path: <linux-input+bounces-6630-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9521E97DBD1
	for <lists+linux-input@lfdr.de>; Sat, 21 Sep 2024 08:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174651F21FB1
	for <lists+linux-input@lfdr.de>; Sat, 21 Sep 2024 06:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A84C143748;
	Sat, 21 Sep 2024 06:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzKpLavB"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C6674BF8;
	Sat, 21 Sep 2024 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726899574; cv=none; b=WptLbGngk9glkcUFhORgFVWDGGOw6yBs/xsRTriy52EylwQ5nODsbmLU0t4Re9aksjZB70njrk6ArU9vvNEq/ybKtb6Yv3ywSuMbf61e1wol7y1TGQb+6idT8UXh13Rig3LzOK6/w0IVH0OfN+EVO8bBl8foOGNHsDWc4sZDcfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726899574; c=relaxed/simple;
	bh=r8lyuqxjz8ntpV/jzePgsOO5DLCwExmP0IlwCT3nMdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vi1V6bfb/94sUecA7aYsPTv8IjQeCIwekdJbqwP3dbIIUSIDVVN5mbVbRsL42q3MkHYKrCnV84X7KDnATmReWrvnS1DU3AoK6VcpegvrGP5q6T5Zqblp1IgNmT+f1+ALbltIyXk+38s0boZVUTJq01qfjpvrKffihxSBqF5ho0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzKpLavB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726899573; x=1758435573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r8lyuqxjz8ntpV/jzePgsOO5DLCwExmP0IlwCT3nMdM=;
  b=DzKpLavBnons08vYafGDI4x8lybPu4DrUzYgK/PFsGru/vXBYrLEZ/sr
   LtrWrGQ9NYVFL0UdKkbMmTeJtXi78ftvLBUlOeDARI5qsAcreFR/igomu
   ORnhpmrZX0CK8C49Mrcqaj0RhchUcMc7k+0sIAnG2SXn7STG43bd/dEBp
   MXFvb1Ef9xIIz1mDq6H4qq83go407DDyd1OEvgwkvwpR6j9je8f7e6aAd
   YjnqWN8b8UiYiLQlNsKtjm/IvgcERoq7uQTtJ37NxK+I9/uPxF5nnWEWp
   am2FOkzUZ8DZW0Ay+bLZuMbXmMnGQ0IPlSCtyK1+oEK42yANjU9AwIzTt
   Q==;
X-CSE-ConnectionGUID: wpFM0WaZQUq1a7y1kDj80A==
X-CSE-MsgGUID: +oT52yvGQqOUUeEWxShW3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37285751"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="37285751"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 23:19:32 -0700
X-CSE-ConnectionGUID: L6VGEUdDRSGrzJM3HAbwOQ==
X-CSE-MsgGUID: wP5rVOxqRUKhTrYn0zxL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="75080919"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Sep 2024 23:19:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srtSp-000FAb-3D;
	Sat, 21 Sep 2024 06:19:28 +0000
Date: Sat, 21 Sep 2024 14:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com, Vishnu Sankar <vishnuocv@gmail.com>
Subject: Re: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys
 using raw  events.
Message-ID: <202409211318.ZsE7JGOi-lkp@intel.com>
References: <20240917100432.10887-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917100432.10887-1-vishnuocv@gmail.com>

Hi Vishnu,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishnu-Sankar/hid-hid-lenovo-Supporting-TP-X12-TAB-1-2-Kbd-Hotkeys-using-raw-events/20240917-180639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240917100432.10887-1-vishnuocv%40gmail.com
patch subject: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys using raw  events.
config: i386-randconfig-062-20240921 (https://download.01.org/0day-ci/archive/20240921/202409211318.ZsE7JGOi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211318.ZsE7JGOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211318.ZsE7JGOi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
>> ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

