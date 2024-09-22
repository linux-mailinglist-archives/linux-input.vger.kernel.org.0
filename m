Return-Path: <linux-input+bounces-6637-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB697E3E5
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2024 00:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E797A1C20ECA
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2024 22:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12861E885;
	Sun, 22 Sep 2024 22:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrRshsmm"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584C2C1AC
	for <linux-input@vger.kernel.org>; Sun, 22 Sep 2024 22:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727043195; cv=none; b=Kf4+iesft8DM6SVFqV8WzkfqyuCjyCSJTxawiYhJ+EILsLgbcxeQEGDgOBARigBROMc5swbrHEBSRcf9KKZDjo2DEiE2w0NSM3t4FF3YY6pfqqWAOsRIgA0MXi3ka2i+nK1HHqWGUmH53vs0urf0lge44TFdmiHRLD1NrprPCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727043195; c=relaxed/simple;
	bh=rh1rTo3Gj3cAig6/PEUTbSJgDwBmDMCizYcfTkGAyzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L3nWoZH74EViAqxGxks+MdOZ4dEwMGWbDPbGPlqvUO6IvKJ2q63OyOyGBvaJEFtN/8feH46S4uqHDkwFPqwzZViIsKmAur9WB2K3Ic/He986baa+rWw3URT4lvJl5XMX4evckZuAGuOiKHhnw1mw7hrdfg/OOvHeVwWevWVtqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrRshsmm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727043194; x=1758579194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rh1rTo3Gj3cAig6/PEUTbSJgDwBmDMCizYcfTkGAyzA=;
  b=mrRshsmmk0hJQSEHG6pVPD2jIjlDiB+b+p+VVlf0h99b2ln0AevQCqoE
   ZXqMNISomXTZ0Q0XtgF9OQErpTVR5s/cF7DxxPZa7mZ5yClqb5NuppyHu
   KYZxH+LokAEQsaFvb+guQ8n8o4GjxcGlZqm15gfheoUfTZesFM05K6aSD
   9ZxW/iIysTM5ifew+BfFG5ys1MA4sl3j9aSfTcgy8vyWiNhTbgZ/RCum/
   0DAYtPG75QLAmXObHYsZNILWDMXjNwwnpiMUtR4LT2BYGA5qEMgEeJhHg
   mw2SILAJ5lf+Cvs47Xvlp1jsv2f0E/uLR2x2wFXb9MiySx+7ivi0gsnSP
   g==;
X-CSE-ConnectionGUID: Kl8UiD+pTBeB9QBpZ9O6tw==
X-CSE-MsgGUID: 5FiK1tW0TeyOtpwKj5d1Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37351919"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="37351919"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 15:13:13 -0700
X-CSE-ConnectionGUID: HVX19IhpQMOpr72Z5L/aRQ==
X-CSE-MsgGUID: gvH42ND6RHm4FC0Ehkbe1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70473723"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2024 15:13:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssUpJ-000Ggw-2e;
	Sun, 22 Sep 2024 22:13:09 +0000
Date: Mon, 23 Sep 2024 06:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [dtor-input:for-linus 4/40] arch/arm/mach-pxa/spitz.c:406:9: error:
 implicit declaration of function 'PROPERTY_ENTRY_ARRAY_U32'; did you mean
 'PROPERTY_ENTRY_U8_ARRAY_LEN'?
Message-ID: <202409230614.BBJikfMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
head:   b2142a22ef22466575feaccc74a2995c62cae7e8
commit: 1b05a701375107b2c2beae9c518b8e1a3819e086 [4/40] ARM: spitz: Use software nodes/properties for the matrix keypad
config: arm-randconfig-001-20240923 (https://download.01.org/0day-ci/archive/20240923/202409230614.BBJikfMj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230614.BBJikfMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230614.BBJikfMj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-pxa/spitz.c:406:9: error: implicit declaration of function 'PROPERTY_ENTRY_ARRAY_U32'; did you mean 'PROPERTY_ENTRY_U8_ARRAY_LEN'? [-Wimplicit-function-declaration]
     406 |         PROPERTY_ENTRY_ARRAY_U32("linux,keymap", spitz_keymap),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         PROPERTY_ENTRY_U8_ARRAY_LEN
>> arch/arm/mach-pxa/spitz.c:406:9: error: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/arm/mach-pxa/spitz.c:406:9: note: (near initialization for 'spitz_mkp_properties[0].name')
>> arch/arm/mach-pxa/spitz.c:406:9: error: initializer element is not constant
   arch/arm/mach-pxa/spitz.c:406:9: note: (near initialization for 'spitz_mkp_properties[0].name')


vim +406 arch/arm/mach-pxa/spitz.c

   404	
   405	static const struct property_entry spitz_mkp_properties[] = {
 > 406		PROPERTY_ENTRY_ARRAY_U32("linux,keymap", spitz_keymap),
   407		PROPERTY_ENTRY_REF_ARRAY("row-gpios", spitz_mkp_row_gpios),
   408		PROPERTY_ENTRY_REF_ARRAY("col-gpios", spitz_mkp_col_gpios),
   409		PROPERTY_ENTRY_U32("col-scan-delay-us", 10),
   410		PROPERTY_ENTRY_U32("debounce-delay-ms", 10),
   411		PROPERTY_ENTRY_BOOL("wakeup-source"),
   412		{ }
   413	};
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

