Return-Path: <linux-input+bounces-4749-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C950291D8FE
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 09:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BB3B1F21D5A
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 07:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBC437142;
	Mon,  1 Jul 2024 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYT8YMNV"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328641EB21
	for <linux-input@vger.kernel.org>; Mon,  1 Jul 2024 07:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819191; cv=none; b=AWy283zzGIgiyPpkkbWp43d294vo9TQ4CAT3wAeUWf+F53lOl2sAEjEWzf8VABU39tyWxoLYA0VmdvyV5KUA0jfz/Urhwtjm+YgqJcKGTV0A3MOPkgMwEtozTuAgQruVgfKO1mEu0dRlFuN1lA+CeLep5EJGBYzkiU1eMv8fqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819191; c=relaxed/simple;
	bh=7Qmr0PgJ9DTOKD9sl3USdB7bnm5hVyHwmwSPijQRYuI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QkJWh/ZNFezzF8PLsikvEGAx/YGJ8HsgQwptNTbSKCcipGEJsdlXhFtE021r/4VTFUXz3BFbqwvL9WT0lAQm/s73oUH9YUYi4UkrD4FVBCu6EEHcJovwyuRz4VRCe9tjdawh6Ot22a90WpkXb3yR1EbijUV8h3bXkVLslMG2dLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYT8YMNV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719819189; x=1751355189;
  h=date:from:to:cc:subject:message-id;
  bh=7Qmr0PgJ9DTOKD9sl3USdB7bnm5hVyHwmwSPijQRYuI=;
  b=lYT8YMNVps/n9bR6n84Yq63K6aK+bQ0K8iabhXUyXHwbRTlT0J2WSWu4
   /mdIPGGaKNW3uKc2lsAPwG0mmk7pXhDR/ziSQyLkL61V2nYOmT6u0/iJJ
   X51yIfZw3g4JApn15BzUS6LX/TdfgFxpWPOeb9L+Zw5Bzo2ICT/9BbcJX
   Oet7Yyd8ybOeJzljkNw1zIUFGdgOeBQXiflKC4iYfmrvnPxqWD3S1iSLo
   Ni+S8gzdE4xk0MXTSrrf9DwyHfxvW/dL6/75dnmuo7Vaok/pqhF4MBKTq
   C3Q3ftJXwpeUyFZa65a0l9QmMkpuhQyqMvc8sjbolIkFwJyHQMPCbkZ2O
   A==;
X-CSE-ConnectionGUID: wWUehqIxQxmXyZAp9OdDSA==
X-CSE-MsgGUID: qZHJRAn0TU+6espfrCEntg==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="19826213"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="19826213"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 00:32:58 -0700
X-CSE-ConnectionGUID: cp6PCy4qTGCgnlAgQL5sWg==
X-CSE-MsgGUID: FKLSl27fQiWN7AYjyOyBsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="46168441"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jul 2024 00:32:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOBWv-000MYg-2l;
	Mon, 01 Jul 2024 07:32:53 +0000
Date: Mon, 01 Jul 2024 15:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 7c7b1be19b228b450c2945ec379d7fc6bfef9852
Message-ID: <202407011558.sSGUGP8L-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 7c7b1be19b228b450c2945ec379d7fc6bfef9852  Input: ads7846 - use spi_device_id table

elapsed time: 15345m

configs tested: 62
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                           tegra_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                          rv32_defconfig   clang-19
s390                             allmodconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                               j2_defconfig   gcc-13.2.0
sh                          polaris_defconfig   gcc-13.2.0
sh                           se7712_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allyesconfig   gcc-13
um                             i386_defconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-15
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

