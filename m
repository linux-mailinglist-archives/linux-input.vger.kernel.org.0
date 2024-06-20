Return-Path: <linux-input+bounces-4484-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2B90FC9C
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 08:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B3B8B21BEE
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 06:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB5B1946F;
	Thu, 20 Jun 2024 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEqA1U1h"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1401F17736
	for <linux-input@vger.kernel.org>; Thu, 20 Jun 2024 06:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718864319; cv=none; b=uQ2HEkkBSJ+ZQtci72Z3raVZUq1jfvCPZgUfL8hvL3ODVEAlEcbRDyWaBw3kFKBJyuHUrdLIrpNitXloKj8s+P8q920nXUM1moBay1rkCz28qg0iiTLBoOEi4lc+7IxFanZyLpkYqC/DEFHN0dBUopYWAhiCcEssxPD7oInr7Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718864319; c=relaxed/simple;
	bh=yfqVUN8sg32yr2yCpZpkroOFWCo56dRtfu0lzYaaTGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Le70o31zA8axNoMDAKmShFg3mKldNOa82mzN8HnWnxfUPYJxdsvP3BUVwoVa36qhfvgBeQpKK6c6eui8Zl872vQzU7eYipTlMbwpSr22cnJee2nE5LuDFt7ii6Yry7sZJavEJ1uWKu+Dz7P6Auac+dVvvHY3KIxNqvgCaLD3+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEqA1U1h; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718864318; x=1750400318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yfqVUN8sg32yr2yCpZpkroOFWCo56dRtfu0lzYaaTGQ=;
  b=dEqA1U1hHKHgDpQizS9q53Z+0jcvxm31s2giNBzRiePcdZqbwmb1/as6
   Qa/ST5NUBAbG+reV2SaQPnn/cLd1NqChWmzqLbSvlU3iu0LGwietOjiff
   SjOLw86Pm0XT9C5Y20fEAAfzZO1kcrftmcgKksavoQ7OOPwtf2K4ok73Q
   VfSOuKycUMMz8Q/WkMK628GtDbMpOcUGkMhmM/WkpOsK6GI7xfPV32Cw6
   JEx5LxuabL44ccmVGDtrZzN89AOQOmdDIJYtYhgal1wRQuS8QNVKk0JkQ
   6yMRzcVl0ZrdEV8/qkcOo8Sz5Qsv2BhLTOVqALgNJLvCz6s203ufHkglT
   g==;
X-CSE-ConnectionGUID: KeYuo7jgTwiR3NBiqwjgfg==
X-CSE-MsgGUID: QOq8HNYeTbmHnA6VLJp5ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="41225657"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="41225657"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 23:18:37 -0700
X-CSE-ConnectionGUID: oHk5aynXQq+May8+xoV1Xg==
X-CSE-MsgGUID: bye25CQMRyKFxSDVSdT7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42249609"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jun 2024 23:18:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKB7x-0007NS-1j;
	Thu, 20 Jun 2024 06:18:33 +0000
Date: Thu, 20 Jun 2024 14:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: [hid:for-next 1/2] include/linux/platform_data/x86/asus-wmi.h:205:2:
 warning: suggest braces around initialization of subobject
Message-ID: <202406201404.NGl8SOi4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   fa9057ccb9c323816e0f2599a2d91f5c856b0004
commit: bda38f9a41d89b47dce54932f88d0e0edee00cae [1/2] HID: asus: use hid for brightness control on keyboard
config: i386-buildonly-randconfig-006-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201404.NGl8SOi4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201404.NGl8SOi4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201404.NGl8SOi4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/hid-asus.c:29:
>> include/linux/platform_data/x86/asus-wmi.h:205:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     205 |         NULL,
         |         ^~~~
         |         {   }
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   1 warning generated.


vim +205 include/linux/platform_data/x86/asus-wmi.h

   173	
   174	static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
   175		{
   176			.matches = {
   177				DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
   178			},
   179		},
   180		{
   181			.matches = {
   182				DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
   183			},
   184		},
   185		{
   186			.matches = {
   187				DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
   188			},
   189		},
   190		{
   191			.matches = {
   192				DMI_MATCH(DMI_BOARD_NAME, "GA403"),
   193			},
   194		},
   195		{
   196			.matches = {
   197				DMI_MATCH(DMI_BOARD_NAME, "GU605"),
   198			},
   199		},
   200		{
   201			.matches = {
   202				DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
   203			},
   204		},
 > 205		NULL,
   206	};
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

