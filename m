Return-Path: <linux-input+bounces-4375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC29F90A0BA
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 01:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41257281C5E
	for <lists+linux-input@lfdr.de>; Sun, 16 Jun 2024 23:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB777345D;
	Sun, 16 Jun 2024 23:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RN8CBFaR"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACCF7344E;
	Sun, 16 Jun 2024 23:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579463; cv=none; b=kitfqkrEamcew49FRFS4FjWg0FrUeDP5DJ9hmlzPzgWTFkcuRBVQUGOSnHzCTgcE53HRzhF+jJFsh45E0REGNxndVJTTnaEQxCmVurJXdWCo1cux7WQchIMTvpyRt6SwZzvbpWWpBJ9ftcRssn5P8+Ioxfv2wNRX/LY+Bb1ybVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579463; c=relaxed/simple;
	bh=kiJ5EIGClrXHrM1eGznIeYjyxqgXT0POFZivmUkpMXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9FxQPuRKD7pY9ETeBlKMiFIEY7+iyaiv4e4HB3LNNUcYD9M1k/YSV9RukVox8ricHDvJaNHWL/rMQWU0/PgZqynO0B1XNIiG+LTYpUCOWfM8aSQXY/JqZWFeXsdSpz6cyxYM0PM3LCvSDL7+fWXAQd1Ce0hom3uuSVbDmiXHC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RN8CBFaR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718579462; x=1750115462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kiJ5EIGClrXHrM1eGznIeYjyxqgXT0POFZivmUkpMXA=;
  b=RN8CBFaR2WF1UVM8IsNk8n2TMuUhHivNWICZYossXaQlY4hFmrIgzE0G
   U7L+GBFhurQd0QmGHrRfjdxxrJMAUks8IURqQGQo+DV8YyEVqYUn91LYr
   4gcOaLxSGC1MAOyW3I/bsJGzi4jewwG5KotM+8X2IGZ7PeLSKYj3IZwtO
   tFx4G3IArfA9ZmSy7f22DtBntksQnYArh1JuDwCzZ/MyRU0jmK7VVuDVI
   0pYobfCIZ2HAWhp89A3tqg3zs9Nd/tJAkpRtlKoCTJInyAfXY0Vh03nyn
   ybDniWmlhoHq/a4/lf+KCfdIWY/wWW03FtPjXKy15I4pLFKl0sbPRcX/7
   A==;
X-CSE-ConnectionGUID: ie3fQNYuTSucR3Q2C+78TA==
X-CSE-MsgGUID: G4+XX48JQo2joPLu7WxOVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26794709"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26794709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 16:11:01 -0700
X-CSE-ConnectionGUID: oXTleuhGQOaPOFVzz3WhRw==
X-CSE-MsgGUID: rEslq/9nRjmd64uvoExcXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="41747756"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jun 2024 16:10:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIz1T-0003SX-0v;
	Sun, 16 Jun 2024 23:10:55 +0000
Date: Mon, 17 Jun 2024 07:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com,
	dan.carpenter@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dianders@chromium.org, robh@kernel.org,
	krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
	hbarnor@chromium.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: Re: [PATCH v4 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <202406170607.MJX7Ze54-lkp@intel.com>
References: <20240614121538.236727-2-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614121538.236727-2-charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on dtor-input/next dtor-input/for-linus robh/for-next linus/master v6.10-rc4 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240614-201949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240614121538.236727-2-charles.goodix%40gmail.com
patch subject: [PATCH v4 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
config: i386-randconfig-r122-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170607.MJX7Ze54-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170607.MJX7Ze54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170607.MJX7Ze54-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-goodix-spi.c:771:1: sparse: sparse: symbol 'goodix_spi_pm_ops' was not declared. Should it be static?

vim +/goodix_spi_pm_ops +771 drivers/hid/hid-goodix-spi.c

   770	
 > 771	EXPORT_GPL_SIMPLE_DEV_PM_OPS(goodix_spi_pm_ops,
   772				     goodix_spi_suspend, goodix_spi_resume);
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

