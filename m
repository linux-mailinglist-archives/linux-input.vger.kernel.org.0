Return-Path: <linux-input+bounces-3829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF258CE9F7
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 20:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ED082859C1
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 18:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53AD3D966;
	Fri, 24 May 2024 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sw8kV54I"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5353D0AD;
	Fri, 24 May 2024 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716575868; cv=none; b=AyfNYg3xl1aiNFuD2aM5JcaPxQFhzZqPlX0hKuaWVVLfmS8tO8UmXW0X4okijMFfqZSZSG3zez0HMfWI6VSBWwNZ8KDjF/cZ8dVQCkji3hoGPaq9jgYyciEiLaf+sLswkZdURnG8IqFaB8JRwh6UwsgZ0Zd5/zZUKIuLIXgLliI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716575868; c=relaxed/simple;
	bh=zHXrAeL3Qd4gH72yGBmHKVGyMWPZ9OofuMJx12Xm7lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQrV1NjbRkZeqNg6YcpW2gokKbEJTlf4rP8LgtpXSoMpYB5HWtWh3L5DomcdnALni1xp8W3mZAhU6aM7Wn7v8sRN3Ft2f7BfwcBoKdHbAp6nR0tA2XzEVmR9y103K/GJT6WALn1LrLaPxrIeFcD90x5RDPDcJRUAW0bHnqjTn8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sw8kV54I; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716575866; x=1748111866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zHXrAeL3Qd4gH72yGBmHKVGyMWPZ9OofuMJx12Xm7lU=;
  b=Sw8kV54I9TdSMvVXej+TWcZ44qEayh6rqKvYjNDT3/6yuFLoWqNVK1wi
   YKvT6BJB7ObCoUbHh/3wOp7B3uLGCoojAaX9kVLpGLlPY1TyXdtxSk3RK
   aSGiNlToNNtc4J9hD7i7sbhXsPzRudgUWL2vq90zwWZn23E8DW+cnE3mU
   T5taZ74QX9v/MFu026SVe8xqYKGaN/plnlCXYwS5PyoGlWXGYdeEAmh4d
   e185qyOcivRcVqQilsmm617rsfZgL6p1NkrEF5/5g9AG1HwoWi1w3UJFU
   YxRJgij29h1Pb0IkCw39qjCWCBenSWUY6Cwd9ZKw7/fyeFDxr0jNy/ALH
   A==;
X-CSE-ConnectionGUID: ywcH/17OQr+lYgJH6yCZQA==
X-CSE-MsgGUID: /T5tuSm+RNe56Gfuh5rhkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13088218"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="13088218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 11:37:46 -0700
X-CSE-ConnectionGUID: GYJFVKEkQq26EbRV8fsL5g==
X-CSE-MsgGUID: f3NVpQNoT4yHRjnWJrijRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34121124"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 11:37:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAZnR-0005nR-0V;
	Fri, 24 May 2024 18:37:41 +0000
Date: Sat, 25 May 2024 02:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Wang <charles.goodix@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jingliang@chromium.org,
	hbarnor@chromium.org, dianders@chromium.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: Re: [PATCH] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <202405250219.FIZ8w81d-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240525/202405250219.FIZ8w81d-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250219.FIZ8w81d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250219.FIZ8w81d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-goodix.c:627:36: warning: 'goodix_spi_acpi_match' defined but not used [-Wunused-const-variable=]
     627 | static const struct acpi_device_id goodix_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~


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

