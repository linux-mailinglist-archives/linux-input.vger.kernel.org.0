Return-Path: <linux-input+bounces-16067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE2C55B0C
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 05:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 095943AD00E
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 04:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C6C2DFF3F;
	Thu, 13 Nov 2025 04:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhJfyUDG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBA7287516;
	Thu, 13 Nov 2025 04:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009424; cv=none; b=eeIYC37ASiDopI06YdiWU5i2ZAN5tjV4UK0kEE9KX5p6FhQqLwy3rc6fbhsQ87DXe//qK/EjD48cywC1zYpf7hM8kXu2Ldem6zx9VK3+u8WW7YQ2G9wGqaLpgs8J0m83k0j6X6izZoEm9NNWKGCZ+LrvyGX6d60+SZcG8ZNHe+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009424; c=relaxed/simple;
	bh=DyxEJnt7hGfRUHFRxWE3TsxFAEJhCfiQqKSgP3BY8bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PskEXijOhCKiEYMaNAA3L9PfFNbwSEtCsOTtSRSr9gvGR3KL6MjYcRcDc2f6wCUG5t3Quub1/yxs8ATp29gwdHQVzBGc/k+trod8xQj7Se4k9JDEoOIdEaeVfZGrRUybZB2yJizj7KOOsh9iOAQHIOs20oc/nzgDp2rrE6UGoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhJfyUDG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009423; x=1794545423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DyxEJnt7hGfRUHFRxWE3TsxFAEJhCfiQqKSgP3BY8bk=;
  b=LhJfyUDGi8utQtemj+PE84NhF9QD/Bj3b8ZHrKKwcwLwxC8WsZwBzlw8
   czXQbgf5r5LFEZ8hdm/lFd5JjI6DLkSoSSXXTsQl5glHBaOTPy/umZpgY
   vyjQ2IyGVZ4JOaprfVLu3M8rpd3IeMQA61fX9PSg8rnPFAIkKLpsi5iTS
   rtap4SJeBovZkzCUkM2rYO1aqoJ4j5WwtHUwNpZvcNV2LXrg72MFV4vgQ
   7GjQ4/Ub8Ogs0zMFDZnoPP8rVZsi5fXCYlFWvmKqm7xu8kZOh99ZyT3CW
   SvAWgvMQ3UQ7GP9AIzDVkaxjbdqLMH9woefYFR/3trYVrCrCVuW309lIu
   w==;
X-CSE-ConnectionGUID: nHVC7vWdQb6JNk+xjHbrPA==
X-CSE-MsgGUID: lmUzq3JgRcGcW57vzdHgFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68947829"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="68947829"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:50:23 -0800
X-CSE-ConnectionGUID: kEo0kvAcQ46jKs8mQWCSBg==
X-CSE-MsgGUID: 6x+313VITBubqMkzTEnNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="212789108"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2025 20:50:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPHm-0004sn-2S;
	Thu, 13 Nov 2025 04:50:18 +0000
Date: Thu, 13 Nov 2025 12:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Denose <jdenose@google.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Denose <jdenose@google.com>
Subject: Re: [PATCH v2 2/2] HID: multitouch: Toggle touch surface on Elan
 touchpad on lid event
Message-ID: <202511122158.oyGRoKNz-lkp@intel.com>
References: <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denose/Input-Add-lid-switch-notifier/20251112-053559
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251111-lid-switch-notifier-v2-2-789723d78d89%40google.com
patch subject: [PATCH v2 2/2] HID: multitouch: Toggle touch surface on Elan touchpad on lid event
config: parisc-randconfig-002-20251112 (https://download.01.org/0day-ci/archive/20251112/202511122158.oyGRoKNz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511122158.oyGRoKNz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511122158.oyGRoKNz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "register_lid_notifier" [drivers/hid/hid-multitouch.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

