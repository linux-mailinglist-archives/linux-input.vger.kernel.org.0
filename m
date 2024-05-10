Return-Path: <linux-input+bounces-3661-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7DB8C1F00
	for <lists+linux-input@lfdr.de>; Fri, 10 May 2024 09:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7E632829D4
	for <lists+linux-input@lfdr.de>; Fri, 10 May 2024 07:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B10015ECDF;
	Fri, 10 May 2024 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edgCFKau"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5681311B9;
	Fri, 10 May 2024 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715326380; cv=none; b=WrCZE10nZhqLIPTefOo9U0zU2WYbskAaVL+CU7h/KtL3dVj4s/2iraZS97c7Ht3TJfKVLmlkSCi2nU2ikHGzeJIwK2BRzc+PJq+Add+ni2njbRv8AaODmRoxrCb7TQUhHmdkLqwZAuuaeYtLaxM6UCGJApDL7IPki1eF00ddzHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715326380; c=relaxed/simple;
	bh=ByEC9kiMaabF3vVkEOp8v75OMBj+coHKSUUUS2mNNEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+/O89H9F9Ry9HlNUrNjYwMFOehPCeRSjywsDWC+sxTU7xv8I6xZ5zlvrW5hIyCTwt9nMjFDGB4UOA4qTEHuOP1pcZLDD4yILpIH2ghchJ4N+KrmSKiPquj6sDitZfX32QyomtR9ROYPBEHNS1FQVG0YT8K1uTxgOF/+1g0X1xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edgCFKau; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715326378; x=1746862378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ByEC9kiMaabF3vVkEOp8v75OMBj+coHKSUUUS2mNNEA=;
  b=edgCFKauxBiN6Fvb2QgyEqZvaoVcoCK8xIhGWzVcxo8kEf+LLmO68tPN
   sT7dI9zDb443eoYEzJsE5S9kHr+ot9jNJX14n+JhcGTUEqjNEOBFUYOdh
   udJZ1R9IaGP709RSeUSgeA8pWiRlquVRGR+5ZpBuiDU//zPoJHk2PIa4n
   1qCfxztafrEva7MtdmIZF4DSfiL6IaNcOlwG90+MU8a3mmfM83PKjjK5P
   yMbeQ4wtQqz54ZsnAR98IDGGootS036hVf+Ph3J+G8gb1m+GlAU+/UI5+
   gXGoaFGDMkB+TVr6Pvkq/uDbIpwp2zB3kRo1T/ivB2OGDN1YBnkh2weOo
   w==;
X-CSE-ConnectionGUID: iNgg0imQSbCJeGBncwQCyw==
X-CSE-MsgGUID: Al4nNiqbTF61MpUASuzhBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="14245272"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="14245272"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 00:32:58 -0700
X-CSE-ConnectionGUID: ybRwEvJsRIG5YlmeO+pHBg==
X-CSE-MsgGUID: mvMVWbM1Qkmt1ZMeJojlcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="29589840"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 May 2024 00:32:51 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5KkK-0005qp-2s;
	Fri, 10 May 2024 07:32:48 +0000
Date: Fri, 10 May 2024 15:31:51 +0800
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
	Nadav Amit <nadav.amit@gmail.com>,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH v9 6/8] drm/vmwgfx: Use VMware hypercall API
Message-ID: <202405101512.NJRbYcaH-lkp@intel.com>
References: <20240506215305.30756-7-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506215305.30756-7-alexey.makhalov@broadcom.com>

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
patch link:    https://lore.kernel.org/r/20240506215305.30756-7-alexey.makhalov%40broadcom.com
patch subject: [PATCH v9 6/8] drm/vmwgfx: Use VMware hypercall API
config: x86_64-buildonly-randconfig-003-20240510 (https://download.01.org/0day-ci/archive/20240510/202405101512.NJRbYcaH-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101512.NJRbYcaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101512.NJRbYcaH-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_port_hb_out':
   vmwgfx_msg.c:(.text+0x182): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_send_msg':
   vmwgfx_msg.c:(.text+0x46d): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_recv_msg':
   vmwgfx_msg.c:(.text+0x6f4): undefined reference to `vmware_hypercall_mode'
>> ld: vmwgfx_msg.c:(.text+0x875): undefined reference to `vmware_hypercall_mode'
   ld: vmwgfx_msg.c:(.text+0xae0): undefined reference to `vmware_hypercall_mode'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o:vmwgfx_msg.c:(.text+0x136e): more undefined references to `vmware_hypercall_mode' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

