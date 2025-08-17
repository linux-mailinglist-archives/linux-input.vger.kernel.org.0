Return-Path: <linux-input+bounces-14067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59006B2943A
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 18:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05C923B0D19
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 16:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13B22FE076;
	Sun, 17 Aug 2025 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crqAcGrm"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC4285075;
	Sun, 17 Aug 2025 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755448932; cv=none; b=INvk7+/FYzeOl9wb/YoG1YrzIL6eDD+X5vbEEbSLQWsEnUTr9ACmfETJAjb7mCcGGYSmtAUe98nG3+q0/r5eyp9l20CG5Ci1JqWV9InsOc+g80vm1UN01Xwr8hq98LsLZ3S0oNH+GOJHdyS1nRG3p6atUngwLzkLBnC1/ViLqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755448932; c=relaxed/simple;
	bh=QWgCoWJrR5NFT6aL6VO54bITTwUvigoqeC4mg4I/Gkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdnt3VQRO/Pd8XMGwvzBb398U+UJABEtJ6OLWjpTrp2ROpEPAmRvpnYTNZDm1zy16tUUkg4vrKXEzrIOG9yzzWk9JSU6USASDITrvgjvFARNymS6t6TXCXNaLvkmoJfBWZWRcrhL8eA77ofmhsfxmhKAam5ACex1fUihyagLwf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crqAcGrm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755448931; x=1786984931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QWgCoWJrR5NFT6aL6VO54bITTwUvigoqeC4mg4I/Gkw=;
  b=crqAcGrmLtf1WZln8qRKQYF0tBvLbV8RcT5WeGCtqzd0bioTMqLQt3W3
   3dfMpzqskBhBNjwkHkI71PNeCQs0DxCjnewOjWD3AHWCcy2wm/jtTpQR/
   IHDFzErFi4vbnGtRnsUb5HpZP6XbdsjuNq94G43A/pY1W4T8YJRX6tj5P
   wOCv6gxj/99R/N/lrcN2y+DwHPNFffFbTIH1nwiQGO/rpkIBgx2u23wrB
   oYIRFBtWS2I00TWnYi9TiPnytj5wIVVQLmE+2vc+b+NtrnzZGrjJEarhZ
   ICBjokpOvbbnDuAmXOPTLcfJlqiBJF/LnEzAKKtVnFh+HY3OZP7+Z4Dse
   w==;
X-CSE-ConnectionGUID: iAjk6t5BT7KJwlRW6MgxPg==
X-CSE-MsgGUID: niGKZhbDRlCKQ5+rcGaaBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="83115179"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="83115179"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 09:42:10 -0700
X-CSE-ConnectionGUID: 8ti7B3NmTNWk55AJh58HjQ==
X-CSE-MsgGUID: BrV/uw3YQgiYFDiHHedDgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="198401547"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Aug 2025 09:42:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ungSA-000DcJ-38;
	Sun, 17 Aug 2025 16:41:57 +0000
Date: Mon, 18 Aug 2025 00:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Kurz <akurz@blala.de>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexander Kurz <akurz@blala.de>
Subject: Re: [PATCH 6/6] Input: mc13783-pwrbutton: add OF support
Message-ID: <202508180010.aF8jhqrQ-lkp@intel.com>
References: <20250817102751.29709-7-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817102751.29709-7-akurz@blala.de>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes robh/for-next linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Kurz/Input-mc13783-pwrbutton-fix-irq-mixup/20250817-182649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250817102751.29709-7-akurz%40blala.de
patch subject: [PATCH 6/6] Input: mc13783-pwrbutton: add OF support
config: arm-randconfig-001-20250817 (https://download.01.org/0day-ci/archive/20250818/202508180010.aF8jhqrQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180010.aF8jhqrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180010.aF8jhqrQ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: mc13783_pwrbutton_probe+0x243 (section: .text.mc13783_pwrbutton_probe) -> mc13xxx_pwrbutton_probe_dt (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

