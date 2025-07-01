Return-Path: <linux-input+bounces-13269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C5AEED5A
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 06:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 281387AAA34
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 04:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0975F1F2BBB;
	Tue,  1 Jul 2025 04:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTq1R9XW"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75A319D8A7;
	Tue,  1 Jul 2025 04:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751345563; cv=none; b=gRTG+xnMQgsG3545MosfCtynat8Dnpf/ESBUAzWzSuqbfJAY3AYGFHMj/OnV/RNVEi5cHiIEcc1hHzKnzntZ422E64zctxkd4zf7y/7yxan5FxJAFv+JaIU/+T0wBHYSRZSwWGnHFLhSrCNH8i6wGvxHAlRcJRfLKBFSOpIJb5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751345563; c=relaxed/simple;
	bh=qLpGZhMZb9Z8g5y1Iw0lGZyivCoTKa8j9TbnnMY3JnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5GX6VlHE3L1IKq3RsM4NvwfgH9hPuydWWBr+VBH+rNtgghcUvCnJdaAe05CAIlIew4Dg5kFgfLQdrtoAW/5tL2EZWDGY1rtxiVOejEpTsyIKTcEDlMG1yjHE4is+MndXNeA/jbWjnyZ/DUrjLDnqbAw5bb5j/WMfqeCpA0h9oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTq1R9XW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751345560; x=1782881560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qLpGZhMZb9Z8g5y1Iw0lGZyivCoTKa8j9TbnnMY3JnA=;
  b=fTq1R9XW/euhEmGHkLwYJEsLofBkkdF3Zwqwr5UmoO4WxviKyz/LGjwR
   drVNa82J25zfiFGZI7Kv6eHTJUNSXIkoji7yqLbleBHT+HOIJCCjbnwmS
   izCdtXLFt1vsPJ+vIkd3Qh/TT4uFJEAH5kXTJG7AVe9C+ERdgfbKFboJu
   GlpHUkfpb+csNH7lKAKZL2/xpSlt/ZG394TLRu5Fzkabem6O/ga5cN+1T
   KHM351ue87zrk/QE0tQpOCLmhEqnss1m+v9K5wXg6x4PHu8cxdZBOPQqE
   E72voGNm0VnlXGxqSwqAZDtlv7MVj8uIS3/96NnxIlrMtBtOlaXK28iwn
   g==;
X-CSE-ConnectionGUID: 6R/2/Og3S/eSBBnWMNxp5w==
X-CSE-MsgGUID: gkiU17o7S9q56bPTKEnG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53312929"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53312929"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 21:52:40 -0700
X-CSE-ConnectionGUID: lgY+P2arS0uHkQ3gVdLwdA==
X-CSE-MsgGUID: zA6h7u5hQn62QceML/UGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="158050296"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2025 21:52:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWSyv-000ZjC-2J;
	Tue, 01 Jul 2025 04:52:33 +0000
Date: Tue, 1 Jul 2025 12:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Janne Grunau <j@jannau.net>, Igor Opaniuk <igor.opaniuk@gmail.com>,
	Neal Gompa <neal@gompa.dev>, Jeff LaBundy <jeff@labundy.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] input: add hynitron cst816x series touchscreen
Message-ID: <202507011209.R4JNwHSj-lkp@intel.com>
References: <20250629162523.291887-2-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629162523.291887-2-kuzhylol@gmail.com>

Hi Oleh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next krzk-dt/for-next linus/master v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleh-Kuzhylnyi/input-add-hynitron-cst816x-series-touchscreen/20250630-002723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250629162523.291887-2-kuzhylol%40gmail.com
patch subject: [PATCH v8 2/2] input: add hynitron cst816x series touchscreen
config: microblaze-randconfig-r131-20250701 (https://download.01.org/0day-ci/archive/20250701/202507011209.R4JNwHSj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250701/202507011209.R4JNwHSj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011209.R4JNwHSj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/hynitron-cst816x.c:97:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] abs_x @@     got unsigned long @@
   drivers/input/touchscreen/hynitron-cst816x.c:97:21: sparse:     expected restricted __be16 [usertype] abs_x
   drivers/input/touchscreen/hynitron-cst816x.c:97:21: sparse:     got unsigned long
>> drivers/input/touchscreen/hynitron-cst816x.c:98:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] abs_y @@     got unsigned long @@
   drivers/input/touchscreen/hynitron-cst816x.c:98:21: sparse:     expected restricted __be16 [usertype] abs_y
   drivers/input/touchscreen/hynitron-cst816x.c:98:21: sparse:     got unsigned long
>> drivers/input/touchscreen/hynitron-cst816x.c:148:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int value @@     got restricted __be16 [addressable] [usertype] abs_x @@
   drivers/input/touchscreen/hynitron-cst816x.c:148:58: sparse:     expected int value
   drivers/input/touchscreen/hynitron-cst816x.c:148:58: sparse:     got restricted __be16 [addressable] [usertype] abs_x
>> drivers/input/touchscreen/hynitron-cst816x.c:149:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int value @@     got restricted __be16 [addressable] [usertype] abs_y @@
   drivers/input/touchscreen/hynitron-cst816x.c:149:58: sparse:     expected int value
   drivers/input/touchscreen/hynitron-cst816x.c:149:58: sparse:     got restricted __be16 [addressable] [usertype] abs_y

vim +97 drivers/input/touchscreen/hynitron-cst816x.c

    90	
    91	static bool cst816x_process_touch(struct cst816x_priv *priv,
    92					  struct cst816x_touch_desc *desc)
    93	{
    94		if (cst816x_i2c_read_register(priv, CST816X_RD_REG, desc, sizeof(*desc)))
    95			return false;
    96	
  > 97		desc->abs_x = get_unaligned_be16(&desc->abs_x) & GENMASK(11, 0);
  > 98		desc->abs_y = get_unaligned_be16(&desc->abs_y) & GENMASK(11, 0);
    99	
   100		dev_dbg(&priv->client->dev, "x: %u, y: %u, t: %u, g: 0x%x\n",
   101			desc->abs_x, desc->abs_y, desc->touch, desc->gesture);
   102	
   103		return true;
   104	}
   105	
   106	static int cst816x_register_input(struct cst816x_priv *priv)
   107	{
   108		priv->input = devm_input_allocate_device(&priv->client->dev);
   109		if (!priv->input)
   110			return -ENOMEM;
   111	
   112		priv->input->name = "Hynitron CST816x Series Touchscreen";
   113		priv->input->phys = "input/ts";
   114		priv->input->id.bustype = BUS_I2C;
   115		input_set_drvdata(priv->input, priv);
   116	
   117		input_set_abs_params(priv->input, ABS_X, 0, 240, 0, 0);
   118		input_set_abs_params(priv->input, ABS_Y, 0, 240, 0, 0);
   119	
   120		for (int i = 0; i < priv->keycodemax; i++) {
   121			if (priv->keycode[i] == KEY_RESERVED)
   122				continue;
   123	
   124			input_set_capability(priv->input, EV_KEY, priv->keycode[i]);
   125		}
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
   141		struct cst816x_touch_desc desc;
   142	
   143		if (!cst816x_process_touch(priv, &desc))
   144			return IRQ_HANDLED;
   145	
   146		if (desc.touch) {
   147			input_report_key(priv->input, priv->keycode[CST816X_TOUCH], 1);
 > 148			input_report_abs(priv->input, ABS_X, desc.abs_x);
 > 149			input_report_abs(priv->input, ABS_Y, desc.abs_y);
   150		}
   151	
   152		if (desc.gesture) {
   153			input_report_key(priv->input, priv->keycode[desc.gesture & 0x0F],
   154					 desc.touch);
   155	
   156			if (!desc.touch)
   157				input_report_key(priv->input,
   158						 priv->keycode[CST816X_TOUCH], 0);
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

