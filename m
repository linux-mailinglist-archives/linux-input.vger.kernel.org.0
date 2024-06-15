Return-Path: <linux-input+bounces-4371-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0C390997E
	for <lists+linux-input@lfdr.de>; Sat, 15 Jun 2024 20:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E02C91F217CA
	for <lists+linux-input@lfdr.de>; Sat, 15 Jun 2024 18:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1458C52F6D;
	Sat, 15 Jun 2024 18:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mf41acdW"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F11B1870;
	Sat, 15 Jun 2024 18:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718474679; cv=none; b=AFemUm529uI0MEFTuoJu0Bv66DqOnI/fLgx2TQUg9/zo/TbjZrv3pfZR7BWcsCSDNARKalOgSsrgVL3ykZ3mKPOVrTCrUkJMWMJne9VNNUGp1Qo1uGEzODF+jOsBaedBOGsHg3LhYTqGry8N8rapLA9GLb+WfW9XmPjQdorVT+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718474679; c=relaxed/simple;
	bh=oyqGpECu9sSJX+1MFXlkOC1YcQnSCGTgdSSt7G2X3ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQeZyJ/m1NbuJxZ1NG8WDDV/95Dgtt5Dolju2VtMHjOyEeUOp/cx7uHmfP6EfZAfEWJwWsuKHKl+V80ih2O8e0XN2w3NIv8GMlQ+96xz4Ike46/TNXUu8jSW3ZlOWsO6ieWWk/Mjqmj9G5ljrzy5Rf+FA301YCGVwOSi98N+VQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mf41acdW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718474677; x=1750010677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oyqGpECu9sSJX+1MFXlkOC1YcQnSCGTgdSSt7G2X3ek=;
  b=Mf41acdW9geC7DsmfGjf2LRHg1EOPSdFYOfC/G4tsQv3jo6gxA4K9+p5
   g8UDiNtiNKEK8FWJkxS69NT71LvxInOhaQrzCjMZf/CBewkgj4f44AP7i
   K9HxD2VHpyBtKTfdmnZd+iOOftJDIEiHldLnP3jKgpnxhDKeUJJaiQrsq
   vz8Tl4ckgXcgCcoz5XrDib2kFMOqVCW4g9azuTOvbd7mIiO11e0KqJrpE
   eb/CnO0HNPgvBy3Sg5rX7OSMsk+gL0ySI/S4EkZwRgjrC9gJATxHHhuma
   hYyOrS76Zt8aWIbV7Yj4RHufyVjLg2WN0+bt8mwc8OR4DGuiN2/Psqwx4
   Q==;
X-CSE-ConnectionGUID: FhSxwC+JSTWhU8FVYfw3Og==
X-CSE-MsgGUID: /yawhViTS1y0LF2C2BXFOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15187704"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15187704"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 11:04:37 -0700
X-CSE-ConnectionGUID: A26Et5dgSLi26d/ZHQNoew==
X-CSE-MsgGUID: 9gra+hgFQXiMfeJD+h+rkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="71588247"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jun 2024 11:04:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIXlO-0000Mu-0m;
	Sat, 15 Jun 2024 18:04:30 +0000
Date: Sun, 16 Jun 2024 02:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com,
	dan.carpenter@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dianders@chromium.org, robh@kernel.org, krzk+dt@kernel.org,
	jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: Re: [PATCH v4 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <202406160446.MeGfJeG1-lkp@intel.com>
References: <20240614121538.236727-2-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614121538.236727-2-charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus robh/for-next linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240614-201949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240614121538.236727-2-charles.goodix%40gmail.com
patch subject: [PATCH v4 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240616/202406160446.MeGfJeG1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160446.MeGfJeG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160446.MeGfJeG1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/hid/hid-goodix-spi.c:9:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hid/hid-goodix-spi.c:9:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
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
   In file included from drivers/hid/hid-goodix-spi.c:9:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
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
   In file included from drivers/hid/hid-goodix-spi.c:9:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
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
>> drivers/hid/hid-goodix-spi.c:148:4: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
     147 |                 dev_err(ts->dev, "read data len exceed limit %ld",
         |                                                              ~~~
         |                                                              %u
     148 |                         sizeof(ts->xfer_buf) - GOODIX_SPI_READ_PREFIX_LEN);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/hid/hid-goodix-spi.c:182:4: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
     181 |                 dev_err(ts->dev, "write data len exceed limit %ld",
         |                                                               ~~~
         |                                                               %u
     182 |                         sizeof(ts->xfer_buf) - GOODIX_SPI_WRITE_PREFIX_LEN);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/hid/hid-goodix-spi.c:606:44: warning: variable 'error' is uninitialized when used here [-Wuninitialized]
     606 |                 dev_err(ts->dev, "failed read data, %d", error);
         |                                                          ^~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/hid/hid-goodix-spi.c:556:11: note: initialize the variable 'error' to silence this warning
     556 |         int error;
         |                  ^
         |                   = 0
>> drivers/hid/hid-goodix-spi.c:801:23: error: use of undeclared identifier 'goodix_spi_pm_ops'; did you mean 'goodix_spi_probe'?
     801 |                 .pm = pm_sleep_ptr(&goodix_spi_pm_ops),
         |                                     ^~~~~~~~~~~~~~~~~
         |                                     goodix_spi_probe
   include/linux/pm.h:476:65: note: expanded from macro 'pm_sleep_ptr'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                                                                 ^
   include/linux/kernel.h:48:38: note: expanded from macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^
   drivers/hid/hid-goodix-spi.c:655:12: note: 'goodix_spi_probe' declared here
     655 | static int goodix_spi_probe(struct spi_device *spi)
         |            ^
>> drivers/hid/hid-goodix-spi.c:801:9: error: incompatible pointer types initializing 'const struct dev_pm_ops *' with an expression of type 'int (*)(struct spi_device *)' [-Werror,-Wincompatible-pointer-types]
     801 |                 .pm = pm_sleep_ptr(&goodix_spi_pm_ops),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:476:28: note: expanded from macro 'pm_sleep_ptr'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:48:27: note: expanded from macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   10 warnings and 2 errors generated.


vim +801 drivers/hid/hid-goodix-spi.c

   795	
   796	static struct spi_driver goodix_spi_driver = {
   797		.driver = {
   798			.name = "goodix-spi-hid",
   799			.acpi_match_table = ACPI_PTR(goodix_spi_acpi_match),
   800			.of_match_table = of_match_ptr(goodix_spi_of_match),
 > 801			.pm = pm_sleep_ptr(&goodix_spi_pm_ops),
   802		},
   803		.probe =	goodix_spi_probe,
   804		.remove =	goodix_spi_remove,
   805		.shutdown =	goodix_spi_shutdown,
   806		.id_table =	goodix_spi_ids,
   807	};
   808	module_spi_driver(goodix_spi_driver);
   809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

