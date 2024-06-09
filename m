Return-Path: <linux-input+bounces-4268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 992BE90140E
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 02:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4352A1F222EC
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 00:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C45A3D;
	Sun,  9 Jun 2024 00:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elQ2KJ+C"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD67FF
	for <linux-input@vger.kernel.org>; Sun,  9 Jun 2024 00:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717892137; cv=none; b=lCrGNtyO9fCY/5T6ZoLArEU4AtcIPn0fNjJOEzSGV3bnw290OFHJB2uszbnOl9s/sZ5g9hqmETQRYw0/guLzxWTCUXr8FGWDwYGJnqiDvlKc1Ifx8Bf+9OFDJfMuNsNubZM4Ensrt7xZvZovcZDN8jQccmjcRTmmRf1P7e2yQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717892137; c=relaxed/simple;
	bh=qA5t+P5HaEdX4WGRYzfkL6WVwlF/BUqS2BiHsV8z/0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B9XPJUVm1VXlL99K8bOHhIEgaGiko0wuwLO6sKXoqfZagstsKAirq/4+u1VMsPHp+wmfdQuMbc5iLebfRuvaLQXquq67NBqKmtiMjn8417mib6yrmhak2YX9aQI6pzieaycI2dAqUtIkQMjUy/ArHOmm9vsRXtIRQoWxdTy0U0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elQ2KJ+C; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717892136; x=1749428136;
  h=date:from:to:cc:subject:message-id;
  bh=qA5t+P5HaEdX4WGRYzfkL6WVwlF/BUqS2BiHsV8z/0k=;
  b=elQ2KJ+CRV0cx/C10vvka0fhGTzFAGgTzEJ1aKUUQr27lj0zU3DaC2fS
   hbC1JMc2BJfoBllr1gdZw6ixBewwcwrUSaCJHQcuuqESVTfl3E5nZrqRi
   8PZpqlrGVmapJiFC81BVqzHai6nWoG1VTrC62xpCEicgvpBW7AbJzlIrU
   knP6C5gRw10EMHvUJyrypEtzv0arUTor9MOF273PowQmz54E43KyvkIJz
   TfkKZRzFk9MXKl6VMUR+BGG3GGKQwkpyfAw+WxXAFLQt5J1VFzPYD68tY
   ddcIs1UbAAI8iStDRDQtrvslELLIy6aP26NT3gLsat+aXS2JtcFlJ/yJs
   w==;
X-CSE-ConnectionGUID: TBNMwXhjSsS/f7Es4yYO5Q==
X-CSE-MsgGUID: 4+E8f6MRSbm7s3l1qW0ReQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="18417897"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="18417897"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 17:15:35 -0700
X-CSE-ConnectionGUID: o86SbRQCRaaCidlS9qx3TA==
X-CSE-MsgGUID: 8RlolfxNRWeiLgcF65Eonw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43115714"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2024 17:15:33 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG6Db-0000fu-1K;
	Sun, 09 Jun 2024 00:15:31 +0000
Date: Sun, 09 Jun 2024 08:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 cee77149ebe9cd971ba238d87aa10e09bd98f1c9
Message-ID: <202406090814.FvF4JyyO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: cee77149ebe9cd971ba238d87aa10e09bd98f1c9  Input: xpad - add support for ASUS ROG RAIKIRI PRO

elapsed time: 1452m

configs tested: 20
configs skipped: 1

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
um                                allnoconfig   clang
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

