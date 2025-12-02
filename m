Return-Path: <linux-input+bounces-16442-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5ACC9B37D
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 11:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 18009342139
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 10:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861F5285CB3;
	Tue,  2 Dec 2025 10:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5m+5Rdb"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E0A27FB03;
	Tue,  2 Dec 2025 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764672565; cv=none; b=pgQ58aUwrQzSHg25Fecf9EVOG7HusO6KwTVdCXoILCcaYTghNZJgrhxAD0MCE4e2J687J//ek7iMIHD19SqtI1aWxcL6Pjx0wZv9EECLrw59hOjzzLykjCNR2OYQFBYjdbtVZblwk6RrbiDw+eGRn/FR6YgXJ3TmwIRqBjgOthw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764672565; c=relaxed/simple;
	bh=KwXMtUzoMvwURkm3Pl9HBbx5xKsPOyPQpvKC6sk5aiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpZhNQov18JWBnsVgFDQRgqaBNMEXXCMz+Pl2l4sWPTDWDV1lA7OKtgRUu4t8L+m8NNMNF/7XIhuUmzF9apEoXNBuzevf/Gs24pJFz5WFTkvH0FR8oE7O/TOgzSgoE0C9eItJCQz3hcn7SOt6RqjCFSKmm1MXZOljNeAZBrvgNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5m+5Rdb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764672564; x=1796208564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KwXMtUzoMvwURkm3Pl9HBbx5xKsPOyPQpvKC6sk5aiw=;
  b=G5m+5Rdb1kS/jo6LVWHYPoe2n84rnE5HDdXEDt3fER2MFY6r/OxyiApd
   hYsnMptkSLK5o/UpZJEHn5v54gRl0wKiduGLlgZxh7MEBD2OYBssSm3AQ
   noB89EfGGzvs7p9NsvRe3mAz+jayTXElc7g4M9eErejwbfAh+aFr6CEDr
   NTw0nJHf9VkkVlycp/kr7NF3sD+hQNm0ovdPf1v+LvofirSVmeb7NrU9E
   vh0PVDbQct7xSqcAyqovcBQ3C/t9BJSo+ZxZVxjjhstKEYQ5TwIBpL4WD
   W60fzCwO/XK3Y8NxYYEg6yDcdOddUUmeyz8NZkZ13zM3fsyxB6ZmpdP8N
   w==;
X-CSE-ConnectionGUID: Lb769k61TiG2vZRmpwRFLA==
X-CSE-MsgGUID: 7TNtVSvyTIKNRakIgaLpJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66667875"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66667875"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 02:49:23 -0800
X-CSE-ConnectionGUID: oXIjJecYSWureJkPSzyPIA==
X-CSE-MsgGUID: Kwzqp5KARtu8lNX3dZnCHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="195153956"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Dec 2025 02:49:21 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQNwc-000000009kH-2mLn;
	Tue, 02 Dec 2025 10:49:18 +0000
Date: Tue, 2 Dec 2025 18:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hendrik Noack <hendrik-noack@gmx.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hendrik Noack <hendrik-noack@gmx.de>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: Add support for Wacom W9000-series
 penabled touchscreens
Message-ID: <202512021811.5UvbJjzl-lkp@intel.com>
References: <20251201170047.125307-1-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201170047.125307-1-hendrik-noack@gmx.de>

Hi Hendrik,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus robh/for-next krzk-dt/for-next linus/master v6.18 next-20251202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hendrik-Noack/dt-bindings-Input-Add-Wacom-W9000-series-penabled-touchscreens/20251202-010643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20251201170047.125307-1-hendrik-noack%40gmx.de
patch subject: [PATCH v2 2/2] Input: Add support for Wacom W9000-series penabled touchscreens
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512021811.5UvbJjzl-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021811.5UvbJjzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021811.5UvbJjzl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/wacom_w9000.c:99:28: error: call to undeclared function 'get_unaligned_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      99 |                 wacom_data->fw_version = get_unaligned_be16(&data[7]);
         |                                          ^
   drivers/input/touchscreen/wacom_w9000.c:110:27: error: call to undeclared function 'get_unaligned_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |         wacom_data->prop.max_x = get_unaligned_be16(&data[1]);
         |                                  ^
   drivers/input/touchscreen/wacom_w9000.c:150:7: error: call to undeclared function 'get_unaligned_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     150 |                 x = get_unaligned_be16(&data[1]);
         |                     ^
   3 errors generated.


vim +/get_unaligned_be16 +99 drivers/input/touchscreen/wacom_w9000.c

    84	
    85	static int wacom_w9000_query(struct wacom_w9000_data *wacom_data)
    86	{
    87		struct i2c_client *client = wacom_data->client;
    88		struct device *dev = &wacom_data->client->dev;
    89		bool retried = false;
    90		int ret;
    91		u8 data[COM_QUERY_NUM_MAX];
    92	
    93	retry:
    94		ret = wacom_w9000_read(client, COM_QUERY, wacom_data->variant->com_query_num, data);
    95		if (ret)
    96			return ret;
    97	
    98		if (data[0] == 0x0f) {
  > 99			wacom_data->fw_version = get_unaligned_be16(&data[7]);
   100		} else if (!retried) {
   101			retried = true;
   102			goto retry;
   103		} else {
   104			return -EIO;
   105		}
   106	
   107		dev_dbg(dev, "query: %X, %X, %X, %X, %X, %X, %X, %X, %X, %d\n", data[0], data[1], data[2],
   108			data[3], data[4], data[5], data[6], data[7], data[8], retried);
   109	
   110		wacom_data->prop.max_x = get_unaligned_be16(&data[1]);
   111		wacom_data->prop.max_y = get_unaligned_be16(&data[3]);
   112		wacom_data->max_pressure = get_unaligned_be16(&data[5]);
   113	
   114		dev_dbg(dev, "max_x:%d, max_y:%d, max_pressure:%d, fw:0x%X", wacom_data->prop.max_x,
   115			wacom_data->prop.max_y, wacom_data->max_pressure,
   116			wacom_data->fw_version);
   117	
   118		return 0;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

