Return-Path: <linux-input+bounces-9861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD02A2DA58
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 03:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F14507A2C8B
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 02:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBA024339F;
	Sun,  9 Feb 2025 02:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtlPFvEa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171B2F30
	for <linux-input@vger.kernel.org>; Sun,  9 Feb 2025 02:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739066981; cv=none; b=DxF6WJU4pPAy8TPTosPDr5B4/7f4xIWi/sD2VVYnM8Te4Ho0siOiZLkrnvahjREArVWG1ti09i/JE+oOb1c/n1vioAOkopdjkrZjqSgFxPJAbDnjZTjNHqyEGyK+Has+cqoE4PXbe1tjSWSBOf5Y1EnyRLTOJhxabOBR/eqmPgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739066981; c=relaxed/simple;
	bh=1OkANyzpTfJkErwvvGPyVmH5ZdEE9uQE9+U+dc7EUnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6NyUDu1oI+qwG0x6mtYZ5/oMwxUdg1MH1G47YimRjUaEdUjODWaoEZD8g7Tttgd6rv5TUFlQ7II7CM3wYLbX8hxrkGH3Bnk0spV5rjItUIMtQTjAyHl5YbRS3ROfbnMxcNSzC18ObmlKydguSUX2obtqv3udTmDHKQpxolmhL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtlPFvEa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739066979; x=1770602979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1OkANyzpTfJkErwvvGPyVmH5ZdEE9uQE9+U+dc7EUnY=;
  b=TtlPFvEaZkXi9IFXzn6b7QLfkQ0Qo+fEY3I4okgrmMv9hBGo3tpj/W37
   Cu9WTfa/lMD5vpygTCevKlg/LroHCgYu9ihCfZSDBVfih31wcDg/XvPw3
   i38b+YJWaG4T2+5uVTfifPRazSigTKxlddJIox4GlILc4idqfI/dUsIcs
   J9cv+6IUN1Xv7Et4Ty+bbtCXgepLT/iSMdVCCSdpXxfUbPSRJHfq70s0Q
   HY7iL/fWGG+KZ2QoWUb8RNUGP0COpBuchG42T0EYgrg9EQB9S8QYi9sHZ
   53vYCp2kxpADX3YwUEblGBl20EgFWV6YB7JH7NYQKpTOKh4VhUbi6KWgZ
   A==;
X-CSE-ConnectionGUID: CMJmXwF8ToOHQNF9oCZd+Q==
X-CSE-MsgGUID: cVRFM2LJQ0iqs64Xasnj7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50314413"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="50314413"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 18:09:38 -0800
X-CSE-ConnectionGUID: Hnt063nITeGPT3r6fHq62Q==
X-CSE-MsgGUID: uARxAiAqQLqVbmGXAdCV6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111697658"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 18:09:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgwlK-0010vv-1q;
	Sun, 09 Feb 2025 02:09:34 +0000
Date: Sun, 9 Feb 2025 10:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: [hid:for-6.15/logitech 1/1] ERROR: modpost:
 "led_mc_calc_color_components" [drivers/hid/hid-lg-g15.ko] undefined!
Message-ID: <202502091019.kF3R3Jjc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.15/logitech
head:   a3a064146c507ee5207dcf7223cd7a3d7864e085
commit: a3a064146c507ee5207dcf7223cd7a3d7864e085 [1/1] HID: hid-lg-g15: Use standard multicolor LED API
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250209/202502091019.kF3R3Jjc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091019.kF3R3Jjc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091019.kF3R3Jjc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "led_mc_calc_color_components" [drivers/hid/hid-lg-g15.ko] undefined!
>> ERROR: modpost: "devm_led_classdev_multicolor_register_ext" [drivers/hid/hid-lg-g15.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

