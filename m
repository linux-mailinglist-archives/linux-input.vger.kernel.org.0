Return-Path: <linux-input+bounces-5734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303FB95AC5C
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 06:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E5AF1C22539
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 04:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914D225624;
	Thu, 22 Aug 2024 04:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuSsMDjW"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD771B970;
	Thu, 22 Aug 2024 04:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724299591; cv=none; b=NoOY5cY1hIWsAvjKcHvZVxuEeCepE7ToNRzmsAq5uWKHPEYj+UvP5Q9pFvhqYGZkIk4JzTYhRQ52W2GEsTbmxUFDxrQDmgI7zlWKZeL/mg2ra4BxCU48/L7DMwYOekuu65G0aZlo1yH+xJKcj9szFyLZSJ+w8pXAfEi/X57RTdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724299591; c=relaxed/simple;
	bh=h+7VUn8zijg/bGK9rj92aQWLkRIvnnYNAUgbwBMKUtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6KBl7/LYmuobvo0r/9wJ9b6LtteB8fp6c0QG0BmfRSlyO3SGtRIXWQ9MbyVW0Kh6y4aNrTzqfR7yRHDMSpUOooDgSeqd18GMyCkE5FGGZ20NfWIY5DKgbaGLxLEdEfoR+UpDC3kEwbdo7c7mc78YSGFxjDzmbXpldXrb/r5j3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuSsMDjW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724299589; x=1755835589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h+7VUn8zijg/bGK9rj92aQWLkRIvnnYNAUgbwBMKUtE=;
  b=OuSsMDjW338wT5fwfTCIsCLbLrrbEyIkOrvDyPfjeXi41AOmxy3G+Z7/
   n+aU5m6jQ/TlBnWQ4jPyNzlgYJh38ZVuPl/ZQ50f5IThxKpklfcE9S6+8
   x4UtWpBxzUcFAxofKorIEDvz0Dp5UPG9pfwEL43juhDznazN4jzQ5Rm0o
   u4rph5KS8EOY9+Y2ECUuTwb3kr3Mk+tgmYfFlfTt6rhcVsgYiTLbL9uG8
   w1J583ObRmiftgxucMpq53A1n1eht08Koj6iDz2gkiijqLVg5J5EPkT6/
   r63wnbuabVA0vVv8VTmcmE1tAlp/GG5bJwtFWYOdteJluhkCvv/Pm//ss
   g==;
X-CSE-ConnectionGUID: EqZBDZTDRwaYDqSge3GqCQ==
X-CSE-MsgGUID: 7u+yb3ctQWis2UQI7UfNmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22874173"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="22874173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 21:06:28 -0700
X-CSE-ConnectionGUID: UhBDiS8ERQyGVVxG8PYIKA==
X-CSE-MsgGUID: UMplunvoT3iAhBaIVt1hvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="84483979"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2024 21:06:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgz5a-000CJ8-1v;
	Thu, 22 Aug 2024 04:06:22 +0000
Date: Thu, 22 Aug 2024 12:06:05 +0800
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
Subject: Re: [PATCH v5 2/7] mfd: add base driver for qnap-mcu devices
Message-ID: <202408221141.ZK7cre1s-lkp@intel.com>
References: <20240819144000.411846-3-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819144000.411846-3-heiko@sntech.de>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240819]
[also build test WARNING on v6.11-rc4]
[cannot apply to groeck-staging/hwmon-next lee-leds/for-leds-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes linus/master v6.11-rc4 v6.11-rc3 v6.11-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/dt-bindings-mfd-add-binding-for-qnap-ts433-mcu-devices/20240819-224312
base:   next-20240819
patch link:    https://lore.kernel.org/r/20240819144000.411846-3-heiko%40sntech.de
patch subject: [PATCH v5 2/7] mfd: add base driver for qnap-mcu devices
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408221141.ZK7cre1s-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221141.ZK7cre1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221141.ZK7cre1s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/qnap-mcu.c:64: warning: Excess struct member 'reply_lock' description in 'qnap_mcu'


vim +64 drivers/mfd/qnap-mcu.c

    47	
    48	/**
    49	 * struct qnap_mcu - QNAP NAS embedded controller
    50	 *
    51	 * @serdev:	Pointer to underlying serdev
    52	 * @bus_lock:	Lock to serialize access to the device
    53	 * @reply_lock:	Lock protecting @reply
    54	 * @reply:	Pointer to memory to store reply payload
    55	 * @variant:	Device variant specific information
    56	 * @version:	MCU firmware version
    57	 */
    58	struct qnap_mcu {
    59		struct serdev_device *serdev;
    60		struct mutex bus_lock;
    61		struct qnap_mcu_reply reply;
    62		const struct qnap_mcu_variant *variant;
    63		u8 version[QNAP_MCU_VERSION_LEN];
  > 64	};
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

