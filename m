Return-Path: <linux-input+bounces-8236-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA59D8E74
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 23:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CA16B24C74
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 22:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7F017F4F6;
	Mon, 25 Nov 2024 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vu2G9HUU"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542BF156F3A
	for <linux-input@vger.kernel.org>; Mon, 25 Nov 2024 22:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732573312; cv=none; b=j3PwrzK6Y7qK0eQg74RHjS2TlVSfmyfMSw2oTokmUgJbyKxOrVjPewHC30ojwNximY+WDc/baPc1Z1pyD6TKRUMRAEeg6bZZsNFn38TJx/6AAtb9tAMRq58Zt2yc6AtcowebHbD0AJScrDyC4fLuMF2ZovPJT4wQtuReak5bfUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732573312; c=relaxed/simple;
	bh=TclIfZ31ioyCaHFkYeRPdYi6zyzYQVrieh+aUgAVEAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EohoVMkuv39cOsX2Z4ldK2TrZlaqBzRf5ezgEJmefP4SSzGwHBD0StL/dxmUt7weNIarpqmpSYozDN6lvBIw5lZcnkjrpPoaXi81rdYUUkR0kUNhmYvIi4OVDMGWhZg2kEn+PhD3CMnWqtDmEcKjTDKLs7e93oQDV10H/qP0YYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vu2G9HUU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732573310; x=1764109310;
  h=date:from:to:cc:subject:message-id;
  bh=TclIfZ31ioyCaHFkYeRPdYi6zyzYQVrieh+aUgAVEAY=;
  b=Vu2G9HUU9e5nMtjvOfI/DhpZOK7RBxxxTzlTJlsrGH2eWPDof4uwRQai
   46himMsfFMTDZGzhdfYjQA2wUnOkl31FOdfeTOLFTgi2tXhAMwmH+YPIV
   Fw3BxQNFiZRgT3QO19V585Wa00jIvvHS9wYXBbIAUr9GhOiDSh5005w4x
   D3Fh3BsCkDFdfc5b8clqO8kkUBMKveAec9d8F+9NecjQvwgSIOly6a4oU
   C0aPt8Tv+63xzYo7RRMO4yPgDNIUnFIHkPa16O5RuRAeDfZinDGD3TXp6
   HaH+dzLZ+FPWcwpxi1fuY8LvVPBKcLnbGJ3Iqw+ejzDmG1pLmoO0r41ch
   Q==;
X-CSE-ConnectionGUID: o8+SnGnnTm+jyKmJeIqlaQ==
X-CSE-MsgGUID: tXp0t6VYRi+7ZzmRyXQbmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36488887"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="36488887"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 14:21:47 -0800
X-CSE-ConnectionGUID: AYuiyf8MQr6tK9rZArwyzQ==
X-CSE-MsgGUID: hSg9inNOT+C2w0ibItUPQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="91538340"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2024 14:21:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFhSh-0006qR-0g;
	Mon, 25 Nov 2024 22:21:43 +0000
Date: Tue, 26 Nov 2024 06:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 0201710ba6308a61f1a775c418fe74b8a31ace08
Message-ID: <202411260619.UHmPZF8C-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 0201710ba6308a61f1a775c418fe74b8a31ace08  Merge branch 'next' into for-linus

elapsed time: 1198m

configs tested: 214
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    clang-20
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              alldefconfig    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                         assabet_defconfig    clang-20
arm                         at91_dt_defconfig    clang-20
arm                            dove_defconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-20
arm                      footbridge_defconfig    clang-16
arm                      footbridge_defconfig    clang-20
arm                           h3600_defconfig    clang-16
arm                       imx_v4_v5_defconfig    gcc-14.2.0
arm                      integrator_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-16
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                             mxs_defconfig    gcc-14.2.0
arm                          pxa168_defconfig    clang-20
arm                         s3c6400_defconfig    gcc-14.2.0
arm                           sama7_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
csky                             alldefconfig    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241125    gcc-12
i386        buildonly-randconfig-002-20241125    gcc-12
i386        buildonly-randconfig-003-20241125    gcc-12
i386        buildonly-randconfig-004-20241125    gcc-12
i386        buildonly-randconfig-005-20241125    gcc-12
i386        buildonly-randconfig-006-20241125    gcc-12
i386                  randconfig-001-20241125    gcc-12
i386                  randconfig-002-20241125    gcc-12
i386                  randconfig-003-20241125    gcc-12
i386                  randconfig-004-20241125    gcc-12
i386                  randconfig-005-20241125    gcc-12
i386                  randconfig-006-20241125    gcc-12
i386                  randconfig-011-20241125    gcc-12
i386                  randconfig-012-20241125    gcc-12
i386                  randconfig-013-20241125    gcc-12
i386                  randconfig-014-20241125    gcc-12
i386                  randconfig-015-20241125    gcc-12
i386                  randconfig-016-20241125    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-16
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-13.2.0
mips                          ath79_defconfig    gcc-13.2.0
mips                        bcm47xx_defconfig    clang-20
mips                        bcm63xx_defconfig    gcc-12
mips                         db1xxx_defconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                           jazz_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
mips                       rbtx49xx_defconfig    clang-20
mips                         rt305x_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    clang-20
nios2                            allmodconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                            allyesconfig    gcc-14.2.0
openrisc                         allmodconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-20
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    clang-20
powerpc                   lite5200b_defconfig    clang-14
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-20
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-20
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-13.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-13.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    clang-20
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7724_defconfig    clang-20
sh                           se7751_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    clang-16
sh                             sh03_defconfig    clang-20
sh                             sh03_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                             shx3_defconfig    clang-20
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                             i386_defconfig    gcc-12
x86_64      buildonly-randconfig-001-20241125    gcc-12
x86_64      buildonly-randconfig-002-20241125    gcc-12
x86_64      buildonly-randconfig-003-20241125    gcc-12
x86_64      buildonly-randconfig-004-20241125    gcc-12
x86_64      buildonly-randconfig-005-20241125    gcc-12
x86_64      buildonly-randconfig-006-20241125    gcc-12
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241125    gcc-12
x86_64                randconfig-002-20241125    gcc-12
x86_64                randconfig-003-20241125    gcc-12
x86_64                randconfig-004-20241125    gcc-12
x86_64                randconfig-005-20241125    gcc-12
x86_64                randconfig-006-20241125    gcc-12
x86_64                randconfig-011-20241125    gcc-12
x86_64                randconfig-012-20241125    gcc-12
x86_64                randconfig-013-20241125    gcc-12
x86_64                randconfig-014-20241125    gcc-12
x86_64                randconfig-015-20241125    gcc-12
x86_64                randconfig-016-20241125    gcc-12
x86_64                randconfig-071-20241125    gcc-12
x86_64                randconfig-072-20241125    gcc-12
x86_64                randconfig-073-20241125    gcc-12
x86_64                randconfig-074-20241125    gcc-12
x86_64                randconfig-075-20241125    gcc-12
x86_64                randconfig-076-20241125    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

