Return-Path: <linux-input+bounces-12706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C76ACD68E
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 05:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D837516C250
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 03:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A74C29A2;
	Wed,  4 Jun 2025 03:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CM+axMvK"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89819230D14
	for <linux-input@vger.kernel.org>; Wed,  4 Jun 2025 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749007689; cv=none; b=fAcFNU2yplfYsM8a6Es93KvtzPkzoiQp3u5sA+p5sYuz9tf0l5Sg0zvuMq5PQ00zFINQyYI5cHAU1NAg2TNM+RYUn4imwV64u+rNS3V9oZ9J0XOMh7ZcMraqjHcCZW4EACa5pzSHrFmS8bT9dAiEOsCy26wYorQY4MR2q5xPOho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749007689; c=relaxed/simple;
	bh=cO2jTZ5zglVcPVoTO9vhiU2UhDWNLTz0miWvv+6LB5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gDgpWemEZy9CPpgpPyXHAVGhLh4wEOezMI6smisuk4E8kUooYj1ec6nC90wMHOtd4iybucYn2uRyZQ5Au4AownbZYdXV9oW1UdO5fRdg7eLLLYsl+LghFpuWyYqtUqI9KGNWdT7cgmbywYvlApaF3WxPG8vrgLSlbji1dW2b1q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CM+axMvK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749007689; x=1780543689;
  h=date:from:to:cc:subject:message-id;
  bh=cO2jTZ5zglVcPVoTO9vhiU2UhDWNLTz0miWvv+6LB5o=;
  b=CM+axMvKjSzmx/5GMBqjWqUAb+WLE6FEtOAMFENa6XYsA6y+rtALyzFz
   Zw7OJKj2p5AtnaJTzvsdhUg1H1bT0QIMQXfp/3qu6xFGdAHEM+ylU6Wl8
   xOghi2Ln1AujYwvOqdW5LvvwS8a2LP48yR6Hb0Wr9kw1nbikOUWPrpWmP
   hCmlGntFwfBwHof0MOSyI4dbJEEh27RyceHFss1RR2sjVsMgNGerqfu4P
   t6MMDIVdBOVTmJkuQxoJNE1QxLL6n6BOxnRH1RKNpcSalKYbEX2NmU7xw
   EYkgPhQSFU1HCex3ZtvE676qN/rgn0fLCdTINNhr9g27Z9/68Nv8V873y
   Q==;
X-CSE-ConnectionGUID: iBdCQrr1QDuBUs+WhcDieg==
X-CSE-MsgGUID: huDYSWrjSMCf5HsNxG+a+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51214762"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="51214762"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 20:28:08 -0700
X-CSE-ConnectionGUID: /eH1cQ0JRKiNwY9zkKNe8g==
X-CSE-MsgGUID: ahB95p4CSjefNTN5E8qbiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="145070426"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2025 20:28:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMenM-0002rV-2z;
	Wed, 04 Jun 2025 03:28:04 +0000
Date: Wed, 04 Jun 2025 11:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 4f9786035f9e519db41375818e1d0b5f20da2f10
Message-ID: <202506041145.e1yytv4n-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 4f9786035f9e519db41375818e1d0b5f20da2f10  Merge branch 'next' into for-linus

elapsed time: 1455m

configs tested: 34
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

