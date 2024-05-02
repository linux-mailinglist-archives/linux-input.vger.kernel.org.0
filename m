Return-Path: <linux-input+bounces-3361-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4388B92DE
	for <lists+linux-input@lfdr.de>; Thu,  2 May 2024 02:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11B61284059
	for <lists+linux-input@lfdr.de>; Thu,  2 May 2024 00:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CA010F4;
	Thu,  2 May 2024 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHyyUuDc"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE0110FD
	for <linux-input@vger.kernel.org>; Thu,  2 May 2024 00:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714610384; cv=none; b=iprkb1Nh/BcOk0+z6LabwdnkfIpRSxOwNSaMaTAP63G/oJpSfi88SEWSUVbc5inE1NXAdpWiD5nzW0hl6qP4Vo5P3SOUWLDCWBc1BJW64uenprLK+dOgrB7akKmdvbLyRSfSykcF5zt3R3Iozz8SwtyUpmBFIDKlZLJu/2RcTVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714610384; c=relaxed/simple;
	bh=3WJbtUHtfzmJ5CSn1waPRk0Ocs/FMgIcY6JDeFIKgMA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nZArJ56PN0qy7AxLd6/Gh4Gq87IH3KV2gSRQpeved6yzCmz8lF/G7zlE26GIbRFy4Ntvl+traAIp2P2P0c7ppMFsl+RqYqkP2Yakm2LNIC+PE5KJOfGskPghevVasvrDC769iZeSyzgyK11i9Js5k4zxCkfVpsYRhYhI8h+90rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHyyUuDc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714610382; x=1746146382;
  h=date:from:to:cc:subject:message-id;
  bh=3WJbtUHtfzmJ5CSn1waPRk0Ocs/FMgIcY6JDeFIKgMA=;
  b=nHyyUuDcR+wqLfz8O6C0ghAMhuq30H2IpUGNsTFldVix8Mu4Jaxh3yv8
   EON88bdeWJCen5v9VDTiu/z2tEoO1rvlSWNcFmTb2WrDrj/EHaOTCRa8/
   q+tTS0H0zTg/z9kOkCtb94KpAQ5rvx5k7O7zF6fwqITJ9Khl+qeFbi3sl
   QEueqouEC4zrjQ8Ylpd+z0czxYDaSaKQk1cZ5ypQfPnqmGz94T+r4YYif
   10lctcV9tyNZYFIjyPBhfU4uVoMadvg2EfBJJdLa/R5ZpVBXg8Rvz2r8P
   HW3AAol3iGiOcvOKWUnaxdnGoha8EdojAIAHpEHb8Oyw2j49Ut+3VbhCv
   A==;
X-CSE-ConnectionGUID: An54bfMwQOOvpPQmNbV/XQ==
X-CSE-MsgGUID: S3EpaFLoTymQQF6+fsuIwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10211951"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="10211951"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 17:39:40 -0700
X-CSE-ConnectionGUID: kOJ4XLgrRnKJAlbe0oUWBQ==
X-CSE-MsgGUID: 7vvyGBQnQCOlIOWJAtIlPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="31568339"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2024 17:39:40 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2KU5-000AD2-1s;
	Thu, 02 May 2024 00:39:37 +0000
Date: Thu, 02 May 2024 08:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 0537c8eef4f699aacdeb67c6181c66cccd63c7f5
Message-ID: <202405020830.qnXhHp2G-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 0537c8eef4f699aacdeb67c6181c66cccd63c7f5  Input: amimouse - mark driver struct with __refdata to prevent section mismatch

elapsed time: 1750m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240502   gcc  
arc                   randconfig-002-20240502   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240502   gcc  
arm                   randconfig-002-20240502   gcc  
arm                   randconfig-003-20240502   gcc  
arm                   randconfig-004-20240502   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240502   gcc  
arm64                 randconfig-002-20240502   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                                defconfig   clang
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
x86_64       buildonly-randconfig-001-20240502   gcc  
x86_64       buildonly-randconfig-002-20240502   gcc  
x86_64       buildonly-randconfig-003-20240502   clang
x86_64       buildonly-randconfig-004-20240502   gcc  
x86_64       buildonly-randconfig-005-20240502   gcc  
x86_64       buildonly-randconfig-006-20240502   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240502   gcc  
x86_64                randconfig-002-20240502   clang
x86_64                randconfig-003-20240502   clang
x86_64                randconfig-004-20240502   gcc  
x86_64                randconfig-005-20240502   clang
x86_64                randconfig-006-20240502   clang
x86_64                randconfig-011-20240502   clang
x86_64                randconfig-012-20240502   clang
x86_64                randconfig-013-20240502   gcc  
x86_64                randconfig-014-20240502   gcc  
x86_64                randconfig-015-20240502   gcc  
x86_64                randconfig-016-20240502   clang
x86_64                randconfig-071-20240502   gcc  
x86_64                randconfig-072-20240502   gcc  
x86_64                randconfig-073-20240502   gcc  
x86_64                randconfig-074-20240502   clang
x86_64                randconfig-075-20240502   clang
x86_64                randconfig-076-20240502   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

