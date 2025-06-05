Return-Path: <linux-input+bounces-12717-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE1CACE923
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 07:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19DBA173876
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 05:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B04E24B26;
	Thu,  5 Jun 2025 05:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbvDhjNu"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D41AF4D5
	for <linux-input@vger.kernel.org>; Thu,  5 Jun 2025 05:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749099859; cv=none; b=AxLdyAT4p+83eGhfUO+KmkltjOdAbFlQ3meWMJLJgz12GP26mYp4ZXPc7+vZzGI9bBYG109rnB7rJj3g63UPkJqxVkOhisSR7swmzMv80vcq7Wa+sZ1OmyM0nYjYOs7kkJK6pqEwKry+9yBu+B861239g4CkWFXB169HmagtJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749099859; c=relaxed/simple;
	bh=7hActEdiBgbxMqIrPf0vpSO9dMSV0YHd34tTwwoRm5I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fX3cvueNmOcZkqhduWa2avPIc/fZInmiXUISLeQc8JtyPG/cLWL8gx7brAV5ePPHaKUBM5EUUHED15rtTCj4kMpnwgjyIBWWM0Ag+d6OKRBJwsWyhwrAqz8kKd3yD82Yc7JXOuAZUcKDA/sBpRxT6fSfUF+C9MS3IgKojUnrWe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbvDhjNu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749099858; x=1780635858;
  h=date:from:to:cc:subject:message-id;
  bh=7hActEdiBgbxMqIrPf0vpSO9dMSV0YHd34tTwwoRm5I=;
  b=GbvDhjNuozc9kAy8PuZH4ZbCq2ZyXQTFUSdqvbnBYhXELi3mKyloqnS9
   Dq35+lZiSzfmoTXaNwavx+f4kqaERN+aZ1g0WGSRLj4//gB80fiJdPFY3
   0X7l/ZV7oSywpNZKXkfWjxhka2rygj4VUqbV12HyjSdRna/V3CTPwLYjC
   SODmBtQrPRDLW78xIaNXTLO913J1RO2Q1vI5RTFfxHACCIUfNx4h4MsOn
   TxHbuJXgtGh6FAYAnrP7506KEQFomH3iu4wdoufXJ9wtY0fPvHP98V88H
   cZFeN0rj/QkA+97BsvAeX+bBqCHHJzt6NyOgpI2whLEgIQ3srY3+iEdbP
   w==;
X-CSE-ConnectionGUID: 70VtpVLpSiuZ6tfmuA6Csg==
X-CSE-MsgGUID: X5fEOGBrScKAR+dsTMjT9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61871654"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="61871654"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 22:04:17 -0700
X-CSE-ConnectionGUID: AWlQJra3RzSkjdFOlRUNxA==
X-CSE-MsgGUID: Du6WPHVpTZekRhPNejRW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="145352991"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 22:04:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN2lw-0003jw-2v;
	Thu, 05 Jun 2025 05:04:12 +0000
Date: Thu, 05 Jun 2025 13:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 805f5bbaa507a7e15333ad7bb34d517251de4eb9
Message-ID: <202506051328.BtN1oD6R-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 805f5bbaa507a7e15333ad7bb34d517251de4eb9  Input: psmouse - switch to use scnprintf() to suppress truncation warning

elapsed time: 1433m

configs tested: 35
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allyesconfig    gcc-15.1.0
arc          allmodconfig    gcc-15.1.0
arc          allyesconfig    gcc-15.1.0
arm          allmodconfig    gcc-15.1.0
arm          allyesconfig    gcc-15.1.0
arm64        allmodconfig    clang-19
hexagon      allmodconfig    clang-17
hexagon      allyesconfig    clang-21
i386         allmodconfig    gcc-12
i386          allnoconfig    gcc-12
i386         allyesconfig    gcc-12
i386            defconfig    clang-20
loongarch    allmodconfig    gcc-15.1.0
m68k         allmodconfig    gcc-15.1.0
m68k         allyesconfig    gcc-15.1.0
microblaze   allmodconfig    gcc-15.1.0
microblaze   allyesconfig    gcc-15.1.0
openrisc     allyesconfig    gcc-15.1.0
parisc       allmodconfig    gcc-15.1.0
parisc       allyesconfig    gcc-15.1.0
powerpc      allmodconfig    gcc-15.1.0
powerpc      allyesconfig    clang-21
riscv        allmodconfig    clang-21
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390         allyesconfig    gcc-15.1.0
sh           allmodconfig    gcc-15.1.0
sh           allyesconfig    gcc-15.1.0
sparc        allmodconfig    gcc-15.1.0
um           allmodconfig    clang-19
um           allyesconfig    gcc-12
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64          defconfig    gcc-11
x86_64      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

