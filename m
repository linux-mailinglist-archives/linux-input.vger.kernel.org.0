Return-Path: <linux-input+bounces-8038-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB79C5BBC
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 16:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75E291F21A6A
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 15:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E13200B86;
	Tue, 12 Nov 2024 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7IiOeaV"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785952003D2;
	Tue, 12 Nov 2024 15:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425007; cv=none; b=itiwO/tKNmIQnqpRZVxtYIHs75bF1lZ78+udi6BzlqDm8l+LlLvCEEXKFwLjP5GGRaFpQGXnAKzmZtf8HVdnfLyQYJxrlAd2/1F8NPMx9CODpfTZpEvp0BzTFF0aQFffFi4b2m1sJ+dS6Ln1zpELLRrsBDHrRg4k1VvP9ctBrpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425007; c=relaxed/simple;
	bh=ZmGj6kivjIzqiKqxOJZckDsly2u9MG2i7lK+kggaPuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEnDP147gnu4Hjac1YflsjB9C/mopSgAHxwPZySk+aexD47Y6ken3vnXy6vEn6U3+/5tzVvdqHkw4bn+QyPOL93eXQLRJSS1zJwTVEZWVjKOZAfz5YRtrt3VK6BN6hq9GJhq82TJ7YFQDsqoKIL28YkDoIlanMGhqy6XbSCZNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7IiOeaV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731425006; x=1762961006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZmGj6kivjIzqiKqxOJZckDsly2u9MG2i7lK+kggaPuk=;
  b=R7IiOeaVTHxeUgoR4lyfYSpPl2c2fgh1mXBXT8ji3k9PWnQAYLymtynK
   4VPPEft1FB9DQO+pXW00wkwOoEEqZTEqjGj0oU+1j9IPTOhKlfgLB9eKT
   58aFxfl7aQw+zghxIibpro7ooRApJHBgH8rn2Cu6ZiPyI+vbKoroCX2rs
   BXEnQrsN6xEI7upAadeFkquhXmqJZJR7kZNjD5IFsb8h+g3uSzQJ9bgfX
   dfxApyLJwKnXE2Kz+ts3urrFRk941QCo+fcqMvIq8+9oFAKZLD4VsiMF+
   n4schTWVHq+mOEsJu/kLEV2Q7ZBD6TjdkawqGK0WjKcAFy551fpggbEB7
   Q==;
X-CSE-ConnectionGUID: URaNJi08SL+gVaR+WvP7aA==
X-CSE-MsgGUID: WIiS2Wd9SKGJjeMMyE6mmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18875199"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="18875199"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:23:25 -0800
X-CSE-ConnectionGUID: 2TDWEbCQS8Wpe20GYEZoBw==
X-CSE-MsgGUID: L5YTJwh1R5W+IzvL53fAUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87477543"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Nov 2024 07:23:21 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAsje-0001Sv-2P;
	Tue, 12 Nov 2024 15:23:18 +0000
Date: Tue, 12 Nov 2024 23:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: mjchen <mjchen0829@gmail.com>, dmitry.torokhov@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202411122236.79vmA2JS-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next soc/for-next linus/master v6.12-rc7 next-20241112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mjchen/dt-bindings-input-Add-Nuvoton-MA35D1-keypad/20241112-133327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20241112053059.3361-3-mjchen0829%40gmail.com
patch subject: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20241112/202411122236.79vmA2JS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122236.79vmA2JS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122236.79vmA2JS-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> drivers/input/keyboard/ma35d1_keypad.c:83:46: warning: shift count >= width of type [-Wshift-count-overflow]
      83 |         pressed_keys  = key_event[0] | key_event[1] << 32;
         |                                                     ^  ~~
   drivers/input/keyboard/ma35d1_keypad.c:84:46: warning: shift count >= width of type [-Wshift-count-overflow]
      84 |         released_keys = key_event[2] | key_event[3] << 32;
         |                                                     ^  ~~
   drivers/input/keyboard/ma35d1_keypad.c:130:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |         val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
         |                ^
   8 warnings and 1 error generated.


vim +83 drivers/input/keyboard/ma35d1_keypad.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

