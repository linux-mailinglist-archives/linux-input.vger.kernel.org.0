Return-Path: <linux-input+bounces-4571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD4F913985
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 12:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20AD11C20C3A
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 10:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA577442F;
	Sun, 23 Jun 2024 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eq45bLc6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE763D
	for <linux-input@vger.kernel.org>; Sun, 23 Jun 2024 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719138416; cv=none; b=OV8SM9j+xkbLZTBET6GLGQaO6MiPZXUflXRU/faQn8s6YNQJufRPuu+oITjd9Tr1vkRyqm1Mv150/Px3MgH6Iqx7MVYujbozNSDJ0UIkbyFWiDtX3Vcg+/QLhoPLP3IMLED8T7GD+tmpoZz0SlXyN9WcokgsG8+Ogdz9Qi0a2Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719138416; c=relaxed/simple;
	bh=fruz0eC7yQg12ddj8ijxHNMd/I0fhjsOD+N03K5fjCA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hswbGpXFGDWViOJ1E0dqYuSIT2v5FBmKULAdF8AYOcQBScCmXiPQaxTvjkZOzRQhMMJFmr0/uKZZS1h1Akm04wOUuCGl+aFm1FRSWtRg9th0XMF0C4pdY9vbMoKpmV/3XnpAVxMHR0knVxv/dJOMrh/7IuQDJV2E7zWVExYrARc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eq45bLc6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719138414; x=1750674414;
  h=date:from:to:cc:subject:message-id;
  bh=fruz0eC7yQg12ddj8ijxHNMd/I0fhjsOD+N03K5fjCA=;
  b=Eq45bLc6Q8LReHFTvzyOfMBags6pNfWW5uqTAlwdLgUgUS/Eb26SfgEc
   3Ipu6cJ8R43/Z8fTjRSMeXIejjnzdHz1qThFOWlRatl+XCpaxf9w1Jvb1
   2QH57WwXMjY1l4po7RA9qF9yXz4p5OHz8X6jCJzSacTGWj9SxOknfK+Ll
   du3Jeuk/BHTo1nxEH5Tb3r3FVEKsh1iltR0+fs2AlaYVz2XUvJYzBRgJZ
   ZoyFDQfHsY0daa4clUC2EuqhvYYNzPFANZwRAiIoaJU4DX6WhmF8MMCZV
   2ldE+eefnCOEp4wiiyHPByBa5uzxdr6qVOCt+Or4H7CpSlYyEPtd96VLI
   w==;
X-CSE-ConnectionGUID: npT1A+PDR76nJmi/2DX5Yg==
X-CSE-MsgGUID: tvM5XdzIS7CcFPQGkhhnng==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="15997218"
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="15997218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 03:26:53 -0700
X-CSE-ConnectionGUID: 91MOxHrDSoWoBiQC+qPTXw==
X-CSE-MsgGUID: xSIbYliZSyqoZ1Tw/wwt4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="43715737"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jun 2024 03:26:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLKQs-000ARM-0D;
	Sun, 23 Jun 2024 10:26:50 +0000
Date: Sun, 23 Jun 2024 18:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 0ca1323c6aba8fd9309ca33a4bf57c1c9fc06171
Message-ID: <202406231822.T8da4rKw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 0ca1323c6aba8fd9309ca33a4bf57c1c9fc06171  Input: edt-ft5x06 - add ft5426

elapsed time: 1520m

configs tested: 80
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240623   gcc-13.2.0
arc                   randconfig-002-20240623   gcc-13.2.0
arm                   randconfig-001-20240623   gcc-13.2.0
arm                   randconfig-002-20240623   gcc-13.2.0
arm                   randconfig-003-20240623   gcc-13.2.0
arm                   randconfig-004-20240623   gcc-13.2.0
arm64                 randconfig-001-20240623   clang-15
arm64                 randconfig-002-20240623   clang-19
arm64                 randconfig-003-20240623   clang-19
arm64                 randconfig-004-20240623   clang-19
csky                  randconfig-001-20240623   gcc-13.2.0
csky                  randconfig-002-20240623   gcc-13.2.0
hexagon               randconfig-001-20240623   clang-19
hexagon               randconfig-002-20240623   clang-19
i386         buildonly-randconfig-001-20240622   gcc-13
i386         buildonly-randconfig-002-20240622   clang-18
i386         buildonly-randconfig-003-20240622   clang-18
i386         buildonly-randconfig-004-20240622   gcc-13
i386         buildonly-randconfig-005-20240622   gcc-13
i386         buildonly-randconfig-006-20240622   clang-18
i386                  randconfig-001-20240622   gcc-10
i386                  randconfig-002-20240622   clang-18
i386                  randconfig-003-20240622   gcc-13
i386                  randconfig-004-20240622   gcc-13
i386                  randconfig-005-20240622   clang-18
i386                  randconfig-006-20240622   gcc-13
i386                  randconfig-011-20240622   gcc-9
i386                  randconfig-012-20240622   gcc-7
i386                  randconfig-013-20240622   clang-18
i386                  randconfig-014-20240622   clang-18
i386                  randconfig-015-20240622   clang-18
i386                  randconfig-016-20240622   clang-18
loongarch             randconfig-001-20240623   gcc-13.2.0
loongarch             randconfig-002-20240623   gcc-13.2.0
nios2                 randconfig-001-20240623   gcc-13.2.0
nios2                 randconfig-002-20240623   gcc-13.2.0
parisc                randconfig-001-20240623   gcc-13.2.0
parisc                randconfig-002-20240623   gcc-13.2.0
powerpc               randconfig-001-20240623   gcc-13.2.0
powerpc               randconfig-002-20240623   clang-15
powerpc               randconfig-003-20240623   clang-19
powerpc64             randconfig-001-20240623   gcc-13.2.0
powerpc64             randconfig-002-20240623   clang-19
powerpc64             randconfig-003-20240623   gcc-13.2.0
riscv                 randconfig-001-20240623   clang-19
riscv                 randconfig-002-20240623   clang-19
s390                  randconfig-001-20240623   gcc-13.2.0
s390                  randconfig-002-20240623   gcc-13.2.0
sh                    randconfig-001-20240623   gcc-13.2.0
sh                    randconfig-002-20240623   gcc-13.2.0
sparc64               randconfig-001-20240623   gcc-13.2.0
sparc64               randconfig-002-20240623   gcc-13.2.0
um                    randconfig-001-20240623   gcc-7
um                    randconfig-002-20240623   clang-19
x86_64       buildonly-randconfig-001-20240623   clang-18
x86_64       buildonly-randconfig-002-20240623   clang-18
x86_64       buildonly-randconfig-003-20240623   clang-18
x86_64       buildonly-randconfig-004-20240623   clang-18
x86_64       buildonly-randconfig-005-20240623   clang-18
x86_64       buildonly-randconfig-006-20240623   clang-18
x86_64                randconfig-001-20240623   gcc-13
x86_64                randconfig-002-20240623   gcc-13
x86_64                randconfig-003-20240623   clang-18
x86_64                randconfig-004-20240623   gcc-13
x86_64                randconfig-005-20240623   gcc-8
x86_64                randconfig-006-20240623   clang-18
x86_64                randconfig-011-20240623   clang-18
x86_64                randconfig-012-20240623   gcc-13
x86_64                randconfig-013-20240623   clang-18
x86_64                randconfig-014-20240623   clang-18
x86_64                randconfig-015-20240623   gcc-13
x86_64                randconfig-016-20240623   clang-18
x86_64                randconfig-071-20240623   gcc-13
x86_64                randconfig-072-20240623   gcc-13
x86_64                randconfig-073-20240623   clang-18
x86_64                randconfig-074-20240623   clang-18
x86_64                randconfig-075-20240623   gcc-13
x86_64                randconfig-076-20240623   clang-18
xtensa                randconfig-001-20240623   gcc-13.2.0
xtensa                randconfig-002-20240623   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

