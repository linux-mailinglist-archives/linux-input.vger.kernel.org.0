Return-Path: <linux-input+bounces-11162-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 836B6A6E9A5
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 07:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F12816EBD0
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 06:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E988620468D;
	Tue, 25 Mar 2025 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDzZr/+h"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00159A93D;
	Tue, 25 Mar 2025 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742884435; cv=none; b=C4sd0jVaDxrd4SP710K/DOxnJlcY+ohi/J/AHHSWR5mn3WJNLxiV/PO0MLvuQGuSGfJrPpU+YbwMtEzFjklRjztq9mHGfHoUmKWBl9r1rAEMUJSJys2cm2zKV4zCeRYznybGeIS6/Fuy1E8EBHCmKmBHRL8iocNBvepCdJq9sOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742884435; c=relaxed/simple;
	bh=zqJFi6BXvfUH05c4Zk5WMj/85UfrnAU+ysG58ub1WDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gq3T/P/8cjs9fM3ZK3BT8QXI6oIZ7d9ymbLTjdn6DcalC+VwhhZB/ejZvtK52dDOhFcblBDu8RBcO2B4fVb4TKTrfWSAJI2G14m1mS0d4F25V60spDMYiIBLiQ5SfbJcar01DG1YPYYy6WoMi67nHVcH7jzxOcxcRZfQBYm7B58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDzZr/+h; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742884434; x=1774420434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zqJFi6BXvfUH05c4Zk5WMj/85UfrnAU+ysG58ub1WDM=;
  b=TDzZr/+hM4dlyXv9dPRFiwyHcx6Uv7Rq6GyFTc1ReoDHHfdCPB26EoBS
   WFbAskGp1hghUtpGED9lfvyl152awfA1iyUjUfRY/BXBmqfAW6O+H+Q53
   OHKAoDt9GYsvn+SpG26aPq2+teQoygc9RkjXAqdqVBIqP96x9Ov2nJQql
   GqX4MoxDjYvzrh42H9n0FuK27RfCcvDWK3UL4syiT6WV3fIMiDu8yfqDS
   0dLlYyRP3+YGKSigJargWZmylWW3b2jcW+D3yMKEn486BB4p6mNKK5HLa
   YBPzom/AXtQu/xURdGbcFrRgn+v+VbltiIIqTh5Xn1AXVYDb9Dre64lOO
   A==;
X-CSE-ConnectionGUID: 1qye5a5mTheFq0Tq2v8JDQ==
X-CSE-MsgGUID: FWut1zg0RLqOFjUIOTKd/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43350596"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="43350596"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 23:33:53 -0700
X-CSE-ConnectionGUID: zRo0MWEERcGBU+oyRD0ViQ==
X-CSE-MsgGUID: yfOOMcXrSx2MQsoRQ8Wu3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="129335587"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Mar 2025 23:33:51 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twxr5-0004Ab-1g;
	Tue, 25 Mar 2025 06:33:44 +0000
Date: Tue, 25 Mar 2025 14:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v4 09/11] HID: asus: add basic RGB support
Message-ID: <202503251335.BQVOomT2-lkp@intel.com>
References: <20250324210151.6042-10-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324210151.6042-10-lkml@antheas.dev>

Hi Antheas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-refactor-init-sequence-per-spec/20250325-051852
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250324210151.6042-10-lkml%40antheas.dev
patch subject: [PATCH v4 09/11] HID: asus: add basic RGB support
config: arm64-randconfig-004-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251335.BQVOomT2-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251335.BQVOomT2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251335.BQVOomT2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_led_classdev_multicolor_register_ext" [drivers/hid/hid-asus.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

