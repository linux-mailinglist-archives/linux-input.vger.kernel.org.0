Return-Path: <linux-input+bounces-5401-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A25949B3C
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 00:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF46F2864D3
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 22:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A04616DC0B;
	Tue,  6 Aug 2024 22:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="rKQgDKNi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lk4ipcuH"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEBE15B0EE;
	Tue,  6 Aug 2024 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722982866; cv=none; b=nh0062rgA06SHm2jbOnxKLZiV7Nqi95zkCbFWT01oDtXR9NRJ8LAnKH6ywKdJQRL95/Rq4Y1tRkLOkUD7Yf2Mj1uYidWtxaZ3UQCFkdrbjBDI6gE1Vfapr5kgzfO0BHAuGa2Co0H/VrWG7vB0RckzHa9xDCoK1qsKgfHXLUSaDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722982866; c=relaxed/simple;
	bh=OcfpEBA/YoUMFzxCcxJs8XsIh86XtElvSDFM9o5ZArs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DjdOHduT/a0Msg0fanfy15Y5K6zV+73hjlbmBRw+O/cguCoEBoQWLhsFtdtBe96yor9TEvnbpHZpEZ7JNbv90xoB0nL3H4umHbuPmrGFNaKE1sd3TcSfZm7DRzIqxd45V5teMHAuR9rDQoIyx7cM3sc2/flelpvyzL/HOdDqX6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=rKQgDKNi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lk4ipcuH; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D888A114B060;
	Tue,  6 Aug 2024 18:20:59 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Tue, 06 Aug 2024 18:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1722982859;
	 x=1723069259; bh=ckVWeKkiO13bW4HzDYwVSL+LMwbmo1HdCa4CANBBsJY=; b=
	rKQgDKNiD1DSB7epKE1tPMn9aShKLlbVnA4CQp9FTyvHB5Ali+tuvzael3Z9sRqV
	xVnkonNNBwMmsyDv6fKaMMMCMvXm4XrX15+aufMvcIj1jJbeUs+Wu/ad35lraSNp
	Q1fXrVFPgBPzSojfdpwyOTSGVl9CnqbKIYu0fxhPk0/03uje1/N19ZHQVj2ljBkT
	tLYYgYK9DxfOMIfhKFU4nCZE8551p/Y6O4rEaoRiUz0prfzn1FnHbqP6l8jPGFEP
	9FwZ26mvNYLl9hVdqpquyie9jN54SC+/WOrvgjmTPvSyBwZdy6be3vXUIuJWmJYD
	VdsWcLRX3eV9JHvnkDc+gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722982859; x=
	1723069259; bh=ckVWeKkiO13bW4HzDYwVSL+LMwbmo1HdCa4CANBBsJY=; b=l
	k4ipcuHnBu831vu/emjE2Fi3vOpLNcE1mISjLeSLSbjCWWVx7eNggSV9egy2rN75
	fk/wCG+T09m/+q6//fjNo9oPasUw8DYduJfb9oFMC8UEVMGjFYqlXuYdJUnHqAIg
	w6JJJyXZXE1Aw54h2aMU46C51E8o3OB7csqa4IXyWtUNvOaprWqDNV/jnEGEfrPs
	wnRaPY20M4SUI3gVXo1UfFeMd005zs45bBM16GDDqhyBN945xTz3GzJ1PJYX/aLO
	njbfxsJGsW+8aiGiocumuJQg2i+cDwHGNHvQ6JGhsVFqCb7qlufkpaxL01FAvuih
	7pSvk01d9LsWNkgAI0Niw==
X-ME-Sender: <xms:y6GyZlvKVdzEkjZDd5BQMd2nb8SWxztDtGnMQq3_iIq5htPazed43g>
    <xme:y6GyZucGL6JL_-ELSqrFAlzi93nSmdo8C7I9JdISRzyZm68oyQJdTkNJRdSaakulT
    fopx1GaFAi67wRn4ps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeelgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnuhhk
    vgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvg
    hrnhepkedvleetfeelfedufffgueekfeehueffveevveetveegveejgedtleetffekffeh
    necuffhomhgrihhnpehgihhtqdhstghmrdgtohhmpdhgihhthhhusgdrtghomhdpkhgvrh
    hnvghlrdhorhhgpddtuddrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtth
    hopedt
X-ME-Proxy: <xmx:y6GyZozSjfSKaj6EuGcrxF7ut9qAZ26PWYkE0OCj-9B93wjQbrM15Q>
    <xmx:y6GyZsPZf1GPpyMbUSkylTEIcVkyQ6A6AcBSTFCEwgaDVQimJ36Zug>
    <xmx:y6GyZl-uHKcZsI9QrfifZmkE0ccXGbq9iGS4TYtYpinquxWkub0wIQ>
    <xmx:y6GyZsU0Wo5s6GIv8VGMM44n-rzsZzvEBogI4vCgRNqswWR5oBl-Pw>
    <xmx:y6GyZomPpr49Tlt8yxd060oGZ7o8IqnGgs41K3JrDcfuXLvPYAHuTYEm>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8A8722340080; Tue,  6 Aug 2024 18:20:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 07 Aug 2024 10:20:39 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "kernel test robot" <lkp@intel.com>, linux-input@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Benjamin Tissoires" <bentiss@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>
Message-Id: <a24dd146-2991-46af-a6f7-6f2b0a7eb97f@app.fastmail.com>
In-Reply-To: <202408070520.r1N2Tpys-lkp@intel.com>
References: <20240806081212.56860-1-luke@ljones.dev>
 <202408070520.r1N2Tpys-lkp@intel.com>
Subject: Re: [PATCH] hid-asus-ally: Add full gamepad support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 7 Aug 2024, at 9:34 AM, kernel test robot wrote:
> Hi Luke,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on hid/for-next]
> [also build test WARNING on next-20240806]
> [cannot apply to linus/master v6.11-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Luke-D-Jones/hid-asus-ally-Add-full-gamepad-support/20240806-170850
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
> patch link:    https://lore.kernel.org/r/20240806081212.56860-1-luke%40ljones.dev
> patch subject: [PATCH] hid-asus-ally: Add full gamepad support
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240807/202408070520.r1N2Tpys-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070520.r1N2Tpys-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408070520.r1N2Tpys-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/hid/hid-asus-ally.c:17:
>    In file included from include/linux/hid.h:29:
>    In file included from include/linux/hid_bpf.h:6:
>    In file included from include/linux/bpf.h:21:
>    In file included from include/linux/kallsyms.h:13:
>    In file included from include/linux/mm.h:2228:
>    include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from drivers/hid/hid-asus-ally.c:17:
>    In file included from include/linux/hid.h:29:
>    In file included from include/linux/hid_bpf.h:6:
>    In file included from include/linux/bpf.h:31:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:25:
>    In file included from include/linux/kernel_stat.h:8:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      548 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from drivers/hid/hid-asus-ally.c:17:
>    In file included from include/linux/hid.h:29:
>    In file included from include/linux/hid_bpf.h:6:
>    In file included from include/linux/bpf.h:31:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:25:
>    In file included from include/linux/kernel_stat.h:8:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from drivers/hid/hid-asus-ally.c:17:
>    In file included from include/linux/hid.h:29:
>    In file included from include/linux/hid_bpf.h:6:
>    In file included from include/linux/bpf.h:31:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:25:
>    In file included from include/linux/kernel_stat.h:8:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    drivers/hid/hid-asus-ally.c:565:10: warning: variable 'max_output_report_size' set but not used [-Wunused-but-set-variable]
>      565 |         uint8_t max_output_report_size;
>          |                 ^
>    drivers/hid/hid-asus-ally.c:1177:6: warning: variable 'cmd' set but not used [-Wunused-but-set-variable]
>     1177 |         int cmd, side, is_tr;
>          |             ^
> >> drivers/hid/hid-asus-ally.c:894:1: warning: unused variable 'btn_mapping_lt_attr_group' [-Wunused-const-variable]
>      894 | ALLY_BTN_MAPPING(lt, btn_pair_lt_rt, btn_pair_side_left);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/hid/hid-asus-ally.h:321:2: note: expanded from macro 'ALLY_BTN_MAPPING'
>      321 |         ALLY_BTN_ATTRS_GROUP(btn_##_fname, btn_mapping_##_fname)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/hid/hid-asus-ally.h:306:38: note: expanded from macro 'ALLY_BTN_ATTRS_GROUP'
>      306 |         static const struct attribute_group _fname##_attr_group = {       \
>          |                                             ^~~~~~~~~~~~~~~~~~~
>    <scratch space>:125:1: note: expanded from here
>      125 | btn_mapping_lt_attr_group
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/hid/hid-asus-ally.c:895:1: warning: unused variable 'btn_mapping_rt_attr_group' [-Wunused-const-variable]
>      895 | ALLY_BTN_MAPPING(rt, btn_pair_lt_rt, btn_pair_side_right);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/hid/hid-asus-ally.h:321:2: note: expanded from macro 'ALLY_BTN_MAPPING'
>      321 |         ALLY_BTN_ATTRS_GROUP(btn_##_fname, btn_mapping_##_fname)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/hid/hid-asus-ally.h:306:38: note: expanded from macro 'ALLY_BTN_ATTRS_GROUP'
>      306 |         static const struct attribute_group _fname##_attr_group = {       \
>          |                                             ^~~~~~~~~~~~~~~~~~~
>    <scratch space>:167:1: note: expanded from here
>      167 | btn_mapping_rt_attr_group
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~
>    11 warnings generated.
> 
> 
> vim +/btn_mapping_lt_attr_group +894 drivers/hid/hid-asus-ally.c
> 
>    882
>    883 /* button map attributes, regular and macro*/
>    884 ALLY_BTN_MAPPING(m2, btn_pair_m1_m2, btn_pair_side_left);
>    885 ALLY_BTN_MAPPING(m1, btn_pair_m1_m2, btn_pair_side_right);
>    886 ALLY_BTN_MAPPING(a, btn_pair_a_b, btn_pair_side_left);
>    887 ALLY_BTN_MAPPING(b, btn_pair_a_b, btn_pair_side_right);
>    888 ALLY_BTN_MAPPING(x, btn_pair_x_y, btn_pair_side_left);
>    889 ALLY_BTN_MAPPING(y, btn_pair_x_y, btn_pair_side_right);
>    890 ALLY_BTN_MAPPING(lb, btn_pair_lb_rb, btn_pair_side_left);
>    891 ALLY_BTN_MAPPING(rb, btn_pair_lb_rb, btn_pair_side_right);
>    892 ALLY_BTN_MAPPING(ls, btn_pair_ls_rs, btn_pair_side_left);
>    893 ALLY_BTN_MAPPING(rs, btn_pair_ls_rs, btn_pair_side_right);
> > 894 ALLY_BTN_MAPPING(lt, btn_pair_lt_rt, btn_pair_side_left);
> > 895 ALLY_BTN_MAPPING(rt, btn_pair_lt_rt, btn_pair_side_right);
>    896 ALLY_BTN_MAPPING(dpad_u, btn_pair_dpad_u_d, btn_pair_side_left);
>    897 ALLY_BTN_MAPPING(dpad_d, btn_pair_dpad_u_d, btn_pair_side_right);
>    898 ALLY_BTN_MAPPING(dpad_l, btn_pair_dpad_l_r, btn_pair_side_left);
>    899 ALLY_BTN_MAPPING(dpad_r, btn_pair_dpad_l_r, btn_pair_side_right);
>    900 ALLY_BTN_MAPPING(view, btn_pair_view_menu, btn_pair_side_left);
>    901 ALLY_BTN_MAPPING(menu, btn_pair_view_menu, btn_pair_side_right);
>    902
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


I like this service. The above warnings will be fixed in next version after I get some review.

Regards,
Luke.

