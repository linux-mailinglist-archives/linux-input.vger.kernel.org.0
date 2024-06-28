Return-Path: <linux-input+bounces-4712-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8B91C8D6
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 00:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BAA41F25FBF
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 22:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7024F823D1;
	Fri, 28 Jun 2024 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPCUo1ca"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0509881AD7
	for <linux-input@vger.kernel.org>; Fri, 28 Jun 2024 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719611853; cv=none; b=bEBfHyOY+Jl9uu2wI1yrgF5WmZveyZIz/5LvW55+NC6KuH7sp3oV8pmoRqL9yHq1HwWRT5JVCCLf3YGZydUX2tlI5E40cfvgIjFl2zKRkOpmJls/1/AETw7vS7F8M526y7ksAwD+lkVV8nLyTvTKBcRtPQkhXFoDM1xDxhVlR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719611853; c=relaxed/simple;
	bh=8lmQluAEn9/C+7l8LeU/lyQvYutDHelbAbNy0MbJ82Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M/h36xCQuTBW39tqMvMWp0nu5gyPwW9wdDafA2IcHmr5qAIeLVOxTknqvHiLcTec1sX0HOM84R/XFlJ5QoY7nse9keZzmhp9EQbMUHnF8+j2Dx19DpFwcJszFSP/lDsATRDLnMPE/LMTftZ88c6TS2EWoL52OveYk9dfBLDFZRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPCUo1ca; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719611852; x=1751147852;
  h=date:from:to:cc:subject:message-id;
  bh=8lmQluAEn9/C+7l8LeU/lyQvYutDHelbAbNy0MbJ82Y=;
  b=MPCUo1caNwiyWVSKH+x7DeglW4gcjRhaFPxOB3h5vUhwmTjk4PLzYhfD
   cSo5tufWQfmudgBxzp8eMw1nTFBMteUDFpUiPrrKPF7mB6PAysp0zcW6T
   4fLsh4sLd/krX9dn60xtxpUHdZDXqK6Mq6Yjz/72UCw9K/T2KsA/dTPu5
   A6g1H93jz5Pph6iairu6hRdIWOLc4aMlModTL2j8BZsSMLgUu0Oip8K+t
   2RApX6SSDAWdkk8yuAIhNXGMoDgHr9mjJFpHcYlT9XdHIX6UfYq1BYNJi
   VrLQcxaQtFSqTSCjhuzOhojcPCsEPiiet+X+qN7i27xkLDZEB/85jdQ1d
   Q==;
X-CSE-ConnectionGUID: DwGXIzU6TTOfMyWxG9+LTw==
X-CSE-MsgGUID: YYx9RJEVQ9iqhL/hk9xgag==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16762694"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16762694"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 14:57:32 -0700
X-CSE-ConnectionGUID: PVNPKogGT2aHL9Njci80IA==
X-CSE-MsgGUID: ohv0RYRXQZGGGincr/2MAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="45280315"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jun 2024 14:57:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNJay-000IW6-1i;
	Fri, 28 Jun 2024 21:57:28 +0000
Date: Sat, 29 Jun 2024 05:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 866a5c7e2781cf1b019072288f1f5c64186dcb63
Message-ID: <202406290526.M1ZsWNCl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 866a5c7e2781cf1b019072288f1f5c64186dcb63  Input: qt1050 - handle CHIP_ID reading error

elapsed time: 4580m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240627   gcc-13.2.0
arc                   randconfig-002-20240627   gcc-13.2.0
arm                                 defconfig   clang-14
arm                   randconfig-001-20240627   gcc-13.2.0
arm                   randconfig-002-20240627   clang-19
arm                   randconfig-003-20240627   gcc-13.2.0
arm                   randconfig-004-20240627   clang-19
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240627   gcc-13.2.0
arm64                 randconfig-002-20240627   clang-19
arm64                 randconfig-003-20240627   clang-17
arm64                 randconfig-004-20240627   clang-19
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240627   gcc-13.2.0
csky                  randconfig-002-20240627   gcc-13.2.0
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240627   clang-17
hexagon               randconfig-002-20240627   clang-19
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240627   gcc-13.2.0
loongarch             randconfig-002-20240627   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240627   gcc-13.2.0
nios2                 randconfig-002-20240627   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240627   gcc-13.2.0
parisc                randconfig-002-20240627   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc               randconfig-001-20240627   gcc-13.2.0
powerpc               randconfig-002-20240627   clang-19
powerpc               randconfig-003-20240627   gcc-13.2.0
powerpc64             randconfig-001-20240627   gcc-13.2.0
powerpc64             randconfig-002-20240627   gcc-13.2.0
powerpc64             randconfig-003-20240627   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240627   gcc-13.2.0
riscv                 randconfig-002-20240627   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240627   clang-16
s390                  randconfig-002-20240627   clang-15
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240627   gcc-13.2.0
sh                    randconfig-002-20240627   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240627   gcc-13.2.0
sparc64               randconfig-002-20240627   gcc-13.2.0
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240627   clang-19
um                    randconfig-002-20240627   clang-19
um                           x86_64_defconfig   clang-15
xtensa                randconfig-001-20240627   gcc-13.2.0
xtensa                randconfig-002-20240627   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

