Return-Path: <linux-input+bounces-8035-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8309C56A6
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 12:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E359D287525
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 11:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261FF1B4F04;
	Tue, 12 Nov 2024 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFW+jsOT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23412309A0;
	Tue, 12 Nov 2024 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731411169; cv=none; b=Tk/DNpF9af0eubIv4m1nemFeLYiZVNKw/u8gtLr3XDF9iTbYuN2GOg7/i5OgIcuO23+yIYb9lbMdwGIhvO5OWqYnBnYdMwYUwaNJMQRK+dzctaOA3M5FziPJPceKIEPtrd5uufHLHYaLRgKrfbCQgA8QAug5qGmprDpfUPv2Pys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731411169; c=relaxed/simple;
	bh=s1MMLAUMQokmBMbhHIrOW9+sDvlm3omQqaMlvypFfmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpGyRg5utAXoWLwCO8E791tYglv5Dp2awvN0UaTuHPzN7lJVsX9fREySlfFOsgZX3GFWXko/Ho412Ekzb1tNsBo8L07oC6FagTWce/LdVz4SuIRX2TnaW3QlGSwT2JkLFGm+FCA7OXwUyD2rAWPsH33Hp/zbsgQVWXbf93ygDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFW+jsOT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731411167; x=1762947167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s1MMLAUMQokmBMbhHIrOW9+sDvlm3omQqaMlvypFfmk=;
  b=RFW+jsOTE3UsJ7/pa27sNQD3Nf3QBBRbNfxJxqmpJP25P1FKBKBhkqaQ
   ojGxSIu2q/mQ/Dahezqj91ANfixPgCqzWzgH6WKBQqz1GPQUgmtFmOyg+
   NsOBVLS3ivGdDvZeue9No4gPKhAZDgy+3rY5fmnQo4vA8Zsxgt2uUIwk6
   TekeVYt0F3PH/OZbfpiUpsLshLgX14+5qozeRGBBkoakRxGHa5fno3s1d
   X1AZZDjhk4v04qPYYbFnKmm6m2AeRXs1lmgz3hWkydS5Y8CZAPhfyxzQp
   2Nn0nBHgIImOzjDcZa1wtWgqQTQd7Eau+rBwlbtOrY/Yi3UnTueO5LhIS
   g==;
X-CSE-ConnectionGUID: nJIj3J5CQaWm0eje3A2+Fg==
X-CSE-MsgGUID: eSjSf+sdSwaO4UiA+he2EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48694724"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48694724"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 03:32:46 -0800
X-CSE-ConnectionGUID: OJB+M98WTpi6RipGJ2YXRg==
X-CSE-MsgGUID: Lw+93KzATU+xQv14PnmTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87577105"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 03:32:42 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAp8S-0001Df-1p;
	Tue, 12 Nov 2024 11:32:40 +0000
Date: Tue, 12 Nov 2024 19:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: mjchen <mjchen0829@gmail.com>, dmitry.torokhov@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202411121938.AoeMusUF-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241112/202411121938.AoeMusUF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121938.AoeMusUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121938.AoeMusUF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/input/keyboard/ma35d1_keypad.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/input/keyboard/ma35d1_keypad.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/input/keyboard/ma35d1_keypad.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/input/keyboard/ma35d1_keypad.c:83:46: warning: shift count >= width of type [-Wshift-count-overflow]
      83 |         pressed_keys  = key_event[0] | key_event[1] << 32;
         |                                                     ^  ~~
   drivers/input/keyboard/ma35d1_keypad.c:84:46: warning: shift count >= width of type [-Wshift-count-overflow]
      84 |         released_keys = key_event[2] | key_event[3] << 32;
         |                                                     ^  ~~
>> drivers/input/keyboard/ma35d1_keypad.c:130:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |         val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
         |                ^
   8 warnings and 1 error generated.


vim +/FIELD_PREP +130 drivers/input/keyboard/ma35d1_keypad.c

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

