Return-Path: <linux-input+bounces-7092-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C58969913F3
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 04:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F4FD1F23CCC
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 02:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4732A1BF24;
	Sat,  5 Oct 2024 02:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFk3KEMa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD717C8D;
	Sat,  5 Oct 2024 02:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728095756; cv=none; b=EdJBomo4vGdjWlov3nfb75xrGGeiQjAChHnnkfsJONUPLvf5y5OG7F4+vREZGFQRUhakB1SpgiPI2n5vG+jeoLTjG1FYvLQnP7qOt4WPWN4m22lVvUXrBJoZ0s0PnBpys0mY5bAe1ud1L2FFWzbNngY+9ttUnCSN/ZDy1gtI1RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728095756; c=relaxed/simple;
	bh=fOC17weWTvg5lwzCACVLok5FrFDPVxaeyfRvMEwGQaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/RpTBOsTyxjnkQcpoznvR4vIiOyxQcHA+uluZAQfLgVHMLxa7LfbiB/MWzaYzKBmIyQSc9sXs4B+HB2Du2HWqVw82yxqbTsFrDYFASAActlz4joTkpzFV9b4PLMZVBAHDGNxNEKVuzLSX4eOtrew2DoGhYmVVsnPmTNnob6dAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFk3KEMa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728095754; x=1759631754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fOC17weWTvg5lwzCACVLok5FrFDPVxaeyfRvMEwGQaQ=;
  b=nFk3KEMaLS2wXBlYFAwIg9gfxbXGtYL5ILYsa5g1nOYuLWAWf26XOx3B
   Q7al9hrGKukTyp0/A4cid6Dr9EyheWnw3/e96s2yArja0qgusqe3sDXwP
   yskuOpPpr26ARtEJunrY3aI/npS1Tp293pi3Mcv/FjoVGNRgW7OsrAyHT
   DnDEknkn5rpTujVVe4QXwQBfk40Xbi7V+JMHQRZoJVQ5nHvgs64lo402p
   l6WN5UNk3BINSm96Z+Yi6eZYaTgyOMRlLGfG68oIliNvID9pSPYXQQAna
   E1C1ZFr/9vcy6TkVrtRuILIbd89A23N0C8upU+F4zEPZSVF6gnghB+sRD
   w==;
X-CSE-ConnectionGUID: w4DmOEB9Ql+Q0NsJ5be3Kg==
X-CSE-MsgGUID: o1AdR2gVQbG5RoL60d459g==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="49856027"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="49856027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 19:35:54 -0700
X-CSE-ConnectionGUID: Z6MnY5C7S7G+KzYaUKNLUw==
X-CSE-MsgGUID: EHSlbS/gRiyRSI8NNt2E4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="105733644"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2024 19:35:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swue5-0002TM-1N;
	Sat, 05 Oct 2024 02:35:49 +0000
Date: Sat, 5 Oct 2024 10:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com, Vishnu Sankar <vishnuocv@gmail.com>
Subject: Re: [PATCH] hid-lenovo: Support for TP-X12-TAB-1/2 Kbd Fn keys that
 use HID raw events.
Message-ID: <202410051041.FZvxgBII-lkp@intel.com>
References: <20241003095124.7611-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003095124.7611-1-vishnuocv@gmail.com>

Hi Vishnu,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishnu-Sankar/hid-lenovo-Support-for-TP-X12-TAB-1-2-Kbd-Fn-keys-that-use-HID-raw-events/20241003-175338
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20241003095124.7611-1-vishnuocv%40gmail.com
patch subject: [PATCH] hid-lenovo: Support for TP-X12-TAB-1/2 Kbd Fn keys that use HID raw events.
config: x86_64-randconfig-r133-20241004 (https://download.01.org/0day-ci/archive/20241005/202410051041.FZvxgBII-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051041.FZvxgBII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051041.FZvxgBII-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `lenovo_raw_event_TP_X12_tab':
>> drivers/hid/hid-lenovo.c:729: undefined reference to `platform_profile_cycle'


vim +729 drivers/hid/hid-lenovo.c

   701	
   702	/* Function to handle Lenovo Thinkpad TAB X12's HID raw inputs for fn keys*/
   703	static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
   704	{
   705		struct hid_input *hidinput;
   706		struct input_dev *input = NULL;
   707	
   708		/* Iterate through the associated inputs to find the correct input device */
   709		list_for_each_entry(hidinput, &hdev->inputs, list) {
   710			input = hidinput->input;
   711			if (input)
   712				break;  /* Use the first valid input device */
   713		}
   714	
   715		switch (raw_data) {
   716			/* fn-F20 being used here for MIC mute*/
   717		case TP_X12_RAW_HOTKEY_FN_F4:
   718			report_key_event(input, LENOVO_KEY_MICMUTE);
   719			return 1;
   720			/* Power-mode or Airplane mode will be called based on the device*/
   721		case TP_X12_RAW_HOTKEY_FN_F8:
   722			/*
   723			 * TP X12 TAB uses Fn-F8 calls Airplanemode
   724			 * Whereas TP X12 TAB2 uses Fn-F8 for toggling
   725			 * Power modes
   726			 */
   727			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
   728				report_key_event(input, KEY_RFKILL) :
 > 729				platform_profile_cycle();
   730			return 1;
   731		case TP_X12_RAW_HOTKEY_FN_F10:
   732			/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
   733			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
   734			report_key_event(input, KEY_PICKUP_PHONE) :
   735			report_key_event(input, KEY_SELECTIVE_SCREENSHOT);
   736			return 1;
   737		case TP_X12_RAW_HOTKEY_FN_F12:
   738			/* BookMarks/STAR key*/
   739			report_key_event(input, KEY_BOOKMARKS);
   740			return 1;
   741		case TP_X12_RAW_HOTKEY_FN_SPACE:
   742			/* Keyboard LED backlight toggle*/
   743			report_key_event(input, KEY_KBDILLUMTOGGLE);
   744			return 1;
   745		case TP_X12_RAW_HOTKEY_FN_F7:
   746			/* DISPLAY switching when connecting to external monitors*/
   747			report_key_event(input, KEY_SWITCHVIDEOMODE);
   748			return 1;
   749		default:
   750			break;
   751		}
   752		return 0;
   753	}
   754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

