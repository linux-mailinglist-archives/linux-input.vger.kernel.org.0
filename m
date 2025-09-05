Return-Path: <linux-input+bounces-14503-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F6B45107
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 10:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 851C24E226D
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 08:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA232FD7A7;
	Fri,  5 Sep 2025 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUpbg1gh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D990270557
	for <linux-input@vger.kernel.org>; Fri,  5 Sep 2025 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060033; cv=none; b=A4ZEnEv0WYJDyh1hJwu5fVYP+/C0AeGFBGLQiOZvMKrBjyIGyWaF1grCsATt9tWd52UKnKVtI4ef03UkiFKRIKta6MbAH0VA8sppT5kLOUnESdCVD4IYIpOfCtKQ6wf0fj9PRDbi2uYlc2NvujRzPAy3tnmdy0X8j6EN5z5W70U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060033; c=relaxed/simple;
	bh=OFJ8RqPr3kGcdlPEVnBHlskJvCMWdi5u5rat0dIbqCI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QWMs10fk9n/nzmSZH2sFKpQXnEzaHjwkxUL3P8ZKJKMf+6DOwRgjhDtM0D9go3XNLD2p/kZ4j76I1qlE4gLGMj7gsW3uxVNBFeZjttGf5IVsFM+l18ZPng7gzikNYTVaPDcKBHgvz8asLJMWytkwcUoCTTubyVk4hMz8J5ciScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUpbg1gh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757060031; x=1788596031;
  h=date:from:to:cc:subject:message-id;
  bh=OFJ8RqPr3kGcdlPEVnBHlskJvCMWdi5u5rat0dIbqCI=;
  b=hUpbg1ghrwZwWl7+MY/hh9h4IXyc7VW017l5JK2dtQBqQBIDP+9QwN3G
   aptxhshVWuNaRhKDRvzmh7ap50yqIBK5T2vwA20oSib1eMXB36GbC3OLh
   79GdWSyyJsXDszCsI3uGZz3hFt9gqrGeb8Kn/VtQEhH3B0w4gBNE9xWLk
   13eUG/yBhlnSNNF1fm8YInOh2qsuRYoXki0gFDsqccxcOOK95af2VYvUn
   RPxMiyET13k6omZAGioypJQor1Jp7kdfRTZeL3dXYbYUh3ft0WK+c8UwO
   wnLJOBcArr39H8iSH2K+aNadZI7XOX5oTam6ERI79uEyC7mET797TO0cg
   w==;
X-CSE-ConnectionGUID: U6goVfoeTaO5L1M1US0m7Q==
X-CSE-MsgGUID: xynW3/e3TveFxl3u8zZJgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81999421"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81999421"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 01:13:47 -0700
X-CSE-ConnectionGUID: azLQ89TNSeOPQWx/eQgAKw==
X-CSE-MsgGUID: NoliYBM5Qe2AmVsOIWFQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="172458792"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2025 01:13:46 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuRZn-0000Ad-0Y;
	Fri, 05 Sep 2025 08:13:43 +0000
Date: Fri, 05 Sep 2025 16:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 1939a9fcb80353dd8b111aa1e79c691afbde08b4
Message-ID: <202509051652.e0b3Diup-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 1939a9fcb80353dd8b111aa1e79c691afbde08b4  Input: i8042 - add TUXEDO InfinityBook Pro Gen10 AMD to i8042 quirk table

elapsed time: 1003m

configs tested: 194
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs103_defconfig    clang-22
arc                                 defconfig    clang-19
arc                   randconfig-001-20250905    clang-22
arc                   randconfig-001-20250905    gcc-11.5.0
arc                   randconfig-002-20250905    clang-22
arc                   randconfig-002-20250905    gcc-13.4.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   randconfig-001-20250905    clang-22
arm                   randconfig-002-20250905    clang-22
arm                   randconfig-003-20250905    clang-16
arm                   randconfig-003-20250905    clang-22
arm                   randconfig-004-20250905    clang-22
arm                   randconfig-004-20250905    gcc-14.3.0
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250905    clang-22
arm64                 randconfig-002-20250905    clang-17
arm64                 randconfig-002-20250905    clang-22
arm64                 randconfig-003-20250905    clang-17
arm64                 randconfig-003-20250905    clang-22
arm64                 randconfig-004-20250905    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250905    gcc-11.5.0
csky                  randconfig-002-20250905    gcc-11.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250905    gcc-11.5.0
hexagon               randconfig-002-20250905    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250905    clang-20
i386        buildonly-randconfig-002-20250905    clang-20
i386        buildonly-randconfig-003-20250905    clang-20
i386        buildonly-randconfig-004-20250905    clang-20
i386        buildonly-randconfig-004-20250905    gcc-13
i386        buildonly-randconfig-005-20250905    clang-20
i386        buildonly-randconfig-006-20250905    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250905    gcc-13
i386                  randconfig-002-20250905    gcc-13
i386                  randconfig-003-20250905    gcc-13
i386                  randconfig-004-20250905    gcc-13
i386                  randconfig-005-20250905    gcc-13
i386                  randconfig-006-20250905    gcc-13
i386                  randconfig-007-20250905    gcc-13
i386                  randconfig-011-20250905    clang-20
i386                  randconfig-012-20250905    clang-20
i386                  randconfig-013-20250905    clang-20
i386                  randconfig-014-20250905    clang-20
i386                  randconfig-015-20250905    clang-20
i386                  randconfig-016-20250905    clang-20
i386                  randconfig-017-20250905    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250905    gcc-11.5.0
loongarch             randconfig-002-20250905    gcc-11.5.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    clang-22
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250905    gcc-11.5.0
nios2                 randconfig-002-20250905    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-13
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250905    gcc-11.5.0
parisc                randconfig-002-20250905    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20250905    gcc-11.5.0
powerpc               randconfig-002-20250905    gcc-11.5.0
powerpc               randconfig-003-20250905    gcc-11.5.0
powerpc64             randconfig-001-20250905    gcc-11.5.0
powerpc64             randconfig-002-20250905    gcc-11.5.0
powerpc64             randconfig-003-20250905    gcc-11.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-13
riscv                 randconfig-001-20250905    gcc-14.3.0
riscv                 randconfig-001-20250905    gcc-15.1.0
riscv                 randconfig-002-20250905    clang-22
riscv                 randconfig-002-20250905    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-13
s390                  randconfig-001-20250905    gcc-15.1.0
s390                  randconfig-001-20250905    gcc-9.5.0
s390                  randconfig-002-20250905    clang-22
s390                  randconfig-002-20250905    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-13
sh                    randconfig-001-20250905    gcc-15.1.0
sh                    randconfig-002-20250905    gcc-15.1.0
sh                           se7619_defconfig    clang-22
sh                     sh7710voipgw_defconfig    clang-22
sh                            titan_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250905    gcc-15.1.0
sparc                 randconfig-001-20250905    gcc-8.5.0
sparc                 randconfig-002-20250905    gcc-15.1.0
sparc64                             defconfig    gcc-13
sparc64               randconfig-001-20250905    gcc-15.1.0
sparc64               randconfig-001-20250905    gcc-8.5.0
sparc64               randconfig-002-20250905    clang-22
sparc64               randconfig-002-20250905    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-13
um                             i386_defconfig    gcc-13
um                    randconfig-001-20250905    clang-22
um                    randconfig-001-20250905    gcc-15.1.0
um                    randconfig-002-20250905    gcc-13
um                    randconfig-002-20250905    gcc-15.1.0
um                           x86_64_defconfig    gcc-13
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250905    clang-20
x86_64      buildonly-randconfig-001-20250905    gcc-13
x86_64      buildonly-randconfig-002-20250905    clang-20
x86_64      buildonly-randconfig-002-20250905    gcc-13
x86_64      buildonly-randconfig-003-20250905    gcc-13
x86_64      buildonly-randconfig-004-20250905    clang-20
x86_64      buildonly-randconfig-004-20250905    gcc-13
x86_64      buildonly-randconfig-005-20250905    clang-20
x86_64      buildonly-randconfig-005-20250905    gcc-13
x86_64      buildonly-randconfig-006-20250905    gcc-13
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250905    clang-20
x86_64                randconfig-002-20250905    clang-20
x86_64                randconfig-003-20250905    clang-20
x86_64                randconfig-004-20250905    clang-20
x86_64                randconfig-005-20250905    clang-20
x86_64                randconfig-006-20250905    clang-20
x86_64                randconfig-007-20250905    clang-20
x86_64                randconfig-008-20250905    clang-20
x86_64                randconfig-071-20250905    clang-20
x86_64                randconfig-072-20250905    clang-20
x86_64                randconfig-073-20250905    clang-20
x86_64                randconfig-074-20250905    clang-20
x86_64                randconfig-075-20250905    clang-20
x86_64                randconfig-076-20250905    clang-20
x86_64                randconfig-077-20250905    clang-20
x86_64                randconfig-078-20250905    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-13
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-13
x86_64                           rhel-9.4-ltp    gcc-13
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250905    gcc-15.1.0
xtensa                randconfig-001-20250905    gcc-8.5.0
xtensa                randconfig-002-20250905    gcc-15.1.0
xtensa                randconfig-002-20250905    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

