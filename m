Return-Path: <linux-input+bounces-4349-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08982907D97
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 22:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EB201F23815
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 20:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6CF13B58A;
	Thu, 13 Jun 2024 20:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlEiq2Gi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD5713A3F7;
	Thu, 13 Jun 2024 20:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718311459; cv=none; b=AVjzws/Kjx9N3B4w4j/aDvITFkq2obiw8KP6u2Rl+cj3/NoyAKvZOn+xKCfQBhSCn9tfaGDil1Hu7wZcqOxr7gf/0+i2YMiBZePUj6lAI7nOPL04nnt828Wj4mrei0jMV/FF232Za88vj4iWlVPlmA5Ey8bsvvj3RGDPADMKeFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718311459; c=relaxed/simple;
	bh=ZMQKAiTTpNPcqkOMQfaPtk/alrNE490xzzeqLwEYsn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5ldYVruwKzW+UVA765lU4fd4Isu4ZJeu3kjZLZsM5JC48h62PCtOkvZ3DWdURZjUFbrsZIPdnqck+whadxmNuTdkcN7NCU8EFLooDf1UCXluxfYQ392+Z74DgIrsp6Kb3R4nFiP8S8cNarZp/hD/2ej1aRKgXZ23zpPjwwaEqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlEiq2Gi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718311458; x=1749847458;
  h=date:from:to:cc:subject:message-id;
  bh=ZMQKAiTTpNPcqkOMQfaPtk/alrNE490xzzeqLwEYsn8=;
  b=jlEiq2GiP+5Bmu7LykexDtOKDNRwfMf/fxOsYNbbHmNKXr3Ceol2CujV
   fhF8ZxUtruyW4cw5eH0occkz4qv6bguUe/u0MbaKZVYHnyXcH2OLOb1Ce
   37Te8ACqzK1NnkHD7KkIEuoEbZHcUhVWE1DyIEyc7LBoF+McBmeLn2Cbz
   jnaGo6Cy9xJGsv0uZkFzgiF/pga/M9oW1pSCDrbLEIYsAn92a/dXJXtWG
   7hoXYeXEzcsQ1uMVKhwlSP/4/X2as72waeKxUl0rbK0sx8nW4yeiCPPTb
   VOm2QkAVMUt9lsrWEJwd3CPO+E0psv3RZaLaAgUxeV5+bGm1NShlcVSOi
   g==;
X-CSE-ConnectionGUID: TO40xztoTDuo7rcQIXSTDg==
X-CSE-MsgGUID: YalWd+l9R76Ei5DRMdv95g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25806144"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="25806144"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 13:44:17 -0700
X-CSE-ConnectionGUID: C2pUUIfnT3SOkXrCcqbbSA==
X-CSE-MsgGUID: Wi5wMx8DRcWe/bW7266bKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="77737919"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jun 2024 13:44:14 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHrIp-0000OC-15;
	Thu, 13 Jun 2024 20:44:11 +0000
Date: Fri, 14 Jun 2024 04:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: [linux-next:master] BUILD REGRESSION
 6906a84c482f098d31486df8dc98cead21cce2d0
Message-ID: <202406140411.4qyUCuPF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 6906a84c482f098d31486df8dc98cead21cce2d0  Add linux-next specific files for 20240613

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406131636.cCrcJztc-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/hwmon/pmbus/mp9941.c:60:33: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/hwmon/pmbus/mp9941.c:60:40: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
drivers/hwmon/pmbus/mp9941.c:84:13: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
drivers/hwmon/pmbus/mp9941.c:84:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
security/integrity/ima/ima_policy.c:430:10: error: too many arguments to function call, expected 4, have 5

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- arc-allmodconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- arc-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- arm64-randconfig-001-20240613
|   `-- drivers-pinctrl-pinctrl-keembay.c:error:struct-function_desc-has-no-member-named-name
|-- csky-allmodconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- csky-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-hubbub-dcn401-dcn401_hubbub.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|   `-- drivers-thermal-thermal_trip.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|-- m68k-allmodconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- m68k-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- microblaze-allmodconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- microblaze-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- nios2-allmodconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- nios2-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- openrisc-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- parisc-allmodconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- parisc-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- sh-allmodconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- sh-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- sparc-allmodconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- sparc64-allmodconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- sparc64-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
|-- x86_64-buildonly-randconfig-002-20240613
|   |-- drivers-input-touchscreen-wacom_w8001.c:warning:Finger-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- drivers-input-touchscreen-wacom_w8001.c:warning:Pen-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- x86_64-randconfig-011-20240613
|   |-- drivers-input-touchscreen-wacom_w8001.c:warning:Finger-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- drivers-input-touchscreen-wacom_w8001.c:warning:Pen-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
`-- xtensa-allyesconfig
    |-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_GET
    `-- drivers-hwmon-pmbus-mp9941.c:error:implicit-declaration-of-function-FIELD_PREP
clang_recent_errors
|-- arm-randconfig-051-20240613
|   |-- arch-arm-boot-dts-rockchip-rk3128-evb.dtb:dsi:failed-to-match-any-schema-with-compatible:rockchip-rk3128-mipi-dsi-snps-dw-mipi-dsi
|   `-- arch-arm-boot-dts-rockchip-rk3128-xpi-.dtb:dsi:failed-to-match-any-schema-with-compatible:rockchip-rk3128-mipi-dsi-snps-dw-mipi-dsi
|-- arm64-allmodconfig
|   `-- drivers-pinctrl-pinctrl-keembay.c:error:no-member-named-name-in-struct-function_desc
|-- arm64-randconfig-003-20240613
|   `-- drivers-pinctrl-pinctrl-keembay.c:error:no-member-named-name-in-struct-function_desc
|-- hexagon-allyesconfig
|   |-- drivers-hwmon-pmbus-mp9941.c:error:call-to-undeclared-function-FIELD_GET-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-hwmon-pmbus-mp9941.c:error:call-to-undeclared-function-FIELD_PREP-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- i386-buildonly-randconfig-004-20240613
|   `-- security-integrity-ima-ima_policy.c:error:too-many-arguments-to-function-call-expected-have
`-- powerpc64-randconfig-001-20240613
    `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration

elapsed time: 940m

configs tested: 179
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240613   gcc-13.2.0
arc                   randconfig-002-20240613   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   clang-14
arm                   randconfig-001-20240613   gcc-13.2.0
arm                   randconfig-002-20240613   clang-17
arm                   randconfig-003-20240613   clang-19
arm                   randconfig-004-20240613   clang-19
arm                         s5pv210_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240613   gcc-13.2.0
arm64                 randconfig-002-20240613   clang-19
arm64                 randconfig-003-20240613   clang-19
arm64                 randconfig-004-20240613   clang-19
csky                             allmodconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                             allyesconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240613   gcc-13.2.0
csky                  randconfig-002-20240613   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240613   clang-19
hexagon               randconfig-002-20240613   clang-15
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240613   gcc-9
i386         buildonly-randconfig-002-20240613   clang-18
i386         buildonly-randconfig-003-20240613   clang-18
i386         buildonly-randconfig-004-20240613   clang-18
i386         buildonly-randconfig-005-20240613   gcc-7
i386         buildonly-randconfig-006-20240613   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240613   gcc-7
i386                  randconfig-002-20240613   gcc-11
i386                  randconfig-003-20240613   gcc-13
i386                  randconfig-004-20240613   clang-18
i386                  randconfig-005-20240613   gcc-13
i386                  randconfig-006-20240613   gcc-13
i386                  randconfig-011-20240613   gcc-13
i386                  randconfig-012-20240613   clang-18
i386                  randconfig-013-20240613   clang-18
i386                  randconfig-014-20240613   gcc-12
i386                  randconfig-015-20240613   gcc-8
i386                  randconfig-016-20240613   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240613   gcc-13.2.0
loongarch             randconfig-002-20240613   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   gcc-13.2.0
mips                        bcm47xx_defconfig   clang-15
mips                        bcm63xx_defconfig   clang-17
mips                     decstation_defconfig   gcc-13.2.0
mips                        vocore2_defconfig   clang-15
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240613   gcc-13.2.0
nios2                 randconfig-002-20240613   gcc-13.2.0
openrisc                         alldefconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                    or1ksim_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240613   gcc-13.2.0
parisc                randconfig-002-20240613   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   clang-19
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                        fsp2_defconfig   gcc-13.2.0
powerpc                    gamecube_defconfig   clang-19
powerpc                    klondike_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240613   clang-19
powerpc               randconfig-002-20240613   clang-19
powerpc               randconfig-003-20240613   clang-19
powerpc                     tqm8560_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240613   clang-19
powerpc64             randconfig-002-20240613   clang-19
powerpc64             randconfig-003-20240613   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240613   clang-19
riscv                 randconfig-002-20240613   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240613   gcc-13.2.0
s390                  randconfig-002-20240613   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                               j2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240613   gcc-13.2.0
sh                    randconfig-002-20240613   gcc-13.2.0
sh                   secureedge5410_defconfig   gcc-13.2.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240613   gcc-13.2.0
sparc64               randconfig-002-20240613   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240613   gcc-9
um                    randconfig-002-20240613   gcc-9
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240613   gcc-13
x86_64       buildonly-randconfig-002-20240613   gcc-9
x86_64       buildonly-randconfig-003-20240613   clang-18
x86_64       buildonly-randconfig-004-20240613   clang-18
x86_64       buildonly-randconfig-005-20240613   clang-18
x86_64       buildonly-randconfig-006-20240613   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240613   gcc-13
x86_64                randconfig-002-20240613   clang-18
x86_64                randconfig-003-20240613   gcc-13
x86_64                randconfig-004-20240613   clang-18
x86_64                randconfig-005-20240613   clang-18
x86_64                randconfig-006-20240613   clang-18
x86_64                randconfig-011-20240613   gcc-9
x86_64                randconfig-012-20240613   clang-18
x86_64                randconfig-013-20240613   clang-18
x86_64                randconfig-014-20240613   clang-18
x86_64                randconfig-015-20240613   gcc-7
x86_64                randconfig-016-20240613   clang-18
x86_64                randconfig-071-20240613   clang-18
x86_64                randconfig-072-20240613   clang-18
x86_64                randconfig-073-20240613   gcc-9
x86_64                randconfig-074-20240613   clang-18
x86_64                randconfig-075-20240613   clang-18
x86_64                randconfig-076-20240613   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240613   gcc-13.2.0
xtensa                randconfig-002-20240613   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

