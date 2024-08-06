Return-Path: <linux-input+bounces-5400-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD50949A42
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 23:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44A6D28568A
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 21:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B23316A940;
	Tue,  6 Aug 2024 21:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWzXm0d5"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B545A80043;
	Tue,  6 Aug 2024 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722980105; cv=none; b=DTNp3P24f+FK08CD0s2pfflv208nQKVdwzS1hgKfJ7NOI8FOJ7PYp6qxQX54Ot4xChmkdkxhH+Cjaak/OqeFz5dWhpX2RyCST+htK6Dd9SHim0ueB1AC1NE0NT7oDi+Xb4/grBx9Vr8D+0R9qznEaLfyNtzJVfEacPNeehiWUis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722980105; c=relaxed/simple;
	bh=tGM+xMTtXdF3SYhLRFBMQ6Mal+S5V0On21qnP69v0Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbgMCPJ2pZOjtelwcC3K7b9DB02E6LKwJCDUzR9vPRLtWIoMaCzjhwyeyk77q1VN530eaDGS4RCSYxQHgp33/xwptfURawEpDMYKK4RlgbCgUwK56A2HyTY7TtVtGNDpHNrXy8+AbI4CG8uxjfwl147MtokmuR/dryDi84IZJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWzXm0d5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722980101; x=1754516101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tGM+xMTtXdF3SYhLRFBMQ6Mal+S5V0On21qnP69v0Ns=;
  b=dWzXm0d5zvQXiHv1avP/LthKV0H/aM8MnV+a5FPiGYUCvzvaYUXOtRqu
   VxtZabsHL2mx1gBCc0UIWrDkQ1pDYkbU9ZrI6qF383m1Q9axfKhVd0dDx
   pfcUYiIo8ZZa3ythagE9Ey22WYQjWsib8WtaKCoFAIpZX7kF8s1SRK5px
   y6FOwBynTSPfrVYFzxFAddNpRM5uxGtYGNXINOVIoqYXeKQog+YR9922n
   iyzk8LA8ad/u5H7BjwljBALU2FnXihRYjWelIQPDfibwxhJlZ2q3FNCX8
   QLF62K8yeVGZd7hxk6rot9OhwAjQtZOHWIAu7Y5enNq/VC+IuO8QHydGO
   Q==;
X-CSE-ConnectionGUID: GWy3XvoxQYexidwaFrt5FA==
X-CSE-MsgGUID: r2ESKDmlSEKC3OUvoCuRvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32410117"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="32410117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 14:35:00 -0700
X-CSE-ConnectionGUID: 2P7qEu/uRy+1dOi5wf9UCg==
X-CSE-MsgGUID: etScqqnQRLeKo2XIJt2QEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61290372"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2024 14:34:57 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbRpT-0004qa-1t;
	Tue, 06 Aug 2024 21:34:53 +0000
Date: Wed, 7 Aug 2024 05:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>, linux-input@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: Re: [PATCH] hid-asus-ally: Add full gamepad support
Message-ID: <202408070520.r1N2Tpys-lkp@intel.com>
References: <20240806081212.56860-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806081212.56860-1-luke@ljones.dev>

Hi Luke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on next-20240806]
[cannot apply to linus/master v6.11-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-D-Jones/hid-asus-ally-Add-full-gamepad-support/20240806-170850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240806081212.56860-1-luke%40ljones.dev
patch subject: [PATCH] hid-asus-ally: Add full gamepad support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240807/202408070520.r1N2Tpys-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070520.r1N2Tpys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070520.r1N2Tpys-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/hid-asus-ally.c:17:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hid/hid-asus-ally.c:17:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/hid/hid-asus-ally.c:17:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hid/hid-asus-ally.c:17:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/hid/hid-asus-ally.c:565:10: warning: variable 'max_output_report_size' set but not used [-Wunused-but-set-variable]
     565 |         uint8_t max_output_report_size;
         |                 ^
   drivers/hid/hid-asus-ally.c:1177:6: warning: variable 'cmd' set but not used [-Wunused-but-set-variable]
    1177 |         int cmd, side, is_tr;
         |             ^
>> drivers/hid/hid-asus-ally.c:894:1: warning: unused variable 'btn_mapping_lt_attr_group' [-Wunused-const-variable]
     894 | ALLY_BTN_MAPPING(lt, btn_pair_lt_rt, btn_pair_side_left);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-asus-ally.h:321:2: note: expanded from macro 'ALLY_BTN_MAPPING'
     321 |         ALLY_BTN_ATTRS_GROUP(btn_##_fname, btn_mapping_##_fname)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-asus-ally.h:306:38: note: expanded from macro 'ALLY_BTN_ATTRS_GROUP'
     306 |         static const struct attribute_group _fname##_attr_group = {       \
         |                                             ^~~~~~~~~~~~~~~~~~~
   <scratch space>:125:1: note: expanded from here
     125 | btn_mapping_lt_attr_group
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/hid-asus-ally.c:895:1: warning: unused variable 'btn_mapping_rt_attr_group' [-Wunused-const-variable]
     895 | ALLY_BTN_MAPPING(rt, btn_pair_lt_rt, btn_pair_side_right);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-asus-ally.h:321:2: note: expanded from macro 'ALLY_BTN_MAPPING'
     321 |         ALLY_BTN_ATTRS_GROUP(btn_##_fname, btn_mapping_##_fname)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-asus-ally.h:306:38: note: expanded from macro 'ALLY_BTN_ATTRS_GROUP'
     306 |         static const struct attribute_group _fname##_attr_group = {       \
         |                                             ^~~~~~~~~~~~~~~~~~~
   <scratch space>:167:1: note: expanded from here
     167 | btn_mapping_rt_attr_group
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   11 warnings generated.


vim +/btn_mapping_lt_attr_group +894 drivers/hid/hid-asus-ally.c

   882	
   883	/* button map attributes, regular and macro*/
   884	ALLY_BTN_MAPPING(m2, btn_pair_m1_m2, btn_pair_side_left);
   885	ALLY_BTN_MAPPING(m1, btn_pair_m1_m2, btn_pair_side_right);
   886	ALLY_BTN_MAPPING(a, btn_pair_a_b, btn_pair_side_left);
   887	ALLY_BTN_MAPPING(b, btn_pair_a_b, btn_pair_side_right);
   888	ALLY_BTN_MAPPING(x, btn_pair_x_y, btn_pair_side_left);
   889	ALLY_BTN_MAPPING(y, btn_pair_x_y, btn_pair_side_right);
   890	ALLY_BTN_MAPPING(lb, btn_pair_lb_rb, btn_pair_side_left);
   891	ALLY_BTN_MAPPING(rb, btn_pair_lb_rb, btn_pair_side_right);
   892	ALLY_BTN_MAPPING(ls, btn_pair_ls_rs, btn_pair_side_left);
   893	ALLY_BTN_MAPPING(rs, btn_pair_ls_rs, btn_pair_side_right);
 > 894	ALLY_BTN_MAPPING(lt, btn_pair_lt_rt, btn_pair_side_left);
 > 895	ALLY_BTN_MAPPING(rt, btn_pair_lt_rt, btn_pair_side_right);
   896	ALLY_BTN_MAPPING(dpad_u, btn_pair_dpad_u_d, btn_pair_side_left);
   897	ALLY_BTN_MAPPING(dpad_d, btn_pair_dpad_u_d, btn_pair_side_right);
   898	ALLY_BTN_MAPPING(dpad_l, btn_pair_dpad_l_r, btn_pair_side_left);
   899	ALLY_BTN_MAPPING(dpad_r, btn_pair_dpad_l_r, btn_pair_side_right);
   900	ALLY_BTN_MAPPING(view, btn_pair_view_menu, btn_pair_side_left);
   901	ALLY_BTN_MAPPING(menu, btn_pair_view_menu, btn_pair_side_right);
   902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

