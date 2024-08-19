Return-Path: <linux-input+bounces-5688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 361599575B9
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 22:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68A5D1C218E2
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3FA158A09;
	Mon, 19 Aug 2024 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4O9AKAI"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1024015A85A
	for <linux-input@vger.kernel.org>; Mon, 19 Aug 2024 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724099646; cv=none; b=RIyC6i8Fy6HVVsTse+N3LGfNRBvx5O27qclCH7C8g8h/xsYitavk1yDy8q327+5uMN4SAsEAOjN9i6zxZ3jAeW02tiCmbfuPfBFoFD4ron3xucXTmG7YF0gXJ1lDq2rFBtGhTJzVQ+RJGNuoh6kkGQx4W5Af2q3qg0hBBd+LI3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724099646; c=relaxed/simple;
	bh=urHwFQdOYCgAG2s7kQ1gbyP2vESpv6/Eg3ijcs/awIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pvp0ujir1F9Ys6UiFAnUO0aO7S6T1DpiTUFsnRJrCy3JrC9xtj1zl3Ylp3Mr7iEvc1QDToqhq3BEu6vE+EBwDNm/ABRpad1xivt2LIt2rKpEyLY4y4EjOwMm6Nz27ax+JyhOnWM+qmggPL7E7Qlu0+mMFcLXi0c7SCvzrGOVTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4O9AKAI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724099644; x=1755635644;
  h=date:from:to:cc:subject:message-id;
  bh=urHwFQdOYCgAG2s7kQ1gbyP2vESpv6/Eg3ijcs/awIM=;
  b=S4O9AKAI+ZMSfDIDvoe7F9wnlXtT83EyBGKecp/YoOW3MCHJI96+7wrd
   Aje7n1b/Nb+TTDmYxnv62TJAMJRE3VcEy2aALIoHCnSkKDiGTtMM7/t1Y
   D/0yUXDQcb/OdSmQqTcLX4EqZqVlpOSbzWsqN80FbUnmGqpTy2f20lKmN
   SjPhNy0taFG2BDXS0tJEhf24yDNeZ8ZkgbMARkPj9a/icEQkPRAh3y0li
   xwP4Ez/urDhrb3j9qMOdEsdHCf/9D6GcAkJOSrFv40eagyAHftIEZnu4b
   /eFB0v3ddNLKwyEeFSvs9B8lVlt1VZkRKLAOpXhBzTCVQSg4sW6yR0bed
   w==;
X-CSE-ConnectionGUID: t/CvRnCnTymW63SFm7yNgw==
X-CSE-MsgGUID: xT+xrMLURQGRZF0hnQvLIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21991327"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="21991327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 13:34:03 -0700
X-CSE-ConnectionGUID: croRnHmHQGqLN1+OGQKKFA==
X-CSE-MsgGUID: Zrvr5hwEQQiBmnhvphRsZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="60471077"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2024 13:34:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg94i-0009PQ-0T;
	Mon, 19 Aug 2024 20:34:00 +0000
Date: Tue, 20 Aug 2024 04:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 4e12e550936364660b056116c848b82bf73aa8b6
Message-ID: <202408200421.PDqK0ufd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 4e12e550936364660b056116c848b82bf73aa8b6  dt-bindings: input: touchscreen: convert ad7879 to yaml format

elapsed time: 904m

configs tested: 169
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240819   gcc-13.2.0
arc                   randconfig-002-20240819   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                         assabet_defconfig   clang-15
arm                          collie_defconfig   gcc-14.1.0
arm                                 defconfig   clang-14
arm                         mv78xx0_defconfig   clang-20
arm                   randconfig-001-20240819   clang-20
arm                   randconfig-002-20240819   clang-20
arm                   randconfig-003-20240819   clang-17
arm                   randconfig-004-20240819   gcc-14.1.0
arm                           sama5_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240819   gcc-14.1.0
arm64                 randconfig-002-20240819   gcc-14.1.0
arm64                 randconfig-003-20240819   clang-20
arm64                 randconfig-004-20240819   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240819   gcc-14.1.0
csky                  randconfig-002-20240819   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   clang-20
hexagon               randconfig-001-20240819   clang-20
hexagon               randconfig-002-20240819   clang-15
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240819   clang-18
i386         buildonly-randconfig-002-20240819   gcc-12
i386         buildonly-randconfig-003-20240819   gcc-11
i386         buildonly-randconfig-004-20240819   clang-18
i386         buildonly-randconfig-005-20240819   gcc-12
i386         buildonly-randconfig-006-20240819   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240819   gcc-12
i386                  randconfig-002-20240819   clang-18
i386                  randconfig-003-20240819   gcc-12
i386                  randconfig-004-20240819   gcc-12
i386                  randconfig-005-20240819   gcc-12
i386                  randconfig-006-20240819   gcc-12
i386                  randconfig-011-20240819   gcc-12
i386                  randconfig-012-20240819   gcc-12
i386                  randconfig-013-20240819   gcc-12
i386                  randconfig-014-20240819   gcc-12
i386                  randconfig-015-20240819   gcc-12
i386                  randconfig-016-20240819   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240819   gcc-14.1.0
loongarch             randconfig-002-20240819   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                       m5208evb_defconfig   gcc-14.1.0
m68k                        m5272c3_defconfig   gcc-14.1.0
m68k                       m5275evb_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                      bmips_stb_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240819   gcc-14.1.0
nios2                 randconfig-002-20240819   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240819   gcc-14.1.0
parisc                randconfig-002-20240819   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                 canyonlands_defconfig   clang-20
powerpc                     ep8248e_defconfig   gcc-14.1.0
powerpc                       maple_defconfig   clang-20
powerpc                     mpc5200_defconfig   clang-14
powerpc                 mpc832x_rdb_defconfig   gcc-14.1.0
powerpc                      ppc64e_defconfig   gcc-14.1.0
powerpc                      ppc6xx_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240819   gcc-14.1.0
powerpc               randconfig-002-20240819   gcc-14.1.0
powerpc               randconfig-003-20240819   clang-20
powerpc64             randconfig-001-20240819   clang-14
powerpc64             randconfig-002-20240819   clang-20
powerpc64             randconfig-003-20240819   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240819   clang-20
riscv                 randconfig-002-20240819   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240819   gcc-14.1.0
s390                  randconfig-002-20240819   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-14.1.0
sh                    randconfig-001-20240819   gcc-14.1.0
sh                    randconfig-002-20240819   gcc-14.1.0
sh                           se7619_defconfig   gcc-14.1.0
sh                           se7705_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240819   gcc-14.1.0
sparc64               randconfig-002-20240819   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240819   gcc-12
um                    randconfig-002-20240819   clang-20
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240819   gcc-12
x86_64       buildonly-randconfig-002-20240819   gcc-12
x86_64       buildonly-randconfig-003-20240819   gcc-12
x86_64       buildonly-randconfig-004-20240819   gcc-12
x86_64       buildonly-randconfig-005-20240819   gcc-12
x86_64       buildonly-randconfig-006-20240819   gcc-12
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240819   clang-18
x86_64                randconfig-002-20240819   clang-18
x86_64                randconfig-003-20240819   gcc-12
x86_64                randconfig-004-20240819   gcc-12
x86_64                randconfig-005-20240819   clang-18
x86_64                randconfig-006-20240819   clang-18
x86_64                randconfig-011-20240819   gcc-12
x86_64                randconfig-012-20240819   clang-18
x86_64                randconfig-013-20240819   clang-18
x86_64                randconfig-014-20240819   gcc-12
x86_64                randconfig-015-20240819   gcc-12
x86_64                randconfig-016-20240819   gcc-12
x86_64                randconfig-071-20240819   gcc-12
x86_64                randconfig-072-20240819   gcc-12
x86_64                randconfig-073-20240819   clang-18
x86_64                randconfig-074-20240819   gcc-12
x86_64                randconfig-075-20240819   gcc-12
x86_64                randconfig-076-20240819   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240819   gcc-14.1.0
xtensa                randconfig-002-20240819   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

