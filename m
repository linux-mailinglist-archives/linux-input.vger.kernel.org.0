Return-Path: <linux-input+bounces-257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F04E07F9B46
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 09:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FA79B20AA7
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 08:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8908710A27;
	Mon, 27 Nov 2023 08:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/on/KYA"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E131B113
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 00:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701072378; x=1732608378;
  h=date:from:to:cc:subject:message-id;
  bh=cWlC5qHzF/ct5H46DBr8Nk2KmQ7V3ozsYmK5nY7x2WA=;
  b=N/on/KYA2Tk0sKll/n0HgB53HPMgfijfESWsS/WsqYthHeCtSswDzQRf
   ampjVDjEM3UfzxXEagaZnFd+Jjf4su3Dp8c9MmOvR2W8jxlPTF7TkS5At
   qQgiPMY18UzQ356Myw/wvh/wlCBxubE73qRq3HP4wXV4XQumeq8lILuGM
   jgsfM8DPNPXx51yVrLMJNZWIexxVicLZf8VBGxDkQN1xEdGJF2AtafYDL
   FEnR6OVK/agKI6/kuIS4/zuekgNdAiF22Cl85whL6DV54hwl1k8LXbK5A
   82ElXp2Q86TfkRGkz/cT+7HdHgQa8CkbkI9j3M6mq6IISZzCV8LQPSvXI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="377689976"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="377689976"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 00:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="717956856"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="717956856"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Nov 2023 00:06:16 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7WdC-00061r-2G;
	Mon, 27 Nov 2023 08:06:14 +0000
Date: Mon, 27 Nov 2023 16:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD REGRESSION
 fedfa36d045ab78ea9a0aa2c5a3d5d74c27207d3
Message-ID: <202311271636.t5ApxzSI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: fedfa36d045ab78ea9a0aa2c5a3d5d74c27207d3  Input: cap11xx - remove unnecessary IRQ parsing

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-randconfig-r131-20231126
    |-- arch-powerpc-kexec-core.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-long-long-static-addressable-toplevel-usertype-crashk_base-got-restricted-__be32-usertype
    |-- arch-powerpc-kexec-core.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-long-long-static-addressable-toplevel-usertype-crashk_size-got-restricted-__be32-usertype
    |-- arch-powerpc-kexec-core.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-long-long-static-addressable-toplevel-usertype-kernel_end-got-restricted-__be32-usertype
    |-- arch-powerpc-sysdev-fsl_rio.c:sparse:sparse:symbol-fsl_map_inb_mem-was-not-declared.-Should-it-be-static
    |-- arch-powerpc-sysdev-fsl_rio.c:sparse:sparse:symbol-fsl_unmap_inb_mem-was-not-declared.-Should-it-be-static
    `-- arch-powerpc-sysdev-fsl_rmu.c:sparse:sparse:symbol-msg_unit_error_handler-was-not-declared.-Should-it-be-static
clang_recent_errors
|-- arm-randconfig-003-20231126
|   `-- bin-bash:line:Segmentation-fault-scripts-mod-modpost-m-a-w-N-W-o-Module.symvers-n-T-modules.order-vmlinux.o
|-- hexagon-randconfig-002-20231126
|   |-- drivers-media-platform-mediatek-mdp3-mtk-mdp3-comp.c:warning:unused-variable-mdp_comp_dt_ids
|   `-- drivers-media-platform-mediatek-mdp3-mtk-mdp3-core.c:warning:unused-variable-mdp_of_ids
|-- powerpc64-randconfig-r123-20231126
|   |-- arch-powerpc-kvm-book3s_64_vio.c:sparse:sparse:cast-to-restricted-__be64
|   |-- arch-powerpc-kvm-book3s_64_vio.c:sparse:sparse:function-kvm_spapr_tce_attach_iommu_group-with-external-linkage-has-definition
|   `-- arch-powerpc-kvm-book3s_64_vio.c:sparse:sparse:function-kvm_spapr_tce_release_iommu_group-with-external-linkage-has-definition
`-- s390-randconfig-r121-20231126
    |-- open-dice.c:(.text):undefined-reference-to-devm_memremap
    |-- s39-linux-ld:irq-al-fic.c:(.init.text):undefined-reference-to-iounmap
    |-- s39-linux-ld:open-dice.c:(.text):undefined-reference-to-devm_memunmap
    `-- xillybus_of.c:(.text):undefined-reference-to-devm_platform_ioremap_resource

elapsed time: 1448m

configs tested: 211
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231126   gcc  
arc                   randconfig-002-20231126   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                         lpc18xx_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                         orion5x_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20231126   clang
arm                   randconfig-002-20231126   clang
arm                   randconfig-003-20231126   clang
arm                   randconfig-004-20231126   clang
arm                        spear6xx_defconfig   gcc  
arm                       versatile_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231126   clang
arm64                 randconfig-002-20231126   clang
arm64                 randconfig-003-20231126   clang
arm64                 randconfig-004-20231126   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231126   gcc  
csky                  randconfig-002-20231126   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231126   clang
hexagon               randconfig-002-20231126   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231126   clang
i386         buildonly-randconfig-002-20231126   clang
i386         buildonly-randconfig-003-20231126   clang
i386         buildonly-randconfig-004-20231126   clang
i386         buildonly-randconfig-005-20231126   clang
i386         buildonly-randconfig-006-20231126   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231126   clang
i386                  randconfig-002-20231126   clang
i386                  randconfig-003-20231126   clang
i386                  randconfig-004-20231126   clang
i386                  randconfig-005-20231126   clang
i386                  randconfig-006-20231126   clang
i386                  randconfig-011-20231126   gcc  
i386                  randconfig-012-20231126   gcc  
i386                  randconfig-013-20231126   gcc  
i386                  randconfig-014-20231126   gcc  
i386                  randconfig-015-20231126   gcc  
i386                  randconfig-016-20231126   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231126   gcc  
loongarch             randconfig-002-20231126   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                           jazz_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                          rb532_defconfig   gcc  
mips                           rs90_defconfig   clang
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231126   gcc  
nios2                 randconfig-002-20231126   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231126   gcc  
parisc                randconfig-002-20231126   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc               randconfig-001-20231126   clang
powerpc               randconfig-002-20231126   clang
powerpc               randconfig-003-20231126   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc64             randconfig-001-20231126   clang
powerpc64             randconfig-002-20231126   clang
powerpc64             randconfig-003-20231126   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231126   clang
riscv                 randconfig-002-20231126   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231126   gcc  
s390                  randconfig-002-20231126   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20231126   gcc  
sh                    randconfig-002-20231126   gcc  
sh                          rsk7269_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231126   gcc  
sparc64               randconfig-002-20231126   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231126   clang
um                    randconfig-002-20231126   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231126   clang
x86_64       buildonly-randconfig-002-20231126   clang
x86_64       buildonly-randconfig-003-20231126   clang
x86_64       buildonly-randconfig-004-20231126   clang
x86_64       buildonly-randconfig-005-20231126   clang
x86_64       buildonly-randconfig-006-20231126   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231126   gcc  
x86_64                randconfig-002-20231126   gcc  
x86_64                randconfig-003-20231126   gcc  
x86_64                randconfig-004-20231126   gcc  
x86_64                randconfig-005-20231126   gcc  
x86_64                randconfig-006-20231126   gcc  
x86_64                randconfig-011-20231126   clang
x86_64                randconfig-012-20231126   clang
x86_64                randconfig-013-20231126   clang
x86_64                randconfig-014-20231126   clang
x86_64                randconfig-015-20231126   clang
x86_64                randconfig-016-20231126   clang
x86_64                randconfig-071-20231126   clang
x86_64                randconfig-072-20231126   clang
x86_64                randconfig-073-20231126   clang
x86_64                randconfig-074-20231126   clang
x86_64                randconfig-075-20231126   clang
x86_64                randconfig-076-20231126   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231126   gcc  
xtensa                randconfig-002-20231126   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

