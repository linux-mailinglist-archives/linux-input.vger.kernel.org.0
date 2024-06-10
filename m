Return-Path: <linux-input+bounces-4305-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B9902B82
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 00:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1088B2169F
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 22:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDD4745F4;
	Mon, 10 Jun 2024 22:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqMTlGmL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2474E18E2A
	for <linux-input@vger.kernel.org>; Mon, 10 Jun 2024 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718058201; cv=none; b=fpXacH2PW3OXcWZy0SQYnd9IM6H2wHmx5HnDidW8NSnfysTI6vfVau7OvKXCsc2j2VjYdag6nGfHxa9kOz8iEkIBKhejVV8cHHXwKtIwJo8s1PCqol3bz/1LAoAefpbvlimpJZpY9yGNTILIWr2TaqB/xUTOFYtgJMB+SHFBXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718058201; c=relaxed/simple;
	bh=WpRdJ/d9GSdlodnFeW+F4BFxd6uhIB576d7wqwi4Z0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XftdwYqRD0h+SgH1HEYq3Qnq1KbKglqtMOc2+otTe2F3O8NxvMqrPOGohA4G7jiyx77mxVIlXXGLhMYQmwUFbsUx6+zBiknXNwDFEeZ5U4T7PMIGmBCVcA+oY1Y4dFI1rfjZM1/Nd1NLYgP5BVVL1VGkBFCNYNfXDdP5WhND4VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqMTlGmL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718058199; x=1749594199;
  h=date:from:to:cc:subject:message-id;
  bh=WpRdJ/d9GSdlodnFeW+F4BFxd6uhIB576d7wqwi4Z0k=;
  b=CqMTlGmLaqpeewYKQyJiyUgyWvKW1B4zb+2ETAUBjwc25NaPeqXb9tep
   +/ze0+hR5bqMyRQKug8GmOjwQaPw6uvA0xtxgT9hd4YDBGCOnQEzDvV1z
   M8LRPBt6KyhqErY5IJLA8NbcgQDoM102JOAyuLnF1wgvatYH1xvWyL09M
   fsbeiS1Jfs6qpsbP1txFUjpl1uz9xrRHahQEDZmku/frGZnDwf+/80Onh
   zTwrMs2lZj3SfhOf9RoNRzW7hhM+sMnBSwrl8WN8urFPB2DZsbvTcgRMC
   E+0ETmRj25gz/yWNxW5J0zsHIMfJkIY+MyfqWBEf3Yp8/TY9kHZLfkHXY
   g==;
X-CSE-ConnectionGUID: O5+QuakSTLW2Egvw4FprcA==
X-CSE-MsgGUID: ZwA9gwnASX2V62B3gVe/Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14867970"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14867970"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 15:23:19 -0700
X-CSE-ConnectionGUID: nbh6MJshRoWaGZtLvbtHLw==
X-CSE-MsgGUID: nMV6u5MjSN+VRXNJq48SRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="44342652"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jun 2024 15:23:18 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGnQ3-0002XN-0f;
	Mon, 10 Jun 2024 22:23:15 +0000
Date: Tue, 11 Jun 2024 06:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 e17fb91cd4cde13001dc75ad99a378ab28dd44df
Message-ID: <202406110646.vnj2Z1ZZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: e17fb91cd4cde13001dc75ad99a378ab28dd44df  Input: add missing MODULE_DESCRIPTION() macros

elapsed time: 1449m

configs tested: 190
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240610   gcc  
arc                   randconfig-002-20240610   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                          ixp4xx_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                          moxart_defconfig   gcc  
arm                        mvebu_v5_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240610   gcc  
arm                   randconfig-002-20240610   gcc  
arm                   randconfig-003-20240610   clang
arm                   randconfig-004-20240610   gcc  
arm                           sama5_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240610   gcc  
arm64                 randconfig-002-20240610   gcc  
arm64                 randconfig-003-20240610   gcc  
arm64                 randconfig-004-20240610   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240610   gcc  
csky                  randconfig-002-20240610   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240610   clang
hexagon               randconfig-002-20240610   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240610   clang
i386         buildonly-randconfig-002-20240610   gcc  
i386         buildonly-randconfig-003-20240610   gcc  
i386         buildonly-randconfig-004-20240610   clang
i386         buildonly-randconfig-005-20240610   gcc  
i386         buildonly-randconfig-006-20240610   clang
i386                                defconfig   clang
i386                  randconfig-001-20240610   gcc  
i386                  randconfig-002-20240610   gcc  
i386                  randconfig-003-20240610   gcc  
i386                  randconfig-004-20240610   gcc  
i386                  randconfig-005-20240610   clang
i386                  randconfig-006-20240610   gcc  
i386                  randconfig-011-20240610   clang
i386                  randconfig-012-20240610   clang
i386                  randconfig-013-20240610   clang
i386                  randconfig-014-20240610   clang
i386                  randconfig-015-20240610   clang
i386                  randconfig-016-20240610   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240610   gcc  
loongarch             randconfig-002-20240610   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                            gpr_defconfig   clang
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240610   gcc  
nios2                 randconfig-002-20240610   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240610   gcc  
parisc                randconfig-002-20240610   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       ebony_defconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                     kilauea_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                     ksi8560_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc               randconfig-001-20240610   clang
powerpc               randconfig-002-20240610   clang
powerpc               randconfig-003-20240610   clang
powerpc                     redwood_defconfig   clang
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240610   clang
powerpc64             randconfig-002-20240610   clang
powerpc64             randconfig-003-20240610   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240610   gcc  
riscv                 randconfig-002-20240610   gcc  
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240610   gcc  
s390                  randconfig-002-20240610   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20240610   gcc  
sh                    randconfig-002-20240610   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240610   gcc  
sparc64               randconfig-002-20240610   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240610   gcc  
um                    randconfig-002-20240610   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240610   gcc  
x86_64       buildonly-randconfig-002-20240610   clang
x86_64       buildonly-randconfig-003-20240610   gcc  
x86_64       buildonly-randconfig-004-20240610   gcc  
x86_64       buildonly-randconfig-005-20240610   gcc  
x86_64       buildonly-randconfig-006-20240610   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240610   gcc  
x86_64                randconfig-002-20240610   gcc  
x86_64                randconfig-003-20240610   clang
x86_64                randconfig-004-20240610   gcc  
x86_64                randconfig-005-20240610   gcc  
x86_64                randconfig-006-20240610   clang
x86_64                randconfig-011-20240610   clang
x86_64                randconfig-012-20240610   gcc  
x86_64                randconfig-013-20240610   gcc  
x86_64                randconfig-014-20240610   gcc  
x86_64                randconfig-015-20240610   clang
x86_64                randconfig-016-20240610   clang
x86_64                randconfig-071-20240610   gcc  
x86_64                randconfig-072-20240610   clang
x86_64                randconfig-073-20240610   clang
x86_64                randconfig-074-20240610   gcc  
x86_64                randconfig-075-20240610   clang
x86_64                randconfig-076-20240610   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240610   gcc  
xtensa                randconfig-002-20240610   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

