Return-Path: <linux-input+bounces-5408-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D66794A4B8
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 11:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDBBF1F2119A
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 09:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72EB1D0DE3;
	Wed,  7 Aug 2024 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACCoSYt6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F671D1F5E;
	Wed,  7 Aug 2024 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723024238; cv=none; b=s47zIwY9TaZnluMea6vEPPDhDcpTtHuKiq0ulN9JdDctWgmgwL+uqgvfhZgVe6oxEji6ivtjnWWl1VVGYpBSbDfjN9Dusnuv4JCzc8AEz68c1R5nwh78n/KkP/BfrisqidD9zaPtLOllhV/7WAHx/TYzQvG0WXRLRT4mpe4pkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723024238; c=relaxed/simple;
	bh=mUjY9ixgfxwjEEIW3FiijfuqlQl0p2VLrfkkATvsJqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5487cXtAr+UcKIfyxvvv9CBMfLr0+tceguVcO8ccKApxLltW/gVyGL8Lfymjlq8+XsyM38X8hrDvVf4o0jN/FVfZ8mtm+xwRQNtuh63PxnL2wdU4iMLpaoer1xWvCn6SYa+WHSm91q/Rot7tBs5bQT/81IWC5bKPkWFEVMQOKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACCoSYt6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723024234; x=1754560234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mUjY9ixgfxwjEEIW3FiijfuqlQl0p2VLrfkkATvsJqo=;
  b=ACCoSYt6w/U8e4ayQ1Pk7KvLlvgZ+/wXr527BjXIJNT+Raul5X2jmAHR
   qs3v3zUGXX/vSfqfGv1/15YNTsWd+HpZtpHBfWLbK4mWtMZ0gJYASEahv
   EQjwg9aKVtBUkD/HXhRqYcBJq0UboDaKXRx0dYJjco0Vz5w+CsDfH41Du
   0Y9ArcxSou+R4GuNoxzANpalei/g4jZnnYh2x3Z1ky4bbWja7uSCzE/Y6
   O3IZAEHnJa9VrRtxh1tVkr/RW5zgeORc6Y/MmcvqIdmrCbL6fayYQe9cm
   oykYOWau0B8QSPEzxMaUPYUtVzvQXDgPtLpkup5YxfrTACpm7lMEkbfGD
   Q==;
X-CSE-ConnectionGUID: rPKunieGRZu/cmwWfD3C3g==
X-CSE-MsgGUID: j9R2+oZPTkeoow8MVXFUUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32486933"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="32486933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 02:50:33 -0700
X-CSE-ConnectionGUID: 3q4OSmWKT5qdhAokF2/pug==
X-CSE-MsgGUID: nu2YmeCkTdSqN4w4aObU2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="56469436"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2024 02:50:32 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbdJN-0005HI-1t;
	Wed, 07 Aug 2024 09:50:29 +0000
Date: Wed, 7 Aug 2024 17:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	bentiss@kernel.org, jikos@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: Re: [PATCH] hid-asus-ally: Add full gamepad support
Message-ID: <202408071743.00IxSKrf-lkp@intel.com>
References: <20240806081212.56860-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806081212.56860-1-luke@ljones.dev>

Hi Luke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on next-20240807]
[cannot apply to linus/master v6.11-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-D-Jones/hid-asus-ally-Add-full-gamepad-support/20240806-170850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240806081212.56860-1-luke%40ljones.dev
patch subject: [PATCH] hid-asus-ally: Add full gamepad support
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240807/202408071743.00IxSKrf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071743.00IxSKrf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071743.00IxSKrf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-asus-ally.c: In function 'ally_x_create':
>> drivers/hid/hid-asus-ally.c:565:17: warning: variable 'max_output_report_size' set but not used [-Wunused-but-set-variable]
     565 |         uint8_t max_output_report_size;
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-asus-ally.c: In function '__gamepad_store_deadzones':
>> drivers/hid/hid-asus-ally.c:1177:13: warning: variable 'cmd' set but not used [-Wunused-but-set-variable]
    1177 |         int cmd, side, is_tr;
         |             ^~~
   In file included from drivers/hid/hid-asus-ally.c:24:
   drivers/hid/hid-asus-ally.c: At top level:
>> drivers/hid/hid-asus-ally.h:321:44: warning: 'btn_mapping_rt_attr_group' defined but not used [-Wunused-const-variable=]
     321 |         ALLY_BTN_ATTRS_GROUP(btn_##_fname, btn_mapping_##_fname)
         |                                            ^~~~~~~~~~~~
   drivers/hid/hid-asus-ally.h:306:45: note: in definition of macro 'ALLY_BTN_ATTRS_GROUP'
     306 |         static const struct attribute_group _fname##_attr_group = {       \
         |                                             ^~~~~~
   drivers/hid/hid-asus-ally.c:895:1: note: in expansion of macro 'ALLY_BTN_MAPPING'
     895 | ALLY_BTN_MAPPING(rt, btn_pair_lt_rt, btn_pair_side_right);
         | ^~~~~~~~~~~~~~~~
>> drivers/hid/hid-asus-ally.h:321:44: warning: 'btn_mapping_lt_attr_group' defined but not used [-Wunused-const-variable=]
     321 |         ALLY_BTN_ATTRS_GROUP(btn_##_fname, btn_mapping_##_fname)
         |                                            ^~~~~~~~~~~~
   drivers/hid/hid-asus-ally.h:306:45: note: in definition of macro 'ALLY_BTN_ATTRS_GROUP'
     306 |         static const struct attribute_group _fname##_attr_group = {       \
         |                                             ^~~~~~
   drivers/hid/hid-asus-ally.c:894:1: note: in expansion of macro 'ALLY_BTN_MAPPING'
     894 | ALLY_BTN_MAPPING(lt, btn_pair_lt_rt, btn_pair_side_left);
         | ^~~~~~~~~~~~~~~~


vim +/max_output_report_size +565 drivers/hid/hid-asus-ally.c

   562	
   563	static struct ally_x_device *ally_x_create(struct hid_device *hdev)
   564	{
 > 565		uint8_t max_output_report_size;
   566		struct ally_x_device *ally_x;
   567		struct ff_report *report;
   568		int ret;
   569	
   570		ally_x = devm_kzalloc(&hdev->dev, sizeof(*ally_x), GFP_KERNEL);
   571		if (!ally_x)
   572			return ERR_PTR(-ENOMEM);
   573	
   574		ally_x->hdev = hdev;
   575		INIT_WORK(&ally_x->output_worker, ally_x_work);
   576		spin_lock_init(&ally_x->lock);
   577		ally_x->output_worker_initialized = true;
   578		ally_x->qam_btns_steam_mode =
   579			true; /* Always default to steam mode, it can be changed by userspace attr */
   580	
   581		max_output_report_size = sizeof(struct ally_x_input_report);
   582		report = devm_kzalloc(&hdev->dev, sizeof(*report), GFP_KERNEL);
   583		if (!report) {
   584			ret = -ENOMEM;
   585			goto free_ally_x;
   586		}
   587	
   588		/* None of these bytes will change for the FF command for now */
   589		report->report_id = 0x0D;
   590		report->ff.enable = 0x0F; /* Enable all by default */
   591		report->ff.pulse_sustain_10ms = 0xFF; /* Duration */
   592		report->ff.pulse_release_10ms = 0x00; /* Start Delay */
   593		report->ff.loop_count = 0xEB; /* Loop Count */
   594		ally_x->ff_packet = report;
   595	
   596		ally_x->input = ally_x_setup_input(hdev);
   597		if (IS_ERR(ally_x->input)) {
   598			ret = PTR_ERR(ally_x->input);
   599			goto free_ff_packet;
   600		}
   601	
   602		if (sysfs_create_file(&hdev->dev.kobj, &dev_attr_ally_x_qam_mode.attr)) {
   603			ret = -ENODEV;
   604			goto unregister_input;
   605		}
   606	
   607		ally_x->update_ff = true;
   608		if (ally_x->output_worker_initialized)
   609			schedule_work(&ally_x->output_worker);
   610	
   611		hid_info(hdev, "Registered Ally X controller using %s\n",
   612			 dev_name(&ally_x->input->dev));
   613		return ally_x;
   614	
   615	unregister_input:
   616		input_unregister_device(ally_x->input);
   617	free_ff_packet:
   618		kfree(ally_x->ff_packet);
   619	free_ally_x:
   620		kfree(ally_x);
   621		return ERR_PTR(ret);
   622	}
   623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

