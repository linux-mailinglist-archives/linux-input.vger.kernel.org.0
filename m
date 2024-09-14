Return-Path: <linux-input+bounces-6550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1B0979032
	for <lists+linux-input@lfdr.de>; Sat, 14 Sep 2024 13:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49E241F217B7
	for <lists+linux-input@lfdr.de>; Sat, 14 Sep 2024 11:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2921CF29A;
	Sat, 14 Sep 2024 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPNk2ipE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5599E1CEAAC;
	Sat, 14 Sep 2024 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726311601; cv=none; b=PzUUOIBM3wXVEjtvaM3u5vlH/DBhOGz4IVfNLzmXjOhCwNWWrNH2FoEpb3VNdBbywhbL9RxyWB/JD/GxQNHRMSZTiHE07iqGaU3bqgEvurIBAg1tlZeK7FgWZ8ODqWsaEB81fdHsjGWSFGWomXl3aVHL+xu/Ty/lgYreHLannk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726311601; c=relaxed/simple;
	bh=RqagvQleKzznUmEAGUk3kJBskCidxziKVdoH64L73j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGlk5uRd66B0VhmoW5/yp10x5h4C4dIPM1VQT4dqOM/OEVcJ0OuMhoIn4cG5j/dlojPlzZRWOOv6YA1QQYuhKX2G8JKHWQzZgmxNmFk15szvwKXgm7ptkM2NCSOu032W0st/YYVBYYD2d+MmEfqN8SVJiWA4uB1r7ar6tEaLK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPNk2ipE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726311600; x=1757847600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RqagvQleKzznUmEAGUk3kJBskCidxziKVdoH64L73j4=;
  b=kPNk2ipElCfIxuvzTU734SvruXM3iKVsD7VKukOqFpinIeTJQLTlpkhX
   mGwQNrjs1sGkGbahWpw4+z3oz5o1TeIQWS/Tfk4jc8D/s+qPTstF7AxXN
   zRFOEoO2+4IVTMU0Wkhp+8CyBbbV7pEouYUAUGxNuxTcjsvS8bpBrDKa/
   KisK3XZEHwnj2o4/bvGV2kbrPxsE77feNisN0+I7iBeEk2fWFhD1wRf3r
   Tjm4huQotrMfJYNrdUbMxqj+sdOnVBjGnMmkZgi2c6OXnznnt9iuuKxAX
   Q/r8Eboc18QlduOvVw7F8/QOid4BtcLuZxl/PcMlHdt+bk8Au0a7BaXMk
   Q==;
X-CSE-ConnectionGUID: IVldnLavS9elPdKiyxBTVQ==
X-CSE-MsgGUID: kGpZz281SNSh7lJCKXzBDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25148004"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25148004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 03:59:59 -0700
X-CSE-ConnectionGUID: vS6oIURLS3S2LyICQh7zNw==
X-CSE-MsgGUID: 3Elus/PHQPesz24am0+B+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="72971200"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Sep 2024 03:59:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spQVN-0007f1-2j;
	Sat, 14 Sep 2024 10:59:53 +0000
Date: Sat, 14 Sep 2024 18:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>, igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v7 2/2] input: add driver for Hynitron CST816X touchscreen
Message-ID: <202409141849.QpkMdWlC-lkp@intel.com>
References: <20240912132823.123409-2-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912132823.123409-2-kuzhylol@gmail.com>

Hi Oleh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next krzk-dt/for-next linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleh-Kuzhylnyi/input-add-driver-for-Hynitron-CST816X-touchscreen/20240912-213044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20240912132823.123409-2-kuzhylol%40gmail.com
patch subject: [PATCH v7 2/2] input: add driver for Hynitron CST816X touchscreen
config: sparc64-randconfig-r133-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141849.QpkMdWlC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409141849.QpkMdWlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141849.QpkMdWlC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/hynitron-cst816x.c:100:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] abs_x @@     got unsigned long @@
   drivers/input/touchscreen/hynitron-cst816x.c:100:21: sparse:     expected restricted __be16 [usertype] abs_x
   drivers/input/touchscreen/hynitron-cst816x.c:100:21: sparse:     got unsigned long
>> drivers/input/touchscreen/hynitron-cst816x.c:101:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] abs_y @@     got unsigned long @@
   drivers/input/touchscreen/hynitron-cst816x.c:101:21: sparse:     expected restricted __be16 [usertype] abs_y
   drivers/input/touchscreen/hynitron-cst816x.c:101:21: sparse:     got unsigned long
>> drivers/input/touchscreen/hynitron-cst816x.c:147:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int value @@     got restricted __be16 [addressable] [usertype] abs_x @@
   drivers/input/touchscreen/hynitron-cst816x.c:147:58: sparse:     expected int value
   drivers/input/touchscreen/hynitron-cst816x.c:147:58: sparse:     got restricted __be16 [addressable] [usertype] abs_x
>> drivers/input/touchscreen/hynitron-cst816x.c:148:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int value @@     got restricted __be16 [addressable] [usertype] abs_y @@
   drivers/input/touchscreen/hynitron-cst816x.c:148:58: sparse:     expected int value
   drivers/input/touchscreen/hynitron-cst816x.c:148:58: sparse:     got restricted __be16 [addressable] [usertype] abs_y

vim +100 drivers/input/touchscreen/hynitron-cst816x.c

    93	
    94	static bool cst816x_process_touch(struct cst816x_priv *priv,
    95					  struct cst816x_touch_info *info)
    96	{
    97		if (cst816x_i2c_read_register(priv, CST816X_FRAME, info, sizeof(*info)))
    98			return false;
    99	
 > 100		info->abs_x = get_unaligned_be16(&info->abs_x) & GENMASK(11, 0);
 > 101		info->abs_y = get_unaligned_be16(&info->abs_y) & GENMASK(11, 0);
   102	
   103		dev_dbg(&priv->client->dev, "x: %d, y: %d, t: %d, g: 0x%x\n",
   104			info->abs_x, info->abs_y, info->touch, info->gesture);
   105	
   106		return true;
   107	}
   108	
   109	static int cst816x_register_input(struct cst816x_priv *priv)
   110	{
   111		priv->input = devm_input_allocate_device(&priv->client->dev);
   112		if (!priv->input)
   113			return -ENOMEM;
   114	
   115		priv->input->name = "Hynitron CST816X Touchscreen";
   116		priv->input->phys = "input/ts";
   117		priv->input->id.bustype = BUS_I2C;
   118		input_set_drvdata(priv->input, priv);
   119	
   120		for (int i = 0; i < ARRAY_SIZE(priv->event_map); i++)
   121			input_set_capability(priv->input, EV_KEY,
   122					     priv->event_map[i].code);
   123	
   124		input_set_abs_params(priv->input, ABS_X, 0, 240, 0, 0);
   125		input_set_abs_params(priv->input, ABS_Y, 0, 240, 0, 0);
   126	
   127		return input_register_device(priv->input);
   128	}
   129	
   130	static void cst816x_reset(struct cst816x_priv *priv)
   131	{
   132		gpiod_set_value_cansleep(priv->reset, 1);
   133		msleep(50);
   134		gpiod_set_value_cansleep(priv->reset, 0);
   135		msleep(100);
   136	}
   137	
   138	static irqreturn_t cst816x_irq_cb(int irq, void *cookie)
   139	{
   140		struct cst816x_priv *priv = cookie;
   141		struct cst816x_touch_info info;
   142	
   143		if (!cst816x_process_touch(priv, &info))
   144			return IRQ_HANDLED;
   145	
   146		if (info.touch) {
 > 147			input_report_abs(priv->input, ABS_X, info.abs_x);
 > 148			input_report_abs(priv->input, ABS_Y, info.abs_y);
   149			input_report_key(priv->input, BTN_TOUCH, 1);
   150		}
   151	
   152		if (info.gesture) {
   153			input_report_key(priv->input,
   154					 priv->event_map[info.gesture & 0x0F].code,
   155					 info.touch);
   156	
   157			if (!info.touch)
   158				input_report_key(priv->input, BTN_TOUCH, 0);
   159		}
   160	
   161		input_sync(priv->input);
   162	
   163		return IRQ_HANDLED;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

