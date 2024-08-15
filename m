Return-Path: <linux-input+bounces-5584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3296952879
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 06:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 048531C2159D
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 04:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7EB383A2;
	Thu, 15 Aug 2024 04:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMWn9ihN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F592576F;
	Thu, 15 Aug 2024 04:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723695598; cv=none; b=ZAcSY+K/ZT8HqiYN0zU43WRWJ0d6UNiZvtriO0s/LC9no3rUhi5nCzwSYd319UjWGJJUzJrkZCtDSmEcWbCSjyNYt9NbN8kajNtBXkBZFcCPEEgGKpM0YSHa3VUEjSLELXxMzfquHNTMwqkp1Sc9Xb8c86uCzqlUfsCD4+xHax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723695598; c=relaxed/simple;
	bh=5rXTI59siKti7cV1QIU5PVsMkBlNbZYpYR6E11v0kR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhgZB9rBo8HBjVUoW6SIsQLu/owHikZFeIqCJm4xolciZKF54W7uQpko3o+z/Qlt2Yt+Jf2sGn+cb3XQlooJYEt5syyXZ5RWh0v2Z41Yq9IMy10NL6qEWUQgRxrFu5EVUTwz+bEUikPg1Z/WM6rzMSQ5UGn+zAOyZjQwyjazocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMWn9ihN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723695597; x=1755231597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rXTI59siKti7cV1QIU5PVsMkBlNbZYpYR6E11v0kR4=;
  b=gMWn9ihNQkot/X4C6c06RvxOQXcd2EEO4XgjmOfvXcq2HAMX52mqtaFO
   ZEtwKAKWAwXyrM7jYczjMsTmXLk237SS3NlKHRQfiegXTPqjjQJoTGAfo
   2bdZolL1LC9XY8RSllZFK4mOwMJ96R85G1Cn6C9rU3x8+0c7+AO2+hJ28
   J1NU9LaLet6pORdhg9G7ZkH1q3iw8zuOYiGmSS4Pzz342vgivVkNNnhaX
   1NEvQJ8f3Pm0jP4nwDaTaJIMP48emVSryA+kWbNrfQMcIc/UWcF3jsQX3
   QUb38taNVQ+Oc6fxCSILa/jAzfudg4OzNyoITp8PGxOW9YX1PLsFPmj2Q
   Q==;
X-CSE-ConnectionGUID: hTejts8tTRyTahbsMHsAYg==
X-CSE-MsgGUID: fdjrWD3IRcaxprFFMdt8Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="24845877"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="24845877"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 21:19:56 -0700
X-CSE-ConnectionGUID: xS8szqD1R4+q2CrbshO9Og==
X-CSE-MsgGUID: grFZXQ5eTlGUsVs0fkp7jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="59525436"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Aug 2024 21:19:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seRxo-0003BM-1x;
	Thu, 15 Aug 2024 04:19:52 +0000
Date: Thu, 15 Aug 2024 12:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: corsair-void: Add Corsair Void headset family driver
Message-ID: <202408151231.kUWzsw88-lkp@intel.com>
References: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com>

Hi Stuart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.11-rc3 next-20240814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stuart-Hayhurst/HID-corsair-void-Add-Corsair-Void-headset-family-driver/20240815-004208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240813153819.840275-3-stuart.a.hayhurst%40gmail.com
patch subject: [PATCH] HID: corsair-void: Add Corsair Void headset family driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240815/202408151231.kUWzsw88-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151231.kUWzsw88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151231.kUWzsw88-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-corsair-void.c: In function 'corsair_void_probe':
>> drivers/hid/hid-corsair-void.c:646:36: warning: variable 'psy_cfg' set but not used [-Wunused-but-set-variable]
     646 |         struct power_supply_config psy_cfg;
         |                                    ^~~~~~~


vim +/psy_cfg +646 drivers/hid/hid-corsair-void.c

   640	
   641	static int corsair_void_probe(struct hid_device *hid_dev,
   642				      const struct hid_device_id *hid_id)
   643	{
   644		int ret = 0;
   645		struct corsair_void_drvdata *drvdata;
 > 646		struct power_supply_config psy_cfg;
   647		char *name;
   648		int name_length;
   649	
   650		if (!hid_is_usb(hid_dev))
   651			return -EINVAL;
   652	
   653		drvdata = devm_kzalloc(&hid_dev->dev, sizeof(struct corsair_void_drvdata),
   654				       GFP_KERNEL);
   655		if (!drvdata)
   656			return -ENOMEM;
   657	
   658		hid_set_drvdata(hid_dev, drvdata);
   659		psy_cfg.drv_data = drvdata;
   660		dev_set_drvdata(&hid_dev->dev, drvdata);
   661	
   662		drvdata->dev = &hid_dev->dev;
   663		drvdata->hid_dev = hid_dev;
   664		drvdata->is_wired = hid_id->driver_data == CORSAIR_VOID_WIRED;
   665	
   666		drvdata->sidetone_max = CORSAIR_VOID_SIDETONE_MAX_WIRELESS;
   667		if (drvdata->is_wired)
   668			drvdata->sidetone_max = CORSAIR_VOID_SIDETONE_MAX_WIRED;
   669	
   670		/* Set initial values for no wireless headset attached */
   671		/* If a headset is attached, it'll be prompted later */
   672		corsair_void_set_unknown_wireless_data(drvdata);
   673		corsair_void_set_unknown_batt(drvdata);
   674	
   675		/* Receiver version won't be reset after init */
   676		/* Headset version already set via set_unknown_wireless_data */
   677		drvdata->fw_receiver_major = 0;
   678		drvdata->fw_receiver_minor = 0;
   679	
   680		ret = hid_parse(hid_dev);
   681		if (ret) {
   682			hid_err(hid_dev, "parse failed (reason: %d)\n", ret);
   683			return ret;
   684		}
   685	
   686		name_length = snprintf(NULL, 0, "corsair-void-%d-battery", hid_dev->id);
   687		name = devm_kzalloc(drvdata->dev, name_length + 1, GFP_KERNEL);
   688		if (!name)
   689			return -ENOMEM;
   690		snprintf(name, name_length + 1, "corsair-void-%d-battery", hid_dev->id);
   691	
   692		drvdata->battery_desc.name = name;
   693		drvdata->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
   694		drvdata->battery_desc.properties = corsair_void_battery_props;
   695		drvdata->battery_desc.num_properties = ARRAY_SIZE(corsair_void_battery_props);
   696		drvdata->battery_desc.get_property = corsair_void_battery_get_property;
   697	
   698		drvdata->battery = NULL;
   699		INIT_WORK(&drvdata->battery_remove_work,
   700			  corsair_void_battery_remove_work_handler);
   701		INIT_WORK(&drvdata->battery_add_work,
   702			  corsair_void_battery_add_work_handler);
   703		ret = devm_mutex_init(drvdata->dev, &drvdata->battery_mutex);
   704		if (ret)
   705			return ret;
   706	
   707		ret = sysfs_create_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
   708		if (ret)
   709			return ret;
   710	
   711		ret = hid_hw_start(hid_dev, HID_CONNECT_DEFAULT);
   712		if (ret) {
   713			hid_err(hid_dev, "hid_hw_start failed (reason: %d)\n", ret);
   714			goto failed_after_sysfs;
   715		}
   716	
   717		/* Any failures after here should go to failed_after_hid_start */
   718	
   719		/* Refresh battery data, in case wireless headset is already connected */
   720		INIT_DELAYED_WORK(&drvdata->delayed_status_work,
   721				  corsair_void_status_work_handler);
   722		schedule_delayed_work(&drvdata->delayed_status_work,
   723				      msecs_to_jiffies(100));
   724	
   725		/* Refresh firmware versions */
   726		INIT_DELAYED_WORK(&drvdata->delayed_firmware_work,
   727				  corsair_void_firmware_work_handler);
   728		schedule_delayed_work(&drvdata->delayed_firmware_work,
   729				      msecs_to_jiffies(100));
   730	
   731		goto success;
   732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

