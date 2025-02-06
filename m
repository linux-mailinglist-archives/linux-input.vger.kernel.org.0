Return-Path: <linux-input+bounces-9820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C2A2ACED
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 16:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACE9E160A25
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 15:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8E238382;
	Thu,  6 Feb 2025 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esg6MySX"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D14C8E
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856743; cv=none; b=Vo9pWNDozqfigEzgzoS/xDV/DhaTDIeVSpv35jVDZV6or5cEJSmWISWd7wBgw4xWVmrfJ4Rnhdwk0ijr2ly97ff7N7gBhJkPX2A1XbI34u2sdgNYGKYfy9Ra+S0mrDaeNrE8eV7j3YU8oE3bjqbLnF1WcaPMuznrHD4djNxmd/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856743; c=relaxed/simple;
	bh=PUHwzMJABpo7ajF7X2TzliDk/7rO0SBqJFEbvDuZkoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VzFBkpOnCkh48nRn2D9MVREbt+i7w2AZs20sRi79Imu6YtwqcxDc5vl0G3UvEdJqnKjOyoJ3k08IEVqKOk/sqpHI3Jp+VJKkOBBC8d0xjAT35vhiWU7ruUcw0FprU/5obwNmEM/B8koAaioCa0wJe7kj3WsUznpDkQf2neYa2r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esg6MySX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738856742; x=1770392742;
  h=date:from:to:cc:subject:message-id;
  bh=PUHwzMJABpo7ajF7X2TzliDk/7rO0SBqJFEbvDuZkoM=;
  b=esg6MySXnl5oOJroMpO+bxcy7CqM21OoJSuCft1we7DJ9+UAmSeKaksr
   Z9YupEUGBw3JmyA3wE7sPsMjhJKsdRGstgMSbT+uldoE3b9vWV2+KvuW7
   rkGBmKjvJZh/sgh4HfF8cOGD0lvW2S94aV26cG1fQiNprPq9CmA2ZK8Tz
   7tsA9P8OxFLXjqYmqOf8bN6FZq1B3sgvlbihr2+rkcZY88nciF6vVgMfH
   +qnJyiFs1ZzJ4hY8cTAGh82tcwocE94fBuV4SI52gOuipA7UDP3FGoREN
   T26Re+K8lp7r2/sPceNnH+29HJqf7oBtjekRqMgEu+bddIwZ4wu7k6XJJ
   Q==;
X-CSE-ConnectionGUID: kSRZp7PhQTm87oGZUSRmew==
X-CSE-MsgGUID: Y4am0lAwSWKUU0GKJdHDWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39357150"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39357150"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:45:41 -0800
X-CSE-ConnectionGUID: v8sG9NbsTQqGNIqOwJmS4Q==
X-CSE-MsgGUID: zo03YcLrSLyne9vXhOqAHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115327204"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Feb 2025 07:45:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg44Q-000x35-1E;
	Thu, 06 Feb 2025 15:45:38 +0000
Date: Thu, 06 Feb 2025 23:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 a7550ff59edfc768a8600c1e5c24c304208696a5
Message-ID: <202502062322.fkB6iGV7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: a7550ff59edfc768a8600c1e5c24c304208696a5  Input: Switch to use hrtimer_setup()

elapsed time: 1388m

configs tested: 100
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250206    gcc-13.2.0
arc                   randconfig-002-20250206    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250206    clang-21
arm                   randconfig-002-20250206    clang-19
arm                   randconfig-003-20250206    clang-21
arm                   randconfig-004-20250206    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250206    clang-21
arm64                 randconfig-002-20250206    clang-21
arm64                 randconfig-003-20250206    clang-15
arm64                 randconfig-004-20250206    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250206    gcc-14.2.0
csky                  randconfig-002-20250206    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250206    clang-21
hexagon               randconfig-002-20250206    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250206    clang-19
i386        buildonly-randconfig-002-20250206    gcc-12
i386        buildonly-randconfig-003-20250206    clang-19
i386        buildonly-randconfig-004-20250206    clang-19
i386        buildonly-randconfig-005-20250206    clang-19
i386        buildonly-randconfig-006-20250206    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250206    gcc-14.2.0
loongarch             randconfig-002-20250206    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250206    gcc-14.2.0
nios2                 randconfig-002-20250206    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250206    gcc-14.2.0
parisc                randconfig-002-20250206    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250206    clang-21
powerpc               randconfig-002-20250206    clang-19
powerpc               randconfig-003-20250206    clang-21
powerpc64             randconfig-001-20250206    clang-15
powerpc64             randconfig-002-20250206    clang-17
powerpc64             randconfig-003-20250206    clang-19
riscv                            allmodconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250206    clang-19
riscv                 randconfig-002-20250206    clang-17
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250206    clang-21
s390                  randconfig-002-20250206    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250206    gcc-14.2.0
sh                    randconfig-002-20250206    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250206    gcc-14.2.0
sparc                 randconfig-002-20250206    gcc-14.2.0
sparc64               randconfig-001-20250206    gcc-14.2.0
sparc64               randconfig-002-20250206    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250206    clang-15
um                    randconfig-002-20250206    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250206    clang-19
x86_64      buildonly-randconfig-002-20250206    clang-19
x86_64      buildonly-randconfig-003-20250206    clang-19
x86_64      buildonly-randconfig-004-20250206    clang-19
x86_64      buildonly-randconfig-005-20250206    clang-19
x86_64      buildonly-randconfig-006-20250206    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250206    gcc-14.2.0
xtensa                randconfig-002-20250206    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

