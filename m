Return-Path: <linux-input+bounces-7569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA5B9A5351
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 11:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C1411C20F58
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 09:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F23084A2B;
	Sun, 20 Oct 2024 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMQmO7xt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F8342AAA
	for <linux-input@vger.kernel.org>; Sun, 20 Oct 2024 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729416694; cv=none; b=eeBMZ2/GTjHwRUOAOpcwge+91c2kv8RKSS0kA9pER+yv7eFlvXyUIFDNPyUX98nzncVetLvhpspUM8Q4fHj2RceCnBf3FTFzhO8c3oWPK1cbap6rbm65ngLWNH6mTHGLwWwrvU8N4Bky5TkJ6kx7lWsxkcxAqrvQ+dV7ENMLVX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729416694; c=relaxed/simple;
	bh=AKJlKnn6c1KTTXytmHFhstDHxpqDQwgZFx79fxivNsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=as46/gTF9ACdAhRPImj5J9kh/uUmvTeBUnAFrlSL+9Jpym0mPQnE1V7WNfRdxQE48tRd6LWaF8Vq4J53rhEuoYMVsUb04WTZJDKEANY4SiJmCqypps1aANtL+k9ddM4ly5xzKHwiODcsIDsSrbv5bP1e4Jb4Q4m/0s2YkBMBlYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMQmO7xt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729416691; x=1760952691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKJlKnn6c1KTTXytmHFhstDHxpqDQwgZFx79fxivNsI=;
  b=WMQmO7xtYIDyqqFnGGx/GLjTnbwaxCwLs/eKRW45TisICFSo39eQi4PR
   iC6d9oB8wkGeoAe05wOQy43xdFwjAcCMFsp+XTzWgAOeV1wp/RfaecxXc
   7ogKQ0eM8jMzxWPfCGQuS22yUIuBFIzGsWueCTir/c0xGD/fuNiYk0rsc
   W06j1G59zg0OuHJgD6tqQi7RkwRfM/oQowr5qG/N+0cAHeDIi9r0/uwoy
   ZW0rwNlr8WFFQR+3QAA/aUr34XYKCelz1kLfB3SVVkUD8pg6AnoFzvJyH
   vzJ1wJz5jdzAqDNs34TY+3YIUAnJO1YsDxEaIxabwBpT7RYiCKy7TVDZQ
   w==;
X-CSE-ConnectionGUID: ShlFFZuDSKSTfvkmlLChSw==
X-CSE-MsgGUID: s9RvjegNS/WhwVcS/bWd0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28694904"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28694904"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 02:31:31 -0700
X-CSE-ConnectionGUID: h+CUrGlYTN68xxj91RI0oQ==
X-CSE-MsgGUID: HQFxA5ALRpSkCTZQl40w2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="83834928"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Oct 2024 02:31:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2SHY-000Q9X-0D;
	Sun, 20 Oct 2024 09:31:28 +0000
Date: Sun, 20 Oct 2024 17:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [dtor-input:next 104/120] drivers/input/serio/serio_raw.c:204:12:
 warning: variable 'written' is uninitialized when used here
Message-ID: <202410201730.ItNhUTIv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   00850d7b542aa4a8240cf977d43dc6d2158e48d7
commit: 5b53a9d40c4f83b44de8da06af9a9c9b3fb14988 [104/120] Input: serio_raw - use guard notation for locks and other resources
config: i386-buildonly-randconfig-002-20241019 (https://download.01.org/0day-ci/archive/20241020/202410201730.ItNhUTIv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201730.ItNhUTIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201730.ItNhUTIv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/serio/serio_raw.c:204:12: warning: variable 'written' is uninitialized when used here [-Wuninitialized]
     204 |                                 return written ?: -EIO;
         |                                        ^~~~~~~
   drivers/input/serio/serio_raw.c:188:13: note: initialize the variable 'written' to silence this warning
     188 |         int written;
         |                    ^
         |                     = 0
   1 warning generated.


vim +/written +204 drivers/input/serio/serio_raw.c

   182	
   183	static ssize_t serio_raw_write(struct file *file, const char __user *buffer,
   184				       size_t count, loff_t *ppos)
   185	{
   186		struct serio_raw_client *client = file->private_data;
   187		struct serio_raw *serio_raw = client->serio_raw;
   188		int written;
   189		unsigned char c;
   190	
   191		scoped_guard(mutex_intr, &serio_raw_mutex) {
   192			if (serio_raw->dead)
   193				return -ENODEV;
   194	
   195			if (count > 32)
   196				count = 32;
   197	
   198			while (count--) {
   199				if (get_user(c, buffer++))
   200					return -EFAULT;
   201	
   202				if (serio_write(serio_raw->serio, c)) {
   203					/* Either signal error or partial write */
 > 204					return written ?: -EIO;
   205				}
   206	
   207				written++;
   208			}
   209	
   210			return written;
   211		}
   212	
   213		return -EINTR;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

