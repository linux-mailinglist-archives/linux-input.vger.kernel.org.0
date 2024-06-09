Return-Path: <linux-input+bounces-4269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114090140F
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 02:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9014281C68
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 00:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A46B7FF;
	Sun,  9 Jun 2024 00:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfhcGQ5z"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3608317E9
	for <linux-input@vger.kernel.org>; Sun,  9 Jun 2024 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717892196; cv=none; b=ES9EgItU7WcNGRcJUULYq0wqX/2vEO+wIq8TmBHLRNkKuFtR7I5Mo7jlg7KmC3p78TofKvMQxpKagOk2Tt1I09rq+OwHBc7oZcxzT67BKd0KSBe72TSDMSTvtlZBtA/2Vd1J0tu0a9Oz2E8VoYxQSnyGd2W/A8R62UA+6jGBu1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717892196; c=relaxed/simple;
	bh=BVOx3OSYK/w/2iwvYB6ep4BK1COTg1wze2nvRDyKuPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MaV01KiOiVFwMtcsx7LSBl4gHkUvVAP1ZAt2X9OvIC0g0cG6czZl+78xUnVJ8YrYZqeCRrP2S3D1ovEhfVMr5JkSBhx7tj35jpHtE+OIOLZlC80kfTUwO0YI4q9Fl+YI/NsEOL9QHe/U4VicgVMt+ZS5QW68AvxJ9ur88HTKg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfhcGQ5z; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717892195; x=1749428195;
  h=date:from:to:cc:subject:message-id;
  bh=BVOx3OSYK/w/2iwvYB6ep4BK1COTg1wze2nvRDyKuPU=;
  b=MfhcGQ5zz+3WoiKl0rSsCtuqkv6OkKsEqnvf0lemj9PWjyeOvGfPtium
   1TeBIlEiMXhdR/yblLH5cZEgLo8qbRPhS/6ZS+LfCprA4cGnpgK1sbzVk
   XYt/CN4m4MAe1qYSdRKeSEnzOSF6rq1VM5aLJpkUbefuHxzFR91mkqLEm
   ++RH0oukuvm5DQbulClm003bt9iBQVgZ3K1/bDXkzbQ+8upzADzuTrlj8
   RXLGahaNOCurklEzArb8ZwmauOIKESA6jCHD01GHsRc/BeOdVzXwNv+aZ
   jVAnH/4lgEtMiOSXsy8nRHivdbNircfjSjVxTt6K9i/kAe2zLunAE6Ok8
   g==;
X-CSE-ConnectionGUID: GtNJHuQoSw66VN2Uik92gQ==
X-CSE-MsgGUID: kXoWf4xZTvKo9YAzzwevbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="18417939"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="18417939"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 17:16:34 -0700
X-CSE-ConnectionGUID: nBLsrTwqQuao146rRDKShQ==
X-CSE-MsgGUID: dzxvFtdvQFuD2n9sedyUkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="38683008"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2024 17:16:33 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG6EZ-0000g8-1h;
	Sun, 09 Jun 2024 00:16:31 +0000
Date: Sun, 09 Jun 2024 08:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 f4c7fa7c058b9893b7a949cdb2f2aa504903f497
Message-ID: <202406090840.kMCIWhyL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: f4c7fa7c058b9893b7a949cdb2f2aa504903f497  Input: cap11xx - stop using chip ID when configuring it

elapsed time: 1671m

configs tested: 21
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

