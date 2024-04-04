Return-Path: <linux-input+bounces-2814-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB53897DAD
	for <lists+linux-input@lfdr.de>; Thu,  4 Apr 2024 04:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 569041C22727
	for <lists+linux-input@lfdr.de>; Thu,  4 Apr 2024 02:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6121B299;
	Thu,  4 Apr 2024 02:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhLfmLP7"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87BE182BB
	for <linux-input@vger.kernel.org>; Thu,  4 Apr 2024 02:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712197405; cv=none; b=qO0AakmdXRFejmP6uk5MJKXjtniVijxvqjAWZvRusMOgei+uYcHlJmaQqc8C/Q6cGu2Hnq2bzqRcZZkI6IcAu4ERNeETW9vUZqCi4AdKHFyII8MYwyASINkNY3yNxqdd0UUJusphvCpk2lg6noo87icBdoNP8bBfag85ScptXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712197405; c=relaxed/simple;
	bh=ZWTawStMb43NbIfFSkgGMLOisweD6qQRYXXH0zyCCkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=id88BZDLGB0rrcRp8pVWhkg3uqzcrRwdsQe1FXj5ukXRy+RFwpzNcY8MMQxWTJDRNdDrwkGaNNtNv4xkk7BDuokvPxaGyVmrtQ1VZMvQQLJ2dacjmNzbj9aUlknPLzVJDyo4zOId0Lpdk89o8emQ/PY60YT3FiE9UCiIX9DrBZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhLfmLP7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712197403; x=1743733403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWTawStMb43NbIfFSkgGMLOisweD6qQRYXXH0zyCCkg=;
  b=YhLfmLP71T3GQTKY9oewN27x0aGo0mLq8S123N0RBI/sJe8YaJ3e4HAM
   rMV5QEh+6z5zAhBXbL3aiGA58HcYsA6xZuIadAu6I55iUVPk5go8Sm6LF
   n7Wb5lrZM9A3Z8HIJPT+sUE+pLIOMcSXerKTEDWxFUusNLHqX8o2OKihX
   iWguJUNvOoHex2duxjBaYqhC8XxvX+txvy4AYGmMLU7Bmhrl98TFJvRB0
   niDBcYnwW2ExUh7fN40itDsZ5sngzhP2dmXHGUkajSXXY+g9/xwBaccK7
   WimLXsosFzXnGDVDPh17Yaqk5izV2MeY0ggnNwq7rRcwio1AWOKyGkoNQ
   A==;
X-CSE-ConnectionGUID: a09KJdBSSfmhdskamfXoOw==
X-CSE-MsgGUID: 9x8902r9QtyY7ZI3c23EtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7363670"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7363670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 19:23:23 -0700
X-CSE-ConnectionGUID: N4dTvXmRTtWMQEBLZ6PLNA==
X-CSE-MsgGUID: 8aoDdwiVTheCTxvVtRsLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23388250"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2024 19:23:22 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsCl5-0000Us-29;
	Thu, 04 Apr 2024 02:23:19 +0000
Date: Thu, 4 Apr 2024 10:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Gorinov <linux-kernel@altimeter.info>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>
Subject: [hid:for-6.10/winwing 1/1] drivers/hid/hid-winwing.c:123:22:
 warning: variable 'minor' set but not used
Message-ID: <202404041038.aQ0aRTSK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.10/winwing
head:   266c990debad2f9589c7a412e897a8e312b09766
commit: 266c990debad2f9589c7a412e897a8e312b09766 [1/1] HID: Add WinWing Orion2 throttle support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240404/202404041038.aQ0aRTSK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041038.aQ0aRTSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041038.aQ0aRTSK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-winwing.c: In function 'winwing_probe':
>> drivers/hid/hid-winwing.c:123:22: warning: variable 'minor' set but not used [-Wunused-but-set-variable]
     123 |         unsigned int minor;
         |                      ^~~~~


vim +/minor +123 drivers/hid/hid-winwing.c

   119	
   120	static int winwing_probe(struct hid_device *hdev,
   121			const struct hid_device_id *id)
   122	{
 > 123		unsigned int minor;
   124		int ret;
   125	
   126		ret = hid_parse(hdev);
   127		if (ret) {
   128			hid_err(hdev, "parse failed\n");
   129			return ret;
   130		}
   131	
   132		ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
   133		if (ret) {
   134			hid_err(hdev, "hw start failed\n");
   135			return ret;
   136		}
   137	
   138		minor = ((struct hidraw *) hdev->hidraw)->minor;
   139	
   140		return 0;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

