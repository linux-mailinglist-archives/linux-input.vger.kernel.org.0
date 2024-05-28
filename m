Return-Path: <linux-input+bounces-3915-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96E8D26BF
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 23:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CACDDB23952
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 21:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB32017BB16;
	Tue, 28 May 2024 21:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8YJb+qj"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3203717B4F1;
	Tue, 28 May 2024 21:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716930462; cv=none; b=q1Lbcwr5ET2+cTbBauKayGrt7a4vCEQG0Re560IQxl0MvbmPGg2IBYpXDcs0vRKufK0s3n9j1aHvd2vxYxV6SnJ363nC2WCNQ0YlDo1nrBfRuFqOMK2Ky7npGilLnVdKKfil6FjpQiNF2yk504BoG1f/hfMhKNxpvS4IsERFzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716930462; c=relaxed/simple;
	bh=Y4gOOWyilWi1IqWRonAatEZd0PGLv4JQJ/gDqGNN/Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4dVmOusDRJs9lBmsVMR2j3x5N9IVxZjhxyWZmwLnwtf9HRpud+7IdOLwo4d1V9oE/Gt5k1Bew5vYgtzjy7qNjWkYJQAVbU9Jb/Ye1I/nh99Ws4QV5Aq92VIYRrcU+Me65CgOnjlxS5C4r537xU4d2NAsLtvFJzkrzTYoBxt6/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8YJb+qj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716930461; x=1748466461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y4gOOWyilWi1IqWRonAatEZd0PGLv4JQJ/gDqGNN/Eg=;
  b=L8YJb+qjEvDGuu2SDbwYVjDr6Kgsd9nSrDqscHEb1t2DTciiZdj+WXHf
   jCUGfzoYRaSUo0vSMWU+4IyH9M6Osd+U2A62Dv7/wV5GAZdijuIrAOCm5
   wt1Je43b772+3kyyOuX9ip1cJeyde9qJPLs0YLTqHohM+2tcPni5N6+O0
   yYqywVVMAxotHpckwRLpy2yPWl9vw/9CMl8T8YQ8B4QqWjfy1iKQJRIHc
   e/06S/rp3vH268l/5fX6mNQCK4+ckRmUsEvrDTxyFxqGBOn801WQtcWOy
   5/q/QiTiCHjJYmpgi4V2JPdWam1rje2egoK2+zJ9ttmxH/oItMIcu3xJX
   w==;
X-CSE-ConnectionGUID: +qg5gJTJRPSQLDvAJg+Phw==
X-CSE-MsgGUID: UWsx7/eOTrS+xQEIRiPREg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38690491"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="38690491"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 14:07:40 -0700
X-CSE-ConnectionGUID: NbNJR+pOSXCoWhLKc3u2eQ==
X-CSE-MsgGUID: WomeDv4NRsu0RthZMCbeJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="39643188"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2024 14:07:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC42h-000ClH-1j;
	Tue, 28 May 2024 21:07:35 +0000
Date: Wed, 29 May 2024 05:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Zhang Lixu <lixu.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
Message-ID: <202405290420.DtwUdg3b-lkp@intel.com>
References: <20240528115802.3122955-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528115802.3122955-2-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on next-20240528]
[cannot apply to linus/master v6.10-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/HID-intel-ish-hid-fix-endian-conversion/20240528-200100
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240528115802.3122955-2-arnd%40kernel.org
patch subject: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240529/202405290420.DtwUdg3b-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290420.DtwUdg3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290420.DtwUdg3b-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/intel-ish-hid/ishtp/loader.c: In function 'prepare_dma_bufs':
>> drivers/hid/intel-ish-hid/ishtp/loader.c:178:51: error: 'dma' undeclared (first use in this function); did you mean 'cma'?
     178 |                                                  &dma, GFP_KERNEL);
         |                                                   ^~~
         |                                                   cma
   drivers/hid/intel-ish-hid/ishtp/loader.c:178:51: note: each undeclared identifier is reported only once for each function it appears in


vim +178 drivers/hid/intel-ish-hid/ishtp/loader.c

   154	
   155	/**
   156	 * prepare_dma_bufs() - Prepare the DMA buffer for transferring firmware fragments
   157	 * @dev: The ISHTP device
   158	 * @ish_fw: The ISH firmware
   159	 * @fragment: The ISHTP firmware fragment descriptor
   160	 * @dma_bufs: The array of DMA fragment buffers
   161	 * @fragment_size: The size of a single DMA fragment
   162	 *
   163	 * Return: 0 on success, negative error code on failure
   164	 */
   165	static int prepare_dma_bufs(struct ishtp_device *dev,
   166				    const struct firmware *ish_fw,
   167				    struct loader_xfer_dma_fragment *fragment,
   168				    void **dma_bufs, u32 fragment_size, u32 fragment_count)
   169	{
   170		dma_addr_t dma_addr;
   171		u32 offset = 0;
   172		u32 length;
   173		int i;
   174	
   175		for (i = 0; i < fragment->fragment_cnt && offset < ish_fw->size; i++) {
   176			dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size, &dma_addr, GFP_KERNEL);
   177			dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size,
 > 178							 &dma, GFP_KERNEL);
   179			if (!dma_bufs[i])
   180				return -ENOMEM;
   181	
   182			fragment->fragment_tbl[i].ddr_adrs = cpu_to_le64(dma_addr);
   183	
   184			memcpy(dma_bufs[i], ish_fw->data + offset, le32_to_cpu(fragment->fragment_tbl[i].length));
   185			dma_wmb();
   186			fragment->fragment_tbl[i].ddr_adrs = cpu_to_le64(dma);
   187			length = clamp(ish_fw->size - offset, 0, fragment_size);
   188			fragment->fragment_tbl[i].length = cpu_to_le32(length);
   189			fragment->fragment_tbl[i].fw_off = cpu_to_le32(offset);
   190	
   191			offset += length;
   192		}
   193	
   194		return 0;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

