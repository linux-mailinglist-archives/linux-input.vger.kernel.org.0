Return-Path: <linux-input+bounces-9135-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09252A08A2B
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 09:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A676818857A2
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 08:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F59205E2E;
	Fri, 10 Jan 2025 08:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcBO1uLu"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9F4206F1B
	for <linux-input@vger.kernel.org>; Fri, 10 Jan 2025 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497889; cv=none; b=IaauEypuA9i1EqeqlsHtOBq3Q7PEDlnL7PAzGO3DgHnsTaocddrZtps48txhCQksCVkOH8ekXtS8osfSmdPk/CbXWSg7VUunXJqT/0wYHJ4eArEiCkyE0HbvHV7Mc5i01+sisxbFLPEhgD5kUnwJ2ZSk/tKpeTBYKgMC5viEA5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497889; c=relaxed/simple;
	bh=KPK6MLaM35zhiey2xmmBuWdkjZ06WauKuc83OcEcYPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ew3BdynP9eJt5WJr1NFST0uxOc7UO6WwC27A8K5Jn53QwIWgKPK80OfOjfOoSFk05aR4x0J2QPuL/AFqkoGwF2lyts/1abn911vEBeuEntasTnIlNIZNFwFTHQod/mhCpm4l7aMCzF6JCi6a8V9HwXIrEsU1MTaNc3NzcTQpLso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcBO1uLu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736497887; x=1768033887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KPK6MLaM35zhiey2xmmBuWdkjZ06WauKuc83OcEcYPk=;
  b=VcBO1uLuSwnmgunsv8lg6hW6O+ShOv7H2/5On9/sTr2Svsz6NG7Ov1S3
   ADkUjCTBPZ+EL3SiuhyX8FxIm4oEoL4P6MbAKybTJNcAgxVT4qc8Q3j9e
   AyYaiziEqS7yfpQWkzWtWvxJAkAlYi7sgaxcI7nXr6keY+daoEELNdVg8
   AXLWkN1Pi62+nZ6Z1+Ofti47sVU9DVJvhRsgdGcDKiGddJyRdcMsUdIr4
   CRwZWVc4hwSPLi7NKOXwlXoyKaIq+RldsxTDfpwnQFQm1I84Vskg7QAfr
   fJ2zDPK0tzNmgipDyLk3pzRXlA17rcB9bM0l59UDPvIoa7uCU3noPAi8A
   Q==;
X-CSE-ConnectionGUID: jVWNaSTpRWe3aU2xnNrR8A==
X-CSE-MsgGUID: 05hPIVs4QdeH8h+5oladLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59262855"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="59262855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:31:25 -0800
X-CSE-ConnectionGUID: 0f7mvuFSTEy4jDN+o6Z3Jg==
X-CSE-MsgGUID: 04C1Tg6pRSKLf8wJqhfLSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103623514"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 00:31:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWAQL-000IrP-32;
	Fri, 10 Jan 2025 08:31:21 +0000
Date: Fri, 10 Jan 2025 16:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>
Subject: [hid:for-6.14/lenovo 1/1] drivers/hid/hid-lenovo.c:727:73: sparse:
 sparse: incompatible types in conditional expression (different base types):
Message-ID: <202501101635.qJrwAOwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.14/lenovo
head:   84c9d2a968c8276f1ceddaa1526c803263eae2b4
commit: 84c9d2a968c8276f1ceddaa1526c803263eae2b4 [1/1] HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys
config: i386-randconfig-062-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101635.qJrwAOwf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101635.qJrwAOwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101635.qJrwAOwf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-lenovo.c:727:73: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/hid/hid-lenovo.c:727:73: sparse:    void
   drivers/hid/hid-lenovo.c:727:73: sparse:    int
>> drivers/hid/hid-lenovo.c:776:58: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-lenovo.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +727 drivers/hid/hid-lenovo.c

   702	
   703	/* Function to handle Lenovo Thinkpad TAB X12's HID raw inputs for fn keys*/
   704	static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
   705	{
   706		struct hid_input *hidinput;
   707		struct input_dev *input = NULL;
   708	
   709		/* Iterate through all associated input devices */
   710		list_for_each_entry(hidinput, &hdev->inputs, list) {
   711			input = hidinput->input;
   712			if (!input)
   713				continue;
   714	
   715			switch (raw_data) {
   716				/* fn-F20 being used here for MIC mute*/
   717			case TP_X12_RAW_HOTKEY_FN_F4:
   718				report_key_event(input, LENOVO_KEY_MICMUTE);
   719				return 1;
   720			/* Power-mode or Airplane mode will be called based on the device*/
   721			case TP_X12_RAW_HOTKEY_FN_F8:
   722				/*
   723				 * TP X12 TAB uses Fn-F8 calls Airplanemode
   724				 * Whereas TP X12 TAB2 uses Fn-F8 for toggling
   725				 * Power modes
   726				 */
 > 727				(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
   728					report_key_event(input, KEY_RFKILL) :
   729					platform_profile_cycle();
   730				return 1;
   731			case TP_X12_RAW_HOTKEY_FN_F10:
   732				/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
   733				(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
   734				report_key_event(input, KEY_PICKUP_PHONE) :
   735				report_key_event(input, KEY_SELECTIVE_SCREENSHOT);
   736				return 1;
   737			case TP_X12_RAW_HOTKEY_FN_F12:
   738				/* BookMarks/STAR key*/
   739				report_key_event(input, KEY_BOOKMARKS);
   740				return 1;
   741			case TP_X12_RAW_HOTKEY_FN_SPACE:
   742				/* Keyboard LED backlight toggle*/
   743				report_key_event(input, KEY_KBDILLUMTOGGLE);
   744				return 1;
   745			default:
   746				break;
   747			}
   748		}
   749		return 0;
   750	}
   751	
   752	static int lenovo_raw_event(struct hid_device *hdev,
   753				struct hid_report *report, u8 *data, int size)
   754	{
   755		/*
   756		 * Compact USB keyboard's Fn-F12 report holds down many other keys, and
   757		 * its own key is outside the usage page range. Remove extra
   758		 * keypresses and remap to inside usage page.
   759		 */
   760		if (unlikely(hdev->product == USB_DEVICE_ID_LENOVO_CUSBKBD
   761				&& size == 3
   762				&& data[0] == 0x15
   763				&& data[1] == 0x94
   764				&& data[2] == 0x01)) {
   765			data[1] = 0x00;
   766			data[2] = 0x01;
   767		}
   768	
   769		/*
   770		 * Lenovo TP X12 Tab KBD's Fn+XX is HID raw data defined. Report ID is 0x03
   771		 * e.g.: Raw data received for MIC mute is 0x00020003.
   772		 */
   773		if (unlikely((hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB
   774				|| hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2)
   775				&& size >= 3 && report->id == 0x03))
 > 776			return lenovo_raw_event_TP_X12_tab(hdev, le32_to_cpu(*(u32 *)data));
   777	
   778		return 0;
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

