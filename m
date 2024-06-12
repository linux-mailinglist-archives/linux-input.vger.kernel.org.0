Return-Path: <linux-input+bounces-4328-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B406905BD7
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 21:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EFD8B26CDF
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 19:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E337282C6B;
	Wed, 12 Jun 2024 19:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GX1JoK2x"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268018286F;
	Wed, 12 Jun 2024 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718219955; cv=none; b=YkuEqkYBWj0/5c/ZKPHugebc6IU7yuffBKpP3Hnmsz5MaFKpYqjRhGYyAR/foWH1bmOE/mszV0S3C/+6w99rZJwNLqg5EQSuAK4YmoOezudsiEccrjuHSjitV56fStHJGt9lKct9iLjfXYybCH68g6UIjPJC0G7q0GMExomPaYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718219955; c=relaxed/simple;
	bh=niwOHHHq1Pwi5UhfM/Dq1+zY+w/chSzv/sf526DJhOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExbBhhENgwm1qwxriuZNWTBjOjTITtvgp4gti4V8WaR57yVN8jvLj/9j6TPTirUIO29pXV8pIymLrwnwL2gTKTxEf6LywRFw7MFpwMOgDVjvZRwB83OuV81OgEypsBKY5QWoHmAaHbuvPmiXyQjrE6GJu3GaYTqv5oRSRuAiX4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GX1JoK2x; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718219954; x=1749755954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=niwOHHHq1Pwi5UhfM/Dq1+zY+w/chSzv/sf526DJhOI=;
  b=GX1JoK2xcW9TffD4RoReFXB3VkKOijOJjZS7eM0OVVVxSoVDcyO9JXmK
   KHE3KWN/RJrz4EI4q88/HpM3ENKcuofXTqI97sdWTJTzp9NGTFO2xR+cs
   uitQOeAH9GTM3L3tSKOGxzOJuTJSRkrg40haJRa+1f2+qe3HUVzAm89jt
   X2ippfIytRXBIivL5ugtMjx5tyvBXWeLVwmK2pSv4gsEWQXNZUQ5oiPk/
   Zfg6wqiLhct+7PPRlM5tVqao6dYMxOCEloHq66c8RlF0Jx1eOlHz7L54B
   VfdmqPFINIbawvMSkyZ8+qk8gCkUoOBD9q53ioHK1cTx1kosMqgl7Hdoz
   w==;
X-CSE-ConnectionGUID: AnJL/7LeRQmcbaoYKO4nXw==
X-CSE-MsgGUID: kidXO9rOThaFMLBVuRL42A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14883212"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14883212"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 12:19:13 -0700
X-CSE-ConnectionGUID: yDcCwTnyS96DAFSY7TSunA==
X-CSE-MsgGUID: eHyHzQJyR4GUPDhj8me4lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="39781836"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jun 2024 12:19:11 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHTUy-0001rA-0x;
	Wed, 12 Jun 2024 19:19:08 +0000
Date: Thu, 13 Jun 2024 03:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Raymond Hackley <raymondhackley@protonmail.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Markuss Broks <markuss.broks@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] input/touchscreen: imagis: Add supports for Imagis
 IST3038
Message-ID: <202406130336.wSgshW3L-lkp@intel.com>
References: <20240612032036.33103-3-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612032036.33103-3-raymondhackley@protonmail.com>

Hi Raymond,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next linus/master v6.10-rc3 next-20240612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raymond-Hackley/input-touchscreen-imagis-Clarify-the-usage-of-protocol_b/20240612-112300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20240612032036.33103-3-raymondhackley%40protonmail.com
patch subject: [PATCH 2/3] input/touchscreen: imagis: Add supports for Imagis IST3038
config: i386-randconfig-061-20240612 (https://download.01.org/0day-ci/archive/20240613/202406130336.wSgshW3L-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130336.wSgshW3L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130336.wSgshW3L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/imagis.c:421:39: warning: 'imagis_3038c_data' defined but not used [-Wunused-const-variable=]
     421 | static const struct imagis_properties imagis_3038c_data = {
         |                                       ^~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/imagis.c:414:39: warning: 'imagis_3038b_data' defined but not used [-Wunused-const-variable=]
     414 | static const struct imagis_properties imagis_3038b_data = {
         |                                       ^~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/imagis.c:406:39: warning: 'imagis_3038_data' defined but not used [-Wunused-const-variable=]
     406 | static const struct imagis_properties imagis_3038_data = {
         |                                       ^~~~~~~~~~~~~~~~
   drivers/input/touchscreen/imagis.c:397:39: warning: 'imagis_3032c_data' defined but not used [-Wunused-const-variable=]
     397 | static const struct imagis_properties imagis_3032c_data = {
         |                                       ^~~~~~~~~~~~~~~~~


vim +/imagis_3038_data +406 drivers/input/touchscreen/imagis.c

   405	
 > 406	static const struct imagis_properties imagis_3038_data = {
   407		.interrupt_msg_cmd = IST30XX_REG_STATUS,
   408		.touch_coord_cmd = IST30XX_REG_STATUS,
   409		.whoami_cmd = IST30XX_REG_CHIPID,
   410		.whoami_val = IST3038_WHOAMI,
   411		.touch_keys_supported = true,
   412	};
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

