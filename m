Return-Path: <linux-input+bounces-6554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F389297961C
	for <lists+linux-input@lfdr.de>; Sun, 15 Sep 2024 11:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23AD41C21A9D
	for <lists+linux-input@lfdr.de>; Sun, 15 Sep 2024 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0101C3F3B;
	Sun, 15 Sep 2024 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gv8fnZ5/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096361C462B
	for <linux-input@vger.kernel.org>; Sun, 15 Sep 2024 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726391682; cv=none; b=qymsAuAYt+9kwerDbC0XVmYFWeBEXwdGRI9brF1fkT4QEBjtQHT7eZ4VYwO9snVymGOZQHhK08zcT7BEFhRnvoMv9k8hyEbJv0NLo7gcYiK3cpNYnu5/dL8FCcToKH/wUDN0hhRfklrMvspjVhILOkPanIxGngulAPh8DdBlpVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726391682; c=relaxed/simple;
	bh=7pLRtlIrwMwDFCbHnWMKo3V7CZfc9Y7UmCJr9j2wGdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WRLue9bPbjsb3UjOsnLZ6a8NTCF86+aDO5vH0evUsZqNUhsIMKsQat/lPqR+bUEaVPqDp+BLRxksm/ZMGNgJu73av4EVyVloQxWq3Pg6YXVsw1SK2B2/5eB11rRsrkLMOYlLtji3hdNYjV0l1i60xT62NQkghgI+NK+lquSSq1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gv8fnZ5/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726391680; x=1757927680;
  h=date:from:to:cc:subject:message-id;
  bh=7pLRtlIrwMwDFCbHnWMKo3V7CZfc9Y7UmCJr9j2wGdY=;
  b=Gv8fnZ5/LlREDCS682DH3Z3dSA7grn7OfJ3DZ+d96jWhyBo5RcxCtwI5
   w9w/JC8yCCZ/i8r8qf33DtP5Zi7JMqiWkAuw3uuyNG5Rc9OG6T4k9cDsy
   xBaCzxl1UESfK1Ey5cBVBxT1ppzLUMXNxidAsTUUdNnROnrK4MCLay/qY
   QinAqNw8apltxGecpDP0oNU1+sOj2r1x24w+xU4kODC8mxG9FARZ3nrH8
   GeZgeZqOYUHckpE6NpCitH0xXGB0nsFLsWGJUo8NuUPvWGo/TPSqqybig
   CE3rbpphJCGt+hW2VkRo99QwYygSdjgbO/i7963k/SQU3kKCkieCg1cFy
   w==;
X-CSE-ConnectionGUID: JBU5QGTITW6I3EkV4LSW2A==
X-CSE-MsgGUID: 2ovyUE0mRI6dVLO9vMJYBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25341733"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="25341733"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 02:14:39 -0700
X-CSE-ConnectionGUID: 2cd2Js2TQ0mrfBM/sM/ZCA==
X-CSE-MsgGUID: 9+8FCQ7eTDGbSChejy7iaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="73414821"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Sep 2024 02:14:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1splL2-0008Z6-0J;
	Sun, 15 Sep 2024 09:14:36 +0000
Date: Sun, 15 Sep 2024 17:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 c7c878ff329239e28d7ab9fae7f7f49f114b12ff
Message-ID: <202409151712.6zuNXmNv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: c7c878ff329239e28d7ab9fae7f7f49f114b12ff  Input: tegra-kbc - use of_property_read_variable_u32_array() and of_property_present()

elapsed time: 1536m

configs tested: 101
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20240915    gcc-13.2.0
arc                   randconfig-002-20240915    gcc-13.2.0
arm                               allnoconfig    clang-20
arm                   randconfig-001-20240915    gcc-14.1.0
arm                   randconfig-002-20240915    clang-17
arm                   randconfig-003-20240915    clang-20
arm                   randconfig-004-20240915    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240915    clang-20
arm64                 randconfig-002-20240915    gcc-14.1.0
arm64                 randconfig-003-20240915    clang-20
arm64                 randconfig-004-20240915    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240915    gcc-14.1.0
csky                  randconfig-002-20240915    gcc-14.1.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20240915    clang-20
hexagon               randconfig-002-20240915    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240915    gcc-12
i386        buildonly-randconfig-002-20240915    clang-18
i386        buildonly-randconfig-003-20240915    clang-18
i386        buildonly-randconfig-004-20240915    gcc-12
i386        buildonly-randconfig-005-20240915    clang-18
i386        buildonly-randconfig-006-20240915    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240915    clang-18
i386                  randconfig-002-20240915    clang-18
i386                  randconfig-003-20240915    clang-18
i386                  randconfig-004-20240915    clang-18
i386                  randconfig-005-20240915    clang-18
i386                  randconfig-006-20240915    clang-18
i386                  randconfig-011-20240915    clang-18
i386                  randconfig-012-20240915    gcc-12
i386                  randconfig-013-20240915    gcc-12
i386                  randconfig-014-20240915    clang-18
i386                  randconfig-015-20240915    gcc-12
i386                  randconfig-016-20240915    gcc-12
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240915    gcc-14.1.0
loongarch             randconfig-002-20240915    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240915    gcc-14.1.0
nios2                 randconfig-002-20240915    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                randconfig-001-20240915    gcc-14.1.0
parisc                randconfig-002-20240915    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc               randconfig-001-20240915    gcc-14.1.0
powerpc               randconfig-002-20240915    gcc-14.1.0
powerpc               randconfig-003-20240915    gcc-14.1.0
powerpc64             randconfig-001-20240915    clang-20
powerpc64             randconfig-002-20240915    clang-20
powerpc64             randconfig-003-20240915    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                 randconfig-001-20240915    clang-15
riscv                 randconfig-002-20240915    clang-20
s390                              allnoconfig    clang-20
s390                  randconfig-001-20240915    clang-20
s390                  randconfig-002-20240915    clang-20
sh                                allnoconfig    gcc-14.1.0
sh                    randconfig-001-20240915    gcc-14.1.0
sh                    randconfig-002-20240915    gcc-14.1.0
sparc64               randconfig-001-20240915    gcc-14.1.0
sparc64               randconfig-002-20240915    gcc-14.1.0
um                                allnoconfig    clang-17
um                    randconfig-001-20240915    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240915    gcc-12
x86_64      buildonly-randconfig-002-20240915    gcc-12
x86_64      buildonly-randconfig-003-20240915    clang-18
x86_64      buildonly-randconfig-004-20240915    clang-18
x86_64      buildonly-randconfig-005-20240915    clang-18
x86_64      buildonly-randconfig-006-20240915    gcc-12
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20240915    clang-18
x86_64                randconfig-002-20240915    gcc-12
x86_64                randconfig-003-20240915    gcc-12
x86_64                randconfig-004-20240915    clang-18
x86_64                randconfig-005-20240915    clang-18
x86_64                randconfig-006-20240915    clang-18
x86_64                randconfig-011-20240915    gcc-12
x86_64                randconfig-012-20240915    clang-18
x86_64                randconfig-013-20240915    gcc-12
x86_64                randconfig-014-20240915    gcc-12
x86_64                randconfig-015-20240915    gcc-12
x86_64                randconfig-016-20240915    clang-18
x86_64                randconfig-071-20240915    clang-18
x86_64                randconfig-072-20240915    clang-18
x86_64                randconfig-073-20240915    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

