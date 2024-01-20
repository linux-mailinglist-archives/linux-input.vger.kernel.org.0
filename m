Return-Path: <linux-input+bounces-1356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B52888333E9
	for <lists+linux-input@lfdr.de>; Sat, 20 Jan 2024 12:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC4F2B21F3E
	for <lists+linux-input@lfdr.de>; Sat, 20 Jan 2024 11:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FF9D304;
	Sat, 20 Jan 2024 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebKUnTXO"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A82D2F0
	for <linux-input@vger.kernel.org>; Sat, 20 Jan 2024 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705751321; cv=none; b=LleVkC51AwPznRpjWMXcgAjxMl2vD3iEq7snPfWmBsnBICkSHfrnZE6SGqMbNWnZjIWfIexV2oNUXKOLWFo65VnmIWXV2krhDKMfEIh6pv7lCZEfHw/8/pLN9n7uACGSgtz8Va0jz2cvAvUmP59DOKOlo00UKKAcQF5vrJVf9WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705751321; c=relaxed/simple;
	bh=6DW+ZV7HgsERwYM9aUWQnD7X/RmOry2a8UUfgROGufk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M+CpFwvSGVvs9P9/PLV7RiNgjFFSNzc0gHLJzfgSiI/+p8UL4twFbQxMQzUFqHVFW6tCAEKcUIAa0esfQU9uniq0+WRJ6ar9vacKju5FnFE9QgYIZ2+TxS2Z0m52pyZJke+infFrhybntCSG72DnMttzD9ghTqE6MNF4QPgoOfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebKUnTXO; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705751319; x=1737287319;
  h=date:from:to:cc:subject:message-id;
  bh=6DW+ZV7HgsERwYM9aUWQnD7X/RmOry2a8UUfgROGufk=;
  b=ebKUnTXOT+qOCEcl9xf4GMh/jnoSfo7cVllOEz537dDbpgBbJjfRqNlT
   Wmqh7qx24XsZ9RgEKA+ARi2fdt1O7fUOLNbIP9IkBt+5v8VRvhYwRrasU
   wzhV3HR/5hwAeVj8I/c+mVl6wZqsvrCzV/B6MTWWbOSn6/BSP8VMMl75O
   pyjkxGNly+XlEoHqGPcTvft+z4mX1fu/r+ubTeJNlXR+rEfw2gsWQJQhk
   3F9Ek7n0TGZibF1wllglRInRHuBvV1YmMTQL5RK94JphmzJr4+UkwgVyN
   lUTguZeShLPl5OxXA8ayCmk3fdoHjJOqgnvffVCCAUCHSy9Ral4fZdEcw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="432108452"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="432108452"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 03:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="928603446"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="928603446"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2024 03:48:37 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR9pz-00053W-1j;
	Sat, 20 Jan 2024 11:48:35 +0000
Date: Sat, 20 Jan 2024 19:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 180a8f12c21f41740fee09ca7f7aa98ff5bb99f8
Message-ID: <202401201906.t5WQqKzM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 180a8f12c21f41740fee09ca7f7aa98ff5bb99f8  Input: goodix - accept ACPI resources with gpio_count == 3 && gpio_int_idx == 0

elapsed time: 1580m

configs tested: 85
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240120   gcc  
arc                   randconfig-002-20240120   gcc  
arm                   randconfig-001-20240120   clang
arm                   randconfig-002-20240120   clang
arm                   randconfig-003-20240120   clang
arm                   randconfig-004-20240120   clang
arm64                 randconfig-001-20240120   clang
arm64                 randconfig-002-20240120   clang
arm64                 randconfig-003-20240120   clang
arm64                 randconfig-004-20240120   clang
csky                  randconfig-001-20240120   gcc  
csky                  randconfig-002-20240120   gcc  
hexagon               randconfig-001-20240120   clang
hexagon               randconfig-002-20240120   clang
i386         buildonly-randconfig-001-20240119   gcc  
i386         buildonly-randconfig-002-20240119   gcc  
i386         buildonly-randconfig-003-20240119   gcc  
i386         buildonly-randconfig-004-20240119   gcc  
i386         buildonly-randconfig-005-20240119   gcc  
i386         buildonly-randconfig-006-20240119   gcc  
i386                  randconfig-001-20240119   gcc  
i386                  randconfig-002-20240119   gcc  
i386                  randconfig-003-20240119   gcc  
i386                  randconfig-004-20240119   gcc  
i386                  randconfig-005-20240119   gcc  
i386                  randconfig-006-20240119   gcc  
i386                  randconfig-011-20240119   clang
i386                  randconfig-012-20240119   clang
i386                  randconfig-013-20240119   clang
i386                  randconfig-014-20240119   clang
i386                  randconfig-015-20240119   clang
i386                  randconfig-016-20240119   clang
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20240120   gcc  
loongarch             randconfig-002-20240120   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20240120   gcc  
nios2                 randconfig-002-20240120   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240120   gcc  
parisc                randconfig-002-20240120   gcc  
powerpc                          allmodconfig   clang
powerpc               randconfig-001-20240120   clang
powerpc               randconfig-002-20240120   clang
powerpc               randconfig-003-20240120   clang
powerpc64             randconfig-001-20240120   clang
powerpc64             randconfig-002-20240120   clang
powerpc64             randconfig-003-20240120   clang
riscv                 randconfig-001-20240120   clang
riscv                 randconfig-002-20240120   clang
s390                  randconfig-001-20240120   gcc  
s390                  randconfig-002-20240120   gcc  
sh                    randconfig-001-20240120   gcc  
x86_64       buildonly-randconfig-001-20240120   clang
x86_64       buildonly-randconfig-002-20240120   clang
x86_64       buildonly-randconfig-003-20240120   clang
x86_64       buildonly-randconfig-004-20240120   clang
x86_64       buildonly-randconfig-005-20240120   clang
x86_64       buildonly-randconfig-006-20240120   clang
x86_64                randconfig-001-20240120   gcc  
x86_64                randconfig-002-20240120   gcc  
x86_64                randconfig-003-20240120   gcc  
x86_64                randconfig-004-20240120   gcc  
x86_64                randconfig-005-20240120   gcc  
x86_64                randconfig-006-20240120   gcc  
x86_64                randconfig-011-20240120   clang
x86_64                randconfig-012-20240120   clang
x86_64                randconfig-013-20240120   clang
x86_64                randconfig-014-20240120   clang
x86_64                randconfig-015-20240120   clang
x86_64                randconfig-016-20240120   clang
x86_64                randconfig-071-20240120   clang
x86_64                randconfig-072-20240120   clang
x86_64                randconfig-073-20240120   clang
x86_64                randconfig-074-20240120   clang
x86_64                randconfig-075-20240120   clang
x86_64                randconfig-076-20240120   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

