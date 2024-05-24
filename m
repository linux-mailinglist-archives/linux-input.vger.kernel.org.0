Return-Path: <linux-input+bounces-3828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63B8CE940
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 19:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFFEB1F21E42
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 17:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD9522334;
	Fri, 24 May 2024 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5/1qAQ7"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E641BF3F;
	Fri, 24 May 2024 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716572575; cv=none; b=A+UWL1n9rZrlfVK4VOpi8XfTXzZGjtovV9H2hunTqoUvQosj/23S8Y6m/38Q06GUmgJhl76IhAPCKaDDnq5GUxCpAn3ycpKoPCGGRBn+3xMT2FHm85efIfLVjcdWftK9iLkRY4vfd4SsWN6ri3ZO5x02qoNoVipcWCn2uYe3JWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716572575; c=relaxed/simple;
	bh=Vt9WG4RjE0QI+CxeJSDF2lyAEOIQRCKue7JYBLqohNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prjEbBoZtP9NqpquIqzQeI+1eXTugx9YffwNcDrQpJfOWzKf/im5qWNdjesfo9aQ4FexxmZYN4UlGYoErNB5Qyksz67n0jlNqDM+bEU+I5+Zf8ToOynvPc2y/mYc0VZSxtELb7QvDiZrmdeuPbEvAV+C50dkLnNn3Su4aQlsD5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5/1qAQ7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716572574; x=1748108574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vt9WG4RjE0QI+CxeJSDF2lyAEOIQRCKue7JYBLqohNw=;
  b=W5/1qAQ7xlFxBzE5+chl03eHZJUFVS7R6sfcD99G6XE21Xb+FfiZVFt5
   vUVlhaFwh06ZAAmu3Joew6itQwu6XPq0zX7Mz29PQcbjtBQYrskdsistW
   8IoxjZLiJhnNXExdNWvia8iMP1/s6AAyOfRJ/izCccHNL5fqBwS86ETLl
   uqz7mXOqUjyDhpISlZNCQYVljONRUuj9sCiVFVW8KQHxBo3XIzWFdZ4GG
   5i2QcOGtwKBo0YKSH8VdON6jvh/2sZ5VOs6JBV9KXEpdSFC6rtbXQm51G
   YCrYYq2Ed5EReRP86rIw4bX1AqS5SxyhTD+FM+Tax0FR1GtGOA0tVa7v7
   A==;
X-CSE-ConnectionGUID: 2fVxxrVOR7m56D1FKwslkA==
X-CSE-MsgGUID: 1IwMxMvgQmaRnoHSh1ASTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12835629"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="12835629"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 10:42:53 -0700
X-CSE-ConnectionGUID: rz0wayrjT4GP7CdlUOtxUg==
X-CSE-MsgGUID: YIefQKfHS9WX4xXL9mHsqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34613828"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 May 2024 10:42:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAYwJ-0005kf-2O;
	Fri, 24 May 2024 17:42:47 +0000
Date: Sat, 25 May 2024 01:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Wang <charles.goodix@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jingliang@chromium.org, hbarnor@chromium.org, dianders@chromium.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: Re: [PATCH] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <202405250142.ZtT610HW-lkp@intel.com>
References: <20240524103407.36861-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524103407.36861-1-charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.9 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240524-183743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240524103407.36861-1-charles.goodix%40gmail.com
patch subject: [PATCH] HID: hid-goodix: Add Goodix HID-over-SPI driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240525/202405250142.ZtT610HW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250142.ZtT610HW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250142.ZtT610HW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/hid-goodix.c:9:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hid/hid-goodix.c:9:
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
   In file included from drivers/hid/hid-goodix.c:9:
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
   In file included from drivers/hid/hid-goodix.c:9:
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
>> drivers/hid/hid-goodix.c:627:36: warning: unused variable 'goodix_spi_acpi_match' [-Wunused-const-variable]
     627 | static const struct acpi_device_id goodix_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +/goodix_spi_acpi_match +627 drivers/hid/hid-goodix.c

   626	
 > 627	static const struct acpi_device_id goodix_spi_acpi_match[] = {
   628		{ "GXTS7986" },
   629		{ },
   630	};
   631	MODULE_DEVICE_TABLE(acpi, goodix_spi_acpi_match);
   632	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

