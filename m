Return-Path: <linux-input+bounces-8034-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E3D9C5288
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 10:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A14C283D32
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 09:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053FA20E325;
	Tue, 12 Nov 2024 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZ9ZZ6RS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E12520E314;
	Tue, 12 Nov 2024 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731405498; cv=none; b=ZZlZR/Tb+YNOS5XCR6t8wABYluu0B6Qn6JtI/8Xq8ctg0aIpVTK1k2PbTjo8BzpW1unmrzCkybeJqykylxn47Dcsp87wNSPyxqxSawmZREJ2sRyZf1Lud6f8DqYeFYtZxiNM4lsudz+UnCyKQ3ZM16+byghLr2raE/Xc02ZgSSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731405498; c=relaxed/simple;
	bh=T1svJdA2RSCktG62BP7iuMSDRBK2CKeXOkbU+hwo0uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLL2ArKxvm9iISt1Rz34fbMK/XWhQ2a1fRLnbqBwRCTSzMQA1DiULBYBCcIHObgW35x9KqrGiJ/Goa+i9S7BpFCBWX6e9VKaMiB/Bu5QbcXYWFxzdZWA05DGLKlYvpVeDBGqRh2vrY52fN70GaOp0BqMCwJquLcszcwmUmjJ+K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZ9ZZ6RS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731405498; x=1762941498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T1svJdA2RSCktG62BP7iuMSDRBK2CKeXOkbU+hwo0uU=;
  b=KZ9ZZ6RS3SXsENXGbaPh9u9DcXDWdyfjn/KVDKk4QpBVFi+9hYroeXW9
   gm+ypstqlc4l8X029YeYNppCdI+aiflUO8UuCPTlkXY9woYWXJWaopKOF
   sp06H8EiSv/2eKruU/5EqOaUR3d1DmT1cJ95WTLhEJo7fcRxjmqrOlFpE
   cUS1+xhJ2H6OX+P2bID+s1xxKQLvdh9Sw3o9wuyvpG6bXABfluGs+gVdA
   AIO1eXIlR43xDMqzVYwafBY7uBZAxEGCktZHSUJ3yAdWheasebg8neDNS
   Hn4xxkFQMoRYuJaz4o1uyC8w4jmuNlGCRbhSXa9Qlocr0VT3wuO9x7Mj7
   g==;
X-CSE-ConnectionGUID: pDz7vmrKTk6UYGgCVQdITw==
X-CSE-MsgGUID: PslXD8PJScyQdLqAk6Ej3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31086983"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31086983"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 01:58:17 -0800
X-CSE-ConnectionGUID: FaS6+EqdRNe8kc0FYh0DbA==
X-CSE-MsgGUID: iVSSNiulTDuEulpxbAozzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87788734"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2024 01:58:12 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAnf0-0000gv-02;
	Tue, 12 Nov 2024 09:58:10 +0000
Date: Tue, 12 Nov 2024 17:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: mjchen <mjchen0829@gmail.com>, dmitry.torokhov@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202411121749.9xapQvza-lkp@intel.com>
References: <20241112053059.3361-3-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112053059.3361-3-mjchen0829@gmail.com>

Hi mjchen,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus robh/for-next soc/for-next linus/master v6.12-rc7 next-20241112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mjchen/dt-bindings-input-Add-Nuvoton-MA35D1-keypad/20241112-133327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20241112053059.3361-3-mjchen0829%40gmail.com
patch subject: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241112/202411121749.9xapQvza-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121749.9xapQvza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121749.9xapQvza-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/input/keyboard/ma35d1_keypad.c: In function 'ma35d1_keypad_scan_matrix':
>> drivers/input/keyboard/ma35d1_keypad.c:83:53: warning: left shift count >= width of type [-Wshift-count-overflow]
      83 |         pressed_keys  = key_event[0] | key_event[1] << 32;
         |                                                     ^~
   drivers/input/keyboard/ma35d1_keypad.c:84:53: warning: left shift count >= width of type [-Wshift-count-overflow]
      84 |         released_keys = key_event[2] | key_event[3] << 32;
         |                                                     ^~
   drivers/input/keyboard/ma35d1_keypad.c: In function 'ma35d1_keypad_open':
>> drivers/input/keyboard/ma35d1_keypad.c:130:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     130 |         val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
         |                ^~~~~~~~~~


vim +/FIELD_PREP +130 drivers/input/keyboard/ma35d1_keypad.c

    59	
    60	static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad, unsigned int status)
    61	{
    62		struct input_dev *input_dev = keypad->input_dev;
    63		unsigned int code;
    64		unsigned int key;
    65		unsigned long pressed_keys = 0, released_keys = 0;
    66		unsigned int row_shift = get_count_order(keypad->kpi_col);
    67		unsigned short *keymap = input_dev->keycode;
    68		unsigned long key_event[4];
    69		unsigned int index;
    70	
    71		/* Read key event status */
    72		key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
    73		key_event[1] = readl(keypad->mmio_base + KPI_KPE1);
    74		key_event[2] = readl(keypad->mmio_base + KPI_KRE0);
    75		key_event[3] = readl(keypad->mmio_base + KPI_KRE1);
    76	
    77		/* Clear key event status */
    78		writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
    79		writel(key_event[1], (keypad->mmio_base + KPI_KPE1));
    80		writel(key_event[2], (keypad->mmio_base + KPI_KRE0));
    81		writel(key_event[3], (keypad->mmio_base + KPI_KRE1));
    82	
  > 83		pressed_keys  = key_event[0] | key_event[1] << 32;
    84		released_keys = key_event[2] | key_event[3] << 32;
    85	
    86		/* Process pressed keys */
    87		for_each_set_bit(index, &pressed_keys, KEY_EVENT_BITS) {
    88			code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
    89			key = keymap[code];
    90	
    91			input_event(input_dev, EV_MSC, MSC_SCAN, code);
    92			input_report_key(input_dev, key, 1);
    93		}
    94	
    95		/* Process released keys */
    96		for_each_set_bit(index, &released_keys, KEY_EVENT_BITS) {
    97			code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
    98			key = keymap[code];
    99	
   100			input_event(input_dev, EV_MSC, MSC_SCAN, code);
   101			input_report_key(input_dev, key, 0);
   102		}
   103	
   104		input_sync(input_dev);
   105	}
   106	
   107	static irqreturn_t ma35d1_keypad_interrupt(int irq, void *dev_id)
   108	{
   109		struct ma35d1_keypad *keypad = dev_id;
   110		unsigned int  kstatus;
   111	
   112		kstatus = readl(keypad->mmio_base + KPI_STATUS);
   113	
   114		if (kstatus & (PKEY_INT | RKEY_INT)) {
   115			ma35d1_keypad_scan_matrix(keypad, kstatus);
   116		} else {
   117			if (kstatus & PDWAKE)
   118				writel(PDWAKE, (keypad->mmio_base + KPI_STATUS));
   119		}
   120	
   121		return IRQ_HANDLED;
   122	}
   123	
   124	static int ma35d1_keypad_open(struct input_dev *dev)
   125	{
   126		struct ma35d1_keypad *keypad = input_get_drvdata(dev);
   127		unsigned int val, config;
   128	
   129		val = RKINTEN | PKINTEN | INTEN | ENKP;
 > 130		val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
   131	
   132		if (keypad->debounce_val > 0)
   133			config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1)) |
   134				 FIELD_PREP(DB_CLKSEL, keypad->debounce_val);
   135		else
   136			config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1));
   137	
   138		val |= config;
   139	
   140		writel(val, keypad->mmio_base + KPI_CONF);
   141		writel((keypad->pre_scale_divider - 1),	keypad->mmio_base + KPI_PRESCALDIV);
   142	
   143		return 0;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

