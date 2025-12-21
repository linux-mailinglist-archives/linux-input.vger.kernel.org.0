Return-Path: <linux-input+bounces-16656-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 812F2CD43BB
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 19:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1724130052AA
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 18:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2148221FB4;
	Sun, 21 Dec 2025 18:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDBTuYbi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B912222BF
	for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 18:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766340825; cv=none; b=EavvhbFjt+UgImpVc/D+g0QhFaAevklXAUKbBu+FgAGWdpWx2KUw2gVx8JKLAeGMx4zLzpDq+WKZzptorWl8a80AUeUNYRCW7cxA24XdUvtnSAkFsUeznFcXyD1IbFv0Vr6g8e72W6X65xkG6l7vqwQKcIVvfYF9DjH0TJ/fvDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766340825; c=relaxed/simple;
	bh=h7ZmzTuYatF0vy+w9L4V2L1i4Xb9Ph1rwUR2RQy0vmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQDEblSeWAT3TZtXK7CLKUoTlStRtsggDOpC4mKlUjy9tw0A2fDUxQtSZQO26mL/TglH6PcSoHgkvPhtBnt/JJVYMPKM7xKNgqQwNEY0E3G3POvBldG6DbRo7893F+JhBWioBSe6tnWSGcIBsurtYUsRBPfFuRwYGB9DzW9tJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDBTuYbi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766340824; x=1797876824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h7ZmzTuYatF0vy+w9L4V2L1i4Xb9Ph1rwUR2RQy0vmU=;
  b=SDBTuYbin6lzpmo0Du8fQKUFLVWt2ZsT0z9vJNBzGTZPPUCBEcD39DUO
   YO019eJxy+fwa+lOlSvMAMMQ8ivL4Fr9stX+njafHRTyjRWmyUarE+Gxt
   4xQtcCTVznJnPF9e3icNGtyPZ4QgVNewjc5X4KOrq9QAhvBkvxJjjIQa/
   QeWFdi4zn+qhzL8A36RaRaJLM/hFWBPykjQdA22cqv85QjMb/TicFPrTk
   VwVpYvX+Uay33+/kxRj8LxXFjSWADT/iYgvkkgvxlXbv5+hen1tLynulv
   5jDp9fxmYwq64hVm9I0bWLK9is/zMqpsRMVQiX+R/PP19MgZD7adVm/1t
   w==;
X-CSE-ConnectionGUID: gIfpkd9KSY+NMELqBfTllA==
X-CSE-MsgGUID: xaN8lLkAR+S9voeJ5+1Gug==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78932795"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78932795"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 10:13:43 -0800
X-CSE-ConnectionGUID: iriiNaipTsyFm2x9vCo05w==
X-CSE-MsgGUID: iMA5kG0mRq+jXogKMB664w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="203874060"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Dec 2025 10:13:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXNw3-000000005w1-1wPh;
	Sun, 21 Dec 2025 18:13:39 +0000
Date: Mon, 22 Dec 2025 02:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [dtor-input:next 18/20]
 drivers/input/misc/twl4030-pwrbutton.c:46:44: warning: 'twl6030_chipdata'
 defined but not used
Message-ID: <202512220251.jDE8tKup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   eeb2ea4b59df5fdcb697904fe6f49d5851543808
commit: ec8fce2a57e96e07d82d4e884430c2cb6c048998 [18/20] Input: twl4030 - add TWL603x power button
config: m68k-randconfig-r073-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220251.jDE8tKup-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220251.jDE8tKup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220251.jDE8tKup-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/misc/twl4030-pwrbutton.c:46:44: warning: 'twl6030_chipdata' defined but not used [-Wunused-const-variable=]
      46 | static const struct twl_pwrbutton_chipdata twl6030_chipdata = {
         |                                            ^~~~~~~~~~~~~~~~
>> drivers/input/misc/twl4030-pwrbutton.c:41:44: warning: 'twl4030_chipdata' defined but not used [-Wunused-const-variable=]
      41 | static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
         |                                            ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/twl6030_chipdata +46 drivers/input/misc/twl4030-pwrbutton.c

    40	
  > 41	static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
    42		.status_reg = 0xf,
    43		.need_manual_irq = false,
    44	};
    45	
  > 46	static const struct twl_pwrbutton_chipdata twl6030_chipdata = {
    47		.status_reg = 0x2,
    48		.need_manual_irq = true,
    49	};
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

