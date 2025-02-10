Return-Path: <linux-input+bounces-9912-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84010A2F2F7
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 17:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93FB41888831
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 16:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446312580C5;
	Mon, 10 Feb 2025 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0sU5D/S"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968812580C6
	for <linux-input@vger.kernel.org>; Mon, 10 Feb 2025 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204205; cv=none; b=P+i7GmfywHToFILSp2u0dkP1roDvvqm8Cw4qnB3+rxp3gI0Ce4TrHJtNYB04TfbIipqd4RZ++VQZq4RGgcOzCOFa61QHqisxE2w0ZH6WUavdLF1vlQX/ck1u7ihRbbpEakqKt2M3GSnPXiY0mFIv1B1E8sDmpieUupOVJfAZql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204205; c=relaxed/simple;
	bh=zEnjjRyLtXS3I4KbKrKTRjAXZce2M5q7xDw4IENALl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMX0HGHITPF41TpvV26ncEBaUR6h79zXsVMy1irRtMT1Z68h6uzZPC6aHE7EScb2GFGwy6cWs0iRXi9aHr4ULnrXv+42pLyKWThqhxSzd2C7/tqpecY7I5a+UZbuUS2B2B+4+/AR1Lape1vms+04cn+cXnSYYAajZtAKhf6eid0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0sU5D/S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739204203; x=1770740203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zEnjjRyLtXS3I4KbKrKTRjAXZce2M5q7xDw4IENALl0=;
  b=n0sU5D/SzxCF7auD89oR2kuanFMum56ERxchv00GsT4dE5mXovh/abnN
   KzDBhQKbQQiUJ+Xslk+gtHRQ25XdBuV3RPLIgL9xnVPX0MAy2JlaZ+q2P
   oHYJAuVa8zBOwehCdN3CmBXXQ18MpELavs96jfQAGMga8VK2vuGXb3COb
   bcX7jczZyU+E2YCHhLAdkMpektg1QItjfhgHLO3xJhJv94FVojUKRlqRe
   4HabljqhRT3Fqtmnjy9Gd9dN+c3wEM8HZU8BphKFxNWNcJ2vrzRnoQjp/
   Cu+CslOQxjHiyp3H2QdXiZRARG0NaevMpPa2E1QU5N+NmpCjtevqEqd61
   w==;
X-CSE-ConnectionGUID: qo1jwAxjRt+kF4Yp659oFQ==
X-CSE-MsgGUID: 18dQNRPgTmKuJ/nD+P0diA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39921280"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39921280"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 08:16:43 -0800
X-CSE-ConnectionGUID: GTENOyTBQWmjnK6wGkzA3g==
X-CSE-MsgGUID: TF7NFCQeQDqVOWaFQaD0Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117161377"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Feb 2025 08:16:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thWSd-00131l-1e;
	Mon, 10 Feb 2025 16:16:39 +0000
Date: Tue, 11 Feb 2025 00:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: [hid:for-6.15/logitech 1/1] drivers/hid/hid-lg-g15.c:241:undefined
 reference to `led_mc_calc_color_components'
Message-ID: <202502110032.VZ0J024X-lkp@intel.com>
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
config: powerpc-ppc6xx_defconfig (https://download.01.org/0day-ci/archive/20250211/202502110032.VZ0J024X-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110032.VZ0J024X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110032.VZ0J024X-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/hid/hid-lg-g15.o: in function `lg_g510_kbd_led_write':
>> drivers/hid/hid-lg-g15.c:241:(.text+0x768): undefined reference to `led_mc_calc_color_components'
   powerpc-linux-ld: drivers/hid/hid-lg-g15.o: in function `lg_g15_register_led':
>> drivers/hid/hid-lg-g15.c:686:(.text+0xa9c): undefined reference to `devm_led_classdev_multicolor_register_ext'


vim +241 drivers/hid/hid-lg-g15.c

   232	
   233	/* Must be called with g15->mutex locked */
   234	static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
   235					 struct lg_g15_led *g15_led,
   236					 enum led_brightness brightness)
   237	{
   238		struct mc_subled *subleds = g15_led->mcdev.subled_info;
   239		int ret;
   240	
 > 241		led_mc_calc_color_components(&g15_led->mcdev, brightness);
   242	
   243		g15->transfer_buf[0] = 5 + g15_led->led;
   244		g15->transfer_buf[1] = subleds[0].brightness;
   245		g15->transfer_buf[2] = subleds[1].brightness;
   246		g15->transfer_buf[3] = subleds[2].brightness;
   247	
   248		ret = hid_hw_raw_request(g15->hdev,
   249					 LG_G510_FEATURE_BACKLIGHT_RGB + g15_led->led,
   250					 g15->transfer_buf, 4,
   251					 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
   252		if (ret == 4) {
   253			/* Success */
   254			g15_led->brightness = brightness;
   255			ret = 0;
   256		} else {
   257			hid_err(g15->hdev, "Error setting LED brightness: %d\n", ret);
   258			ret = (ret < 0) ? ret : -EIO;
   259		}
   260	
   261		return ret;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

