Return-Path: <linux-input+bounces-8471-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA17B9EA029
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 21:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14872282A3A
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 20:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B66B1957FC;
	Mon,  9 Dec 2024 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMKRbR6N"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D41547E2;
	Mon,  9 Dec 2024 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733775608; cv=none; b=SCJ05cHV1z8i9vbU0QnCMpfLlALSZUSE1n0FvkqEq90rsdTWz6BrBk48WOnv6i1+wKrSC2J/MSLgAf8bTZ7Fsn3Cf3gTjt+iV1aOkw04RHff+APi8/hEQeD+dLLSAv9WHk8NM0w6t2n36/YEuTLT0GDOF2dR2Akd0vseO8U7hmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733775608; c=relaxed/simple;
	bh=GJDYzecw9+kg0f2BbCimIJg24vXPiI1qTudUw3MYAX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxiRV5/lzuS7mV+26BNQ69ENrJz6v7DoQHSpNBwhZUhgrN+AdvWXSBD87JkxRv740W2HqvSRdh3UZyULowQx6iP2gK65dQgZmrDP0aHsakxJp4fRISjVOqb2LPP19LKLMU6T1tY+8ZLK+ihbwhUAZnSvTxJHuPRdNQgQXvpPuM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMKRbR6N; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733775606; x=1765311606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GJDYzecw9+kg0f2BbCimIJg24vXPiI1qTudUw3MYAX0=;
  b=ZMKRbR6Nn7/1DAub9UKldSltYN5+U6xU2kJJPyja2G9Gc+nGoux7KHXh
   lTjrfw5Uqag6Sw6E7wuljvLmncWBU5fPEbIuL3Z1/EZbvev3CmFWEF5hd
   FHlVjtj+rO/M8PNKn75N0UK4Rlb0c93n1Ckr8O1pBkK9tYgPJXtsFAVKE
   io6p1sqOF++EGubdctr3i1ppXS0bvCMPrXWqWlf3clXnguRRCkLFIVjgg
   TEG7ygIkK/t6UL2GDABDw6S92z8dOoDLGW2/zDNiTKxgqWlYYiC8r/En1
   HAPGK7CvO6xQlvXjzjKfbGhJqUmUHo2EEwBLNcAFNz8G9EYr4nLIEX6de
   A==;
X-CSE-ConnectionGUID: LH3BZVvpR9eOPtg83qO5kg==
X-CSE-MsgGUID: WFBnkUXUTzmwpMzEfYZaCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34219135"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34219135"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 12:20:05 -0800
X-CSE-ConnectionGUID: JctBITyFRKix385v2WUzBQ==
X-CSE-MsgGUID: ueSQwyrZS6mbHdLASr1aBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95665180"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Dec 2024 12:20:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKkEb-0004mn-0K;
	Mon, 09 Dec 2024 20:20:01 +0000
Date: Tue, 10 Dec 2024 04:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, dmitry.torokhov@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Frank.Li@nxp.com,
	ping.bai@nxp.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH V3] Input: bbnsm_pwrkey - add remove hook
Message-ID: <202412100332.9Mo5ZFrm-lkp@intel.com>
References: <20241209075733.2504229-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209075733.2504229-1-peng.fan@oss.nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on linus/master v6.13-rc2 next-20241209]
[cannot apply to dtor-input/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/Input-bbnsm_pwrkey-add-remove-hook/20241209-160051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20241209075733.2504229-1-peng.fan%40oss.nxp.com
patch subject: [PATCH V3] Input: bbnsm_pwrkey - add remove hook
config: i386-buildonly-randconfig-001-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100332.9Mo5ZFrm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100332.9Mo5ZFrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100332.9Mo5ZFrm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/misc/nxp-bbnsm-pwrkey.c:192:23: warning: unused variable 'bbnsm' [-Wunused-variable]
     192 |         struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
         |                              ^~~~~
   1 warning generated.


vim +/bbnsm +192 drivers/input/misc/nxp-bbnsm-pwrkey.c

   189	
   190	static void bbnsm_pwrkey_remove(struct platform_device *pdev)
   191	{
 > 192		struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
   193	
   194		dev_pm_clear_wake_irq(&pdev->dev);
   195		device_init_wakeup(&pdev->dev, false);
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

