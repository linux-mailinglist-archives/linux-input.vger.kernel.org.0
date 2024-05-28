Return-Path: <linux-input+bounces-3916-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135418D26F5
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 23:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF2F283007
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 21:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEAD17B42D;
	Tue, 28 May 2024 21:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uipdfcm4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D5B224D1;
	Tue, 28 May 2024 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716931079; cv=none; b=UrGCOw2OGoIgpg4Kdu2VZsacGIqCrEDvS7+rRAhfT5JkFG5q5Q+C+7f8BzzmZ0qU2UBVw6+xZ1jU1MLhpxrfUVw6Zi08tzCgFPi97kFlTPtShuonMyh/7LDQq7GLr7dO699XkH3JW7vLd6FhRQav7RyqjNeZJV9RB15oDKIqtj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716931079; c=relaxed/simple;
	bh=df6P1xfVcWeYr0Prst7JHR/lRDenSZqOcvbQYQ8TnsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgMAYQBkjUFfwn5PPJp3b0aBLQOE911GGGRQnbpsW1YWY3CW5QUyHN3YPmq3CJOH089+vwRCCwavB76ukKkJ3CMIJlWa5YrUyvdBzWxV3lKYjcROimOoUBxH3OlUVXEf3/XjbELJKJGn1PAPp6s6lHoPhuElIazUA8wMsvzRhwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uipdfcm4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716931077; x=1748467077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=df6P1xfVcWeYr0Prst7JHR/lRDenSZqOcvbQYQ8TnsY=;
  b=Uipdfcm4a1vElnrAjN/KJJzM1laW0j9c+ZiN+KQHP44g+n2/+0A8/uOr
   rRBVgKA8aThU/0oIm1xHcaG12cciawjMoFVzXYHdS9I+P3o59BLJuU+tv
   hKiFA6IUUD9G8GqUKL/hsiAcH0HRdLA5qsqbyVmMAyS2LH3K2v5XMOw1b
   raYH1CWB0E3NfEYRW6B474L7p8pZZmj/UHtM8skNGL92mBpsLeXAGOqVP
   o19xr2dC2shZy/dR9gACj3J/S+4Nq1UYy7ABY9JI6d6LwQDDgG/3SqO3G
   KCYt6G8hBly5t37e87aCQ7iosGz8SyCHpc13URLyTDdge5Fy1/G96GBGX
   Q==;
X-CSE-ConnectionGUID: mwC8VMBXQu6DsDRXqOAqfA==
X-CSE-MsgGUID: 4bLoXLVUQDOBo2NWaeYgKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24433713"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="24433713"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 14:17:57 -0700
X-CSE-ConnectionGUID: 52dP+MQSTjGafcuMc8lliw==
X-CSE-MsgGUID: 9ajn04XiQ+KcTDxH1ciLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="40196234"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2024 14:17:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC4Cd-000Clf-1k;
	Tue, 28 May 2024 21:17:51 +0000
Date: Wed, 29 May 2024 05:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Zhang Lixu <lixu.zhang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
Message-ID: <202405290447.n14W21hZ-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240529/202405290447.n14W21hZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290447.n14W21hZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290447.n14W21hZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/intel-ish-hid/ishtp/loader.c:178:9: error: use of undeclared identifier 'dma'
     178 |                                                  &dma, GFP_KERNEL);
         |                                                   ^
   drivers/hid/intel-ish-hid/ishtp/loader.c:186:52: error: use of undeclared identifier 'dma'
     186 |                 fragment->fragment_tbl[i].ddr_adrs = cpu_to_le64(dma);
         |                                                                  ^
   include/linux/byteorder/generic.h:86:21: note: expanded from macro 'cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^
   2 errors generated.


vim +/dma +178 drivers/hid/intel-ish-hid/ishtp/loader.c

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

