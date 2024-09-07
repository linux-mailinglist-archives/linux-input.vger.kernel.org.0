Return-Path: <linux-input+bounces-6290-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A9596FFE1
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 05:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707571F23093
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 03:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E8739FC1;
	Sat,  7 Sep 2024 03:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWiTEwcr"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231EE1B85DC;
	Sat,  7 Sep 2024 03:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725680478; cv=none; b=jrrQw+/g9cqWrcrEoVnBUR0OFueZUYUDG4Fcw+9YHU1sVQpszePn7aPEeQThgNpZ1ebVNxF4kMpdW/5pHH+rBPVfByHdLXndYAtn3JG3hq8JCHSVx/2aaZdDHTb+ym8lJk/epuKLauzIS4yn7CL8XfTlWUGRUF+fAzx48mtuok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725680478; c=relaxed/simple;
	bh=0LSYRiNjmglzvSSKKJd8bsXrxePN9geo+SOIsVqs/EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKXnInKRg1dYDF8lnIr8XQk/QefRRxttGeifPu+KkkmAkNMNtvdcjG7jnXG+Ffgaek88r20n3e+Q0rPV3DIqTmbcXCzJjq1VQ97qR6+mKKkph6KSbtLII5mz26uLM3GMkqbbHiDpva8dMEsj6wiWSdAgZtpV6HUCZenPH3iKwjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWiTEwcr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725680477; x=1757216477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0LSYRiNjmglzvSSKKJd8bsXrxePN9geo+SOIsVqs/EM=;
  b=OWiTEwcr06jlVUHSl5uLs5mDBsUU7+T4jibGEPVR+uVr58KtMXOW0xOK
   mtRc/983nWvI0MbMWObxgopSvcLs4SSzKFHflnqr/mhWVDDrDfNPAcH6i
   EGOU78AHd5XXzAb3RhkTK0fAH5s7NQNGVMjSURpW4cmLwhgUlmC8Cp1ho
   vzLFjWJIrQPkaMYAjrMP2Cp1PxT8CUJ5nF8gMWeW4At2dNaPsuf/m+5MI
   PbVqvvmwhiGjQKzkxM8W/w+niuFSNIltpSaKD8oTyyWuMDpKapX0rd9er
   PYeSMD5FDL2LywBmOea/sEvKdAl7vyyY5W55rz6meKl1xuK4tB0Jxc0yY
   w==;
X-CSE-ConnectionGUID: BCCRnhrhRNeqZOUPBcU1xw==
X-CSE-MsgGUID: CgA0i0ciQf29WfRJ2iwtig==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13418138"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="13418138"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 20:41:16 -0700
X-CSE-ConnectionGUID: XnhtZTm7SQyMqKvtjyblEA==
X-CSE-MsgGUID: X8TlA47bShm85sIffjCqmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="70717146"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Sep 2024 20:41:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smmJz-000C67-1v;
	Sat, 07 Sep 2024 03:41:11 +0000
Date: Sat, 7 Sep 2024 11:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/22] Input: regulator-haptic - use guard notation when
 acquiring mutex
Message-ID: <202409071004.IhekZKbM-lkp@intel.com>
References: <20240904044922.1049488-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904044922.1049488-1-dmitry.torokhov@gmail.com>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus hid/for-next linus/master v6.11-rc6 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Torokhov/Input-ad714x-use-guard-notation-when-acquiring-mutex/20240905-085752
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20240904044922.1049488-1-dmitry.torokhov%40gmail.com
patch subject: [PATCH 20/22] Input: regulator-haptic - use guard notation when acquiring mutex
config: x86_64-buildonly-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071004.IhekZKbM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071004.IhekZKbM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071004.IhekZKbM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/misc/regulator-haptic.c: In function 'regulator_haptic_suspend':
>> drivers/input/misc/regulator-haptic.c:206:13: warning: unused variable 'error' [-Wunused-variable]
     206 |         int error;
         |             ^~~~~


vim +/error +206 drivers/input/misc/regulator-haptic.c

d64cb71bede87d Jaewon Kim       2014-12-17  201  
1a3e6c1ee47d00 Jonathan Cameron 2023-01-02  202  static int regulator_haptic_suspend(struct device *dev)
d64cb71bede87d Jaewon Kim       2014-12-17  203  {
d64cb71bede87d Jaewon Kim       2014-12-17  204  	struct platform_device *pdev = to_platform_device(dev);
d64cb71bede87d Jaewon Kim       2014-12-17  205  	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
d64cb71bede87d Jaewon Kim       2014-12-17 @206  	int error;
d64cb71bede87d Jaewon Kim       2014-12-17  207  
aaa0758ff6b5c4 Dmitry Torokhov  2024-09-03  208  	scoped_guard(mutex_intr, &haptic->mutex) {
d64cb71bede87d Jaewon Kim       2014-12-17  209  		regulator_haptic_set_voltage(haptic, 0);
d64cb71bede87d Jaewon Kim       2014-12-17  210  		haptic->suspended = true;
d64cb71bede87d Jaewon Kim       2014-12-17  211  
d64cb71bede87d Jaewon Kim       2014-12-17  212  		return 0;
d64cb71bede87d Jaewon Kim       2014-12-17  213  	}
d64cb71bede87d Jaewon Kim       2014-12-17  214  
aaa0758ff6b5c4 Dmitry Torokhov  2024-09-03  215  	return -EINTR;
aaa0758ff6b5c4 Dmitry Torokhov  2024-09-03  216  }
aaa0758ff6b5c4 Dmitry Torokhov  2024-09-03  217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

