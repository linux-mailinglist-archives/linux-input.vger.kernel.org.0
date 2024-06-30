Return-Path: <linux-input+bounces-4738-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1172991D4A7
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 00:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 892E81F21188
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 22:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5194D8C0;
	Sun, 30 Jun 2024 22:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tep1209S"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64048F72
	for <linux-input@vger.kernel.org>; Sun, 30 Jun 2024 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719787575; cv=none; b=JH9Go/5if82Fcul4G3vfucur8IFE3M0w1QFQey+5+T4OVnKT86dmF6i591UP9crMASrRMgH8kU60KZDoxcdFAQtL/ONTF33Y2Wy027b9SZUa53jbQlA6QxvoqXBRzmdyKvaD6kixy1cHs8TMMB3YQ+QsXu4xUEWwH12HT252o0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719787575; c=relaxed/simple;
	bh=mDdlZtJQxAfs5R9Xsqoppgl4GbqR/sIbUROalegVY8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=idwklUAUEArmeZhpVK1ss7+EVORU4xkz5Yx+aDhr7KkbmCvsEGrRO81jFNF9iBQ5ZWzRIxwlHkBlanw5K39v1jBcY5ZYMZGHGB+4PbIkMF0hJJIuAoERdbvsJycH/3eaI8GOaDfqy9l1h31lKOtF0YjentyY7qs1lJ6/fEmpntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tep1209S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719787574; x=1751323574;
  h=date:from:to:cc:subject:message-id;
  bh=mDdlZtJQxAfs5R9Xsqoppgl4GbqR/sIbUROalegVY8U=;
  b=Tep1209S8gkwb9RB6IXWZD+jIM0PFasqfXw4X89s6FAnG4Mz1RRut1VJ
   2cMXUZLf8rIaeFEjKH6RB3ojUl/5ipsjwKYxeKSKbDO2dDVWbFZrlp3GF
   uqcYhtPtLTpRnqXpYYnlHh/CQvQMSnTbGEdWQob4djCm8Qi1Oz7mVSLDs
   4ZfSEjZvf/U/J13zNe6mEesr8O/f3WUsg2XAvAfGzODtLyQ4vs97kJLE9
   So6wGcrrM8nRjQs6LNoJmrLac5eSVb/vutDkG0+d7TnepLxbF5oStIeq1
   5pEj0mBjU8W33PnWsKYvH9TRp8p2m/IkHCBezoht8P0iE4mZObZRXgcE8
   Q==;
X-CSE-ConnectionGUID: tDgIv3o0R1qz0tNNDKbHbg==
X-CSE-MsgGUID: eQSJBru3TCuoAFBLxaehfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="17022404"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="17022404"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 15:46:13 -0700
X-CSE-ConnectionGUID: m+F6S6LcSyGyY/nXX85YrQ==
X-CSE-MsgGUID: dxpXiG28THexiwLWxnkPsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="50264998"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jun 2024 15:46:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sO3JB-000M6N-2S;
	Sun, 30 Jun 2024 22:46:09 +0000
Date: Mon, 01 Jul 2024 06:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 7c459517252ebbad515a0b6f972454962ca549e2
Message-ID: <202407010610.85vJCFrR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 7c459517252ebbad515a0b6f972454962ca549e2  Input: ili210x - use guard notation when disabling and reenabling IRQ

elapsed time: 2880m

configs tested: 78
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240701   gcc-13.2.0
arc                   randconfig-002-20240701   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                   randconfig-001-20240701   gcc-13.2.0
arm                   randconfig-002-20240701   gcc-13.2.0
arm                   randconfig-003-20240701   clang-19
arm                   randconfig-004-20240701   clang-15
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240701   gcc-13.2.0
arm64                 randconfig-002-20240701   clang-19
arm64                 randconfig-003-20240701   gcc-13.2.0
arm64                 randconfig-004-20240701   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240701   gcc-13.2.0
csky                  randconfig-002-20240701   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon               randconfig-001-20240701   clang-19
i386         buildonly-randconfig-001-20240629   gcc-7
i386         buildonly-randconfig-001-20240630   clang-18
i386         buildonly-randconfig-002-20240629   clang-18
i386         buildonly-randconfig-002-20240630   clang-18
i386         buildonly-randconfig-003-20240629   clang-18
i386         buildonly-randconfig-003-20240630   clang-18
i386         buildonly-randconfig-004-20240629   gcc-13
i386         buildonly-randconfig-004-20240630   clang-18
i386         buildonly-randconfig-004-20240630   gcc-7
i386         buildonly-randconfig-005-20240629   gcc-13
i386         buildonly-randconfig-005-20240630   clang-18
i386         buildonly-randconfig-006-20240629   clang-18
i386         buildonly-randconfig-006-20240630   clang-18
i386         buildonly-randconfig-006-20240630   gcc-13
i386                  randconfig-001-20240629   clang-18
i386                  randconfig-001-20240630   clang-18
i386                  randconfig-001-20240630   gcc-13
i386                  randconfig-002-20240629   gcc-9
i386                  randconfig-002-20240630   clang-18
i386                  randconfig-002-20240630   gcc-13
i386                  randconfig-003-20240629   clang-18
i386                  randconfig-003-20240630   clang-18
i386                  randconfig-004-20240629   gcc-9
i386                  randconfig-004-20240630   clang-18
i386                  randconfig-004-20240630   gcc-13
i386                  randconfig-005-20240629   gcc-13
i386                  randconfig-005-20240630   clang-18
i386                  randconfig-006-20240629   clang-18
i386                  randconfig-006-20240630   clang-18
i386                  randconfig-011-20240629   gcc-13
i386                  randconfig-011-20240630   clang-18
i386                  randconfig-011-20240630   gcc-13
i386                  randconfig-012-20240629   clang-18
i386                  randconfig-012-20240630   clang-18
i386                  randconfig-013-20240629   gcc-12
i386                  randconfig-013-20240630   clang-18
i386                  randconfig-013-20240630   gcc-8
i386                  randconfig-014-20240629   gcc-13
i386                  randconfig-014-20240630   clang-18
i386                  randconfig-014-20240630   gcc-8
i386                  randconfig-015-20240629   gcc-12
i386                  randconfig-015-20240630   clang-18
i386                  randconfig-015-20240630   gcc-10
i386                  randconfig-016-20240629   gcc-13
i386                  randconfig-016-20240630   clang-18
i386                  randconfig-016-20240630   gcc-13
loongarch                         allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

