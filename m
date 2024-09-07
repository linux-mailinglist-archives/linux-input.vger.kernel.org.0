Return-Path: <linux-input+bounces-6292-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C2D970220
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 14:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAF9D2839D2
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 12:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E4715B125;
	Sat,  7 Sep 2024 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4YMcO7d"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA015990E;
	Sat,  7 Sep 2024 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725710745; cv=none; b=DPlTBFTbVqXzZjA0v1+kmg3//BCjraCuD8Nac+VmYOu0w8c/hQYXokan84IQdGBqNnqu71XfndtporLbd1X5bl7R4Kv0YHXWoHoiwv/wPQBTnDZGpS/PGRviZojoaerC61aw95dyL7/3UMX5ygwbI+aOgb+6Hjy4KHVg3FBkgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725710745; c=relaxed/simple;
	bh=Jh4PwUNysNxdEFJP39u3JzBg34efqUZTVLbPaBatgo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOnmvhrXvWfbyvBykTTObZy4CzfBanmEXSZzM/iF2eSdy867vP7WJnQFJ2AiTeBzqR1nH/paTAhYaeZTbe3RXSrrBH/Ot+s9zQWiUGoP7uHi0IzwxCiRkBuRGLX2xCIckvp4L1WiyM3lQuuVZ//MawfMDdGzMGsY54TqdtO/W28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4YMcO7d; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725710741; x=1757246741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jh4PwUNysNxdEFJP39u3JzBg34efqUZTVLbPaBatgo8=;
  b=Q4YMcO7dOqqNLWugfY5AeQvtMGXWwnseOWGc9YPFkh6pgqVwe6khaT/7
   Kd7TPwvR9XeEE9kY8QBRIPb+Guh4cSTg99M6CFZARP7985FpiPUdGXYk2
   BM/ro2Ww4U3drV1PGGd/3GBsR1qXPzw5IvvlfBUrAPI3y+ChDX/XMo3BI
   7Y6L+DOeDpdsh5smYqmoQRpbKXTxGq2lIpn7Zmq4/aRoXfVZGINk54ygU
   4K1bxEQhWiLNOPFcfl1Rt/YsSjEGVQ0jf9O7sDqDnBhpuAvVxtYGGbEyP
   WqZFKldqA5vWKrjytmfpHc5G/lArd33C5zuPl+TExek26j/gd0FDx77Dj
   Q==;
X-CSE-ConnectionGUID: TwjFPAelS/C56GWfgEArdg==
X-CSE-MsgGUID: d7xySXsKRhmVMR3aZFwF2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49872531"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="49872531"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 05:05:40 -0700
X-CSE-ConnectionGUID: qTGdgX/USkqhGra9JyUMFQ==
X-CSE-MsgGUID: zMDTSoB0Tr6gGm+EcdIcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70322273"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Sep 2024 05:05:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smuC6-000CXD-1E;
	Sat, 07 Sep 2024 12:05:34 +0000
Date: Sat, 7 Sep 2024 20:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
	heiko@sntech.de, dmitry.torokhov@gmail.com, pavel@ucw.cz,
	ukleinek@debian.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v7 1/8] mfd: core: make platform_data pointer const in
 struct mfd_cell
Message-ID: <202409071933.IYm8oa1N-lkp@intel.com>
References: <20240905185232.2899464-2-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905185232.2899464-2-heiko@sntech.de>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240905]
[also build test WARNING on v6.11-rc6]
[cannot apply to lee-mfd/for-mfd-next groeck-staging/hwmon-next lee-leds/for-leds-next linus/master lee-mfd/for-mfd-fixes v6.11-rc6 v6.11-rc5 v6.11-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/mfd-core-make-platform_data-pointer-const-in-struct-mfd_cell/20240906-025553
base:   next-20240905
patch link:    https://lore.kernel.org/r/20240905185232.2899464-2-heiko%40sntech.de
patch subject: [PATCH v7 1/8] mfd: core: make platform_data pointer const in struct mfd_cell
config: arm-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071933.IYm8oa1N-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071933.IYm8oa1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071933.IYm8oa1N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-sensor-hub.c: In function 'sensor_hub_remove':
>> drivers/hid/hid-sensor-hub.c:745:25: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     745 |                         data->hid_sensor_hub_client_devs[i].platform_data;
         |                         ^~~~


vim +/const +745 drivers/hid/hid-sensor-hub.c

401ca24fb34aee srinivas pandruvada 2012-09-05  732  
401ca24fb34aee srinivas pandruvada 2012-09-05  733  static void sensor_hub_remove(struct hid_device *hdev)
401ca24fb34aee srinivas pandruvada 2012-09-05  734  {
401ca24fb34aee srinivas pandruvada 2012-09-05  735  	struct sensor_hub_data *data = hid_get_drvdata(hdev);
401ca24fb34aee srinivas pandruvada 2012-09-05  736  	unsigned long flags;
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  737  	int i;
401ca24fb34aee srinivas pandruvada 2012-09-05  738  
401ca24fb34aee srinivas pandruvada 2012-09-05  739  	hid_dbg(hdev, " hardware removed\n");
401ca24fb34aee srinivas pandruvada 2012-09-05  740  	hid_hw_close(hdev);
f2f13a68c37c13 Axel Lin            2012-09-19  741  	hid_hw_stop(hdev);
401ca24fb34aee srinivas pandruvada 2012-09-05  742  	spin_lock_irqsave(&data->lock, flags);
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  743  	for (i = 0; i < data->hid_sensor_client_cnt; ++i) {
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  744  		struct hid_sensor_hub_device *hsdev =
e651a1da442ae0 Srinivas Pandruvada 2015-02-19 @745  			data->hid_sensor_hub_client_devs[i].platform_data;
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  746  		if (hsdev->pending.status)
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  747  			complete(&hsdev->pending.ready);
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  748  	}
401ca24fb34aee srinivas pandruvada 2012-09-05  749  	spin_unlock_irqrestore(&data->lock, flags);
401ca24fb34aee srinivas pandruvada 2012-09-05  750  	mfd_remove_devices(&hdev->dev);
401ca24fb34aee srinivas pandruvada 2012-09-05  751  	mutex_destroy(&data->mutex);
401ca24fb34aee srinivas pandruvada 2012-09-05  752  }
401ca24fb34aee srinivas pandruvada 2012-09-05  753  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

