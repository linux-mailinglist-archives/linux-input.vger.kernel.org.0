Return-Path: <linux-input+bounces-13539-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334CB058F5
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 13:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDAEA179E2F
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 11:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F902D9783;
	Tue, 15 Jul 2025 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0ixwoYa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674A92D6401;
	Tue, 15 Jul 2025 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579366; cv=none; b=O9qnNmWGJm/lzX3T+STWGVerOo1zQCiZzOx3+d3ixXlf9/wyn97zqjdphTYRCzkVpX8Bwqxm4dZzGKBu+u/65caxH/RKdJHHlBdC+finHInjb8sRYZU9YxqTA+dlT37o5DlNcq7vjU4DuuurE5drjxwbx2dIAiIpLuLx3wcScdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579366; c=relaxed/simple;
	bh=n3+8jPGXx9X89AAiNO3h7+WiVtND0rGd3wOyQ93Uc1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LN51DFLlrwJnhGFsFYqCj3H76GSr9DwQqMksWevUDJgxKPlMElYRjodmtZOfkdSHmHcYuxl5ybo31QOfd3Irpac0RMmXRINGWVbYhflG1nvqq1OysC/XZKMPHTYoxeyXSSC5R49FEG3IOy8DTMHu77ASwd/NeTo6gkEo2I7A27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0ixwoYa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752579364; x=1784115364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n3+8jPGXx9X89AAiNO3h7+WiVtND0rGd3wOyQ93Uc1g=;
  b=K0ixwoYaRuT6bxreH/6w6nkEINdqbbLQo7gQU3bXT2pm9mMB9zwcZeEv
   oY9FV0w2xV+P3LCMmTBaNvB0Tw2tGdVqAe8lGJnPVVeKZ4dZ5cek3YfF1
   IDxxaPES/Wj8pVwRVsuR93fWBeK8sw/5nQDoyMahNA/0NnGlGvai8FFx7
   QmJ9n4Hbvbzp4YJVFXhNHcyNC09fYAP3BONlxTyvhYeyR8woTk9yPQIo9
   Ub7SwfYUjPJQgtjDIpdQA3WGr0q7a5JvXuKnIlyX4zEs+cgCPLVN2U9iu
   LbBBlqL6kwg+OYxpwvHbgzud/+VCayDpjH0NY1F+o6WqhFhUo634GyZxm
   g==;
X-CSE-ConnectionGUID: C1K6eRIuQzGB3uiEk/eBoQ==
X-CSE-MsgGUID: SC/l5Uo/R4WRPbUSLWpSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="42422876"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="42422876"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 04:36:03 -0700
X-CSE-ConnectionGUID: irnYdiHMRh+1301yIAE6hA==
X-CSE-MsgGUID: 9uVKpICBQuSBR9yg6PLlAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="188210056"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2025 04:36:00 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubdwz-000A0l-2i;
	Tue, 15 Jul 2025 11:35:57 +0000
Date: Tue, 15 Jul 2025 19:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Angela Czubak <aczubak@google.com>,
	Sean O'Brien <seobrien@google.com>,
	Jonathan Denose <jdenose@google.com>
Subject: Re: [PATCH 11/11] HID: multitouch: add haptic multitouch support
Message-ID: <202507151942.94dhYylY-lkp@intel.com>
References: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denose/HID-add-haptics-page-defines/20250714-231444
base:   86731a2a651e58953fc949573895f2fa6d456841
patch link:    https://lore.kernel.org/r/20250714-support-forcepads-v1-11-71c7c05748c9%40google.com
patch subject: [PATCH 11/11] HID: multitouch: add haptic multitouch support
config: hexagon-randconfig-r112-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151942.94dhYylY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/hid-haptic.c:13:6: error: redefinition of 'hid_haptic_feature_mapping'
      13 | void hid_haptic_feature_mapping(struct hid_device *hdev,
         |      ^
   drivers/hid/hid-haptic.h:83:6: note: previous definition is here
      83 | void hid_haptic_feature_mapping(struct hid_device *hdev,
         |      ^
>> drivers/hid/hid-haptic.c:51:6: error: redefinition of 'hid_haptic_check_pressure_unit'
      51 | bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
         |      ^
   drivers/hid/hid-haptic.h:89:6: note: previous definition is here
      89 | bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
         |      ^
>> drivers/hid/hid-haptic.c:65:5: error: redefinition of 'hid_haptic_input_mapping'
      65 | int hid_haptic_input_mapping(struct hid_device *hdev,
         |     ^
   drivers/hid/hid-haptic.h:95:5: note: previous definition is here
      95 | int hid_haptic_input_mapping(struct hid_device *hdev,
         |     ^
>> drivers/hid/hid-haptic.c:81:5: error: redefinition of 'hid_haptic_input_configured'
      81 | int hid_haptic_input_configured(struct hid_device *hdev,
         |     ^
   drivers/hid/hid-haptic.h:104:5: note: previous definition is here
     104 | int hid_haptic_input_configured(struct hid_device *hdev,
         |     ^
>> drivers/hid/hid-haptic.c:403:5: error: redefinition of 'hid_haptic_init'
     403 | int hid_haptic_init(struct hid_device *hdev,
         |     ^
   drivers/hid/hid-haptic.h:114:5: note: previous definition is here
     114 | int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr)
         |     ^
>> drivers/hid/hid-haptic.c:569:6: error: redefinition of 'hid_haptic_pressure_reset'
     569 | void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
         |      ^
   drivers/hid/hid-haptic.h:126:6: note: previous definition is here
     126 | void hid_haptic_pressure_reset(struct hid_haptic_device *haptic) {}
         |      ^
>> drivers/hid/hid-haptic.c:575:6: error: redefinition of 'hid_haptic_pressure_increase'
     575 | void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
         |      ^
   drivers/hid/hid-haptic.h:128:6: note: previous definition is here
     128 | void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
         |      ^
   7 errors generated.


vim +/hid_haptic_feature_mapping +13 drivers/hid/hid-haptic.c

783df9659b1cddf Angela Czubak 2025-07-14  12  
783df9659b1cddf Angela Czubak 2025-07-14 @13  void hid_haptic_feature_mapping(struct hid_device *hdev,
783df9659b1cddf Angela Czubak 2025-07-14  14  				struct hid_haptic_device *haptic,
783df9659b1cddf Angela Czubak 2025-07-14  15  				struct hid_field *field, struct hid_usage *usage)
783df9659b1cddf Angela Czubak 2025-07-14  16  {
59b86a929daae04 Angela Czubak 2025-07-14  17  	u16 usage_hid;
59b86a929daae04 Angela Czubak 2025-07-14  18  
783df9659b1cddf Angela Czubak 2025-07-14  19  	if (usage->hid == HID_HP_AUTOTRIGGER) {
783df9659b1cddf Angela Czubak 2025-07-14  20  		if (usage->usage_index >= field->report_count) {
783df9659b1cddf Angela Czubak 2025-07-14  21  			dev_err(&hdev->dev,
783df9659b1cddf Angela Czubak 2025-07-14  22  				"HID_HP_AUTOTRIGGER out of range\n");
783df9659b1cddf Angela Czubak 2025-07-14  23  			return;
783df9659b1cddf Angela Czubak 2025-07-14  24  		}
783df9659b1cddf Angela Czubak 2025-07-14  25  
783df9659b1cddf Angela Czubak 2025-07-14  26  		hid_device_io_start(hdev);
783df9659b1cddf Angela Czubak 2025-07-14  27  		hid_hw_request(hdev, field->report, HID_REQ_GET_REPORT);
783df9659b1cddf Angela Czubak 2025-07-14  28  		hid_hw_wait(hdev);
783df9659b1cddf Angela Czubak 2025-07-14  29  		hid_device_io_stop(hdev);
783df9659b1cddf Angela Czubak 2025-07-14  30  		haptic->default_auto_trigger =
783df9659b1cddf Angela Czubak 2025-07-14  31  			field->value[usage->usage_index];
783df9659b1cddf Angela Czubak 2025-07-14  32  		haptic->auto_trigger_report = field->report;
59b86a929daae04 Angela Czubak 2025-07-14  33  	} else if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ORDINAL) {
59b86a929daae04 Angela Czubak 2025-07-14  34  		usage_hid = usage->hid & HID_USAGE;
59b86a929daae04 Angela Czubak 2025-07-14  35  		switch (field->logical) {
59b86a929daae04 Angela Czubak 2025-07-14  36  		case HID_HP_WAVEFORMLIST:
59b86a929daae04 Angela Czubak 2025-07-14  37  			if (usage_hid > haptic->max_waveform_id)
59b86a929daae04 Angela Czubak 2025-07-14  38  				haptic->max_waveform_id = usage_hid;
59b86a929daae04 Angela Czubak 2025-07-14  39  			break;
59b86a929daae04 Angela Czubak 2025-07-14  40  		case HID_HP_DURATIONLIST:
59b86a929daae04 Angela Czubak 2025-07-14  41  			if (usage_hid > haptic->max_duration_id)
59b86a929daae04 Angela Czubak 2025-07-14  42  				haptic->max_duration_id = usage_hid;
59b86a929daae04 Angela Czubak 2025-07-14  43  			break;
59b86a929daae04 Angela Czubak 2025-07-14  44  		default:
59b86a929daae04 Angela Czubak 2025-07-14  45  			break;
59b86a929daae04 Angela Czubak 2025-07-14  46  		}
783df9659b1cddf Angela Czubak 2025-07-14  47  	}
783df9659b1cddf Angela Czubak 2025-07-14  48  }
783df9659b1cddf Angela Czubak 2025-07-14  49  EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
783df9659b1cddf Angela Czubak 2025-07-14  50  
783df9659b1cddf Angela Czubak 2025-07-14 @51  bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
783df9659b1cddf Angela Czubak 2025-07-14  52  				    struct hid_input *hi, struct hid_field *field)
783df9659b1cddf Angela Czubak 2025-07-14  53  {
f96e0cf76b31615 Angela Czubak 2025-07-14  54  	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON) {
f96e0cf76b31615 Angela Czubak 2025-07-14  55  		haptic->force_logical_minimum = field->logical_minimum;
f96e0cf76b31615 Angela Czubak 2025-07-14  56  		haptic->force_physical_minimum = field->physical_minimum;
f96e0cf76b31615 Angela Czubak 2025-07-14  57  		haptic->force_resolution = input_abs_get_res(hi->input,
f96e0cf76b31615 Angela Czubak 2025-07-14  58  							     ABS_MT_PRESSURE);
783df9659b1cddf Angela Czubak 2025-07-14  59  		return true;
f96e0cf76b31615 Angela Czubak 2025-07-14  60  	}
783df9659b1cddf Angela Czubak 2025-07-14  61  	return false;
783df9659b1cddf Angela Czubak 2025-07-14  62  }
783df9659b1cddf Angela Czubak 2025-07-14  63  EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
783df9659b1cddf Angela Czubak 2025-07-14  64  
783df9659b1cddf Angela Czubak 2025-07-14 @65  int hid_haptic_input_mapping(struct hid_device *hdev,
783df9659b1cddf Angela Czubak 2025-07-14  66  			     struct hid_haptic_device *haptic,
783df9659b1cddf Angela Czubak 2025-07-14  67  			     struct hid_input *hi,
783df9659b1cddf Angela Czubak 2025-07-14  68  			     struct hid_field *field, struct hid_usage *usage,
783df9659b1cddf Angela Czubak 2025-07-14  69  			     unsigned long **bit, int *max)
783df9659b1cddf Angela Czubak 2025-07-14  70  {
783df9659b1cddf Angela Czubak 2025-07-14  71  	if (usage->hid == HID_HP_MANUALTRIGGER) {
783df9659b1cddf Angela Czubak 2025-07-14  72  		haptic->manual_trigger_report = field->report;
783df9659b1cddf Angela Czubak 2025-07-14  73  		/* we don't really want to map these fields */
783df9659b1cddf Angela Czubak 2025-07-14  74  		return -1;
783df9659b1cddf Angela Czubak 2025-07-14  75  	}
783df9659b1cddf Angela Czubak 2025-07-14  76  
783df9659b1cddf Angela Czubak 2025-07-14  77  	return 0;
783df9659b1cddf Angela Czubak 2025-07-14  78  }
783df9659b1cddf Angela Czubak 2025-07-14  79  EXPORT_SYMBOL_GPL(hid_haptic_input_mapping);
783df9659b1cddf Angela Czubak 2025-07-14  80  
783df9659b1cddf Angela Czubak 2025-07-14 @81  int hid_haptic_input_configured(struct hid_device *hdev,
783df9659b1cddf Angela Czubak 2025-07-14  82  				struct hid_haptic_device *haptic,
783df9659b1cddf Angela Czubak 2025-07-14  83  				struct hid_input *hi)
783df9659b1cddf Angela Czubak 2025-07-14  84  {
783df9659b1cddf Angela Czubak 2025-07-14  85  
783df9659b1cddf Angela Czubak 2025-07-14  86  	if (hi->application == HID_DG_TOUCHPAD) {
783df9659b1cddf Angela Czubak 2025-07-14  87  		if (haptic->auto_trigger_report &&
783df9659b1cddf Angela Czubak 2025-07-14  88  		    haptic->manual_trigger_report) {
783df9659b1cddf Angela Czubak 2025-07-14  89  			__set_bit(INPUT_PROP_HAPTIC_TOUCHPAD, hi->input->propbit);
783df9659b1cddf Angela Czubak 2025-07-14  90  			return 1;
783df9659b1cddf Angela Czubak 2025-07-14  91  		}
783df9659b1cddf Angela Czubak 2025-07-14  92  		return 0;
783df9659b1cddf Angela Czubak 2025-07-14  93  	}
783df9659b1cddf Angela Czubak 2025-07-14  94  	return -1;
783df9659b1cddf Angela Czubak 2025-07-14  95  }
783df9659b1cddf Angela Czubak 2025-07-14  96  EXPORT_SYMBOL_GPL(hid_haptic_input_configured);
59b86a929daae04 Angela Czubak 2025-07-14  97  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

