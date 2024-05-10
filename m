Return-Path: <linux-input+bounces-3660-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8358C1DAF
	for <lists+linux-input@lfdr.de>; Fri, 10 May 2024 07:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DA441C217A6
	for <lists+linux-input@lfdr.de>; Fri, 10 May 2024 05:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4254615E81C;
	Fri, 10 May 2024 05:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNyDCe8M"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D31527AA;
	Fri, 10 May 2024 05:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715318757; cv=none; b=Gjg8n/zTLLGIUcs3MZIy/7OkpHyCNoe/UoItoNpa1RWe5VGzpaFpd8BoHvUfENRMzDDTKdAfbZAJF8LbJi0PqgDukuJ3ERLiLkvw4uP/GKcstl4xYmRt6yVnJ28IQVS7ww5ZAjjnJliLrjbxMeAYR8ZGAS49sU7B55RCSMeCKbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715318757; c=relaxed/simple;
	bh=FkGLtnlZ8fZVob3oYQ/PzCDEhIp08hyLY4qDOsXcQKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tv3uFQ1KkwZe5jkDhGeVBcEkfQX8P4YIxNPCcoZ9g/xEpU7i7zx7wBavtifBo6Xe/B6ICLeZfgfk4kVGSpbyovU2qKvu4lJ4wLNvPe2itkTiSgMMgiuopqQ+zps1o3Bb4sRRD4z+6IkaJD/59X7LiVcZ+MouKX3zA82xyBvGJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNyDCe8M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715318755; x=1746854755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FkGLtnlZ8fZVob3oYQ/PzCDEhIp08hyLY4qDOsXcQKI=;
  b=VNyDCe8M13HL3tGr8BrTLRTMZUlF1qKpwyrDRsw2YK8F2CNE6/CkJzZR
   fE7lx12Erbyg1QnlHs2Y24d4ZaoRPTICHVeEn7jrNFhRFqAwXfCWjx4fW
   1nQ10QtLIqodAEhI+VZ6IE9MFkCPQsfxhJgQz0eGGLSuqoY66c6owcZce
   h8ueINClmEHjv6Fdd2WWWeqLCoZyDbe/JsFLkced4xPB+AaiMIABdSgu7
   M546Y8XaI8BcP0zysxGYAbv1YlzzI9iVEXg+V+eEn/2IW/SrvmO7nt2iS
   u3vwPhUxgfu+Oj5Xt77iC2f7mmMMJsrrlGbIhP7mlS6t9uGfqdWp1F8r/
   Q==;
X-CSE-ConnectionGUID: w4RWOogKSy2ttL6nEuYLLw==
X-CSE-MsgGUID: ibc02tQPQ+WM5JORLjCwXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15089629"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="15089629"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 22:25:54 -0700
X-CSE-ConnectionGUID: 7XnWVU9sTXid/yjQ40wPAQ==
X-CSE-MsgGUID: mLOqxVP1SeScPTOAxiYdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="34151806"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2024 22:25:48 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5IlN-0005lZ-0v;
	Fri, 10 May 2024 05:25:45 +0000
Date: Fri, 10 May 2024 13:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com,
	mingo@redhat.com, tglx@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, netdev@vger.kernel.org,
	richardcochran@gmail.com, linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com, zackr@vmware.com,
	linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
	timothym@vmware.com, akaher@vmware.com,
	dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
	tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, horms@kernel.org,
	kirill.shutemov@linux.intel.com,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Nadav Amit <nadav.amit@gmail.com>, Jeff Sipek <jsipek@vmware.com>
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <202405101333.vdlWwpgr-lkp@intel.com>
References: <20240506215305.30756-4-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506215305.30756-4-alexey.makhalov@broadcom.com>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus linus/master v6.9-rc7 next-20240509]
[cannot apply to tip/x86/vmware]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Makhalov/x86-vmware-Move-common-macros-to-vmware-h/20240507-055606
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240506215305.30756-4-alexey.makhalov%40broadcom.com
patch subject: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
config: x86_64-buildonly-randconfig-003-20240510 (https://download.01.org/0day-ci/archive/20240510/202405101333.vdlWwpgr-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101333.vdlWwpgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101333.vdlWwpgr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_close_channel':
>> vmwgfx_msg.c:(.text+0xaf): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_port_hb_in':
   vmwgfx_msg.c:(.text+0x2c4): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_port_hb_out':
   vmwgfx_msg.c:(.text+0x604): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_send_msg':
   vmwgfx_msg.c:(.text+0x8b0): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_open_channel.constprop.0':
   vmwgfx_msg.c:(.text+0x9e8): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o:vmwgfx_msg.c:(.text+0xc3c): more undefined references to `vmware_hypercall_mode' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

