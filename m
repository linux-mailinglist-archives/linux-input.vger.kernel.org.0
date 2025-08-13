Return-Path: <linux-input+bounces-13956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CC6B23CFB
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 02:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6A9C18C1D31
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 00:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E16329A1;
	Wed, 13 Aug 2025 00:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7RCyBf9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7821362;
	Wed, 13 Aug 2025 00:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755043962; cv=none; b=ObLX9LZcjZN9zHyw0KI1fT9c+Lt3gIXMS55Cl/WcXcSOx7ZX+v0b5tpISn3OBj0EUMk3cT+4G76XCXAKBjeo9QcM7pg9dhC+iTr45b2cnfspKAn0GuCxtjIaaZ3aD6xFXjHb4eupIldqBA/GUslbloxQdeOO9bSrer6sik/zZ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755043962; c=relaxed/simple;
	bh=1Tr9ngM0B3CoAU05H/kRQA1PIZsGr9P2b7J6IHj7rc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXdBSqo8pzvb99xM6czTq5eDgQYMZedliaaXYTibzfnUT/y3Lj3eLXHFy6eB4kWg/F3Yanox1yXDDjPyB5ZnQuryxXqOOjU6jjAjcWZiztsY33sCBJKBvNklRl/tjNECZgwVbRl12GyV9Kxiwr9W4y7U9Vy1v/cAKqWZSXOajho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7RCyBf9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755043961; x=1786579961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Tr9ngM0B3CoAU05H/kRQA1PIZsGr9P2b7J6IHj7rc8=;
  b=f7RCyBf9u6QX/uH/uZg7aCgw4hAG/BqM7mjsr/dnZ3nJDekXqe1a/T7p
   JgCWl9VmqzV3EXqHhcem5hTYOHQJhr1krl63/Rao5gErmRexfk+VnocQl
   wO6j7E8Lc2ulYyfgCRoyFszhkM6CgC496fXEb4Lla7ePZrbb0AT9VhYP8
   IVTEX+AWFTuIW4pMMgwhVPajwumGbH3YQ1G9ZEzXfZfFjK66yXAAO8qt/
   m2mnFAqAHrU9clZbbS36r5ofsvgK9v9xX0Dc3yrOLSJDYN4MXbhNFnF/S
   wGMN5S0PgIodHfjjPNS5TQfPd1dMWPKXt/jGEO+YOFv/alf1n7LvnawyN
   w==;
X-CSE-ConnectionGUID: Wr3n2FhDTjufqm0hX0H/8w==
X-CSE-MsgGUID: thagp4GeRHuRpB248KPDCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57288127"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57288127"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 17:12:40 -0700
X-CSE-ConnectionGUID: mMDdZx+RSeGMSVytg0aK5w==
X-CSE-MsgGUID: H4Hm9LM5SR64YJLmfQAsgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="167120607"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2025 17:12:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulz60-0009Oq-2W;
	Wed, 13 Aug 2025 00:12:24 +0000
Date: Wed, 13 Aug 2025 08:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Leo L. Schwab" <ewhac@ewhac.org>, Hans de Goede <hansg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
	"Leo L. Schwab" <ewhac@ewhac.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <202508130759.HscxexZX-lkp@intel.com>
References: <20250812065327.515098-2-ewhac@ewhac.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812065327.515098-2-ewhac@ewhac.org>

Hi Leo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-L-Schwab/HID-lg-g15-Add-support-for-Logitech-G13/20250812-151139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20250812065327.515098-2-ewhac%40ewhac.org
patch subject: [PATCH v2] HID: lg-g15 - Add support for Logitech G13.
config: arm-randconfig-004-20250813 (https://download.01.org/0day-ci/archive/20250813/202508130759.HscxexZX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130759.HscxexZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130759.HscxexZX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-lg-g15.c: In function 'lg_g13_event':
>> drivers/hid/hid-lg-g15.c:660:7: warning: unused variable 'hw_brightness_changed' [-Wunused-variable]
     bool hw_brightness_changed;
          ^~~~~~~~~~~~~~~~~~~~~


vim +/hw_brightness_changed +660 drivers/hid/hid-lg-g15.c

   655	
   656	static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
   657	{
   658		struct g13_input_report const * const rep = (struct g13_input_report *) data;
   659		int i, val;
 > 660		bool hw_brightness_changed;
   661	
   662		/*
   663		 * Main macropad and menu keys.
   664		 * Emit key events defined for each bit position.
   665		 */
   666		for (i = 0;  i < ARRAY_SIZE(g13_keys_for_bits);  ++i) {
   667			if (g13_keys_for_bits[i]) {
   668				val = TEST_BIT(rep->keybits, i);
   669				input_report_key(g15->input, g13_keys_for_bits[i], val);
   670			}
   671		}
   672		input_sync(g15->input);
   673	
   674		/*
   675		 * Joystick.
   676		 * Emit button and deflection events.
   677		 */
   678		for (i = 0;  i < ARRAY_SIZE(g13_keys_for_bits_js);  ++i) {
   679			if (g13_keys_for_bits_js[i]) {
   680				val = TEST_BIT(rep->keybits, i + 33);
   681				input_report_key(g15->input_js, g13_keys_for_bits_js[i], val);
   682			}
   683		}
   684		input_report_abs(g15->input_js, ABS_X, rep->joy_x);
   685		input_report_abs(g15->input_js, ABS_Y, rep->joy_y);
   686		input_sync(g15->input_js);
   687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

