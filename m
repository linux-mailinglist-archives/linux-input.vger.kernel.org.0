Return-Path: <linux-input+bounces-6540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD08978964
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 22:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 265951C22583
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 20:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C155F1527AC;
	Fri, 13 Sep 2024 20:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwMJPFsk"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E040014C5A1
	for <linux-input@vger.kernel.org>; Fri, 13 Sep 2024 20:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726258283; cv=none; b=At0tkn98Uvgr698i6S2QFu4uE8DaR3u/oODCq7MUNjOprnfVElL3VC6KTT5ZYQFLPPk5rlgCFPKTWQd7AeGjKfB+CJbC1bLWkqivvLho24a+GLcl5BN2Um9o/qMOG2JUFQ46GgRiI23i3fYnilIz2PygaTHmcCfog/sf8GlBMXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726258283; c=relaxed/simple;
	bh=37zmhLCtKqG7TKlG85pauOW2o2uGwgvWSTZ7n9jX1ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eEZqkGJheEF8+PNkyiJFJCAvrpLtVYlZm37qxzHj9GoVzNeTkgb8ZICk+UabHn8CG2EsQX+pBWxNBBp0CYgzeEuBylv05H5Ap/CKCY9JKxKLm9AZqu4jWSitZBlJRJMZLc6wBQYUemv2zbIoEFlBvveg8hGoQSvWgsXxnShpK2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwMJPFsk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726258282; x=1757794282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37zmhLCtKqG7TKlG85pauOW2o2uGwgvWSTZ7n9jX1ts=;
  b=lwMJPFskL+7XmqhkpHWrWh1b6YNHe/Hv07X9jxmTuCu5UnAstWGXqnVu
   qiqBatiaoRO1i/+hBJH6F/mZLL+gNuCFIZcq4aDHajNZ7IHRPD2yb9zJb
   BPOtUUExYmrGz57dwWqdIWpJna6c7w3lklz4mW10f9IvCTr5U2YydnQXN
   4o8w3WLj1nGtZn3DuoBiKhblqGhnKvHBxfnWlIJlHzF9B9u2kJ88xK040
   OgQdEKHmSeyhH344+rBOFvjt2r3unsWkIxocqosxIUJ/U2F663PfofqVY
   19uchoR3JVQDIiSoAiPiJH84fN86kcnqTvIaXVnrAnAWpnVuUINKbRm6N
   w==;
X-CSE-ConnectionGUID: FKNVNMfUQbC/QzSIJ7N9pg==
X-CSE-MsgGUID: GxKwJtkLRjyu9NRYKdFVGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24712396"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="24712396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 13:11:22 -0700
X-CSE-ConnectionGUID: UfcwDyL0RaK2m3h3O9E6Pw==
X-CSE-MsgGUID: k0e7l04BR6S8qn7/AQ97qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72774955"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2024 13:11:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spCdR-0006wV-2P;
	Fri, 13 Sep 2024 20:11:17 +0000
Date: Sat, 14 Sep 2024 04:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org,
	Peter Hutterer <peter.hutterer@who-t.net>
Subject: [hid:for-6.12/bpf 6/15] drivers/hid/hid-core.c:2689:52: error:
 passing 'const __u8 *' (aka 'const unsigned char *') to parameter of type
 'u8 *' (aka 'unsigned char *') discards qualifiers
Message-ID: <202409140413.DizXFslQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.12/bpf
head:   d46a60c7a795ef0a115e27235b88dcecc78b8c26
commit: f10a11b7b599467153f679d35ed4712bbbec918f [6/15] HID: bpf: move HID-BPF report descriptor fixup earlier
config: arm-jornada720_defconfig (https://download.01.org/0day-ci/archive/20240914/202409140413.DizXFslQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140413.DizXFslQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140413.DizXFslQ-lkp@intel.com/

Note: the hid/for-6.12/bpf HEAD d46a60c7a795ef0a115e27235b88dcecc78b8c26 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/hid/hid-core.c:21:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hid/hid-core.c:2689:52: error: passing 'const __u8 *' (aka 'const unsigned char *') to parameter of type 'u8 *' (aka 'unsigned char *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    2689 |                 hdev->bpf_rdesc = call_hid_bpf_rdesc_fixup(hdev, hdev->dev_rdesc,
         |                                                                  ^~~~~~~~~~~~~~~
   include/linux/hid_bpf.h:231:73: note: passing argument to parameter 'rdesc' here
     231 | static inline u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, u8 *rdesc,
         |                                                                         ^
   1 warning and 1 error generated.


vim +2689 drivers/hid/hid-core.c

  2681	
  2682	static int __hid_device_probe(struct hid_device *hdev, struct hid_driver *hdrv)
  2683	{
  2684		const struct hid_device_id *id;
  2685		int ret;
  2686	
  2687		if (!hdev->bpf_rsize) {
  2688			hdev->bpf_rsize = hdev->dev_rsize;
> 2689			hdev->bpf_rdesc = call_hid_bpf_rdesc_fixup(hdev, hdev->dev_rdesc,
  2690								   &hdev->bpf_rsize);
  2691		}
  2692	
  2693		if (!hid_check_device_match(hdev, hdrv, &id))
  2694			return -ENODEV;
  2695	
  2696		hdev->devres_group_id = devres_open_group(&hdev->dev, NULL, GFP_KERNEL);
  2697		if (!hdev->devres_group_id)
  2698			return -ENOMEM;
  2699	
  2700		/* reset the quirks that has been previously set */
  2701		hdev->quirks = hid_lookup_quirk(hdev);
  2702		hdev->driver = hdrv;
  2703	
  2704		if (hdrv->probe) {
  2705			ret = hdrv->probe(hdev, id);
  2706		} else { /* default probe */
  2707			ret = hid_open_report(hdev);
  2708			if (!ret)
  2709				ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
  2710		}
  2711	
  2712		/*
  2713		 * Note that we are not closing the devres group opened above so
  2714		 * even resources that were attached to the device after probe is
  2715		 * run are released when hid_device_remove() is executed. This is
  2716		 * needed as some drivers would allocate additional resources,
  2717		 * for example when updating firmware.
  2718		 */
  2719	
  2720		if (ret) {
  2721			devres_release_group(&hdev->dev, hdev->devres_group_id);
  2722			hid_close_report(hdev);
  2723			hdev->driver = NULL;
  2724		}
  2725	
  2726		return ret;
  2727	}
  2728	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

