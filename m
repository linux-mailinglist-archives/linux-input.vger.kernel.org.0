Return-Path: <linux-input+bounces-3355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB62A8B906D
	for <lists+linux-input@lfdr.de>; Wed,  1 May 2024 22:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35E22281260
	for <lists+linux-input@lfdr.de>; Wed,  1 May 2024 20:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE3D161936;
	Wed,  1 May 2024 20:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZAXi869"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F40642A96
	for <linux-input@vger.kernel.org>; Wed,  1 May 2024 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714594248; cv=none; b=jneWLh7v2Qt5sZWmQQe71x9mLQqbesoBZSsrEHeyZjDCyPrLO/ID/169wDiQO2TB624wyBs8apxEzSxCu1X9wilWbTNvKSFplbxoI+md1bHj7LA57PrK8s7cJMHz7hL1/gzKkV2uGDnxo6HQCelL9mNE+UxvCpDa4+Qv1DQrIB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714594248; c=relaxed/simple;
	bh=MWbKEJiaoqlRwXoBtNPahpZypFimn426XDgJYumAGDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GDiPF6ROAfZ9FDKF1Ae++L77l3894Hgc7PGUs21K897kkNUo5RRGshhhB0mqWhbDk73vrQIKVkaESLA19gmDMlazF1lsUF/80xxdplaWOA2MFKqQ8G/tYYUTlQmcnpi1XHYW5tjMxrL41zE1bSz7Z66wodQ7wKNpvpY4F4ku3BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZAXi869; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714594246; x=1746130246;
  h=date:from:to:cc:subject:message-id;
  bh=MWbKEJiaoqlRwXoBtNPahpZypFimn426XDgJYumAGDk=;
  b=UZAXi869lht5G05ylT7tMliaANOU66Vln5BkFY0IwQqC0s0ZRPenwm9B
   AzIPNwGW0nFjgkCF1jjLIG4Y6+OavuEYybMiHj4L+u1qR/XbIxUPCcr0L
   wIvLAuVB9iXWMup6dvOSkmj4uf5b4GvTophoZzfCIaXg6hPg92GabGxQl
   fuGe/eWT1doyXCZRMoxfelE6patqqwcXv/YCIm1vJoG6IDP0Qh/3J/ZyZ
   Q98R3libHc2PgfT6Q6mslbrUyCPDIMlSzMcRJzG2yKhboEB2reH6yTm12
   7IItDibmmjuqUYX5jGdhu7Srv2HycSjoJ8ebJv3JlrBCsXVPOqY0i5yH4
   A==;
X-CSE-ConnectionGUID: 60m1iBSQTi+dtzDynKWTjA==
X-CSE-MsgGUID: uhDXrUC6RiWeD1/o4WIHTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21745111"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="21745111"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 13:10:45 -0700
X-CSE-ConnectionGUID: 2/6wuoWPRa6VoL6ePjiEdg==
X-CSE-MsgGUID: RoI1sxFcRlCECYSMNcX1sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="27504949"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 May 2024 13:10:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2GHq-0009wm-14;
	Wed, 01 May 2024 20:10:42 +0000
Date: Thu, 02 May 2024 04:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 7b4e0b39182cf5e677c1fc092a3ec40e621c25b6
Message-ID: <202405020415.qGB8Z3Wx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 7b4e0b39182cf5e677c1fc092a3ec40e621c25b6  Input: cyapa - add missing input core locking to suspend/resume functions

elapsed time: 1480m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240501   clang
i386         buildonly-randconfig-002-20240501   gcc  
i386         buildonly-randconfig-003-20240501   clang
i386         buildonly-randconfig-004-20240501   gcc  
i386         buildonly-randconfig-005-20240501   gcc  
i386         buildonly-randconfig-006-20240501   clang
i386                                defconfig   clang
i386                  randconfig-001-20240501   gcc  
i386                  randconfig-002-20240501   clang
i386                  randconfig-003-20240501   gcc  
i386                  randconfig-004-20240501   gcc  
i386                  randconfig-005-20240501   clang
i386                  randconfig-006-20240501   clang
i386                  randconfig-011-20240501   gcc  
i386                  randconfig-012-20240501   gcc  
i386                  randconfig-013-20240501   gcc  
i386                  randconfig-014-20240501   gcc  
i386                  randconfig-015-20240501   gcc  
i386                  randconfig-016-20240501   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                          rv32_defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

