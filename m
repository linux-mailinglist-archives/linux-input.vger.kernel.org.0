Return-Path: <linux-input+bounces-1752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D705B84D562
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 23:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A821C2577F
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 22:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216B612B156;
	Wed,  7 Feb 2024 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDYzpuU8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3FF12AAF9;
	Wed,  7 Feb 2024 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707341437; cv=none; b=YQy1hdOw5EJMZ7XyWPikQZL9BscjwKZcDFowOfW3Wci9cxmBmyhDuJMaANqh8Gt72OGojPQEBp8wLPOhHT+0kWOXpR5DAP7MzA5Y+8ImbtWgXts6YJnsJMaxIO1EM+6EwviRzNU7tLp1WLuYW5zgGJAhX+pl4vFdXOqfhTXKwfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707341437; c=relaxed/simple;
	bh=eDnc59kht7O8Qg75/MonoyZkWzSOmlK2QuJlP98lg7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meyoMYNWwiS8gSBPa9i4noykueqhjT/aZwbDMgKxesMzR4Rj61KNRWp2FQuF2ZuuX0AZzb/2/tDwb+szS2ktiGMaesN6Ga3zliHWFo4HFtHT+k7RvlfXZ4YwCiBOOZziPXVXYb3wTGeWIHBqVIL4TFsmGQ902Ajo69azUFR66Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDYzpuU8; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707341434; x=1738877434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eDnc59kht7O8Qg75/MonoyZkWzSOmlK2QuJlP98lg7s=;
  b=EDYzpuU8CZtG1aBT2t6ea4dhIgl55gpVLUeibg/PWFiwnj9i5ErfiYsA
   8dZGBr3w69y50YuPfItjvEtYB8ELMN16UxtJnhwdreG9zJ5K+hh0EW9Mt
   wX12LzdPXgBblNZwlbK6eO1Dea/p2kie1diHzxYKR+xJsQuulRsZJb6hY
   bXJnGkmhxZ7/HCSchjbNzOQ9a5drRBgZYqhBTGr4k2295PRqpEgtzMFqE
   4WGMghNy4+JWza4WU4iBAdAg9bha2d4xvmNnbBq/hbbDtQdZEFVtWkXA2
   IIhp0+/tHisy+mOcY9AnYLLy4XHSlUAQf7Yb1AfdzPWckjQ7K9lRR5Cu6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="395504120"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="395504120"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 13:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1748616"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2024 13:30:14 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXpUi-000343-0u;
	Wed, 07 Feb 2024 21:30:12 +0000
Date: Thu, 8 Feb 2024 05:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: James Ogletree <jogletre@opensource.cirrus.com>,
	dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, jeff@labundy.com
Cc: oe-kbuild-all@lists.linux.dev, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	James Ogletree <jogletre@opensource.cirrus.com>
Subject: Re: [PATCH v6 4/5] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Message-ID: <202402080502.5DJwrbZt-lkp@intel.com>
References: <20240207003612.4187370-5-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207003612.4187370-5-jogletre@opensource.cirrus.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes broonie-sound/for-next linus/master v6.8-rc3 next-20240207]
[cannot apply to dtor-input/next dtor-input/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Ogletree/firmware-cs_dsp-Add-write-sequencer-interface/20240207-083734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240207003612.4187370-5-jogletre%40opensource.cirrus.com
patch subject: [PATCH v6 4/5] Input: cs40l50 - Add support for the CS40L50 haptic driver
config: alpha-randconfig-r112-20240207 (https://download.01.org/0day-ci/archive/20240208/202402080502.5DJwrbZt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240208/202402080502.5DJwrbZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402080502.5DJwrbZt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/misc/cs40l50-vibra.c:245:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got signed short [noderef] [usertype] __user *custom_data @@
   drivers/input/misc/cs40l50-vibra.c:245:53: sparse:     expected void const *
   drivers/input/misc/cs40l50-vibra.c:245:53: sparse:     got signed short [noderef] [usertype] __user *custom_data
>> drivers/input/misc/cs40l50-vibra.c:239:45: sparse: sparse: dereference of noderef expression
   drivers/input/misc/cs40l50-vibra.c: note: in included file (through include/linux/input.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +245 drivers/input/misc/cs40l50-vibra.c

   216	
   217	static int vibra_upload_owt(struct vibra_work *work_data, struct vibra_effect *effect)
   218	{
   219		struct ff_periodic_effect add_effect = work_data->effect->u.periodic;
   220		u32 len = 2 * add_effect.custom_len, wt_offset, wt_size;
   221		struct vibra_info *info = work_data->info;
   222		struct owt_header header;
   223		u8 *out_data;
   224		int error;
   225	
   226		error = regmap_read(info->regmap, info->dsp.owt_size_reg, &wt_size);
   227		if (error)
   228			return error;
   229	
   230		if ((wt_size * sizeof(u32)) < sizeof(header) + len) {
   231			dev_err(info->dev, "No space in OWT bank for effect\n");
   232			return -ENOSPC;
   233		}
   234	
   235		out_data = kzalloc(sizeof(header) + len, GFP_KERNEL);
   236		if (!out_data)
   237			return -ENOMEM;
   238	
 > 239		header.type = add_effect.custom_data[0] == CS40L50_PCM_ID ? CS40L50_TYPE_PCM :
   240									    CS40L50_TYPE_PWLE;
   241		header.offset = sizeof(header) / sizeof(u32);
   242		header.data_words = len / sizeof(u32);
   243	
   244		memcpy(out_data, &header, sizeof(header));
 > 245		memcpy(out_data + sizeof(header), add_effect.custom_data, len);
   246	
   247		error = regmap_read(info->regmap, info->dsp.owt_offset_reg, &wt_offset);
   248		if (error)
   249			return error;
   250	
   251		error = regmap_bulk_write(info->regmap, info->dsp.owt_base_reg +
   252					  (wt_offset * sizeof(u32)), out_data,
   253					  sizeof(header) + len);
   254		if (error)
   255			goto err_free;
   256	
   257		error = info->dsp.write(info->dev, info->regmap, info->dsp.push_owt_cmd);
   258	err_free:
   259		kfree(out_data);
   260	
   261		return error;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

