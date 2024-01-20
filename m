Return-Path: <linux-input+bounces-1355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 370DE83335B
	for <lists+linux-input@lfdr.de>; Sat, 20 Jan 2024 10:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8E881C20FB3
	for <lists+linux-input@lfdr.de>; Sat, 20 Jan 2024 09:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586E45382;
	Sat, 20 Jan 2024 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9ttSmCP"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653495381
	for <linux-input@vger.kernel.org>; Sat, 20 Jan 2024 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705743579; cv=none; b=qaveOCNO+yEu3OLMYupnRO3mND9cdcQv6WKjjrz9Fw4KhJRxaes1wUERcBSFlS+TGnYYeQYKoPQjinA7WafoI+l84Co2dCVwPCYjkX4dXs0wTFtbrA9UurR7uKFbMTlxRyHwNvGEzt3/4tUOGGJwHkflDzDOs/3W0NtoKdJ8ke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705743579; c=relaxed/simple;
	bh=mnP+4VRcwGvaYOvmNWv4Sv+e8KC/3zLAKtNt4TBFXaE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s5xdr6rj23ctTMtQzhEMnlul37upln9bsR/luFSnV6q6GHLDi8Bx+UFtwesrtWT/gp871G2SDghLDzwpUH9O+dgSEpCxgkjh98egO+GSgjTgltg8p9a17Pdeu8HOv1OWiLDgD7BP4tVbUDmVn/bpY7nuKrD5jtzRkS0AznU3VV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9ttSmCP; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705743577; x=1737279577;
  h=date:from:to:cc:subject:message-id;
  bh=mnP+4VRcwGvaYOvmNWv4Sv+e8KC/3zLAKtNt4TBFXaE=;
  b=R9ttSmCPkxfIKKxiXVyACda+R7tgrhzOPpjeWu/zHrjEJxX/H7aknxFX
   zABwU0yLKMcZ3pe5SynMnJ/x20gqI/CZQS0DYZ6XwMLRMUnzWvY2HjEf2
   7CzvfY+y8YX8wdS0oP/y+u/a4i8sX8LRMLiaMJSPwaNo1idv+ObqbMYFw
   YcrfAzVDmLngoQA9dYiF5EX31p+y1UKLOxxZTnY/ZBy6ovmz4R1iPgk76
   06wFMmvkuzQAWkwlF7yrhzgaJZQeYweJEkTCXFVCW9s/LzCsxl7aLpGcP
   enf7GP9d5eOipS41m/zwY9k7vBlj86GUrJLOzcsYxXc6eAhWnOZxa99GI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="398089529"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="398089529"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 01:39:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="876274"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2024 01:39:35 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR7p6-0004xu-2Y;
	Sat, 20 Jan 2024 09:39:32 +0000
Date: Sat, 20 Jan 2024 17:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD REGRESSION
 3af6e24a456437d323d1080bd254053f7af05234
Message-ID: <202401201702.Kc9t0UZe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 3af6e24a456437d323d1080bd254053f7af05234  dt-bindings: input: silead,gsl1680: do not override firmware-name $ref

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202401200525.sV9c5cWM-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202401200614.B4PnBzhk-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/input/joystick/adc-joystick.c:194:10: error: call to undeclared function 'min_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/input/joystick/adc-joystick.c:194:10: error: implicit declaration of function 'min_array' [-Werror=implicit-function-declaration]
drivers/input/joystick/adc-joystick.c:195:10: error: call to undeclared function 'max_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/input/joystick/adc-joystick.c:195:10: error: implicit declaration of function 'max_array'; did you mean 'kmalloc_array'? [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- i386-randconfig-011-20240120
    |-- drivers-input-joystick-adc-joystick.c:error:implicit-declaration-of-function-max_array
    `-- drivers-input-joystick-adc-joystick.c:error:implicit-declaration-of-function-min_array
clang_recent_errors
|-- i386-randconfig-001-20240120
|   |-- drivers-input-joystick-adc-joystick.c:error:call-to-undeclared-function-max_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-input-joystick-adc-joystick.c:error:call-to-undeclared-function-min_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- x86_64-buildonly-randconfig-002-20240120
|   |-- drivers-input-joystick-adc-joystick.c:error:call-to-undeclared-function-max_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-input-joystick-adc-joystick.c:error:call-to-undeclared-function-min_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
`-- x86_64-randconfig-012-20240120
    |-- drivers-input-joystick-adc-joystick.c:error:call-to-undeclared-function-max_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
    `-- drivers-input-joystick-adc-joystick.c:error:call-to-undeclared-function-min_array-ISO-C99-and-later-do-not-support-implicit-function-declarations

elapsed time: 1450m

configs tested: 74
configs skipped: 0

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
i386         buildonly-randconfig-001-20240120   clang
i386         buildonly-randconfig-002-20240120   clang
i386         buildonly-randconfig-003-20240120   clang
i386         buildonly-randconfig-004-20240120   clang
i386         buildonly-randconfig-005-20240120   clang
i386         buildonly-randconfig-006-20240120   clang
i386                  randconfig-001-20240120   clang
i386                  randconfig-002-20240120   clang
i386                  randconfig-003-20240120   clang
i386                  randconfig-004-20240120   clang
i386                  randconfig-005-20240120   clang
i386                  randconfig-006-20240120   clang
i386                  randconfig-011-20240120   gcc  
i386                  randconfig-012-20240120   gcc  
i386                  randconfig-013-20240120   gcc  
i386                  randconfig-014-20240120   gcc  
i386                  randconfig-015-20240120   gcc  
i386                  randconfig-016-20240120   gcc  
loongarch             randconfig-001-20240120   gcc  
loongarch             randconfig-002-20240120   gcc  
nios2                 randconfig-001-20240120   gcc  
nios2                 randconfig-002-20240120   gcc  
parisc                randconfig-001-20240120   gcc  
parisc                randconfig-002-20240120   gcc  
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
sh                    randconfig-002-20240120   gcc  
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

