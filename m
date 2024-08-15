Return-Path: <linux-input+bounces-5585-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E99952975
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 08:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3CA71C2132C
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 06:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDAD17839E;
	Thu, 15 Aug 2024 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1uHLVhP"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5F217838B;
	Thu, 15 Aug 2024 06:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723704186; cv=none; b=Zq0qzCHHDCAJUGGLedfrUQgN642fxhneG9xcsuBbw+MrSbC5tqX+uvHEuGuQIeKopKAv2EPZ0sZ4ZmFG7FU+Kkvc1qwZoI9KLjj2N3xzBfT/CEAZJWAsKBYJ6//2QU3AWVDWWJVi0CYmyo/BdTBJYl3IYiec69oZesc+HJcvWr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723704186; c=relaxed/simple;
	bh=De6ufLUUbAcupdgUSV2L57kA0XgGwsFzk69O/adjvrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t42+3UcieG6iu5ubLmk5wn6LrbiEQnsBx+QsqJ+3LAs2w40PPjvVLIwop/AnzMJUx+bPhrQ2Y6TxCixwiBLTDDgPO/C6z+OCg+f12GzN/JuBHLKdEesm0FO7uTgjFFOdP2/H4HEZTnFYR6/BrlXiigGzRjxRzPkMgFXQZZAcWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1uHLVhP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723704184; x=1755240184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=De6ufLUUbAcupdgUSV2L57kA0XgGwsFzk69O/adjvrQ=;
  b=Q1uHLVhPWn/YBvXLU604c9e+GxnwnL/mRkZJOqCJOaZtQ+V94hbaICCv
   ZlcHQAWL0j6PVEDDzjJ0yxs5m02oRVSihZjJzNsbnM9iRdIq2LiJa03Sg
   XO8B2BTWNarN8XtblPRHyeMaJnf7HqyLPBav2zJ6INRJwJvwBcuUUz0Ry
   7noFGHn2oZMhSZTskQ5paSV8aROP3cVPcn7TVSN4OV3MjnVDHyafddKVh
   +1cNTKQte21RZQnIWADKR5vGldDC770xAbcG7qY5m+F+XyKXAvSjUsJGF
   XwtW8m4O1SYPEnG16QfGmCXPX0TrncoLLj05O96g+ugN2vIFUP0w/qqLc
   w==;
X-CSE-ConnectionGUID: n3IBcxdFSYSVTt/ZR6XxSQ==
X-CSE-MsgGUID: PFJLNTfeQiiMQBwxvHR3xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33101020"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="33101020"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 23:43:03 -0700
X-CSE-ConnectionGUID: WUsSQfdwTbGQsXf9amGWqA==
X-CSE-MsgGUID: G9zCeTYJR2S7IrwdMu/TUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="64101664"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2024 23:42:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seUCH-0003Hg-1t;
	Thu, 15 Aug 2024 06:42:57 +0000
Date: Thu, 15 Aug 2024 14:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert ads7846.txt
 to yaml
Message-ID: <202408151407.QolOybOy-lkp@intel.com>
References: <20240814185140.4033029-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814185140.4033029-1-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next krzk-dt/for-next linus/master v6.11-rc3 next-20240815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-input-touchscreen-convert-ads7846-txt-to-yaml/20240815-025322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20240814185140.4033029-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
reproduce: (https://download.01.org/0day-ci/archive/20240815/202408151407.QolOybOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151407.QolOybOy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

