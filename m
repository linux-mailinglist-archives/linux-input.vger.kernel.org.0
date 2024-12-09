Return-Path: <linux-input+bounces-8440-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC9C9E89C3
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 04:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C851883B2A
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 03:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4425156F39;
	Mon,  9 Dec 2024 03:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvmN56GG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B010D156C5E;
	Mon,  9 Dec 2024 03:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733715606; cv=none; b=anluXVNYyPqv9bnv22AnLjOkYq3cng04StNn4Khr9i/23DdGytaEg1HaISivDK7Oe98+arE+xjIhOg71V1UNueANPAhvAsRyLjuHvkeTJlsNP1s1/6E+nD4vvfOQ2UQvaHKMPysWAuDr3rCXI0GtWUhi+BQJceLPH9+TbQfHeIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733715606; c=relaxed/simple;
	bh=O5wj9X04xILpIYZfDjYm3tMbeAznkw3hHoShD/CJqSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tiWI73YmlFWIFejzLcP4GGAWZ8z7s6C21z8HeqPRuKl85DCYyUSI95g7SWIHxC7zSMcrvUqaaTLqhKToR4bWT+WZIJXjXC0PVunRUQLYZqevvzFFVmgZ2EqOLuyIg2Y3D9Du6j+DZhxAeZs4EQ85JPsjyJZHRxtkNnX63DmN6yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvmN56GG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733715605; x=1765251605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O5wj9X04xILpIYZfDjYm3tMbeAznkw3hHoShD/CJqSw=;
  b=fvmN56GGE9DsH2+eXw0xgIStj5AUPLnLUDUij0k+8jlEbH3wf/rqTaX8
   bdT1olMlp7NjfEBNiFBqGlYkOgp7YCdfRrj8G48mMBuR803Wv0RfXGk/8
   MIJn2ZGos5Vt91M17j83bGkuL/+EzDK23mVYG1f5Bbx9th15/F16RT5RP
   268J4U4G2qb0JdLZxdzajsYTsMQzQgEuts1YyS94b1CAtk3F5Q8e/YnpC
   HkzpXvR1vpreViQQAn4BRZkHt60JeVN8FWcZInPogWtj/ftkc1g2U/ZOQ
   KEUUzjoA8UrsPzb3JEuvgMNv6iV6WWHwBNnBzh/navunR4V0Ry78XVcGD
   A==;
X-CSE-ConnectionGUID: U26HIdBsTu6Vg/JRxwxB5g==
X-CSE-MsgGUID: dq29DvG+Swe/3VP90nFYfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45010040"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45010040"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:40:05 -0800
X-CSE-ConnectionGUID: 9jOl30N2SmCT5dHOtGBebw==
X-CSE-MsgGUID: y6vwFSgzSAiDdBQGSj52ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99393151"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2024 19:40:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUcp-0003k5-02;
	Mon, 09 Dec 2024 03:39:59 +0000
Date: Mon, 9 Dec 2024 11:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roy Im <roy.im.opensource@diasemi.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: input: convert dlg,da7280.txt to
 dt-schema
Message-ID: <202412070625.zZpw80SM-lkp@intel.com>
References: <20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org>

Hi Neil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c245a7a79602ccbee780c004c1e4abcda66aec32]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/dt-bindings-input-convert-dlg-da7280-txt-to-dt-schema/20241206-180220
base:   c245a7a79602ccbee780c004c1e4abcda66aec32
patch link:    https://lore.kernel.org/r/20241206-topic-misc-da7280-convert-v2-1-1c3539f75604%40linaro.org
patch subject: [PATCH v2] dt-bindings: input: convert dlg,da7280.txt to dt-schema
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070625.zZpw80SM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070625.zZpw80SM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/dlg,da72??.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

