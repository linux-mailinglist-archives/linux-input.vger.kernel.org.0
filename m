Return-Path: <linux-input+bounces-4327-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF6905B67
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 20:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15444B28A0B
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 18:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9776D3F9D9;
	Wed, 12 Jun 2024 18:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbVw++sh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42627FB;
	Wed, 12 Jun 2024 18:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217914; cv=none; b=BfxViW79TfuhJ7+JpY7SFZ/MjF7n7SzhLJKmcdGTfmaeHI3Eb3laS3E+pqaJnucghO5eVUFc1DtdEMyGkuQGGcnW2b3FhWlH7V4xgTvURN1dPqmmM1U+xszbqmqYP6gdC2eUoUrKXu1NJBrHC9aUX0Kr/x6Fwa5G3Gj97bYiu+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217914; c=relaxed/simple;
	bh=XwaC2sMvqlChtzdhaOcsngo4tLTQfibpe6co8NUeT9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUpMqAMbhTBLR21+5VhoJsEU/Xm9NL+pG8hH3kUxfVedpg2B+nBXV0FMUXdXaMOwgWnxDQUxVHSU0fH9LsZofyvc5DGs6lqyISyI6d2aCqTkeXSBFU8l8vOmTL5cCgGB/BmndoKs06nx95BUB+wbmhkilsN9dNwE00OXBhvAmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbVw++sh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718217912; x=1749753912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XwaC2sMvqlChtzdhaOcsngo4tLTQfibpe6co8NUeT9Y=;
  b=nbVw++shD7o3KTtzKzAlsmKTXXFyehDDYHzg5uK0QfJbkRa2uEvvWnuR
   GAM6Emef/QRTbTccdZymgJc0iyMpN5bMWCrrEXjb7uH0HHtRuwiWjMUzJ
   AOIt5VyMk7vhzRAemad9YlJHg2X6HlcwbaM6/R7QzFkjEowRuYqMcGOn9
   D0lkkp7cQfOXVQA+CEJsHqXvvD+KsKjFOIFOnXxujvNO+JKqsLWZPPBNF
   v8EU42DZT48yWfD1THVlGsfOwHGyuHdQuH6Jkdu5wRMeBg0Mo4y0p1ajw
   BqC4ezjTU2SbVPyHz77pPGU1YoKeZdHMw7AoJclCmq2Q6Mksmvk0D/uES
   g==;
X-CSE-ConnectionGUID: 6cUmCSChT4GDjyEHTqzVVw==
X-CSE-MsgGUID: Rzs4suJ4T5yIXlBeTIKGMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26422775"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="26422775"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:45:12 -0700
X-CSE-ConnectionGUID: WT8uOIzsSXSL2VO9DIULLA==
X-CSE-MsgGUID: ruXB3rWDQYKmzCjAjTUNfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="39986248"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jun 2024 11:45:09 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHSy2-0001pW-2o;
	Wed, 12 Jun 2024 18:45:06 +0000
Date: Thu, 13 Jun 2024 02:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: Raymond Hackley <raymondhackley@protonmail.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Markuss Broks <markuss.broks@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] input/touchscreen: imagis: Add supports for Imagis
 IST3038
Message-ID: <202406130224.G2LpMsby-lkp@intel.com>
References: <20240612032036.33103-3-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612032036.33103-3-raymondhackley@protonmail.com>

Hi Raymond,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on robh/for-next linus/master v6.10-rc3 next-20240612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raymond-Hackley/input-touchscreen-imagis-Clarify-the-usage-of-protocol_b/20240612-112300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20240612032036.33103-3-raymondhackley%40protonmail.com
patch subject: [PATCH 2/3] input/touchscreen: imagis: Add supports for Imagis IST3038
config: x86_64-buildonly-randconfig-006-20240612 (https://download.01.org/0day-ci/archive/20240613/202406130224.G2LpMsby-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130224.G2LpMsby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130224.G2LpMsby-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/imagis.c:397:39: warning: unused variable 'imagis_3032c_data' [-Wunused-const-variable]
     397 | static const struct imagis_properties imagis_3032c_data = {
         |                                       ^~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/imagis.c:406:39: warning: unused variable 'imagis_3038_data' [-Wunused-const-variable]
     406 | static const struct imagis_properties imagis_3038_data = {
         |                                       ^~~~~~~~~~~~~~~~
   drivers/input/touchscreen/imagis.c:414:39: warning: unused variable 'imagis_3038b_data' [-Wunused-const-variable]
     414 | static const struct imagis_properties imagis_3038b_data = {
         |                                       ^~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/imagis.c:421:39: warning: unused variable 'imagis_3038c_data' [-Wunused-const-variable]
     421 | static const struct imagis_properties imagis_3038c_data = {
         |                                       ^~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +/imagis_3038_data +406 drivers/input/touchscreen/imagis.c

   405	
 > 406	static const struct imagis_properties imagis_3038_data = {
   407		.interrupt_msg_cmd = IST30XX_REG_STATUS,
   408		.touch_coord_cmd = IST30XX_REG_STATUS,
   409		.whoami_cmd = IST30XX_REG_CHIPID,
   410		.whoami_val = IST3038_WHOAMI,
   411		.touch_keys_supported = true,
   412	};
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

