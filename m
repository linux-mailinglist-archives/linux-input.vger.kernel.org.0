Return-Path: <linux-input+bounces-4564-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63F69136D3
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 01:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60F4B281994
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 23:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0017441E;
	Sat, 22 Jun 2024 23:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgSITK26"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73628629E4;
	Sat, 22 Jun 2024 23:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719097934; cv=none; b=NlYClL9UeLRmFIBclbHnjzMWprX7kpn8w0RAyRsCy1YWxTmqugfpqecI8Ys8W9uXKsQqa1NpvrIdZHzW3aJtD9OhPPq1sEXav+Q3kkUvWHId0SZdtZolZfVe8tGBUucZQS529JXNS9jWWheJbrSd+KCcke8U8R6SJmVK/u1nND8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719097934; c=relaxed/simple;
	bh=F6FyhjxDwrnRfFKQwRZEXEyXdQXVBW4MdI4AGIrkByc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cr+PQBg1BxNKBKxjGQJ8QLjnh3OBKu6C6NRvzIS/1DDBHmsL8z11gD3K5fW6P5Kgk3JPq3U8vvtYodbdtiB8aebQNtY1ERPcd3zq02d8U1fq/YMj1V3ut8BXMTGM0SRahy4L0lttZJ+VCotHAZHwHpqM+DIXVuZbjvsbi/N1xX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgSITK26; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719097932; x=1750633932;
  h=date:from:to:cc:subject:message-id;
  bh=F6FyhjxDwrnRfFKQwRZEXEyXdQXVBW4MdI4AGIrkByc=;
  b=kgSITK26Yg21dEw7lQj7PYJaW3mEY+DNiwwCYBQzD3VWV8qMuXeoMYjV
   wdXdbOty79ml71/+2C8e7JLWlnKGIMpzy9ttRp+qBHLANcXoNpbmt9jD/
   DcKjSzF+vk6E+YJAVHUcN2PPkpc4wF4+kW5IYOOVbk4CFEJiQ8Fh70V91
   v51Ve9ddAlHzep/7TbAD7AlEnRvv64xqlYCQmVRSOWGTjxoyKTySpc51c
   l+7vMsgcdtOA8bAUI1i8bWl7i2ErTOaWoBt2DfzJH1hMEE4IFRFIE/a3E
   BfZTeT9wONjz1j5UQPyRwyUNRsgB/DeG3Ve8O0Fp8K/ZyZxR7aEDOPt/6
   w==;
X-CSE-ConnectionGUID: 4hFzvd1QRraFLk/xj6Ggog==
X-CSE-MsgGUID: ff1Jj6PlQzON4HExWe/Tbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="15934181"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="15934181"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 16:12:11 -0700
X-CSE-ConnectionGUID: aM+jftoRTP2XdYmg/fZGOQ==
X-CSE-MsgGUID: HUt80JxiQ3CKAsQIRkmCHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="73669129"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2024 16:12:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL9tt-000A4o-0V;
	Sat, 22 Jun 2024 23:12:05 +0000
Date: Sun, 23 Jun 2024 07:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, imx@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master] BUILD REGRESSION
 f76698bd9a8ca01d3581236082d786e9a6b72bb7
Message-ID: <202406230716.DQbMBKh0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: f76698bd9a8ca01d3581236082d786e9a6b72bb7  Add linux-next specific files for 20240621

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406220536.JnAncjqz-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406220754.evK8Hrjw-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/soc/qcom/smsm.c:(.text.qcom_smsm_remove+0x70): undefined reference to `mbox_free_channel'

Unverified Error/Warning (likely false positive, please contact us if interested):

include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct thpsize'
include/linux/list.h:645:25: error: invalid use of undefined type 'struct thpsize'
include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct thpsize'
mm/huge_memory.c:455:21: error: implicit declaration of function 'to_thpsize'; did you mean 'thp_size'? [-Werror=implicit-function-declaration]
mm/huge_memory.c:455:37: error: invalid type argument of '->' (have 'int')
mm/huge_memory.c:558:35: error: 'MTHP_STAT_FILE_ALLOC' undeclared (first use in this function); did you mean 'THP_FILE_ALLOC'?
mm/huge_memory.c:559:38: error: 'MTHP_STAT_FILE_FALLBACK' undeclared (first use in this function); did you mean 'THP_FILE_FALLBACK'?
mm/huge_memory.c:560:45: error: 'MTHP_STAT_FILE_FALLBACK_CHARGE' undeclared (first use in this function); did you mean 'THP_FILE_FALLBACK_CHARGE'?
mm/huge_memory.c:579:17: warning: assignment to 'struct thpsize *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
mm/huge_memory.c:579:33: error: invalid application of 'sizeof' to incomplete type 'struct thpsize'
mm/huge_memory.c:583:44: error: invalid use of undefined type 'struct thpsize'
mm/huge_memory.c:608:15: warning: passing argument 1 of 'kfree' makes pointer from integer without a cast [-Wint-conversion]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-defconfig
|   `-- arch-arm64-boot-dts-ti-k3-am62p-j722s-common-main.dtsi.-.:Warning-(graph_child_address):bus-f0000-usb-f900000-usb:graph-node-has-single-child-node-port-address-cells-size-cells-are-not-necessary
|-- arm64-randconfig-051-20240622
|   |-- arch-arm64-boot-dts-mediatek-mt8188-evb.dtb:power-controller:power-domain:power-domain:power-domain:power-domain:Unevaluated-properties-are-not-allowed-(-power-domain-power-domain-were-unexpected)
|   |-- arch-arm64-boot-dts-mediatek-mt8390-genio-evk.dtb:mailbox:clock-names-is-a-required-property
|   |-- arch-arm64-boot-dts-mediatek-mt8390-genio-evk.dtb:power-controller:power-domain:power-domain:power-domain:power-domain:Unevaluated-properties-are-not-allowed-(-power-domain-power-domain-were-unexpecte
|   |-- arch-arm64-boot-dts-qcom-ipq5018-tplink-archer-ax55-v1.dtb:usb-8af8800:interrupt-names:hs_phy_irq-is-too-short
|   |-- arch-arm64-boot-dts-qcom-ipq5018-tplink-archer-ax55-v1.dtb:usb-8af8800:interrupt-names:pwr_event-was-expected
|   `-- arch-arm64-boot-dts-qcom-ipq5018-tplink-archer-ax55-v1.dtb:usb-8af8800:interrupts:is-too-short
|-- arm64-randconfig-r131-20240622
|   `-- arch-arm64-boot-dts-ti-k3-am62p-j722s-common-main.dtsi.-.:Warning-(graph_child_address):bus-f0000-usb-f900000-usb:graph-node-has-single-child-node-port-address-cells-size-cells-are-not-necessary
|-- csky-randconfig-r111-20240622
|   `-- drivers-clk-imx-clk-composite-7ulp.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- loongarch-randconfig-r121-20240622
|   |-- drivers-gpu-drm-xe-xe_oa.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-long-long-const-noderef-__user-got-unsigned-long-long-usertype-ptr
|   `-- drivers-gpu-drm-xe-xe_oa.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-long-long-usertype-ptr-got-void-noderef-__user
|-- mips-randconfig-r023-20221012
|   `-- drivers-soc-qcom-smsm.c:(.text.qcom_smsm_remove):undefined-reference-to-mbox_free_channel
|-- sparc-randconfig-r111-20240622
|   |-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-buf-got-void-noderef-__iomem
|   `-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-short-noderef-usertype-__iomem-t-got-void-buf
|-- x86_64-randconfig-014-20240202
|   |-- include-linux-container_of.h:error:invalid-use-of-undefined-type-struct-thpsize
|   |-- include-linux-list.h:error:invalid-use-of-undefined-type-struct-thpsize
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-thpsize
|   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_ALLOC-undeclared-(first-use-in-this-function)
|   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_FALLBACK-undeclared-(first-use-in-this-function)
|   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_FALLBACK_CHARGE-undeclared-(first-use-in-this-function)
|   |-- mm-huge_memory.c:error:implicit-declaration-of-function-to_thpsize
|   |-- mm-huge_memory.c:error:invalid-application-of-sizeof-to-incomplete-type-struct-thpsize
|   |-- mm-huge_memory.c:error:invalid-type-argument-of-(have-int-)
|   |-- mm-huge_memory.c:error:invalid-use-of-undefined-type-struct-thpsize
|   |-- mm-huge_memory.c:warning:assignment-to-struct-thpsize-from-int-makes-pointer-from-integer-without-a-cast
|   `-- mm-huge_memory.c:warning:passing-argument-of-kfree-makes-pointer-from-integer-without-a-cast
`-- x86_64-randconfig-072-20240622
    |-- drivers-input-touchscreen-wacom_w8001.c:warning:Finger-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
    `-- drivers-input-touchscreen-wacom_w8001.c:warning:Pen-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
clang_recent_errors
|-- i386-randconfig-062-20240622
|   |-- drivers-gpu-drm-xe-xe_oa.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__user-ptr-got-unsigned-long-long-usertype-ptr
|   |-- drivers-gpu-drm-xe-xe_oa.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-long-long-usertype-ptr-got-void-noderef-__user
|   |-- net-l2tp-l2tp_core.c:sparse:sparse:cast-removes-address-space-__rcu-of-expression
|   |-- net-l2tp-l2tp_core.c:sparse:sparse:dereference-of-noderef-expression
|   |-- net-l2tp-l2tp_core.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-list_head-const-list-got-struct-list_head-noderef-__rcu-pos
|   |-- net-l2tp-l2tp_core.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-list_head-noderef-__rcu-pos-got-struct-list_head-assigned-tmp
|   `-- net-l2tp-l2tp_core.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-list_head-noderef-__rcu-pos-got-struct-list_head-next
|-- x86_64-randconfig-121-20240622
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-resource-dcn32-dcn32_resource_helpers.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
`-- x86_64-randconfig-123-20240622
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash

elapsed time: 1700m

configs tested: 134
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240622   gcc-13.2.0
arc                   randconfig-002-20240622   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm                          pxa168_defconfig   clang-19
arm                   randconfig-001-20240622   gcc-13.2.0
arm                   randconfig-002-20240622   clang-19
arm                   randconfig-003-20240622   clang-14
arm                   randconfig-004-20240622   gcc-13.2.0
arm                         wpcm450_defconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240622   clang-19
arm64                 randconfig-002-20240622   clang-14
arm64                 randconfig-003-20240622   gcc-13.2.0
arm64                 randconfig-004-20240622   clang-19
csky                             alldefconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240622   gcc-13.2.0
csky                  randconfig-002-20240622   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240622   clang-19
hexagon               randconfig-002-20240622   clang-19
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
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240622   gcc-13.2.0
loongarch             randconfig-002-20240622   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240622   gcc-13.2.0
nios2                 randconfig-002-20240622   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240622   gcc-13.2.0
parisc                randconfig-002-20240622   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                      chrp32_defconfig   clang-19
powerpc                      cm5200_defconfig   clang-19
powerpc                   currituck_defconfig   clang-19
powerpc                      mgcoge_defconfig   clang-19
powerpc                     mpc5200_defconfig   clang-14
powerpc                      pasemi_defconfig   clang-19
powerpc               randconfig-001-20240622   gcc-13.2.0
powerpc               randconfig-002-20240622   gcc-13.2.0
powerpc               randconfig-003-20240622   clang-19
powerpc                      walnut_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240622   gcc-13.2.0
powerpc64             randconfig-002-20240622   gcc-13.2.0
powerpc64             randconfig-003-20240622   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240622   gcc-13.2.0
riscv                 randconfig-002-20240622   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240622   clang-19
s390                  randconfig-002-20240622   clang-15
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                 kfr2r09-romimage_defconfig   gcc-13.2.0
sh                    randconfig-001-20240622   gcc-13.2.0
sh                    randconfig-002-20240622   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240622   gcc-13.2.0
sparc64               randconfig-002-20240622   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240622   gcc-10
um                    randconfig-002-20240622   clang-19
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240622   gcc-8
x86_64       buildonly-randconfig-002-20240622   clang-18
x86_64       buildonly-randconfig-003-20240622   gcc-12
x86_64       buildonly-randconfig-004-20240622   gcc-13
x86_64       buildonly-randconfig-005-20240622   clang-18
x86_64       buildonly-randconfig-006-20240622   gcc-13
x86_64                randconfig-001-20240622   clang-18
x86_64                randconfig-002-20240622   clang-18
x86_64                randconfig-003-20240622   clang-18
x86_64                randconfig-004-20240622   clang-18
x86_64                randconfig-005-20240622   clang-18
x86_64                randconfig-006-20240622   clang-18
x86_64                randconfig-011-20240622   gcc-12
x86_64                randconfig-012-20240622   gcc-8
x86_64                randconfig-013-20240622   clang-18
x86_64                randconfig-014-20240622   gcc-8
x86_64                randconfig-015-20240622   clang-18
x86_64                randconfig-016-20240622   gcc-12
x86_64                randconfig-071-20240622   clang-18
x86_64                randconfig-072-20240622   gcc-8
x86_64                randconfig-073-20240622   clang-18
x86_64                randconfig-074-20240622   gcc-12
x86_64                randconfig-075-20240622   gcc-13
x86_64                randconfig-076-20240622   gcc-10
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240622   gcc-13.2.0
xtensa                randconfig-002-20240622   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

