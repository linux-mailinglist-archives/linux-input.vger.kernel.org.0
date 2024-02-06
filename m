Return-Path: <linux-input+bounces-1709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274F84BA3A
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 16:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 226A328CEA7
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 15:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937801339B9;
	Tue,  6 Feb 2024 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUsf3t6V"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99471133404;
	Tue,  6 Feb 2024 15:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707234925; cv=none; b=JZDNcleL8APwUOLfC8vhzf0ydQGqadaWtSIqvtgijCHzgA/xIUEyqw9BR2+2zsf8W1fTotNNAdAKEk+J21p8H/gwcOln2pkoobg8wTCM54seozFHC9jbFBgl1XXUHQCWvfUewouy3B/Vg0JRRUU5bli2HiQsOvNtLOM9r1v+yos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707234925; c=relaxed/simple;
	bh=LzXN8H1Nh9fX0CLo6p7FXChGdEpLUoDQkI9eOCyQdE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQNliLsSxRl9fhMgT+ckcrDS4H/GM2qrXmr7Ppi5nT4CQZk8kgeSwe4uK+thDKJY9nkBlSoxlo05H/jUGmaJJZMPjqkyTUJ2spCfmXlbPu3oeWraIRiB1Dlm0S0KyGa6BG2siOCZzmQqbAtX1/UhwecxojFETd6k4mCYDKInbyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUsf3t6V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707234923; x=1738770923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LzXN8H1Nh9fX0CLo6p7FXChGdEpLUoDQkI9eOCyQdE0=;
  b=OUsf3t6VSoo1Y8392nHPAdoWAUxJWAtRzHKXNzD/pzJ6ipbgjsCtEz1T
   AOUyb4Jvbjk9tWfv/NhFi0tpVhHqWh87rI/On3TjmZEMkkRDoFkhv28tJ
   BJBCfA+dYDS3jjVPtjvRoiOh5B08Tpq4drvglh5QmvlR6TfbwPOlf4GHh
   cEYdZJb+2A3TEAniJBebfKxkblahrBiLF+yMzNqJSIBVkMAhJEw0fH4XF
   rYaI8s348ruJIAikVx+W/AJro5KibR2Dn9QsUn/U1UOh4htJe0IolWSkY
   ftdokFfwpxXb2E7E1nlmU9Vmaj4z0zuJLSNkFrbrio4SNTCvC+wZFodZs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11358961"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="11358961"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="824218404"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="824218404"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Feb 2024 07:55:10 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXNmt-0001Y8-2M;
	Tue, 06 Feb 2024 15:55:07 +0000
Date: Tue, 6 Feb 2024 23:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andriy.shevchenko@linux.intel.com, bentiss@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jikos@kernel.org,
	bartosz.golaszewski@linaro.org, niyas.sait@linaro.org,
	dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, ethan.twardy@plexus.com,
	Danny Kaehn <danny.kaehn@plexus.com>
Subject: Re: [PATCH v10 3/3] HID: cp2112: Fwnode Support
Message-ID: <202402062306.UUQJhqxi-lkp@intel.com>
References: <20240205170920.93499-4-danny.kaehn@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205170920.93499-4-danny.kaehn@plexus.com>

Hi Danny,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on robh/for-next andi-shyti/i2c/i2c-host linus/master v6.8-rc3 next-20240206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Danny-Kaehn/dt-bindings-i2c-Add-CP2112-HID-USB-to-SMBus-Bridge/20240206-015922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240205170920.93499-4-danny.kaehn%40plexus.com
patch subject: [PATCH v10 3/3] HID: cp2112: Fwnode Support
config: x86_64-randconfig-102-20240206 (https://download.01.org/0day-ci/archive/20240206/202402062306.UUQJhqxi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062306.UUQJhqxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062306.UUQJhqxi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-cp2112.c:41: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * CP2112 Fwnode child names.


vim +41 drivers/hid/hid-cp2112.c

    39	
    40	/**
  > 41	 * CP2112 Fwnode child names.
    42	 * CP2112 sub-functions can be described by named fwnode children or by ACPI _ADR
    43	 */
    44	static const char * const cp2112_cell_names[] = {
    45		[CP2112_I2C_ADR]	= "i2c",
    46		[CP2112_GPIO_ADR]	= "gpio",
    47	};
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

