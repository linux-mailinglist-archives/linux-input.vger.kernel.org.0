Return-Path: <linux-input+bounces-3999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE978D6E01
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 07:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C58E1C20DF6
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 05:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D6F6FBE;
	Sat,  1 Jun 2024 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHARu/ux"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9DDF9CC;
	Sat,  1 Jun 2024 05:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717219151; cv=none; b=faLXnXod620iMA+sl/3uXprKZrpvTZHwFugXLJ9L+JcOSzoPGkKKXQAdw+bcvPMvdKQ3QZf2N40xgBXLeL1FSMpV8ia+F++Ic1VhgviLgjwF2XCIf8ReZRnnhHWI4wmRyKzzuaNKcL0Kl1y/YEfhIa4BI411peUxhfTGDaVNTwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717219151; c=relaxed/simple;
	bh=RmGTeDB7gSE6+bdtPqnjC5zB/xCa0YNAJAARczN2gPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7RJ18oLj8YC02MDLGkvjkXmkaSOmoAIqLk3FfG2CQZRsBOxL2TbxpMG6OPSgfCrOTc32wwpkwd1GyWXeHdt6byQkK8eiy4dYCHglaCps2ciB0gXxmTPPjgEwaVw4J5layF9gYdql0GCutN7DLrP4D9VF/fjDGhqyN0HnJOgc4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHARu/ux; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717219150; x=1748755150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RmGTeDB7gSE6+bdtPqnjC5zB/xCa0YNAJAARczN2gPQ=;
  b=lHARu/uxiXlGxDzmUTL0FxqMSm2lWHUvArIL4V4UO7U67tF7AsNHcjeA
   1TuzUs33WPF7g8wd+4KD/gZs0nVNrtp0mR/JqYrSICCa1etN00Wj0AfY8
   lrPVgRO/142LKTsPN+S2M5ohHTc5rhRDMNaQB6EFRU9/2zzBioqoYzo2f
   mEgwI7aQ0oVuihRYC0cX3lw3B89KX6d1cGFAMy4AcNUdn8BUbR1gzPthJ
   048NHstYU54k2oh/WPM3oz3GEBk2hKv94WEDnVI8YZSnXqz9IC81260y8
   3dQouE3u42vVRUM5zEKH0LQGjs5mmp+vLJRJjgRMu0vbhZZRC2ngebaMK
   g==;
X-CSE-ConnectionGUID: wUAcFYv2S7eyrVDFMc0ssw==
X-CSE-MsgGUID: mB2qqDhNQq2CavBFpd+xBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24894527"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="24894527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 22:19:10 -0700
X-CSE-ConnectionGUID: EG35p8h0R6O2sKJanIuclA==
X-CSE-MsgGUID: JzwWgfBrTlqUJNu/d0aJfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="36447216"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 31 May 2024 22:19:06 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDH8y-000IQn-0l;
	Sat, 01 Jun 2024 05:19:04 +0000
Date: Sat, 1 Jun 2024 13:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Zhang Lixu <lixu.zhang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] HID: intel-ish-hid: fix endian-conversion
Message-ID: <202406011319.hk4MAysc-lkp@intel.com>
References: <20240531162836.157891-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531162836.157891-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on next-20240531]
[cannot apply to linus/master v6.10-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/HID-intel-ish-hid-fix-endian-conversion/20240601-003303
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240531162836.157891-1-arnd%40kernel.org
patch subject: [PATCH] [v2] HID: intel-ish-hid: fix endian-conversion
config: x86_64-buildonly-randconfig-002-20240601 (https://download.01.org/0day-ci/archive/20240601/202406011319.hk4MAysc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011319.hk4MAysc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011319.hk4MAysc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/intel-ish-hid/ishtp/loader.c:170: warning: Function parameter or struct member 'fragment_count' not described in 'prepare_dma_bufs'


vim +170 drivers/hid/intel-ish-hid/ishtp/loader.c

579a267e4617d7 Zhang Lixu    2024-05-06  155  
579a267e4617d7 Zhang Lixu    2024-05-06  156  /**
579a267e4617d7 Zhang Lixu    2024-05-06  157   * prepare_dma_bufs() - Prepare the DMA buffer for transferring firmware fragments
579a267e4617d7 Zhang Lixu    2024-05-06  158   * @dev: The ISHTP device
579a267e4617d7 Zhang Lixu    2024-05-06  159   * @ish_fw: The ISH firmware
579a267e4617d7 Zhang Lixu    2024-05-06  160   * @fragment: The ISHTP firmware fragment descriptor
579a267e4617d7 Zhang Lixu    2024-05-06  161   * @dma_bufs: The array of DMA fragment buffers
579a267e4617d7 Zhang Lixu    2024-05-06  162   * @fragment_size: The size of a single DMA fragment
579a267e4617d7 Zhang Lixu    2024-05-06  163   *
579a267e4617d7 Zhang Lixu    2024-05-06  164   * Return: 0 on success, negative error code on failure
579a267e4617d7 Zhang Lixu    2024-05-06  165   */
579a267e4617d7 Zhang Lixu    2024-05-06  166  static int prepare_dma_bufs(struct ishtp_device *dev,
579a267e4617d7 Zhang Lixu    2024-05-06  167  			    const struct firmware *ish_fw,
579a267e4617d7 Zhang Lixu    2024-05-06  168  			    struct loader_xfer_dma_fragment *fragment,
5180be24abbcc0 Arnd Bergmann 2024-05-31  169  			    void **dma_bufs, u32 fragment_size, u32 fragment_count)
579a267e4617d7 Zhang Lixu    2024-05-06 @170  {
2360497238261f Zhang Lixu    2024-05-23  171  	dma_addr_t dma_addr;
579a267e4617d7 Zhang Lixu    2024-05-06  172  	u32 offset = 0;
5180be24abbcc0 Arnd Bergmann 2024-05-31  173  	u32 length;
579a267e4617d7 Zhang Lixu    2024-05-06  174  	int i;
579a267e4617d7 Zhang Lixu    2024-05-06  175  
5180be24abbcc0 Arnd Bergmann 2024-05-31  176  	for (i = 0; i < fragment_count && offset < ish_fw->size; i++) {
2360497238261f Zhang Lixu    2024-05-23  177  		dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size, &dma_addr, GFP_KERNEL);
579a267e4617d7 Zhang Lixu    2024-05-06  178  		if (!dma_bufs[i])
579a267e4617d7 Zhang Lixu    2024-05-06  179  			return -ENOMEM;
579a267e4617d7 Zhang Lixu    2024-05-06  180  
2360497238261f Zhang Lixu    2024-05-23  181  		fragment->fragment_tbl[i].ddr_adrs = cpu_to_le64(dma_addr);
5180be24abbcc0 Arnd Bergmann 2024-05-31  182  		length = clamp(ish_fw->size - offset, 0, fragment_size);
5180be24abbcc0 Arnd Bergmann 2024-05-31  183  		fragment->fragment_tbl[i].length = cpu_to_le32(length);
5180be24abbcc0 Arnd Bergmann 2024-05-31  184  		fragment->fragment_tbl[i].fw_off = cpu_to_le32(offset);
5180be24abbcc0 Arnd Bergmann 2024-05-31  185  		memcpy(dma_bufs[i], ish_fw->data + offset, length);
579a267e4617d7 Zhang Lixu    2024-05-06  186  		clflush_cache_range(dma_bufs[i], fragment_size);
579a267e4617d7 Zhang Lixu    2024-05-06  187  
5180be24abbcc0 Arnd Bergmann 2024-05-31  188  		offset += length;
579a267e4617d7 Zhang Lixu    2024-05-06  189  	}
579a267e4617d7 Zhang Lixu    2024-05-06  190  
579a267e4617d7 Zhang Lixu    2024-05-06  191  	return 0;
579a267e4617d7 Zhang Lixu    2024-05-06  192  }
579a267e4617d7 Zhang Lixu    2024-05-06  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

