Return-Path: <linux-input+bounces-503-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACA4805EEC
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 20:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C051C21139
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 19:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956226ABB9;
	Tue,  5 Dec 2023 19:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEWneIBa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBB2D41;
	Tue,  5 Dec 2023 11:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701806275; x=1733342275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8+xl7o993QHoQJuM8EvkCoX7M+DgfwFuc3rXwdvt3a8=;
  b=KEWneIBaf/JGo6gvgH/k6NYWz9INqKH/ElepsXUayuRGSH32iotlgkIu
   8yHpvyD9h1E4edE2QY/r1yhIVFW86lVuYWhO3fz9F5doLlvwuxE3UiZLN
   Vd42zfVI4urTPbf5KLeGqmFYcvcY8ZTmzY4pplwFqFd88A6uE5hnk9zey
   ZiOOK9lBydNrnj+L04EUb0BpfrjmUZbqNUUWQ41euXCrD4dj2HZymgJh6
   rcSCU/FPYSu+CxJQna3IXh/YKzdQvnkV0kPJnvlPToc6ApYrCaCj5to5F
   zg7yy7CT3yZoCcWlnKrV15oorsYYaa+HPMLLkgJkZAzx5/Pdyns+uM+gf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378973721"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="378973721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 11:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12449683"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 11:57:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAbY8-0009eY-2M;
	Tue, 05 Dec 2023 19:57:44 +0000
Date: Wed, 6 Dec 2023 03:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Makhalov <amakhalov@vmware.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, hpa@zytor.com,
	dave.hansen@linux.intel.co, bp@alien8.d, mingo@redhat.com,
	tglx@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, netdev@vger.kernel.org,
	richardcochran@gmail.com, linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com, zackr@vmware.com,
	linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
	namit@vmware.com, timothym@vmware.com, akaher@vmware.com,
	jsipek@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
	airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, horms@kernel.org
Subject: Re: [PATCH v2 6/6] x86/vmware: Add TDX hypercall support
Message-ID: <202312060350.Paq0JYin-lkp@intel.com>
References: <20231201232452.220355-7-amakhalov@vmware.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201232452.220355-7-amakhalov@vmware.com>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus linus/master v6.7-rc4 next-20231205]
[cannot apply to tip/x86/vmware]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Makhalov/x86-vmware-Move-common-macros-to-vmware-h/20231202-072821
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231201232452.220355-7-amakhalov%40vmware.com
patch subject: [PATCH v2 6/6] x86/vmware: Add TDX hypercall support
config: x86_64-buildonly-randconfig-003-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060350.Paq0JYin-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060350.Paq0JYin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060350.Paq0JYin-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h:38,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:37:
>> arch/x86/include/asm/vmware.h:46:46: warning: 'struct tdx_module_args' declared inside parameter list will not be visible outside of this definition or declaration
      46 | extern void vmware_tdx_hypercall_args(struct tdx_module_args *args);
         |                                              ^~~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h: In function 'vmware_tdx_hypercall':
>> arch/x86/include/asm/vmware.h:61:9: error: variable 'args' has initializer but incomplete type
      61 |  struct tdx_module_args args = {
         |         ^~~~~~~~~~~~~~~
>> arch/x86/include/asm/vmware.h:62:4: error: 'struct tdx_module_args' has no member named 'r10'
      62 |   .r10 = VMWARE_TDX_VENDOR_LEAF,
         |    ^~~
>> arch/x86/include/asm/vmware.h:43:32: warning: excess elements in struct initializer
      43 | #define VMWARE_TDX_VENDOR_LEAF 0x1AF7E4909ULL
         |                                ^~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:62:10: note: in expansion of macro 'VMWARE_TDX_VENDOR_LEAF'
      62 |   .r10 = VMWARE_TDX_VENDOR_LEAF,
         |          ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:43:32: note: (near initialization for 'args')
      43 | #define VMWARE_TDX_VENDOR_LEAF 0x1AF7E4909ULL
         |                                ^~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:62:10: note: in expansion of macro 'VMWARE_TDX_VENDOR_LEAF'
      62 |   .r10 = VMWARE_TDX_VENDOR_LEAF,
         |          ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/vmware.h:63:4: error: 'struct tdx_module_args' has no member named 'r11'
      63 |   .r11 = VMWARE_TDX_HCALL_FUNC,
         |    ^~~
   arch/x86/include/asm/vmware.h:44:32: warning: excess elements in struct initializer
      44 | #define VMWARE_TDX_HCALL_FUNC  1
         |                                ^
   arch/x86/include/asm/vmware.h:63:10: note: in expansion of macro 'VMWARE_TDX_HCALL_FUNC'
      63 |   .r11 = VMWARE_TDX_HCALL_FUNC,
         |          ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:44:32: note: (near initialization for 'args')
      44 | #define VMWARE_TDX_HCALL_FUNC  1
         |                                ^
   arch/x86/include/asm/vmware.h:63:10: note: in expansion of macro 'VMWARE_TDX_HCALL_FUNC'
      63 |   .r11 = VMWARE_TDX_HCALL_FUNC,
         |          ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/vmware.h:64:4: error: 'struct tdx_module_args' has no member named 'r12'
      64 |   .r12 = VMWARE_HYPERVISOR_MAGIC,
         |    ^~~
   arch/x86/include/asm/vmware.h:31:34: warning: excess elements in struct initializer
      31 | #define VMWARE_HYPERVISOR_MAGIC  0x564D5868U
         |                                  ^~~~~~~~~~~
   arch/x86/include/asm/vmware.h:64:10: note: in expansion of macro 'VMWARE_HYPERVISOR_MAGIC'
      64 |   .r12 = VMWARE_HYPERVISOR_MAGIC,
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:31:34: note: (near initialization for 'args')
      31 | #define VMWARE_HYPERVISOR_MAGIC  0x564D5868U
         |                                  ^~~~~~~~~~~
   arch/x86/include/asm/vmware.h:64:10: note: in expansion of macro 'VMWARE_HYPERVISOR_MAGIC'
      64 |   .r12 = VMWARE_HYPERVISOR_MAGIC,
         |          ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/vmware.h:65:4: error: 'struct tdx_module_args' has no member named 'r13'
      65 |   .r13 = cmd,
         |    ^~~
   arch/x86/include/asm/vmware.h:65:10: warning: excess elements in struct initializer
      65 |   .r13 = cmd,
         |          ^~~
   arch/x86/include/asm/vmware.h:65:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:66:4: error: 'struct tdx_module_args' has no member named 'rbx'
      66 |   .rbx = in1,
         |    ^~~
   arch/x86/include/asm/vmware.h:66:10: warning: excess elements in struct initializer
      66 |   .rbx = in1,
         |          ^~~
   arch/x86/include/asm/vmware.h:66:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:67:4: error: 'struct tdx_module_args' has no member named 'rdx'
      67 |   .rdx = in3,
         |    ^~~
   arch/x86/include/asm/vmware.h:67:10: warning: excess elements in struct initializer
      67 |   .rdx = in3,
         |          ^~~
   arch/x86/include/asm/vmware.h:67:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:68:4: error: 'struct tdx_module_args' has no member named 'rsi'
      68 |   .rsi = in4,
         |    ^~~
   arch/x86/include/asm/vmware.h:68:10: warning: excess elements in struct initializer
      68 |   .rsi = in4,
         |          ^~~
   arch/x86/include/asm/vmware.h:68:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:69:4: error: 'struct tdx_module_args' has no member named 'rdi'
      69 |   .rdi = in5,
         |    ^~~
   arch/x86/include/asm/vmware.h:69:10: warning: excess elements in struct initializer
      69 |   .rdi = in5,
         |          ^~~
   arch/x86/include/asm/vmware.h:69:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:70:4: error: 'struct tdx_module_args' has no member named 'r14'
      70 |   .r14 = in6,
         |    ^~~
   arch/x86/include/asm/vmware.h:70:10: warning: excess elements in struct initializer
      70 |   .r14 = in6,
         |          ^~~
   arch/x86/include/asm/vmware.h:70:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:61:25: error: storage size of 'args' isn't known
      61 |  struct tdx_module_args args = {
         |                         ^~~~
>> arch/x86/include/asm/vmware.h:61:25: warning: unused variable 'args' [-Wunused-variable]


vim +/args +61 arch/x86/include/asm/vmware.h

    42	
  > 43	#define VMWARE_TDX_VENDOR_LEAF 0x1AF7E4909ULL
    44	#define VMWARE_TDX_HCALL_FUNC  1
    45	
  > 46	extern void vmware_tdx_hypercall_args(struct tdx_module_args *args);
    47	
    48	/*
    49	 * TDCALL[TDG.VP.VMCALL] uses rax (arg0) and rcx (arg2), while the use of
    50	 * rbp (arg6) is discouraged by the TDX specification. Therefore, we
    51	 * remap those registers to r12, r13 and r14, respectively.
    52	 */
    53	static inline
    54	unsigned long vmware_tdx_hypercall(unsigned long cmd, unsigned long in1,
    55					   unsigned long in3, unsigned long in4,
    56					   unsigned long in5, unsigned long in6,
    57					   uint32_t *out1, uint32_t *out2,
    58					   uint32_t *out3, uint32_t *out4,
    59					   uint32_t *out5, uint32_t *out6)
    60	{
  > 61		struct tdx_module_args args = {
  > 62			.r10 = VMWARE_TDX_VENDOR_LEAF,
  > 63			.r11 = VMWARE_TDX_HCALL_FUNC,
  > 64			.r12 = VMWARE_HYPERVISOR_MAGIC,
  > 65			.r13 = cmd,
  > 66			.rbx = in1,
  > 67			.rdx = in3,
  > 68			.rsi = in4,
  > 69			.rdi = in5,
  > 70			.r14 = in6,
    71		};
    72	
    73		vmware_tdx_hypercall_args(&args);
    74	
    75		if (out1)
    76			*out1 = args.rbx;
    77		if (out2)
    78			*out2 = args.r13;
    79		if (out3)
    80			*out3 = args.rdx;
    81		if (out4)
    82			*out4 = args.rsi;
    83		if (out5)
    84			*out5 = args.rdi;
    85		if (out6)
    86			*out6 = args.r14;
    87	
    88		return args.r12;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

