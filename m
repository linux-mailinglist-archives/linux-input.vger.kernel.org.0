Return-Path: <linux-input+bounces-12811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB12CAD589D
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 16:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77D441892B43
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 14:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FF92BD01E;
	Wed, 11 Jun 2025 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNLZx3x7"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2982126E708;
	Wed, 11 Jun 2025 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651781; cv=none; b=EX9HKaEQP/wIXqz2Yt/HI5IrPFCI442v/xpITL4lVyq9ntKRHO1jndZLEd+r4Xe+DVZ10gscFvWBQD12XomPTAucTbSx2vmSdvT5JvZSPzl/lHxWEu8DE5eQ1PJ+7M1DWvBkgZ3vN3I+73mtM1vD985/OCxqNoe3olHZ/gkyHp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651781; c=relaxed/simple;
	bh=23ZiHQ1YGdQ2GxpBT4mjPpRAra6Bfr4xKOjZt5xAzC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmJ2Pr1ZG/KtvJn3/V9FjMbJ2kBSFFu4ICFO25MLkTuR0+y1vS/ITRK2Sk9eS6iMigxKP7kePXJyFEH5ZNzvL+FUk1+6VIo6N4vGEhM1JD8cnUY93GRoDhPAJeCKpPYCLgkmL0659LhPHn1XmOC7DqNe3Qi8usksD76mhZTetvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNLZx3x7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749651779; x=1781187779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=23ZiHQ1YGdQ2GxpBT4mjPpRAra6Bfr4xKOjZt5xAzC0=;
  b=SNLZx3x7aw8T2J5RuNc7tGitQ1zJU8dECplepvcAh7yL2K7sLdvMabYL
   gEaH7XMyVUX9PSNx9lV/54omd6C7xY19fPhEi7d8xoeORU3cY1hErEBeC
   VfScckft79A7jVuUPEzoSth3ry86qwsEneKonbpkyEvER38YdqfcL+usD
   M+mIp8Tit25D4wCl99CyVvtDM1ED/zjrZ+YxLQ39NWBJ5TNQ88LQDlwR3
   6Z+Vgw9WhonWAwCyMqJki6hjm0E6bADUMDmKbY3VlprmXquBuywNbJa8o
   mbipAbm0xhswY7GSM2GAf8wtex2OOBsz3t38jlMaCGTRvwByYyY6X2Dd1
   Q==;
X-CSE-ConnectionGUID: XsmZbysuQNKG4f5eHScJ1A==
X-CSE-MsgGUID: wa0R2/fvS8utKtXJ2M5sHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63144495"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="63144495"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 07:22:58 -0700
X-CSE-ConnectionGUID: Y6hkqo0IQem+GRa+je0Ncg==
X-CSE-MsgGUID: 9k1LO/yWTva4JNmXQX/Lbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147117140"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jun 2025 07:22:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPMLt-000AYk-0L;
	Wed, 11 Jun 2025 14:22:53 +0000
Date: Wed, 11 Jun 2025 22:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?VG9tw6HFoSBKdcWZZW5h?= <jurenatomas@gmail.com>,
	dmitry.torokhov@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tomas Jurena <jurenatomas@gmail.com>
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation
Message-ID: <202506112236.gn3kTosZ-lkp@intel.com>
References: <20250610154609.1382818-1-jurenatomas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610154609.1382818-1-jurenatomas@gmail.com>

Hi Tomáš,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus linus/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Ju-ena/Input-tca6416-keypad-Add-OF-support-for-driver-instantiation/20250611-094643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250610154609.1382818-1-jurenatomas%40gmail.com
patch subject: [PATCH] Input: tca6416-keypad - Add OF support for driver instantiation
config: arm-randconfig-001-20250611 (https://download.01.org/0day-ci/archive/20250611/202506112236.gn3kTosZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506112236.gn3kTosZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506112236.gn3kTosZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/keyboard/tca6416-keypad.c: In function 'tca6416_parse_properties':
>> drivers/input/keyboard/tca6416-keypad.c:194:12: warning: unused variable 'pin' [-Wunused-variable]
     194 |         u8 pin;
         |            ^~~


vim +/pin +194 drivers/input/keyboard/tca6416-keypad.c

   185	
   186	static struct tca6416_keys_platform_data *
   187	tca6416_parse_properties(struct device *dev, uint8_t io_size)
   188	{
   189		static const char keymap_property[] = "linux,gpio-keymap";
   190		struct tca6416_keys_platform_data *pdata;
   191		u32 keymap[TCA6416_MAX_IO_SIZE];
   192		struct tca6416_button *buttons;
   193		int ret, i;
 > 194		u8 pin;
   195	
   196		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
   197		if (!pdata)
   198			return NULL;
   199	
   200		ret = device_property_count_u32(dev, keymap_property);
   201		if (ret <= 0)
   202			return NULL;
   203	
   204		pdata->nbuttons = ret;
   205		if (pdata->nbuttons > io_size)
   206			pdata->nbuttons = io_size;
   207	
   208		ret = device_property_read_u32_array(dev, keymap_property, keymap,
   209						     pdata->nbuttons);
   210		if (ret)
   211			return NULL;
   212	
   213		buttons = devm_kcalloc(dev, pdata->nbuttons, sizeof(*buttons),
   214				       GFP_KERNEL);
   215		if (!buttons)
   216			return NULL;
   217	
   218		for (i = 0; i < pdata->nbuttons; i++) {
   219			buttons[i].code = FIELD_GET(CFG_CODE, keymap[i]);
   220			buttons[i].type = FIELD_GET(CFG_TYPE, keymap[i]);
   221			buttons[i].active_low = FIELD_GET(CFG_ACTIVE_LOW, keymap[i]);
   222			/* enable all inputs by default */
   223			pdata->pinmask |= BIT(i);
   224		}
   225	
   226		pdata->buttons = buttons;
   227	
   228		pdata->rep = device_property_read_bool(dev, "autorepeat");
   229		/* we can ignore the result as by default all inputs are enabled */
   230		device_property_read_u16(dev, "pinmask", &pdata->pinmask);
   231		pdata->use_polling = device_property_read_bool(dev, "polling");
   232	
   233		return pdata;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

