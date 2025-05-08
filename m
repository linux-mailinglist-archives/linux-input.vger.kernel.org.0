Return-Path: <linux-input+bounces-12224-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3399AAAF0EC
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 03:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A9539C0C5C
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 01:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC8E1E89C;
	Thu,  8 May 2025 01:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8s81iNN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD9A3C17
	for <linux-input@vger.kernel.org>; Thu,  8 May 2025 01:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746669475; cv=none; b=BYvwMxZYSJDs3eEB4HbIOqWFDFaRtxkfqQt76NQKrOjGE9d2qLYHOq3qA9eCvRnfc4pyt3T1QGzJCIRCCLi+OysScwDKLlPQpwkwlCZOYRTTWztHsoc6ZeEAj7Q7INRBBesNTmo6hhCOqjstqgaFlhqysh3vU/UxANP18jPhQ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746669475; c=relaxed/simple;
	bh=mRTtj0b9oSfKxiYg4yQsVqPSnulG7GkjynTL8ojoTMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UArggOtqY6AM+1pMj+pnDJ6L3HXA4iTbbhjZCU9ow1G/WTWUAibisgvUa6p0ufZGH65V0wy9O9xFIlIkza/uwlkem61r/TlqmLOCQIq24nKDHmndZZ4F/zepOiVWgKEI6Ug0zrImb+aRtmHv48sOO3tFvpctXBcG7R70ziCJPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8s81iNN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746669473; x=1778205473;
  h=date:from:to:cc:subject:message-id;
  bh=mRTtj0b9oSfKxiYg4yQsVqPSnulG7GkjynTL8ojoTMc=;
  b=W8s81iNNGIB2DViNCF+gk/+fA1x9/8RBpHyYgPSyBphRSdBdrmKlwPPj
   4jvH7D3EM2eVpWVmcldW5TLD9JdPrQo2mE3TFQFGD4CQ9aiv+lAy64Ex9
   EMJjBuE2aTJm2seMzANfNLtIxRwNk4ypq0+N9VG7c9YO6qOphwCST98s7
   N3ayeU6nHXRss7jjPlS5I2Y0POAMuz87jPwgtx9XgPn3++vdBhMlx3NZq
   /T5d6NP5HKi0Y/C6PuixQ76Z8OQUaxu7FNyH+xKjAUG9W76cOimAKPc1/
   HsG7xy3Ois6Xk91/3S8NVZP4VkFATvpJT8XaallwxJF+ZRQx7sVw3BKqb
   A==;
X-CSE-ConnectionGUID: qZeYRBXaR+Op6Mazkwj6YA==
X-CSE-MsgGUID: eEiSC066QDmbQXBS29WE5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="73817240"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="73817240"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 18:57:52 -0700
X-CSE-ConnectionGUID: SSaY/E4nQ7KWRB6+FXw8qQ==
X-CSE-MsgGUID: AkGFEsZ2R1aubmNOnQWMHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136633570"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 18:57:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCqWD-0009Fd-1t;
	Thu, 08 May 2025 01:57:49 +0000
Date: Thu, 08 May 2025 09:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 5d511d93c0c3d9cf0ad28708d2d945d61ea27f01
Message-ID: <202505080952.ouPxC4uh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 5d511d93c0c3d9cf0ad28708d2d945d61ea27f01  dt-bindings: input: touchscreen: edt-ft5x06: use unevaluatedProperties

elapsed time: 1783m

configs tested: 47
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-14.2.0
alpha       allyesconfig    gcc-14.2.0
arc         allmodconfig    gcc-14.2.0
arc          allnoconfig    gcc-14.2.0
arc         allyesconfig    gcc-14.2.0
arm         allmodconfig    gcc-14.2.0
arm          allnoconfig    clang-21
arm         allyesconfig    gcc-14.2.0
arm64       allmodconfig    clang-19
arm64        allnoconfig    gcc-14.2.0
csky         allnoconfig    gcc-14.2.0
hexagon     allmodconfig    clang-17
hexagon      allnoconfig    clang-21
hexagon     allyesconfig    clang-21
i386        allmodconfig    gcc-12
i386         allnoconfig    gcc-12
i386        allyesconfig    gcc-12
i386           defconfig    clang-20
loongarch   allmodconfig    gcc-14.2.0
loongarch    allnoconfig    gcc-14.2.0
m68k        allmodconfig    gcc-14.2.0
m68k         allnoconfig    gcc-14.2.0
m68k        allyesconfig    gcc-14.2.0
microblaze  allmodconfig    gcc-14.2.0
microblaze   allnoconfig    gcc-14.2.0
microblaze  allyesconfig    gcc-14.2.0
mips         allnoconfig    gcc-14.2.0
nios2        allnoconfig    gcc-14.2.0
openrisc     allnoconfig    gcc-14.2.0
parisc       allnoconfig    gcc-14.2.0
powerpc      allnoconfig    gcc-14.2.0
riscv        allnoconfig    gcc-14.2.0
s390        allmodconfig    clang-18
s390         allnoconfig    clang-21
s390        allyesconfig    gcc-14.2.0
sh          allmodconfig    gcc-14.2.0
sh           allnoconfig    gcc-14.2.0
sh          allyesconfig    gcc-14.2.0
sparc       allmodconfig    gcc-14.2.0
sparc        allnoconfig    gcc-14.2.0
um          allmodconfig    clang-19
um           allnoconfig    clang-21
um          allyesconfig    gcc-12
x86_64       allnoconfig    clang-20
x86_64      allyesconfig    clang-20
x86_64         defconfig    gcc-11
xtensa       allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

