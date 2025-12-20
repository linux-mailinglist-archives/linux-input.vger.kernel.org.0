Return-Path: <linux-input+bounces-16649-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE116CD2E13
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 12:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0E2B30124D2
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 11:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3FE3093D8;
	Sat, 20 Dec 2025 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtyE2j9/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC821303C88
	for <linux-input@vger.kernel.org>; Sat, 20 Dec 2025 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766229774; cv=none; b=IFgPMlTBQ1SiM4raz9D9DNlaPYLsQGe6V2Ou/CjTACTkWA3f+ExsmWebxAL1ndTiQZAl9i8lw3mvVqjG3qOzPAxxqAv65swb5OvwpBE38rO4rma4t+S8IJksDqIU0BMNO5ve7ZelreBcy3NzxuyZ11f9IZu37fv2ViLO8kbBW/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766229774; c=relaxed/simple;
	bh=cxDVasvlQrtBoyAM1tp80rhhG1voUrqT3y8R8hoa60Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UNZvgI8/gQOKHP6VReJv3DkZg0hW0tWqeW6eWiQ4vjktZORbH9nQRpULzYXC6NL0m5zHYJDLW8Fqg3aAQs6p9KJkVMTRth70jXOFldqTEWH/xUQOVe70XpQGBMN4MT5C+boU2B3VaX8TxG8eWBo3Oti4eruOeerKlBTAUmQe2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtyE2j9/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766229772; x=1797765772;
  h=date:from:to:cc:subject:message-id;
  bh=cxDVasvlQrtBoyAM1tp80rhhG1voUrqT3y8R8hoa60Q=;
  b=VtyE2j9/259nFR6NfWXViHLKTeGSKTXaHPfQ8zoUNkBIdBshUMXL22oP
   Ktp/DwChffeGX19thRgMwMBfiDKxRE6CnELkQLKC1fUfUke+51vJGNhTz
   Iji6c1xI7/mWNlkBHEHw1Xd5jPnxYBN0Ywhsd6PNAKoGC3eNL4L35CV7D
   zb1siGK8hLuL3/jVnZayBBB5GYgqtLT/g83X5S9fSvPkYbVQOymNJB33z
   wEatTFF0c3ejndjJS5cHk6jStO+vzdVOIVqNnWe1GRUj5BzFpK2mL71M6
   BiEhMpJ1N/xpX1+Y7hy7fbhcH8QxuwzJN2w9/ZZh6SsakPAmYTFXqGWxp
   w==;
X-CSE-ConnectionGUID: zbNAWtmpQ3mBaS/gXHkZuQ==
X-CSE-MsgGUID: fzwZh16kSLqujXFZWRedLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68146368"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="68146368"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 03:22:51 -0800
X-CSE-ConnectionGUID: W7L4+IO7QmqbosSFJX3UIg==
X-CSE-MsgGUID: ZwGBjl8WQv+i5F3Oq1Stvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="236503921"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 03:22:51 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWv2u-000000004VJ-0IC5;
	Sat, 20 Dec 2025 11:22:48 +0000
Date: Sat, 20 Dec 2025 19:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 eeb2ea4b59df5fdcb697904fe6f49d5851543808
Message-ID: <202512201932.S8UjiaUm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: eeb2ea4b59df5fdcb697904fe6f49d5851543808  Input: ilitek_ts_i2c - switch mdelay() to fsleep()

elapsed time: 1757m

configs tested: 43
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.1.0
alpha        allyesconfig    gcc-15.1.0
arc           allnoconfig    gcc-15.1.0
arc          allyesconfig    gcc-15.1.0
arm           allnoconfig    clang-22
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.1.0
csky         allmodconfig    gcc-15.1.0
csky          allnoconfig    gcc-15.1.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-22
m68k         allmodconfig    gcc-15.1.0
m68k          allnoconfig    gcc-15.1.0
microblaze    allnoconfig    gcc-15.1.0
microblaze   allyesconfig    gcc-15.1.0
mips          allnoconfig    gcc-15.1.0
mips         allyesconfig    gcc-15.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.1.0
openrisc      allnoconfig    gcc-15.1.0
parisc        allnoconfig    gcc-15.1.0
powerpc       allnoconfig    gcc-15.1.0
riscv        allmodconfig    clang-22
riscv         allnoconfig    gcc-15.1.0
s390          allnoconfig    clang-22
sh           allmodconfig    gcc-15.1.0
sh            allnoconfig    gcc-15.1.0
sparc         allnoconfig    gcc-15.1.0
sparc64      allmodconfig    clang-22
um            allnoconfig    clang-22
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.1.0
xtensa       allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

