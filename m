Return-Path: <linux-input+bounces-15606-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9785BED6C4
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 19:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7571A34D8A4
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 17:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C1325EFBE;
	Sat, 18 Oct 2025 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWkSlmsv"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0040125FA05
	for <linux-input@vger.kernel.org>; Sat, 18 Oct 2025 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809836; cv=none; b=CpvwAgH6d2vobvX3w0VE7ZSW8K9WEkQtU7+FIASpJA4gAaC/lf4T91LRY8Z2GMeZ77BxskcgNC4oj/tr9TVSHZQHHrw/DZ1UZoTYYbrppRjOHOAZziS/4e6Ycy0K09R3Vq9RYnvqaK3p/WMxBAshwj5FaJwBoNITRKjUA1/Lqjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809836; c=relaxed/simple;
	bh=T9T0aGwGpJFomYrCr761NWwRCsx+l6USp6yiGsw6wtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dyCez83hB72jFgyhTdxVJPVvHri4kbQ9V48+lNLoh++iHp52bmD+orG/e3gONhdurbNgPaRGuF7MORe1P/ERZbTB/8nr4aSKi8QHAErBkevoDnsUfIHOx5r/sb4EG4M6tgE3R4otjIwAs1OWq1lc7qOOqSc+YBziyPNP5ara4aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWkSlmsv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760809835; x=1792345835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T9T0aGwGpJFomYrCr761NWwRCsx+l6USp6yiGsw6wtQ=;
  b=EWkSlmsvOyUgG8s+U8rGyrvKfwMbX8fK8B2dL3xZuG5FSKl7cflcYC4k
   AtUvXkgvnhAjCy6xblVFM2FYmGk8VNugJpw5EDa0uxTei6Z7QZfUFIZoY
   bfXm/vIxGWx3VIzOpAEyOT4S4TK2IGvNPZRWgmtlyUzifYJgFp+NLvW1m
   SCazdOUCj4eCZsbCxcjgz4PozCebAShH4jgyN+UNVbi3RhmXPoGScUk3i
   scpNZco/tOe+Z/YEvfMbBWHK1GRvtO6vSQSR9zREEFcx0YME98DKgOyXG
   z/48Kpgpd0JNKb7D+xWeWLz5rcKa4ZmvKeYUHsy0dsau4vcLW/C8lCS6Y
   g==;
X-CSE-ConnectionGUID: 5oZxAf4dRjuC7deFHvp9Tg==
X-CSE-MsgGUID: vjXAcMSiQca9H5zH+u7BIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80434227"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="80434227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:50:34 -0700
X-CSE-ConnectionGUID: LsH4BTCFQeKO6WsViGmWLQ==
X-CSE-MsgGUID: JYnQOR9XTOiqoIjTI4krOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182180327"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2025 10:50:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAB4Y-0008U9-22;
	Sat, 18 Oct 2025 17:50:30 +0000
Date: Sun, 19 Oct 2025 01:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Lixu <lixu.zhang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: [hid:for-6.19/intel-ish-v2 1/7]
 drivers/hid/intel-ish-hid/ipc/ipc.c:944:36: warning: cast from 'void
 (*)(struct workqueue_struct *)' to 'void (*)(void *)' converts to
 incompatible function type
Message-ID: <202510190103.qTZvfdjj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.19/intel-ish-v2
head:   5677aa6a08c1df8bc1ec71516fe1ced9b7cb545f
commit: 0d30dae38fe01cd1de358c6039a0b1184689fe51 [1/7] HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking
config: x86_64-randconfig-002-20251018 (https://download.01.org/0day-ci/archive/20251019/202510190103.qTZvfdjj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190103.qTZvfdjj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510190103.qTZvfdjj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/intel-ish-hid/ipc/ipc.c:944:36: warning: cast from 'void (*)(struct workqueue_struct *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
     944 |         if (devm_add_action_or_reset(dev, (void (*)(void *))destroy_workqueue,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/devres.h:168:34: note: expanded from macro 'devm_add_action_or_reset'
     168 |         __devm_add_action_or_reset(dev, action, data, #action)
         |                                         ^~~~~~
   1 warning generated.


vim +944 drivers/hid/intel-ish-hid/ipc/ipc.c

   935	
   936	static struct workqueue_struct *devm_ishtp_alloc_workqueue(struct device *dev)
   937	{
   938		struct workqueue_struct *wq;
   939	
   940		wq = alloc_workqueue("ishtp_unbound_%d", WQ_UNBOUND, 0, dev->id);
   941		if (!wq)
   942			return NULL;
   943	
 > 944		if (devm_add_action_or_reset(dev, (void (*)(void *))destroy_workqueue,
   945					     wq))
   946			return NULL;
   947	
   948		return wq;
   949	}
   950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

